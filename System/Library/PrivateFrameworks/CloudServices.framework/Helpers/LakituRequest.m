@interface LakituRequest
- (BOOL)pinningFailure;
- (Class)responseClass;
- (NSMutableURLRequest)urlRequest;
- (NSNumber)protocolVersion;
- (NSString)loggingDescription;
- (NSString)urlString;
- (OS_dispatch_queue)queue;
- (OS_os_activity)activity;
- (id)additionalHeaders;
- (id)authorizationHeader;
- (id)bodyDictionary;
- (id)credential;
- (id)protectionSpace;
- (id)sessionConfig;
- (id)validateInput;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)performRequestWithHandler:(id)a3;
- (void)setActivity:(id)a3;
- (void)setPinningFailure:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation LakituRequest

- (NSString)loggingDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSNumber)protocolVersion
{
  return (NSNumber *)&off_100076078;
}

- (id)bodyDictionary
{
  return 0;
}

- (id)authorizationHeader
{
  return 0;
}

- (id)additionalHeaders
{
  return &__NSDictionary0__struct;
}

- (id)validateInput
{
  if (qword_100081078)
  {
    [(id)qword_100081078 timeIntervalSinceNow];
    double v3 = v2;
    v4 = CloudServicesLog();
    v5 = v4;
    if (v3 <= 0.0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearing retry-after date", buf, 2u);
      }

      v7 = 0;
      v6 = (void *)qword_100081078;
      qword_100081078 = 0;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10004D2F4(v5);
      }

      v6 = +[CSDateUtilities localStringFromDate:qword_100081078];
      v7 = +[CloudServicesError errorWithCode:304, @"retry-after date has not passed, throttling calls to escrow proxy until %@", v6 format];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)credential
{
  return 0;
}

- (id)protectionSpace
{
  return 0;
}

- (NSMutableURLRequest)urlRequest
{
  id v3 = objc_alloc((Class)NSURL);
  v4 = [(LakituRequest *)self urlString];
  id v5 = [v3 initWithString:v4];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v5];
    objc_msgSend(v6, "ak_addDeviceUDIDHeader");
    objc_msgSend(v6, "ak_addClientInfoHeader");
  }
  else
  {
    id v6 = 0;
  }

  return (NSMutableURLRequest *)v6;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(LakituRequest *)self activity];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000336E4;
  v20[3] = &unk_100071A28;
  id v21 = v11;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  id v19 = v11;
  os_activity_apply(v15, v20);
}

- (id)sessionConfig
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  id v4 = objc_alloc_init((Class)AKAppleIDSession);
  objc_msgSend(v3, "set_appleIDContext:", v4);

  objc_msgSend(v3, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleEscrowProxyService);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:@"application/x-apple-plist" forKeyedSubscript:@"Content-Type"];
  id v6 = [(LakituRequest *)self authorizationHeader];
  [v5 setObject:v6 forKeyedSubscript:@"Authorization"];

  v7 = [(LakituRequest *)self additionalHeaders];
  [v5 addEntriesFromDictionary:v7];

  [v3 setHTTPAdditionalHeaders:v5];

  return v3;
}

- (void)performRequestWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(LakituRequest *)self validateInput];
  if (v5)
  {
    v4[2](v4, 0, v5);
  }
  else
  {
    id v6 = [(LakituRequest *)self sessionConfig];
    v7 = +[NSURLSession sessionWithConfiguration:v6 delegate:self delegateQueue:0];
    v8 = [(LakituRequest *)self urlRequest];
    os_activity_t v9 = _os_activity_create((void *)&_mh_execute_header, "start data task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    [(LakituRequest *)self setActivity:v9];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100033BB8;
    v14[3] = &unk_100071AA0;
    os_activity_t v15 = v9;
    id v16 = self;
    id v17 = v4;
    v10 = v9;
    id v11 = [v7 dataTaskWithRequest:v8 completionHandler:v14];
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(LakituRequest *)self loggingDescription];
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: starting escrow proxy request (%@)", buf, 0x16u);
    }
    [v11 resume];
    [v7 finishTasksAndInvalidate];
  }
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)pinningFailure
{
  return self->_pinningFailure;
}

- (void)setPinningFailure:(BOOL)a3
{
  self->_pinningFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlString, 0);

  objc_storeStrong((id *)&self->_responseClass, 0);
}

@end