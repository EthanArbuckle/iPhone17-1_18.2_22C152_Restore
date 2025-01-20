@interface STKStandardInputAlertViewController
- (BOOL)validateAction:(id)a3;
- (void)leftNavigationButtonPressed;
- (void)rightNavigationButtonPressed;
- (void)sendButtonPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STKStandardInputAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)leftNavigationButtonPressed
{
  id v3 = [(STKBaseAlertViewController *)self sessionAction];
  [v3 sendResponse:4];

  [(STKBaseAlertViewController *)self dismiss];
}

- (void)rightNavigationButtonPressed
{
  id v3 = [(STKBaseAlertViewController *)self sessionAction];
  [v3 sendResponse:1];

  [(STKBaseAlertViewController *)self dismiss];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(STKBaseAlertViewController *)self sessionAction];
  v6 = [v5 sessionData];

  if (v6)
  {
    v7 = [v6 text];
    v8 = [(STKBaseAlertViewController *)self sessionAction];
    v9 = [v8 sessionData];
    v10 = [v9 simLabel];

    if (v10)
    {
      v11 = [(STKBaseAlertViewController *)self sessionAction];
      v12 = [v11 sessionData];
      uint64_t v13 = [v12 simLabel];
      v14 = (void *)v13;
      CFStringRef v15 = &stru_100018540;
      if (v7) {
        CFStringRef v15 = v7;
      }
      v16 = +[NSString stringWithFormat:@"(%@) %@", v13, v15];
    }
    else
    {
      CFStringRef v17 = &stru_100018540;
      if (v7) {
        CFStringRef v17 = v7;
      }
      v16 = +[NSString stringWithFormat:@"%@", v17];
    }
    [(STKBaseInputAlertViewController *)self setText:v16];
    v18 = [(STKBaseInputAlertViewController *)self inputTextField];
    [v18 setSecureTextEntry:[v6 isSecure]];

    v19 = [(STKBaseInputAlertViewController *)self inputTextField];
    v20 = [v6 defaultText];
    [v19 setText:v20];

    -[STKBaseInputAlertViewController setDigitsOnly:](self, "setDigitsOnly:", [v6 isDigitsOnly]);
    -[STKBaseInputAlertViewController setMinLength:](self, "setMinLength:", [v6 minimumInputLength]);
    -[STKBaseInputAlertViewController setMaxLength:](self, "setMaxLength:", [v6 maximumInputLength]);
  }
  [(STKBaseAlertViewController *)self startTimeoutTimerIfNecessary];
  v21.receiver = self;
  v21.super_class = (Class)STKStandardInputAlertViewController;
  [(STKStandardInputAlertViewController *)&v21 viewWillAppear:v3];
}

- (void)sendButtonPressed
{
  BOOL v3 = [(STKBaseAlertViewController *)self sessionAction];
  v4 = [(STKBaseInputAlertViewController *)self inputTextField];
  v5 = [v4 text];
  [v3 sendSuccessWithResponse:v5];

  [(STKBaseAlertViewController *)self dismiss];
}

@end