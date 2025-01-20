@interface FPUIAuthenticationLandingViewController
- (BOOL)_canMoveToNextStep;
- (BOOL)textFieldShouldReturn:(id)a3;
- (FPUIAuthenticationLandingViewController)initWithURL:(id)a3;
- (NSURL)initialConnectionURL;
- (id)defaultRightBarButtonItem;
- (void)_connect:(id)a3;
- (void)_connectToServer:(id)a3;
- (void)_disectURLToComponents:(id)a3;
- (void)_showRecentServersSectionWithRecentServers:(id)a3 rowAnimation:(int64_t)a4;
- (void)_transitionUIStateToConnecting;
- (void)_updateNextStep;
- (void)_updateRecentServerSectionVisibilityWithRowAnimation:(int64_t)a3 forceReload:(BOOL)a4;
- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4;
- (void)removeServerWithRepresentation:(id)a3;
- (void)setInitialConnectionURL:(id)a3;
- (void)setupTableViewSections;
- (void)updateForChangedContentSizeCategory;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationLandingViewController

- (FPUIAuthenticationLandingViewController)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationLandingViewController;
  v5 = [(FPUIAuthenticationTableViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    initialURL = v5->_initialURL;
    v5->_initialURL = (NSURL *)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)FPUIAuthenticationLandingViewController;
  [(FPUIAuthenticationTableViewController *)&v7 viewDidLoad];
  [(FPUIAuthenticationLandingViewController *)self _disectURLToComponents:self->_initialURL];
  v3 = [(NSURL *)self->_sanitizedURL absoluteString];
  [(UITextField *)self->_serverInputTextField setText:v3];

  [(FPUIAuthenticationLandingViewController *)self _updateNextStep];
  id v4 = self;
  v8[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v6 = (id)[(FPUIAuthenticationLandingViewController *)self registerForTraitChanges:v5 withHandler:&__block_literal_global_4];
}

uint64_t __54__FPUIAuthenticationLandingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedContentSizeCategory];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationLandingViewController;
  [(FPUIAuthenticationLandingViewController *)&v4 viewDidAppear:a3];
  [(UITextField *)self->_serverInputTextField becomeFirstResponder];
}

- (id)defaultRightBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v11 = FPUILoc(@"CONNECT", v4, v5, v6, v7, v8, v9, v10, v14);
  v12 = (void *)[v3 initWithTitle:v11 style:2 target:self action:sel__connect_];

  return v12;
}

- (void)setupTableViewSections
{
  v31[3] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  [v4 setCellReuseIdentifier:@"ServerAddressCellReuseIdentifier"];
  [v4 setCellClass:objc_opt_class()];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke;
  v27[3] = &unk_264C6CEB8;
  v27[4] = self;
  [v4 setCellCustomizationHandler:v27];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2;
  v26[3] = &unk_264C6CE48;
  v26[4] = self;
  [v4 setSelectionHandler:v26];
  uint64_t v5 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  recentServersSection = self->_recentServersSection;
  self->_recentServersSection = v5;

  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersSection setHeaderHeight:*MEMORY[0x263F1D600]];
  uint64_t v14 = FPUILoc(@"RECENT_SERVERS", v7, v8, v9, v10, v11, v12, v13, v25[0]);
  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersSection setHeaderTitle:v14];

  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersSection setActive:0];
  uint64_t v15 = MEMORY[0x263EFFA68];
  v16 = (NSMutableArray *)[MEMORY[0x263EFFA68] mutableCopy];
  recentServersRowDescriptors = self->_recentServersRowDescriptors;
  self->_recentServersRowDescriptors = v16;

  v18 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  recentServersExtraTopPaddingSection = self->_recentServersExtraTopPaddingSection;
  self->_recentServersExtraTopPaddingSection = v18;

  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersExtraTopPaddingSection setHeaderHeight:12.0];
  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersExtraTopPaddingSection setHeaderTitle:&stru_26E905938];
  [(FPUIAuthenticationSectionDescriptor *)self->_recentServersExtraTopPaddingSection setActive:0];
  v20 = self->_recentServersExtraTopPaddingSection;
  v31[0] = v3;
  v31[1] = v20;
  v31[2] = self->_recentServersSection;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  [(FPUIAuthenticationTableViewController *)self setSectionDescriptors:v21];

  v28 = v4;
  v29[0] = &unk_26E908B80;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v30[0] = v22;
  v30[1] = v15;
  v29[1] = &unk_26E908B98;
  v29[2] = &unk_26E908BB0;
  v30[2] = self->_recentServersRowDescriptors;
  v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  [(FPUIAuthenticationTableViewController *)self setRowDescriptors:v23];

  v24 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_43;
  v25[3] = (uint64_t)&unk_264C6CEE0;
  v25[4] = (uint64_t)self;
  [v24 recentServerRepresentationsWithCompletionHandler:v25];
}

