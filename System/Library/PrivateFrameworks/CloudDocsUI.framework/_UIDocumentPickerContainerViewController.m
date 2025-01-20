@interface _UIDocumentPickerContainerViewController
+ (id)userDefaults;
- (BOOL)isEditing;
- (CGPoint)contentOffset;
- (NSArray)indexPathsForSelectedItems;
- (_UIDocumentPickerContainedViewController)childViewController;
- (_UIDocumentPickerContainerModel)model;
- (_UIDocumentPickerContainerViewController)initWithModel:(id)a3;
- (_UIDocumentPickerSearchPaletteView)searchView;
- (_UIDocumentPickerServiceViewController)serviceViewController;
- (_UIDocumentPickerSortOrderView)sortView;
- (_UIDocumentSearchListController)resultsController;
- (int)sortOrder;
- (int64_t)defaultDisplayMode;
- (int64_t)displayMode;
- (int64_t)explicitDisplayMode;
- (void)_sortOrderViewChanged:(id)a3;
- (void)_startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4;
- (void)_updateTraitCollection;
- (void)dealloc;
- (void)displayModeChanged;
- (void)ensureChildViewController;
- (void)invalidate;
- (void)setChildViewController:(id)a3;
- (void)setChildViewController:(id)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDefaultDisplayMode:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExplicitDisplayMode:(int64_t)a3;
- (void)setIndexPathsForSelectedItems:(id)a3;
- (void)setModel:(id)a3;
- (void)setResultsController:(id)a3;
- (void)setSearchView:(id)a3;
- (void)setServiceViewController:(id)a3;
- (void)setSortOrder:(int)a3;
- (void)setSortView:(id)a3;
- (void)setupSearchController;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UIDocumentPickerContainerViewController

- (_UIDocumentPickerContainerViewController)initWithModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentPickerContainerViewController;
  v5 = [(_UIDocumentPickerContainerViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(_UIDocumentPickerContainerViewController *)v5 setModel:v4];
    if ([v4 sortOrder] != 3) {
      objc_msgSend(v4, "setSortOrder:", -[_UIDocumentPickerContainerViewController sortOrder](v6, "sortOrder"));
    }
    v7 = [v4 displayTitle];
    [(_UIDocumentPickerContainerViewController *)v6 setTitle:v7];

    [(_UIDocumentPickerContainerViewController *)v6 setEdgesForExtendedLayout:0];
    v8 = objc_alloc_init(_UIDocumentPickerSortOrderView);
    sortView = v6->_sortView;
    v6->_sortView = v8;

    -[_UIDocumentPickerSortOrderView setValue:](v6->_sortView, "setValue:", [v4 sortOrder]);
    [(_UIDocumentPickerSortOrderView *)v6->_sortView setListMode:[(_UIDocumentPickerContainerViewController *)v6 displayMode]];
    [(_UIDocumentPickerSortOrderView *)v6->_sortView addTarget:v6 action:sel__sortOrderViewChanged_ forControlEvents:4096];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_UIDocumentPickerDisplayModeChangedHandler, @"_UIDocumentPickerDisplayModeChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  return v6;
}

- (void)invalidate
{
  id v2 = [(_UIDocumentPickerContainerViewController *)self model];
  [v2 stopMonitoringChanges];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"_UIDocumentPickerDisplayModeChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerContainerViewController;
  [(_UIDocumentPickerContainerViewController *)&v4 dealloc];
}

- (void)displayModeChanged
{
  [(_UIDocumentPickerContainerViewController *)self ensureChildViewController];

  [(_UIDocumentPickerContainerViewController *)self _updateTraitCollection];
}

