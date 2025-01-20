@interface DSContinuityController
- (DSContinuityController)init;
- (DSContinuityStore)continuityStore;
- (DSNavigationDelegate)delegate;
- (NSMutableArray)continuityDevices;
- (NSMutableArray)selectedDevices;
- (id)allComputerNames;
- (id)computerNameWithUUID:(id)a3;
- (id)dateDescription:(id)a3;
- (id)selectedComputerNames;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateButtons;
- (void)getDevicesWithCompletion:(id)a3;
- (void)presentLearnMore;
- (void)presentRemoveAllDevicesAlert;
- (void)presentRemoveSelectedDevicesAlert;
- (void)presentUnpairErrorAlert:(id)a3;
- (void)remoteDeviceListModified:(id)a3;
- (void)removeAllPairedDevicesAndPushNextPane;
- (void)removeDetailViewControllerFromStack;
- (void)removeSelectedPairedDevicesAndPushNextPane;
- (void)returnFromDetailAndRemoveDevice:(id)a3;
- (void)setContinuityDevices:(id)a3;
- (void)setContinuityStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedDevices:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSContinuityController

- (DSContinuityController)init
{
  v3 = DSUILocStringForKey(@"CONTINUITY_TITLE");
  v4 = DSUILocStringForKey(@"CONTINUITY_DETAIL");
  v5 = [MEMORY[0x263F827E8] systemImageNamed:@"macbook.and.iphone"];
  v18.receiver = self;
  v18.super_class = (Class)DSContinuityController;
  v6 = [(DSTableWelcomeController *)&v18 initWithTitle:v3 detailText:v4 icon:v5 adoptTableViewScrollView:0 shouldShowSearchBar:0];

  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.DigitalSeparation", "DSContinuityController");
    v8 = (void *)DSLog_4;
    DSLog_4 = (uint64_t)v7;

    v9 = DSUILocStringForKey(@"SKIP");
    v10 = [(DSContinuityController *)v6 delegate];
    v11 = +[DSUIUtilities setUpBoldButtonForController:v6 title:v9 target:v10 selector:sel_pushNextPane];
    [(DSTableWelcomeController *)v6 setBoldButton:v11];

    v12 = DSUILocStringForKey(@"CONTINUITY_STOP_ALL");
    v13 = +[DSUIUtilities setUpLinkButtonForController:v6 title:v12 target:v6 selector:sel_presentRemoveAllDevicesAlert];
    [(DSTableWelcomeController *)v6 setLinkButton:v13];

    v14 = [MEMORY[0x263EFF980] array];
    [(DSContinuityController *)v6 setSelectedDevices:v14];

    id v15 = objc_alloc_init(MEMORY[0x263F3A350]);
    [(DSContinuityController *)v6 setContinuityStore:v15];

    v16 = +[DSDeviceManager sharedInstance];
    [v16 refresh];
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DSContinuityController;
  [(OBTableWelcomeController *)&v5 viewWillAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__DSContinuityController_viewWillAppear___block_invoke;
  v4[3] = &unk_264C6E7D0;
  v4[4] = self;
  [(DSContinuityController *)self getDevicesWithCompletion:v4];
}

uint64_t __41__DSContinuityController_viewWillAppear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  v3 = *(void **)(a1 + 32);
  return [v3 _updateButtons];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)DSContinuityController;
  [(DSTableWelcomeController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x263F5B8B8] accessoryButton];
  v4 = DSUILocStringForKey(@"LEARN_MORE");
  [v3 setTitle:v4 forState:0];

  [v3 addTarget:self action:sel_presentLearnMore forControlEvents:64];
  objc_super v5 = [(DSContinuityController *)self headerView];
  [v5 addAccessoryButton:v3];
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__DSContinuityController_shouldShowWithCompletion___block_invoke;
    v5[3] = &unk_264C6EDF0;
    v5[4] = self;
    id v6 = v4;
    [(DSContinuityController *)self getDevicesWithCompletion:v5];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __51__DSContinuityController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) continuityDevices];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, [v2 count] != 0);
}

- (void)getDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DSContinuityController *)self continuityStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__DSContinuityController_getDevicesWithCompletion___block_invoke;
  v7[3] = &unk_264C6EFE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchPairedDevicesWithCompletion:v7];
}

