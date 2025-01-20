@interface APSDaemon
- (APSDaemon)init;
- (APSIDSProxyManager)proxyManager;
- (APSPowerAssertion)courierConnectTimerPowerAssertion;
- (APSTaskListener)taskListener;
- (APSUserTracker)userTracker;
- (BOOL)_systemIsReady;
- (BOOL)hasEnabledCouriers;
- (BOOL)systemIsShuttingDown;
- (BOOL)systemReady;
- (NSDate)lastClientConnection;
- (NSMutableDictionary)environmentsToCouriers;
- (NSString)networkGuidanceString;
- (NSTimer)inactivityTerminationTimer;
- (OS_dispatch_source)sigTERMSource;
- (OS_dispatch_source)sigUSR1Source;
- (OS_xpc_object)connection;
- (PCSimpleTimer)courierConnectTimer;
- (double)keepAliveIntervalForEnvironment:(id)a3;
- (double)startupTime;
- (id)JSONDebugString:(BOOL)a3;
- (id)_connectionsDebuggingState;
- (id)courierForEnvironment:(id)a3;
- (id)courierForEnvironmentName:(id)a3;
- (id)createCourierForEnvironment:(id)a3;
- (id)environmentForConnectionPortName:(id)a3 connection:(id)a4;
- (id)getConnectionServerForEnvironment:(id)a3 connectionPortName:(id)a4 processName:(id)a5 enableDarkWake:(BOOL)a6 peerConnection:(id)a7 isNewConnection:(BOOL *)a8;
- (id)prettyStatus;
- (int)isConnectedToken;
- (int)systemReadyToken;
- (void)_clearCourierConnectTimerAndPowerAssertion;
- (void)_clearInactivityTerminationTimer;
- (void)_connectCouriersTimerFired;
- (void)_enableAllCouriers;
- (void)_inactivityTerminationTimerFired:(id)a3;
- (void)_performPeriodicSignal;
- (void)_receivedShutdownNotification;
- (void)_removeCourierForEnvironment:(id)a3;
- (void)_schedulePeriodicSignal;
- (void)_setupNotifyToken;
- (void)_startInactivityTerminationTimerIfNecessary;
- (void)_updateCourierConnectTimerAndPowerAssertion;
- (void)_updateNetworkGuidance;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)courierConnectionStatusDidChange:(id)a3;
- (void)courierHasNoConnections:(id)a3;
- (void)courierIsIdle:(id)a3;
- (void)dealloc;
- (void)finalizeProcessedUsers;
- (void)finishLoggingInUserID:(id)a3;
- (void)flushUser:(id)a3;
- (void)invalidateDeviceIdentity;
- (void)loginForUser:(id)a3;
- (void)loginInUserID:(id)a3;
- (void)logoutUser:(id)a3;
- (void)proxyManager:(id)a3 canUseProxyChanged:(BOOL)a4;
- (void)proxyManager:(id)a3 incomingPresenceWithGuid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 environmentName:(id)a12;
- (void)receivedClientConnection;
- (void)requestCourierConnections;
- (void)rollTokensForAllBAAEnvironments:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCourierConnectTimer:(id)a3;
- (void)setCourierConnectTimerPowerAssertion:(id)a3;
- (void)setEnvironmentsToCouriers:(id)a3;
- (void)setHasEnabledCouriers:(BOOL)a3;
- (void)setInactivityTerminationTimer:(id)a3;
- (void)setIsConnectedToken:(int)a3;
- (void)setLastClientConnection:(id)a3;
- (void)setNetworkGuidanceString:(id)a3;
- (void)setProxyManager:(id)a3;
- (void)setSigTERMSource:(id)a3;
- (void)setSigUSR1Source:(id)a3;
- (void)setStartupTime:(double)a3;
- (void)setSystemIsShuttingDown:(BOOL)a3;
- (void)setSystemReady:(BOOL)a3;
- (void)setSystemReadyToken:(int)a3;
- (void)setTaskListener:(id)a3;
- (void)setUserTracker:(id)a3;
- (void)setupUser:(id)a3;
- (void)shouldUseInternetDidChange:(id)a3;
- (void)updateSafeToSendFilterForce:(BOOL)a3;
@end

@implementation APSDaemon

