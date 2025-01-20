@interface LaunchServicesObserver
- (LaunchServicesObserver)init;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
- (void)_handleBetaAppCrashedNotification:(id)a3;
- (void)_handleInstalledEventNotification:(id)a3;
- (void)_handleUninstalledEventNotification:(id)a3;
@end

@implementation LaunchServicesObserver

- (LaunchServicesObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)LaunchServicesObserver;
  v2 = [(LaunchServicesObserver *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = sub_1003DA6D4();
    unsigned __int8 v5 = [v4 isHRNMode];

    if ((v5 & 1) == 0)
    {
      [v3 addObserver:v2 selector:"_handleInstalledEventNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];
      [v3 addObserver:v2 selector:"_handleUninstalledEventNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
      [v3 addObserver:v2 selector:"_handleBetaAppCrashedNotification:" name:@"com.apple.ReportCrash.beta.bulletin" object:0];
      [v3 addObserver:v2 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDAppleIDDidChangeNotification" object:0];
    }
  }
  return v2;
}

- (void)_handleInstalledEventNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003A8964;
  v3[3] = &unk_10052B7D8;
  v3[4] = self;
  sub_1003A8E40((uint64_t)self, a3, v3);
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received Apple ID did change notification.", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    [*(id *)(v5 + 8) setName:@"com.apple.LaunchServicesObserver.AppleIDDidChange.ValidateAppleIDs"];
    objc_super v7 = objc_opt_new();
    [v6[1] addOperation:v7];
  }
  else
  {
    objc_super v7 = objc_opt_new();
  }
}

- (void)_handleBetaAppCrashedNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"bundleID"];
  v6 = [v4 objectForKeyedSubscript:@"incidentID"];
  objc_super v7 = ASDLogHandleForCategory();
  int v8 = v7;
  if (v5 && v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received a beta app crash notification for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    int v8 = sub_1002705B4();
    sub_100273340((uint64_t)v8, v5, v6);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v3 userInfo];
    int v10 = 138543362;
    v11 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received a beta app crash notification without the required metadata: %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_handleUninstalledEventNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end