void __51__DSContinuityController_getDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = DSLog_4;
    if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR)) {
      __51__DSContinuityController_getDevicesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    v34 = +[DSDeviceManager sharedInstance];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v31 = v5;
    id obj = v5;
    uint64_t v35 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v45;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v14;
          id v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
          v16 = [v34 iconForDevice:v15];
          [v15 setDeviceImage:v16];

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v17 = [v34 remoteDevices];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v41 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                v23 = [v15 pushToken];
                v24 = [v22 pushToken];
                int v25 = [v23 isEqualToString:v24];

                if (v25)
                {
                  v26 = DSLog_4;
                  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_235BFC000, v26, OS_LOG_TYPE_INFO, "Continuity: matched AK devices by push token.", buf, 2u);
                  }
                  v27 = [v22 serialNumber];
                  [v15 setSerialNumber:v27];

                  v28 = [v22 model];
                  [v15 setModel:v28];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v19);
          }

          uint64_t v14 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v35);
    }

    v29 = [obj sortedArrayUsingComparator:&__block_literal_global_10];
    v30 = [MEMORY[0x263EFF980] arrayWithArray:v29];
    [*(id *)(a1 + 32) setContinuityDevices:v30];

    id v6 = 0;
    id v5 = v31;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DSContinuityController_getDevicesWithCompletion___block_invoke_2;
  block[3] = &unk_264C6EBA8;
  id v38 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__DSContinuityController_getDevicesWithCompletion___block_invoke_348(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __51__DSContinuityController_getDevicesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentRemoveAllDevicesAlert
{
  v3 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_TITLE");
  id v4 = NSString;
  id v5 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_ALL_CONFIRMATION");
  id v6 = (void *)MEMORY[0x263F08950];
  uint64_t v7 = [(DSContinuityController *)self allComputerNames];
  uint64_t v8 = [v6 localizedStringByJoiningStrings:v7];
  uint64_t v9 = objc_msgSend(v4, "stringWithFormat:", v5, v8);

  uint64_t v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v3 message:v9 preferredStyle:0];
  uint64_t v11 = (void *)MEMORY[0x263F82400];
  uint64_t v12 = DSUILocStringForKey(@"CANCEL");
  uint64_t v13 = [v11 actionWithTitle:v12 style:1 handler:&__block_literal_global_366];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  id v15 = DSUILocStringForKey(@"CONTINUITY_STOP");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__DSContinuityController_presentRemoveAllDevicesAlert__block_invoke_2;
  v17[3] = &unk_264C6E848;
  v17[4] = self;
  v16 = [v14 actionWithTitle:v15 style:2 handler:v17];

  [v10 addAction:v16];
  [v10 addAction:v13];
  [(DSContinuityController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __54__DSContinuityController_presentRemoveAllDevicesAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllPairedDevicesAndPushNextPane];
}

- (void)presentRemoveSelectedDevicesAlert
{
  v3 = [(DSContinuityController *)self selectedDevices];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(DSContinuityController *)self selectedDevices];
    id v6 = [v5 firstObject];
    uint64_t v7 = [(DSContinuityController *)self computerNameWithUUID:v6];

    uint64_t v8 = NSString;
    uint64_t v9 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_SINGLE_TITLE");
    uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

    uint64_t v11 = NSString;
    uint64_t v12 = @"CONTINUITY_DISCONNECT_SINGLE_CONFIRMATION";
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F08950];
    uint64_t v14 = [(DSContinuityController *)self selectedComputerNames];
    uint64_t v7 = [v13 localizedStringByJoiningStrings:v14];

    uint64_t v10 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_TITLE");
    uint64_t v11 = NSString;
    uint64_t v12 = @"CONTINUITY_DISCONNECT_MULTIPLE_CONFIRMATION";
  }
  id v15 = DSUILocStringForKey(v12);
  v16 = objc_msgSend(v11, "stringWithFormat:", v15, v7);

  v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v16 preferredStyle:0];
  uint64_t v18 = (void *)MEMORY[0x263F82400];
  uint64_t v19 = DSUILocStringForKey(@"CANCEL");
  uint64_t v20 = [v18 actionWithTitle:v19 style:1 handler:&__block_literal_global_380];

  v21 = (void *)MEMORY[0x263F82400];
  v22 = DSUILocStringForKey(@"CONTINUITY_STOP");
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__DSContinuityController_presentRemoveSelectedDevicesAlert__block_invoke_2;
  v24[3] = &unk_264C6E848;
  v24[4] = self;
  v23 = [v21 actionWithTitle:v22 style:2 handler:v24];

  [v17 addAction:v23];
  [v17 addAction:v20];
  [(DSContinuityController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __59__DSContinuityController_presentRemoveSelectedDevicesAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSelectedPairedDevicesAndPushNextPane];
}

- (void)presentUnpairErrorAlert:(id)a3
{
  id v4 = a3;
  id v5 = DSLog_4;
  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR)) {
    -[DSContinuityController presentUnpairErrorAlert:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x263F82418], "ds_alertControllerContinuityUnpairError:", v4);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__DSContinuityController_presentUnpairErrorAlert___block_invoke;
  v14[3] = &unk_264C6ED28;
  v14[4] = self;
  id v15 = v12;
  id v13 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