- (APSDaemon)init
{
  v31.receiver = self;
  v31.super_class = (Class)APSDaemon;
  id v2 = [(APSDaemon *)&v31 init];
  if (v2)
  {
    v3 = +[APSLog daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "APS daemon launched %@", buf, 0xCu);
    }

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v4;

    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v2 + 5), &stru_10012AE78);
    dispatch_resume(*((dispatch_object_t *)v2 + 5));
    signal(15, (void (__cdecl *)(int))1);
    v8 = +[CUTWeakReference weakRefWithObject:v2];
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    v11 = *((void *)v2 + 6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000467E0;
    handler[3] = &unk_10012A5E0;
    id v12 = v8;
    id v30 = v12;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    signal(30, (void (__cdecl *)(int))1);
    [v2 _schedulePeriodicSignal];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000468B8, @"com.apple.springboard.deviceWillShutDown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [v2 _setupNotifyToken];
    notify_register_check("PCPushIsConnectedToken", (int *)v2 + 4);
    notify_set_state(*((_DWORD *)v2 + 4), 0);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10012AEB8);

    v14 = objc_alloc_init(APSIDSProxyManager);
    v15 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v14;

    [*((id *)v2 + 7) setDelegate:v2];
    if (!*((void *)v2 + 4))
    {
      v16 = &stru_10012AEF8;
      if (_os_feature_enabled_impl())
      {
        v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v18 = dispatch_queue_create("com.apple.apsd.connection_queue", v17);

        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000469D0;
        v27[3] = &unk_10012AF48;
        v28 = &stru_10012AEF8;
        v16 = objc_retainBlock(v27);
      }
      else
      {
        dispatch_queue_t v18 = (dispatch_queue_t)&_dispatch_main_q;
      }
      uint64_t v19 = APSXPCCreateServerConnection();
      v20 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v19;

      APSSetXPCConnectionContext();
      xpc_connection_resume(*((xpc_connection_t *)v2 + 4));
    }
    if (!*((void *)v2 + 8))
    {
      v21 = [[APSTaskListener alloc] initWithQueue:&_dispatch_main_q apsDaemon:v2];
      v22 = (void *)*((void *)v2 + 8);
      *((void *)v2 + 8) = v21;
    }
    uint64_t v23 = sub_10003DD58();
    v24 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v23;

    [*((id *)v2 + 3) setResponder:v2];
    [*((id *)v2 + 3) startup];
    +[NSDate timeIntervalSinceReferenceDate];
    *((void *)v2 + 15) = v25;
  }
  return (APSDaemon *)v2;
}

- (void)dealloc
{
  [(APSDaemon *)self _clearCourierConnectTimerAndPowerAssertion];
  notify_cancel(self->_systemReadyToken);
  notify_cancel(self->_isConnectedToken);
  dispatch_source_cancel((dispatch_source_t)self->_sigTERMSource);
  sigTERMSource = self->_sigTERMSource;
  self->_sigTERMSource = 0;

  dispatch_source_cancel((dispatch_source_t)self->_sigUSR1Source);
  sigUSR1Source = self->_sigUSR1Source;
  self->_sigUSR1Source = 0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.deviceWillShutDown", 0);
  [(APSIDSProxyManager *)self->_proxyManager setDelegate:0];
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v7 = self->_connection;
    self->_connection = 0;
  }
  taskListener = self->_taskListener;
  if (taskListener)
  {
    self->_taskListener = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)APSDaemon;
  [(APSDaemon *)&v9 dealloc];
}

- (id)prettyStatus
{
  v3 = +[APSStatusPrinter statusPrinter];
  [(APSDaemon *)self appendPrettyStatusToStatusPrinter:v3];
  id v4 = [v3 description];

  return v4;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_environmentsToCouriers count]) {
    CFStringRef v5 = @"Running";
  }
  else {
    CFStringRef v5 = @"Down";
  }
  [v4 appendDescription:@"daemon status" stringValue:v5];
  [v4 appendDescription:@"startup time" timeIntervalValue:self->_startupTime];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  dispatch_source_t v6 = self->_environmentsToCouriers;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v11, (void)v14);
        v13 = [v11 name];
        [v4 appendDescription:@"connection environment" stringValue:v13];

        [v4 pushIndent];
        [v12 appendPrettyStatusToStatusPrinter:v4];
        [v4 popIndent];
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)JSONDebugString:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v28 = @"startupTime";
  CFStringRef v5 = +[NSNumber numberWithDouble:self->_startupTime];
  v29 = v5;
  dispatch_source_t v6 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v7 = [v6 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = self->_environmentsToCouriers;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v14 = [(APSDaemon *)self courierForEnvironment:v13];
        long long v15 = [v14 JSONDebugState];
        long long v16 = [v13 name];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v22 = 0;
  long long v17 = +[NSJSONSerialization dataWithJSONObject:v7 options:!v3 error:&v22];
  id v18 = v22;
  if (v18)
  {
    uint64_t v19 = +[APSLog daemon];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C8CE8((uint64_t)v18, v19);
    }

    v20 = &stru_10012F350;
  }
  else
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v17 bytes]);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (void)_setupNotifyToken
{
  if (!self->_systemReady)
  {
    +[CUTWeakReference weakRefWithObject:self];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100047254;
    handler[3] = &unk_10012AF70;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v3;
    uint32_t v4 = notify_register_dispatch("APSSafeToSendFilterNotification", &self->_systemReadyToken, (dispatch_queue_t)&_dispatch_main_q, handler);
    if (v4)
    {
      int v5 = v4;
      dispatch_source_t v6 = +[APSLog daemon];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1000C8D60(v5, v6);
      }
    }
    dispatch_time_t v7 = dispatch_time(0, 120000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004729C;
    v10[3] = &unk_10012A5E0;
    v10[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v10);

    id v8 = +[NSDate date];
    lastClientConnection = self->_lastClientConnection;
    self->_lastClientConnection = v8;

    [(APSDaemon *)self updateSafeToSendFilterForce:0];
  }
}

