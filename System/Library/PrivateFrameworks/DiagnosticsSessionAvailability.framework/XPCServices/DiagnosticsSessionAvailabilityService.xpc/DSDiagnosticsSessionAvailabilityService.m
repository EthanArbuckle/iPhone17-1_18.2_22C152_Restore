@interface DSDiagnosticsSessionAvailabilityService
- (BOOL)_getHasActiveDiagnosticsSession;
- (id)_enhancedLoggingStatusOverride;
- (id)_sessionStatusOverride;
- (void)_getASTIdentitiesWithCompletionHandler:(id)a3;
- (void)_getASTSessionStatusForTicketNumber:(id)a3 timeout:(id)a4 completion:(id)a5;
- (void)_getHasActiveEnhancedLoggingSessionWithCompletionHandler:(id)a3;
- (void)getEnhancedLoggingStatusWithCompletionHandler:(id)a3;
- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5;
@end

@implementation DSDiagnosticsSessionAvailabilityService

- (void)getSessionStatusWithTicketNumber:(id)a3 timeout:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = [(DSDiagnosticsSessionAvailabilityService *)self _sessionStatusOverride];
  if (v11)
  {
    v10[2](v10, v11, 0);
  }
  else
  {
    v12 = +[NSXPCConnection currentConnection];
    unsigned int v13 = [v12 processIdentifier];

    v14 = DSLogSessionAvailability();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[DSDiagnosticsSessionAvailabilityService getSessionStatusWithTicketNumber:timeout:completionHandler:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 1024;
      unsigned int v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s ticketNumber: %@ timeout: %@ client PID: %d", buf, 0x26u);
    }

    v15 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003354;
    block[3] = &unk_1000144E0;
    block[4] = self;
    id v17 = v8;
    id v18 = v9;
    unsigned int v20 = v13;
    v19 = v10;
    dispatch_async(v15, block);
  }
}

- (void)_getASTSessionStatusForTicketNumber:(id)a3 timeout:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DSLogSessionAvailability();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000CC9C(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100003B2C;
  v22[3] = &unk_100014530;
  id v23 = v9;
  id v24 = v8;
  id v25 = v10;
  id v19 = v10;
  id v20 = v8;
  id v21 = v9;
  [(DSDiagnosticsSessionAvailabilityService *)self _getASTIdentitiesWithCompletionHandler:v22];
}

- (BOOL)_getHasActiveDiagnosticsSession
{
  v2 = DSLogSessionAvailability();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000CD14(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  id v10 = (void *)CFPreferencesCopyAppValue(@"InCurrentSession", @"com.apple.Diagnostics");
  v11 = DSLogSessionAvailability();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = [v10 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Active Diagnostics session: %d", (uint8_t *)v14, 8u);
  }

  unsigned __int8 v12 = [v10 BOOLValue];
  return v12;
}

- (void)_getHasActiveEnhancedLoggingSessionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = DSLogSessionAvailability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000CD8C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  unsigned __int8 v12 = +[ELSManager sharedManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _DWORD v14[2] = sub_100003EE8;
  v14[3] = &unk_100014558;
  id v15 = v3;
  id v13 = v3;
  [v12 refreshWithCompletion:v14];
}

- (void)_getASTIdentitiesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableSet set];
  uint64_t v5 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", objc_opt_class(), 0);
  [v5 addObject:objc_opt_class()];
  unsigned int v6 = +[CBSUtilities isCheckerBoardActive];
  if ((BYSetupAssistantNeedsToRun() & 1) != 0
    || ((BYSetupAssistantHasCompletedInitialRun() ^ 1 | v6) & 1) != 0)
  {
    uint64_t v7 = DSLogSessionAvailability();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Only reporting serial number for local device and physically connected accessories because Buddy is not finished", buf, 2u);
    }
  }
  else
  {
    [v5 addObject:objc_opt_class()];
    [v5 addObject:objc_opt_class()];
  }
  uint64_t v9 = +[DADeviceObserverAggregator aggregatorWithObserverClasses:v5];
  uint64_t v10 = DSLogSessionAvailability();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discovering devices...", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000424C;
  v13[3] = &unk_1000145A8;
  id v11 = v4;
  id v14 = v11;
  id v12 = v3;
  id v15 = v12;
  [v9 discoverAllDevicesWithCompletionHandler:v13];
}

- (void)getEnhancedLoggingStatusWithCompletionHandler:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(DSDiagnosticsSessionAvailabilityService *)self _enhancedLoggingStatusOverride];
  if (!v5)
  {
    unsigned int v6 = +[ELSManager sharedManager];
    uint64_t v7 = [v6 snapshot];
    unint64_t v8 = (unint64_t)[v7 status];

    if (v8 > 8)
    {
      id v11 = DSLogSessionAvailability();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10000CE04(v8, v11);
      }
    }
    else
    {
      if (((1 << v8) & 0x1EE) != 0)
      {
        uint64_t v9 = (void (*)(void *, _UNKNOWN **))v4[2];
        uint64_t v10 = &off_1000152B8;
LABEL_12:
        v9(v4, v10);
        goto LABEL_13;
      }
      if (v8)
      {
        uint64_t v9 = (void (*)(void *, _UNKNOWN **))v4[2];
        uint64_t v10 = &off_1000152A0;
        goto LABEL_12;
      }
    }
    uint64_t v9 = (void (*)(void *, _UNKNOWN **))v4[2];
    uint64_t v10 = &off_100015270;
    goto LABEL_12;
  }
  ((void (*)(void *, void *))v4[2])(v4, v5);
LABEL_13:
}

- (id)_sessionStatusOverride
{
  if (MGGetBoolAnswer())
  {
    id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.DiagnosticsSessionAvailability"];
    id v3 = [v2 valueForKey:@"sessionStatus"];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_enhancedLoggingStatusOverride
{
  if (MGGetBoolAnswer())
  {
    id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.DiagnosticsSessionAvailability"];
    id v3 = [v2 valueForKey:@"enhancedLoggingStatus"];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

@end