@interface WDLocalDeviceStoredDataViewController
- (BOOL)_shouldDisplayPrivacySection;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WDLocalDeviceStoredDataViewController

- (BOOL)_shouldDisplayPrivacySection
{
  v2 = [(WDStoredDataByCategoryViewController *)self profile];
  v3 = [v2 healthStore];
  v4 = [v3 profileIdentifier];
  BOOL v5 = [v4 type] != 3;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WDLocalDeviceStoredDataViewController;
  id v4 = [(WDStoredDataByCategoryViewController *)&v6 numberOfSectionsInTableView:a3];
  return (int64_t)v4
       + [(WDLocalDeviceStoredDataViewController *)self _shouldDisplayPrivacySection];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(WDLocalDeviceStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    if (!a4)
    {
      int64_t v8 = 1;
      goto LABEL_7;
    }
    id v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v10, sel_tableView_numberOfRowsInSection_, v6, a4 - 1, self, WDLocalDeviceStoredDataViewController, v11.receiver, v11.super_class);
  }
  else
  {
    id v7 = -[WDStoredDataByCategoryViewController tableView:numberOfRowsInSection:](&v11, sel_tableView_numberOfRowsInSection_, v6, a4, v10.receiver, v10.super_class, self, WDLocalDeviceStoredDataViewController);
  }
  int64_t v8 = (int64_t)v7;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WDLocalDeviceStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    int64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
    -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, v6, v8, v19.receiver, v19.super_class, self, WDLocalDeviceStoredDataViewController);
    goto LABEL_5;
  }
  if ([v7 section])
  {
    int64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);
    -[WDStoredDataByCategoryViewController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, v6, v8, self, WDLocalDeviceStoredDataViewController, v20.receiver, v20.super_class);
    v9 = LABEL_5:;

    goto LABEL_6;
  }
  v9 = [v6 dequeueReusableCellWithIdentifier:@"WDLocalDeviceStoredDataViewControllerCellIdentifier"];
  if (!v9) {
    v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDLocalDeviceStoredDataViewControllerCellIdentifier"];
  }
  objc_super v11 = WDBundle();
  v12 = [v11 localizedStringForKey:@"PRIVACY_SETTINGS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v13 = [v9 textLabel];
  [v13 setText:v12];

  v14 = [(WDLocalDeviceStoredDataViewController *)self view];
  v15 = [v14 tintColor];
  v16 = [v9 textLabel];
  [v16 setTextColor:v15];

  v17 = [(WDStoredDataByCategoryViewController *)self bodyFont];
  v18 = [v9 textLabel];
  [v18 setFont:v17];

LABEL_6:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(WDLocalDeviceStoredDataViewController *)self _shouldDisplayPrivacySection])
  {
    if (!a4) {
      goto LABEL_6;
    }
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v8, sel_tableView_titleForHeaderInSection_, v6, a4 - 1, self, WDLocalDeviceStoredDataViewController, v9.receiver, v9.super_class);
  }
  else
  {
    -[WDStoredDataByCategoryViewController tableView:titleForHeaderInSection:](&v9, sel_tableView_titleForHeaderInSection_, v6, a4, v8.receiver, v8.super_class, self, WDLocalDeviceStoredDataViewController);
  a4 = };
LABEL_6:

  return (id)a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 cellForRowAtIndexPath:v7];
  objc_super v9 = [v8 reuseIdentifier];
  int v10 = [v9 isEqualToString:@"WDLocalDeviceStoredDataViewControllerCellIdentifier"];

  if (v10)
  {
    objc_super v11 = [MEMORY[0x263F01880] defaultWorkspace];
    v12 = [NSURL URLWithString:@"prefs:root=Privacy"];
    [v11 openSensitiveURL:v12 withOptions:0];

    [v8 setSelected:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WDLocalDeviceStoredDataViewController;
    [(WDStoredDataByCategoryViewController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

@end