@interface RPAngelConnectionManager
+ (id)sharedInstance;
- (BOOL)addConnection:(id)a3;
- (BOOL)isConnectingProcessAuthorized:(id)a3;
- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4;
- (RPAngelConnectionManager)init;
- (RPAngelConnectionManagerDelegate)delegate;
- (id)connectionManagerQueue;
- (void)activateMachService;
- (void)cancelRecordingCountdown;
- (void)connectToAngelWithCompletionHandler:(id)a3;
- (void)countdownInterruptWithStatus:(id)a3;
- (void)dealloc;
- (void)disableCameraPip;
- (void)dismissReactionsTipForApplication:(id)a3 bundleID:(id)a4;
- (void)enableCameraPip;
- (void)hideAndStopRecordingBanner;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)pauseCurrentSystemSession;
- (void)resumeCurrentSystemSession;
- (void)setCountdownState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showRecordingBanner;
- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)startRecordingCountdown;
- (void)stopCurrentSession;
- (void)stopRecordingCalled;
- (void)updateTimer:(id)a3;
@end

@implementation RPAngelConnectionManager

+ (id)sharedInstance
{
  if (qword_100047A38 != -1) {
    dispatch_once(&qword_100047A38, &stru_10003CEC8);
  }
  v2 = (void *)qword_100047A30;

  return v2;
}

- (RPAngelConnectionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)RPAngelConnectionManager;
  v2 = [(RPAngelConnectionManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004A2C;
    v10[3] = &unk_10003CEF0;
    v4 = v2;
    v11 = v4;
    uint64_t v5 = +[BSServiceConnectionListener listenerWithConfigurator:v10];
    publicListener = v4->_publicListener;
    v4->_publicListener = (BSServiceConnectionListener *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    connections = v4->_connections;
    v4->_connections = (NSMutableDictionary *)v7;
  }
  return v3;
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_publicListener invalidate];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_connections;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_connections objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v7)];
        [v8 invalidate];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  cameraPipViewController = self->_cameraPipViewController;
  self->_cameraPipViewController = 0;

  v10 = +[RPRemoteAlertManager sharedInstance];
  [v10 clearRemoteHandle];

  v11.receiver = self;
  v11.super_class = (Class)RPAngelConnectionManager;
  [(RPAngelConnectionManager *)&v11 dealloc];
}

- (void)activateMachService
{
}

- (id)connectionManagerQueue
{
  if (qword_100047A48 != -1) {
    dispatch_once(&qword_100047A48, &stru_10003CF10);
  }
  v2 = (void *)qword_100047A40;

  return v2;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 remoteProcess];
  unsigned __int8 v8 = [(RPAngelConnectionManager *)self isConnectingProcessAuthorized:v7];

  if (v8)
  {
    if (qword_100047A58 != -1) {
      dispatch_once(&qword_100047A58, &stru_10003CF30);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004EE0;
    v12[3] = &unk_10003CFD8;
    v12[4] = self;
    [v6 configureConnection:v12];
    v9 = [(RPAngelConnectionManager *)self connectionManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000526C;
    block[3] = &unk_10003D000;
    block[4] = self;
    id v11 = v6;
    dispatch_sync(v9, block);
  }
  else if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10002C9F4();
  }
}

- (BOOL)isConnectingProcessAuthorized:(id)a3
{
  id v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v3 bundleIdentifier];
    unsigned int v5 = [v3 pid];
    id v6 = [v3 valueForEntitlement:@"application-identifier"];
    int v10 = 136447234;
    id v11 = "-[RPAngelConnectionManager isConnectingProcessAuthorized:]";
    __int16 v12 = 1024;
    int v13 = 133;
    __int16 v14 = 2112;
    long long v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = v5;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Connection BundleID=%@ pid=%d valueFor=%@", (uint8_t *)&v10, 0x2Cu);
  }
  if ([v3 hasEntitlement:@"com.apple.private.ReplayKitAngel.client"])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v8 = [v3 bundleIdentifier];
    unsigned __int8 v7 = [v8 isEqualToString:@"com.apple.springboard"];
  }
  return v7;
}

- (BOOL)addConnection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4 || ([v4 remoteToken], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v7 = [v5 remoteToken];
  unsigned __int8 v8 = [v7 valueForEntitlement:@"application-identifier"];

  if (!v8)
  {
    if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002CA80();
    }
    goto LABEL_11;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446978;
    __int16 v12 = "-[RPAngelConnectionManager addConnection:]";
    __int16 v13 = 1024;
    int v14 = 141;
    __int16 v15 = 2048;
    __int16 v16 = v5;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d adding connection=%p identifer=%@", (uint8_t *)&v11, 0x26u);
  }
  [(NSMutableDictionary *)self->_connections setObject:v5 forKeyedSubscript:v8];

  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)showRecordingBanner
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelConnectionManager showRecordingBanner]";
    __int16 v5 = 1024;
    int v6 = 154;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  [(RPAngelConnectionManagerDelegate *)self->_delegate startRecording];
}

- (void)stopRecordingCalled
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelConnectionManager stopRecordingCalled]";
    __int16 v5 = 1024;
    int v6 = 159;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  [(RPAngelConnectionManagerDelegate *)self->_delegate didTapStopButton];
}

