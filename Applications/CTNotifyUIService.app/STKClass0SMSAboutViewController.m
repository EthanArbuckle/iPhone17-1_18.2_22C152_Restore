@interface STKClass0SMSAboutViewController
- (BOOL)_canShowWhileLocked;
- (id)formattedAboutText;
- (void)doneButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation STKClass0SMSAboutViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)STKClass0SMSAboutViewController;
  [(STKClass0SMSAboutViewController *)&v14 viewDidLoad];
  v3 = [(STKClass0SMSAboutViewController *)self view];
  id v4 = objc_alloc((Class)UITextView);
  [v3 frame];
  double Width = CGRectGetWidth(v15);
  [v3 frame];
  v6 = [v4 initWithFrame:CGRectMake(0.0, 0.0, Width, CGRectGetHeight(v16))];
  aboutContentView = self->_aboutContentView;
  self->_aboutContentView = v6;

  [(UITextView *)self->_aboutContentView setAdjustsFontForContentSizeCategory:1];
  [(UITextView *)self->_aboutContentView setAutoresizingMask:18];
  -[UITextView setTextContainerInset:](self->_aboutContentView, "setTextContainerInset:", 10.0, 10.0, 10.0, 10.0);
  v8 = self->_aboutContentView;
  v9 = [(STKClass0SMSAboutViewController *)self formattedAboutText];
  [(UITextView *)v8 setAttributedText:v9];

  [(UITextView *)self->_aboutContentView setScrollEnabled:0];
  [(UITextView *)self->_aboutContentView setEditable:0];
  [(UITextView *)self->_aboutContentView setSelectable:0];
  [v3 addSubview:self->_aboutContentView];
  v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v11 = [v10 localizedStringForKey:@"CLASS0SMS_ABOUT_TITLE" value:&stru_100018540 table:@"SIMToolkitUI"];
  [(STKClass0SMSAboutViewController *)self setTitle:v11];

  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonTapped:"];
  v13 = [(STKClass0SMSAboutViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];
}

- (void)doneButtonTapped:(id)a3
{
}

- (id)formattedAboutText
{
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v3 = [v2 localizedStringForKey:@"CLASS0SMS_CLASS_0_SMS" value:&stru_100018540 table:@"SIMToolkitUI"];

  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v5 = [v4 localizedStringForKey:@"CLASS0SMS_FLASH_SMS" value:&stru_100018540 table:@"SIMToolkitUI"];

  v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v7 = [v6 localizedStringForKey:@"CLASS0SMS_ABOUT_BODY" value:&stru_100018540 table:@"SIMToolkitUI"];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3, v5);

  id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];
  id v10 = [v8 rangeOfString:v3];
  uint64_t v21 = v11;
  id v22 = v10;
  id v12 = [v8 rangeOfString:v5];
  uint64_t v23 = v13;
  id v24 = v12;
  objc_super v14 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  CGRect v15 = +[UIFont systemFontOfSize:14.0];
  CGRect v16 = [v14 scaledFontForFont:v15];

  v17 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  v18 = +[UIFont boldSystemFontOfSize:14.0];
  v19 = [v17 scaledFontForFont:v18];

  [v9 beginEditing];
  [v9 addAttribute:NSFontAttributeName value:v16 range:0, [v8 length]];
  [v9 addAttribute:NSFontAttributeName value:v19 range:v22];
  [v9 addAttribute:NSFontAttributeName value:v19 range:v24];
  [v9 endEditing];

  return v9;
}

- (void).cxx_destruct
{
}

@end