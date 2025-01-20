@interface FPUIAuthenticationServerInfoViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (FPUIAuthenticationServerInfoDelegate)serverInfoDelegate;
- (FPUIAuthenticationServerInfoViewController)initWithServerRepresentation:(id)a3;
- (id)defaultLeftBarButtonItem;
- (void)removeButtonTapped:(id)a3;
- (void)setServerInfoDelegate:(id)a3;
- (void)setupTableViewSections;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationServerInfoViewController

- (FPUIAuthenticationServerInfoViewController)initWithServerRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationServerInfoViewController;
  v6 = [(FPUIAuthenticationTableViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverRepresentation, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationServerInfoViewController;
  [(FPUIAuthenticationTableViewController *)&v4 viewDidLoad];
  v3 = [(FPUIAuthenticationServerRepresentation *)self->_serverRepresentation displayName];
  [(FPUIAuthenticationTableViewController *)self setTitle:v3];
}

- (void)setupTableViewSections
{
  v26[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v11 = FPUILoc(@"SERVER", v4, v5, v6, v7, v8, v9, v10, v19);
  [v3 setHeaderTitle:v11];

  [v3 setHeaderHeight:*MEMORY[0x263F1D600]];
  v12 = objc_opt_new();
  [v12 setCellReuseIdentifier:@"ServerAddress"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke;
  v21[3] = &unk_264C6CE00;
  v21[4] = self;
  [v12 setCellCustomizationHandler:v21];
  v13 = objc_opt_new();
  [v13 setHeaderHeight:36.0];
  v14 = objc_opt_new();
  [v14 setCellReuseIdentifier:@"Button"];
  [v14 setCellClass:objc_opt_class()];
  [v14 setCellSelectionStyle:2];
  [v14 setCellCustomizationHandler:&__block_literal_global_2];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_3;
  v20[3] = &unk_264C6CE48;
  v20[4] = self;
  [v14 setSelectionHandler:v20];
  [v14 setShouldHighlight:1.0];
  v26[0] = v3;
  v26[1] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [(FPUIAuthenticationTableViewController *)self setSectionDescriptors:v15];

  v23 = v12;
  v24[0] = &unk_26E908B50;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  v24[1] = &unk_26E908B68;
  v25[0] = v16;
  v22 = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v25[1] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  [(FPUIAuthenticationTableViewController *)self setRowDescriptors:v18];
}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1056);
  id v3 = a2;
  uint64_t v4 = [v2 displayName];
  uint64_t v5 = [v3 textLabel];
  [v5 setText:v4];

  FPUITableCellServerIcon();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 imageView];

  [v6 setImage:v7];
}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v10 = FPUILoc(@"REMOVE", v3, v4, v5, v6, v7, v8, v9, v13);
  v11 = [v2 label];
  [v11 setText:v10];

  id v14 = [MEMORY[0x263F1C550] redColor];
  v12 = [v2 label];

  [v12 setTextColor:v14];
}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 tableView];
  uint64_t v4 = [v5 cellForRowAtIndexPath:v3];

  [v2 removeButtonTapped:v4];
}

- (void)removeButtonTapped:(id)a3
{
  uint64_t v9 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v10 = FPUILoc(@"REMOVE_SERVER", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v40[0]);
  v18 = FPUILoc(@"REMOVE_SERVER_ALERT_MESSAGE", v11, v12, v13, v14, v15, v16, v17, v40[0]);
  uint64_t v19 = [v9 alertControllerWithTitle:v10 message:v18 preferredStyle:1];

  v20 = (void *)MEMORY[0x263F1C3F0];
  v28 = FPUILoc(@"CANCEL_ALERT_OPTION", v21, v22, v23, v24, v25, v26, v27, v40[0]);
  v29 = [v20 actionWithTitle:v28 style:1 handler:0];

  v30 = (void *)MEMORY[0x263F1C3F0];
  v38 = FPUILoc(@"REMOVE", v31, v32, v33, v34, v35, v36, v37, v40[0]);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke;
  v41[3] = &unk_264C6CE70;
  v41[4] = self;
  v39 = [v30 actionWithTitle:v38 style:2 handler:v41];

  [v19 addAction:v29];
  [v19 addAction:v39];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = (uint64_t)__65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_3;
  v40[3] = (uint64_t)&unk_264C6CC98;
  v40[4] = (uint64_t)self;
  [(FPUIAuthenticationServerInfoViewController *)self presentViewController:v19 animated:1 completion:v40];
}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authenticationDelegate];
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 authenticationDelegate];
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 1056);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_2;
    v11[3] = &unk_264C6CC20;
    v11[4] = v7;
    [v5 removeRecentServerWithRepresentation:v8 completion:v11];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    v10.receiver = v4;
    v10.super_class = (Class)FPUIAuthenticationServerInfoViewController;
    objc_msgSendSuper2(&v10, sel_authenticationDelegate_didEncounterError_, v6, v9);
  }
}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) authenticationDelegate];
    v8.receiver = v4;
    v8.super_class = (Class)FPUIAuthenticationServerInfoViewController;
    objc_msgSendSuper2(&v8, sel_authenticationDelegate_didEncounterError_, v5, v3);
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) serverInfoDelegate];
    [v6 removeServerWithRepresentation:*(void *)(*(void *)(a1 + 32) + 1056)];

    uint64_t v5 = [*(id *)(a1 + 32) navigationController];
    id v7 = (id)[v5 popViewControllerAnimated:1];
  }
}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) tableView];
  id v2 = [*(id *)(a1 + 32) tableView];
  id v3 = [v2 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

- (id)defaultLeftBarButtonItem
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 reuseIdentifier];
  char v6 = [@"ServerAddress" isEqualToString:v5];

  return v6;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  if (sel_copy_ == a4)
  {
    id v7 = [(FPUIAuthenticationServerRepresentation *)self->_serverRepresentation displayName];
    char v6 = [MEMORY[0x263F1C840] generalPasteboard];
    [v6 setString:v7];
  }
}

- (FPUIAuthenticationServerInfoDelegate)serverInfoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInfoDelegate);

  return (FPUIAuthenticationServerInfoDelegate *)WeakRetained;
}

- (void)setServerInfoDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverInfoDelegate);

  objc_storeStrong((id *)&self->_serverRepresentation, 0);
}

@end