- (void)updateSafeToSendFilterForce:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: updateSafeToSendFilter force: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!self->_hasEnabledCouriers)
  {
    dispatch_time_t v7 = +[NSDate date];
    [v7 timeIntervalSinceDate:self->_lastClientConnection];
    double v9 = v8;

    id v10 = +[APSLog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = *(APSDaemon **)&v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "timeSinceLastConnection: %f", (uint8_t *)&v11, 0xCu);
    }

    if (v3 || v9 < 10.0)
    {
      if (!v3)
      {
LABEL_14:
        [(APSDaemon *)self _updateCourierConnectTimerAndPowerAssertion];
        return;
      }
    }
    else if (![(APSDaemon *)self _systemIsReady])
    {
      goto LABEL_14;
    }
    [(APSDaemon *)self _enableAllCouriers];
    goto LABEL_14;
  }
}

- (void)_updateCourierConnectTimerAndPowerAssertion
{
  BOOL v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_lastClientConnection];
  double v5 = v4;

  double v6 = 10.0 - v5;
  dispatch_time_t v7 = +[APSLog daemon];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(APSDaemon *)self _systemIsReady];
    CFStringRef v9 = @"NO";
    BOOL hasEnabledCouriers = self->_hasEnabledCouriers;
    if (v8) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    double v24 = *(double *)&v11;
    if (hasEnabledCouriers) {
      CFStringRef v9 = @"YES";
    }
    __int16 v25 = 2112;
    CFStringRef v26 = v9;
    __int16 v27 = 2048;
    double v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UpdateCourierConnectTimerAndPowerAssertion: systemIsReady %@  hasEnabledCouriers %@  delay %f", buf, 0x20u);
  }

  if ([(APSDaemon *)self _systemIsReady])
  {
    BOOL v12 = self->_hasEnabledCouriers;
    [(APSDaemon *)self _clearCourierConnectTimerAndPowerAssertion];
    if (!v12 && v6 > 2.22044605e-16)
    {
      double v14 = v6 + 1.0;
      long long v15 = +[APSLog daemon];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Delaying connect for %g secs", buf, 0xCu);
      }

      long long v16 = +[APSLog daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Delaying courier connection for %g seconds", buf, 0xCu);
      }

      long long v17 = +[NSString stringWithFormat:@"%@-connectcouriers", APSBundleIdentifier];
      id v18 = [[APSPowerAssertion alloc] initWithName:v17 category:210 holdDuration:30.0];
      [(APSDaemon *)self setCourierConnectTimerPowerAssertion:v18];

      uint64_t v19 = (PCSimpleTimer *)[objc_alloc((Class)PCSimpleTimer) initWithTimeInterval:@"APSDaemon-courierconnecttimer" serviceIdentifier:self target:"_connectCouriersTimerFired" selector:0 userInfo:v14];
      courierConnectTimer = self->_courierConnectTimer;
      self->_courierConnectTimer = v19;

      v21 = self->_courierConnectTimer;
      id v22 = +[NSRunLoop mainRunLoop];
      [(PCSimpleTimer *)v21 scheduleInRunLoop:v22];
    }
  }
  else
  {
    [(APSDaemon *)self _clearCourierConnectTimerAndPowerAssertion];
  }
}

- (BOOL)_systemIsReady
{
  if (self->_systemReady)
  {
    return 1;
  }
  else
  {
    uint64_t state64 = 0;
    notify_get_state(self->_systemReadyToken, &state64);
    self->_systemReady = state64 != 0;
    if (sub_10007E77C())
    {
      BOOL v2 = 1;
      self->_systemReady = 1;
    }
    else
    {
      return self->_systemReady;
    }
  }
  return v2;
}

- (void)_receivedShutdownNotification
{
  BOOL v3 = +[APSLog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: System is shutting down! Disabling all couriers cleanly.", buf, 0xCu);
  }

  self->_systemIsShuttingDown = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = self->_environmentsToCouriers;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v9 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), (void)v10);
        [v9 setEnabled:0];

        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_updateNetworkGuidance
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  BOOL v3 = self->_environmentsToCouriers;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v33;
    char v7 = 1;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v9 = [(APSDaemon *)self courierForEnvironment:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        if ([v9 shouldUseInternet])
        {
          if ([v9 isConnectedToService])
          {

            goto LABEL_13;
          }
          char v7 = 0;
        }
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_13:
    char v7 = 1;
  }

  long long v10 = +[APSLog daemon];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v7) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v40 = self;
    __int16 v41 = 2112;
    CFStringRef v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ updating network guidance isConnected? %@", buf, 0x16u);
  }

  notify_set_state(self->_isConnectedToken, v7 & 1);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v12 = self->_environmentsToCouriers;
  id v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v29;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = [(APSDaemon *)self courierForEnvironment:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
        if ([v18 shouldUseInternet])
        {
          id v19 = [v18 ifname];
          v20 = (const char *)[v19 cStringUsingEncoding:4];

          if (v20)
          {

            goto LABEL_35;
          }
          char v15 = 1;
        }
      }
      id v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v14) {
        continue;
      }
      break;
    }

    if (v15)
    {
      v20 = 0;
      goto LABEL_35;
    }
  }
  else
  {
  }
  v21 = +[APSLog daemon];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ no courier should be enabled - providing no guidance", buf, 0xCu);
  }

  v20 = (const char *)kNetworkConfigPersistentInterfaceNoGuidance;
