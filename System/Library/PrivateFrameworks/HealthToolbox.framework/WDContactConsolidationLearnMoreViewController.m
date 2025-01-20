@interface WDContactConsolidationLearnMoreViewController
- (UITextView)textView;
- (id)dismissHandler;
- (void)createDismissButton;
- (void)createTextView;
- (void)dismissButtonPressed:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDContactConsolidationLearnMoreViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WDContactConsolidationLearnMoreViewController;
  [(WDContactConsolidationLearnMoreViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] whiteColor];
  v4 = [(WDContactConsolidationLearnMoreViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = WDBundle();
  v6 = [v5 localizedStringForKey:@"MEDICAL_ID_CONSOLIDATION_LEARN_MORE_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [(WDContactConsolidationLearnMoreViewController *)self setTitle:v6];

  [(WDContactConsolidationLearnMoreViewController *)self createTextView];
  [(WDContactConsolidationLearnMoreViewController *)self createDismissButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDContactConsolidationLearnMoreViewController;
  [(WDContactConsolidationLearnMoreViewController *)&v5 viewWillAppear:a3];
  [(UITextView *)self->_textView contentInset];
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", 0.0, -v4);
}

- (void)createDismissButton
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  WDBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [v7 localizedStringForKey:@"DATA_COLLECTION_MORE_INFO_DONE_BUTTON" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  objc_super v5 = (void *)[v3 initWithTitle:v4 style:0 target:self action:sel_dismissButtonPressed_];
  v6 = [(WDContactConsolidationLearnMoreViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];
}

- (void)dismissButtonPressed:(id)a3
{
  double v4 = [(WDContactConsolidationLearnMoreViewController *)self navigationController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__WDContactConsolidationLearnMoreViewController_dismissButtonPressed___block_invoke;
  v5[3] = &unk_26458DC98;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __70__WDContactConsolidationLearnMoreViewController_dismissButtonPressed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) dismissHandler];
    v3[2]();
  }
}

- (void)createTextView
{
  id v3 = (UITextView *)objc_alloc_init(MEMORY[0x263F1CAC8]);
  [(WDContactConsolidationLearnMoreViewController *)self setView:v3];
  double v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [(UITextView *)v3 setFont:v4];

  [(UITextView *)v3 setEditable:0];
  objc_super v5 = WDBundle();
  v6 = [v5 localizedStringForKey:@"MEDICAL_ID_CONSOLIDATION_LEARN_MORE_BODY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [(UITextView *)v3 setText:v6];

  textView = self->_textView;
  self->_textView = v3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end