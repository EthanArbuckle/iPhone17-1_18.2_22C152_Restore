@interface WDAppleInternalConsentViewController
- (BOOL)shouldCustomizeNavigationBar;
- (UIViewController)actionViewController;
- (WDAppleInternalConsentViewController)initWithPresentingViewController:(id)a3 completionBlock:(id)a4;
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)completionBlock;
- (id)titleString;
- (int64_t)bodyTextAlignment;
- (unint64_t)supportedInterfaceOrientations;
- (void)acceptButtonTapped:(id)a3;
- (void)buttonAtIndexTapped:(int64_t)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)declineButtonTapped:(id)a3;
- (void)setActionViewController:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)updateBodyTextAttributesWithMutableString:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WDAppleInternalConsentViewController

- (WDAppleInternalConsentViewController)initWithPresentingViewController:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAppleInternalConsentViewController;
  v9 = [(HKTitledBuddyViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(WDAppleInternalConsentViewController *)v9 setTitle:&stru_1F1D9FF30];
    objc_storeStrong((id *)&v10->_actionViewController, a3);
    uint64_t v11 = [v8 copy];
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = (id)v11;
  }
  return v10;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WDAppleInternalConsentViewController;
  [(HKTitledBuddyViewController *)&v9 viewDidLoad];
  v3 = [(WDAppleInternalConsentViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [(WDAppleInternalConsentViewController *)self setEdgesForExtendedLayout:14];
  v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
  navigationCancelButton = self->_navigationCancelButton;
  self->_navigationCancelButton = v5;

  id v7 = self->_navigationCancelButton;
  id v8 = [(WDAppleInternalConsentViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WDAppleInternalConsentViewController;
  [(HKTitledBuddyViewController *)&v7 viewWillAppear:a3];
  v4 = [(WDAppleInternalConsentViewController *)self navigationController];
  v5 = [v4 navigationBar];
  v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v5 setBarTintColor:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WDAppleInternalConsentViewController;
  [(WDAppleInternalConsentViewController *)&v3 viewWillDisappear:a3];
}

- (BOOL)shouldCustomizeNavigationBar
{
  return 0;
}

- (id)titleString
{
  return (id)HRLocalizedLegalString(@"APPLE_INTERNAL_TITLE", a2);
}

- (id)bodyString
{
  return (id)HRLocalizedLegalString(@"APPLE_INTERNAL_CONSENT_BODY", a2);
}

- (int64_t)bodyTextAlignment
{
  return 4;
}

- (void)updateBodyTextAttributesWithMutableString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1024];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [&unk_1F1DC2228 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&unk_1F1DC2228);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [(WDAppleInternalConsentViewController *)self bodyString];
        uint64_t v13 = [v12 rangeOfString:v11];
        uint64_t v15 = v14;

        objc_msgSend(v4, "addAttribute:value:range:", v9, v5, v13, v15);
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [&unk_1F1DC2228 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (id)bottomAnchoredButtons
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = HRLocalizedLegalString(@"APPLE_INTERNAL_CONSENT_UNDERSTAND", a2);
  v5[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (a3 == 1)
  {
    [(WDAppleInternalConsentViewController *)self declineButtonTapped:0];
  }
  else if (!a3)
  {
    -[WDAppleInternalConsentViewController acceptButtonTapped:](self, "acceptButtonTapped:");
  }
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)acceptButtonTapped:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  [v4 setBool:1 forKey:@"WDInternalHealthRecordsConsentScreenShownKey"];

  v5 = (void (*)(void))*((void *)self->_completionBlock + 2);
  v5();
}

- (void)declineButtonTapped:(id)a3
{
}

- (UIViewController)actionViewController
{
  return self->_actionViewController;
}

- (void)setActionViewController:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_actionViewController, 0);
  objc_storeStrong((id *)&self->_navigationCancelButton, 0);
}

@end