LABEL_35:
  if (v20 == (const char *)kNetworkConfigPersistentInterfaceNoGuidance) {
    id v22 = "no guidance";
  }
  else {
    id v22 = v20;
  }
  long long v23 = +[NSString stringWithFormat:@"%s", v22];
  if (![(NSString *)self->_networkGuidanceString isEqualToString:v23])
  {
    [(APSDaemon *)self setNetworkGuidanceString:v23];
    networkGuidanceString = self->_networkGuidanceString;
    CFStringRef v36 = @"Guidance";
    v37 = networkGuidanceString;
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    APSPowerLog();
    CFStringRef v26 = +[APSLog daemon];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = self->_networkGuidanceString;
      *(_DWORD *)buf = 138412546;
      v40 = self;
      __int16 v41 = 2112;
      CFStringRef v42 = (const __CFString *)v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ providing network guidance %@", buf, 0x16u);
    }

    network_config_set_persistent_interface();
  }
}

- (void)_clearCourierConnectTimerAndPowerAssertion
{
  [(PCSimpleTimer *)self->_courierConnectTimer invalidate];
  courierConnectTimer = self->_courierConnectTimer;
  self->_courierConnectTimer = 0;

  courierConnectTimerPowerAssertion = self->_courierConnectTimerPowerAssertion;
  if (courierConnectTimerPowerAssertion)
  {
    self->_courierConnectTimerPowerAssertion = 0;
  }
}

- (void)_connectCouriersTimerFired
{
  BOOL v3 = +[APSLog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Courier connections delay finished", buf, 2u);
  }

  id v4 = +[APSLog daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Courier connection timer fired. Connecting couriers.", v5, 2u);
  }

  [(APSDaemon *)self _clearCourierConnectTimerAndPowerAssertion];
  [(APSDaemon *)self _enableAllCouriers];
}

- (void)_enableAllCouriers
{
  BOOL systemIsShuttingDown = self->_systemIsShuttingDown;
  id v4 = +[APSLog daemon];
  BOOL v5 = os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEFAULT);
  if (systemIsShuttingDown)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_DEFAULT, "%@: Ignoring call to _enableAllCouriers - system is shutting down", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_DEFAULT, "Enabling all couriers", buf, 2u);
    }

    uint64_t v6 = +[APSLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Enabling all couriers", buf, 0xCu);
    }

    self->_BOOL hasEnabledCouriers = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_environmentsToCouriers;
    id v7 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v11 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
          [v11 setEnabled:1];

          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)receivedClientConnection
{
  BOOL v3 = +[NSDate date];
  lastClientConnection = self->_lastClientConnection;
  self->_lastClientConnection = v3;

  if (!self->_hasEnabledCouriers)
  {
    BOOL v5 = +[APSLog daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client connected, bump filter time", buf, 2u);
    }

    uint64_t v6 = +[APSLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received client connection and we have not yet enabled couriers", v7, 2u);
    }

    [(APSDaemon *)self updateSafeToSendFilterForce:0];
  }
}

