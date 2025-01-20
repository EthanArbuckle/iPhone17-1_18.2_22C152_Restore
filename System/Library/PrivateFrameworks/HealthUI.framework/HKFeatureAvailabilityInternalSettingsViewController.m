@interface HKFeatureAvailabilityInternalSettingsViewController
- (BOOL)_disabledOverriden;
- (BOOL)_featureEnabled;
- (BOOL)isDeletingSamples;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKFeatureAvailabilityInternalSettingsConfiguration)configuration;
- (HKFeatureAvailabilityInternalSettingsViewController)initWithHealthStore:(id)a3 configuration:(id)a4;
- (HKHealthStore)healthStore;
- (NPSManager)syncManager;
- (NSUserDefaults)userDefaults;
- (id)_buttonCellForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)_offsetSectionForSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_disableOverride:(BOOL)a3;
- (void)_enableFeature:(BOOL)a3;
- (void)setDeletingSamples:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HKFeatureAvailabilityInternalSettingsViewController

- (HKFeatureAvailabilityInternalSettingsViewController)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKFeatureAvailabilityInternalSettingsViewController;
  v9 = [(HKFeatureAvailabilityInternalSettingsViewController *)&v18 initWithStyle:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    if ([v8 showFeatureEnable])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CB18]);
      v12 = [v8 userDefaultsDomain];
      uint64_t v13 = [v11 initWithSuiteName:v12];
      userDefaults = v10->_userDefaults;
      v10->_userDefaults = (NSUserDefaults *)v13;
    }
    if ([v8 syncToWatch])
    {
      v15 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
      syncManager = v10->_syncManager;
      v10->_syncManager = v15;
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityInternalSettingsViewController;
  [(HKTableViewController *)&v3 viewDidLoad];
  [(HKFeatureAvailabilityInternalSettingsViewController *)self setTitle:@"Internal Settings"];
}

- (int64_t)_offsetSectionForSection:(int64_t)a3
{
  v4 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  int64_t v5 = ([v4 showFeatureEnable] ^ 1) + a3;

  return v5;
}

- (BOOL)_featureEnabled
{
  objc_super v3 = [(HKFeatureAvailabilityInternalSettingsViewController *)self userDefaults];
  v4 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  int64_t v5 = [v4 userDefaultsFeatureEnabledKey];
  char v6 = [v3 BOOLForKey:v5];

  return v6;
}

- (void)_enableFeature:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  char v6 = [v5 userDefaultsDomain];
  id v7 = objc_msgSend(v6, "hk_copyNonEmptyString");

  if (v7)
  {
    id v8 = [(HKFeatureAvailabilityInternalSettingsViewController *)self userDefaults];
    v9 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    v10 = [v9 userDefaultsFeatureEnabledKey];
    [v8 setBool:v3 forKey:v10];

    id v17 = [(HKFeatureAvailabilityInternalSettingsViewController *)self syncManager];
    id v11 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    v12 = [v11 userDefaultsDomain];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    v15 = [v14 userDefaultsFeatureEnabledKey];
    v16 = [v13 setWithObject:v15];
    [v17 synchronizeUserDefaultsDomain:v12 keys:v16];
  }
}

- (BOOL)_disabledOverriden
{
  BOOL v3 = [(HKFeatureAvailabilityInternalSettingsViewController *)self userDefaults];
  v4 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  int64_t v5 = [v4 userDefaultsDisabledOverrideKey];
  char v6 = [v3 BOOLForKey:v5];

  return v6;
}

