@interface DSWifiSyncController
- (DSNavigationDelegate)delegate;
- (DSWifiSyncController)init;
- (DSWifiSyncStore)wifiSyncStore;
- (NSError)fetchError;
- (NSMutableArray)pairedComputers;
- (NSMutableArray)selectedPairedComputers;
- (id)dateDescription:(id)a3;
- (id)localizedDetailText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForPairedComputer:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateButtons;
- (void)addPairedDevices:(id)a3;
- (void)finalizeComputerReviewAndPushNextPane;
- (void)finalizePairingReviewReport;
- (void)learnMoreWifiSyncPressed;
- (void)presentFetchedErrorAlert;
- (void)presentRemoveAllDevicesAlert;
- (void)presentRemoveErrorAlert:(id)a3;
- (void)presentRemoveSelectedDevicesAlert;
- (void)reloadDetailText;
- (void)removeAllPairedDevicesAndPushNextPane;
- (void)removeDetailViewControllerFromStack;
- (void)removeSelectedPairedDevicesAndPushNextPane;
- (void)reportReviewedComputers:(id)a3;
- (void)reportUnpairedComputers:(id)a3;
- (void)returnFromDetailAndRemoveComputer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setPairedComputers:(id)a3;
- (void)setSelectedPairedComputers:(id)a3;
- (void)setWifiSyncStore:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSWifiSyncController

- (DSWifiSyncController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.triangle.2.circlepath.circle.fill" withConfiguration:v5];
  v7 = [v6 imageWithRenderingMode:2];

  v24.receiver = self;
  v24.super_class = (Class)DSWifiSyncController;
  v8 = [(DSTableWelcomeController *)&v24 initWithTitle:&stru_26E9097D0 detailText:&stru_26E9097D0 icon:v7 adoptTableViewScrollView:0 shouldShowSearchBar:0];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(DSWifiSyncController *)v8 setSelectedPairedComputers:v9];

    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(DSWifiSyncController *)v8 setPairedComputers:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F3A398]);
    [(DSWifiSyncController *)v8 setWifiSyncStore:v11];

    os_log_t v12 = os_log_create("com.apple.DigitalSeparation", "DSWifiSyncController");
    v13 = (void *)DSLog_11;
    DSLog_11 = (uint64_t)v12;

    v14 = [(DSWifiSyncController *)v8 headerView];
    v15 = DSUILocStringForKey(@"WIFI_SYNC_TITLE");
    [v14 setTitle:v15];

    v16 = [(DSWifiSyncController *)v8 headerView];
    v17 = [(DSWifiSyncController *)v8 localizedDetailText];
    [v16 setDetailText:v17];

    v18 = DSUILocStringForKey(@"SKIP");
    v19 = [(DSWifiSyncController *)v8 delegate];
    v20 = +[DSUIUtilities setUpBoldButtonForController:v8 title:v18 target:v19 selector:sel_pushNextPane];
    [(DSTableWelcomeController *)v8 setBoldButton:v20];

    v21 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ALL");
    v22 = +[DSUIUtilities setUpLinkButtonForController:v8 title:v21 target:v8 selector:sel_presentRemoveAllDevicesAlert];
    [(DSTableWelcomeController *)v8 setLinkButton:v22];
  }
  return v8;
}

- (void)addPairedDevices:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_pairedComputers removeAllObjects];
  v5 = [(DSWifiSyncController *)self wifiSyncStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__DSWifiSyncController_addPairedDevices___block_invoke;
  v7[3] = &unk_264C6F2D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchPairedDevicesOnQueue:MEMORY[0x263EF83A0] completion:v7];
}

