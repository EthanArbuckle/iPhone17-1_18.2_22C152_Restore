@interface NPTOBridgeAmountChooser
- (BOOL)canBeShownFromSuspendedState;
- (NPTOBridgeAmountChooser)init;
- (PSController)parentController;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (id)_device;
- (id)_preferencesAccessor;
- (id)readPreferenceValue:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_syncedAmount;
- (void)_setSyncedAmount:(unint64_t)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)pushController:(id)a3;
- (void)pushController:(id)a3 animate:(BOOL)a4;
- (void)setParentController:(id)a3;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation NPTOBridgeAmountChooser

- (NPTOBridgeAmountChooser)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPTOBridgeAmountChooser;
  v2 = [(NPTOBridgeAmountChooser *)&v6 initWithStyle:2];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"AMOUNT_SPECIFIER_TITLE" value:&stru_C4F0 table:@"NanoPhotosBridgeSettings"];
    [(NPTOBridgeAmountChooser *)v2 setTitle:v4];
  }
  return v2;
}

- (unint64_t)_syncedAmount
{
  v2 = [(NPTOBridgeAmountChooser *)self _preferencesAccessor];
  id v3 = objc_msgSend(v2, "npto_syncedPhotosLimit");

  return (unint64_t)v3;
}

- (void)_setSyncedAmount:(unint64_t)a3
{
  id v5 = [(NPTOBridgeAmountChooser *)self _preferencesAccessor];
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:NPTOPreferencesSyncedPhotosLimitKey];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"A"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"A"];
  }
  v8 = (void *)qword_8B60[(void)[v6 row]];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"AMOUNT_COUNT" value:&stru_C4F0 table:@"NanoPhotosBridgeSettings"];
  v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8);
  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = +[UIColor whiteColor];
  v14 = [v7 textLabel];
  [v14 setColor:v13];

  v15 = +[PSListController appearance];
  v16 = [v15 cellHighlightColor];

  if (v16)
  {
    id v17 = objc_alloc_init((Class)UIView);
    [v17 setBackgroundColor:v16];
    [v7 setSelectedBackgroundView:v17];
  }
  v18 = BPSBridgeTintColor();
  [v7 setTintColor:v18];

  if ((void *)[(NPTOBridgeAmountChooser *)self _syncedAmount] == v8) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [v7 setAccessoryType:v19];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = qword_8B60[(void)[v7 row]];
  v9 = [v6 cellForRowAtIndexPath:v7];
  [v9 setAccessoryType:3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = objc_msgSend(v6, "visibleCells", 0);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v14);
        if (v15 != v9) {
          [v15 setAccessoryType:0];
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(NPTOBridgeAmountChooser *)self _setSyncedAmount:v8];
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
}

- (void)pushController:(id)a3
{
}

- (void)pushController:(id)a3 animate:(BOOL)a4
{
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return 0;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)_preferencesAccessor
{
  preferencesAccessor = self->_preferencesAccessor;
  if (!preferencesAccessor)
  {
    id v4 = objc_alloc((Class)NPTOPreferencesAccessor);
    id v5 = [(NPTOBridgeAmountChooser *)self _device];
    id v6 = (NPTOPreferencesAccessor *)[v4 initWithDevice:v5];
    id v7 = self->_preferencesAccessor;
    self->_preferencesAccessor = v6;

    preferencesAccessor = self->_preferencesAccessor;
  }

  return preferencesAccessor;
}

- (id)_device
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  return v5;
}

- (PSController)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (PSController *)a3;
}

- (PSRootController)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
  self->_rootController = (PSRootController *)a3;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_preferencesAccessor, 0);
}

@end