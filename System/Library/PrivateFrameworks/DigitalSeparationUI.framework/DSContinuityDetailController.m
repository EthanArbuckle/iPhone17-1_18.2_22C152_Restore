@interface DSContinuityDetailController
- (DSContinuityDelegate)delegate;
- (DSContinuityDetailController)initWithContinuityDevice:(id)a3;
- (DSContinuityDevice)continuityDevice;
- (NSMutableArray)orderedCells;
- (id)cellWithText:(id)a3 secondaryText:(id)a4;
- (id)localizedDetailText;
- (id)marketingNameForDevice:(id)a3;
- (id)stringFromDate:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)back;
- (void)presentRemoveDeviceAlert;
- (void)returnFromDetailAndRemoveComputer;
- (void)setContinuityDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOrderedCells:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSContinuityDetailController

- (DSContinuityDetailController)initWithContinuityDevice:(id)a3
{
  id v5 = a3;
  v6 = [v5 deviceImage];
  v35.receiver = self;
  v35.super_class = (Class)DSContinuityDetailController;
  v7 = [(DSTableWelcomeController *)&v35 initWithTitle:&stru_26E9097D0 detailText:&stru_26E9097D0 icon:v6 adoptTableViewScrollView:0 shouldShowSearchBar:0];

  if (!v7) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v7->_continuityDevice, a3);
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  orderedCells = v7->_orderedCells;
  v7->_orderedCells = v8;

  v10 = [(DSContinuityDetailController *)v7 headerView];
  v11 = [v5 name];
  [v10 setTitle:v11];

  v12 = [(DSContinuityDetailController *)v7 headerView];
  v13 = [(DSContinuityDetailController *)v7 localizedDetailText];
  [v12 setDetailText:v13];

  v14 = [v5 model];
  if (v14)
  {

LABEL_5:
    v16 = v7->_orderedCells;
    v17 = DSUILocStringForKey(@"CONTINUITY_DEVICE_MODEL");
    v18 = +[DSUIUtilities valueForUnfinalizedString:v17];
    v19 = [(DSContinuityDetailController *)v7 marketingNameForDevice:v5];
    v20 = [(DSContinuityDetailController *)v7 cellWithText:v18 secondaryText:v19];
    [(NSMutableArray *)v16 addObject:v20];

    goto LABEL_6;
  }
  v15 = [v5 marketingName];

  if (v15) {
    goto LABEL_5;
  }
LABEL_6:
  v21 = [v5 serialNumber];

  if (v21)
  {
    v22 = v7->_orderedCells;
    v23 = DSUILocStringForKey(@"CONTINUITY_DEVICE_SERIAL_NUMBER");
    v24 = +[DSUIUtilities valueForUnfinalizedString:v23];
    v25 = [v5 serialNumber];
    v26 = [(DSContinuityDetailController *)v7 cellWithText:v24 secondaryText:v25];
    [(NSMutableArray *)v22 addObject:v26];
  }
  v27 = [v5 initialDiscoveryDate];

  if (v27)
  {
    v28 = v7->_orderedCells;
    v29 = DSUILocStringForKey(@"CONTINUITY_TIME_PAIRED_2");
    v30 = +[DSUIUtilities valueForUnfinalizedString:v29];
    v31 = [v5 initialDiscoveryDate];
    v32 = [(DSContinuityDetailController *)v7 stringFromDate:v31];
    v33 = [(DSContinuityDetailController *)v7 cellWithText:v30 secondaryText:v32];
    [(NSMutableArray *)v28 addObject:v33];
  }
LABEL_10:

  return v7;
}

- (id)cellWithText:(id)a3 secondaryText:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F82C80];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
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
  if (v5) {
    [v9 setSecondaryText:v5];
  }
  [v8 setContentConfiguration:v9];

  return v8;
}