void __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  uint64_t v10 = FPUILoc(@"SERVER", v3, v4, v5, v6, v7, v8, v9, v27);
  uint64_t v11 = [v29 label];
  [(id)v11 setText:v10];

  uint64_t v12 = [v29 textField];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 1080);
  *(void *)(v13 + 1080) = v12;

  [*(id *)(*(void *)(a1 + 32) + 1080) setAutocapitalizationType:0];
  [*(id *)(*(void *)(a1 + 32) + 1080) setAutocorrectionType:1];
  [*(id *)(*(void *)(a1 + 32) + 1080) setKeyboardType:3];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1080) addTarget:*(void *)(a1 + 32) action:sel_textFieldDidChange_ forControlEvents:0x20000];
  v22 = FPUILoc(@"SERVER_ADDRESS_ACCESSIBILITY_LABEL", v15, v16, v17, v18, v19, v20, v21, v28);
  [*(id *)(*(void *)(a1 + 32) + 1080) setAccessibilityLabel:v22];

  [*(id *)(*(void *)(a1 + 32) + 1080) setAccessibilityIdentifier:@"ServerAddressTextField"];
  v23 = [*(id *)(a1 + 32) authenticationDelegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    v24 = [*(id *)(a1 + 32) authenticationDelegate];
    v25 = [v24 serverAddressPlaceholder];
    v26 = [v29 textField];
    [v26 setPlaceholder:v25];
  }
}

uint64_t __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) selectTextFieldAtIndexPath:a2];
}

void __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2_44;
  v5[3] = &unk_264C6CBF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2_44(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1112), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[139];

  return [v2 _showRecentServersSectionWithRecentServers:v3 rowAnimation:3];
}

- (void)_showRecentServersSectionWithRecentServers:(id)a3 rowAnimation:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSMutableArray *)self->_recentServersRowDescriptors removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = objc_opt_new();
        objc_initWeak(&location, self);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke;
        v15[3] = &unk_264C6CF08;
        v15[4] = v8;
        objc_copyWeak(&v16, &location);
        [v9 setCellCustomizationHandler:v15];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_2;
        v14[3] = &unk_264C6CF30;
        v14[4] = v8;
        v14[5] = self;
        [v9 setAccessoryButtonTapHandler:v14];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_3;
        v13[3] = &unk_264C6CF30;
        v13[4] = self;
        v13[5] = v8;
        [v9 setSelectionHandler:v13];
        [v9 setCellSelectionStyle:2];
        [(NSMutableArray *)self->_recentServersRowDescriptors addObject:v9];
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [(FPUIAuthenticationLandingViewController *)self _updateRecentServerSectionVisibilityWithRowAnimation:a4 forceReload:1];
}

void __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 displayName];
  uint64_t v6 = [v4 textLabel];
  [v6 setText:v5];

  [v4 setAccessoryType:4];
  uint64_t v7 = FPUITableCellServerIcon();
  uint64_t v8 = [v4 imageView];
  [v8 setImage:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = [WeakRetained tableView];
  [v9 layoutMargins];
  objc_msgSend(v4, "setLayoutMargins:");
}

void __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_2(uint64_t a1)
{
  id v4 = [[FPUIAuthenticationServerInfoViewController alloc] initWithServerRepresentation:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) authenticationDelegate];
  [(FPUIAuthenticationTableViewController *)v4 setAuthenticationDelegate:v2];

  [(FPUIAuthenticationServerInfoViewController *)v4 setServerInfoDelegate:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 40) navigationController];
  [v3 pushViewController:v4 animated:1];
}

uint64_t __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToServer:*(void *)(a1 + 40)];
}

- (void)updateForChangedContentSizeCategory
{
}

- (void)_updateRecentServerSectionVisibilityWithRowAnimation:(int64_t)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_recentServersRowDescriptors count];
  if (v7)
  {
    uint64_t v8 = [(FPUIAuthenticationLandingViewController *)self traitCollection];
    uint64_t v9 = [v8 preferredContentSizeCategory];
    BOOL v10 = !UIContentSizeCategoryIsAccessibilityCategory(v9);
  }
  else
  {
    BOOL v10 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x263F089C8]);
  if ((v7 != 0) != [(FPUIAuthenticationSectionDescriptor *)self->_recentServersSection isActive])
  {
    [(FPUIAuthenticationSectionDescriptor *)self->_recentServersSection setActive:v7 != 0];
    uint64_t v11 = [(FPUIAuthenticationTableViewController *)self sectionDescriptors];
    objc_msgSend(v15, "addIndex:", objc_msgSend(v11, "indexOfObject:", self->_recentServersSection));
  }
  if (v4)
  {
    uint64_t v12 = [(FPUIAuthenticationTableViewController *)self sectionDescriptors];
    objc_msgSend(v15, "addIndex:", objc_msgSend(v12, "indexOfObject:", self->_recentServersSection));
  }
  if (v10 != [(FPUIAuthenticationSectionDescriptor *)self->_recentServersExtraTopPaddingSection isActive])
  {
    [(FPUIAuthenticationSectionDescriptor *)self->_recentServersExtraTopPaddingSection setActive:v10];
    uint64_t v13 = [(FPUIAuthenticationTableViewController *)self sectionDescriptors];
    objc_msgSend(v15, "addIndex:", objc_msgSend(v13, "indexOfObject:", self->_recentServersExtraTopPaddingSection));
  }
  if ([v15 count])
  {
    uint64_t v14 = [(FPUIAuthenticationLandingViewController *)self tableView];
    [v14 reloadSections:v15 withRowAnimation:a3];
  }
}

- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() defaultTitle];
  [(FPUIAuthenticationTableViewController *)self setTitle:v8];

  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationLandingViewController;
  [(FPUIAuthenticationTableViewController *)&v9 authenticationDelegate:v7 didEncounterError:v6];
}

- (void)_transitionUIStateToConnecting
{
  objc_super v9 = FPUILoc(@"CONNECTING", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v10);
  [(FPUIAuthenticationTableViewController *)self setTitle:v9];

  [(FPUIAuthenticationTableViewController *)self setNavBarActivityIndicatorHidden:0];

  [(FPUIAuthenticationTableViewController *)self setTransitioning:1];
}

- (void)_updateNextStep
{
  BOOL v3 = [(FPUIAuthenticationLandingViewController *)self _canMoveToNextStep];

  [(FPUIAuthenticationTableViewController *)self setCanTransitionToNextStep:v3];
}

- (void)setInitialConnectionURL:(id)a3
{
  uint64_t v5 = (NSURL *)a3;
  if (self->_initialURL != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_initialURL, a3);
    [(FPUIAuthenticationLandingViewController *)self _disectURLToComponents:self->_initialURL];
    uint64_t v6 = [(NSURL *)self->_sanitizedURL absoluteString];
    [(UITextField *)self->_serverInputTextField setText:v6];

    [(FPUIAuthenticationLandingViewController *)self _updateNextStep];
    uint64_t v5 = v7;
  }
}

- (void)_disectURLToComponents:(id)a3
{
  if (a3)
  {
    id v10 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    uint64_t v4 = [v10 user];
    uint64_t v5 = (NSURL *)[v4 copy];
    initialUsername = self->_initialUsername;
    self->_initialUsername = v5;

    [v10 setPassword:0];
    uint64_t v7 = [v10 URL];
    uint64_t v8 = (NSURL *)[v7 copy];
    sanitizedURL = self->_sanitizedURL;
    self->_sanitizedURL = v8;
  }
}

- (void)_connect:(id)a3
{
  [(FPUIAuthenticationLandingViewController *)self _transitionUIStateToConnecting];
  uint64_t v5 = [(UITextField *)self->_serverInputTextField text];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationLandingViewController.m" lineNumber:263 description:@"connecting to server with empty address text"];
  }
  id v9 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  uint64_t v7 = [(UITextField *)self->_serverInputTextField text];
  [v9 connectToServerAtAddress:v7 connectionFlowDelegate:self];
}

- (void)_connectToServer:(id)a3
{
  id v4 = a3;
  [(FPUIAuthenticationLandingViewController *)self _transitionUIStateToConnecting];
  id v7 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  uint64_t v5 = [v4 url];

  uint64_t v6 = [v5 absoluteString];
  [v7 connectToServerAtAddress:v6 connectionFlowDelegate:self];
}

- (BOOL)_canMoveToNextStep
{
  uint64_t v2 = [(UITextField *)self->_serverInputTextField text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BOOL v4 = [(FPUIAuthenticationLandingViewController *)self _canMoveToNextStep];
  if (v4) {
    [(FPUIAuthenticationLandingViewController *)self _connect:self];
  }
  return !v4;
}

- (void)removeServerWithRepresentation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_recentServers, "count") - 1);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = 1112;
  long long v18 = self;
  uint64_t v6 = self->_recentServers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "identifier", v17, v18, (void)v19);
        uint64_t v13 = [v4 identifier];
        char v14 = [v12 isEqualToString:v13];

        if ((v14 & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v15 = *(Class *)((char *)&v18->super.super.super.super.super.isa + v17);
  *(Class *)((char *)&v18->super.super.super.super.super.isa + v17) = (Class)v5;
  id v16 = v5;

  [(FPUIAuthenticationLandingViewController *)v18 _showRecentServersSectionWithRecentServers:*(Class *)((char *)&v18->super.super.super.super.super.isa + v17) rowAnimation:5];
}

- (NSURL)initialConnectionURL
{
  return self->_initialConnectionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConnectionURL, 0);
  objc_storeStrong((id *)&self->_recentServers, 0);
  objc_storeStrong((id *)&self->_initialUsername, 0);
  objc_storeStrong((id *)&self->_sanitizedURL, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_serverInputTextField, 0);
  objc_storeStrong((id *)&self->_recentServersRowDescriptors, 0);
  objc_storeStrong((id *)&self->_recentServersExtraTopPaddingSection, 0);

  objc_storeStrong((id *)&self->_recentServersSection, 0);
}

@end