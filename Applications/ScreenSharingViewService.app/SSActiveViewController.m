@interface SSActiveViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isAppleSupportRequest;
- (BOOL)userInfoSet;
- (NSNumber)isPausedNumber;
- (NSNumber)isScreenLockedNumber;
- (NSString)viewerName;
- (NSXPCConnection)helperToolConnection;
- (NSXPCInterface)helperToolBackChannelInterface;
- (SSActiveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)helperTool;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)sendResultAndTerminate:(int)a3;
- (void)setHelperTool:(id)a3;
- (void)setHelperToolBackChannelInterface:(id)a3;
- (void)setHelperToolConnection:(id)a3;
- (void)setIsAppleSupportRequest:(BOOL)a3;
- (void)setIsPausedNumber:(id)a3;
- (void)setIsScreenLockedNumber:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoSet:(BOOL)a3;
- (void)setViewerName:(id)a3;
- (void)showControls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SSActiveViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (SSActiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v22.receiver = self;
  v22.super_class = (Class)SSActiveViewController;
  v9 = [(SSActiveViewController *)&v22 initWithNibName:@"SSActiveViewController2" bundle:v8];

  if (v9)
  {
    id v10 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ScreenSharingViewServiceHelper" options:0];
    [(SSActiveViewController *)v9 setHelperToolConnection:v10];

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ViewServiceProtocol];
    v12 = [(SSActiveViewController *)v9 helperToolConnection];
    [v12 setRemoteObjectInterface:v11];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000026FC;
    v20[3] = &unk_100008210;
    v13 = v9;
    v21 = v13;
    v14 = [(SSActiveViewController *)v13 helperToolConnection];
    [v14 setInvalidationHandler:v20];

    v15 = [(SSActiveViewController *)v13 helperToolConnection];
    [v15 resume];

    v16 = [(SSActiveViewController *)v13 helperToolConnection];
    v17 = [v16 remoteObjectProxyWithErrorHandler:&stru_100008250];
    [(SSActiveViewController *)v13 setHelperTool:v17];

    v18 = [(SSActiveViewController *)v13 helperTool];
    sub_100002318(v18);
  }
  return v9;
}

- (void)dealloc
{
  [(SSActiveViewController *)self setHelperToolConnection:0];
  [(SSActiveViewController *)self setHelperToolBackChannelInterface:0];
  [(SSActiveViewController *)self setHelperTool:0];
  [(SSActiveViewController *)self setViewerName:0];
  v3.receiver = self;
  v3.super_class = (Class)SSActiveViewController;
  [(SSActiveViewController *)&v3 dealloc];
}

- (void)showControls
{
  objc_super v3 = [(SSActiveViewController *)self isPausedNumber];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"kSSScreenSharingPaused" value:&stru_100008398 table:0];
    id v7 = 0;
  }
  else
  {
    v8 = [(SSActiveViewController *)self viewerName];

    if (v8)
    {
      id v7 = [(SSActiveViewController *)self viewerName];
    }
    else
    {
      v9 = +[NSBundle mainBundle];
      id v7 = [v9 localizedStringForKey:@"kSSAppleCare" value:&stru_100008398 table:0];
    }
    v5 = +[NSBundle mainBundle];
    id v10 = [v5 localizedStringForKey:@"kSSviewingScreen" value:&stru_100008398 table:0];
    v11 = [(SSActiveViewController *)self viewerName];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
  }
  v12 = +[UIAlertController alertControllerWithTitle:v7 message:v6 preferredStyle:1];
  v13 = [(SSActiveViewController *)self isPausedNumber];
  unsigned int v14 = [v13 BOOLValue];

  if (!v14)
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"kSSPauseScreenSharing" value:&stru_100008398 table:0];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100002D00;
    v32[3] = &unk_100008278;
    v32[4] = self;
    v19 = v32;
    goto LABEL_11;
  }
  v15 = [(SSActiveViewController *)self isScreenLockedNumber];
  unsigned __int8 v16 = [v15 BOOLValue];

  if ((v16 & 1) == 0)
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"kSSResumeScreenSharing" value:&stru_100008398 table:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100002CF4;
    v33[3] = &unk_100008278;
    v33[4] = self;
    v19 = v33;
