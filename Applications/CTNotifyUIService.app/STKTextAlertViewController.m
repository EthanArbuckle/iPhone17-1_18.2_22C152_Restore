@interface STKTextAlertViewController
+ (BOOL)wantsTextView;
- (BOOL)_sendsResponseUponDisplay;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)validateAction:(id)a3;
- (id)alertText;
- (id)newBottomBar;
- (id)newTopBar;
- (void)accept:(id)a3;
- (void)dismiss;
- (void)dismiss:(id)a3;
- (void)leftNavigationButtonPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STKTextAlertViewController

+ (BOOL)wantsTextView
{
  return 1;
}

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_sendsResponseUponDisplay
{
  v2 = [(STKBaseAlertViewController *)self sessionAction];
  id v3 = [v2 behavior];
  unsigned __int8 v4 = [v3 shouldSendResponseUponDisplay];

  return v4;
}

- (id)newTopBar
{
  if ([(STKTextAlertViewController *)self _sendsResponseUponDisplay]) {
    return 0;
  }
  id v3 = objc_alloc_init((Class)UINavigationBar);
  [v3 setDelegate:self];
  [v3 _setHidesShadow:1];
  [v3 setBarStyle:1];
  id v4 = objc_alloc_init((Class)UIImage);
  [v3 setBackgroundImage:v4 forBarMetrics:0];

  id v5 = objc_alloc((Class)UINavigationItem);
  v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v7 = [v6 localizedStringForKey:@"BACK" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v8 = [v5 initWithTitle:v7];

  [v3 pushNavigationItem:v8 animated:0];
  id v9 = [objc_alloc((Class)UINavigationItem) initWithTitle:&stru_100018540];
  [v3 pushNavigationItem:v9 animated:0];

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return 0;
}

- (id)newBottomBar
{
  id v3 = [(STKTextAlertViewController *)self interfaceOrientation];
  if ([(STKTextAlertViewController *)self _sendsResponseUponDisplay])
  {
    id v4 = [objc_alloc((Class)TPBottomSingleButtonBar) initWithDefaultSizeForOrientation:v3];
    id v5 = objc_alloc((Class)TPButton);
    v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    v7 = [v6 localizedStringForKey:@"DISMISS_SIM_TOOLKIT" value:&stru_100018540 table:@"SIMToolkitUI"];
    id v8 = [v5 initWithTitle:v7 icon:0 color:4 frame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

    [v8 setBlursBackground:0];
    [v8 addTarget:self action:"dismiss:" forControlEvents:64];
    id v9 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
    [v8 setTitleColor:v9 forState:0];

    [v4 setButton:v8 andStyle:1];
  }
  else
  {
    id v4 = [objc_alloc((Class)TPBottomDoubleButtonBar) initWithDefaultSizeForOrientation:v3];
    id v10 = objc_alloc((Class)TPButton);
    v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_100018540 table:@"SIMToolkitUI"];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v16 = [v10 initWithTitle:v12 icon:0 color:4 frame:CGRectZero.origin.x, y, width, height];

    [v16 setBlursBackground:0];
    [v16 setAutoresizingMask:0];
    [v16 setContentMode:3];
    [v16 addTarget:self action:"dismiss:" forControlEvents:64];
    v17 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
    [v16 setTitleColor:v17 forState:0];

    [v4 setButton:v16 andStyle:1];
    [v16 setTitleVerticalOffset:-1.0];
    id v18 = objc_alloc((Class)TPButton);
    v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    v20 = [v19 localizedStringForKey:@"ACCEPT" value:&stru_100018540 table:@"SIMToolkitUI"];
    id v8 = [v18 initWithTitle:v20 icon:0 color:4 frame:CGRectZero.origin.x, y, width, height];

    [v8 setBlursBackground:0];
    [v8 setAutoresizingMask:0];
    [v8 setContentMode:3];
    [v8 addTarget:self action:"accept:" forControlEvents:64];
    v21 = +[UIColor colorWithRed:0.105882353 green:0.533333333 blue:0.91372549 alpha:1.0];
    [v8 setTitleColor:v21 forState:0];

    [v4 setButton2:v8 andStyle:1];
  }
  [v8 setTitleVerticalOffset:-1.0];
  v22 = +[UIColor clearColor];
  [v4 setBackgroundColor:v22];

  return v4;
}

- (void)leftNavigationButtonPressed
{
  if (![(STKTextAlertViewController *)self _sendsResponseUponDisplay])
  {
    id v3 = [(STKBaseAlertViewController *)self sessionAction];
    [v3 sendResponse:4];
  }

  [(STKTextAlertViewController *)self dismiss];
}

- (id)alertText
{
  v2 = [(STKBaseAlertViewController *)self sessionAction];
  id v3 = [v2 sessionData];
  id v4 = [v3 text];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STKTextAlertViewController *)self alertText];
  [(STKBaseAlertViewController *)self setTextViewText:v5];

  [(STKBaseAlertViewController *)self startTimeoutTimerIfNecessary];
  v6.receiver = self;
  v6.super_class = (Class)STKTextAlertViewController;
  [(STKTextAlertViewController *)&v6 viewWillAppear:v3];
}

- (void)accept:(id)a3
{
  if (![(STKTextAlertViewController *)self _sendsResponseUponDisplay])
  {
    id v4 = [(STKBaseAlertViewController *)self sessionAction];
    [v4 sendResponse:0];
  }

  [(STKTextAlertViewController *)self dismiss];
}

- (void)dismiss:(id)a3
{
  if (![(STKTextAlertViewController *)self _sendsResponseUponDisplay])
  {
    id v4 = [(STKBaseAlertViewController *)self sessionAction];
    [v4 sendResponse:1];
  }

  [(STKTextAlertViewController *)self dismiss];
}

- (void)dismiss
{
  [(STKBaseAlertViewController *)self clearTimeoutTimer];
  v3.receiver = self;
  v3.super_class = (Class)STKTextAlertViewController;
  [(STKBaseAlertViewController *)&v3 dismiss];
}

@end