@interface PasswordViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (void)_cancel;
- (void)_configureAndShowAlertController;
- (void)_passwordConfirm;
- (void)_passwordEntered;
- (void)_passwordNext;
- (void)_setCredential:(id)a3;
- (void)didReceiveAuthenticationData;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PasswordViewController

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  [v4 setBackgroundColor:v3];

  [(PasswordViewController *)self setModalPresentationStyle:3];
  [(PasswordViewController *)self setView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PasswordViewController;
  [(TransitionViewController *)&v4 viewDidAppear:a3];
  if (!self->_alertController) {
    [(PasswordViewController *)self _configureAndShowAlertController];
  }
}

- (void)didReceiveAuthenticationData
{
  v7.receiver = self;
  v7.super_class = (Class)PasswordViewController;
  [(TransitionViewController *)&v7 didReceiveAuthenticationData];
  v3 = [(TransitionViewController *)self internalInfo];
  objc_super v4 = [v3 objectForKey:@"PasswordMode"];
  self->_mode = [v4 unsignedIntValue];

  self->_state = self->_mode == 0;
  v5 = [(TransitionViewController *)self authenticationSubtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v5;
}

- (void)_configureAndShowAlertController
{
  objc_super v4 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v4;

  objc_initWeak(location, self);
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 localizedStringForKey:@"PASSWORD_PLACEHOLDER" value:&stru_100088CF0 table:@"MobileUI"];

  v8 = self->_alertController;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10000DFF8;
  v53[3] = &unk_1000863F8;
  v53[4] = self;
  id v43 = v7;
  id v54 = v43;
  objc_copyWeak(&v55, location);
  [(UIAlertController *)v8 addTextFieldWithConfigurationHandler:v53];
  v9 = objc_opt_new();
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PASSWORD_ALERT_CANCEL" value:&stru_100088CF0 table:@"MobileUI"];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10000E090;
  v51[3] = &unk_100086260;
  objc_copyWeak(&v52, location);
  v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v51];
  [v9 addObject:v12];

  int64_t state = self->_state;
  if (!state)
  {
    v20 = [(TransitionViewController *)self callerBundleId];
    if (v20
      && ([(TransitionViewController *)self callerName],
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = NSString;
      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v42 localizedStringForKey:@"APP_ASKING_CURRENT_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
      v2 = [(TransitionViewController *)self callerName];
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v2);
      int v24 = 0;
      int v25 = 1;
    }
    else
    {
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"ENTER_CURRENT_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
      v21 = 0;
      int v25 = 0;
      int v24 = 1;
    }
    [(TransitionViewController *)self setAuthenticationTitle:v23];
    if (v24)
    {

      if (!v25) {
        goto LABEL_26;
      }
    }
    else if (!v25)
    {
LABEL_26:
      if (!v20)
      {
LABEL_28:

        v34 = +[NSBundle bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"PASSWORD_ALERT_DONE" value:&stru_100088CF0 table:@"MobileUI"];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10000E0D0;
        v49[3] = &unk_100086260;
        v36 = &v50;
        objc_copyWeak(&v50, location);
        v37 = +[UIAlertAction actionWithTitle:v35 style:0 handler:v49];
        goto LABEL_38;
      }
LABEL_27:

      goto LABEL_28;
    }

    if (!v20) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (state == 1)
  {
    v26 = [(TransitionViewController *)self callerBundleId];
    if (v26
      && ([(TransitionViewController *)self callerName],
          (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = NSString;
      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v42 localizedStringForKey:@"APP_ASKING_NEW_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
      v2 = [(TransitionViewController *)self callerName];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v2);
      int v30 = 0;
      int v31 = 1;
    }
    else
    {
      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"ENTER_NEW_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
      v27 = 0;
      int v31 = 0;
      int v30 = 1;
    }
    [(TransitionViewController *)self setAuthenticationTitle:v29];
    if (v30)
    {

      if (!v31) {
        goto LABEL_35;
      }
    }
    else if (!v31)
    {
LABEL_35:
      if (!v26)
      {
LABEL_37:

        v34 = +[NSBundle bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"PASSWORD_ALERT_NEXT" value:&stru_100088CF0 table:@"MobileUI"];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000E110;
        v47[3] = &unk_100086260;
        v36 = &v48;
        objc_copyWeak(&v48, location);
        v37 = +[UIAlertAction actionWithTitle:v35 style:0 handler:v47];
        goto LABEL_38;
      }
LABEL_36:

      goto LABEL_37;
    }

    if (!v26) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (state != 2) {
    goto LABEL_39;
  }
  v14 = [(TransitionViewController *)self callerBundleId];
  if (v14
    && ([(TransitionViewController *)self callerName],
        (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = NSString;
    v42 = +[NSBundle bundleForClass:objc_opt_class()];
    v41 = [v42 localizedStringForKey:@"APP_ASKING_CONFIRM_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
    v2 = [(TransitionViewController *)self callerName];
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v2);
    int v18 = 0;
    int v19 = 1;
  }
  else
  {
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CONFIRM_NEW_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
    v15 = 0;
    int v19 = 0;
    int v18 = 1;
  }
  [(TransitionViewController *)self setAuthenticationTitle:v17];
  if (v18)
  {

    if (!v19) {
      goto LABEL_17;
    }
LABEL_21:

    if (!v14) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v19) {
    goto LABEL_21;
  }
LABEL_17:
  if (v14) {
LABEL_18:
  }

LABEL_19:
  v32 = [(TransitionViewController *)self authenticationSubtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v32;

  v34 = +[NSBundle bundleForClass:objc_opt_class()];
  v35 = [v34 localizedStringForKey:@"PASSWORD_ALERT_DONE" value:&stru_100088CF0 table:@"MobileUI"];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000E150;
  v45[3] = &unk_100086260;
  v36 = &v46;
  objc_copyWeak(&v46, location);
  v37 = +[UIAlertAction actionWithTitle:v35 style:0 handler:v45];
LABEL_38:
  currentConfirmAction = self->_currentConfirmAction;
  self->_currentConfirmAction = v37;

  objc_destroyWeak(v36);
LABEL_39:
  [(UIAlertAction *)self->_currentConfirmAction setEnabled:0];
  [v9 addObject:self->_currentConfirmAction];
  v39 = self->_alertController;
  v40 = [(TransitionViewController *)self authenticationTitle];
  [(UIAlertController *)v39 setTitle:v40];

  [(UIAlertController *)self->_alertController setMessage:self->_subtitle];
  [(UIAlertController *)self->_alertController _setActions:v9];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E190;
  block[3] = &unk_100085F40;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v52);

  objc_destroyWeak(&v55);
  objc_destroyWeak(location);
}

- (void)_passwordEntered
{
  v3 = [(UITextField *)self->_passwordField text];
  id v4 = +[LACSecureData secureDataWithString:v3];

  [(PasswordViewController *)self _setCredential:v4];
  [v4 reset];
}

- (void)_passwordNext
{
  v3 = [(UITextField *)self->_passwordField text];
  id v4 = [v3 length];

  if (v4)
  {
    v5 = [(UITextField *)self->_passwordField text];
    v6 = +[LACSecureData secureDataWithString:v5];
    newPassword = self->_newPassword;
    self->_newPassword = v6;

    self->_int64_t state = 2;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E33C;
  block[3] = &unk_100085F40;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_passwordConfirm
{
  v3 = [(UITextField *)self->_passwordField text];
  id v4 = +[LACSecureData secureDataWithString:v3];

  if ([(LACSecureData *)self->_newPassword isEqual:v4])
  {
    [(PasswordViewController *)self _setCredential:v4];
  }
  else
  {
    self->_int64_t state = 1;
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"CONFIRM_NEW_PASSWORD_MISMATCH" value:&stru_100088CF0 table:@"MobileUI"];
    subtitle = self->_subtitle;
    self->_subtitle = v6;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E4AC;
    block[3] = &unk_100085F40;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [v4 reset];
  [(LACSecureData *)self->_newPassword reset];
}

- (void)_setCredential:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)LAACMHelper);
  v6 = [(TransitionViewController *)self cachedExternalizedContext];
  objc_super v7 = [v6 externalizedContext];
  id v8 = [v5 initWithExternalizedContext:v7];

  v9 = [(TransitionViewController *)self options];
  v10 = [v9 objectForKey:&off_10008A288];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 == 0.0) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  id v18 = 0;
  unsigned int v14 = [v8 replacePassphraseCredentialWithPurpose:0 passphrase:v4 scope:v13 error:&v18];

  id v15 = v18;
  if (v14)
  {
    CFStringRef v21 = @"Result";
    int v19 = &off_10008A2A0;
    v20 = &__kCFBooleanTrue;
    v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [(TransitionViewController *)self uiSuccessWithResult:v17];
  }
  else
  {
    [(TransitionViewController *)self uiFailureWithError:v15];
  }
}

- (void)_cancel
{
  [(LACSecureData *)self->_newPassword reset];

  [(TransitionViewController *)self uiCancel];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  double v11 = [v9 text];
  double v12 = (char *)[v11 length];

  if (location + length <= (unint64_t)v12)
  {
    uint64_t v13 = &v12[(void)[v10 length]];
    if ((unint64_t)&v13[-length] <= 0x80)
    {
      id v14 = [v10 length];
      if (v14 && (char *)location == v12 && !length)
      {
        [v9 insertText:v10];
      }
      else if (!v14 && (char *)location == v12 - 1 && length == 1)
      {
        [v9 deleteBackward];
      }
      [(UIAlertAction *)self->_currentConfirmAction setEnabled:v13 != (char *)length];
    }
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v3 = [a3 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfirmAction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end