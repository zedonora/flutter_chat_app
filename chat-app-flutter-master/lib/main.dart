import 'package:chat_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  //HttpLink httpLink = HttpLink(uri: 'https://chapserver.herokuapp.com/');
  HttpLink httpLink = HttpLink(uri: 'http://localhost:3350/');

  Link link = httpLink;

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: InMemoryCache(), link: link),
  );

  runApp(App(auth: token != null, client: client));
}
