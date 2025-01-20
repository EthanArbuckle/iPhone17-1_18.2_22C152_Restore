@interface DSPublicResourceSharingController
+ (void)initialize;
- (BOOL)shouldShow;
- (DSNavigationDelegate)delegate;
- (DSPublicResourceSharingController)init;
- (DSSharingPermissions)permissions;
- (NSMutableSet)selectedTypes;
- (OS_dispatch_queue)workQueue;
- (id)publicSharingTypeForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_pushNextPane;
- (void)_updateButton;
- (void)_updateTitle;
- (void)reloadTableViewData;
- (void)setDelegate:(id)a3;
- (void)setPermissions:(id)a3;
- (void)setSelectedTypes:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)stopAllSharing;
- (void)stopSelectedSharing;
- (void)stopSharingFailedWithError:(id)a3;
- (void)stopSharingTypes:(id)a3 alertLabel:(id)a4 alertDetail:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSPublicResourceSharingController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogPublicResourceSharingController = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSPublicResourceSharingController");
    MEMORY[0x270F9A758]();
  }
}

- (DSPublicResourceSharingController)init
{
  v3 = DSUILocStringForKey(@"PUBLIC_SHARING_TITLE");
  v4 = DSUILocStringForKey(@"PUBLIC_SHARING_DETAIL");
  v5 = [MEMORY[0x263F827E8] imageNamed:@"person.3.fill"];
  v15.receiver = self;
  v15.super_class = (Class)DSPublicResourceSharingController;
  v6 = [(DSTableWelcomeController *)&v15 initWithTitle:v3 detailText:v4 icon:v5 adoptTableViewScrollView:0 shouldShowSearchBar:0];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    selectedTypes = v6->_selectedTypes;
    v6->_selectedTypes = (NSMutableSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("PublicSharingPermissionsControllerWork", 0);
    [(DSPublicResourceSharingController *)v6 setWorkQueue:v9];

    v10 = DSUILocStringForKey(@"SKIP");
    v11 = +[DSUIUtilities setUpBoldButtonForController:v6 title:v10 target:v6 selector:sel__pushNextPane];
    [(DSTableWelcomeController *)v6 setBoldButton:v11];

    v12 = DSUILocStringForKey(@"STOP_ALL_SHARING");
    v13 = +[DSUIUtilities setUpLinkButtonForController:v6 title:v12 target:v6 selector:sel_stopAllSharing];
    [(DSTableWelcomeController *)v6 setLinkButton:v13];
  }
  return v6;
}

- (BOOL)shouldShow
{
  v3 = [(DSPublicResourceSharingController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 fetchedSharingPermissions];
    [(DSPublicResourceSharingController *)self setPermissions:v4];

    v5 = [(DSPublicResourceSharingController *)self permissions];
    BOOL v6 = [v5 publicSharingTypesCount] > 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSPublicResourceSharingController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(DSPublicResourceSharingController *)self reloadTableViewData];
}

- (void)_pushNextPane
{
  id v2 = [(DSPublicResourceSharingController *)self delegate];
  [v2 pushNextPane];
}