void __41__DSWifiSyncController_addPairedDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    char v6 = [*(id *)(a1 + 32) isViewLoaded];
    v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 presentFetchedErrorAlert];
    }
    else {
      [v7 setFetchError:v9];
    }
  }
  id v8 = [*(id *)(a1 + 32) pairedComputers];
  [v8 addObjectsFromArray:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DSWifiSyncController_shouldShowWithCompletion___block_invoke;
  v6[3] = &unk_264C6F158;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(DSWifiSyncController *)self addPairedDevices:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__DSWifiSyncController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [WeakRetained[163] count] != 0);
  [WeakRetained reloadDetailText];
  v2 = [WeakRetained tableView];
  [v2 reloadData];
}

- (void)removeAllPairedDevicesAndPushNextPane
{
  v3 = [(DSWifiSyncController *)self pairedComputers];
  id v4 = [(DSWifiSyncController *)self wifiSyncStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke;
  v6[3] = &unk_264C6F030;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 removeAllPairedDevicesOnQueue:MEMORY[0x263EF83A0] completion:v6];
}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLog_11;
    if (os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_ERROR)) {
      __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_cold_1((uint64_t)v3, v4);
    }
    id v5 = *(void **)(a1 + 32);
    char v6 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ERROR_TITLE");
    id v7 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ERROR_DETAIL");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_323;
    v10[3] = &unk_264C6E848;
    uint64_t v11 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_2;
    v9[3] = &unk_264C6E848;
    v9[4] = v11;
    [v5 presentErrorAlertWithTitle:v6 message:v7 continueHandler:v10 tryAgainHandler:v9];
  }
  else
  {
    [*(id *)(a1 + 32) reportUnpairedComputers:*(void *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 pushNextPane];
  }
}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_323(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pushNextPane];
}

uint64_t __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllPairedDevicesAndPushNextPane];
}

- (void)reloadDetailText
{
  id v4 = [(DSWifiSyncController *)self headerView];
  id v3 = [(DSWifiSyncController *)self localizedDetailText];
  [v4 setDetailText:v3];
}

- (id)localizedDetailText
{
  unint64_t v3 = [(NSMutableArray *)self->_pairedComputers count];
  id v4 = [(DSWifiSyncController *)self wifiSyncStore];
  char v5 = [v4 fetchWifiSyncStatus];

  if (v5)
  {
    int v6 = MGGetBoolAnswer();
    id v7 = @"WIFI_SYNC_DETAIL_MULTIPLE";
    if (v3 < 2) {
      id v7 = @"WIFI_SYNC_DETAIL_SINGLE";
    }
    id v8 = @"WLAN_SYNC_DETAIL_SINGLE";
    if (v3 >= 2) {
      id v8 = @"WLAN_SYNC_DETAIL_MULTIPLE";
    }
    if (v6) {
      id v9 = v8;
    }
    else {
      id v9 = v7;
    }
  }
  else if (v3 >= 2)
  {
    id v9 = @"CABLE_SYNC_DETAIL_MULTIPLE";
  }
  else
  {
    id v9 = @"CABLE_SYNC_DETAIL_SINGLE";
  }
  id v10 = DSUILocStringForKey(v9);
  return v10;
}

- (void)learnMoreWifiSyncPressed
{
  id v4 = [(DSWifiSyncController *)self delegate];
  unint64_t v3 = DSUILocStringForKey(@"WIFI_SYNC_LEARN_MORE_URL");
  [v4 learnMorePressedForController:self withURL:v3];
}

- (void)presentFetchedErrorAlert
{
  unint64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = DSUILocStringForKey(@"WIFI_SYNC_FETCH_ERROR_TITLE");
  char v5 = DSUILocStringForKey(@"WIFI_SYNC_FETCH_ERROR_DETAIL");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  [(DSTableWelcomeController *)self presentErrorAlertController:v6];
}

