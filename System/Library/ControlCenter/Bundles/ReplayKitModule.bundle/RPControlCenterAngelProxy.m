@interface RPControlCenterAngelProxy
+ (id)sharedInstance;
- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4;
- (RPControlCenterAngelProxy)init;
- (RPControlCenterAngelProxyDelegate)delegate;
- (id)connectionManagerQueue;
- (id)getBSServiceInterface;
- (void)cancelRecordingCountdown;
- (void)countdownInterruptWithStatus:(id)a3;
- (void)hideAndStopRecordingBanner;
- (void)setCountdownState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupConnection;
- (void)showRecordingBanner;
- (void)startRecordingCountdown;
- (void)stopCurrentSession;
- (void)stopRecordingCalled;
@end

@implementation RPControlCenterAngelProxy

+ (id)sharedInstance
{
  if (qword_23F38 != -1) {
    dispatch_once(&qword_23F38, &stru_1C9A8);
  }
  v2 = (void *)qword_23F30;

  return v2;
}

- (id)connectionManagerQueue
{
  if (qword_23F48 != -1) {
    dispatch_once(&qword_23F48, &stru_1C9C8);
  }
  v2 = (void *)qword_23F40;

  return v2;
}

- (id)getBSServiceInterface
{
  if (qword_23F58 != -1) {
    dispatch_once(&qword_23F58, &stru_1C9E8);
  }
  v2 = (void *)qword_23F50;

  return v2;
}

- (RPControlCenterAngelProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterAngelProxy;
  v2 = [(RPControlCenterAngelProxy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RPControlCenterAngelProxy *)v2 setupConnection];
  }
  return v3;
}

- (void)setupConnection
{
  v3 = +[BSServiceConnectionEndpoint endpointForMachName:@"com.apple.ReplayKitAngel.mach" service:@"com.apple.ReplayKitAngel.session" instance:0];
  if (v3)
  {
    v4 = +[BSServiceConnection connectionWithEndpoint:v3];
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10CB8;
    v7[3] = &unk_1CA78;
    v7[4] = self;
    [(BSServiceConnectionClient *)v6 configureConnection:v7];
    [(BSServiceConnectionClient *)self->_connection activate];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy setupConnection]";
    __int16 v10 = 1024;
    int v11 = 106;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel endpoint nil", buf, 0x12u);
  }
}

- (void)startRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 112;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 startRecordingCountdown];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 119;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)setCountdownState:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    __int16 v12 = 1024;
    int v13 = 124;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v6 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  v8 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v7];

  if (v8)
  {
    [v8 setCountdownState:v4];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    __int16 v12 = 1024;
    int v13 = 131;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)cancelRecordingCountdown
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 136;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 cancelRecordingCountdown];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 143;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)showRecordingBanner
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 148;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 showRecordingBanner];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 155;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)stopRecordingCalled
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    __int16 v10 = 1024;
    int v11 = 160;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 stopRecordingCalled];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    __int16 v10 = 1024;
    int v11 = 167;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)hideAndStopRecordingBanner
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 172;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 hideAndStopRecordingBanner];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 179;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    __int16 v16 = 1024;
    int v17 = 184;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v9 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  int v13 = v9;
  __int16 v10 = +[NSArray arrayWithObjects:&v13 count:1];
  int v11 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v10];

  if (v11)
  {
    [v11 showReactionsTipForApplication:v6 bundleID:v7];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    __int16 v16 = 1024;
    int v17 = 191;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

  return v11 != 0;
}

- (void)stopCurrentSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    objc_super v5 = "-[RPControlCenterAngelProxy stopCurrentSession]";
    __int16 v6 = 1024;
    int v7 = 199;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate) {
    [(RPControlCenterAngelProxyDelegate *)delegate stopCurrentSession];
  }
}

- (void)countdownInterruptWithStatus:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPControlCenterAngelProxy countdownInterruptWithStatus:]";
    __int16 v8 = 1024;
    int v9 = 208;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate) {
    [(RPControlCenterAngelProxyDelegate *)delegate countdownInterruptWithStatus:v4];
  }
}

- (RPControlCenterAngelProxyDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end