- (void)_disableOverride:(BOOL)a3
{
  BOOL v3 = a3;
  id v19 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  int64_t v5 = [v19 userDefaultsDomain];
  uint64_t v6 = objc_msgSend(v5, "hk_copyNonEmptyString");
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    v9 = [v8 userDefaultsDisabledOverrideKey];
    v10 = objc_msgSend(v9, "hk_copyNonEmptyString");

    if (!v10) {
      return;
    }
    id v11 = [(HKFeatureAvailabilityInternalSettingsViewController *)self userDefaults];
    v12 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    uint64_t v13 = [v12 userDefaultsDisabledOverrideKey];
    [v11 setBool:v3 forKey:v13];

    id v19 = [(HKFeatureAvailabilityInternalSettingsViewController *)self syncManager];
    int64_t v5 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    v14 = [v5 userDefaultsDomain];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    id v17 = [v16 userDefaultsDisabledOverrideKey];
    objc_super v18 = [v15 setWithObject:v17];
    [v19 synchronizeUserDefaultsDomain:v14 keys:v18];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
  if ([v3 showFeatureEnable]) {
    int64_t v4 = 4;
  }
  else {
    int64_t v4 = 3;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (unint64_t)[(HKFeatureAvailabilityInternalSettingsViewController *)self _offsetSectionForSection:a4] < 4;
}

- (id)_buttonCellForTableView:(id)a3
{
  BOOL v3 = [a3 dequeueReusableCellWithIdentifier:@"ButtonCell"];
  if (!v3)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"ButtonCell"];
    int64_t v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
    int64_t v5 = [v3 textLabel];
    [v5 setTextColor:v4];
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  switch(-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", [a4 section]))
  {
    case 0:
      BOOL v7 = [(HKFeatureAvailabilityInternalSettingsViewController *)self _featureEnabled];
      self = [(HKFeatureAvailabilityInternalSettingsViewController *)self _buttonCellForTableView:v6];
      id v8 = [(HKFeatureAvailabilityInternalSettingsViewController *)self textLabel];
      if (v7) {
        v9 = @"Disable Feature";
      }
      else {
        v9 = @"Enable Feature";
      }
      goto LABEL_10;
    case 1:
      self = [(HKFeatureAvailabilityInternalSettingsViewController *)self _buttonCellForTableView:v6];
      v10 = [(HKFeatureAvailabilityInternalSettingsViewController *)self textLabel];
      id v8 = v10;
      v9 = @"Delete All Samples";
      goto LABEL_11;
    case 2:
      self = [(HKFeatureAvailabilityInternalSettingsViewController *)self _buttonCellForTableView:v6];
      v10 = [(HKFeatureAvailabilityInternalSettingsViewController *)self textLabel];
      id v8 = v10;
      v9 = @"Reset Onboarding";
      goto LABEL_11;
    case 3:
      BOOL v11 = [(HKFeatureAvailabilityInternalSettingsViewController *)self _disabledOverriden];
      self = [(HKFeatureAvailabilityInternalSettingsViewController *)self _buttonCellForTableView:v6];
      id v8 = [(HKFeatureAvailabilityInternalSettingsViewController *)self textLabel];
      if (v11) {
        v9 = @"Remove Override For Remote Disabled";
      }
      else {
        v9 = @"Override Remote Disabled";
      }
LABEL_10:
      v10 = v8;
LABEL_11:
      [v10 setText:v9];

      break;
    default:
      break;
  }

  return self;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", a4)|| (-[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration"), int64_t v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 requireReboot], v5, !v6))
  {
    v10 = 0;
  }
  else
  {
    BOOL v7 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
    int v8 = [v7 syncToWatch];
    v9 = @"Toggling feature status requires you to reboot your device.";
    if (v8) {
      v9 = @"Toggling feature status requires you to reboot your iPhone and Apple Watch.";
    }
    v10 = v9;
  }
  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  int64_t v5 = -[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", objc_msgSend(a4, "section", a3));
  if ((unint64_t)(v5 - 2) < 2 || v5 == 0) {
    return 1;
  }
  if (v5 == 1) {
    return ![(HKFeatureAvailabilityInternalSettingsViewController *)self isDeletingSamples];
  }
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (([a3 isEditing] & 1) == 0)
  {
    switch(-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", [v6 section]))
    {
      case 0:
        [(HKFeatureAvailabilityInternalSettingsViewController *)self _enableFeature:[(HKFeatureAvailabilityInternalSettingsViewController *)self _featureEnabled] ^ 1];
        BOOL v7 = [(HKFeatureAvailabilityInternalSettingsViewController *)self tableView];
        int v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
        [v7 reloadSections:v8 withRowAnimation:0];

        v9 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
        LODWORD(v8) = [v9 requireReboot];

        if (v8)
        {
          v10 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
          int v11 = [v10 syncToWatch];
          v12 = @"You need to reboot your device in order for this change to take effect.";
          if (v11) {
            v12 = @"You need to reboot your iPhone and Apple Watch in order for this change to take effect.";
          }
          uint64_t v13 = v12;

          v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Reboot Required" message:v13 preferredStyle:1];

          v15 = (void *)MEMORY[0x1E4FB1410];
          v16 = @"Ok";
          uint64_t v17 = 0;
          objc_super v18 = 0;
          goto LABEL_11;
        }
        break;
      case 1:
        v27 = [(HKFeatureAvailabilityInternalSettingsViewController *)self tableView];
        [v27 deselectRowAtIndexPath:v6 animated:1];

        if (![(HKFeatureAvailabilityInternalSettingsViewController *)self isDeletingSamples])
        {
          [(HKFeatureAvailabilityInternalSettingsViewController *)self setDeletingSamples:1];
          v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Delete All Samples" preferredStyle:0];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v32[3] = &unk_1E6D51928;
          v32[4] = self;
          v28 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Delete All" style:2 handler:v32];
          [v14 addAction:v28];

          v15 = (void *)MEMORY[0x1E4FB1410];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
          v31[3] = &unk_1E6D51928;
          v31[4] = self;
          v16 = @"Cancel";
          objc_super v18 = v31;
          uint64_t v17 = 1;
LABEL_11:
          v29 = [v15 actionWithTitle:v16 style:v17 handler:v18];
          [v14 addAction:v29];

          [(HKFeatureAvailabilityInternalSettingsViewController *)self presentViewController:v14 animated:1 completion:0];
          goto LABEL_12;
        }
        break;
      case 2:
        id v19 = [(HKFeatureAvailabilityInternalSettingsViewController *)self tableView];
        [v19 deselectRowAtIndexPath:v6 animated:1];

        v20 = (void *)MEMORY[0x1E4FB1418];
        v21 = [(HKFeatureAvailabilityInternalSettingsViewController *)self configuration];
        v22 = [v21 featureIdentifier];
        v14 = [v20 alertControllerWithTitle:v22 message:@"Reset onboarding state?" preferredStyle:1];

        v23 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:&__block_literal_global_24];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_7;
        v30[3] = &unk_1E6D51928;
        v30[4] = self;
        v24 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Reset" style:2 handler:v30];
        [v14 addAction:v24];
        [v14 addAction:v23];
        [(HKFeatureAvailabilityInternalSettingsViewController *)self presentViewController:v14 animated:1 completion:0];

LABEL_12:
        break;
      case 3:
        [(HKFeatureAvailabilityInternalSettingsViewController *)self _disableOverride:[(HKFeatureAvailabilityInternalSettingsViewController *)self _disabledOverriden] ^ 1];
        v25 = [(HKFeatureAvailabilityInternalSettingsViewController *)self tableView];
        v26 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v6, "section"));
        [v25 reloadSections:v26 withRowAnimation:0];

        break;
      default:
        break;
    }
  }
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) healthStore];
  BOOL v3 = [*(id *)(a1 + 32) configuration];
  int64_t v4 = [v3 samplesTypesToDelete];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E6D512C8;
  v5[4] = *(void *)(a1 + 32);
  [v2 deleteAllSamplesWithTypes:v4 sourceBundleIdentifier:0 options:2 completion:v5];
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeletingSamples:0];
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeletingSamples:0];
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_7(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F2B040]);
  BOOL v3 = [*(id *)(a1 + 32) configuration];
  int64_t v4 = [v3 featureIdentifier];
  int64_t v5 = [*(id *)(a1 + 32) healthStore];
  id v6 = (id)[v2 initWithFeatureIdentifier:v4 healthStore:v5];

  [v6 resetOnboardingWithCompletion:&__block_literal_global_394];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKFeatureAvailabilityInternalSettingsConfiguration)configuration
{
  return self->_configuration;
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)isDeletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end