- (void)presentRemoveErrorAlert:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82418];
  char v5 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ERROR_TITLE");
  id v6 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ERROR_DETAIL");
  id v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__DSWifiSyncController_presentRemoveErrorAlert___block_invoke;
  v9[3] = &unk_264C6ED28;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __48__DSWifiSyncController_presentRemoveErrorAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentErrorAlertController:*(void *)(a1 + 40)];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)DSWifiSyncController;
  [(DSTableWelcomeController *)&v10 viewDidLoad];
  unint64_t v3 = [MEMORY[0x263F5B8B8] accessoryButton];
  id v4 = DSUILocStringForKey(@"LEARN_MORE");
  [v3 setTitle:v4 forState:0];

  [v3 addTarget:self action:sel_learnMoreWifiSyncPressed forControlEvents:64];
  char v5 = [(DSWifiSyncController *)self headerView];
  [v5 addAccessoryButton:v3];

  if (self->_fetchError)
  {
    [(DSWifiSyncController *)self presentFetchedErrorAlert];
    fetchError = self->_fetchError;
    self->_fetchError = 0;
  }
  else if (![(NSMutableArray *)self->_pairedComputers count])
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__DSWifiSyncController_viewDidLoad__block_invoke;
    v7[3] = &unk_264C6EA20;
    objc_copyWeak(&v8, &location);
    [(DSWifiSyncController *)self addPairedDevices:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __35__DSWifiSyncController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadDetailText];
  id v1 = [WeakRetained tableView];
  [v1 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_pairedComputers count];
}

- (id)titleForPairedComputer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 deviceName];
  if (v4)
  {
    char v5 = (void *)v4;
    id v6 = [v3 deviceName];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = [v3 deviceName];
LABEL_6:
      uint64_t v11 = (__CFString *)v8;
      goto LABEL_8;
    }
  }
  id v9 = [v3 marketingName];
  int v10 = [v9 isEqualToString:@"Windows PC"];

  if (v10)
  {
    uint64_t v8 = DSUILocStringForKey(@"WINDOWS_PC");
    goto LABEL_6;
  }
  uint64_t v11 = &stru_26E9097D0;
LABEL_8:

  return v11;
}

- (id)dateDescription:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F08790];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setDateStyle:1];
    id v6 = [v5 stringFromDate:v4];

    uint64_t v7 = NSString;
    uint64_t v8 = DSUILocStringForKey(@"WIFI_SYNC_TIME_SYNCED");
    id v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_pairedComputers, "objectAtIndexedSubscript:", [v5 row]);
  uint64_t v7 = [(OBTableWelcomeController *)self tableView];
  uint64_t v8 = [(DSWifiSyncController *)self titleForPairedComputer:v6];
  id v9 = [v6 datePaired];
  int v10 = [(DSWifiSyncController *)self dateDescription:v9];
  uint64_t v11 = +[DSIconTableViewCell iconTableViewCellFromTableView:v7 withText:v8 detail:v10 icon:0];

  os_log_t v12 = [v6 datePaired];
  if (v12 || ([v6 serialNumber], (os_log_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    [v11 setEditingAccessoryType:4];
    goto LABEL_5;
  }
  v17 = [v6 marketingName];

  if (v17) {
    goto LABEL_4;
  }
LABEL_5:
  v13 = [(DSWifiSyncController *)self selectedPairedComputers];
  int v14 = [v13 containsObject:v6];

  if (v14)
  {
    v15 = [(OBTableWelcomeController *)self tableView];
    [v15 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];
  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSWifiSyncController *)self selectedPairedComputers];
  pairedComputers = self->_pairedComputers;
  uint64_t v8 = [v5 row];

  id v9 = [(NSMutableArray *)pairedComputers objectAtIndex:v8];
  [v6 addObject:v9];

  [(DSWifiSyncController *)self _updateButtons];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSWifiSyncController *)self selectedPairedComputers];
  pairedComputers = self->_pairedComputers;
  uint64_t v8 = [v5 row];

  id v9 = [(NSMutableArray *)pairedComputers objectAtIndex:v8];
  [v6 removeObject:v9];

  [(DSWifiSyncController *)self _updateButtons];
}

