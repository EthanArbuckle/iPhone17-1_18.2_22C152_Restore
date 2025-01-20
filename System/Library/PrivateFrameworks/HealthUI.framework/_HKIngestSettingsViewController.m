@interface _HKIngestSettingsViewController
- (HKHealthStore)healthStore;
- (NSUUID)deviceIdentifier;
- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 useInsetStyling:(BOOL)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_displayGuestModeAlertWithCompletion:(id)a3;
- (void)fetchEnabledStatusForPeripheral;
- (void)reloadData:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation _HKIngestSettingsViewController

- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 useInsetStyling:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = [(HKTableViewController *)self initWithUsingInsetStyling:v5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F2B0B0]) initWithHealthStore:v9];
    healthServicesManager = v12->_healthServicesManager;
    v12->_healthServicesManager = (HKHealthServicesManager *)v13;

    objc_storeStrong((id *)&v12->_displayTypeController, a4);
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    dataTypeNames = v12->_dataTypeNames;
    v12->_dataTypeNames = (NSMutableArray *)v15;

    v12->_deviceFound = 1;
  }

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_HKIngestSettingsViewController;
  [(HKTableViewController *)&v4 viewDidLoad];
  v3 = [(_HKIngestSettingsViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  [(_HKIngestSettingsViewController *)self fetchEnabledStatusForPeripheral];
}

- (void)fetchEnabledStatusForPeripheral
{
  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke;
  v4[3] = &unk_1E6D512C8;
  v4[4] = self;
  [(HKHealthServicesManager *)healthServicesManager getEnabledStatusForPeripheral:deviceIdentifier withCompletion:v4];
}

- (void)reloadData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_deviceIdentifier)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeForObjectTypeUnifyingBloodPressureTypes:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          v11 = [v10 localization];
          v12 = [v11 displayName];

          if (([(NSMutableArray *)self->_dataTypeNames containsObject:v12] & 1) == 0) {
            [(NSMutableArray *)self->_dataTypeNames addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___HKIngestSettingsViewController_reloadData___block_invoke;
    block[3] = &unk_1E6D50ED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 isOn];
  objc_initWeak(&location, self);
  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke;
  v9[3] = &unk_1E6D53930;
  objc_copyWeak(&v10, &location);
  char v11 = v6;
  [(HKHealthServicesManager *)healthServicesManager setEnabledStatus:v6 forPeripheral:deviceIdentifier withCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v6 = [v5 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  char v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v12 = [v11 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72___HKIngestSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E6D53958;
  id v17 = v3;
  id v13 = v3;
  long long v14 = [v10 actionWithTitle:v12 style:0 handler:v16];

  [v9 addAction:v14];
  [(_HKIngestSettingsViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return [(NSMutableArray *)self->_dataTypeNames count];
  }
  else {
    return a4 == 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [(_HKIngestSettingsViewController *)self tableView];
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [v7 dequeueReusableCellWithIdentifier:@"DeviceSourceDatatype"];

    if (!v9)
    {
      id v9 = (HKSwitchTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"DeviceSourceDatatype"];
      [(HKSwitchTableViewCell *)v9 setSelectionStyle:0];
    }
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_dataTypeNames, "objectAtIndexedSubscript:", [v5 row]);
    char v11 = [(HKSwitchTableViewCell *)v9 textLabel];
    [v11 setText:v10];
  }
  else
  {
    id v9 = [v7 dequeueReusableCellWithIdentifier:@"DeviceSourceKillSwitch"];

    if (!v9) {
      id v9 = [[HKSwitchTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"DeviceSourceKillSwitch"];
    }
    [(HKSwitchTableViewCell *)v9 setDelegate:self];
    [(HKSwitchTableViewCell *)v9 setOn:self->_deviceEnabled];
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v13 = [v12 localizedStringForKey:@"UPDATE_HEALTH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKSwitchTableViewCell *)v9 setDisplayText:v13];

    [(HKSwitchTableViewCell *)v9 setEnabled:self->_deviceFound];
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && [v6 numberOfSections] - 1 == a4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"INTERNAL ONLY: %@, Legacy Bluetooth device with identifier:%@", self, self->_deviceIdentifier];
  }
  else if (a4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (self->_deviceFound)
    {
      uint64_t v8 = NSString;
      id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v10 = [v9 localizedStringForKey:@"ALLOW_DEVICE_DATA_UPDATES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      char v11 = [(_HKIngestSettingsViewController *)self title];
      uint64_t v7 = objc_msgSend(v8, "stringWithFormat:", v10, v11);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = [v9 localizedStringForKey:@"DEVICE_NOT_PAIRED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    }
  }
  return v7;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataTypeNames, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthServicesManager, 0);
}

@end