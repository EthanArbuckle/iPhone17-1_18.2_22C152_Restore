@interface DBUserAlertSheetViewController
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBUserAlertSheetViewController)initWithAlert:(id)a3 environmentConfiguration:(id)a4;
- (URTAlert)alert;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DBUserAlertSheetViewController

- (DBUserAlertSheetViewController)initWithAlert:(id)a3 environmentConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DBUserAlertSheetViewController;
  v9 = [(DBUserAlertSheetViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alert, a3);
    objc_storeStrong((id *)&v10->_environmentConfiguration, a4);
  }

  return v10;
}

- (void)loadView
{
  v3 = [DBUserAlertSheetView alloc];
  v4 = [(DBUserAlertSheetViewController *)self alert];
  v5 = [(DBUserAlertSheetViewController *)self environmentConfiguration];
  v6 = [(DBUserAlertSheetView *)v3 initWithAlert:v4 environmentConfiguration:v5];

  [(DBUserAlertSheetViewController *)self setView:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = DBLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_INFO, "presenting sheet user alert", v4, 2u);
  }
}

- (URTAlert)alert
{
  return self->_alert;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end