- (double)keepAliveIntervalForEnvironment:(id)a3
{
  id v4 = +[APSEnvironment environmentForName:a3];
  if (v4)
  {
    BOOL v5 = [(APSDaemon *)self courierForEnvironment:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 currentKeepAliveInterval];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)getConnectionServerForEnvironment:(id)a3 connectionPortName:(id)a4 processName:(id)a5 enableDarkWake:(BOOL)a6 peerConnection:(id)a7 isNewConnection:(BOOL *)a8
{
  long long v13 = (APSDaemon *)a3;
  long long v14 = (__CFString *)a4;
  id v15 = a5;
  id v16 = a7;
  long long v17 = v16;
  if (self->_systemIsShuttingDown)
  {
    id v18 = +[APSLog daemon];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v20 = 0;
      goto LABEL_58;
    }
    *(_DWORD *)buf = 138412290;
    v75 = self;
    id v19 = "%@: Ignoring call to getConnectionServerForEnvironment - system is shutting down";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v16)
  {
    id v18 = +[APSLog daemon];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v75 = self;
    id v19 = "%@: Ignoring call to getConnectionServerForEnvironment - missing peer";
    goto LABEL_4;
  }
  v61 = a8;
  id v18 = +[APSEnvironment environmentForName:v13];
  if (!v18)
  {
    long long v30 = +[APSLog daemon];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v13;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Unknown environment '%@'", buf, 0xCu);
    }
    v20 = 0;
    goto LABEL_57;
  }
  uint64_t v60 = +[NSString stringWithFormat:@"%@-getconnectionserver-%@", APSBundleIdentifier, v13];
  v59 = [(APSPowerAssertion_NoHold *)[APSNoOpPowerAssertion alloc] initWithName:v60 category:211];
  [(APSNoOpPowerAssertion *)v59 hold];
  v21 = [(APSDaemon *)self userTracker];
  uint64_t v22 = [v21 userForConnection:v17];

  v64 = v17;
  v65 = (void *)v22;
  if (v14)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v23 = [(NSMutableDictionary *)self->_environmentsToCouriers copy];
    id v24 = [v23 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v71;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v71 != v26) {
            objc_enumerationMutation(v23);
          }
          if (*(NSObject **)(*((void *)&v70 + 1) + 8 * i) != v18)
          {
            long long v28 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:");
            [v28 removeConnectionForConnectionPortName:v14 user:v65];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v25);
    }

    long long v17 = v64;
    uint64_t v22 = (uint64_t)v65;
  }
  long long v29 = [(APSDaemon *)self courierForEnvironment:v18];
  id v62 = v15;
  v63 = v13;
  if (v29)
  {
    if (!v14)
    {
LABEL_39:
      if (v61) {
        BOOL *v61 = 1;
      }
      v45 = [(APSDaemon *)self userTracker];
      v43 = [v45 dependenciesForUser:v65];

      v46 = [APSConnectionServer alloc];
      v47 = [(APSDaemon *)v29 connectionServerDelegateForUser:v65 dependencies:v43];
      v48 = [v43 userPreferences];
      v49 = v46;
      v50 = v14;
      v20 = [(APSConnectionServer *)v49 initWithDelegate:v47 user:v65 userPreferences:v48 enableDarkWake:0 environmentName:v63 connectionPortName:v14 processName:v62 connection:v64];

      [(APSDaemon *)v29 addConnection:v20 forUser:v65 dependencies:v43];
      v51 = [(APSDaemon *)v29 publicTokenForUser:v65];

      v52 = +[APSLog daemon];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v53 = @"NO";
        if (v51) {
          CFStringRef v54 = @"YES";
        }
        else {
          CFStringRef v54 = @"NO";
        }
        if (self->_hasEnabledCouriers) {
          CFStringRef v53 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v75 = (APSDaemon *)v54;
        __int16 v76 = 2112;
        CFStringRef v77 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Do we need to enable the courier? needToken %@  _hasEnabledCouriers %@", buf, 0x16u);
      }

      long long v14 = v50;
      id v15 = v62;
      long long v17 = v64;
      if (self->_hasEnabledCouriers || v51)
      {
        if (v51)
        {
          v56 = +[APSLog daemon];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v29;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Connecting courier %@ immediately to get public token", buf, 0xCu);
          }
        }
        id v55 = [(APSDaemon *)v29 setEnabled:1];
      }
      sub_10004891C((uint64_t)v55, v20, v64);
      v44 = v65;
      goto LABEL_56;
    }
  }
  else
  {
    v58 = v14;
    long long v29 = [(APSDaemon *)self createCourierForEnvironment:v18];
    long long v31 = [(APSDaemon *)self userTracker];
    long long v32 = [v31 sortedLoggedInUsers];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v33 = v32;
    id v34 = [v33 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v67;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
          v39 = [(APSDaemon *)self userTracker];
          v40 = [v39 dependenciesForUser:v38];

          [(APSDaemon *)v29 setupForUser:v38 dependencies:v40];
        }
        id v35 = [v33 countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v35);
    }

    long long v14 = v58;
    id v15 = v62;
    long long v17 = v64;
    uint64_t v22 = (uint64_t)v65;
    if (!v58) {
      goto LABEL_39;
    }
  }
  v20 = [(APSDaemon *)v29 connectionForConnectionPortName:v14 user:v22];
  __int16 v41 = +[APSLog daemon];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v75 = v20;
    __int16 v76 = 2112;
    CFStringRef v77 = v14;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Found existing connection %@ for port name: %@", buf, 0x16u);
  }

  if (!v20) {
    goto LABEL_39;
  }
  sub_10004891C(v42, v20, v17);
  [(APSDaemon *)v20 setUser:v22];
  [(APSDaemon *)v20 setConnection:v17];
  v43 = [(APSDaemon *)v29 publicTokenForUser:v22];
  [(APSDaemon *)v20 setPublicToken:v43 needsAck:0];
  v44 = (void *)v22;
LABEL_56:

  [(APSDaemon *)self _clearInactivityTerminationTimer];
  [(APSNoOpPowerAssertion *)v59 clear];

  long long v30 = v60;
  long long v13 = v63;
LABEL_57:

LABEL_58:
  return v20;
}

- (id)environmentForConnectionPortName:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(APSDaemon *)self userTracker];
  uint64_t v9 = [v8 userForConnection:v6];

  long long v10 = [(APSDaemon *)self userTracker];
  CFStringRef v11 = [v10 dependenciesForUser:v9];

  long long v12 = [v11 userPreferences];
  long long v13 = +[APSConnectionServer environmentForNamedPort:v7 userPreferences:v12];

  return v13;
}

- (void)requestCourierConnections
{
  BOOL v3 = +[APSLog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Explicit courier connect request!", buf, 2u);
  }

  if (self->_hasEnabledCouriers)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_environmentsToCouriers;
    id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v15;
      *(void *)&long long v6 = 138412546;
      long long v13 = v6;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          CFStringRef v11 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v10, v13, (void)v14);
          long long v12 = +[APSLog daemon];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            id v19 = v11;
            __int16 v20 = 2112;
            uint64_t v21 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting courier connection %@ %@", buf, 0x16u);
          }

          [v11 requestConnectionIfNeeded];
        }
        id v7 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = +[APSLog daemon];
    if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_DEFAULT, "Couriers have not yet been enabled", buf, 2u);
    }
  }
}

