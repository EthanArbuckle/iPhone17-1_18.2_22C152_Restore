@interface SFReportFeedbackCollectionViewController
@end

@implementation SFReportFeedbackCollectionViewController

void __78___SFReportFeedbackCollectionViewController_initWithBrowserContentController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

id __72___SFReportFeedbackCollectionViewController__createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = a2 == 0;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 setFooterMode:v5];
  [*(id *)(a1 + 32) setHeaderMode:v5];
  v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:v7];

  [v8 contentInsets];
  if (!a2) {
    double v9 = 16.0;
  }
  [v8 setContentInsets:v9];

  return v8;
}

@end