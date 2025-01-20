@interface FBKDeviceChoicesViewController
- (BOOL)isMultiSelect;
- (FBKDeviceChoiceDelegate)choiceDelegate;
- (FBKDeviceChoicesViewController)init;
- (NSArray)sortedChoices;
- (NSMutableSet)selectedDevices;
- (NSSet)deviceChoices;
- (_UIContentUnavailableView)contentUnavailableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didCancel;
- (void)didTapDone;
- (void)hideContentUnavailableView;
- (void)setChoiceDelegate:(id)a3;
- (void)setContentUnavailableView:(id)a3;
- (void)setDeviceChoices:(id)a3;
- (void)setIsMultiSelect:(BOOL)a3;
- (void)setSelectedDevices:(id)a3;
- (void)setSortedChoices:(id)a3;
- (void)showContentUnavailableView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBKDeviceChoicesViewController

- (FBKDeviceChoicesViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)FBKDeviceChoicesViewController;
  v2 = [(FBKDeviceChoicesViewController *)&v7 initWithStyle:2];
  v3 = v2;
  if (v2)
  {
    v2->_isMultiSelect = 0;
    uint64_t v4 = [MEMORY[0x263EFF9C0] setWithCapacity:10];
    selectedDevices = v3->_selectedDevices;
    v3->_selectedDevices = (NSMutableSet *)v4;
  }
  return v3;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)FBKDeviceChoicesViewController;
  [(FBKDeviceChoicesViewController *)&v27 viewDidLoad];
  [(FBKDeviceChoicesViewController *)self setClearsSelectionOnViewWillAppear:1];
  +[FBKDevicePairingCell estimatedRowHeight];
  double v4 = v3;
  v5 = [(FBKDeviceChoicesViewController *)self tableView];
  [v5 setEstimatedRowHeight:v4];

  double v6 = *MEMORY[0x263F839B8];
  objc_super v7 = [(FBKDeviceChoicesViewController *)self tableView];
  [v7 setRowHeight:v6];

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = (void *)MEMORY[0x263F829D0];
  v11 = [MEMORY[0x263F086E0] feedbackCoreFramework];
  v12 = [v10 nibWithNibName:v9 bundle:v11];

  v13 = [(FBKDeviceChoicesViewController *)self tableView];
  [v13 registerNib:v12 forCellReuseIdentifier:v9];

  v14 = [(FBKDeviceChoicesViewController *)self deviceChoices];

  if (v14)
  {
    v15 = [(FBKDeviceChoicesViewController *)self deviceChoices];
    v16 = [v15 allObjects];
    v17 = +[FBKGroupedDevice sortedDevices:v16];
    [(FBKDeviceChoicesViewController *)self setSortedChoices:v17];
  }
  else
  {
    [(FBKDeviceChoicesViewController *)self setSortedChoices:MEMORY[0x263EFFA68]];
  }
  v18 = [MEMORY[0x263F086E0] FeedbackCore];
  v19 = [v18 localizedStringForKey:@"ADD_DEVICE" value:@"Add Device" table:0];
  v20 = [(FBKDeviceChoicesViewController *)self navigationItem];
  [v20 setTitle:v19];

  v21 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_didCancel];
  v22 = [(FBKDeviceChoicesViewController *)self navigationItem];
  [v22 setLeftBarButtonItem:v21];

  if ([(FBKDeviceChoicesViewController *)self isMultiSelect])
  {
    v23 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone];
    v24 = [(FBKDeviceChoicesViewController *)self navigationItem];
    [v24 setRightBarButtonItem:v23];

    v25 = [(FBKDeviceChoicesViewController *)self navigationItem];
    v26 = [v25 rightBarButtonItem];
    [v26 setEnabled:0];
  }
}

- (void)didTapDone
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Done button not supported for multi-select picker", v1, 2u);
}