- (void)hideAndStopRecordingBanner
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelConnectionManager hideAndStopRecordingBanner]";
    __int16 v5 = 1024;
    int v6 = 164;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  [(RPSessionProxy *)v2 finish];
}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(id, void))a6;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446722;
    __int16 v18 = "-[RPAngelConnectionManager showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
    __int16 v19 = 1024;
    int v20 = 170;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d sessionID=%@", (uint8_t *)&v17, 0x1Cu);
  }
  int v14 = objc_alloc_init(RPSessionProxy);
  __int16 v15 = [(RPSessionProxy *)v14 currentSessionID];
  if (self->_delegate && [v12 isEqualToString:v15])
  {
    [(RPAngelConnectionManagerDelegate *)self->_delegate showSavedToPhotosBannerWithPhotosURL:v10 identifier:v11 sessionID:v12];
    v13[2](v13, 0);
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446722;
      __int16 v18 = "-[RPAngelConnectionManager showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
      __int16 v19 = 1024;
      int v20 = 177;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d saved to photos completed when session has finished, currentSessionID=%@", (uint8_t *)&v17, 0x1Cu);
    }
    __int16 v16 = +[NSError _rpUserErrorForCode:-5800 userInfo:0];
    ((void (**)(id, void *))v13)[2](v13, v16);
  }
}

- (void)updateTimer:(id)a3
{
  id v4 = a3;
  if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[RPAngelConnectionManager updateTimer:]";
    __int16 v7 = 1024;
    int v8 = 184;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPAngelConnectionManagerDelegate *)self->_delegate updateTimer:v4];
}

- (void)startRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelConnectionManager startRecordingCountdown]";
    __int16 v5 = 1024;
    int v6 = 189;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  [(RPSessionProxy *)v2 start];
}

- (void)cancelRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelConnectionManager cancelRecordingCountdown]";
    __int16 v5 = 1024;
    int v6 = 195;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  [(RPSessionProxy *)v2 finish];
}

- (void)connectToAngelWithCompletionHandler:(id)a3
{
  int v3 = (void (**)(id, void *, void))a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int16 v7 = "-[RPAngelConnectionManager connectToAngelWithCompletionHandler:]";
    __int16 v8 = 1024;
    int v9 = 201;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v4 = objc_alloc_init(RPSessionProxy);
  __int16 v5 = [(RPSessionProxy *)v4 currentSessionID];
  v3[2](v3, v5, 0);
}

- (void)setCountdownState:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[RPAngelConnectionManager setCountdownState:]";
    __int16 v7 = 1024;
    int v8 = 207;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPAngelConnectionManagerDelegate *)self->_delegate setCountdownState:v4];
}

- (void)enableCameraPip
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v5 = "-[RPAngelConnectionManager enableCameraPip]";
    __int16 v6 = 1024;
    int v7 = 213;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060EC;
  block[3] = &unk_10003D028;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)disableCameraPip
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v5 = "-[RPAngelConnectionManager disableCameraPip]";
    __int16 v6 = 1024;
    int v7 = 225;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006344;
  block[3] = &unk_10003D028;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[RPAngelConnectionManager showReactionsTipForApplication:bundleID:]";
    __int16 v12 = 1024;
    int v13 = 233;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v10, 0x12u);
  }
  int v7 = +[RPRemoteAlertManager sharedInstance];
  unsigned __int8 v8 = [v7 createRemoteHandleForApplication:v5 bundleID:v6];

  return v8;
}

- (void)dismissReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPAngelConnectionManager dismissReactionsTipForApplication:bundleID:]";
    __int16 v10 = 1024;
    int v11 = 238;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  int v7 = +[RPRemoteAlertManager sharedInstance];
  [v7 clearRemoteHandle];
}

- (void)stopCurrentSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager stopCurrentSession]";
    __int16 v7 = 1024;
    int v8 = 245;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  int v3 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:@"com.apple.springboard"];
  id v4 = [v3 remoteTarget];

  if (v4)
  {
    [v4 stopCurrentSession];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager stopCurrentSession]";
    __int16 v7 = 1024;
    int v8 = 250;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }
}

- (void)countdownInterruptWithStatus:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPAngelConnectionManager countdownInterruptWithStatus:]";
    __int16 v9 = 1024;
    int v10 = 255;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  int v5 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:@"com.apple.springboard"];
  id v6 = [v5 remoteTarget];

  if (v6)
  {
    [v6 countdownInterruptWithStatus:v4];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPAngelConnectionManager countdownInterruptWithStatus:]";
    __int16 v9 = 1024;
    int v10 = 260;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v7, 0x12u);
  }
}

- (void)pauseCurrentSystemSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager pauseCurrentSystemSession]";
    __int16 v7 = 1024;
    int v8 = 266;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  int v3 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:@"com.apple.replayd"];
  id v4 = [v3 remoteTarget];

  if (v4)
  {
    [v4 pauseCurrentSystemSession];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager pauseCurrentSystemSession]";
    __int16 v7 = 1024;
    int v8 = 271;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }
}

- (void)resumeCurrentSystemSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager resumeCurrentSystemSession]";
    __int16 v7 = 1024;
    int v8 = 276;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  int v3 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:@"com.apple.replayd"];
  id v4 = [v3 remoteTarget];

  if (v4)
  {
    [v4 resumeCurrentSystemSession];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPAngelConnectionManager resumeCurrentSystemSession]";
    __int16 v7 = 1024;
    int v8 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }
}

- (RPAngelConnectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_cameraPipViewController, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionManagerQueue, 0);

  objc_storeStrong((id *)&self->_publicListener, 0);
}

@end