LABEL_11:
    v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v19];
    [v12 addAction:v20];
  }
  v21 = +[NSBundle mainBundle];
  objc_super v22 = [v21 localizedStringForKey:@"kSSCancel" value:&stru_100008398 table:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100002D0C;
  v31[3] = &unk_100008278;
  v31[4] = self;
  v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v31];
  [v12 addAction:v23];

  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"kSSEndScreenSharing" value:&stru_100008398 table:0];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100002D18;
  v30[3] = &unk_100008278;
  v30[4] = self;
  v26 = +[UIAlertAction actionWithTitle:v25 style:2 handler:v30];
  [v12 addAction:v26];

  v27 = [(SSActiveViewController *)self popoverPresentationController];
  v28 = [(SSActiveViewController *)self view];
  [v27 setSourceView:v28];

  v29 = [(SSActiveViewController *)self view];
  [v29 bounds];
  [v27 setSourceRect:];

  [(SSActiveViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SSActiveViewController;
  [(SSActiveViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSActiveViewController;
  [(SSActiveViewController *)&v4 viewDidAppear:a3];
  if ([(SSActiveViewController *)self userInfoSet]) {
    [(SSActiveViewController *)self showControls];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)SSActiveViewController;
  [(SSActiveViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setUserInfo begin", (uint8_t *)&v19, 2u);
  }
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"isPaused"];

    if (v5)
    {
      id v6 = [v4 objectForKeyedSubscript:@"isPaused"];
      [(SSActiveViewController *)self setIsPausedNumber:v6];
    }
    id v7 = [v4 objectForKeyedSubscript:@"isScreenLocked"];

    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"isScreenLocked"];
      [(SSActiveViewController *)self setIsScreenLockedNumber:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"viewerName"];

    if (v9)
    {
      id v10 = [v4 objectForKeyedSubscript:@"viewerName"];
      [(SSActiveViewController *)self setViewerName:v10];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(SSActiveViewController *)self viewerName];
        id v12 = [v11 UTF8String];
        int v19 = 136315138;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****set viewer name %s", (uint8_t *)&v19, 0xCu);
      }
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
    if (v13)
    {
      unsigned int v14 = (void *)v13;
      v15 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v17 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
        -[SSActiveViewController setIsAppleSupportRequest:](self, "setIsAppleSupportRequest:", [v17 BOOLValue]);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v18 = [(SSActiveViewController *)self isAppleSupportRequest];
          int v19 = 67109120;
          LODWORD(v20) = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Support %d", (uint8_t *)&v19, 8u);
        }
      }
    }
    [(SSActiveViewController *)self setUserInfoSet:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userInfo:%@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)sendResultAndTerminate:(int)a3
{
  CFStringRef v8 = @"result";
  id v4 = +[NSNumber numberWithInteger:a3];
  v9 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  id v6 = [(SSActiveViewController *)self helperTool];
  sub_100002444(v6, v5);

  [(NSXPCConnection *)self->helperToolConnection invalidate];
  id v7 = +[UIApplication sharedApplication];
  [v7 terminateWithSuccess];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSNumber)isPausedNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIsPausedNumber:(id)a3
{
}

- (NSNumber)isScreenLockedNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIsScreenLockedNumber:(id)a3
{
}

- (NSXPCConnection)helperToolConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHelperToolConnection:(id)a3
{
}

- (id)helperTool
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHelperTool:(id)a3
{
}

- (BOOL)userInfoSet
{
  return self->_userInfoSet;
}

- (void)setUserInfoSet:(BOOL)a3
{
  self->_userInfoSet = a3;
}

- (BOOL)isAppleSupportRequest
{
  return self->_isAppleSupportRequest;
}

- (void)setIsAppleSupportRequest:(BOOL)a3
{
  self->_isAppleSupportRequest = a3;
}

- (NSXPCInterface)helperToolBackChannelInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHelperToolBackChannelInterface:(id)a3
{
}

- (NSString)viewerName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setViewerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewerName, 0);
  objc_storeStrong((id *)&self->_helperToolBackChannelInterface, 0);
  objc_storeStrong(&self->helperTool, 0);
  objc_storeStrong((id *)&self->helperToolConnection, 0);
  objc_storeStrong((id *)&self->isScreenLockedNumber, 0);

  objc_storeStrong((id *)&self->isPausedNumber, 0);
}

@end