- (void)invalidateDeviceIdentity
{
  BOOL v3 = +[APSLog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "We've been told that the device identity is invalid!", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_environmentsToCouriers;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412546;
    long long v13 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        CFStringRef v11 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", v10, v13, (void)v14);
        long long v12 = +[APSLog daemon];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          id v19 = v11;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Telling courier %@ %@ to invalidate device identity.", buf, 0x16u);
        }

        [v11 invalidateDeviceIdentity];
      }
      id v7 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)courierIsIdle:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Courier %@ is idle", (uint8_t *)&v6, 0x16u);
  }

  [(APSDaemon *)self _startInactivityTerminationTimerIfNecessary];
  [(APSDaemon *)self _setActivePushConnectionState];
}

- (APSIDSProxyManager)proxyManager
{
  return self->_proxyManager;
}

- (void)courierConnectionStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ received courierConnectionStatusDidChange from %@.", (uint8_t *)&v6, 0x16u);
  }

  [(APSDaemon *)self _updateNetworkGuidance];
}

- (void)shouldUseInternetDidChange:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ received shouldUseInternetDidChange from %@.", (uint8_t *)&v6, 0x16u);
  }

  [(APSDaemon *)self _updateNetworkGuidance];
}

- (void)courierHasNoConnections:(id)a3
{
  id v4 = a3;
  id v5 = [v4 environment];
  id v6 = [(APSDaemon *)self courierForEnvironment:v5];

  if (v6 == v4)
  {
    id v7 = +[APSLog daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing courier %@", (uint8_t *)&v8, 0xCu);
    }

    [v4 setEnabled:0];
    [(APSDaemon *)self _removeCourierForEnvironment:v5];
    [(APSDaemon *)self _startInactivityTerminationTimerIfNecessary];
  }
}

- (void)rollTokensForAllBAAEnvironments:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ was notified of a BAA identity change, rolling push tokens for all BAA environments", buf, 0xCu);
  }
  long long v15 = v4;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_environmentsToCouriers;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = [(APSDaemon *)self courierForEnvironment:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (sub_10007F1B4())
        {
          long long v12 = +[APSLog daemon];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = [v11 environment];
            long long v14 = [v13 name];
            *(_DWORD *)buf = 138412546;
            id v21 = v11;
            __int16 v22 = 2112;
            id v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ is currently using a BAA identity provider, rolling token for environment %@", buf, 0x16u);
          }
          [v11 rollTokenAndReconnect];
        }
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void)proxyManager:(id)a3 canUseProxyChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[APSLog daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v20 = self;
    __int16 v21 = 2112;
    CFStringRef v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ canUseProxyChanged %@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_environmentsToCouriers;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
        [v13 canUseProxyChanged];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)proxyManager:(id)a3 incomingPresenceWithGuid:(id)a4 token:(id)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificate:(id)a9 nonce:(id)a10 signature:(id)a11 environmentName:(id)a12
{
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = v22;
  if (self->_systemIsShuttingDown)
  {
    id v24 = v22;
    id v25 = v21;
    uint64_t v26 = v20;
    __int16 v27 = v18;
    long long v28 = +[APSLog daemon];
    v45 = v28;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ is shutting down, ignoring incomingPresence from proxy client", buf, 0xCu);
    }
    long long v30 = v43;
    long long v29 = v44;
    long long v31 = v42;
  }
  else
  {
    id v40 = v17;
    uint64_t v32 = +[APSEnvironment environmentForName:v22];
    __int16 v41 = self;
    uint64_t v33 = [(APSDaemon *)self courierForEnvironment:v32];
    id v34 = (void *)v33;
    v45 = (void *)v32;
    if (v32 && !v33)
    {
      id v35 = +[APSLog daemon];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v41;
        __int16 v48 = 2112;
        uint64_t v49 = v32;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ creating courier for environment %@ for incoming presence", buf, 0x16u);
      }

      uint64_t v36 = [(APSDaemon *)v41 createCourierForEnvironment:v32];
      id v34 = v36;
      if (v41->_hasEnabledCouriers) {
        [v36 setEnabled:1];
      }
    }
    __int16 v27 = v18;
    v37 = +[APSLog daemon];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v47 = v41;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v34;
      __int16 v50 = 2112;
      id v51 = v23;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ incomingPresence we have courier %@ for environment %@", buf, 0x20u);
    }
    id v24 = v23;

    id v38 = v20;
    id v39 = v21;
    long long v29 = v44;
    uint64_t v26 = v20;
    long long v30 = v43;
    id v25 = v21;
    long long v31 = v42;
    id v17 = v40;
    [v34 incomingPresenceWithGuid:v44 token:v43 hwVersion:v42 swVersion:v40 swBuild:v27 certificate:v19 nonce:v38 signature:v39];
    [(APSDaemon *)v41 _clearInactivityTerminationTimer];
  }
}

