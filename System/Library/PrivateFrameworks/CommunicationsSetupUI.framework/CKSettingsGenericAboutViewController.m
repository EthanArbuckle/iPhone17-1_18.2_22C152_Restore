@interface CKSettingsGenericAboutViewController
- (CKSettingsGenericAboutViewController)initWithTitle:(id)a3 bodyText:(id)a4;
- (UITextView)aboutView;
- (void)done:(id)a3;
- (void)setAboutView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CKSettingsGenericAboutViewController

- (CKSettingsGenericAboutViewController)initWithTitle:(id)a3 bodyText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKSettingsGenericAboutViewController;
  v8 = [(CKSettingsGenericAboutViewController *)&v17 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v10 = [(CKSettingsGenericAboutViewController *)v8 navigationItem];
    [v10 setTitle:v6];
    v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_done_];
    [v10 setRightBarButtonItem:v11];
    id v12 = objc_alloc(MEMORY[0x263F82D60]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:textContainer:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    aboutView = v9->_aboutView;
    v9->_aboutView = (UITextView *)v13;

    -[UITextView setTextContainerInset:](v9->_aboutView, "setTextContainerInset:", 25.0, 20.0, 25.0, 20.0);
    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UITextView *)v9->_aboutView setFont:v15];

    [(UITextView *)v9->_aboutView setTextAlignment:4];
    [(UITextView *)v9->_aboutView setDataDetectorTypes:2];
    [(UITextView *)v9->_aboutView setText:v7];
    [(UITextView *)v9->_aboutView setEditable:0];
    [(UITextView *)v9->_aboutView setScrollEnabled:1];
  }
  return v9;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsGenericAboutViewController;
  [(CKSettingsGenericAboutViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(CKSettingsGenericAboutViewController *)self view];
  [v3 bounds];
  -[UITextView setFrame:](self->_aboutView, "setFrame:");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsGenericAboutViewController;
  [(CKSettingsGenericAboutViewController *)&v4 viewDidLoad];
  -[UITextView setContentOffset:](self->_aboutView, "setContentOffset:", 0.0, -25.0);
  v3 = [(CKSettingsGenericAboutViewController *)self view];
  [v3 addSubview:self->_aboutView];
}

- (void)done:(id)a3
{
  id v3 = [(CKSettingsGenericAboutViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (UITextView)aboutView
{
  return self->_aboutView;
}

- (void)setAboutView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end