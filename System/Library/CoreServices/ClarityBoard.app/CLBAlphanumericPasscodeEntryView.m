@interface CLBAlphanumericPasscodeEntryView
- (BOOL)textFieldShouldReturn:(id)a3;
- (CLBAlphanumericPasscodeEntryView)init;
- (void)_shakeAndClearTextField:(id)a3;
- (void)layoutSubviews;
@end

@implementation CLBAlphanumericPasscodeEntryView

- (CLBAlphanumericPasscodeEntryView)init
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  v19.receiver = self;
  v19.super_class = (Class)CLBAlphanumericPasscodeEntryView;
  v4 = -[CLBAlphanumericPasscodeEntryView initWithFrame:](&v19, "initWithFrame:");

  if (v4)
  {
    v5 = [(CLBAlphanumericPasscodeEntryView *)v4 layer];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v5 setName:v7];

    [(CLBAlphanumericPasscodeEntryView *)v4 setAutoresizingMask:18];
    [(CLBAlphanumericPasscodeEntryView *)v4 setAutoresizesSubviews:1];
    [(CLBAlphanumericPasscodeEntryView *)v4 setOverrideUserInterfaceStyle:2];
    v8 = +[UIColor systemFillColor];
    [(CLBAlphanumericPasscodeEntryView *)v4 setBackgroundColor:v8];

    v9 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    passcodeField = v4->_passcodeField;
    v4->_passcodeField = v9;

    v11 = v4->_passcodeField;
    v12 = +[UIColor labelColor];
    [(UITextField *)v11 setTextColor:v12];

    [(UITextField *)v4->_passcodeField setEnabled:1];
    [(UITextField *)v4->_passcodeField setHighlighted:1];
    [(UITextField *)v4->_passcodeField setReturnKeyType:9];
    [(UITextField *)v4->_passcodeField setEnablesReturnKeyAutomatically:1];
    [(UITextField *)v4->_passcodeField setClearButtonMode:1];
    [(UITextField *)v4->_passcodeField setSecureTextEntry:1];
    v13 = v4->_passcodeField;
    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    [(UITextField *)v13 setFont:v14];

    [(UITextField *)v4->_passcodeField setAdjustsFontSizeToFitWidth:1];
    [(UITextField *)v4->_passcodeField setKeyboardAppearance:1];
    [(UITextField *)v4->_passcodeField setLabel:@"Passcode: "];
    LODWORD(v15) = 8.0;
    [(UITextField *)v4->_passcodeField setLabelOffset:v15];
    v16 = v4->_passcodeField;
    v17 = +[UIColor systemBackgroundColor];
    [(UITextField *)v16 setBackgroundColor:v17];

    [(UITextField *)v4->_passcodeField setDelegate:v4];
    [(CLBAlphanumericPasscodeEntryView *)v4 addSubview:v4->_passcodeField];
  }
  return v4;
}

- (void)layoutSubviews
{
  [(CLBAlphanumericPasscodeEntryView *)self bounds];
  passcodeField = self->_passcodeField;
  UIRectCenteredIntegralRect();
  -[UITextField setFrame:](passcodeField, "setFrame:");
  [(UITextField *)self->_passcodeField _setContinuousCornerRadius:10.0];
  v4 = self->_passcodeField;

  [(CLBAlphanumericPasscodeEntryView *)self bringSubviewToFront:v4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = [(UITextField *)self->_passcodeField text];
  v6 = +[CLBMobileKeybagManager sharedInstance];
  unsigned int v7 = [v6 unlockWithPasscode:v5 error:0];

  if (v7)
  {
    [(UITextField *)self->_passcodeField setText:&stru_100167328];
    [v4 resignFirstResponder];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:CLBLockScreenDidUnlockNotification object:0];
  }
  else
  {
    [(CLBAlphanumericPasscodeEntryView *)self _shakeAndClearTextField:v4];
  }

  return 1;
}

- (void)_shakeAndClearTextField:(id)a3
{
  id v3 = a3;
  id v4 = +[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
  v5 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v4 setTimingFunction:v5];

  LODWORD(v6) = 2.0;
  [v4 setRepeatCount:v6];
  [v4 setDuration:0.06];
  [v4 setAutoreverses:1];
  unsigned int v7 = +[NSNumber numberWithInteger:10];
  [v4 setByValue:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A868;
  v11[3] = &unk_10015BEB8;
  id v12 = v3;
  id v8 = v3;
  +[CATransaction setCompletionBlock:v11];
  v9 = [v8 textInputView];
  v10 = [v9 layer];
  [v10 addAnimation:v4 forKey:@"position"];
}

- (void).cxx_destruct
{
}

@end