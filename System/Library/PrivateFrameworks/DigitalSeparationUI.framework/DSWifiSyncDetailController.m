@interface DSWifiSyncDetailController
- (DSPairedComputer)pairedComputer;
- (DSWifiSyncDelegate)delegate;
- (DSWifiSyncDetailController)initWithPairedComputer:(id)a3;
- (NSMutableArray)orderedCells;
- (id)cellWithText:(id)a3 secondaryText:(id)a4;
- (id)dateDescription;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)back;
- (void)presentRemoveDeviceAlert;
- (void)returnFromDetailAndRemoveComputer;
- (void)setDelegate:(id)a3;
- (void)setOrderedCells:(id)a3;
- (void)setPairedComputer:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSWifiSyncDetailController

- (DSWifiSyncDetailController)initWithPairedComputer:(id)a3
{
  id v5 = a3;
  v6 = [v5 deviceName];
  v29.receiver = self;
  v29.super_class = (Class)DSWifiSyncDetailController;
  v7 = [(DSTableWelcomeController *)&v29 initWithTitle:v6 detailText:&stru_26E9097D0 icon:0 adoptTableViewScrollView:0 shouldShowSearchBar:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_pairedComputer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    orderedCells = v7->_orderedCells;
    v7->_orderedCells = v8;

    v10 = [v5 marketingName];

    if (v10)
    {
      v11 = v7->_orderedCells;
      v12 = DSUILocStringForKey(@"WIFI_SYNC_DEVICE_MODEL");
      v13 = +[DSUIUtilities valueForUnfinalizedString:v12];
      v14 = [v5 marketingName];
      v15 = [(DSWifiSyncDetailController *)v7 cellWithText:v13 secondaryText:v14];
      [(NSMutableArray *)v11 addObject:v15];
    }
    v16 = [v5 serialNumber];

    if (v16)
    {
      v17 = v7->_orderedCells;
      v18 = DSUILocStringForKey(@"WIFI_SYNC_DEVICE_SERIAL_NUMBER");
      v19 = +[DSUIUtilities valueForUnfinalizedString:v18];
      v20 = [v5 serialNumber];
      v21 = [(DSWifiSyncDetailController *)v7 cellWithText:v19 secondaryText:v20];
      [(NSMutableArray *)v17 addObject:v21];
    }
    v22 = [v5 datePaired];

    if (v22)
    {
      v23 = v7->_orderedCells;
      v24 = DSUILocStringForKey(@"WIFI_SYNC_TIME_SYNCED_2");
      v25 = +[DSUIUtilities valueForUnfinalizedString:v24];
      v26 = [(DSWifiSyncDetailController *)v7 dateDescription];
      v27 = [(DSWifiSyncDetailController *)v7 cellWithText:v25 secondaryText:v26];
      [(NSMutableArray *)v23 addObject:v27];
    }
  }

  return v7;
}

- (id)cellWithText:(id)a3 secondaryText:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F82C80];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [MEMORY[0x263F82918] valueCellConfiguration];
  [v8 setAccessoryType:0];
  [v8 setIsAccessibilityElement:1];
  v10 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  [v8 setBackgroundColor:v10];

  v11 = [v9 textProperties];
  [v11 setNumberOfLines:0];

  v12 = [v9 textProperties];
  [v12 setLineBreakMode:0];

  [v9 setText:v7];
  [v9 setSecondaryText:v6];

  [v8 setContentConfiguration:v9];
  return v8;
}

- (void)presentRemoveDeviceAlert
{
  v3 = [(DSWifiSyncDetailController *)self pairedComputer];
  v4 = [v3 deviceName];

  id v5 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_DETAIL");
  id v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v4);
  id v7 = (void *)MEMORY[0x263F82418];
  id v8 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_CONFIRMATION_DETAIL");
  v9 = [v7 alertControllerWithTitle:v6 message:v8 preferredStyle:0];

  v10 = (void *)MEMORY[0x263F82400];
  v11 = DSUILocStringForKey(@"CANCEL");
  v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  v13 = (void *)MEMORY[0x263F82400];
  v14 = DSUILocStringForKey(@"WIFI_SYNC_DISCONNECT_ACTION");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__DSWifiSyncDetailController_presentRemoveDeviceAlert__block_invoke;
  v16[3] = &unk_264C6E848;
  v16[4] = self;
  v15 = [v13 actionWithTitle:v14 style:2 handler:v16];

  [v9 addAction:v15];
  [v9 addAction:v12];
  [(DSWifiSyncDetailController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __54__DSWifiSyncDetailController_presentRemoveDeviceAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnFromDetailAndRemoveComputer];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DSWifiSyncDetailController;
  [(DSTableWelcomeController *)&v8 viewDidLoad];
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setEditing:0];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setAllowsSelection:0];

  id v5 = DSUILocStringForKey(@"WIFI_SYNC_REMOVE");
  id v6 = +[DSUIUtilities valueForUnfinalizedString:v5];
  id v7 = +[DSUIUtilities setUpBoldButtonForController:self title:v6 target:self selector:sel_presentRemoveDeviceAlert];
  [(DSTableWelcomeController *)self setBoldButton:v7];
}

- (void)returnFromDetailAndRemoveComputer
{
  id v4 = [(DSWifiSyncDetailController *)self delegate];
  v3 = [(DSWifiSyncDetailController *)self pairedComputer];
  [v4 returnFromDetailAndRemoveComputer:v3];
}

- (id)dateDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setTimeStyle:1];
  [v3 setDateStyle:1];
  id v4 = [(DSPairedComputer *)self->_pairedComputer datePaired];
  id v5 = [v3 stringFromDate:v4];

  return v5;
}

- (void)back
{
  id v3 = [(DSWifiSyncDetailController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSWifiSyncDetailController *)self orderedCells];
  uint64_t v7 = [v5 row];

  objc_super v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(DSWifiSyncDetailController *)self orderedCells];
  int64_t v5 = [v4 count];

  return v5;
}

- (DSWifiSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSWifiSyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSPairedComputer)pairedComputer
{
  return self->_pairedComputer;
}

- (void)setPairedComputer:(id)a3
{
}

- (NSMutableArray)orderedCells
{
  return self->_orderedCells;
}

- (void)setOrderedCells:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedCells, 0);
  objc_storeStrong((id *)&self->_pairedComputer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end