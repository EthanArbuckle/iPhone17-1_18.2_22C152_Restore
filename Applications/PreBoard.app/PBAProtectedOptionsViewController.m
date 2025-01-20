@interface PBAProtectedOptionsViewController
- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3;
- (id)lockScreenIconSystemName;
- (id)lockScreenMessage;
- (id)lockScreenTitle;
- (id)passcodeEntryScreenSubtitle;
- (id)passcodeEntryScreenTitle;
- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4;
- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5;
- (void)_finish;
- (void)confirmTransitionToPasscodeWithCompletion:(id)a3;
- (void)successfulAuthHandler:(id)a3;
@end

@implementation PBAProtectedOptionsViewController

- (void)successfulAuthHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009098;
  v6[3] = &unk_10001CA18;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(PBADevicePasscodeViewController *)self handlePasscodeEntrySuccessful:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)passcodeEntryScreenTitle
{
  v2 = +[LAPreboard sharedInstance];
  v3 = [v2 passcodeTitle];

  return v3;
}

- (id)passcodeEntryScreenSubtitle
{
  v2 = +[LAPreboard sharedInstance];
  v3 = [v2 passcodeSubtitle];

  return v3;
}

- (id)lockScreenIconSystemName
{
  v2 = +[LAPreboard sharedInstance];
  v3 = [v2 iconSystemName];

  return v3;
}

- (id)lockScreenTitle
{
  v2 = +[LAPreboard sharedInstance];
  v3 = [v2 title];

  return v3;
}

- (id)lockScreenMessage
{
  v2 = +[LAPreboard sharedInstance];
  v3 = [v2 message];

  return v3;
}

- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[LAPreboard sharedInstance];
  id v5 = [v4 actionTitleWithHomeButton:v3];

  return v5;
}

- (void)confirmTransitionToPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[LAPreboard sharedInstance];
  v6 = [v5 confirmationTitle];
  id v7 = +[LAPreboard sharedInstance];
  id v8 = [v7 confirmationMessage];
  v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:0];

  [v9 _setShouldInvokeCancelActionOnDimmingViewTap:0];
  +[UIAlertController registerPlatformStyleProvider:self forIdiom:0];
  v10 = +[LAPreboard sharedInstance];
  v11 = [v10 confirmationActionTitle];

  if (v11)
  {
    v12 = +[LAPreboard sharedInstance];
    v13 = [v12 confirmationActionTitle];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100009754;
    v29[3] = &unk_10001CA40;
    id v30 = v4;
    v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v29];
    [v9 addAction:v14];
  }
  v15 = +[LAPreboard sharedInstance];
  v16 = [v15 confirmationCancelTitle];

  if (v16)
  {
    v17 = +[UIDevice currentDevice];
    BOOL v18 = [v17 userInterfaceIdiom] == 0;

    objc_initWeak(&location, self);
    v19 = +[LAPreboard sharedInstance];
    v20 = [v19 confirmationCancelTitle];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10000976C;
    v25 = &unk_10001CA68;
    id v26 = v4;
    objc_copyWeak(&v27, &location);
    v21 = +[UIAlertAction actionWithTitle:v20 style:v18 handler:&v22];
    [v9 addAction:v21, v22, v23, v24, v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  [(PBAProtectedOptionsViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4
{
  return 0;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(PBAAlertControllerVisualStyleActionSheet);
  }
  return v6;
}

- (void)_finish
{
  id v2 = +[LAPreboard sharedInstance];
  [v2 terminateWithCompletion:&stru_10001CAA8];
}

@end