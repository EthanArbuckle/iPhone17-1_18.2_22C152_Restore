@interface EKEventDetailExtendedTextViewController
- (EKEventDetailExtendedTextViewController)initWithText:(id)a3 title:(id)a4 event:(id)a5 textForCopyAction:(id)a6;
- (unint64_t)supportedInterfaceOrientations;
- (void)_share:(id)a3;
- (void)_updateConstraints;
- (void)loadTextView;
- (void)loadView;
- (void)updateTextView;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation EKEventDetailExtendedTextViewController

- (EKEventDetailExtendedTextViewController)initWithText:(id)a3 title:(id)a4 event:(id)a5 textForCopyAction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)EKEventDetailExtendedTextViewController;
  v15 = [(EKEventDetailExtendedTextViewController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    [(EKEventDetailExtendedTextViewController *)v15 setTitle:v12];
    objc_storeStrong((id *)&v16->_text, a3);
    objc_storeStrong((id *)&v16->_textToCopy, a6);
    objc_storeStrong((id *)&v16->_event, a5);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:v16 action:sel__share_];
    v18 = [(EKEventDetailExtendedTextViewController *)v16 navigationItem];
    [v18 setRightBarButtonItem:v17];

    [(UIResponder *)v16 EKUI_setDataOwnersFromEvent:v13];
  }

  return v16;
}

- (void)loadView
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, EKUIContainedControllerIdealWidth(), 416.0);
  [(EKEventDetailExtendedTextViewController *)self setView:v3];

  v4 = [(EKEventDetailExtendedTextViewController *)self view];
  [v4 setAutoresizesSubviews:1];

  [(EKEventDetailExtendedTextViewController *)self loadTextView];
  id v5 = [(EKEventDetailExtendedTextViewController *)self view];
  [v5 addSubview:self->_textView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailExtendedTextViewController;
  [(EKEventDetailExtendedTextViewController *)&v3 viewDidLoad];
  [(EKEventDetailExtendedTextViewController *)self _updateConstraints];
}

- (void)viewSafeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventDetailExtendedTextViewController;
  [(EKEventDetailExtendedTextViewController *)&v8 viewSafeAreaInsetsDidChange];
  objc_super v3 = [(EKEventDetailExtendedTextViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4 + 7.0;
  v6 = [(EKEventDetailExtendedTextViewController *)self view];
  [v6 safeAreaInsets];
  -[UITextView setContentInset:](self->_textView, "setContentInset:", 4.0, v5, 4.0, v7 + 7.0);
}

- (void)_updateConstraints
{
  v15[1] = *MEMORY[0x1E4F143B8];
  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  textView = self->_textView;
  id v14 = @"textView";
  v15[0] = textView;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  double v5 = [(EKEventDetailExtendedTextViewController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6 + 7.0;
  objc_super v8 = [(EKEventDetailExtendedTextViewController *)self view];
  [v8 safeAreaInsets];
  -[UITextView setContentInset:](self->_textView, "setContentInset:", 4.0, v7, 4.0, v9 + 7.0);

  v10 = (void *)MEMORY[0x1E4F28DC8];
  id v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[textView]|" options:0 metrics:0 views:v4];
  [v10 activateConstraints:v11];

  id v12 = (void *)MEMORY[0x1E4F28DC8];
  id v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[textView]|" options:0 metrics:0 views:v4];
  [v12 activateConstraints:v13];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(EKEventDetailExtendedTextViewController *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)loadTextView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  double v4 = [(EKEventDetailExtendedTextViewController *)self view];
  [v4 frame];
  double v5 = (UITextView *)objc_msgSend(v3, "initWithFrame:");
  textView = self->_textView;
  self->_textView = v5;

  [(EKEventDetailExtendedTextViewController *)self updateTextView];
  double v7 = [(UITextView *)self->_textView textLayoutManager];
  [v7 setLimitsLayoutForSuspiciousContents:1];

  objc_super v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextView *)self->_textView setFont:v8];

  [(UITextView *)self->_textView setEditable:0];
  double v9 = self->_textView;

  [(UITextView *)v9 setDataDetectorTypes:7];
}

- (void)updateTextView
{
  if ([(EKEventDetailExtendedTextViewController *)self isViewLoaded])
  {
    text = self->_text;
    textView = self->_textView;
    [(UITextView *)textView setText:text];
  }
}

- (void)_share:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(EKEventDetailExtendedTextViewController *)self navigationController];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v11[0] = self->_textToCopy;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    objc_super v8 = (void *)[v6 initWithActivityItems:v7 applicationActivities:0];

    double v9 = [v8 popoverPresentationController];
    [v9 setBarButtonItem:v4];

    v10 = [(EKEvent *)self->_event calendar];
    objc_msgSend(v8, "setIsContentManaged:", objc_msgSend(v10, "isManaged"));

    [v5 presentViewController:v8 animated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_textToCopy, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end