- (void)_schedulePeriodicSignal
{
  BOOL v2 = +[CUTWeakReference weakRefWithObject:self];
  dispatch_time_t v3 = dispatch_time(0, 86400000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000499F8;
  block[3] = &unk_10012A5E0;
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performPeriodicSignal
{
  dispatch_time_t v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_lastClientConnection];
  double v5 = v4;

  double v6 = 10.0 - v5;
  CFStringRef v7 = +[APSLog daemon];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = *(void *)&v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_performPeriodicSignal - timeSinceLastConnection %f", buf, 0xCu);
  }

  if (v6 <= 2.22044605e-16)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_environmentsToCouriers;
    id v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          [v15 periodicSignalFired];
        }
        id v12 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }

    [(APSDaemon *)self _schedulePeriodicSignal];
  }
  else
  {
    id v8 = +[APSLog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = (uint64_t)(v6 + 1.0);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delaying periodic signal by %lld", buf, 0xCu);
    }

    dispatch_time_t v9 = dispatch_time(0, 1000000000 * (uint64_t)(v6 + 1.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049CC0;
    block[3] = &unk_10012A5E0;
    void block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_startInactivityTerminationTimerIfNecessary
{
  [(APSDaemon *)self _clearInactivityTerminationTimer];
  if (![(NSMutableDictionary *)self->_environmentsToCouriers count])
  {
    dispatch_time_t v3 = +[APSLog daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = 0x402E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting inactivity termination timer for %g seconds", (uint8_t *)&v6, 0xCu);
    }

    double v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_inactivityTerminationTimerFired:" selector:0 userInfo:0 repeats:15.0];
    inactivityTerminationTimer = self->_inactivityTerminationTimer;
    self->_inactivityTerminationTimer = v4;
  }
}

- (void)_clearInactivityTerminationTimer
{
  if (self->_inactivityTerminationTimer)
  {
    dispatch_time_t v3 = +[APSLog daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing inactivity termination timer", v5, 2u);
    }

    [(NSTimer *)self->_inactivityTerminationTimer invalidate];
    inactivityTerminationTimer = self->_inactivityTerminationTimer;
    self->_inactivityTerminationTimer = 0;
  }
}

- (void)_inactivityTerminationTimerFired:(id)a3
{
  [(NSTimer *)self->_inactivityTerminationTimer invalidate];
  inactivityTerminationTimer = self->_inactivityTerminationTimer;
  self->_inactivityTerminationTimer = 0;
}

- (void)_removeCourierForEnvironment:(id)a3
{
}

- (id)createCourierForEnvironment:(id)a3
{
  id v4 = a3;
  double v5 = +[APSLog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "createCourierForEnvironment '%@'", (uint8_t *)&v12, 0xCu);
  }

  int v6 = [(APSDaemon *)self userTracker];
  uint64_t v7 = [v6 defaultUser];

  id v8 = [(APSDaemon *)self userTracker];
  dispatch_time_t v9 = [v8 dependenciesForUser:v7];

  id v10 = [[APSCourier alloc] initWithEnvironment:v4 defaultUser:v7 userDependencies:v9 delegate:self];
  [(NSMutableDictionary *)self->_environmentsToCouriers setObject:v10 forKey:v4];

  return v10;
}

- (id)courierForEnvironment:(id)a3
{
  return [(NSMutableDictionary *)self->_environmentsToCouriers objectForKey:a3];
}

- (id)courierForEnvironmentName:(id)a3
{
  id v4 = a3;
  double v5 = +[APSEnvironment environmentForName:v4];
  if (v5)
  {
    int v6 = [(APSDaemon *)self courierForEnvironment:v5];
  }
  else
  {
    uint64_t v7 = +[APSLog daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "courierForEnvironmentName Unknown environment '%@'", (uint8_t *)&v9, 0xCu);
    }

    int v6 = 0;
  }

  return v6;
}

- (id)_connectionsDebuggingState
{
  BOOL v2 = [(NSMutableDictionary *)self->_environmentsToCouriers allValues];
  dispatch_time_t v3 = APSPrettyPrintCollection();

  return v3;
}

- (void)loginInUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(APSDaemon *)self userTracker];
  [v5 manuallySetupAndLoginUser:v4];
}

- (void)finishLoggingInUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(APSDaemon *)self userTracker];
  [v5 manuallyLoginUser:v4];
}

- (void)setupUser:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v9), (void)v13);
        id v11 = [(APSDaemon *)self userTracker];
        int v12 = [v11 dependenciesForUser:v4];
        [v10 setupForUser:v4 dependencies:v12];

        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)loginForUser:(id)a3
{
  id v4 = a3;
  id v42 = self;
  id v5 = [(APSDaemon *)self userTracker];
  id v6 = [v5 dependenciesForUser:v4];

  id v7 = [v6 userPreferences];
  uint64_t v8 = +[APSConnectionServer serverEnvironmentNamesForUserPreferences:v7];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  id v38 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v52;
    *(void *)&long long v9 = 134218498;
    long long v35 = v9;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        int v12 = +[APSEnvironment environmentForName:](APSEnvironment, "environmentForName:", v11, v35);
        if (v12)
        {
          uint64_t v39 = v11;
          id v40 = i;
          __int16 v41 = v12;
          long long v13 = [(APSDaemon *)v42 courierForEnvironment:v12];
          if (!v13)
          {
            long long v13 = [(APSDaemon *)v42 createCourierForEnvironment:v41];
            long long v14 = [(APSDaemon *)v42 userTracker];
            long long v15 = [v14 sortedLoggedInUsers];

            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v16 = v15;
            id v17 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v48;
              do
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v48 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
                  id v22 = [(APSDaemon *)v42 userTracker];
                  uint64_t v23 = [v22 dependenciesForUser:v21];

                  [v13 setupForUser:v21 dependencies:v23];
                }
                id v18 = [v16 countByEnumeratingWithState:&v47 objects:v62 count:16];
              }
              while (v18);
            }
          }
          id v24 = [v6 userPreferences];
          id v25 = [v13 connectionServersForUser:v4];
          uint64_t v26 = [v13 connectionServerDelegateForUser:v4 dependencies:v6];
          __int16 v27 = +[APSConnectionServer serversWithEnvironmentName:v39 user:v4 userPreferences:v24 excludeServers:v25 delegate:v26];

          long long v28 = +[APSLog daemon];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v27 count];
            *(_DWORD *)buf = v35;
            id v57 = v29;
            __int16 v58 = 2112;
            id v59 = v4;
            __int16 v60 = 2112;
            uint64_t v61 = v39;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Loaded %ld connection servers for user %@ environment %@", buf, 0x20u);
          }

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v30 = v27;
          id v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v44;
            do
            {
              for (k = 0; k != v32; k = (char *)k + 1)
              {
                if (*(void *)v44 != v33) {
                  objc_enumerationMutation(v30);
                }
                [v13 addConnection:*(void *)(*((void *)&v43 + 1) + 8 * (void)k) forUser:v4 dependencies:v6];
              }
              id v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
            }
            while (v32);
          }

          [v13 setEnabled:1];
          i = v40;
          int v12 = v41;
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v38);
  }

  [(APSDaemon *)v42 _setActivePushConnectionState];
  [(APSDaemon *)v42 _startInactivityTerminationTimerIfNecessary];
}