- (void)presentRemoveDeviceAlert
{
  v3 = NSString;
  v4 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_SINGLE_TITLE");
  id v5 = [(DSContinuityDetailController *)self continuityDevice];
  v6 = [v5 name];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  id v8 = NSString;
  v9 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_SINGLE_CONFIRMATION");
  v10 = [(DSContinuityDetailController *)self continuityDevice];
  v11 = [v10 name];
  v12 = objc_msgSend(v8, "stringWithFormat:", v9, v11);

  v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v12 preferredStyle:0];
  v14 = (void *)MEMORY[0x263F82400];
  v15 = DSUILocStringForKey(@"CANCEL");
  v16 = [v14 actionWithTitle:v15 style:1 handler:0];

  v17 = (void *)MEMORY[0x263F82400];
  v18 = DSUILocStringForKey(@"CONTINUITY_STOP");
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__DSContinuityDetailController_presentRemoveDeviceAlert__block_invoke;
  v20[3] = &unk_264C6E848;
  v20[4] = self;
  v19 = [v17 actionWithTitle:v18 style:2 handler:v20];

  [v13 addAction:v19];
  [v13 addAction:v16];
  [(DSContinuityDetailController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __56__DSContinuityDetailController_presentRemoveDeviceAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnFromDetailAndRemoveComputer];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DSContinuityDetailController;
  [(DSTableWelcomeController *)&v8 viewDidLoad];
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setEditing:0];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setAllowsSelection:0];

  id v5 = DSUILocStringForKey(@"CONTINUITY_STOP");
  v6 = +[DSUIUtilities valueForUnfinalizedString:v5];
  id v7 = +[DSUIUtilities setUpBoldButtonForController:self title:v6 target:self selector:sel_presentRemoveDeviceAlert];
  [(DSTableWelcomeController *)self setBoldButton:v7];
}

- (void)returnFromDetailAndRemoveComputer
{
  id v4 = [(DSContinuityDetailController *)self delegate];
  v3 = [(DSContinuityDetailController *)self continuityDevice];
  [v4 returnFromDetailAndRemoveDevice:v3];
}

- (id)localizedDetailText
{
  v3 = [(DSContinuityDetailController *)self continuityDevice];
  uint64_t v4 = [v3 formattedSessionStart];
  if (!v4)
  {
    v13 = &stru_26E9097D0;
    goto LABEL_5;
  }
  id v5 = (void *)v4;
  v6 = [(DSContinuityDetailController *)self continuityDevice];
  id v7 = [v6 formattedSessionDuration];

  if (v7)
  {
    objc_super v8 = NSString;
    v3 = DSUILocStringForKey(@"CONTINUITY_SESSION_DETAIL");
    v9 = [(DSContinuityDetailController *)self continuityDevice];
    v10 = [v9 formattedSessionStart];
    v11 = [(DSContinuityDetailController *)self continuityDevice];
    v12 = [v11 formattedSessionDuration];
    objc_msgSend(v8, "stringWithFormat:", v3, v10, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_7;
  }
  v13 = &stru_26E9097D0;
LABEL_7:
  return v13;
}

- (id)stringFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTimeStyle:1];
  [v5 setDateStyle:1];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)marketingNameForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 marketingName];

  if (v4)
  {
    id v5 = [v3 marketingName];
  }
  else
  {
    v6 = (void *)MEMORY[0x263F4A818];
    uint64_t v7 = [v3 model];

    id v5 = [v6 marketingNameForModel:v7];
    id v3 = (id)v7;
  }

  return v5;
}

- (void)back
{
  id v3 = [(DSContinuityDetailController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSContinuityDetailController *)self orderedCells];
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
  id v4 = [(DSContinuityDetailController *)self orderedCells];
  int64_t v5 = [v4 count];

  return v5;
}

- (DSContinuityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSContinuityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSContinuityDevice)continuityDevice
{
  return self->_continuityDevice;
}

- (void)setContinuityDevice:(id)a3
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
  objc_storeStrong((id *)&self->_continuityDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end