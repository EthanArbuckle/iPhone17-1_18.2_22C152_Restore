@interface BHSTextViewController
- (id)onDismiss;
- (void)_createDismissButton;
- (void)_createTextView;
- (void)dismissButtonPressed:(id)a3;
- (void)setOnDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation BHSTextViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)BHSTextViewController;
  [(BHSTextViewController *)&v7 viewDidLoad];
  v3 = +[UIColor whiteColor];
  v4 = [(BHSTextViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO_TITLE" value:&stru_18860 table:@"Localizable"];
  [(BHSTextViewController *)self setTitle:v6];

  [(BHSTextViewController *)self _createTextView];
  [(BHSTextViewController *)self _createDismissButton];
}

- (void)dismissButtonPressed:(id)a3
{
  id v5 = [(BHSTextViewController *)self navigationController];
  v4 = [(BHSTextViewController *)self onDismiss];
  [v5 dismissViewControllerAnimated:1 completion:v4];
}

- (void)_createDismissButton
{
  id v3 = objc_alloc((Class)UIBarButtonItem);
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v7 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO_DONE" value:&stru_18860 table:@"Localizable"];
  id v5 = [v3 initWithTitle:v4 style:0 target:self action:"dismissButtonPressed:"];
  v6 = [(BHSTextViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];
}

- (void)_createTextView
{
  id v6 = objc_alloc_init((Class)UITextView);
  [(BHSTextViewController *)self setView:v6];
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v6 setFont:v3];

  [v6 setEditable:0];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO_DESCRIPTION" value:&stru_18860 table:@"Localizable"];
  [v6 setText:v5];
}

- (id)onDismiss
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOnDismiss:(id)a3
{
}

- (void).cxx_destruct
{
}

@end