- (void)ensureChildViewController
{
  v3 = (objc_class *)objc_opt_class();
  int64_t v4 = [(_UIDocumentPickerContainerViewController *)self displayMode];
  v5 = [(_UIDocumentPickerContainerViewController *)self childViewController];
  if (objc_opt_isKindOfClass())
  {
    v6 = [(_UIDocumentPickerContainerViewController *)self childViewController];

    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  v7 = self->_childViewController;
  id v8 = [v3 alloc];
  v9 = [(_UIDocumentPickerContainerViewController *)self model];
  v10 = (void *)[v8 initWithModel:v9];

  objc_msgSend(v10, "setDisplayMode:", -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode"));
  [(_UIDocumentPickerContainerViewController *)self setChildViewController:v10];
  if ([(_UIDocumentPickerContainedViewController *)v7 isEditing])
  {
    [(_UIDocumentPickerContainedViewController *)self->_childViewController setEditing:1];
    v11 = [(_UIDocumentPickerContainedViewController *)v7 indexPathsForSelectedItems];
    [(_UIDocumentPickerContainedViewController *)self->_childViewController setIndexPathsForSelectedItems:v11];
  }
  if (v4 != 3)
  {
    objc_super v12 = [(_UIDocumentPickerContainerViewController *)self sortView];
    [v10 setSortView:v12];

    [(_UIDocumentPickerContainerViewController *)self setupSearchController];
  }

LABEL_10:
  int64_t v13 = [(_UIDocumentPickerContainerViewController *)self displayMode];
  v14 = [(_UIDocumentPickerContainerViewController *)self childViewController];
  [v14 setDisplayMode:v13];

  int64_t v15 = [(_UIDocumentPickerContainerViewController *)self displayMode];
  id v16 = [(_UIDocumentPickerContainerViewController *)self sortView];
  [v16 setListMode:v15];
}

- (void)_updateTraitCollection
{
  v31[4] = *MEMORY[0x263EF8340];
  v3 = [(_UIDocumentPickerContainerViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  double Height = CGRectGetHeight(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  if (CGRectGetWidth(v33) >= 500.0
    && (v34.origin.x = v5, v34.origin.y = v7, v34.size.width = v9, v34.size.height = v11, CGRectGetHeight(v34) >= 500.0))
  {
    v14 = [(_UIDocumentPickerContainerViewController *)self traitCollection];
    BOOL v13 = [v14 userInterfaceIdiom] == 0;
  }
  else
  {
    BOOL v13 = 1;
  }
  BOOL v15 = [(_UIDocumentPickerContainerViewController *)self displayMode] != 1;
  id v16 = (void *)MEMORY[0x263F1CB00];
  v17 = [NSNumber numberWithBool:Height <= 130.0];
  v18 = [v16 _traitCollectionWithValue:v17 forTraitNamed:@"TightMargins"];

  v19 = (void *)MEMORY[0x263F1CB00];
  v20 = [NSNumber numberWithBool:v13];
  v21 = [v19 _traitCollectionWithValue:v20 forTraitNamed:@"CompactIcons"];

  v22 = (void *)MEMORY[0x263F1CB00];
  v23 = [NSNumber numberWithBool:v15];
  v24 = [v22 _traitCollectionWithValue:v23 forTraitNamed:@"ListMode"];

  v25 = (void *)MEMORY[0x263F1CB00];
  v30.receiver = self;
  v30.super_class = (Class)_UIDocumentPickerContainerViewController;
  v26 = [(_UIDocumentPickerContainerViewController *)&v30 traitCollection];
  v31[0] = v26;
  v31[1] = v18;
  v31[2] = v21;
  v31[3] = v24;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  v28 = [v25 traitCollectionWithTraitsFromCollections:v27];

  v29 = [(_UIDocumentPickerContainerViewController *)self parentViewController];
  [v29 setOverrideTraitCollection:v28 forChildViewController:self];
}

- (void)setupSearchController
{
  if (self->_resultsController)
  {
    v3 = [_UIDocumentPickerSearchPaletteView alloc];
    double v4 = [(_UIDocumentPickerContainerViewController *)self view];
    [v4 bounds];
    CGFloat v5 = -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](v3, "initWithFrame:resultsController:", self->_resultsController, 0.0, 0.0);
    searchView = self->_searchView;
    self->_searchView = v5;

    [(_UIDocumentPickerSearchPaletteView *)self->_searchView setAutoresizingMask:18];
    childViewController = self->_childViewController;
    double v8 = [(_UIDocumentPickerSearchPaletteView *)self->_searchView searchController];
    [v8 setDelegate:childViewController];

    [(_UIDocumentPickerContainedViewController *)self->_childViewController setPinnedHeaderView:self->_searchView animated:0];
    id v12 = [(_UIDocumentPickerSearchPaletteView *)self->_searchView searchController];
    CGFloat v9 = [v12 searchBar];
    objc_msgSend(v9, "_setEnabled:animated:", -[_UIDocumentPickerContainerViewController isEditing](self, "isEditing") ^ 1, 0);
  }
  else
  {
    double v10 = self->_searchView;
    self->_searchView = 0;

    CGFloat v11 = self->_childViewController;
    [(_UIDocumentPickerContainedViewController *)v11 setPinnedHeaderView:0 animated:0];
  }
}

- (void)_startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGFloat v7 = [(_UIDocumentPickerSearchPaletteView *)self->_searchView searchController];
  double v8 = [v7 searchBar];
  CGFloat v9 = v8;
  if (v4) {
    [v8 becomeFirstResponder];
  }
  else {
    [v7 setActive:1];
  }
  double v10 = (void *)*MEMORY[0x263F1D020];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93___UIDocumentPickerContainerViewController__startSearchWithQueryString_becomeFirstResponder___block_invoke;
  v13[3] = &unk_26492CCC8;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  [v10 _performBlockAfterCATransactionCommits:v13];
}

- (void)setChildViewController:(id)a3
{
}

- (void)setChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 beginAppearanceTransition:1 animated:v4];
  CGFloat v7 = [v6 view];
  double v8 = [(_UIDocumentPickerContainerViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  [(_UIDocumentPickerContainerViewController *)self addChildViewController:v6];
  CGFloat v9 = [v6 view];
  [v9 setAutoresizingMask:18];

  double v10 = [(_UIDocumentPickerContainerViewController *)self serviceViewController];
  [v6 setServiceViewController:v10];

  id v11 = [(_UIDocumentPickerContainerViewController *)self view];
  id v12 = [v6 view];
  [v11 addSubview:v12];

  BOOL v13 = self->_childViewController;
  id v14 = (void *)MEMORY[0x263F1CB60];
  id v15 = [(_UIDocumentPickerContainedViewController *)self->_childViewController view];
  id v16 = [v6 view];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76___UIDocumentPickerContainerViewController_setChildViewController_animated___block_invoke;
  v21[3] = &unk_26492D5F8;
  id v17 = v6;
  id v22 = v17;
  v23 = self;
  v24 = v13;
  v18 = v13;
  [v14 transitionFromView:v15 toView:v16 duration:5242880 options:v21 completion:0.3];

  childViewController = self->_childViewController;
  self->_childViewController = (_UIDocumentPickerContainedViewController *)v17;
  id v20 = v17;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerContainerViewController;
  [(_UIDocumentPickerContainerViewController *)&v5 viewWillAppear:a3];
  [(_UIDocumentPickerContainerViewController *)self setDefinesPresentationContext:1];
  BOOL v4 = [(_UIDocumentPickerContainerViewController *)self serviceViewController];

  if (v4) {
    [(_UIDocumentPickerContainerViewController *)self ensureChildViewController];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerContainerViewController;
  [(_UIDocumentPickerContainerViewController *)&v4 viewWillDisappear:a3];
  [(_UIDocumentPickerContainerViewController *)self setDefinesPresentationContext:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerViewController;
  [(_UIDocumentPickerContainerViewController *)&v3 viewDidLayoutSubviews];
  [(_UIDocumentPickerContainerViewController *)self _updateTraitCollection];
}

- (void)_sortOrderViewChanged:(id)a3
{
  id v7 = a3;
  int v4 = [v7 value];
  if (v4 == [(_UIDocumentPickerContainerViewController *)self sortOrder])
  {
    -[_UIDocumentPickerContainerViewController setDefaultDisplayMode:](self, "setDefaultDisplayMode:", [v7 listMode]);
    [(_UIDocumentPickerContainerViewController *)self displayModeChanged];
    [(_UIDocumentPickerContainedViewController *)self->_childViewController scrollSortViewToVisible];
  }
  else
  {
    -[_UIDocumentPickerContainerViewController setSortOrder:](self, "setSortOrder:", [v7 value]);
    uint64_t v5 = [v7 value];
    id v6 = [(_UIDocumentPickerContainerViewController *)self model];
    [v6 setSortOrder:v5];
  }
}

- (void)setServiceViewController:(id)a3
{
  id obj = a3;
  id v4 = [(_UIDocumentPickerContainerViewController *)self serviceViewController];

  uint64_t v5 = obj;
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_serviceViewController, obj);
    uint64_t v5 = obj;
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[_UIDocumentPickerContainedViewController setEditing:animated:](self->_childViewController, "setEditing:animated:");
  id v9 = [(_UIDocumentPickerContainerViewController *)self searchView];
  id v7 = [v9 searchController];
  double v8 = [v7 searchBar];
  [v8 _setEnabled:!v5 animated:v4];
}

- (void)setEditing:(BOOL)a3
{
}

- (BOOL)isEditing
{
  return [(_UIDocumentPickerContainedViewController *)self->_childViewController isEditing];
}

- (void)setIndexPathsForSelectedItems:(id)a3
{
}

- (NSArray)indexPathsForSelectedItems
{
  return (NSArray *)[(_UIDocumentPickerContainedViewController *)self->_childViewController indexPathsForSelectedItems];
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIDocumentPickerContainedViewController *)self->_childViewController scrollView];
  objc_msgSend(v5, "setContentOffset:", x, y);
}

- (CGPoint)contentOffset
{
  id v2 = [(_UIDocumentPickerContainedViewController *)self->_childViewController scrollView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

+ (id)userDefaults
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];

  return v2;
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v10 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  double v4 = [v10 objectForKey:@"_UIDocumentPickerSettings"];
  double v5 = (void *)[v4 mutableCopy];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  double v8 = v7;

  id v9 = [NSNumber numberWithUnsignedInt:v3];
  [v8 setObject:v9 forKey:@"sortOrder"];

  [v10 setObject:v8 forKey:@"_UIDocumentPickerSettings"];
}

- (int)sortOrder
{
  id v2 = +[_UIDocumentPickerContainerViewController userDefaults];
  uint64_t v3 = [v2 objectForKey:@"_UIDocumentPickerSettings"];
  double v4 = (void *)[v3 mutableCopy];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v7 = v6;

  double v8 = [v7 objectForKey:@"sortOrder"];
  int v9 = [v8 intValue];

  return v9;
}

- (void)setDefaultDisplayMode:(int64_t)a3
{
  id v11 = +[_UIDocumentPickerContainerViewController userDefaults];
  double v4 = [v11 objectForKey:@"_UIDocumentPickerSettings"];
  double v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  double v8 = v7;

  int v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forKey:@"listMode"];

  [v11 setObject:v8 forKey:@"_UIDocumentPickerSettings"];
  [v11 synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_UIDocumentPickerDisplayModeChanged", 0, 0, 1u);
}

- (int64_t)defaultDisplayMode
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  uint64_t v3 = [v2 objectForKey:@"_UIDocumentPickerSettings"];
  double v4 = (void *)[v3 mutableCopy];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v7 = v6;

  double v8 = [v7 objectForKey:@"listMode"];
  unsigned int v9 = [v8 intValue];

  if (v9 <= 1) {
    int v10 = 1;
  }
  else {
    int v10 = v9;
  }
  int64_t v11 = v10;

  return v11;
}

- (void)setExplicitDisplayMode:(int64_t)a3
{
  self->_explicitDisplayMode = a3;
  BOOL v3 = a3 != 0;
  id v4 = [(_UIDocumentPickerContainerViewController *)self sortView];
  [v4 setListModeToggleHidden:v3];
}

- (int64_t)displayMode
{
  if (self->_explicitDisplayMode) {
    return self->_explicitDisplayMode;
  }
  else {
    return [(_UIDocumentPickerContainerViewController *)self defaultDisplayMode];
  }
}

- (_UIDocumentPickerServiceViewController)serviceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceViewController);

  return (_UIDocumentPickerServiceViewController *)WeakRetained;
}

- (_UIDocumentPickerContainerModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int64_t)explicitDisplayMode
{
  return self->_explicitDisplayMode;
}

- (_UIDocumentSearchListController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
}

- (_UIDocumentPickerContainedViewController)childViewController
{
  return self->_childViewController;
}

- (_UIDocumentPickerSortOrderView)sortView
{
  return self->_sortView;
}

- (void)setSortView:(id)a3
{
}

- (_UIDocumentPickerSearchPaletteView)searchView
{
  return self->_searchView;
}

- (void)setSearchView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_sortView, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_serviceViewController);
}

@end