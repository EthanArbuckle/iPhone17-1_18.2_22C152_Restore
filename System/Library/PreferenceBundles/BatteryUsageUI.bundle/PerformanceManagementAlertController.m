@interface PerformanceManagementAlertController
- (void)showPerfMitigationAlert:(id)a3;
@end

@implementation PerformanceManagementAlertController

- (void)showPerfMitigationAlert:(id)a3
{
  id v3 = a3;
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v4 = BatteryUILocalization(@"PPC_PERFMGMT_ALERT_MESSAGE");
  }
  v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v6 = BatteryUILocalization(@"PPC_PERFMGMT_ALERT_DISABLE");
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4FBC;
  v17[3] = &unk_BE5F8;
  id v7 = v3;
  id v18 = v7;
  v8 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v17];

  [v5 addAction:v8];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v9 = BatteryUILocalization(@"PPC_PERFMGMT_ALERT_LEAVE_ON");
  }
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_5094;
  v15 = &unk_BE5F8;
  id v16 = v7;
  id v10 = v7;
  v11 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&v12];

  objc_msgSend(v5, "addAction:", v11, v12, v13, v14, v15);
  [v5 setPreferredAction:v11];
  [v10 presentViewController:v5 animated:1 completion:0];
}

@end