- (void)flushUser:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        [v10 flushUser:v4];

        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)logoutUser:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_environmentsToCouriers;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[APSDaemon courierForEnvironment:](self, "courierForEnvironment:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        [v10 logoutUser:v4];

        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(APSDaemon *)self _startInactivityTerminationTimerIfNecessary];
  [(APSDaemon *)self _setActivePushConnectionState];
}

- (void)finalizeProcessedUsers
{
  [(APSDaemon *)self _startInactivityTerminationTimerIfNecessary];
  [(APSDaemon *)self _setActivePushConnectionState];
}

- (APSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_source)sigTERMSource
{
  return self->_sigTERMSource;
}

- (void)setSigTERMSource:(id)a3
{
}

- (OS_dispatch_source)sigUSR1Source
{
  return self->_sigUSR1Source;
}

- (void)setSigUSR1Source:(id)a3
{
}

- (void)setProxyManager:(id)a3
{
}

- (int)systemReadyToken
{
  return self->_systemReadyToken;
}

- (void)setSystemReadyToken:(int)a3
{
  self->_systemReadyToken = a3;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (int)isConnectedToken
{
  return self->_isConnectedToken;
}

- (void)setIsConnectedToken:(int)a3
{
  self->_isConnectedToken = a3;
}

- (BOOL)hasEnabledCouriers
{
  return self->_hasEnabledCouriers;
}

- (void)setHasEnabledCouriers:(BOOL)a3
{
  self->_BOOL hasEnabledCouriers = a3;
}

- (BOOL)systemIsShuttingDown
{
  return self->_systemIsShuttingDown;
}

- (void)setSystemIsShuttingDown:(BOOL)a3
{
  self->_BOOL systemIsShuttingDown = a3;
}

- (APSTaskListener)taskListener
{
  return self->_taskListener;
}

- (void)setTaskListener:(id)a3
{
}

- (NSMutableDictionary)environmentsToCouriers
{
  return self->_environmentsToCouriers;
}

- (void)setEnvironmentsToCouriers:(id)a3
{
}

- (PCSimpleTimer)courierConnectTimer
{
  return self->_courierConnectTimer;
}

- (void)setCourierConnectTimer:(id)a3
{
}

- (NSTimer)inactivityTerminationTimer
{
  return self->_inactivityTerminationTimer;
}

- (void)setInactivityTerminationTimer:(id)a3
{
}

- (APSPowerAssertion)courierConnectTimerPowerAssertion
{
  return self->_courierConnectTimerPowerAssertion;
}

- (void)setCourierConnectTimerPowerAssertion:(id)a3
{
}

- (NSString)networkGuidanceString
{
  return self->_networkGuidanceString;
}

- (void)setNetworkGuidanceString:(id)a3
{
}

- (NSDate)lastClientConnection
{
  return self->_lastClientConnection;
}

- (void)setLastClientConnection:(id)a3
{
}

- (double)startupTime
{
  return self->_startupTime;
}

- (void)setStartupTime:(double)a3
{
  self->_startupTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastClientConnection, 0);
  objc_storeStrong((id *)&self->_networkGuidanceString, 0);
  objc_storeStrong((id *)&self->_courierConnectTimerPowerAssertion, 0);
  objc_storeStrong((id *)&self->_inactivityTerminationTimer, 0);
  objc_storeStrong((id *)&self->_courierConnectTimer, 0);
  objc_storeStrong((id *)&self->_environmentsToCouriers, 0);
  objc_storeStrong((id *)&self->_taskListener, 0);
  objc_storeStrong((id *)&self->_proxyManager, 0);
  objc_storeStrong((id *)&self->_sigUSR1Source, 0);
  objc_storeStrong((id *)&self->_sigTERMSource, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_userTracker, 0);
}

@end