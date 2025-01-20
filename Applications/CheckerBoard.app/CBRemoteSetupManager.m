@interface CBRemoteSetupManager
+ (CBRemoteSetupManager)sharedInstance;
- (BOOL)broadcastingForSetup;
- (BOOL)setOverrideAuthPin:(id)a3;
- (CBRemoteSetupManager)init;
- (NSString)overridePin;
- (NSString)remoteLocaleCode;
- (SKSetupFieldDiagnosticsServer)setupServer;
- (int)preferredPasswordType;
- (unint64_t)setupState;
- (void)_handleRemoteSetupFinished;
- (void)_handleSetupServerFinished;
- (void)_processBasicConfigFromEvent:(id)a3;
- (void)_reachabilityChanged:(id)a3;
- (void)changeDesiredAuthType:(int)a3;
- (void)dealloc;
- (void)endRemoteSetupBroadcast;
- (void)handleSetupEvent:(id)a3;
- (void)restartRemoteSetupBroadcast;
- (void)sendAuthPassword:(id)a3;
- (void)setBroadcastingForSetup:(BOOL)a3;
- (void)setOverridePin:(id)a3;
- (void)setPreferredPasswordType:(int)a3;
- (void)setRemoteLocaleCode:(id)a3;
- (void)setSetupServer:(id)a3;
- (void)setSetupState:(unint64_t)a3;
- (void)setupFailed;
- (void)startRemoteSetupBroadcast;
@end

@implementation CBRemoteSetupManager

+ (CBRemoteSetupManager)sharedInstance
{
  if (qword_10008FDD8 != -1) {
    dispatch_once(&qword_10008FDD8, &stru_1000798F8);
  }
  v2 = (void *)qword_10008FDD0;

  return (CBRemoteSetupManager *)v2;
}

- (CBRemoteSetupManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CBRemoteSetupManager;
  v2 = [(CBRemoteSetupManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    setupServer = v2->_setupServer;
    v2->_setupServer = 0;

    v3->_broadcastingForSetup = 0;
    remoteLocaleCode = v3->_remoteLocaleCode;
    v3->_remoteLocaleCode = 0;

    overridePin = v3->_overridePin;
    v3->_overridePin = 0;

    v3->_preferredPasswordType = 8;
    v3->_setupState = 1;
  }
  return v3;
}

- (void)dealloc
{
  [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupManager;
  [(CBRemoteSetupManager *)&v3 dealloc];
}

- (void)startRemoteSetupBroadcast
{
  objc_super v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting broadcast for remote setup", buf, 2u);
  }

  v4 = [(CBRemoteSetupManager *)self setupServer];

  if (v4)
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We already have a setup server. Tearing down...", buf, 2u);
    }

    [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
  }
  id v6 = objc_alloc_init((Class)SKSetupFieldDiagnosticsServer);
  [(CBRemoteSetupManager *)self setSetupServer:v6];

  v7 = [(CBRemoteSetupManager *)self overridePin];

  if (v7)
  {
    objc_super v8 = [(CBRemoteSetupManager *)self overridePin];
    v9 = [(CBRemoteSetupManager *)self setupServer];
    [v9 setPassword:v8];

    [(CBRemoteSetupManager *)self setPreferredPasswordType:2];
  }
  uint64_t v10 = [(CBRemoteSetupManager *)self preferredPasswordType];
  v11 = [(CBRemoteSetupManager *)self setupServer];
  [v11 setPasswordType:v10];

  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  v12 = [(CBRemoteSetupManager *)self setupServer];
  [v12 setEventHandler:&v16];

  v13 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(CBRemoteSetupManager *)self setupServer];
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Beginning setup broadcast with setup server %@", buf, 0xCu);
  }
  [(CBRemoteSetupManager *)self setBroadcastingForSetup:1];
  [(CBRemoteSetupManager *)self setSetupState:2];
  v15 = [(CBRemoteSetupManager *)self setupServer];
  [v15 activate];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)endRemoteSetupBroadcast
{
  [(CBRemoteSetupManager *)self setBroadcastingForSetup:0];
  [(CBRemoteSetupManager *)self setSetupState:1];
  objc_super v3 = [(CBRemoteSetupManager *)self setupServer];

  if (v3)
  {
    v4 = [(CBRemoteSetupManager *)self setupServer];
    [v4 invalidate];

    [(CBRemoteSetupManager *)self setSetupServer:0];
  }
}