- (void)removeSelectedPairedDevicesAndPushNextPane
{
  id v3 = [(DSWifiSyncController *)self selectedPairedComputers];
  objc_initWeak(&location, self);
  id v4 = [(DSWifiSyncController *)self wifiSyncStore];
  uint64_t v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke;
  v8[3] = &unk_264C6F300;
  objc_copyWeak(&v11, &location);
  id v7 = v3;
  id v9 = v7;
  int v10 = self;
  [v4 removePairedDevices:v7 onQueue:v5 withCompletion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained presentRemoveErrorAlert:v3];
  }
  else
  {
    [WeakRetained reportUnpairedComputers:*(void *)(a1 + 32)];
    id v6 = [v5 selectedPairedComputers];
    [v6 removeAllObjects];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2;
    v7[3] = &unk_264C6E7D0;
    void v7[4] = *(void *)(a1 + 40);
    [v5 addPairedDevices:v7];
  }
}

uint64_t __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = *(void **)(a1 + 32);
  return [v3 finalizeComputerReviewAndPushNextPane];
}

- (void)presentRemoveAllDevicesAlert
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_TITLE");
  uint64_t v5 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_CONFIRMATION");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x263F82400];
  uint64_t v8 = DSUILocStringForKey(@"CANCEL");
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];

  int v10 = (void *)MEMORY[0x263F82400];
  id v11 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_ACTION");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__DSWifiSyncController_presentRemoveAllDevicesAlert__block_invoke;
  v13[3] = &unk_264C6E848;
  v13[4] = self;
  os_log_t v12 = [v10 actionWithTitle:v11 style:2 handler:v13];

  [v6 addAction:v12];
  [v6 addAction:v9];
  [(DSWifiSyncController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __52__DSWifiSyncController_presentRemoveAllDevicesAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllPairedDevicesAndPushNextPane];
}

- (void)presentRemoveSelectedDevicesAlert
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_TITLE");
  uint64_t v5 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_CONFIRMATION");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x263F82400];
  uint64_t v8 = DSUILocStringForKey(@"CANCEL");
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];

  int v10 = (void *)MEMORY[0x263F82400];
  id v11 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_ACTION");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__DSWifiSyncController_presentRemoveSelectedDevicesAlert__block_invoke;
  v13[3] = &unk_264C6E848;
  v13[4] = self;
  os_log_t v12 = [v10 actionWithTitle:v11 style:2 handler:v13];

  [v6 addAction:v12];
  [v6 addAction:v9];
  [(DSWifiSyncController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __57__DSWifiSyncController_presentRemoveSelectedDevicesAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSelectedPairedDevicesAndPushNextPane];
}

- (void)_updateButtons
{
  uint64_t v3 = [(NSMutableArray *)self->_selectedPairedComputers count];
  BOOL v4 = v3 == 0;
  if (v3) {
    uint64_t v5 = @"WIFI_SYNC_REMOVE";
  }
  else {
    uint64_t v5 = @"SKIP";
  }
  if (v4) {
    id v6 = &selRef_finalizeComputerReviewAndPushNextPane;
  }
  else {
    id v6 = &selRef_presentRemoveSelectedDevicesAlert;
  }
  DSUILocStringForKey(v5);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = *v6;
  uint64_t v8 = [(DSTableWelcomeController *)self boldButton];
  [v8 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  id v9 = [(DSTableWelcomeController *)self boldButton];
  [v9 setTitle:v14 forState:0];

  int v10 = [(DSTableWelcomeController *)self boldButton];
  [v10 addTarget:self action:v7 forControlEvents:64];

  id v11 = [(DSTableWelcomeController *)self linkButton];
  os_log_t v12 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE_ALL");
  [v11 setTitle:v12 forState:0];

  v13 = [(DSTableWelcomeController *)self linkButton];
  [v13 addTarget:self action:sel_presentRemoveAllDevicesAlert forControlEvents:64];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_pairedComputers, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v6 = [[DSWifiSyncDetailController alloc] initWithPairedComputer:v5];
  [(DSWifiSyncDetailController *)v6 setDelegate:self];
  v9[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [(DSWifiSyncController *)self reportReviewedComputers:v7];

  uint64_t v8 = [(DSWifiSyncController *)self navigationController];
  [v8 pushViewController:v6 animated:1];
}

- (void)removeDetailViewControllerFromStack
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(DSWifiSyncController *)self navigationController];
  uint64_t v5 = [v4 viewControllers];

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

  os_log_t v12 = [(DSWifiSyncController *)self navigationController];
  [v12 setViewControllers:v3];
}

