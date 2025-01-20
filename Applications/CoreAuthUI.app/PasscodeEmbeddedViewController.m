@interface PasscodeEmbeddedViewController
- (BOOL)_useDotPattern;
- (BOOL)animating;
- (BOOL)hasAlphaNumericPasscode;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)verifyPasscode:(id)a3;
- (UITextField)passcodeField;
- (id)alphanumericFieldPlaceholder;
- (int64_t)alphanumericFieldTextAlignment;
- (unint64_t)passcodeLength;
- (void)_selectPasscodeField:(id)a3;
- (void)_shakePasscodeFieldWithCompletion:(id)a3;
- (void)_submitPasscode:(id)a3;
- (void)loadView;
- (void)setAnimating:(BOOL)a3;
- (void)setBackoffTimeout:(double)a3;
- (void)setBackoffTimeout:(double)a3 showBackoffTitle:(BOOL)a4 passcodeFocused:(BOOL)a5;
- (void)setPasscodeField:(id)a3;
- (void)setPasscodeFocused:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PasscodeEmbeddedViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(PasscodeEmbeddedViewController *)self setView:v3];

  v4 = [(PasscodeEmbeddedViewController *)self view];
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_selectPasscodeField:"];
  [v4 addGestureRecognizer:v5];

  v6 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  mainContainer = self->_mainContainer;
  self->_mainContainer = v6;

  [(UIStackView *)self->_mainContainer setAxis:1];
  [(UIStackView *)self->_mainContainer setAlignment:3];
  [(UIStackView *)self->_mainContainer setSpacing:8.0];
  v8 = [(PasscodeEmbeddedViewController *)self view];
  [v8 addSubview:self->_mainContainer];

  [(UIStackView *)self->_mainContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(UIStackView *)self->_mainContainer topAnchor];
  v10 = [(PasscodeEmbeddedViewController *)self view];
  v11 = [v10 topAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [(UIStackView *)self->_mainContainer bottomAnchor];
  v14 = [(PasscodeEmbeddedViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(UIStackView *)self->_mainContainer leadingAnchor];
  v18 = [(PasscodeEmbeddedViewController *)self view];
  v19 = [v18 leadingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [(UIStackView *)self->_mainContainer trailingAnchor];
  v22 = [(PasscodeEmbeddedViewController *)self view];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:2];
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v25;

  [(UIImpactFeedbackGenerator *)self->_hapticGenerator prepare];
  v27 = (UIView *)objc_alloc_init((Class)UIView);
  passcodeFieldContainer = self->_passcodeFieldContainer;
  self->_passcodeFieldContainer = v27;

  [(UIStackView *)self->_mainContainer addArrangedSubview:self->_passcodeFieldContainer];
  [(UIView *)self->_passcodeFieldContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v22) = [(PasscodeEmbeddedViewController *)self _useDotPattern];
  v29 = LALogForCategory();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v22)
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Presenting fixed length passcode UI", buf, 2u);
    }

    v31 = [(PasscodeEmbeddedViewController *)self traitCollection];
    [v31 userInterfaceStyle];
    [(UIView *)self->_passcodeFieldContainer setAlpha:1.0];

    v32 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    passcodeFieldBackground = self->_passcodeFieldBackground;
    self->_passcodeFieldBackground = v32;

    [(UIStackView *)self->_passcodeFieldBackground setAxis:0];
    [(UIStackView *)self->_passcodeFieldBackground setSpacing:20.75];
    if ([(PasscodeEmbeddedViewController *)self passcodeLength])
    {
      unint64_t v34 = 0;
      do
      {
        id v35 = objc_alloc_init((Class)UIView);
        v36 = [(PasscodeEmbeddedViewController *)self traitCollection];
        if ([v36 userInterfaceStyle] == (id)2) {
          +[UIColor labelColor];
        }
        else {
        id v37 = +[UIColor secondaryLabelColor];
        }
        id v38 = [v37 CGColor];
        v39 = [v35 layer];
        [v39 setBorderColor:v38];

        v40 = [v35 layer];
        [v40 setBorderWidth:1.7];

        v41 = [v35 layer];
        [v41 setCornerRadius:10.0];

        [(UIStackView *)self->_passcodeFieldBackground addArrangedSubview:v35];
        [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
        v42 = [v35 widthAnchor];
        v43 = [v42 constraintEqualToConstant:20.0];
        [v43 setActive:1];

        v44 = [v35 heightAnchor];
        v45 = [v44 constraintEqualToConstant:20.0];
        [v45 setActive:1];

        ++v34;
      }
      while (v34 < [(PasscodeEmbeddedViewController *)self passcodeLength]);
    }
    [(UIView *)self->_passcodeFieldContainer addSubview:self->_passcodeFieldBackground];
    [(UIStackView *)self->_passcodeFieldBackground setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = [(UIStackView *)self->_passcodeFieldBackground centerXAnchor];
    v47 = [(UIView *)self->_passcodeFieldContainer centerXAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:-1.25];
    [v48 setActive:1];

    v49 = [(UIStackView *)self->_passcodeFieldBackground centerYAnchor];
    v50 = [(UIView *)self->_passcodeFieldContainer centerYAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v51 setActive:1];

    v52 = (UITextField *)objc_alloc_init((Class)UITextField);
    passcodeField = self->_passcodeField;
    self->_passcodeField = v52;

    v54 = +[UIColor clearColor];
    [(UITextField *)self->_passcodeField setTintColor:v54];

    v55 = +[UIColor labelColor];
    [(UITextField *)self->_passcodeField setTextColor:v55];

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v121 = self->_passcodeField;
    id obj = +[NSArray arrayWithObjects:&v121 count:1];
    id v56 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v117;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v117 != v58) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          [v60 setTextAlignment:0];
          [v60 setDelegate:self];
          [v60 setSecureTextEntry:1];
          BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
          double v62 = 50.0;
          if (IsBoldTextEnabled) {
            double v62 = 48.0;
          }
          v63 = +[UIFont systemFontOfSize:v62];
          [v60 setFont:v63];

          v64 = [v60 defaultTextAttributes];
          [v64 setValue:&off_10008A618 forKey:NSKernAttributeName];

          [v60 setKeyboardType:4];
          [(UIView *)self->_passcodeFieldContainer addSubview:v60];
          [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
          v65 = [v60 topAnchor];
          v66 = [(UIView *)self->_passcodeFieldContainer topAnchor];
          v67 = [v65 constraintEqualToAnchor:v66];
          [v67 setActive:1];

          v68 = [v60 bottomAnchor];
          v69 = [(UIView *)self->_passcodeFieldContainer bottomAnchor];
          v70 = [v68 constraintEqualToAnchor:v69];
          [v70 setActive:1];

          v71 = [v60 centerXAnchor];
          v72 = [(UIView *)self->_passcodeFieldContainer centerXAnchor];
          v73 = [v71 constraintEqualToAnchor:v72 constant:5.0];
          [v73 setActive:1];

          v74 = [v60 widthAnchor];
          v75 = [v74 constraintEqualToConstant:41 * -[PasscodeEmbeddedViewController passcodeLength]];
          [v75 setActive:1];

          LODWORD(v76) = 1148846080;
          [v60 setContentCompressionResistancePriority:0 forAxis:v76];
          LODWORD(v77) = 1132068864;
          [v60 setContentHuggingPriority:0 forAxis:v77];
          v78 = +[UIColor clearColor];
          [v60 setBackgroundColor:v78];
        }
        id v57 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
      }
      while (v57);
    }

    UIFontTextStyle v79 = UIFontTextStyleTitle2;
  }
  else
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Presenting variable length passcode UI", buf, 2u);
    }

    [(UIStackView *)self->_mainContainer setAxis:0];
    v80 = (UITextField *)objc_opt_new();
    v81 = self->_passcodeField;
    self->_passcodeField = v80;

    [(UITextField *)self->_passcodeField setDelegate:self];
    [(UITextField *)self->_passcodeField setDevicePasscodeEntry:1];
    [(UITextField *)self->_passcodeField setSecureTextEntry:1];
    [(UITextField *)self->_passcodeField setTextContentType:UITextContentTypeOneTimeCode];
    UIFontTextStyle v79 = UIFontTextStyleTitle2;
    v82 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(UITextField *)self->_passcodeField setFont:v82];

    v83 = [(PasscodeEmbeddedViewController *)self alphanumericFieldPlaceholder];
    [(UITextField *)self->_passcodeField setAttributedPlaceholder:v83];

    [(UITextField *)self->_passcodeField setTextAlignment:[(PasscodeEmbeddedViewController *)self alphanumericFieldTextAlignment]];
    v84 = +[UIColor labelColor];
    [(UITextField *)self->_passcodeField setTextColor:v84];

    [(UITextField *)self->_passcodeField setReturnKeyType:9];
    if ([(PasscodeEmbeddedViewController *)self hasAlphaNumericPasscode]) {
      uint64_t v85 = 1;
    }
    else {
      uint64_t v85 = 4;
    }
    [(UITextField *)self->_passcodeField setKeyboardType:v85];
    if (![(PasscodeEmbeddedViewController *)self hasAlphaNumericPasscode])
    {
      v86 = +[UIDevice currentDevice];
      id v87 = [v86 userInterfaceIdiom];

      if (v87 != (id)1)
      {
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_100023570;
        v115[3] = &unk_100086A58;
        v115[4] = self;
        v88 = sub_100023570((uint64_t)v115);
        [(UITextField *)self->_passcodeField setInputAccessoryView:v88];
      }
    }
    v89 = [(PasscodeEmbeddedViewController *)self traitCollection];
    if ([v89 userInterfaceStyle] == (id)2) {
      +[UIColor quaternaryLabelColor];
    }
    else {
    id v90 = +[UIColor systemLightGrayTintColor];
    }
    id v91 = [v90 CGColor];
    v92 = [(UIView *)self->_passcodeFieldContainer layer];
    [v92 setBackgroundColor:v91];

    v93 = [(UIView *)self->_passcodeFieldContainer layer];
    [v93 setCornerRadius:10.0];

    [(UIView *)self->_passcodeFieldContainer addSubview:self->_passcodeField];
    [(UITextField *)self->_passcodeField setTranslatesAutoresizingMaskIntoConstraints:0];
    v94 = [(UITextField *)self->_passcodeField topAnchor];
    v95 = [(UIView *)self->_passcodeFieldContainer topAnchor];
    v96 = [v94 constraintEqualToAnchor:v95 constant:15.0];
    [v96 setActive:1];

    v97 = [(UITextField *)self->_passcodeField bottomAnchor];
    v98 = [(UIView *)self->_passcodeFieldContainer bottomAnchor];
    v99 = [v97 constraintEqualToAnchor:v98 constant:-15.0];
    [v99 setActive:1];

    v100 = [(UITextField *)self->_passcodeField leadingAnchor];
    v101 = [(UIView *)self->_passcodeFieldContainer leadingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101 constant:15.0];
    [v102 setActive:1];

    v103 = [(UITextField *)self->_passcodeField trailingAnchor];
    v104 = [(UIView *)self->_passcodeFieldContainer trailingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104 constant:-15.0];
    [v105 setActive:1];
  }
  v106 = (UILabel *)objc_opt_new();
  backoffTitle = self->_backoffTitle;
  self->_backoffTitle = v106;

  v108 = +[UIFont preferredFontForTextStyle:v79];
  [(UILabel *)self->_backoffTitle setFont:v108];

  v109 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_backoffTitle setTextColor:v109];

  [(UILabel *)self->_backoffTitle setHidden:1];
  [(UIStackView *)self->_mainContainer addArrangedSubview:self->_backoffTitle];
  v110 = (UILabel *)objc_opt_new();
  backoffSubtitle = self->_backoffSubtitle;
  self->_backoffSubtitle = v110;

  v112 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_backoffSubtitle setFont:v112];

  v113 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_backoffSubtitle setTextColor:v113];

  [(UILabel *)self->_backoffSubtitle setHidden:1];
  [(UIStackView *)self->_mainContainer addArrangedSubview:self->_backoffSubtitle];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PasscodeEmbeddedViewController;
  [(PasscodeEmbeddedViewController *)&v4 viewWillDisappear:a3];
  [(UITextField *)self->_passcodeField setText:&stru_100088CF0];
  [(UITextField *)self->_passcodeField endEditing:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if ([(PasscodeEmbeddedViewController *)self _useDotPattern])
  {
    id v21 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = [(UIStackView *)self->_passcodeFieldBackground arrangedSubviews];
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v11 = [(PasscodeEmbeddedViewController *)self traitCollection];
          if ([v11 userInterfaceStyle] == (id)2) {
            +[UIColor labelColor];
          }
          else {
          id v12 = +[UIColor secondaryLabelColor];
          }
          id v13 = [v12 CGColor];
          v14 = [v10 layer];
          [v14 setBorderColor:v13];
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    v15 = +[UIColor labelColor];
    [(UITextField *)self->_passcodeField setTextColor:v15];

    v16 = [(PasscodeEmbeddedViewController *)self traitCollection];
    [v16 userInterfaceStyle];
    [(UIView *)self->_passcodeFieldContainer setAlpha:1.0];

    id v4 = v21;
  }
  else
  {
    v17 = [(PasscodeEmbeddedViewController *)self traitCollection];
    if ([v17 userInterfaceStyle] == (id)2) {
      +[UIColor quaternaryLabelColor];
    }
    else {
    id v18 = +[UIColor systemLightGrayTintColor];
    }
    id v19 = [v18 CGColor];
    v20 = [(UIView *)self->_passcodeFieldContainer layer];
    [v20 setBackgroundColor:v19];
  }
}

