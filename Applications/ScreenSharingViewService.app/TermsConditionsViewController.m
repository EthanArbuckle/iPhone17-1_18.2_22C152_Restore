@interface TermsConditionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isAppleSupportRequest;
- (BOOL)shareSettingsRequest;
- (BOOL)userInfoSet;
- (NSXPCConnection)helperToolConnection;
- (NSXPCInterface)helperToolBackChannelInterface;
- (TermsConditionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIImageView)termsIcon;
- (UILabel)termsHeaderTextView;
- (UILabel)termsSubHeaderTextView;
- (UITextView)termsTextView;
- (UIToolbar)toolbar;
- (id)helperTool;
- (unint64_t)supportedInterfaceOrientations;
- (void)agree:(id)a3;
- (void)decline:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)postResultNotification:(BOOL)a3;
- (void)setHelperTool:(id)a3;
- (void)setHelperToolBackChannelInterface:(id)a3;
- (void)setHelperToolConnection:(id)a3;
- (void)setIsAppleSupportRequest:(BOOL)a3;
- (void)setShareSettingsRequest:(BOOL)a3;
- (void)setTermsHeaderTextView:(id)a3;
- (void)setTermsIcon:(id)a3;
- (void)setTermsSubHeaderTextView:(id)a3;
- (void)setTermsTextView:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoSet:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TermsConditionsViewController

- (TermsConditionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TermsConditionsViewController;
  v8 = [(TermsConditionsViewController *)&v23 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    if (qword_10000D750 != -1) {
      dispatch_once(&qword_10000D750, &stru_1000082B8);
    }
    id v9 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ScreenSharingViewServiceHelper" options:0];
    [(TermsConditionsViewController *)v8 setHelperToolConnection:v9];

    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ViewServiceProtocol];
    v11 = [(TermsConditionsViewController *)v8 helperToolConnection];
    [v11 setRemoteObjectInterface:v10];

    v12 = v8;
    v22 = v12;
    v13 = [(TermsConditionsViewController *)v12 helperToolConnection];
    [v13 setInvalidationHandler:&v21];

    v14 = [(TermsConditionsViewController *)v12 helperToolConnection];
    [v14 resume];

    v15 = [(TermsConditionsViewController *)v12 helperToolConnection];
    v16 = [v15 remoteObjectProxyWithErrorHandler:&stru_1000082D8];
    [(TermsConditionsViewController *)v12 setHelperTool:v16];

    v17 = [(TermsConditionsViewController *)v12 helperTool];
    CFStringRef v24 = @"pid";
    v18 = +[NSNumber numberWithInt:getpid()];
    v25 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v17 pidNotification:v19];
  }
  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (byte_10000D758 != 1) {
    return 2;
  }
  v3.receiver = self;
  v3.super_class = (Class)TermsConditionsViewController;
  return [(TermsConditionsViewController *)&v3 supportedInterfaceOrientations];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)TermsConditionsViewController;
  [(TermsConditionsViewController *)&v20 viewWillAppear:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(TermsConditionsViewController *)self userInfoSet];
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewWillAppear  self.userInfoSet %d", buf, 8u);
  }
  unsigned int v5 = [(TermsConditionsViewController *)self shareSettingsRequest];
  id v6 = +[NSBundle mainBundle];
  id v7 = v6;
  if (v5) {
    CFStringRef v8 = @"kSSGatherSettingsTerms";
  }
  else {
    CFStringRef v8 = @"KSSShareScreenTerms";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_100008398 table:0];

  v10 = [(TermsConditionsViewController *)self termsSubHeaderTextView];
  [v10 setText:v9];

  unsigned int v11 = [(TermsConditionsViewController *)self isAppleSupportRequest];
  v12 = +[NSBundle mainBundle];
  v13 = v12;
  if (v11) {
    CFStringRef v14 = @"kSSAppleSupportHeader";
  }
  else {
    CFStringRef v14 = @"kSSAppleCareHeader";
  }
  if (v11) {
    CFStringRef v15 = @"AppleSupport64";
  }
  else {
    CFStringRef v15 = @"AppleCare64";
  }
  v16 = [v12 localizedStringForKey:v14 value:&stru_100008398 table:0];

  v17 = +[UIImage imageNamed:v15];
  v18 = [(TermsConditionsViewController *)self termsHeaderTextView];
  [v18 setText:v16];

  v19 = [(TermsConditionsViewController *)self termsIcon];
  [v19 setImage:v17];

  [(TermsConditionsViewController *)self traitCollectionDidChange:0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)TermsConditionsViewController;
  [(TermsConditionsViewController *)&v9 viewDidLoad];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "view did load", buf, 2u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [(TermsConditionsViewController *)self userInfoSet];
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.userInfoSet %d", buf, 8u);
  }
  unsigned int v4 = +[NSBundle mainBundle];
  unsigned int v5 = [v4 pathForResource:@"TermsConditions" ofType:@"txt"];

  if (v5)
  {
    id v6 = +[NSString stringWithContentsOfFile:v5 encoding:4 error:0];
    id v7 = [(TermsConditionsViewController *)self termsTextView];
    [v7 setText:v6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No T&C - assume decline", buf, 2u);
    }
    [(TermsConditionsViewController *)self postResultNotification:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003DF8;
  block[3] = &unk_100008210;
  block[4] = self;
  if (qword_10000D760 != -1) {
    dispatch_once(&qword_10000D760, block);
  }
  [(TermsConditionsViewController *)self traitCollectionDidChange:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TermsConditionsViewController;
  [(TermsConditionsViewController *)&v6 viewDidAppear:a3];
  unsigned int v4 = [(TermsConditionsViewController *)self termsTextView];
  [v4 setContentOffset:CGPointZero animated:0];

  unsigned int v5 = [(TermsConditionsViewController *)self termsTextView];
  [v5 scrollRangeToVisible:0, 0];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)TermsConditionsViewController;
  [(TermsConditionsViewController *)&v2 didReceiveMemoryWarning];
}

- (void)traitCollectionDidChange:(id)a3
{
  unsigned int v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v4 pointSize];
  double v6 = v5;

  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v7 pointSize];
  double v9 = v8;

  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v10 pointSize];
  double v12 = v11;

  if (byte_10000D758) {
    double v13 = 36.0;
  }
  else {
    double v13 = 20.0;
  }
  if (byte_10000D758) {
    double v14 = 33.0;
  }
  else {
    double v14 = 18.0;
  }
  CFStringRef v15 = +[UIFont systemFontOfSize:v6 weight:UIFontWeightSemibold];
  v16 = [(TermsConditionsViewController *)self termsHeaderTextView];
  [v16 setFont:v15];

  if (v9 <= v13) {
    double v17 = v9;
  }
  else {
    double v17 = v13;
  }
  v18 = [(TermsConditionsViewController *)self termsSubHeaderTextView];
  v19 = [v18 font];
  objc_super v20 = [v19 fontWithSize:v17];
  uint64_t v21 = [(TermsConditionsViewController *)self termsSubHeaderTextView];
  [v21 setFont:v20];

  if (v12 > v14) {
    double v12 = v14;
  }
  id v25 = [(TermsConditionsViewController *)self termsTextView];
  unsigned int v22 = [v25 font];
  objc_super v23 = [v22 fontWithSize:v12];
  CFStringRef v24 = [(TermsConditionsViewController *)self termsTextView];
  [v24 setFont:v23];
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userinfo called with %@", (uint8_t *)&v17, 0xCu);
  }
  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"isShareSettings"];
    if (v5)
    {
      double v6 = (void *)v5;
      id v7 = [v4 objectForKeyedSubscript:@"isShareSettings"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v9 = [v4 objectForKeyedSubscript:@"isShareSettings"];
        -[TermsConditionsViewController setShareSettingsRequest:](self, "setShareSettingsRequest:", [v9 BOOLValue]);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v10 = [(TermsConditionsViewController *)self shareSettingsRequest];
          int v17 = 67109120;
          LODWORD(v18) = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Share settings %d", (uint8_t *)&v17, 8u);
        }
      }
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
    if (v11)
    {
      double v12 = (void *)v11;
      double v13 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if (v14)
      {
        CFStringRef v15 = [v4 objectForKeyedSubscript:@"isAppleSupportRequest"];
        -[TermsConditionsViewController setIsAppleSupportRequest:](self, "setIsAppleSupportRequest:", [v15 BOOLValue]);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v16 = [(TermsConditionsViewController *)self isAppleSupportRequest];
          int v17 = 67109120;
          LODWORD(v18) = v16;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Support %d", (uint8_t *)&v17, 8u);
        }
      }
    }
    [(TermsConditionsViewController *)self setUserInfoSet:1];
  }
}