- (void)returnFromDetailAndRemoveComputer:(id)a3
{
  id v4 = a3;
  wifiSyncStore = self->_wifiSyncStore;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke;
  v8[3] = &unk_264C6F030;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(DSWifiSyncStore *)wifiSyncStore removePairedDevices:v6 onQueue:MEMORY[0x263EF83A0] withCompletion:v8];
}

void __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 presentRemoveErrorAlert:v3];
  }
  else
  {
    uint64_t v5 = [v4 selectedPairedComputers];
    [v5 removeAllObjects];

    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke_2;
    v7[3] = &unk_264C6EA98;
    objc_copyWeak(&v9, &location);
    id v8 = *(id *)(a1 + 40);
    [v6 addPairedDevices:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateButtons];
  id v3 = [WeakRetained tableView];
  [v3 reloadData];

  id v4 = [WeakRetained pairedComputers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [WeakRetained navigationController];
    id v7 = (id)[v6 popViewControllerAnimated:1];
  }
  else
  {
    id v8 = [WeakRetained delegate];
    [v8 pushNextPane];

    v10[0] = *(void *)(a1 + 32);
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [WeakRetained reportUnpairedComputers:v9];

    [WeakRetained removeDetailViewControllerFromStack];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSWifiSyncController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(DSWifiSyncController *)self _updateButtons];
}

- (void)finalizeComputerReviewAndPushNextPane
{
  [(DSWifiSyncController *)self finalizePairingReviewReport];
  id v3 = [(DSWifiSyncController *)self delegate];
  [v3 pushNextPane];
}

- (void)finalizePairingReviewReport
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(DSWifiSyncController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [v3 unpairedComputers];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = [(DSWifiSyncController *)self pairedComputers];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            os_log_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            long long v13 = [v12 lockdownFrameworkKey];

            if (v13)
            {
              long long v14 = [v12 lockdownFrameworkKey];
              [v6 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      if (objc_opt_respondsToSelector())
      {
        long long v15 = [v3 reviewedComputers];
        [v15 addObjectsFromArray:v6];
      }
    }
  }
}

- (void)reportUnpairedComputers:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSWifiSyncController *)self delegate];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        os_log_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v13 = [v12 lockdownFrameworkKey];

        if (v13)
        {
          long long v14 = [v12 lockdownFrameworkKey];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  if (objc_opt_respondsToSelector())
  {
    long long v15 = [v5 unpairedComputers];
    [v15 addObjectsFromArray:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          v22 = objc_msgSend(v5, "reviewedComputers", (void)v23);
          [v22 removeObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }
  }
}

- (void)reportReviewedComputers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DSWifiSyncController *)self delegate];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        os_log_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "lockdownFrameworkKey", (void)v16);

        if (v13)
        {
          long long v14 = [v12 lockdownFrameworkKey];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if (objc_opt_respondsToSelector())
  {
    long long v15 = [v5 reviewedComputers];
    [v15 addObjectsFromArray:v6];
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (NSMutableArray)pairedComputers
{
  return self->_pairedComputers;
}

- (void)setPairedComputers:(id)a3
{
}

- (NSMutableArray)selectedPairedComputers
{
  return self->_selectedPairedComputers;
}

- (void)setSelectedPairedComputers:(id)a3
{
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_selectedPairedComputers, 0);
  objc_storeStrong((id *)&self->_pairedComputers, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Failed to remove all paired devices with error %@", (uint8_t *)&v2, 0xCu);
}

@end