uint64_t __50__DSContinuityController_presentUnpairErrorAlert___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  v3 = [*(id *)(a1 + 32) boldButton];
  [v3 hidesBusyIndicator];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 presentErrorAlertController:v5];
}

- (void)removeSelectedPairedDevicesAndPushNextPane
{
  v3 = [(DSContinuityController *)self selectedDevices];
  id v4 = [(DSTableWelcomeController *)self boldButton];
  [v4 showsBusyIndicator];

  uint64_t v5 = [(DSContinuityController *)self continuityStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke;
  v6[3] = &unk_264C6F008;
  v6[4] = self;
  [v5 unpairDevicesWithIDs:v3 completion:v6];
}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectedDevices];
  [v4 removeAllObjects];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v3)
  {
    [v5 presentUnpairErrorAlert:v3];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2;
    v6[3] = &unk_264C6E7D0;
    v6[4] = v5;
    [v5 getDevicesWithCompletion:v6];
  }
}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_3;
  block[3] = &unk_264C6E7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = [*(id *)(a1 + 32) boldButton];
  [v3 hidesBusyIndicator];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 pushNextPane];
}

- (void)removeAllPairedDevicesAndPushNextPane
{
  id v3 = [(DSTableWelcomeController *)self boldButton];
  [v3 showsBusyIndicator];

  id v4 = [(DSContinuityController *)self continuityStore];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke;
  v5[3] = &unk_264C6F008;
  v5[4] = self;
  [v4 unpairAllDevicesWithCompletion:v5];
}

void __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectedDevices];
  [v4 removeAllObjects];

  if (v3)
  {
    [*(id *)(a1 + 32) presentUnpairErrorAlert:v3];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke_2;
    block[3] = &unk_264C6E7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = [*(id *)(a1 + 32) boldButton];
  [v3 hidesBusyIndicator];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 pushNextPane];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(DSContinuityController *)self continuityDevices];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)dateDescription:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F08790];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setDateStyle:1];
    uint64_t v6 = [v5 stringFromDate:v4];

    uint64_t v7 = NSString;
    uint64_t v8 = DSUILocStringForKey(@"CONTINUITY_TIME_PAIRED");
    uint64_t v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSContinuityController *)self continuityDevices];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  uint64_t v8 = [(OBTableWelcomeController *)self tableView];
  uint64_t v9 = [v7 name];
  uint64_t v10 = [v7 initialDiscoveryDate];
  uint64_t v11 = [(DSContinuityController *)self dateDescription:v10];
  uint64_t v12 = [v7 deviceImage];
  id v13 = +[DSIconTableViewCell iconTableViewCellFromTableView:v8 withText:v9 detail:v11 icon:v12];

  uint64_t v14 = [(DSContinuityController *)self selectedDevices];
  id v15 = [v7 deviceID];
  LODWORD(v10) = [v14 containsObject:v15];

  if (v10)
  {
    v16 = [(OBTableWelcomeController *)self tableView];
    [v16 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];
  }
  v17 = [v7 initialDiscoveryDate];
  if (v17
    || ([v7 serialNumber], (v17 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v7 model], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    [v13 setEditingAccessoryType:4];
    goto LABEL_8;
  }
  uint64_t v19 = [v7 marketingName];

  if (v19) {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSContinuityController *)self selectedDevices];
  uint64_t v7 = [(DSContinuityController *)self continuityDevices];
  uint64_t v8 = [v5 row];

  uint64_t v9 = [v7 objectAtIndex:v8];
  uint64_t v10 = [v9 deviceID];
  [v6 addObject:v10];

  [(DSContinuityController *)self _updateButtons];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSContinuityController *)self selectedDevices];
  uint64_t v7 = [(DSContinuityController *)self continuityDevices];
  uint64_t v8 = [v5 row];

  uint64_t v9 = [v7 objectAtIndex:v8];
  uint64_t v10 = [v9 deviceID];
  [v6 removeObject:v10];

  [(DSContinuityController *)self _updateButtons];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DSContinuityController *)self continuityDevices];
  uint64_t v7 = [v5 row];

  id v10 = [v6 objectAtIndexedSubscript:v7];

  uint64_t v8 = [[DSContinuityDetailController alloc] initWithContinuityDevice:v10];
  [(DSContinuityDetailController *)v8 setDelegate:self];
  uint64_t v9 = [(DSContinuityController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (void)removeDetailViewControllerFromStack
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(DSContinuityController *)self navigationController];
  id v5 = [v4 viewControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_class();
        if (v11 != objc_opt_class()) {
          [v3 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [(DSContinuityController *)self navigationController];
  [v12 setViewControllers:v3];
}

- (void)returnFromDetailAndRemoveDevice:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DSTableWelcomeController *)self boldButton];
  [v5 showsBusyIndicator];

  uint64_t v6 = [(DSContinuityController *)self continuityStore];
  uint64_t v7 = [v4 deviceID];
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke;
  v10[3] = &unk_264C6F030;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v6 unpairDevicesWithIDs:v8 completion:v10];
}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectedDevices];
  id v5 = [*(id *)(a1 + 40) deviceID];
  [v4 removeObject:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v3)
  {
    [v6 presentUnpairErrorAlert:v3];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_2;
    v7[3] = &unk_264C6E7D0;
    v7[4] = v6;
    [v6 getDevicesWithCompletion:v7];
  }
}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_3;
  block[3] = &unk_264C6E7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) continuityDevices];
  uint64_t v3 = [v2 count];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 tableView];
    [v5 reloadData];

    [*(id *)(a1 + 32) _updateButtons];
    uint64_t v6 = [*(id *)(a1 + 32) boldButton];
    [v6 hidesBusyIndicator];

    id v11 = [*(id *)(a1 + 32) navigationController];
    id v7 = (id)[v11 popViewControllerAnimated:1];
  }
  else
  {
    uint64_t v8 = [v4 boldButton];
    [v8 hidesBusyIndicator];

    id v9 = [*(id *)(a1 + 32) delegate];
    [v9 pushNextPane];

    uint64_t v10 = *(void **)(a1 + 32);
    [v10 removeDetailViewControllerFromStack];
  }
}

