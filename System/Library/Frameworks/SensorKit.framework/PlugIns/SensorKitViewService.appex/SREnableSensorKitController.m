@interface SREnableSensorKitController
+ (void)initialize;
- (BOOL)migrationMode;
- (NSArray)services;
- (NSBundle)appBundle;
- (SRAuthorizationStore)authStore;
- (SRAuthorizationTableDelegate)delegate;
- (void)cancelPrompt;
- (void)dealloc;
- (void)openSettings:(id)a3;
- (void)postFollowUpWithCompletionHandler:(id)a3;
- (void)prerequesiteNotificationReceived;
- (void)registerForPrerequisitesUpdated;
- (void)setAppBundle:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMigrationMode:(BOOL)a3;
- (void)setServices:(id)a3;
- (void)unregisterForPrerequisitesUpdated;
- (void)viewDidLoad;
@end

@implementation SREnableSensorKitController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000161E8 = (uint64_t)os_log_create("com.apple.SensorKit", "SREnableSensorKitController");
  }
}

- (void)dealloc
{
  [(SREnableSensorKitController *)self unregisterForPrerequisitesUpdated];

  [(SREnableSensorKitController *)self setAuthStore:0];
  v3.receiver = self;
  v3.super_class = (Class)SREnableSensorKitController;
  [(SREnableSensorKitController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SREnableSensorKitController;
  [(SREnableSensorKitController *)&v4 viewDidLoad];
  objc_msgSend(-[SREnableSensorKitController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 26), 0, self, "cancelPrompt"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005150;
  v3[3] = &unk_100010458;
  v3[4] = self;
  [(SREnableSensorKitController *)self postFollowUpWithCompletionHandler:v3];
}

- (void)postFollowUpWithCompletionHandler:(id)a3
{
  id v5 = objc_alloc_init((Class)FLFollowUpItem);
  [v5 setUniqueIdentifier:SRFollowUpEnableSKIdentifier];
  [v5 setGroupIdentifier:FLGroupIdentifierDevice];
  [v5 setTargetBundleIdentifier:FLFollowUpPreferencesBundleIdentifier];
  objc_msgSend(v5, "setTitle:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 68));
  objc_msgSend(v5, "setInformativeText:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 69));
  CFStringRef v13 = @"bundlePath";
  v14 = [(NSBundle *)[(SREnableSensorKitController *)self appBundle] bundlePath];
  objc_msgSend(v5, "setUserInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v6 = qword_1000161E8;
  if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v12 = [(NSBundle *)[(SREnableSensorKitController *)self appBundle] bundlePath];
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Posting follow up for bundle path %{public}@", buf, 0xCu);
  }
  v10 = +[FLFollowUpAction actionWithLabel:url:](FLFollowUpAction, "actionWithLabel:url:", +[NSString srui_localizedStringForCode:70], sub_100003608());
  objc_msgSend(v5, "setActions:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000054A4;
  v7[3] = &unk_100010480;
  id v8 = objc_alloc_init((Class)SRFollowUp);
  id v9 = a3;
  [v8 postFollowUpItem:v5 completion:v7];
}

- (void)openSettings:(id)a3
{
  [(SREnableSensorKitController *)self registerForPrerequisitesUpdated];
  uint64_t v5 = 0;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openSensitiveURL:withOptions:error:", +[NSURL URLWithString:](NSURL, "URLWithString:", objc_msgSend(FLFollowUpPreferencesUrlPrefix, "stringByAppendingString:", SRFollowUpEnableSKIdentifier)), 0, &v5);
  uint64_t v3 = v5;
  if (v5)
  {
    objc_super v4 = qword_1000161E8;
    if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Failed to open settings because %{public}@", buf, 0xCu);
    }
  }
}

- (void)cancelPrompt
{
  v2 = [(SREnableSensorKitController *)self delegate];
  [(SRAuthorizationTableDelegate *)v2 authorizationTable:0 foundIssueWithApp:+[NSError errorWithDomain:SRErrorDomain code:8196 userInfo:0]];

  [(SRAuthorizationTableDelegate *)v2 authorizationTableCompletedPromptSuccessfully:0];
}

- (void)registerForPrerequisitesUpdated
{
  uint64_t v3 = qword_1000161E8;
  if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Registering for prerequisites notification", buf, 2u);
  }
  objc_initWeak(&location, self);
  p_registrationToken = &self->_registrationToken;
  self->_registrationToken = -1;
  uint64_t v5 = (const char *)[SRNotificationPreqUpdated UTF8String];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005910;
  v9[3] = &unk_1000104A8;
  objc_copyWeak(&v10, &location);
  uint32_t v6 = notify_register_dispatch(v5, &self->_registrationToken, (dispatch_queue_t)&_dispatch_main_q, v9);
  if (v6 || *p_registrationToken == -1)
  {
    uint64_t v7 = qword_1000161E8;
    if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_ERROR))
    {
      int v8 = *p_registrationToken;
      *(_DWORD *)buf = 67240448;
      uint32_t v13 = v6;
      __int16 v14 = 1026;
      int v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to register for prerequisites notification status %{public}d, registration token %{public}d", buf, 0xEu);
    }
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prerequesiteNotificationReceived
{
  unsigned int v3 = [+[SRAuthorizationClient sharedInstance] dataCollectionEnabled];
  BOOL skEnabled = self->_skEnabled;
  self->_BOOL skEnabled = v3;
  uint64_t v5 = qword_1000161E8;
  if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got prerequisite notification. Data Collection Enabled: %{public, BOOL}d", (uint8_t *)v7, 8u);
  }
  if (v3)
  {
    [(SREnableSensorKitController *)self unregisterForPrerequisitesUpdated];
    if (self->_skEnabled != skEnabled)
    {
      uint32_t v6 = [[SRAuthorizationTable alloc] initWithServices:[(SREnableSensorKitController *)self services] appBundle:[(SREnableSensorKitController *)self appBundle] authStore:[(SREnableSensorKitController *)self authStore] migrationMode:[(SREnableSensorKitController *)self migrationMode]];
      [(SRAuthorizationTable *)v6 setDelegate:[(SREnableSensorKitController *)self delegate]];
      objc_msgSend(-[SRAuthorizationTable navigationItem](v6, "navigationItem"), "setHidesBackButton:", 1);
      objc_msgSend(-[SREnableSensorKitController navigationController](self, "navigationController"), "pushViewController:animated:", v6, 1);
    }
  }
}

- (void)unregisterForPrerequisitesUpdated
{
  int registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    objc_super v4 = qword_1000161E8;
    if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Unregistering for prerequisites notification", (uint8_t *)v7, 2u);
      int registrationToken = self->_registrationToken;
    }
    if (notify_cancel(registrationToken))
    {
      uint64_t v5 = qword_1000161E8;
      if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_ERROR))
      {
        int v6 = self->_registrationToken;
        v7[0] = 67240192;
        v7[1] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to cancel notification status %{public}d", (uint8_t *)v7, 8u);
      }
    }
    self->_int registrationToken = -1;
  }
}

- (SRAuthorizationTableDelegate)delegate
{
  return (SRAuthorizationTableDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAuthStore:(id)a3
{
}

- (BOOL)migrationMode
{
  return self->_migrationMode;
}

- (void)setMigrationMode:(BOOL)a3
{
  self->_migrationMode = a3;
}

- (void).cxx_destruct
{
}

@end