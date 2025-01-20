@interface HKCDADocumentDetailViewController
- (HKBarButtonItemControl)searchInSegmentControl;
- (HKCDADocumentDetailViewController)initWithReportData:(id)a3;
- (HKCDADocumentReportViewController)formattedReportController;
- (HKLargePlainTextViewController)plainTextReportController;
- (UIBarButtonItem)searchButton;
- (UIStackView)stackView;
- (_HKReportSegmentControl)reportSegmentControl;
- (unint64_t)supportedInterfaceOrientations;
- (void)_replaceLastArrangedViewWith:(id)a3;
- (void)changeReportDisplayed:(id)a3;
- (void)searchButtonAction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKCDADocumentDetailViewController

- (HKCDADocumentDetailViewController)initWithReportData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKCDADocumentDetailViewController;
  v5 = [(HKCDADocumentDetailViewController *)&v15 init];
  v6 = v5;
  if (v5)
  {
    stackView = v5->_stackView;
    v5->_stackView = 0;

    reportSegmentControl = v6->_reportSegmentControl;
    v6->_reportSegmentControl = 0;

    v9 = [[HKCDADocumentReportViewController alloc] initWithDocumentData:v4];
    formattedReportController = v6->_formattedReportController;
    v6->_formattedReportController = v9;

    v11 = [[HKLargePlainTextViewController alloc] initWithData:v4];
    plainTextReportController = v6->_plainTextReportController;
    v6->_plainTextReportController = v11;

    searchButton = v6->_searchButton;
    v6->_searchButton = 0;

    [(HKCDADocumentDetailViewController *)v6 addChildViewController:v6->_formattedReportController];
    [(HKCDADocumentDetailViewController *)v6 addChildViewController:v6->_plainTextReportController];
  }

  return v6;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)HKCDADocumentDetailViewController;
  [(HKCDADocumentDetailViewController *)&v28 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  id v4 = (UIStackView *)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setAxis:1];
  v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v7 = [(HKCDADocumentDetailViewController *)self navigationController];
  v8 = [v7 navigationBar];
  [v8 setBackgroundColor:v6];

  v9 = [[HKBarButtonItemControl alloc] initWithSystemItem:12 preferredHeight:1 collapseHeight:0.0];
  searchInSegmentControl = self->_searchInSegmentControl;
  self->_searchInSegmentControl = v9;

  [(HKBarButtonItemControl *)self->_searchInSegmentControl setHorizontalMargin:5.0];
  [(HKBarButtonItemControl *)self->_searchInSegmentControl setBackgroundColor:v6];
  [(HKBarButtonItemControl *)self->_searchInSegmentControl addTarget:self action:sel_searchButtonAction_ forControlEvents:64];
  [(HKBarButtonItemControl *)self->_searchInSegmentControl setHidden:1];
  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v12 = [[_HKReportSegmentControl alloc] initWithBackgroundColor:v6 dividerColor:v11 rightControl:self->_searchInSegmentControl];
  reportSegmentControl = self->_reportSegmentControl;
  self->_reportSegmentControl = v12;

  v14 = [(_HKReportSegmentControl *)self->_reportSegmentControl segmentControl];
  [v14 addTarget:self action:sel_changeReportDisplayed_ forControlEvents:4096];

  [(UIStackView *)self->_stackView addArrangedSubview:self->_reportSegmentControl];
  objc_super v15 = self->_stackView;
  v16 = [(HKCDADocumentReportViewController *)self->_formattedReportController view];
  [(UIStackView *)v15 addArrangedSubview:v16];

  v17 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v17 isiPad])
  {

    uint64_t v18 = 7;
  }
  else
  {
    v19 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v20 = [v19 isRealityDevice];

    if (v20) {
      uint64_t v18 = 7;
    }
    else {
      uint64_t v18 = 15;
    }
  }
  v21 = [[HKVerticalMarginView alloc] initWithSubview:self->_stackView offsetOptions:v18];
  [(HKCDADocumentDetailViewController *)self setView:v21];
  v22 = [(HKCDADocumentDetailViewController *)self navigationItem];
  v23 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:12 target:self action:sel_searchButtonAction_];
  searchButton = self->_searchButton;
  self->_searchButton = v23;

  [v22 setRightBarButtonItem:self->_searchButton];
  v25 = [(HKCDADocumentDetailViewController *)self tabBarController];
  v26 = [v25 tabBar];
  [v26 setHidden:1];

  v27 = [(HKCDADocumentDetailViewController *)self view];
  [v27 setNeedsLayout];

  [(_HKReportSegmentControl *)self->_reportSegmentControl setNeedsLayout];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKCDADocumentDetailViewController;
  [(HKCDADocumentDetailViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(HKCDADocumentDetailViewController *)self tabBarController];
  v5 = [v4 tabBar];
  [v5 setHidden:0];

  v6 = [(HKCDADocumentDetailViewController *)self navigationController];
  [v6 setNavigationBarHidden:0 animated:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_replaceLastArrangedViewWith:(id)a3
{
  id v6 = a3;
  id v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  if ([v4 count] == 2)
  {
    v5 = [v4 lastObject];
    [v5 removeFromSuperview];
    [(UIStackView *)self->_stackView addArrangedSubview:v6];
  }
}

- (void)changeReportDisplayed:(id)a3
{
  id v4 = [(_HKReportSegmentControl *)self->_reportSegmentControl segmentControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    id v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__plainTextReportController;
  }
  else
  {
    id v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__formattedReportController;
  }
  objc_super v7 = [*(id *)((char *)&self->super.super.super.isa + *v6) view];
  [(HKCDADocumentDetailViewController *)self _replaceLastArrangedViewWith:v7];

LABEL_6:
  id v8 = [(HKCDADocumentDetailViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)searchButtonAction:(id)a3
{
  id v4 = [(_HKReportSegmentControl *)self->_reportSegmentControl segmentControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  if (v5 == 1)
  {
    id v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__plainTextReportController;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__formattedReportController;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v6) startIncrementalSearch];
LABEL_6:
  id v7 = [(HKCDADocumentDetailViewController *)self view];
  [v7 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKCDADocumentDetailViewController;
  [(HKCDADocumentDetailViewController *)&v10 traitCollectionDidChange:a3];
  id v4 = [(HKCDADocumentDetailViewController *)self traitCollection];
  uint64_t v5 = [v4 verticalSizeClass];
  searchInSegmentControl = self->_searchInSegmentControl;
  if (v5 == 1)
  {
    [(HKBarButtonItemControl *)searchInSegmentControl setHidden:0];
    id v7 = [(HKCDADocumentDetailViewController *)self navigationController];
    [v7 setNavigationBarHidden:1 animated:1];
    uint64_t v8 = 0;
  }
  else
  {
    [(HKBarButtonItemControl *)searchInSegmentControl setHidden:1];
    id v7 = [(HKCDADocumentDetailViewController *)self navigationController];
    [v7 setNavigationBarHidden:0 animated:1];
    uint64_t v8 = 15;
  }

  [(HKCDADocumentDetailViewController *)self setEdgesForExtendedLayout:v8];
  v9 = [(HKCDADocumentDetailViewController *)self view];
  [v9 setNeedsLayout];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  objc_super v10 = __73__HKCDADocumentDetailViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_1E6D522F8;
  objc_copyWeak(&v12, &location);
  uint64_t v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  id v7 = [(HKCDADocumentDetailViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __73__HKCDADocumentDetailViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HKCDADocumentDetailViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (_HKReportSegmentControl)reportSegmentControl
{
  return self->_reportSegmentControl;
}

- (HKCDADocumentReportViewController)formattedReportController
{
  return self->_formattedReportController;
}

- (HKLargePlainTextViewController)plainTextReportController
{
  return self->_plainTextReportController;
}

- (UIBarButtonItem)searchButton
{
  return self->_searchButton;
}

- (HKBarButtonItemControl)searchInSegmentControl
{
  return self->_searchInSegmentControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInSegmentControl, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_plainTextReportController, 0);
  objc_storeStrong((id *)&self->_formattedReportController, 0);
  objc_storeStrong((id *)&self->_reportSegmentControl, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end