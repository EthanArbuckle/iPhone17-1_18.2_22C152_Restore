@interface BuddyComplexPasscodeInputView
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BuddyComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4;
- (UITextField)passcodeField;
- (id)passcode;
- (id)passcodeDisplayView;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyComplexPasscodeInputView

- (BuddyComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  CGRect v42 = a3;
  SEL v40 = a2;
  BOOL v39 = a4;
  id location = 0;
  v38.receiver = self;
  v38.super_class = (Class)BuddyComplexPasscodeInputView;
  id location = -[BuddyComplexPasscodeInputView initWithFrame:](&v38, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    id v4 = objc_alloc_init((Class)UITextField);
    v5 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v4;

    [*((id *)location + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 2) setDelegate:location];
    [*((id *)location + 2) setSecureTextEntry:1];
    [*((id *)location + 2) setReturnKeyType:4];
    if (v39) {
      [*((id *)location + 2) setKeyboardType:4];
    }
    id v37 = [*((id *)location + 2) textInputTraits];
    [v37 setDevicePasscodeEntry:1];
    [*((id *)location + 2) setTextAlignment:1];
    v6 = (void *)*((void *)location + 2);
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v6 setFont:v7];

    id v8 = [*((id *)location + 2) layer];
    [v8 setBorderWidth:1.0];

    id v9 = [location traitCollection];
    v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_1001C6CCC;
    v35 = &unk_1002B0D20;
    id v36 = location;
    [v9 performAsCurrentTraitCollection:&v31];

    id v10 = [*((id *)location + 2) layer];
    [v10 setCornerRadius:10.0];

    v11 = (void *)*((void *)location + 2);
    id v12 = +[UIColor _labelColor];
    [v11 setTextColor:v12];

    [location addSubview:*((void *)location + 2)];
    id v30 = [*((id *)location + 2) heightAnchor];
    [*((id *)location + 2) intrinsicContentSize];
    id v29 = [v30 constraintEqualToConstant:v13 * 2.0];
    v43[0] = v29;
    id v28 = [*((id *)location + 2) leadingAnchor];
    id v27 = [location leadingAnchor];
    id v26 = [v28 constraintEqualToAnchor:];
    v43[1] = v26;
    id v14 = [*((id *)location + 2) trailingAnchor];
    id v15 = [location trailingAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    v43[2] = v16;
    id v17 = [*((id *)location + 2) topAnchor];
    id v18 = [location topAnchor];
    id v19 = [v17 constraintEqualToAnchor:v18];
    v43[3] = v19;
    id v20 = [*((id *)location + 2) bottomAnchor];
    id v21 = [location bottomAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    v43[4] = v22;
    v23 = +[NSArray arrayWithObjects:v43 count:5];
    +[NSLayoutConstraint activateConstraints:v23];

    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  v24 = (BuddyComplexPasscodeInputView *)location;
  objc_storeStrong(&location, 0);
  return v24;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyComplexPasscodeInputView *)v5 passcodeField];
  [(UITextField *)v3 setText:location[0]];

  objc_storeStrong(location, 0);
}

- (id)passcode
{
  v2 = [(BuddyComplexPasscodeInputView *)self passcodeField];
  v3 = [(UITextField *)v2 text];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)BuddyComplexPasscodeInputView;
  [(BuddyComplexPasscodeInputView *)&v6 traitCollectionDidChange:location[0]];
  v3 = [(BuddyComplexPasscodeInputView *)v8 passcodeField];
  id v4 = [(UITextField *)v3 layer];
  id v5 = +[UIColor _labelColor];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  objc_storeStrong(location, 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  _NSRange v17 = a4;
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  objc_super v6 = [(BuddyPasscodeInputView *)v16 delegate];
  char v12 = 0;
  char v7 = 0;
  if (v6)
  {
    id v13 = [(BuddyPasscodeInputView *)v16 delegate];
    char v12 = 1;
    char v7 = objc_opt_respondsToSelector();
  }
  if (v12) {

  }
  if (v7)
  {
    id v8 = [location[0] text];
    id v11 = [v8 stringByReplacingCharactersInRange:v17.location, v17.length, v14];

    id v9 = [(BuddyPasscodeInputView *)v16 delegate];
    [(BuddyPasscodeInputViewDelegate *)v9 passcodeInput:v16 willChangeContents:v11];

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyPasscodeInputView *)v12 delegate];
  char v9 = 0;
  char v4 = 0;
  if (v3)
  {
    id v10 = [(BuddyPasscodeInputView *)v12 delegate];
    char v9 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  if (v9) {

  }
  if (v4)
  {
    id v5 = [(BuddyPasscodeInputView *)v12 delegate];
    objc_super v6 = v12;
    id v7 = [(BuddyComplexPasscodeInputView *)v12 passcode];
    [(BuddyPasscodeInputViewDelegate *)v5 passcodeInput:v6 enteredPasscode:v7];
  }
  objc_storeStrong(location, 0);
  return 1;
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
}

@end