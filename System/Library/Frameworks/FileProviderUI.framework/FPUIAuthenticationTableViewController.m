@interface FPUIAuthenticationTableViewController
+ (id)defaultTitle;
- (BOOL)canTransitionToNextStep;
- (BOOL)isTransitioning;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (FPUIAuthenticationDelegate)authenticationDelegate;
- (FPUIAuthenticationTableViewController)init;
- (NSArray)sectionDescriptors;
- (NSDictionary)rowDescriptors;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_rowDescriptorForIndexPath:(id)a3;
- (id)_rowDescriptorsForSection:(int64_t)a3;
- (id)_tableView:(id)a3 viewOfType:(unint64_t)a4 inSection:(int64_t)a5;
- (id)_titleView;
- (id)defaultLeftBarButtonItem;
- (id)defaultRightBarButtonItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel:(id)a3;
- (void)_setState:(unint64_t)a3;
- (void)_stateDidChange;
- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4;
- (void)authenticationDelegate:(id)a3 didFinishWithError:(id)a4 completionHandler:(id)a5;
- (void)authenticationDelegate:(id)a3 didReceiveCredentialDescriptors:(id)a4;
- (void)authenticationDelegate:(id)a3 didReceiveVolumeMountRepresentations:(id)a4;
- (void)selectTextFieldAtIndexPath:(id)a3;
- (void)setAuthenticationDelegate:(id)a3;
- (void)setCanTransitionToNextStep:(BOOL)a3;
- (void)setNavBarActivityIndicatorHidden:(BOOL)a3;
- (void)setRowDescriptors:(id)a3;
- (void)setSectionDescriptors:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationTableViewController

- (FPUIAuthenticationTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationTableViewController;
  return [(FPUIAuthenticationTableViewController *)&v3 initWithStyle:2];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)FPUIAuthenticationTableViewController;
  [(FPUIAuthenticationTableViewController *)&v12 viewDidLoad];
  objc_super v3 = objc_opt_new();
  v4 = [(FPUIAuthenticationTableViewController *)self tableView];
  [v4 setTableFooterView:v3];

  double v5 = *MEMORY[0x263F1D600];
  v6 = [(FPUIAuthenticationTableViewController *)self tableView];
  [v6 setRowHeight:v5];

  v7 = [(FPUIAuthenticationTableViewController *)self tableView];
  [v7 setEstimatedRowHeight:44.0];

  v8 = [(FPUIAuthenticationTableViewController *)self tableView];
  [v8 setSectionHeaderTopPadding:0.0];

  v9 = [(FPUIAuthenticationTableViewController *)self defaultLeftBarButtonItem];
  v10 = [(FPUIAuthenticationTableViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];

  [(FPUIAuthenticationTableViewController *)self _stateDidChange];
  v11 = [(id)objc_opt_class() defaultTitle];
  [(FPUIAuthenticationTableViewController *)self setTitle:v11];

  [(FPUIAuthenticationTableViewController *)self setupTableViewSections];
}

- (BOOL)isTransitioning
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setTransitioning:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(FPUIAuthenticationTableViewController *)self _setState:self->_state & 0xFFFFFFFFFFFFFFFDLL | v3];
}

- (BOOL)canTransitionToNextStep
{
  return self->_state & 1;
}

- (void)setCanTransitionToNextStep:(BOOL)a3
{
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(FPUIAuthenticationTableViewController *)self _stateDidChange];
  }
}

- (void)_stateDidChange
{
  if ([(FPUIAuthenticationTableViewController *)self isTransitioning])
  {
    uint64_t v3 = [(FPUIAuthenticationTableViewController *)self navigationItem];
    [v3 setRightBarButtonItem:0];
  }
  else
  {
    v4 = [(FPUIAuthenticationTableViewController *)self defaultRightBarButtonItem];
    double v5 = [(FPUIAuthenticationTableViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];

    BOOL v6 = [(FPUIAuthenticationTableViewController *)self canTransitionToNextStep];
    uint64_t v3 = [(FPUIAuthenticationTableViewController *)self navigationItem];
    v7 = [v3 rightBarButtonItem];
    [v7 setEnabled:v6];
  }
  uint64_t v8 = [(FPUIAuthenticationTableViewController *)self isTransitioning] ^ 1;
  id v9 = [(FPUIAuthenticationTableViewController *)self tableView];
  [v9 setUserInteractionEnabled:v8];
}

- (id)defaultLeftBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v11 = FPUILoc(@"CANCEL_NAV_BAR_BUTTON_TITLE", v4, v5, v6, v7, v8, v9, v10, v14);
  objc_super v12 = (void *)[v3 initWithTitle:v11 style:0 target:self action:sel__cancel_];

  return v12;
}

