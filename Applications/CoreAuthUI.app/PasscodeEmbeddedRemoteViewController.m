@interface PasscodeEmbeddedRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (BOOL)verifyPasscode:(id)a3;
- (double)_backoffTimeout;
- (void)_dispatchBackoffTimer;
- (void)_notifyPasscodeVerificationFinishedWithSuccess:(BOOL)a3;
- (void)endEditing;
- (void)setContext:(id)a3;
- (void)startEditing;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasscodeEmbeddedRemoteViewController

+ (id)_exportedInterface
{
  if (qword_10009E2C0 != -1) {
    dispatch_once(&qword_10009E2C0, &stru_100086AC8);
  }
  v2 = (void *)qword_10009E2C8;

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_10009E2D0 != -1) {
    dispatch_once(&qword_10009E2D0, &stru_100086AE8);
  }
  v2 = (void *)qword_10009E2D8;

  return v2;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (void)setContext:(id)a3
{
  v4 = (NSData *)a3;
  v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[PasscodeEmbeddedRemoteViewController setContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  externalizedContext = self->_externalizedContext;
  self->_externalizedContext = v4;
}

- (void)startEditing
{
  [(PasscodeEmbeddedRemoteViewController *)self _backoffTimeout];
  if (v3 == 0.0)
  {
    [(PasscodeEmbeddedViewController *)self setPasscodeFocused:1];
  }
}

- (void)endEditing
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PasscodeEmbeddedRemoteViewController;
  [(PasscodeEmbeddedRemoteViewController *)&v6 viewWillAppear:a3];
  [(PasscodeEmbeddedRemoteViewController *)self _backoffTimeout];
  if (v4 > 0.0)
  {
    double v5 = v4;
    [(PasscodeEmbeddedRemoteViewController *)self _dispatchBackoffTimer];
    [(PasscodeEmbeddedViewController *)self setBackoffTimeout:v5];
  }
}

- (BOOL)verifyPasscode:(id)a3
{
  id v4 = a3;
  double v5 = +[LACSecureData secureDataWithString:v4];
  objc_super v6 = +[LAPasscodeHelper sharedInstance];
  externalizedContext = self->_externalizedContext;
  v8 = +[NSNumber numberWithUnsignedInt:getuid()];
  id v9 = [v6 verifyPasswordUsingAKS:v5 acmContext:externalizedContext userId:v8 policy:0 options:&__NSDictionary0__struct bioLockoutRecovery:0];

  [v5 reset];
  if (v9)
  {
    if (v9 == (id)2)
    {
      [(PasscodeEmbeddedRemoteViewController *)self _backoffTimeout];
      [(PasscodeEmbeddedViewController *)self setBackoffTimeout:"setBackoffTimeout:"];
      [(PasscodeEmbeddedRemoteViewController *)self _dispatchBackoffTimer];
    }
    [(PasscodeEmbeddedRemoteViewController *)self _notifyPasscodeVerificationFinishedWithSuccess:0];
  }
  else
  {
    id v10 = [objc_alloc((Class)LAContext) initWithExternalizedContext:self->_externalizedContext];
    v11 = [v4 dataUsingEncoding:4];
    [v10 setCredential:v11 forProcessedEvent:2 credentialType:-1 reply:&stru_100086B28];

    [(PasscodeEmbeddedRemoteViewController *)self _notifyPasscodeVerificationFinishedWithSuccess:1];
  }

  return v9 == 0;
}

- (void)_notifyPasscodeVerificationFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PasscodeEmbeddedRemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100086B68];
  double v5 = v4;
  if (v3)
  {
    [v4 passcodeVerificationFinished:0];
  }
  else
  {
    NSErrorUserInfoKey v8 = NSDebugDescriptionErrorKey;
    CFStringRef v9 = @"Passcode verification failed";
    objc_super v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    int v7 = +[NSError errorWithDomain:&stru_100088CF0 code:-1 userInfo:v6];
    [v5 passcodeVerificationFinished:v7];
  }
}

- (void)_dispatchBackoffTimer
{
  backoffTimer = self->_backoffTimer;
  if (backoffTimer)
  {
    dispatch_source_cancel(backoffTimer);
    id v4 = self->_backoffTimer;
    self->_backoffTimer = 0;
  }
  double v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
  objc_super v6 = self->_backoffTimer;
  self->_backoffTimer = v5;

  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_backoffTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  NSErrorUserInfoKey v8 = self->_backoffTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024F20;
  v9[3] = &unk_1000860D8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_activate((dispatch_object_t)self->_backoffTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (double)_backoffTimeout
{
  v2 = (void *)MKBGetDeviceLockStateInfo();
  BOOL v3 = [v2 objectForKey:kMKBInfoBackOff];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);

  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end