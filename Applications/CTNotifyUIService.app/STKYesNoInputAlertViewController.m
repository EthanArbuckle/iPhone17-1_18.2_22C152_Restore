@interface STKYesNoInputAlertViewController
- (BOOL)validateAction:(id)a3;
- (id)newBottomBar;
- (void)noPressed:(id)a3;
- (void)yesPressed:(id)a3;
@end

@implementation STKYesNoInputAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)newBottomBar
{
  id v3 = [objc_alloc((Class)TPBottomDoubleButtonBar) initWithDefaultSizeForOrientation:[self interfaceOrientation]];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v8 = [(STKYesNoInputAlertViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  [v3 bounds];
  double v12 = v10 - v11;

  [v3 setFrame:0.0, v12, v5, v7];
  id v13 = objc_alloc((Class)TPButton);
  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v15 = [v14 localizedStringForKey:@"NO" value:&stru_100018540 table:@"SIMToolkitUI"];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v19 = [v13 initWithTitle:v15 icon:0 color:4 frame:CGRectZero.origin.x, y, width, height];

  [v19 setBlursBackground:0];
  v20 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
  [v19 setTitleColor:v20 forState:0];

  [v19 setAutoresizingMask:0];
  [v19 setContentMode:3];
  [v19 addTarget:self action:"noPressed:" forControlEvents:64];
  [v3 setButton:v19 andStyle:1];
  [v19 setTitleVerticalOffset:-1.0];
  id v21 = objc_alloc((Class)TPButton);
  v22 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v23 = [v22 localizedStringForKey:@"YES" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v24 = [v21 initWithTitle:v23 icon:0 color:4 frame:CGRectZero.origin.x, y, width, height];

  [v24 setBlursBackground:0];
  v25 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
  [v24 setTitleColor:v25 forState:0];

  [v24 setAutoresizingMask:0];
  [v24 setContentMode:3];
  [v24 addTarget:self action:"yesPressed:" forControlEvents:64];
  [v3 setButton2:v24 andStyle:1];
  [v24 setTitleVerticalOffset:-1.0];

  return v3;
}

- (void)yesPressed:(id)a3
{
  double v4 = [(STKBaseAlertViewController *)self sessionAction];
  [v4 sendSuccessWithSelectedResponse:1];

  [(STKTextAlertViewController *)self dismiss];
}

- (void)noPressed:(id)a3
{
  double v4 = [(STKBaseAlertViewController *)self sessionAction];
  [v4 sendSuccessWithSelectedResponse:0];

  [(STKTextAlertViewController *)self dismiss];
}

@end