- (id)defaultRightBarButtonItem
{
  return 0;
}

+ (id)defaultTitle
{
  return FPUILoc(@"CONNECT_TO_SERVER", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)setTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FPUIAuthenticationTableViewController;
  id v4 = a3;
  [(FPUIAuthenticationTableViewController *)&v6 setTitle:v4];
  uint64_t v5 = [(FPUIAuthenticationTableViewController *)self _titleView];
  [v5 setTitle:v4];
}

- (id)_titleView
{
  id v4 = [(FPUIAuthenticationTableViewController *)self navigationItem];
  uint64_t v5 = [v4 titleView];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:143 description:@"bad titleView type"];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    objc_super v6 = [(FPUIAuthenticationTableViewController *)self navigationItem];
    [v6 setTitleView:v5];
  }

LABEL_6:

  return v5;
}

- (void)setNavBarActivityIndicatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FPUIAuthenticationTableViewController *)self _titleView];
  [v4 setActivityIndicatorHidden:v3];
}

- (void)selectTextFieldAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPUIAuthenticationTableViewController *)self tableView];
  id v7 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = [v7 textField];
    [v6 becomeFirstResponder];
  }
}

- (void)_cancel:(id)a3
{
  id v3 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  [v3 cancelAuthenticationSession];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionDescriptors count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
  int v7 = [v6 isActive];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(FPUIAuthenticationTableViewController *)self _rowDescriptorsForSection:a4];
  int64_t v9 = [v8 count];

  return v9;
}

- (id)_rowDescriptorsForSection:(int64_t)a3
{
  rowDescriptors = self->_rowDescriptors;
  objc_super v6 = [NSNumber numberWithInteger:a3];
  int v7 = [(NSDictionary *)rowDescriptors objectForKeyedSubscript:v6];

  if (!v7)
  {
    int64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:195 description:@"nil row descriptors"];
  }

  return v7;
}

- (id)_rowDescriptorForIndexPath:(id)a3
{
  id v5 = a3;
  objc_super v6 = -[FPUIAuthenticationTableViewController _rowDescriptorsForSection:](self, "_rowDescriptorsForSection:", [v5 section]);
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndexedSubscript:v7];
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:203 description:@"nil row descriptor"];
  }

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = [(FPUIAuthenticationTableViewController *)self _rowDescriptorForIndexPath:a4];
  [v4 rowHeight];
  double v6 = v5;

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", [v5 section]);
  if ([v6 shouldHighlightRows])
  {
    uint64_t v7 = [(FPUIAuthenticationTableViewController *)self _rowDescriptorForIndexPath:v5];
    [v7 shouldHighlight];
    BOOL v9 = v8 != 0.0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v6 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
  double v7 = 0.0;
  if ([v6 isActive])
  {
    double v8 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
    [v8 headerHeight];
    double v7 = v9;
  }
  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
  double v6 = [(NSArray *)self->_sectionDescriptors lastObject];
  if (v5 == v6)
  {
    [v5 footerHeight];
    double v10 = v9;

    if (v10 == 0.0)
    {
      double v7 = 35.0;
      goto LABEL_7;
    }
  }
  else
  {
  }
  double v7 = 0.0;
  if ([v5 isActive])
  {
    [v5 footerHeight];
    double v7 = v8;
  }
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:");
  uint64_t v6 = [v5 accessoryButtonTapHandler];
  double v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:");
  uint64_t v6 = [v5 selectionHandler];
  double v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
  if ([v4 isActive])
  {
    id v5 = [v4 headerTitle];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a4];
  if ([v4 isActive])
  {
    id v5 = [v4 footerTitle];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_tableView:(id)a3 viewOfType:(unint64_t)a4 inSection:(int64_t)a5
{
  id v8 = a3;
  double v9 = [(NSArray *)self->_sectionDescriptors objectAtIndexedSubscript:a5];
  if (![v9 isActive])
  {
    double v10 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    double v10 = (void *)[v9 footerViewClass];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = [v9 footerViewReuseIdentifier];
  }
  else
  {
    double v10 = (void *)[v9 headerViewClass];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = [v9 headerViewReuseIdentifier];
  }
  objc_super v12 = (void *)v11;
  [v8 registerClass:v10 forHeaderFooterViewReuseIdentifier:v11];
  double v10 = [v8 dequeueReusableHeaderFooterViewWithIdentifier:v12];
  if (a4) {
    [v9 footerViewCustomizationBlock];
  }
  else {
  v13 = [v9 headerViewCustomizationBlock];
  }
  uint64_t v14 = (void (**)(void, void))MEMORY[0x237DF0A80]();

  if (v14) {
    ((void (**)(void, void *))v14)[2](v14, v10);
  }
  v15 = [v8 backgroundColor];
  v16 = [v10 contentView];
  [v16 setBackgroundColor:v15];

LABEL_14:

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return [(FPUIAuthenticationTableViewController *)self _tableView:a3 viewOfType:0 inSection:a4];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return [(FPUIAuthenticationTableViewController *)self _tableView:a3 viewOfType:1 inSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a4;
  sectionDescriptors = self->_sectionDescriptors;
  id v9 = a3;
  double v10 = -[NSArray objectAtIndexedSubscript:](sectionDescriptors, "objectAtIndexedSubscript:", [v7 section]);
  uint64_t v11 = [(FPUIAuthenticationTableViewController *)self _rowDescriptorForIndexPath:v7];
  uint64_t v12 = [v10 rowCellClass];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v10 rowCellReuseIdentifier];
    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = [v11 cellClass];
    uint64_t v15 = [v11 cellReuseIdentifier];
    uint64_t v14 = (void *)v15;
    if (v13)
    {
      if (v15) {
        goto LABEL_6;
      }
    }
    else
    {
      v20 = [MEMORY[0x263F08690] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:337 description:@"nil cell class"];

      uint64_t v13 = 0;
      if (v14) {
        goto LABEL_6;
      }
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:338 description:@"nil cell reuse identifier"];

LABEL_6:
  [v9 registerClass:v13 forCellReuseIdentifier:v14];
  v16 = [v9 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7];

  objc_msgSend(v16, "setSelectionStyle:", objc_msgSend(v11, "cellSelectionStyle"));
  uint64_t v17 = [v11 cellCustomizationHandler];
  v18 = (void *)v17;
  if (v17) {
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v16, v7);
  }

  return v16;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(FPUIAuthenticationTableViewController *)self _rowDescriptorForIndexPath:v7];
  uint64_t v9 = [v8 cellWillDisplayHandler];
  double v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v11, v7);
  }
}

