@interface STKBaseInputAlertViewController
+ (BOOL)wantsTextView;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (UIButton)button;
- (UITextField)inputTextField;
- (UIView)buttonBorderView;
- (UIView)sendingFieldView;
- (UIView)textBorderView;
- (id)newBottomBar;
- (id)newTopBar;
- (void)_sendClicked;
- (void)dealloc;
- (void)setDigitsOnly:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STKBaseInputAlertViewController

+ (BOOL)wantsTextView
{
  return 1;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  [(STKBaseAlertViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)STKBaseInputAlertViewController;
  [(STKBaseAlertViewController *)&v3 viewDidLoad];
  self->_minLength = 0;
  self->_maxLength = -1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  [(STKBaseInputAlertViewController *)&v4 viewDidAppear:a3];
  [(UITextField *)self->_inputTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STKBaseInputAlertViewController;
  [(STKBaseAlertViewController *)&v4 viewWillDisappear:a3];
  [(UITextField *)self->_inputTextField resignFirstResponder];
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (id)newTopBar
{
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
  id v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v13 = [v10 initWithTitle:v12 style:0 target:self action:"rightNavigationButtonPressed"];

  [v9 setRightBarButtonItem:v13];
  [v3 pushNavigationItem:v9 animated:0];

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    [(STKBaseInputAlertViewController *)self performSelector:"leftNavigationButtonPressed" withObject:0];
  }
  return 0;
}

- (id)newBottomBar
{
  id v3 = [(STKBaseInputAlertViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  sendingFieldView = self->_sendingFieldView;
  self->_sendingFieldView = v6;

  [(UIView *)self->_sendingFieldView _setLayoutDebuggingIdentifier:@"_sendingFieldView"];
  -[UIView setFrame:](self->_sendingFieldView, "setFrame:", 0.0, 0.0, v5, 36.0);
  id v8 = (UIButton *)objc_alloc_init((Class)UIButton);
  button = self->_button;
  self->_button = v8;

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v10) = 1144750080;
  [(UIButton *)self->_button setContentHuggingPriority:0 forAxis:v10];
  v11 = self->_button;
  v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  id v13 = [v12 localizedStringForKey:@"SEND" value:&stru_100018540 table:@"SIMToolkitUI"];
  [(UIButton *)v11 setTitle:v13 forState:0];

  v14 = [(UIButton *)self->_button titleLabel];
  v15 = +[UIFont systemFontOfSize:18.0];
  [v14 setFont:v15];

  [(UIButton *)self->_button addTarget:self action:"_sendClicked" forControlEvents:64];
  -[UIButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
  [(UIView *)self->_sendingFieldView addSubview:self->_button];
  v16 = [RoundedBorderView alloc];
  v17 = +[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.1];
  v18 = -[RoundedBorderView initWithFrame:color:](v16, "initWithFrame:color:", v17, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  textBorderView = self->_textBorderView;
  self->_textBorderView = v18;

  [(UIView *)self->_textBorderView _setLayoutDebuggingIdentifier:@"_textBorderView"];
  [(UIView *)self->_textBorderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_sendingFieldView addSubview:self->_textBorderView];
  v20 = (UITextField *)objc_alloc_init((Class)UITextField);
  inputTextField = self->_inputTextField;
  self->_inputTextField = v20;

  [(UITextField *)self->_inputTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_inputTextField setBorderStyle:0];
  v22 = self->_inputTextField;
  v23 = +[UIColor whiteColor];
  [(UITextField *)v22 setBackgroundColor:v23];

  v24 = self->_inputTextField;
  v25 = +[UIFont systemFontOfSize:18.0];
  [(UITextField *)v24 setFont:v25];

  v26 = self->_inputTextField;
  v27 = +[UIColor blackColor];
  [(UITextField *)v26 setTextColor:v27];

  [(UITextField *)self->_inputTextField setDelegate:self];
  [(UIView *)self->_textBorderView addSubview:self->_inputTextField];
  v61 = [(UIButton *)self->_button trailingAnchor];
  v60 = [(UIView *)self->_sendingFieldView trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:-5.0];
  v62[0] = v59;
  v58 = [(UIButton *)self->_button centerYAnchor];
  v57 = [(UIView *)self->_sendingFieldView centerYAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v62[1] = v56;
  v55 = [(UIView *)self->_textBorderView leadingAnchor];
  v54 = [(UIView *)self->_sendingFieldView leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54 constant:10.0];
  v62[2] = v53;
  v52 = [(UIView *)self->_textBorderView trailingAnchor];
  v51 = [(UIButton *)self->_button leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:-10.0];
  v62[3] = v50;
  v49 = [(UIView *)self->_textBorderView heightAnchor];
  v48 = [(UIView *)self->_sendingFieldView heightAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:-10.0];
  v62[4] = v47;
  v46 = [(UIView *)self->_textBorderView centerYAnchor];
  v45 = [(UIView *)self->_sendingFieldView centerYAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v62[5] = v44;
  v43 = [(UITextField *)self->_inputTextField leadingAnchor];
  v42 = [(UIView *)self->_textBorderView leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:5.0];
  v62[6] = v41;
  v40 = [(UITextField *)self->_inputTextField trailingAnchor];
  v39 = [(UIView *)self->_textBorderView trailingAnchor];
  v28 = [v40 constraintEqualToAnchor:v39 constant:-5.0];
  v62[7] = v28;
  v29 = [(UITextField *)self->_inputTextField heightAnchor];
  v30 = [(UIView *)self->_textBorderView heightAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v62[8] = v31;
  v32 = [(UITextField *)self->_inputTextField centerYAnchor];
  v33 = [(UIView *)self->_textBorderView centerYAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v62[9] = v34;
  v35 = +[NSArray arrayWithObjects:v62 count:10];
  +[NSLayoutConstraint activateConstraints:v35];

  v36 = [(UITextField *)self->_inputTextField textInputTraits];
  [v36 setAcceptsFloatingKeyboard:0];
  [v36 setAcceptsSplitKeyboard:0];
  v37 = self->_sendingFieldView;

  return v37;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a5;
  id v9 = [a3 text];
  double v10 = (char *)[v9 length];

  if ((unint64_t)v10 >= length) {
    v11 = &v10[-length];
  }
  else {
    v11 = 0;
  }
  if (&v11[(void)[v8 length]] <= (char *)self->_maxLength)
  {
    if (self->_digitsOnly)
    {
      id v13 = +[NSCharacterSet phonePadCharacterSet];
      v14 = [v8 stringByTrimmingCharactersInSet:v13];
      BOOL v12 = [v14 length] == 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setDigitsOnly:(BOOL)a3
{
  self->_digitsOnly = a3;
  if (a3) {
    [(UITextField *)self->_inputTextField setKeyboardType:5];
  }
}

- (void)_sendClicked
{
  id v3 = [(UITextField *)self->_inputTextField text];
  id v4 = [v3 length];

  if ((unint64_t)v4 >= self->_minLength && (unint64_t)v4 <= self->_maxLength)
  {
    [(STKBaseInputAlertViewController *)self sendButtonPressed];
  }
}

- (UIView)sendingFieldView
{
  return self->_sendingFieldView;
}

- (UIButton)button
{
  return self->_button;
}

- (UIView)textBorderView
{
  return self->_textBorderView;
}

- (UITextField)inputTextField
{
  return self->_inputTextField;
}

- (UIView)buttonBorderView
{
  return self->_buttonBorderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBorderView, 0);
  objc_storeStrong((id *)&self->_textBorderView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_sendingFieldView, 0);

  objc_storeStrong((id *)&self->_inputTextField, 0);
}

@end