- (void)restartRemoteSetupBroadcast
{
  [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111DC;
  block[3] = &unk_1000794E0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)setOverrideAuthPin:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CBRemoteSetupManager *)self broadcastingForSetup];
  if (v4 && (v5 & 1) == 0 && [v4 length] == (id)6)
  {
    [(CBRemoteSetupManager *)self setOverridePin:v4];
    BOOL v6 = 1;
  }
  else
  {
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100048C78((uint64_t)v4, self, v7);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)sendAuthPassword:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CBRemoteSetupManager *)self broadcastingForSetup];
  BOOL v6 = CheckerBoardLogHandleForCategory();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending password %@ to SetupKit", (uint8_t *)&v9, 0xCu);
    }

    v7 = [(CBRemoteSetupManager *)self setupServer];
    id v8 = [objc_alloc((Class)SKAuthenticationResponseEvent) initWithPassword:v4];
    [v7 postEvent:v8];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100048D18(v7);
  }
}

- (void)changeDesiredAuthType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CBRemoteSetupManager *)self broadcastingForSetup])
  {
    [(CBRemoteSetupManager *)self setPreferredPasswordType:v3];
    [(CBRemoteSetupManager *)self restartRemoteSetupBroadcast];
  }
}

- (void)setupFailed
{
  uint64_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setup failed", v5, 2u);
  }

  [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CBRemoteSetupFailedNotification" object:self];
}

- (void)handleSetupEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setup server event %@", buf, 0xCu);
  }

  int v6 = [v4 eventType];
  if (v6 > 40)
  {
    if (v6 > 119)
    {
      if (v6 != 120)
      {
        if (v6 != 140)
        {
          if (v6 == 300)
          {
            v7 = CheckerBoardLogHandleForCategory();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setup server received updated configuration", buf, 2u);
            }

            [(CBRemoteSetupManager *)self _processBasicConfigFromEvent:v4];
            goto LABEL_50;
          }
          goto LABEL_46;
        }
        v23 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Setup server authentication completed", buf, 2u);
        }

        [(CBRemoteSetupManager *)self setSetupState:4];
        v12 = +[NSNotificationCenter defaultCenter];
        [v12 postNotificationName:@"CBRemoteSetupConfiguringNotification" object:self];
LABEL_43:

        goto LABEL_50;
      }
      v21 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 passwordType]);
        *(_DWORD *)buf = 138412290;
        id v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setup server wants us to respond with a password of auth type %@", buf, 0xCu);
      }
      [(CBRemoteSetupManager *)self setSetupState:3];
      v12 = +[NSNotificationCenter defaultCenter];
      CFStringRef v31 = @"type";
      v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 passwordType]);
      v32 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      CFStringRef v18 = @"CBRemoteSetupAuthenticationRequestNotification";
      goto LABEL_38;
    }
    if (v6 != 41)
    {
      if (v6 != 110) {
        goto LABEL_46;
      }
      int v9 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v4 password];
        v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 passwordType]);
        *(_DWORD *)buf = 138412546;
        id v36 = v10;
        __int16 v37 = 2112;
        v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setup server wants us to show the pin %@ with auth type %@", buf, 0x16u);
      }
      [(CBRemoteSetupManager *)self setSetupState:3];
      v12 = +[NSNotificationCenter defaultCenter];
      v33[0] = @"type";
      v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 passwordType]);
      v33[1] = @"pin";
      v34[0] = v13;
      v14 = [v4 password];
      v34[1] = v14;
      v15 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      [v12 postNotificationName:@"CBRemoteSetupAuthenticaitonDisplayNotification" object:self userInfo:v15];

      goto LABEL_39;
    }
    goto LABEL_28;
  }
  if (v6 > 29)
  {
    if (v6 == 30)
    {
LABEL_28:
      if ([(CBRemoteSetupManager *)self broadcastingForSetup]
        && (id)[(CBRemoteSetupManager *)self setupState] == (id)4)
      {
        v19 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100048D5C(v19);
        }

        [(CBRemoteSetupManager *)self setupFailed];
      }
      else if ((id)[(CBRemoteSetupManager *)self setupState] == (id)3)
      {
        [(CBRemoteSetupManager *)self setSetupState:0];
        v20 = +[NSNotificationCenter defaultCenter];
        [v20 postNotificationName:@"CBRemoteSetupCancelledNotification" object:self userInfo:0];

        [(CBRemoteSetupManager *)self restartRemoteSetupBroadcast];
      }
      goto LABEL_50;
    }
    if (v6 != 40) {
      goto LABEL_46;
    }
    uint64_t v16 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setup server has connected to a device", buf, 2u);
    }

    id v17 = [(CBRemoteSetupManager *)self overridePin];

    if (v17)
    {
      v12 = +[NSNotificationCenter defaultCenter];
      v13 = [(CBRemoteSetupManager *)self overridePin];
      v30[1] = v13;
      v14 = +[NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:2];
      CFStringRef v18 = @"CBRemoteSetupAuthenticaitonDisplayNotification";
LABEL_38:
      [v12 postNotificationName:v18 object:self userInfo:v14];
LABEL_39:

      goto LABEL_43;
    }
  }
  else
  {
    if (v6 == 10)
    {
      v24 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Setup server started";
        v26 = v24;
        uint32_t v27 = 2;
LABEL_48:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
LABEL_49:

      goto LABEL_50;
    }
    if (v6 != 20)
    {
LABEL_46:
      v24 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v28 = [v4 eventType];
        *(_DWORD *)buf = 138412546;
        id v36 = v4;
        __int16 v37 = 1024;
        LODWORD(v38) = v28;
        v25 = "Unhandled setup event %@ with type %d";
        v26 = v24;
        uint32_t v27 = 18;
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    id v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setup server is finished.", buf, 2u);
    }

    [(CBRemoteSetupManager *)self _handleSetupServerFinished];
  }