- (void)stopSharingTypes:(id)a3 alertLabel:(id)a4 alertDetail:(id)a5
{
  id v8 = a3;
  dispatch_queue_t v9 = (void *)MEMORY[0x263F82418];
  id v10 = a4;
  v11 = [v9 alertControllerWithTitle:0 message:a5 preferredStyle:0];
  v12 = (void *)MEMORY[0x263F82400];
  v13 = DSUILocStringForKey(@"CANCEL");
  v14 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_6];

  objc_super v15 = (void *)MEMORY[0x263F82400];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_2;
  v21 = &unk_264C6ED50;
  v22 = self;
  id v23 = v8;
  id v16 = v8;
  v17 = [v15 actionWithTitle:v10 style:2 handler:&v18];

  objc_msgSend(v11, "addAction:", v17, v18, v19, v20, v21, v22);
  [v11 addAction:v14];
  [(DSPublicResourceSharingController *)self presentViewController:v11 animated:1 completion:0];
}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) buttonTray];
  [v2 showButtonsBusy];

  v3 = dispatch_group_create();
  objc_super v4 = [MEMORY[0x263EFF980] array];
  v5 = [*(id *)(v1 + 32) permissions];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v22)
  {
    uint64_t v7 = *(void *)v30;
    *(void *)&long long v6 = 138543362;
    long long v20 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        dispatch_group_enter(v3);
        id v10 = (void *)DSLogPublicResourceSharingController;
        if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_INFO))
        {
          v11 = v10;
          v12 = [v9 source];
          [v12 name];
          uint64_t v13 = v7;
          v14 = v4;
          objc_super v15 = v5;
          v17 = uint64_t v16 = v1;
          *(_DWORD *)buf = v20;
          v34 = v17;
          _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_INFO, "Stopping all public sharing for type %{public}@", buf, 0xCu);

          uint64_t v1 = v16;
          v5 = v15;
          objc_super v4 = v14;
          uint64_t v7 = v13;
        }
        uint64_t v18 = objc_msgSend(*(id *)(v1 + 32), "workQueue", v20);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_322;
        v25[3] = &unk_264C6ED00;
        v25[4] = v9;
        id v26 = v4;
        id v27 = v5;
        v28 = v3;
        [v9 stopAllSharingOnQueue:v18 completion:v25];

        ++v8;
      }
      while (v22 != v8);
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v22);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_324;
  block[3] = &unk_264C6ED28;
  block[4] = *(void *)(v1 + 32);
  id v24 = v4;
  id v19 = v4;
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_322(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = (void *)DSLogPublicResourceSharingController;
  if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    long long v6 = v4;
    uint64_t v7 = [v5 source];
    uint64_t v8 = [v7 name];
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "Finished stop all public sharing for type %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (v3)
  {
    dispatch_queue_t v9 = (void *)DSLogPublicResourceSharingController;
    if (os_log_type_enabled((os_log_t)DSLogPublicResourceSharingController, OS_LOG_TYPE_ERROR)) {
      __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_322_cold_1(a1, v9, (uint64_t)v3);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    [*(id *)(a1 + 48) removePublicSharingType:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_324(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonTray];
  [v2 showButtonsAvailable];

  if ([*(id *)(a1 + 40) count])
  {
    id v4 = [MEMORY[0x263F3A360] errorWithCode:2 underlyingErrors:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) stopSharingFailedWithError:v4];
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    [v3 _pushNextPane];
  }
}

- (void)stopAllSharing
{
  id v7 = [(DSPublicResourceSharingController *)self permissions];
  id v3 = [v7 allPublicSharingTypes];
  id v4 = (void *)[v3 copy];
  v5 = DSUILocStringForKey(@"STOP_ALL_PUBLIC_SHARING_ALERT_LABEL");
  long long v6 = DSUILocStringForKey(@"STOP_ALL_PUBLIC_SHARING_ALERT_DETAIL");
  [(DSPublicResourceSharingController *)self stopSharingTypes:v4 alertLabel:v5 alertDetail:v6];
}

- (void)stopSelectedSharing
{
  id v6 = [(DSPublicResourceSharingController *)self selectedTypes];
  id v3 = [v6 allObjects];
  id v4 = DSUILocStringForKey(@"STOP_ALL_PUBLIC_SHARING_ALERT_LABEL");
  v5 = DSUILocStringForKey(@"STOP_ALL_PUBLIC_SHARING_ALERT_DETAIL");
  [(DSPublicResourceSharingController *)self stopSharingTypes:v3 alertLabel:v4 alertDetail:v5];
}

- (void)stopSharingFailedWithError:(id)a3
{
  objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerWithStopSharingError:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(DSTableWelcomeController *)self presentErrorAlertController:v4];
}

- (void)_updateButton
{
  id v3 = [(DSPublicResourceSharingController *)self selectedTypes];
  uint64_t v4 = [v3 count];

  v5 = [(DSTableWelcomeController *)self boldButton];
  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  if (v4)
  {
    id v6 = [(DSTableWelcomeController *)self boldButton];
    id v7 = DSUILocStringForKey(@"STOP_SHARING");
    [v6 setTitle:v7 forState:0];

    uint64_t v8 = [(DSTableWelcomeController *)self boldButton];
    [v8 addTarget:self action:sel_stopSelectedSharing forControlEvents:64];
  }
  else
  {
    if ([(DSTableWelcomeController *)self isModelEmpty]) {
      dispatch_queue_t v9 = @"CONTINUE";
    }
    else {
      dispatch_queue_t v9 = @"SKIP";
    }
    uint64_t v8 = DSUILocStringForKey(v9);
    int v10 = [(DSTableWelcomeController *)self boldButton];
    [v10 setTitle:v8 forState:0];

    v11 = [(DSTableWelcomeController *)self boldButton];
    [v11 addTarget:self action:sel__pushNextPane forControlEvents:64];
  }
  [(DSTableWelcomeController *)self hideButtonsIfSearching];
}

- (id)publicSharingTypeForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(DSPublicResourceSharingController *)self permissions];
  uint64_t v6 = [v4 row];

  id v7 = [v5 publicSharingType:v6];

  return v7;
}

