@interface CDPDevicePickerViewController
- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4;
- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4 tableViewStyle:(int64_t)a5;
- (NSArray)devices;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)escapeOffers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)viewForFooterInTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDevices:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CDPDevicePickerViewController

- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4
{
  return [(CDPDevicePickerViewController *)self initWithDevices:a3 delegate:a4 tableViewStyle:1];
}

- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4 tableViewStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 prevailingLocalSecretType] != 2)
  {
    v11 = CDPLocalizedString();
    CDPLocalizedString();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = [(CDPTableViewController *)self initWithTitle:v11 subTitle:v12];
LABEL_8:

    goto LABEL_9;
  }
  v11 = CDPLocalizedString();
  v12 = @"DEVICE_PICKER_SUBTITLE_ALL_MAC";
  if (([@"DEVICE_PICKER_SUBTITLE_ALL_MAC" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    char v13 = 0;
  }
  else
  {
    v12 = [@"DEVICE_PICKER_SUBTITLE_ALL_MAC" stringByAppendingString:@"_REBRAND"];
    char v13 = 1;
  }
  v15 = CDPLocalizedString();
  v14 = [(CDPTableViewController *)self initWithTitle:v11 subTitle:v15];

  if (v13) {
    goto LABEL_8;
  }
LABEL_9:

  if (v14)
  {
    objc_storeStrong((id *)&v14->_devices, a3);
    objc_storeWeak((id *)&v14->_delegate, v10);
    [(CDPTableViewController *)v14 setTableViewStyle:a5];
  }

  return v14;
}

- (id)escapeOffers
{
  escapeOffers = self->_escapeOffers;
  if (!escapeOffers)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [WeakRetained devicePicker:self escapeOffersForDevices:self->_devices];
    v6 = self->_escapeOffers;
    self->_escapeOffers = v5;

    escapeOffers = self->_escapeOffers;
  }

  return escapeOffers;
}

- (double)heightForFooterInTableView:(id)a3
{
  v3 = [(CDPDevicePickerViewController *)self escapeOffers];
  double v4 = (double)(unint64_t)[v3 count] * 45.0;

  return v4;
}

- (id)viewForFooterInTableView:(id)a3
{
  double v4 = [(CDPDevicePickerViewController *)self escapeOffers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(CDPDevicePickerViewController *)self escapeOffers];
    v7 = objc_msgSend(v6, "aaf_map:", &__block_literal_global_1);

    v8 = (void *)[objc_alloc(MEMORY[0x263F82BF8]) initWithArrangedSubviews:v7];
    [v8 setAxis:1];
    [v8 setAlignment:3];
    [v8 setDistribution:4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __58__CDPDevicePickerViewController_viewForFooterInTableView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F824E8];
  id v3 = a2;
  double v4 = [v2 buttonWithType:1];
  uint64_t v5 = [v3 escapeOfferName];
  [v4 setTitle:v5 forState:0];

  v6 = [v4 titleLabel];
  v7 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
  [v6 setFont:v7];

  [v4 addTarget:v3 action:sel_handleEscapeAction_ forControlEvents:64];
  [v4 sizeToFit];

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_devices count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CDPTableViewController *)self tableView];
  id v9 = [v8 dequeueReusableCellWithIdentifier:@"CDPDeviceCell"];

  if (!v9)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:@"CDPDeviceCell"];
    [v9 setAccessoryType:1];
  }
  id v10 = -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", [v6 row]);
  v11 = [v10 localizedName];
  v12 = [v9 textLabel];
  [v12 setText:v11];

  char v13 = (void *)MEMORY[0x263F81708];
  v14 = [v9 textLabel];
  v15 = [v14 font];
  [v15 pointSize];
  v16 = objc_msgSend(v13, "boldSystemFontOfSize:");
  v17 = [v9 textLabel];
  [v17 setFont:v16];

  v18 = [v10 model];
  v19 = [v9 detailTextLabel];
  [v19 setText:v18];

  uint64_t v20 = [v7 style];
  if (v20 == 2) {
    [MEMORY[0x263F825C8] systemGray6Color];
  }
  else {
  v21 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  [v9 setBackgroundColor:v21];

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F343B8], "builderForKey:", @"DEVICE_PICKER_DEVICES_HEADER", a4);
  id v6 = objc_msgSend(v5, "addSecretType:", -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType"));
  id v7 = [v6 localizedString];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  devices = self->_devices;
  uint64_t v8 = [v6 row];

  id v9 = [(NSArray *)devices objectAtIndexedSubscript:v8];
  [WeakRetained devicePicker:self didSelectDevice:v9];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4 = [(CDPDevicePickerViewController *)self traitCollection];
  uint64_t v5 = [v4 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v5)) {
    double v6 = *MEMORY[0x263F839B8];
  }
  else {
    double v6 = 60.0;
  }

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (!a4)
  {
    [(UIButton *)self->_remoteApprovalButton frame];
    return v7 + 45.0;
  }
  return result;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
  id v5 = a3;
  escapeOffers = self->_escapeOffers;
  self->_escapeOffers = 0;

  id v7 = [(CDPTableViewController *)self tableView];
  [v7 reloadData];
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteApprovalButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_escapeOffers, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end