- (void)setPasscodeFocused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = LALogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"off";
    if (v3) {
      CFStringRef v6 = @"on";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting passcode field focus %@", (uint8_t *)&v8, 0xCu);
  }

  passcodeField = self->_passcodeField;
  if (v3)
  {
    [(UITextField *)passcodeField becomeFirstResponder];
  }
  else
  {
    [(UITextField *)passcodeField setText:&stru_100088CF0];
    [(UITextField *)self->_passcodeField setDelegate:0];
    [(UITextField *)self->_passcodeField endEditing:1];
    [(UITextField *)self->_passcodeField setDelegate:self];
  }
}

- (BOOL)verifyPasscode:(id)a3
{
  return 0;
}

- (void)setBackoffTimeout:(double)a3
{
}

- (void)setBackoffTimeout:(double)a3 showBackoffTitle:(BOOL)a4 passcodeFocused:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v9 = a3 == 0.0;
  v10 = LALogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"on";
    if (a3 == 0.0) {
      CFStringRef v11 = @"off";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Turning backoff UI %@", buf, 0xCu);
  }

  if (a3 == 0.0) {
    uint64_t v12 = [(PasscodeEmbeddedViewController *)self _useDotPattern];
  }
  else {
    uint64_t v12 = 1;
  }
  [(UIStackView *)self->_mainContainer setAxis:v12];
  uint64_t v13 = a3 == 0.0 || !v6;
  [(UIView *)self->_passcodeFieldContainer setHidden:a3 != 0.0];
  [(UILabel *)self->_backoffTitle setHidden:v13];
  [(UILabel *)self->_backoffSubtitle setHidden:a3 == 0.0];
  if (a3 == 0.0)
  {
    [(UILabel *)self->_backoffTitle setText:&stru_100088CF0];
    [(UILabel *)self->_backoffSubtitle setText:&stru_100088CF0];
  }
  else
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"DEVICE_BLOCKED" value:&stru_100088CF0 table:@"MobileUI"];
    [(UILabel *)self->_backoffTitle setText:v15];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100023D60;
    v21[3] = &unk_100086A80;
    *(double *)&v21[5] = a3;
    v21[4] = self;
    v16 = sub_100023D60((uint64_t)v21);
    [(UILabel *)self->_backoffSubtitle setText:v16];
  }
  objc_initWeak((id *)buf, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100023E24;
  v17[3] = &unk_100086168;
  objc_copyWeak(&v18, (id *)buf);
  BOOL v19 = v9;
  BOOL v20 = a5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  passcodeField = self->_passcodeField;
  if (passcodeField == a3) {
    [a3 resignFirstResponder];
  }
  else {
    +[NSException raise:NSInvalidArgumentException, @"Received delegate message for invalid text field (%@)", a3 format];
  }
  return passcodeField == a3;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = (UITextField *)a3;
  id v5 = v4;
  if (self->_passcodeField == v4)
  {
    int v8 = [(UITextField *)v4 text];
    id v9 = [v8 length];

    if (!v9)
    {
      BOOL v6 = 1;
      goto LABEL_4;
    }
    if (!self->_animating)
    {
      v10 = [(UITextField *)v5 text];
      unsigned __int8 v11 = [(PasscodeEmbeddedViewController *)self verifyPasscode:v10];

      BOOL v6 = 1;
      if (v11) {
        goto LABEL_4;
      }
      self->_animating = 1;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100024058;
      v12[3] = &unk_100086850;
      v12[4] = self;
      uint64_t v13 = v5;
      [(PasscodeEmbeddedViewController *)self _shakePasscodeFieldWithCompletion:v12];
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Received delegate message for invalid text field (%@)", v4 format];
  }
  BOOL v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = (UITextField *)a3;
  id v10 = a5;
  if (self->_passcodeField != v9)
  {
    +[NSException raise:NSInvalidArgumentException, @"Received delegate message for invalid text field (%@)", v9 format];
    goto LABEL_10;
  }
  if (self->_animating) {
    goto LABEL_10;
  }
  unsigned __int8 v11 = [(UITextField *)v9 text];
  id v12 = [v11 length];
  if (v12 >= (id)[(PasscodeEmbeddedViewController *)self passcodeLength])
  {
    unint64_t v13 = [(PasscodeEmbeddedViewController *)self passcodeLength];

    if (v13) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v14 = [(UITextField *)v9 text];
  v15 = [v14 stringByReplacingCharactersInRange:location length:length withString:v10];
  [(UITextField *)v9 setText:v15];

LABEL_8:
  v16 = [(UITextField *)v9 text];
  id v17 = [v16 length];
  unint64_t v18 = [(PasscodeEmbeddedViewController *)self passcodeLength];

  if ((unint64_t)v17 >= v18) {
    [(UITextField *)v9 endEditing:1];
  }
LABEL_10:

  return 0;
}

- (void)_selectPasscodeField:(id)a3
{
  if ([a3 numberOfTouches] == (id)1
    && [(UILabel *)self->_backoffTitle isHidden]
    && [(UILabel *)self->_backoffSubtitle isHidden])
  {
    [(PasscodeEmbeddedViewController *)self setPasscodeFocused:1];
  }
}

- (void)_shakePasscodeFieldWithCompletion:(id)a3
{
  id v4 = a3;
  CGAffineTransformMakeTranslation(&v13, 30.0, 0.0);
  passcodeFieldContainer = self->_passcodeFieldContainer;
  CGAffineTransform v12 = v13;
  [(UIView *)passcodeFieldContainer setTransform:&v12];
  [(UIImpactFeedbackGenerator *)self->_hapticGenerator impactOccurred];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000244B0;
  v9[3] = &unk_1000860D8;
  objc_copyWeak(&v10, &location);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024514;
  v7[3] = &unk_100086AA8;
  id v6 = v4;
  id v8 = v6;
  +[UIView animateWithDuration:0 delay:v9 usingSpringWithDamping:v7 initialSpringVelocity:0.4 options:0.0 animations:0.03 completion:1.2];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_submitPasscode:(id)a3
{
}

- (BOOL)_useDotPattern
{
  return [(PasscodeEmbeddedViewController *)self passcodeLength] != -1
      && [(PasscodeEmbeddedViewController *)self passcodeLength] < 7;
}

- (unint64_t)passcodeLength
{
  v2 = +[LAPasscodeHelper sharedInstance];
  id v3 = [v2 passcodeType];

  unint64_t v4 = 6;
  if (v3 != (id)2) {
    unint64_t v4 = -1;
  }
  if (v3 == (id)1) {
    return 4;
  }
  else {
    return v4;
  }
}

- (BOOL)hasAlphaNumericPasscode
{
  v2 = +[LAPasscodeHelper sharedInstance];
  BOOL v3 = [v2 passcodeType] == (id)4;

  return v3;
}

- (int64_t)alphanumericFieldTextAlignment
{
  return 4;
}

- (id)alphanumericFieldPlaceholder
{
  id v2 = objc_alloc((Class)NSAttributedString);
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v4 = [v3 localizedStringForKey:@"ENTER_PASSCODE" value:&stru_100088CF0 table:@"MobileUI"];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (UITextField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_backoffSubtitle, 0);
  objc_storeStrong((id *)&self->_backoffTitle, 0);
  objc_storeStrong((id *)&self->_passcodeFieldBackground, 0);
  objc_storeStrong((id *)&self->_passcodeFieldContainer, 0);

  objc_storeStrong((id *)&self->_mainContainer, 0);
}

@end