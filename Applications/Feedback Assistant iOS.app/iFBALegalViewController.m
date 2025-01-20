@interface iFBALegalViewController
- (UIBarButtonItem)acceptButton;
- (UIBarButtonItem)declineButton;
- (UITextView)textView;
- (id)completion;
- (void)accept:(id)a3;
- (void)decline:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)setAcceptButton:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation iFBALegalViewController

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)iFBALegalViewController;
  [(iFBALegalViewController *)&v26 viewDidLoad];
  id v3 = objc_alloc((Class)NSAttributedString);
  v4 = +[iFBAConstants currentiOSLegalDoc];
  v29[0] = NSDocumentTypeDocumentAttribute;
  v29[1] = NSCharacterEncodingDocumentAttribute;
  v30[0] = NSRTFTextDocumentType;
  v30[1] = &off_1000FA9B0;
  v5 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v6 = [v3 initWithURL:v4 options:v5 documentAttributes:0 error:0];
  v7 = [(iFBALegalViewController *)self textView];
  [v7 setAttributedText:v6];

  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"DECLINE" value:&stru_1000F6658 table:0];
  v10 = [(iFBALegalViewController *)self declineButton];
  [v10 setTitle:v9];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"ACCEPT" value:&stru_1000F6658 table:0];
  v13 = [(iFBALegalViewController *)self acceptButton];
  [v13 setTitle:v12];

  v14 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
  v15 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v27[0] = v14;
  v16 = +[UIColor systemBackgroundColor];
  v27[1] = v15;
  v28[0] = v16;
  v17 = +[UIColor secondarySystemBackgroundColor];
  v28[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  v19 = +[UIColor _dynamicColorWithColorsByTraitCollection:v18];
  v20 = [(iFBALegalViewController *)self view];
  [v20 setBackgroundColor:v19];

  v21 = [(iFBALegalViewController *)self view];
  v22 = [v21 backgroundColor];
  v23 = [(iFBALegalViewController *)self textView];
  [v23 setBackgroundColor:v22];

  v24 = +[UIColor labelColor];
  v25 = [(iFBALegalViewController *)self textView];
  [v25 setTextColor:v24];

  [(iFBALegalViewController *)self setModalInPresentation:1];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)iFBALegalViewController;
  [(iFBALegalViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(iFBALegalViewController *)self textView];
  [v3 setContentOffset:CGPointZero];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iFBALegalViewController;
  [(iFBALegalViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(iFBALegalViewController *)self textView];
  [v4 flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)iFBALegalViewController;
  [(iFBALegalViewController *)&v2 didReceiveMemoryWarning];
}

- (void)decline:(id)a3
{
  objc_super v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"AGREEMENT_REQUIREMENT" value:&stru_1000F6658 table:0];
  id v9 = +[UIAlertController alertControllerWithTitle:&stru_1000F6658 message:v5 preferredStyle:1];

  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
  v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(iFBALegalViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)accept:(id)a3
{
  objc_super v4 = +[iFBAConstants sharedUserDefaults];
  objc_super v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[FBKSharedConstants currentLegalVersion]);
  [v4 setValue:v5 forKey:FBKAgreedLegalVersionKey];

  [(iFBALegalViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v6 = [(iFBALegalViewController *)self completion];
  v6[2](v6, 1);
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UIBarButtonItem)acceptButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_acceptButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setAcceptButton:(id)a3
{
}

- (UIBarButtonItem)declineButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_declineButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setDeclineButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_declineButton);
  objc_destroyWeak((id *)&self->_acceptButton);
  objc_storeStrong(&self->_completion, 0);

  objc_destroyWeak((id *)&self->_textView);
}

@end