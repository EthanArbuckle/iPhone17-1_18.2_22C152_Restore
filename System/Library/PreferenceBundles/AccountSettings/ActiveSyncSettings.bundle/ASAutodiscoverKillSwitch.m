@interface ASAutodiscoverKillSwitch
- (NSURLSession)autoDV2RedirectSession;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)sendRequestForRedirectWithCompletionHandler:(id)a3;
- (void)setAutoDV2RedirectSession:(id)a3;
@end

@implementation ASAutodiscoverKillSwitch

- (void)sendRequestForRedirectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSURL URLWithString:@"https://newaccountredirectdomain.apple.com/outlook.office365.com/autodiscover/autodiscover_v2.json"];
  v6 = +[NSMutableURLRequest requestWithURL:v5];

  [v6 _setNonAppInitiated:1];
  v7 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v8 = +[NSURLSession sessionWithConfiguration:v7 delegate:self delegateQueue:0];
  [(ASAutodiscoverKillSwitch *)self setAutoDV2RedirectSession:v8];

  v9 = [(ASAutodiscoverKillSwitch *)self autoDV2RedirectSession];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_11920;
  v15[3] = &unk_308F8;
  v15[4] = self;
  id v16 = v4;
  id v10 = v4;
  v11 = [v9 dataTaskWithRequest:v6 completionHandler:v15];

  v12 = DALoggingwithCategory();
  os_log_type_t v13 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v12, v13))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "#EASTrafficStarting AutoDV2 Redirect Request Task...", v14, 2u);
  }

  [v11 resume];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9 = a6;
  id v10 = (void (**)(id, void *))a7;
  id v11 = v9;
  v12 = v11;
  if (a5)
  {
    os_log_type_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "#EASTrafficReceived AutoDV2 Redirect Response....", v15, 2u);
    }

    v12 = 0;
  }
  v10[2](v10, v12);
}

- (NSURLSession)autoDV2RedirectSession
{
  return self->_autoDV2RedirectSession;
}

- (void)setAutoDV2RedirectSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end