@interface DMCProfileTableViewController
- (BOOL)canBeShownFromSuspendedState;
- (DMCProfileTableViewController)init;
- (DMCProfileTableViewController)initWithStyle:(int64_t)a3;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)hideProgressInNavBarShowBackButton:(BOOL)a3;
- (void)presentViewController:(id)a3;
- (void)reloadTableOnContentSizeCategoryChange;
- (void)showProgressInNavBar;
- (void)updateExtendedLayoutIncludesOpaqueBars;
@end

@implementation DMCProfileTableViewController

- (DMCProfileTableViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMCProfileTableViewController;
  v2 = [(DMCProfileTableViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(DMCProfileTableViewController *)v2 tableView];
    [v4 setCellLayoutMarginsFollowReadableWidth:1];
  }
  return v3;
}

- (DMCProfileTableViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMCProfileTableViewController;
  v3 = [(DMCProfileTableViewController *)&v7 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(DMCProfileTableViewController *)v3 tableView];
    [v5 setCellLayoutMarginsFollowReadableWidth:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileTableViewController;
  [(DMCProfileTableViewController *)&v4 dealloc];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3 = [MEMORY[0x263F5FBC0] appearance];
  -[DMCProfileTableViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", [v3 extendedLayoutIncludesOpaqueBars]);
}

- (void)reloadTableOnContentSizeCategoryChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x263F1D158] object:0];
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3 = [(DMCProfileTableViewController *)self tableView];
  [v3 reloadData];
}

- (void)presentViewController:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(DMCProfileTableViewController *)self navigationController];

  if (v4)
  {
    v5 = [(DMCProfileTableViewController *)self navigationController];
    [v5 pushViewController:v6 animated:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(DMCProfileTableViewController *)self pushViewController:v6 animated:1];
    }
    else {
      [(DMCProfileTableViewController *)self presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (void)showProgressInNavBar
{
  id v8 = [NSString DMCMakeUUID];
  id v3 = [MEMORY[0x263F08D40] valueWithPointer:self];
  objc_super v4 = viewControllerPointerToIdentifierMap();
  [v4 setObject:v8 forKeyedSubscript:v3];

  v5 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  id v6 = [(DMCProfileTableViewController *)self navigationItem];
  [v5 startAnimatingInNavItem:v6 forIdentifier:v8 hideBackButton:1];

  objc_super v7 = [(DMCProfileTableViewController *)self view];
  [v7 setUserInteractionEnabled:0];
}

- (void)hideProgressInNavBarShowBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [MEMORY[0x263F08D40] valueWithPointer:self];
  v5 = viewControllerPointerToIdentifierMap();
  id v6 = [v5 objectForKeyedSubscript:v11];

  if (v6)
  {
    objc_super v7 = viewControllerPointerToIdentifierMap();
    [v7 removeObjectForKey:v11];

    id v8 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
    [v8 stopAnimatingForIdentifier:v6];

    if (v3)
    {
      v9 = [(DMCProfileTableViewController *)self navigationItem];
      [v9 setHidesBackButton:0 animated:1];
    }
  }
  v10 = [(DMCProfileTableViewController *)self view];
  [v10 setUserInteractionEnabled:1];
}

@end