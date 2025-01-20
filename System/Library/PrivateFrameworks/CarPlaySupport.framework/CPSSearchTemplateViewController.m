@interface CPSSearchTemplateViewController
- (BOOL)_isSceneActive;
- (BOOL)didDisappear;
- (BOOL)didPop;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (CPListTemplate)listTemplate;
- (CPSSearchTemplateViewController)initWithSearchTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5 interactionModel:(unint64_t)a6;
- (CPSTemplateViewControllerDelegate)viewControllerDelegate;
- (CPSearchClientTemplateDelegate)searchTemplateDelegate;
- (CPSearchTemplate)searchTemplate;
- (CPTemplate)associatedTemplate;
- (CPTemplateDelegate)templateDelegate;
- (NAFuture)templateProviderFuture;
- (void)_cleanup;
- (void)_cps_viewControllerWasPopped;
- (void)didDismissSearchController:(id)a3;
- (void)listTemplate:(id)a3 didSelectListItem:(id)a4 completionHandler:(id)a5;
- (void)removeFromParentViewController;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAssociatedTemplate:(id)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidPop:(BOOL)a3;
- (void)setListTemplate:(id)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSSearchTemplateViewController

- (CPSSearchTemplateViewController)initWithSearchTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5 interactionModel:(unint64_t)a6
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  v23[1] = (id)a6;
  id v6 = objc_alloc(MEMORY[0x263EFCA30]);
  v23[0] = (id)[v6 initWithTitle:0 sections:MEMORY[0x263EFFA68]];
  v7 = [CPSListTemplateViewController alloc];
  id v22 = [(CPSListTemplateViewController *)v7 initWithListTemplate:v23[0] templateDelegate:v23[0] templateEnvironment:v24];
  id v21 = (id)[objc_alloc(MEMORY[0x263F1C958]) initWithSearchResultsController:v22];
  [v21 _setRequestedInteractionModel:a6];
  v8 = v27;
  v27 = 0;
  v27 = [(UISearchContainerViewController *)v8 initWithSearchController:v21];
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    objc_storeStrong((id *)&v27->_templateDelegate, v25);
    objc_storeStrong((id *)&v27->_associatedTemplate, location[0]);
    uint64_t v9 = objc_opt_new();
    templateProviderFuture = v27->_templateProviderFuture;
    v27->_templateProviderFuture = (NAFuture *)v9;

    [v23[0] connectTemplateProvider:v22];
    [v23[0] setDelegate:v27];
    objc_storeStrong((id *)&v27->_listTemplate, v23[0]);
    v13 = v27;
    v14 = [(UISearchContainerViewController *)v27 searchController];
    [(UISearchController *)v14 setDelegate:v13];

    v15 = v27;
    v16 = [(UISearchContainerViewController *)v27 searchController];
    [(UISearchController *)v16 setSearchResultsUpdater:v15];

    v17 = [(UISearchContainerViewController *)v27 searchController];
    [(UISearchController *)v17 setHidesNavigationBarDuringPresentation:0];
  }
  v12 = v27;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v12;
}

- (void)setDidPop:(BOOL)a3
{
  if (self->_didPop != a3)
  {
    self->_didPop = a3;
    if (a3 && [(CPSSearchTemplateViewController *)self didDisappear]) {
      [(CPSSearchTemplateViewController *)self _cleanup];
    }
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3)
  {
    self->_didDisappear = a3;
    if (a3 && [(CPSSearchTemplateViewController *)self didPop]) {
      [(CPSSearchTemplateViewController *)self _cleanup];
    }
  }
}

- (void)removeFromParentViewController
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSSearchTemplateViewController;
  [(CPSSearchTemplateViewController *)&v2 removeFromParentViewController];
  [(CPSSearchTemplateViewController *)v4 _cleanup];
}

- (void)_cleanup
{
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_super v2 = [(UISearchContainerViewController *)self searchController];
  [(UISearchController *)v2 setActive:0];

  SEL v3 = [(CPSSearchTemplateViewController *)self viewControllerDelegate];
  [(CPSTemplateViewControllerDelegate *)v3 templateViewControllerDidPop:self];
}