- (void)didCancel
{
  id v3 = [(FBKDeviceChoicesViewController *)self choiceDelegate];
  [v3 deviceChoicesControllerDidCancelWithController:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(FBKDeviceChoicesViewController *)self sortedChoices];
  int64_t v6 = [v5 count];

  if (v6) {
    [(FBKDeviceChoicesViewController *)self hideContentUnavailableView];
  }
  else {
    [(FBKDeviceChoicesViewController *)self showContentUnavailableView];
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4
    || !-[FBKDeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    double v4 = 0;
  }
  else
  {
    BOOL v6 = [(FBKDeviceChoicesViewController *)self isMultiSelect];
    objc_super v7 = [MEMORY[0x263F086E0] FeedbackCore];
    v8 = v7;
    if (v6)
    {
      v9 = @"DEVICE_PICKER_FOOTER_MULTI_SELECT";
      v10 = @"To share diagnostic logs with Apple, select all of the devices experiencing this issue. If your device is not listed, make sure it is nearby, online, and signed in to your iCloud account.";
    }
    else
    {
      v9 = @"DEVICE_PICKER_FOOTER_SINGLE_SELECT";
      v10 = @"To share diagnostic logs with Apple, select the device experiencing this issue. If your device is not listed, make sure it is nearby, online, and signed in to your iCloud account.";
    }
    double v4 = [v7 localizedStringForKey:v9 value:v10 table:0];
  }

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4
    || !-[FBKDeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    double v4 = 0;
  }
  else
  {
    BOOL v6 = [(FBKDeviceChoicesViewController *)self isMultiSelect];
    objc_super v7 = [MEMORY[0x263F086E0] FeedbackCore];
    v8 = v7;
    if (v6)
    {
      v9 = @"DEVICE_PICKER_HEADER_MULTI_SELECT";
      v10 = @"Select Devices";
    }
    else
    {
      v9 = @"DEVICE_PICKER_HEADER_SINGLE_SELECT";
      v10 = @"Select Device";
    }
    double v4 = [v7 localizedStringForKey:v9 value:v10 table:0];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = tableView_cellForRowAtIndexPath__onceToken;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_24);
  }
  v9 = [v8 dequeueReusableCellWithIdentifier:tableView_cellForRowAtIndexPath__identifier forIndexPath:v7];

  v10 = [(FBKDeviceChoicesViewController *)self sortedChoices];
  uint64_t v11 = [v7 row];

  v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [(FBKDeviceChoicesViewController *)self selectedDevices];
  uint64_t v14 = [v13 containsObject:v12];

  [v9 updateWithDevice:v12 showsDetail:0 showsTransport:0 isSelected:v14];
  [v9 spaceFromSuperViewToLabel];
  objc_msgSend(v9, "updateWithSeparatorSpacing:");

  return v9;
}

uint64_t __66__FBKDeviceChoicesViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  tableView_cellForRowAtIndexPath__identifier = NSStringFromClass(v0);

  return MEMORY[0x270F9A758]();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKDeviceChoicesViewController *)self sortedChoices];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  v10 = +[FBKLog ded];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 publicLogDescription];
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "did tap device [%{public}@] on device picker", buf, 0xCu);
  }
  if ([(FBKDeviceChoicesViewController *)self isMultiSelect])
  {
    v12 = [(FBKDeviceChoicesViewController *)self selectedDevices];
    int v13 = [v12 containsObject:v9];

    uint64_t v14 = [(FBKDeviceChoicesViewController *)self selectedDevices];
    v15 = v14;
    if (v13)
    {
      [v14 removeObject:v9];
    }
    else
    {
      v18 = [(FBKDeviceChoicesViewController *)self sortedChoices];
      v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      [v15 addObject:v19];
    }
    id v23 = v7;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    [v6 reloadRowsAtIndexPaths:v20 withRowAnimation:100];

    v16 = [(FBKDeviceChoicesViewController *)self selectedDevices];
    BOOL v21 = [v16 count] != 0;
    v17 = [(FBKDeviceChoicesViewController *)self navigationItem];
    v22 = [v17 rightBarButtonItem];
    [v22 setEnabled:v21];
  }
  else
  {
    v16 = [(FBKDeviceChoicesViewController *)self choiceDelegate];
    v17 = [MEMORY[0x263EFFA08] setWithObject:v9];
    [v16 deviceChoicesController:self didChooseDevices:v17];
  }
}

- (void)showContentUnavailableView
{
  id v4 = [(FBKDeviceChoicesViewController *)self contentUnavailableView];
  id v3 = [(FBKDeviceChoicesViewController *)self tableView];
  [v3 setBackgroundView:v4];
}

- (void)hideContentUnavailableView
{
  id v2 = [(FBKDeviceChoicesViewController *)self tableView];
  [v2 setBackgroundView:0];
}

- (_UIContentUnavailableView)contentUnavailableView
{
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82EF0]);
    v5 = [(FBKDeviceChoicesViewController *)self view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"NO_MORE_DEVICES_TITLE" value:&stru_26DDF6A30 table:0];
    v16 = (_UIContentUnavailableView *)objc_msgSend(v4, "initWithFrame:title:style:", v15, 0, v7, v9, v11, v13);
    v17 = self->_contentUnavailableView;
    self->_contentUnavailableView = v16;

    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"NO_MORE_DEVICES_MESSAGE" value:&stru_26DDF6A30 table:0];
    [(_UIContentUnavailableView *)self->_contentUnavailableView setMessage:v19];

    contentUnavailableView = self->_contentUnavailableView;
  }

  return contentUnavailableView;
}

- (FBKDeviceChoiceDelegate)choiceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_choiceDelegate);

  return (FBKDeviceChoiceDelegate *)WeakRetained;
}

- (void)setChoiceDelegate:(id)a3
{
}

- (NSSet)deviceChoices
{
  return self->_deviceChoices;
}

- (void)setDeviceChoices:(id)a3
{
}

- (BOOL)isMultiSelect
{
  return self->_isMultiSelect;
}

- (void)setIsMultiSelect:(BOOL)a3
{
  self->_isMultiSelect = a3;
}

- (NSMutableSet)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
}

- (void)setContentUnavailableView:(id)a3
{
}

- (NSArray)sortedChoices
{
  return self->_sortedChoices;
}

- (void)setSortedChoices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedChoices, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
  objc_storeStrong((id *)&self->_selectedDevices, 0);
  objc_storeStrong((id *)&self->_deviceChoices, 0);

  objc_destroyWeak((id *)&self->_choiceDelegate);
}

@end