- (void)authenticationDelegate:(id)a3 didReceiveCredentialDescriptors:(id)a4
{
  id v5 = a4;
  id v8 = [[FPUIAuthenticationCredentialsViewController alloc] initWithCredentialDescriptors:v5];

  uint64_t v6 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  [(FPUIAuthenticationTableViewController *)v8 setAuthenticationDelegate:v6];

  id v7 = [(FPUIAuthenticationTableViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];

  [(FPUIAuthenticationTableViewController *)self setNavBarActivityIndicatorHidden:1];
}

- (void)authenticationDelegate:(id)a3 didReceiveVolumeMountRepresentations:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke;
  v8[3] = &unk_264C6D010;
  id v9 = v5;
  double v10 = self;
  id v7 = v5;
  [v6 mountedVolumeIdentifiersWithCompletionHandler:v8];
}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke_2;
  block[3] = &unk_264C6CDD8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke_2(uint64_t a1)
{
  id v4 = [[FPUIAuthenticationVolumeMountViewController alloc] initWithVolumes:*(void *)(a1 + 32) mountedVolumeIdentifiers:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) authenticationDelegate];
  [(FPUIAuthenticationTableViewController *)v4 setAuthenticationDelegate:v2];

  id v3 = [*(id *)(a1 + 48) navigationController];
  [v3 pushViewController:v4 animated:1];

  [*(id *)(a1 + 48) setNavBarActivityIndicatorHidden:1];
}

- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationTableViewController.m" lineNumber:392 description:@"got nil error"];
  }
  [v7 didEncounterError:v8 completionHandler:&__block_literal_global_6];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__FPUIAuthenticationTableViewController_authenticationDelegate_didEncounterError___block_invoke_2;
  block[3] = &unk_264C6CC98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __82__FPUIAuthenticationTableViewController_authenticationDelegate_didEncounterError___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNavBarActivityIndicatorHidden:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setTransitioning:0];
}

- (void)authenticationDelegate:(id)a3 didFinishWithError:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didFinishWithError_completionHandler___block_invoke;
  block[3] = &unk_264C6CCC0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didFinishWithError_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNavBarActivityIndicatorHidden:1];
  [*(id *)(a1 + 32) setTransitioning:0];
  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) authenticationDelegate];
    [v3 didEncounterError:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (FPUIAuthenticationDelegate)authenticationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);

  return (FPUIAuthenticationDelegate *)WeakRetained;
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (void)setSectionDescriptors:(id)a3
{
}

- (NSDictionary)rowDescriptors
{
  return self->_rowDescriptors;
}

- (void)setRowDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionDescriptors, 0);

  objc_destroyWeak((id *)&self->_authenticationDelegate);
}

@end