@interface STKSetupCallAlertViewController
- (BOOL)validateAction:(id)a3;
- (id)alertText;
- (id)newBottomBar;
- (id)newTopBarForInstance;
- (void)dial:(id)a3;
- (void)dismiss:(id)a3;
@end

@implementation STKSetupCallAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)newTopBarForInstance
{
  return 0;
}

- (id)newBottomBar
{
  id v3 = [objc_alloc((Class)TPBottomDoubleButtonBar) initWithDefaultSizeForOrientation:[self interfaceOrientation]];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v8 = [(STKSetupCallAlertViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  [v3 bounds];
  double v12 = v10 - v11;

  [v3 setFrame:0.0, v12, v5, v7];
  id v13 = objc_alloc((Class)TPButton);
  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v15 = [v14 localizedStringForKey:@"DISMISS_SIM_TOOLKIT" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v16 = [v13 initWithTitle:v15 icon:0 color:4 frame:23.0, 24.0, 136.0, 47.0];

  [v16 setBlursBackground:0];
  v17 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
  [v16 setTitleColor:v17 forState:0];

  [v16 setAutoresizingMask:0];
  [v16 setContentMode:3];
  [v16 addTarget:self action:"dismiss:" forControlEvents:64];
  [v3 setButton:v16 andStyle:1];
  [v16 setTitleVerticalOffset:-1.0];
  id v18 = objc_alloc((Class)TPButton);
  v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v20 = [v19 localizedStringForKey:@"DIAL" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v21 = [v18 initWithTitle:v20 icon:0 color:4 frame:161.0, 24.0, 136.0, 47.0];

  [v21 setBlursBackground:0];
  v22 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
  [v21 setTitleColor:v22 forState:0];

  [v21 setAutoresizingMask:0];
  [v21 setContentMode:3];
  [v21 addTarget:self action:"dial:" forControlEvents:64];
  [v3 setButton2:v21 andStyle:1];
  [v21 setTitleVerticalOffset:-1.0];

  return v3;
}

- (void)dismiss:(id)a3
{
  double v4 = [(STKBaseAlertViewController *)self sessionAction];
  [v4 sendResponse:3];

  [(STKTextAlertViewController *)self dismiss];
}

- (void)dial:(id)a3
{
  double v4 = [(STKBaseAlertViewController *)self sessionAction];
  double v5 = [v4 sessionData];
  id v7 = [v5 phoneNumber];

  if (v7)
  {
    double v6 = [(STKBaseAlertViewController *)self sessionAction];
    [v6 sendResponse:0];
  }
  [(STKTextAlertViewController *)self dismiss];
}

- (id)alertText
{
  v28.receiver = self;
  v28.super_class = (Class)STKSetupCallAlertViewController;
  id v3 = [(STKTextAlertViewController *)&v28 alertText];
  if (!v3)
  {
    double v4 = +[TUCallCenter sharedInstance];
    double v5 = [v4 currentCalls];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = [(STKBaseAlertViewController *)self sessionAction];
      v8 = [v7 sessionData];
      unsigned int v9 = [v8 isHighPriority];

      double v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      double v11 = v10;
      if (v9) {
        CFStringRef v12 = @"SIMTK_HIGH_PRIORITY_CALL_ALERT";
      }
      else {
        CFStringRef v12 = @"SIMTK_MEDIUM_PRIORITY_CALL_ALERT";
      }
    }
    else
    {
      double v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      double v11 = v10;
      CFStringRef v12 = @"SIMTK_CALL_ALERT";
    }
    id v3 = [v10 localizedStringForKey:v12 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  id v13 = [(STKBaseAlertViewController *)self sessionAction];
  v14 = [v13 sessionData];
  v15 = [v14 simLabel];

  if (v15)
  {
    id v16 = [(STKBaseAlertViewController *)self sessionAction];
    v17 = [v16 sessionData];
    uint64_t v18 = [v17 simLabel];
    v19 = (void *)v18;
    CFStringRef v20 = &stru_100018540;
    if (v3) {
      CFStringRef v20 = v3;
    }
    id v21 = +[NSString stringWithFormat:@"(%@) %@", v18, v20];
  }
  else
  {
    CFStringRef v22 = &stru_100018540;
    if (v3) {
      CFStringRef v22 = v3;
    }
    id v21 = +[NSString stringWithFormat:@"%@", v22];
  }
  v23 = [(STKBaseAlertViewController *)self sessionAction];
  v24 = [v23 sessionData];
  v25 = [v24 phoneNumber];

  if (v25)
  {
    uint64_t v26 = [v21 stringByAppendingFormat:@"\n%@", v25];

    id v21 = (void *)v26;
  }

  return v21;
}

@end