- (void)_updateButtons
{
  id v2 = self;
  uint64_t v3 = [(DSContinuityController *)v2 selectedDevices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    DSUILocStringForKey(@"CONTINUITY_STOP");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = sel_presentRemoveSelectedDevicesAlert;
    uint64_t v6 = v2;
  }
  else
  {
    DSUILocStringForKey(@"SKIP");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = sel_pushNextPane;
    uint64_t v6 = [(DSContinuityController *)v2 delegate];
  }
  id v7 = [(DSTableWelcomeController *)v2 boldButton];
  [v7 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  uint64_t v8 = [(DSTableWelcomeController *)v2 boldButton];
  [v8 setTitle:v13 forState:0];

  id v9 = [(DSTableWelcomeController *)v2 boldButton];
  [v9 addTarget:v6 action:v5 forControlEvents:64];

  uint64_t v10 = [(DSTableWelcomeController *)v2 linkButton];
  id v11 = DSUILocStringForKey(@"CONTINUITY_STOP_ALL");
  [v10 setTitle:v11 forState:0];

  uint64_t v12 = [(DSTableWelcomeController *)v2 linkButton];
  [v12 addTarget:v2 action:sel_presentRemoveAllDevicesAlert forControlEvents:64];
}

- (void)presentLearnMore
{
  id v4 = [(DSContinuityController *)self delegate];
  uint64_t v3 = DSUILocStringForKey(@"CONTINUITY_LEARN_MORE_URL");
  [v4 learnMorePressedForController:self withURL:v3];
}

- (id)allComputerNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DSContinuityController *)self continuityDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) name];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)selectedComputerNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DSContinuityController *)self selectedDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(DSContinuityController *)self computerNameWithUUID:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)computerNameWithUUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(DSContinuityController *)self continuityDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v11 = [v10 deviceID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          uint64_t v20 = [v10 name];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v13 = DSLog_4;
  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR)) {
    -[DSContinuityController computerNameWithUUID:]((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v20 = 0;
LABEL_13:

  return v20;
}

- (void)remoteDeviceListModified:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__DSContinuityController_remoteDeviceListModified___block_invoke;
  v3[3] = &unk_264C6E7D0;
  v3[4] = self;
  [(DSContinuityController *)self getDevicesWithCompletion:v3];
}

void __51__DSContinuityController_remoteDeviceListModified___block_invoke(uint64_t a1)
{
  id v2 = DSLog_4;
  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_235BFC000, v2, OS_LOG_TYPE_DEFAULT, "Completed fetch for remote device list modification", v4, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  [v3 reloadData];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
}

- (NSMutableArray)continuityDevices
{
  return self->_continuityDevices;
}

- (void)setContinuityDevices:(id)a3
{
}

- (DSContinuityStore)continuityStore
{
  return self->_continuityStore;
}

- (void)setContinuityStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityStore, 0);
  objc_storeStrong((id *)&self->_continuityDevices, 0);
  objc_storeStrong((id *)&self->_selectedDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__DSContinuityController_getDevicesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)presentUnpairErrorAlert:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)computerNameWithUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end