- (void)viewDidLoad
{
  v18 = self;
  SEL v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)CPSSearchTemplateViewController;
  [(UISearchContainerViewController *)&v16 viewDidLoad];
  objc_super v2 = v18;
  v4 = [(UISearchContainerViewController *)v18 searchController];
  SEL v3 = [(UISearchController *)v4 searchBar];
  [(UISearchBar *)v3 setDelegate:v2];

  id v6 = [(UISearchContainerViewController *)v18 searchController];
  v5 = [(UISearchController *)v6 searchBar];
  [(UISearchBar *)v5 setShowsCancelButton:1];

  v8 = [(UISearchContainerViewController *)v18 searchController];
  v7 = [(UISearchController *)v8 searchBar];
  -[UISearchBar setSearchBarStyle:](v7, "setSearchBarStyle:");

  id v10 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v9 = (id)[(CPSSearchTemplateViewController *)v18 view];
  [v9 setBackgroundColor:v10];

  v13 = [(UISearchContainerViewController *)v18 searchController];
  v12 = [(UISearchController *)v13 searchBar];
  id v11 = (id)[(CPSSearchTemplateViewController *)v18 navigationItem];
  [v11 setTitleView:v12];

  id v14 = (id)[(CPSSearchTemplateViewController *)v18 navigationItem];
  [v14 setHidesBackButton:1];

  [(CPSSearchTemplateViewController *)v18 setDefinesPresentationContext:1];
  [(CPSSearchTemplateViewController *)v18 setExtendedLayoutIncludesOpaqueBars:1];
  [(CPSSearchTemplateViewController *)v18 setEdgesForExtendedLayout:1];
  v15 = [(CPSSearchTemplateViewController *)v18 templateProviderFuture];
  [(NAFuture *)v15 finishWithResult:v18];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  [(CPSSearchTemplateViewController *)&v8 viewWillAppear:a3];
  [(CPSSearchTemplateViewController *)v11 setDidPop:0];
  [(CPSSearchTemplateViewController *)v11 setDidDisappear:0];
  id v6 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    v5 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
    v4 = [(CPSSearchTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateWillAppearWithIdentifier:animated:](v5, "templateWillAppearWithIdentifier:animated:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  [(UISearchContainerViewController *)&v8 viewDidAppear:a3];
  id v6 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    v5 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
    v4 = [(CPSSearchTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  [(CPSSearchTemplateViewController *)&v8 viewWillDisappear:a3];
  id v6 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    v5 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
    v4 = [(CPSSearchTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v5, "templateWillDisappearWithIdentifier:animated:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  [(UISearchContainerViewController *)&v8 viewDidDisappear:a3];
  id v6 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    v5 = [(CPSSearchTemplateViewController *)v11 templateDelegate];
    v4 = [(CPSSearchTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");
  }
  [(CPSSearchTemplateViewController *)v11 setDidDisappear:1];
}

- (CPSearchTemplate)searchTemplate
{
  id v3 = objc_opt_class();
  v4 = [(CPSSearchTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_14(v3, v4);

  return (CPSearchTemplate *)v5;
}

- (CPSearchClientTemplateDelegate)searchTemplateDelegate
{
  return [(CPSSearchTemplateViewController *)self templateDelegate];
}

- (void)_cps_viewControllerWasPopped
{
  char v7 = self;
  location[1] = (id)a2;
  id v3 = objc_opt_class();
  id v5 = [(UISearchContainerViewController *)v7 searchController];
  v4 = [(UISearchController *)v5 searchResultsController];
  location[0] = CPSSafeCast_14(v3, v4);

  if (location[0])
  {
    objc_super v2 = [(CPSSearchTemplateViewController *)v7 viewControllerDelegate];
    [(CPSTemplateViewControllerDelegate *)v2 templateViewControllerDidPop:location[0]];
  }
  [(CPSSearchTemplateViewController *)v7 setDidPop:1];
  objc_storeStrong(location, 0);
}

- (void)listTemplate:(id)a3 didSelectListItem:(id)a4 completionHandler:(id)a5
{
  objc_super v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v11 = [(CPSSearchTemplateViewController *)v16 searchTemplateDelegate];
  char v12 = [(CPSearchClientTemplateDelegate *)v11 conformsToProtocol:&unk_26DF78558];

  if (v12)
  {
    objc_super v8 = [(CPSSearchTemplateViewController *)v16 searchTemplateDelegate];
    char v7 = [(CPSSearchTemplateViewController *)v16 searchTemplate];
    id v6 = (id)[(CPSearchTemplate *)v7 identifier];
    id v5 = (id)[v14 identifier];
    -[CPSearchClientTemplateDelegate searchTemplateWithIdentifier:selectedResultWithIdentifier:completionHandler:](v8, "searchTemplateWithIdentifier:selectedResultWithIdentifier:completionHandler:", v6);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(CPSSearchTemplateViewController *)v9 searchTemplateDelegate];
  char v7 = [(CPSearchClientTemplateDelegate *)v6 conformsToProtocol:&unk_26DF78558];

  if (v7)
  {
    id v5 = [(CPSSearchTemplateViewController *)v9 searchTemplateDelegate];
    v4 = [(CPSSearchTemplateViewController *)v9 searchTemplate];
    id v3 = (id)[(CPSearchTemplate *)v4 identifier];
    -[CPSearchClientTemplateDelegate searchTemplateSearchButtonPressedWithIdentifier:](v5, "searchTemplateSearchButtonPressedWithIdentifier:");
  }
  objc_storeStrong(location, 0);
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  SEL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v7 = objc_opt_class();
  SEL v10 = [(UISearchContainerViewController *)v17 searchController];
  BOOL v9 = [(UISearchController *)v10 searchResultsController];
  id v8 = CPSSafeCast_14(v7, v9);
  objc_initWeak(&v15, v8);

  char v13 = 0;
  char v11 = 0;
  id v6 = (id)[(CPSSearchTemplateViewController *)v17 viewIfLoaded];
  id v4 = (id)[v6 window];
  BOOL v5 = 1;
  if (v4)
  {
    id v14 = objc_loadWeakRetained(&v15);
    char v13 = 1;
    id v12 = (id)[v14 dataSource];
    char v11 = 1;
    BOOL v5 = 1;
    if ([v12 numberOfItems] <= 0)
    {
      BOOL v5 = 1;
      if ([(CPSSearchTemplateViewController *)v17 _isSceneActive]) {
        BOOL v5 = [(CPSSearchTemplateViewController *)v17 _appearState] != 2;
      }
    }
  }
  BOOL v18 = v5;
  if (v11) {

  }
  if (v13) {
  objc_destroyWeak(&v15);
  }
  objc_storeStrong(location, 0);
  return v18;
}

- (BOOL)_isSceneActive
{
  id v5 = (id)[(CPSSearchTemplateViewController *)self view];
  id v4 = (id)[v5 window];
  id v3 = (id)[v4 windowScene];
  uint64_t v6 = [v3 activationState];

  BOOL v7 = 1;
  if (v6) {
    return v6 == 1;
  }
  return v7;
}

- (void)didDismissSearchController:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[(CPSSearchTemplateViewController *)v9 navigationController];
  id v5 = (id)[v6 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = (id)[(CPSSearchTemplateViewController *)v9 navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
  objc_storeStrong(location, 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = [(CPSSearchTemplateViewController *)v19 searchTemplateDelegate];
  char v8 = [(CPSearchClientTemplateDelegate *)v7 conformsToProtocol:&unk_26DF78558];

  if (v8)
  {
    id v17 = [(CPSSearchTemplateViewController *)v19 searchTemplate];
    id v6 = (id)[location[0] searchBar];
    id v16 = (id)[v6 text];

    objc_initWeak(&from, v19);
    id v5 = [(CPSSearchTemplateViewController *)v19 searchTemplateDelegate];
    id v3 = (id)[v17 identifier];
    id v4 = v16;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __74__CPSSearchTemplateViewController_updateSearchResultsForSearchController___block_invoke;
    char v13 = &unk_2648A5098;
    objc_copyWeak(&v14, &from);
    [(CPSearchClientTemplateDelegate *)v5 searchTemplateWithIdentifier:v3 updateSearchResultsForSearchText:v4 completionResults:&v9];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
}

void __74__CPSSearchTemplateViewController_updateSearchResultsForSearchController___block_invoke(id *a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  id v2 = objc_alloc(MEMORY[0x263EFCA28]);
  v7[0] = (id)[v2 initWithItems:location[0]];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v5 = (id)[WeakRetained listTemplate];
  v9[0] = v7[0];
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  objc_msgSend(v5, "updateSections:");

  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (CPSTemplateViewControllerDelegate)viewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerDelegate);

  return (CPSTemplateViewControllerDelegate *)WeakRetained;
}

- (void)setViewControllerDelegate:(id)a3
{
}

- (CPTemplate)associatedTemplate
{
  return self->_associatedTemplate;
}

- (void)setAssociatedTemplate:(id)a3
{
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (CPListTemplate)listTemplate
{
  return self->_listTemplate;
}

- (void)setListTemplate:(id)a3
{
}

- (BOOL)didPop
{
  return self->_didPop;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void).cxx_destruct
{
}

@end