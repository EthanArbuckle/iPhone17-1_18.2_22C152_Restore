@interface RetailDiagnosticsController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)isEphemeral;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BuddyButtonMonitor)buttonMonitor;
- (DADiagnosticsRemoteHostViewController)diagnosticsRemoteController;
- (RetailDiagnosticsController)init;
- (void)_skipDiagnostics;
- (void)_startDiagnostics;
- (void)didTerminateWithError:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setButtonMonitor:(id)a3;
- (void)setDiagnosticsRemoteController:(id)a3;
- (void)startOver;
- (void)viewDidLoad;
@end

@implementation RetailDiagnosticsController

- (RetailDiagnosticsController)init
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = +[UIImage imageNamed:@"Retail Diagnostics"];
  id v2 = v11;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"RETAIL_DIAGNOSTICS" value:&stru_1002B4E18 table:@"RetailDiagnostics"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"RETAIL_DIAGNOSTICS_DESCRIPTION" value:&stru_1002B4E18 table:@"RetailDiagnostics"];
  id v11 = 0;
  v9.receiver = v2;
  v9.super_class = (Class)RetailDiagnosticsController;
  id v11 = [(RetailDiagnosticsController *)&v9 initWithTitle:v4 detailText:v6 icon:location[0]];
  v7 = (RetailDiagnosticsController *)v11;

  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)viewDidLoad
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)RetailDiagnosticsController;
  [(RetailDiagnosticsController *)&v8 viewDidLoad];
  id v2 = v10;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"START_DIAGNOSTICS" value:&stru_1002B4E18 table:@"RetailDiagnostics"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"_startDiagnostics"];

  v5 = v10;
  v6 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"SKIP_DIAGNOSTICS" value:&stru_1002B4E18 table:@"RetailDiagnostics"];
  [(BuddyWelcomeController *)v5 addLinkButton:v7 action:"_skipDiagnostics"];
}

- (void)_startDiagnostics
{
  SEL v9 = self;
  v8[1] = (id)a2;
  id v2 = sub_10013A0A4();
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10013A1BC;
  v7 = &unk_1002B37F0;
  v8[0] = v9;
  [v2 requestDiagnosticsRemoteViewControllerWithConnectionHandler:&v3];
  objc_storeStrong(v8, 0);
}

- (void)_skipDiagnostics
{
  id v2 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v2 flowItemDone:self];
}

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun() ^ 1) & 1;
}

- (BOOL)controllerNeedsToRun
{
  oslog[2] = (os_log_t)self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(RetailDiagnosticsController *)self buttonMonitor];
  char v3 = ![(BuddyButtonMonitor *)v2 isAnyButtonPressed];

  if ((v3 & 1) == 0) {
    return 1;
  }
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = oslog[0];
    os_log_type_t v5 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Skipping retail diagnostics; no buttons pressed",
      (uint8_t *)v7,
      2u);
  }
  objc_storeStrong((id *)oslog, 0);
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)isEphemeral
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = dispatch_get_global_queue(25, 0);
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10013A684;
  os_log_type_t v8 = &unk_1002B0D70;
  id v9 = location[0];
  dispatch_async(v3, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  id v2 = [(RetailDiagnosticsController *)self diagnosticsRemoteController];
  id v3 = [(DADiagnosticsRemoteHostViewController *)v2 disconnect];
}

- (void)didTerminateWithError:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v27 = (id)_BYLoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      char v24 = 0;
      char v22 = 0;
      if (_BYIsInternalInstall())
      {
        id v3 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v25 = [location[0] domain];
        char v24 = 1;
        id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v25, [location[0] code]);
        id v23 = v3;
        char v22 = 1;
      }
      else
      {
        id v3 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v3);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "Diagnostics finished with error: %{public}@", buf, 0xCu);
      if (v22) {

      }
      if (v24) {
    }
      }
    objc_storeStrong(&v27, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = oslog;
      os_log_type_t v5 = v20;
      sub_10004B24C(v19);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Diagnostics finished successfully", v19, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  int v6 = [(RetailDiagnosticsController *)v29 diagnosticsRemoteController];
  char v17 = 0;
  char v15 = 0;
  BOOL v7 = 0;
  if (v6)
  {
    id v18 = [(RetailDiagnosticsController *)v29 diagnosticsRemoteController];
    char v17 = 1;
    id v16 = [v18 presentingViewController];
    char v15 = 1;
    BOOL v7 = v16 != 0;
  }
  if (v15) {

  }
  if (v17) {
  if (v7)
  }
  {
    os_log_type_t v8 = [(RetailDiagnosticsController *)v29 diagnosticsRemoteController];
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_10013B29C;
    v13 = &unk_1002B0D20;
    v14 = v29;
    [(DADiagnosticsRemoteHostViewController *)v8 dismissViewControllerAnimated:1 completion:&v9];

    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(location, 0);
}

- (BuddyButtonMonitor)buttonMonitor
{
  return self->_buttonMonitor;
}

- (void)setButtonMonitor:(id)a3
{
}

- (DADiagnosticsRemoteHostViewController)diagnosticsRemoteController
{
  return self->_diagnosticsRemoteController;
}

- (void)setDiagnosticsRemoteController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end