- (void)postResultNotification:(BOOL)a3
{
  CFStringRef v8 = @"result";
  id v4 = +[NSNumber numberWithBool:a3];
  double v9 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  double v6 = [(TermsConditionsViewController *)self helperTool];
  sub_10000346C(v6, v5);

  id v7 = [(TermsConditionsViewController *)self helperToolConnection];
  [v7 invalidate];

  exit(0);
}

- (void)agree:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user agreed to T&C", v4, 2u);
  }
  [(TermsConditionsViewController *)self postResultNotification:1];
}

- (void)decline:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user declined T&C", v4, 2u);
  }
  [(TermsConditionsViewController *)self postResultNotification:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSXPCConnection)helperToolConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHelperToolConnection:(id)a3
{
}

- (id)helperTool
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHelperTool:(id)a3
{
}

- (UILabel)termsHeaderTextView
{
  return self->_termsHeaderTextView;
}

- (void)setTermsHeaderTextView:(id)a3
{
  self->_termsHeaderTextView = (UILabel *)a3;
}

- (UILabel)termsSubHeaderTextView
{
  return self->_termsSubHeaderTextView;
}

- (void)setTermsSubHeaderTextView:(id)a3
{
  self->_termsSubHeaderTextView = (UILabel *)a3;
}

- (UITextView)termsTextView
{
  return self->_termsTextView;
}

- (void)setTermsTextView:(id)a3
{
  self->_termsTextView = (UITextView *)a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  self->_toolbar = (UIToolbar *)a3;
}

- (BOOL)isAppleSupportRequest
{
  return self->_isAppleSupportRequest;
}

- (void)setIsAppleSupportRequest:(BOOL)a3
{
  self->_isAppleSupportRequest = a3;
}

- (UIImageView)termsIcon
{
  return self->_termsIcon;
}

- (void)setTermsIcon:(id)a3
{
  self->_termsIcon = (UIImageView *)a3;
}

- (NSXPCInterface)helperToolBackChannelInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHelperToolBackChannelInterface:(id)a3
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

- (BOOL)shareSettingsRequest
{
  return self->_shareSettingsRequest;
}

- (void)setShareSettingsRequest:(BOOL)a3
{
  self->_shareSettingsRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperToolBackChannelInterface, 0);
  objc_storeStrong(&self->helperTool, 0);

  objc_storeStrong((id *)&self->helperToolConnection, 0);
}

@end