LABEL_50:
}

- (void)_processBasicConfigFromEvent:(id)a3
{
  id v4 = [a3 basicConfig];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"_locale"];
  [(CBRemoteSetupManager *)self setRemoteLocaleCode:v5];

  int v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(CBRemoteSetupManager *)self remoteLocaleCode];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Locale from basic config: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_handleSetupServerFinished
{
  uint64_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setup server finished. Checking for network reachability", buf, 2u);
  }

  [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
  id v4 = +[CPNetworkObserver sharedNetworkObserver];
  unsigned int v5 = [v4 isNetworkReachable];
  int v6 = CheckerBoardLogHandleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network is reachable. Completing remote setup flow", buf, 2u);
    }

    [(CBRemoteSetupManager *)self _handleRemoteSetupFinished];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network is unreachable. Waiting for network...", buf, 2u);
    }

    [v4 addObserver:self selector:"_reachabilityChanged:" forHostname:@"apple.com"];
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011E40;
    v9[3] = &unk_1000795E0;
    id v10 = v4;
    v11 = self;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = [v4 objectForKeyedSubscript:CPNetworkObserverReachable];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    BOOL v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Network is now reachable. Completing remote setup.", v9, 2u);
    }

    dispatch_time_t v8 = +[CPNetworkObserver sharedNetworkObserver];
    [v8 removeObserver:self];

    [(CBRemoteSetupManager *)self _handleRemoteSetupFinished];
  }
}

- (void)_handleRemoteSetupFinished
{
  uint64_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote setup completed!", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CBRemoteSetupCompletedNotification" object:self];

  [(CBRemoteSetupManager *)self endRemoteSetupBroadcast];
}

- (NSString)remoteLocaleCode
{
  return self->_remoteLocaleCode;
}

- (void)setRemoteLocaleCode:(id)a3
{
}

- (unint64_t)setupState
{
  return self->_setupState;
}

- (void)setSetupState:(unint64_t)a3
{
  self->_setupState = a3;
}

- (SKSetupFieldDiagnosticsServer)setupServer
{
  return self->_setupServer;
}

- (void)setSetupServer:(id)a3
{
}

- (BOOL)broadcastingForSetup
{
  return self->_broadcastingForSetup;
}

- (void)setBroadcastingForSetup:(BOOL)a3
{
  self->_broadcastingForSetup = a3;
}

- (NSString)overridePin
{
  return self->_overridePin;
}

- (void)setOverridePin:(id)a3
{
}

- (int)preferredPasswordType
{
  return self->_preferredPasswordType;
}

- (void)setPreferredPasswordType:(int)a3
{
  self->_preferredPasswordType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePin, 0);
  objc_storeStrong((id *)&self->_setupServer, 0);

  objc_storeStrong((id *)&self->_remoteLocaleCode, 0);
}

@end