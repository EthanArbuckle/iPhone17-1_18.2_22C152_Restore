@interface UITableViewController
@end

@implementation UITableViewController

void __81__UITableViewController_MessageUI__mf_updatePreferredContentSizeBasedOnTableView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained preferredContentSize];
  double v3 = v2;
  [*(id *)(a1 + 32) contentSize];
  [WeakRetained setPreferredContentSize:v3];
}

@end