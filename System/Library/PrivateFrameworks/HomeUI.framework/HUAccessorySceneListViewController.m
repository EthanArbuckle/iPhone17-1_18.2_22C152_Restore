@interface HUAccessorySceneListViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUAccessorySceneListContentViewController)existingSceneListContentViewController;
- (HUAccessorySceneListContentViewController)suggestedSceneListContentViewController;
- (HUAccessorySceneListViewController)initWithServiceLikeItem:(id)a3;
- (id)childViewControllersToPreload;
- (void)setExistingSceneListContentViewController:(id)a3;
- (void)setSuggestedSceneListContentViewController:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUAccessorySceneListViewController

- (HUAccessorySceneListViewController)initWithServiceLikeItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUAccessorySceneListItemManager alloc] initWithDelegate:self serviceLikeItem:v4];
  v13.receiver = self;
  v13.super_class = (Class)HUAccessorySceneListViewController;
  v6 = [(HUItemTableViewController *)&v13 initWithItemManager:v5 tableViewStyle:1];
  if (v6)
  {
    v7 = [[HUAccessorySceneListContentViewController alloc] initWithServiceLikeItem:v4 contentSource:0 selectionType:0];
    existingSceneListContentViewController = v6->_existingSceneListContentViewController;
    v6->_existingSceneListContentViewController = v7;

    [(HUAccessorySceneListContentViewController *)v6->_existingSceneListContentViewController setIncludeTopMargin:0];
    [(HUAccessorySceneListContentViewController *)v6->_suggestedSceneListContentViewController setAnalyticsPresentationContext:@"accessory-scene-list"];
    v9 = [[HUAccessorySceneListContentViewController alloc] initWithServiceLikeItem:v4 contentSource:1 selectionType:0];
    suggestedSceneListContentViewController = v6->_suggestedSceneListContentViewController;
    v6->_suggestedSceneListContentViewController = v9;

    [(HUAccessorySceneListContentViewController *)v6->_suggestedSceneListContentViewController setIncludeTopMargin:0];
    [(HUAccessorySceneListContentViewController *)v6->_suggestedSceneListContentViewController setAnalyticsPresentationContext:@"accessory-scene-list"];
    v11 = _HULocalizedStringWithDefaultValue(@"HUAccessorySceneListViewTitle", @"HUAccessorySceneListViewTitle", 1);
    [(HUAccessorySceneListViewController *)v6 setTitle:v11];
  }
  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUAccessorySceneListViewController;
  [(HUItemTableViewController *)&v8 viewDidLoad];
  v3 = [(HUAccessorySceneListViewController *)self tableView];
  [v3 setSeparatorStyle:0];

  id v4 = [(HUAccessorySceneListViewController *)self existingSceneListContentViewController];
  v5 = [v4 collectionView];
  [v5 setScrollEnabled:0];

  v6 = [(HUAccessorySceneListViewController *)self suggestedSceneListContentViewController];
  v7 = [v6 collectionView];
  [v7 setScrollEnabled:0];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v5 = objc_opt_class();

  return (Class)v5;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [v13 setBackgroundColor:v14];

    v15 = [MEMORY[0x1E4F428B8] clearColor];
    v16 = [v13 contentView];
    [v16 setBackgroundColor:v15];

    v17 = [(HUItemTableViewController *)self itemManager];
    id v18 = [v17 existingScenesContentItem];

    if (v18 == v11)
    {
      uint64_t v21 = [(HUAccessorySceneListViewController *)self existingSceneListContentViewController];
    }
    else
    {
      v19 = [(HUItemTableViewController *)self itemManager];
      id v20 = [v19 suggestedScenesContentItem];

      if (v20 != v11)
      {
LABEL_7:
        v23 = [v11 latestResults];
        v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v13 setAccessibilityIdentifier:v24];

        goto LABEL_8;
      }
      uint64_t v21 = [(HUAccessorySceneListViewController *)self suggestedSceneListContentViewController];
    }
    v22 = (void *)v21;
    [v13 setViewController:v21];

    goto LABEL_7;
  }
LABEL_8:
  v25.receiver = self;
  v25.super_class = (Class)HUAccessorySceneListViewController;
  [(HUItemTableViewController *)&v25 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (id)childViewControllersToPreload
{
  v3 = objc_opt_new();
  id v4 = [(HUAccessorySceneListViewController *)self existingSceneListContentViewController];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  v5 = [(HUAccessorySceneListViewController *)self suggestedSceneListContentViewController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (HUAccessorySceneListContentViewController)existingSceneListContentViewController
{
  return self->_existingSceneListContentViewController;
}

- (void)setExistingSceneListContentViewController:(id)a3
{
}

- (HUAccessorySceneListContentViewController)suggestedSceneListContentViewController
{
  return self->_suggestedSceneListContentViewController;
}

- (void)setSuggestedSceneListContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedSceneListContentViewController, 0);

  objc_storeStrong((id *)&self->_existingSceneListContentViewController, 0);
}

@end