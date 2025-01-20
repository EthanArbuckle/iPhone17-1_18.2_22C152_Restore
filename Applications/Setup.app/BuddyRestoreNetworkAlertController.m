@interface BuddyRestoreNetworkAlertController
+ (id)_alertControllerForCellular:(int64_t)a3;
+ (id)alertControllerForNetworkConnectionWithProvider:(id)a3 estimatedRestoreSize:(int64_t)a4;
+ (id)alertControllerForUnsupportedNetworkWithCellularRestoreSupport:(BOOL)a3;
- (id)presentWiFiSettings;
- (id)restoreOverCellular;
- (void)setPresentWiFiSettings:(id)a3;
- (void)setRestoreOverCellular:(id)a3;
@end

@implementation BuddyRestoreNetworkAlertController

+ (id)alertControllerForNetworkConnectionWithProvider:(id)a3 estimatedRestoreSize:(int64_t)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([location[0] currentNetworkSupportsRestore] & 1) == 0
    || ([location[0] currentNetworkRequiresDataUsageWarningForRestore] & 1) != 0)
  {
    if ([location[0] currentNetworkSupportsRestore])
    {
      if ([location[0] currentNetworkRequiresDataUsageWarningForRestore]) {
        id v8 = [(id)objc_opt_class() _alertControllerForCellular:a4];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = [objc_opt_class() alertControllerForUnsupportedNetworkWithCellularRestoreSupport:[location[0] deviceSupportsCellularRestore]];
    }
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong(location, 0);
  v5 = v8;

  return v5;
}

+ (id)alertControllerForUnsupportedNetworkWithCellularRestoreSupport:(BOOL)a3
{
  id v29 = a1;
  SEL v28 = a2;
  BOOL v27 = a3;
  v3 = +[NSBundle mainBundle];
  id v4 = (id)SFLocalizableWAPIStringKeyForKey();
  id v26 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"RestoreFromBackup"];

  v5 = +[NSBundle mainBundle];
  id v6 = (id)SFLocalizableWAPIStringKeyForKey();
  id v25 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"RestoreFromBackup"];

  id val = +[BuddyRestoreNetworkAlertController alertControllerWithTitle:v26 message:v25 preferredStyle:1];
  objc_initWeak(&location, val);
  id v7 = val;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = (id)SFLocalizableWAPIStringKeyForKey();
  v10 = [(NSBundle *)v8 localizedStringForKey:v9 value:&stru_1002B4E18 table:@"Localizable"];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1001557D4;
  v21 = &unk_1002B13E0;
  objc_copyWeak(v22, &location);
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&v18];
  [v7 addAction:v11, v18, v19, v20, v21];

  id v12 = val;
  v13 = +[NSBundle mainBundle];
  v14 = [(NSBundle *)v13 localizedStringForKey:@"RESTORE_LATER" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
  [v12 addAction:v15];

  id v16 = val;
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_storeStrong(&val, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  return v16;
}

+ (id)_alertControllerForCellular:(int64_t)a3
{
  id v44 = a1;
  SEL v43 = a2;
  int64_t v42 = a3;
  v3 = +[NSBundle mainBundle];
  id v4 = (id)SFLocalizableWAPIStringKeyForKey();
  id v41 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"RestoreFromBackup"];

  id v40 = 0;
  if (v42 > 0)
  {
    id location = +[NSByteCountFormatter stringFromByteCount:v42 countStyle:2];
    v5 = +[NSBundle mainBundle];
    id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"RESTORE_OVER_CELLULAR_PROMPT_MESSAGE_ESTIMATE"];
    id v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, location);
    id v9 = v40;
    id v40 = v8;

    objc_storeStrong(&location, 0);
  }
  id v38 = +[BuddyRestoreNetworkAlertController alertControllerWithTitle:v41 message:v40 preferredStyle:1];
  objc_initWeak(&from, v38);
  id v10 = v38;
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = (id)SFLocalizableWAPIStringKeyForKey();
  v13 = [(NSBundle *)v11 localizedStringForKey:v12 value:&stru_1002B4E18 table:@"Localizable"];
  v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  v34 = sub_100155DAC;
  v35 = &unk_1002B13E0;
  objc_copyWeak(v36, &from);
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&v31];
  [v10 addAction:v14];

  id v15 = v38;
  id v16 = +[NSBundle mainBundle];
  v17 = [(NSBundle *)v16 localizedStringForKey:@"RESTORE_OVER_CELLULAR" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  id v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  SEL v28 = sub_100155E34;
  id v29 = &unk_1002B13E0;
  objc_copyWeak(&v30, &from);
  v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:&v25];
  [v15 addAction:v18];

  id v19 = v38;
  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [(NSBundle *)v20 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  v22 = +[UIAlertAction actionWithTitle:v21 style:1 handler:0];
  [v19 addAction:v22];

  id v23 = v38;
  objc_destroyWeak(&v30);
  objc_destroyWeak(v36);
  objc_destroyWeak(&from);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  return v23;
}

- (id)restoreOverCellular
{
  return self->_restoreOverCellular;
}

- (void)setRestoreOverCellular:(id)a3
{
}

- (id)presentWiFiSettings
{
  return self->_presentWiFiSettings;
}

- (void)setPresentWiFiSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end