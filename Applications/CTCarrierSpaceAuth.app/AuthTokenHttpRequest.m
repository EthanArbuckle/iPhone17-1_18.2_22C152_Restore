@interface AuthTokenHttpRequest
+ (id)_urlRequestForBaseURL:(id)a3 params:(id)a4;
+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 authCode:(id)a5;
+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 secret:(id)a5 redirectURI:(id)a6 authCode:(id)a7;
@end

@implementation AuthTokenHttpRequest

+ (id)_urlRequestForBaseURL:(id)a3 params:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100001A40;
  v12[3] = &unk_10000C348;
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  [v7 sortUsingSelector:"caseInsensitiveCompare:"];
  v8 = [v7 componentsJoinedByString:@"&"];
  v9 = +[NSMutableURLRequest requestWithURL:v6];

  v10 = [v8 dataUsingEncoding:4];
  [v9 setHTTPBody:v10];

  [v9 setCachePolicy:1];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v9;
}

+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 secret:(id)a5 redirectURI:(id)a6 authCode:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  [v17 setObject:v14 forKeyedSubscript:@"code"];

  [v17 setObject:@"authorization_code" forKeyedSubscript:@"grant_type"];
  [v17 setObject:v15 forKeyedSubscript:@"redirect_uri"];

  [v17 setObject:v16 forKeyedSubscript:@"client_id"];
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:@"client_secret"];
  }
  v18 = [a1 _urlRequestForBaseURL:v12 params:v17];

  return v18;
}

+ (id)urlRequestForBaseURL:(id)a3 clientID:(id)a4 authCode:(id)a5
{
  return [a1 urlRequestForBaseURL:a3 clientID:a4 secret:0 redirectURI:@"carrierspaceauth://" authCode:a5];
}

@end