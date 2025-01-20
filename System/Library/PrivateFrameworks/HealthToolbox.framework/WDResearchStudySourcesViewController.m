@interface WDResearchStudySourcesViewController
+ (id)tableViewSectionClasses;
- (WDResearchStudySourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation WDResearchStudySourcesViewController

+ (id)tableViewSectionClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (WDResearchStudySourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WDResearchStudySourcesViewController;
  v4 = [(WDSourcesViewController *)&v8 initWithProfile:a3 usingInsetStyling:a4];
  if (v4)
  {
    v5 = WDBundle();
    v6 = [v5 localizedStringForKey:@"RESEARCH_STUDIES_LIST_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [(WDResearchStudySourcesViewController *)v4 setTitle:v6];
  }
  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WDResearchStudySourcesViewController;
  [(WDSourcesViewController *)&v5 viewDidLoad];
  v3 = [(WDResearchStudySourcesViewController *)self tableView];
  v4 = HKUIJoinStringsForAutomationIdentifier();
  [v3 setAccessibilityIdentifier:v4];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __76__WDResearchStudySourcesViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_26458DD38;
  objc_copyWeak(&v12, &location);
  objc_super v5 = [v4 actionWithHandler:&v8];
  v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  v7 = [(WDResearchStudySourcesViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __76__WDResearchStudySourcesViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(WDResearchStudySourcesViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

@end