- (void)reloadTableViewData
{
  id v3 = [(DSPublicResourceSharingController *)self permissions];
  [v3 sort];

  id v4 = [(DSPublicResourceSharingController *)self permissions];
  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", [v4 publicSharingTypesCount] == 0);

  v5 = [(OBTableWelcomeController *)self tableView];
  uint64_t v6 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  [v5 reloadSections:v6 withRowAnimation:100];

  id v7 = [(OBTableWelcomeController *)self tableView];
  [v7 layoutIfNeeded];

  [(DSPublicResourceSharingController *)self _updateButton];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSPublicResourceSharingController *)self publicSharingTypeForIndexPath:v5];
  id v7 = [v6 displayName];
  uint64_t v8 = [v6 localizedDetailText];
  dispatch_queue_t v9 = [v6 iconForTable];
  int v10 = [(DSPublicResourceSharingController *)self selectedTypes];
  int v11 = [v10 containsObject:v6];

  if (v11)
  {
    uint64_t v12 = [(OBTableWelcomeController *)self tableView];
    [v12 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];
  }
  uint64_t v13 = [(OBTableWelcomeController *)self tableView];
  v14 = +[DSIconTableViewCell iconTableViewCellFromTableView:v13 withText:v7 detail:v8 icon:v9];

  [v14 setAccessoryType:0];
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = [(DSPublicResourceSharingController *)self permissions];
  int64_t v6 = [v5 publicSharingTypesCount];

  if (v6)
  {
    [(DSTableWelcomeController *)self hideNoSharingView];
    [(DSTableWelcomeController *)self setIsModelEmpty:0];
    [(DSPublicResourceSharingController *)self _updateTitle];
    [(DSPublicResourceSharingController *)self _updateButton];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = objc_alloc_init(MEMORY[0x263F3A380]);
    uint64_t v8 = [v23 sources];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (void *)MEMORY[0x263F3A378];
          v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) name];
          objc_super v15 = [v13 sourceDescriptorForSource:v14];
          uint64_t v16 = [v15 localizedAppName];

          [v7 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    v17 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v7];
    uint64_t v18 = NSString;
    id v19 = DSUILocStringForKey(@"NO_PUBLIC_SHARING_INFORMATION");
    long long v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);

    v21 = [MEMORY[0x263F827E8] systemImageNamed:@"person.3.fill"];
    [(DSTableWelcomeController *)self showNoSharingViewWithText:v20 image:v21];

    [(DSTableWelcomeController *)self setIsModelEmpty:1];
    [(DSPublicResourceSharingController *)self _updateButton];

    return 0;
  }
  return v6;
}

- (void)_updateTitle
{
  id v3 = [(DSPublicResourceSharingController *)self headerView];
  id v4 = DSUILocStringForKey(@"PUBLIC_SHARING_TITLE");
  [v3 setTitle:v4];

  id v6 = [(DSPublicResourceSharingController *)self headerView];
  id v5 = DSUILocStringForKey(@"PUBLIC_SHARING_DETAIL");
  [v6 setDetailText:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSPublicResourceSharingController *)self selectedTypes];
  id v7 = [(DSPublicResourceSharingController *)self publicSharingTypeForIndexPath:v5];

  [v6 addObject:v7];
  [(DSPublicResourceSharingController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSPublicResourceSharingController *)self selectedTypes];
  id v7 = [(DSPublicResourceSharingController *)self publicSharingTypeForIndexPath:v5];

  [v6 removeObject:v7];
  [(DSPublicResourceSharingController *)self _updateButton];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __77__DSPublicResourceSharingController_stopSharingTypes_alertLabel_alertDetail___block_invoke_322_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 source];
  id v7 = [v6 name];
  int v8 = 138543618;
  uint64_t v9 = v7;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_error_impl(&dword_235BFC000, v5, OS_LOG_TYPE_ERROR, "Failed to stop all public sharing for sharing type %{public}@ because %{public}@", (uint8_t *)&v8, 0x16u);
}

@end