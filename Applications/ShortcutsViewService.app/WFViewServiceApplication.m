@interface WFViewServiceApplication
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (NSXPCConnection)activeConnection;
- (WFApertureStatusViewController)lastPresentedStatus;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)bannerSourceForPresentable:(id)a3;
- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5;
- (void)setActiveConnection:(id)a3;
- (void)setLastPresentedStatus:(id)a3;
- (void)workflowStatusWorkflowDidFinishWithSuccess:(BOOL)a3;
- (void)workflowStatusWorkflowWillBeginRunningWithAttribution:(id)a3 context:(id)a4;
@end

@implementation WFViewServiceApplication

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPresentedStatus, 0);

  objc_storeStrong((id *)&self->_activeConnection, 0);
}

- (void)setLastPresentedStatus:(id)a3
{
}

- (WFApertureStatusViewController)lastPresentedStatus
{
  return self->_lastPresentedStatus;
}

- (void)setActiveConnection:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (id)bannerSourceForPresentable:(id)a3
{
  v3 = [a3 requesterIdentifier];
  v4 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:v3];

  return v4;
}

- (void)workflowStatusWorkflowDidFinishWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100004820();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFViewServiceApplication workflowStatusWorkflowDidFinishWithSuccess:]";
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s workflowDidFinishWithSuccess: %i", buf, 0x12u);
  }

  v6 = [(WFViewServiceApplication *)self lastPresentedStatus];
  if (v3)
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004874;
    v11[3] = &unk_1000103C8;
    v11[4] = self;
    id v12 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
  else
  {
    v8 = [(WFViewServiceApplication *)self bannerSourceForPresentable:v6];
    v9 = [v6 requestIdentifier];
    id v10 = [v8 revokePresentableWithRequestIdentifier:v9 reason:@"done" animated:1 userInfo:&__NSDictionary0__struct error:0];
  }
}

- (void)workflowStatusWorkflowWillBeginRunningWithAttribution:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100004820();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[WFViewServiceApplication workflowStatusWorkflowWillBeginRunningWithAttribution:context:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s workflowWillBeginRunningWithAttribution: %@ context: %@", buf, 0x20u);
  }

  v9 = [[WFApertureStatusViewController alloc] initWithRunningContext:v7 attribution:v6];
  objc_storeStrong((id *)&self->_lastPresentedStatus, v9);
  id v10 = [(WFViewServiceApplication *)self bannerSourceForPresentable:v9];
  v11 = [(WFApertureStatusViewController *)v9 postOptions];
  id v15 = 0;
  unsigned __int8 v12 = [v10 postPresentable:v9 options:1 userInfo:v11 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    v14 = sub_100004820();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFViewServiceApplication workflowStatusWorkflowWillBeginRunningWithAttribution:context:]";
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to post banner: %@", buf, 0x16u);
    }
  }
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  id v7 = [v5 role];

  id v8 = [v6 initWithName:@"Main" sessionRole:v7];

  return v8;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFViewServiceApplication *)self activeConnection];

  if (v11)
  {
    unsigned __int8 v12 = sub_100004820();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s View service application already has an active connection, dropping incoming connection", buf, 0xCu);
    }
  }
  else
  {
    id v13 = [v8 allObjects];
    v14 = [v13 firstObject];
    unsigned __int8 v12 = [v14 info];

    id v15 = [v12 objectForSetting:0];
    if (v15)
    {
      BOOL v16 = objc_alloc_init((Class)NSXPCListenerEndpoint);
      [v16 _setEndpoint:v15];
      id v17 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v16];
      [v17 setExportedObject:self];
      __int16 v18 = WFWorkflowStatusXPCInterface();
      [v17 setExportedInterface:v18];

      objc_initWeak(&location, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100004F8C;
      v24[3] = &unk_1000103A0;
      objc_copyWeak(&v25, &location);
      [v17 setInterruptionHandler:v24];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005050;
      v22[3] = &unk_1000103A0;
      objc_copyWeak(&v23, &location);
      [v17 setInvalidationHandler:v22];
      [v17 resume];
      [(WFViewServiceApplication *)self setActiveConnection:v17];
      id v19 = WFWorkflowStatusHostXPCInterface();
      [v17 setRemoteObjectInterface:v19];

      __int16 v20 = [v17 remoteObjectProxy];
      [v20 workflowStatusHostBeginConnection];

      id v21 = sub_100004820();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Opened XPC connection to incoming endpoint", buf, 0xCu);
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v16 = sub_100004820();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Received a BSAction, but it was missing an endpoint", buf, 0xCu);
      }
    }
  }
}

@end