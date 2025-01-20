@interface HKSourceAuthorizationFamilyViewController
- (HKClinicalSourceAuthorizationController)clinicalAuthorizationController;
- (HKHealthStore)healthStore;
- (HKSource)source;
- (HKSourceAuthorizationController)healthDataAuthorizationController;
- (HKSourceAuthorizationFamilyViewController)init;
- (HKSourceAuthorizationFamilyViewController)initWithHealthStore:(id)a3 source:(id)a4;
- (HKSourceAuthorizationFamilyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKSourceAuthorizationFamilyViewController)initWithStyle:(int64_t)a3;
- (UIViewController)clinicalAuthorizationSettingsViewController;
- (UIViewController)healthDataAuthorizationSettingsViewController;
- (id)_createFamilyCell;
- (id)_valueStringForAnyCategoryEnabled:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadAuthorizationSettings;
- (void)setClinicalAuthorizationController:(id)a3;
- (void)setClinicalAuthorizationSettingsViewController:(id)a3;
- (void)setHealthDataAuthorizationController:(id)a3;
- (void)setHealthDataAuthorizationSettingsViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKSourceAuthorizationFamilyViewController

- (HKSourceAuthorizationFamilyViewController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithStyle:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithHealthStore:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKSourceAuthorizationFamilyViewController;
  v9 = [(HKTableViewController *)&v16 initWithUsingInsetStyling:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    uint64_t v11 = [v8 copy];
    source = v10->_source;
    v10->_source = (HKSource *)v11;

    v13 = [v8 name];
    v14 = [(HKSourceAuthorizationFamilyViewController *)v10 navigationItem];
    [v14 setTitle:v13];
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKSourceAuthorizationFamilyViewController;
  [(HKSourceAuthorizationFamilyViewController *)&v4 viewWillAppear:a3];
  [(HKSourceAuthorizationFamilyViewController *)self _reloadAuthorizationSettings];
}

- (void)_reloadAuthorizationSettings
{
  v3 = [(HKSourceAuthorizationFamilyViewController *)self clinicalAuthorizationController];
  [v3 reload];

  objc_super v4 = [(HKSourceAuthorizationFamilyViewController *)self healthDataAuthorizationController];
  [v4 reload];

  id v5 = [(HKSourceAuthorizationFamilyViewController *)self tableView];
  [v5 reloadData];
}

- (id)_createFamilyCell
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"_FamilyCellReuseIdentifier"];
  [v2 setAccessoryType:1];
  return v2;
}

- (id)_valueStringForAnyCategoryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = @"AUTHORIZATION_ANY_CATEGORY_ON";
  }
  else {
    uint64_t v6 = @"AUTHORIZATION_ALL_CATEGORIES_OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"_FamilyCellReuseIdentifier"];
  if (!v7)
  {
    id v7 = [(HKSourceAuthorizationFamilyViewController *)self _createFamilyCell];
  }
  uint64_t v8 = [v6 row];
  if (v8 == 1)
  {
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = [v19 localizedStringForKey:@"AUTHORIZATION_NON_CLINICAL_HEALTH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v21 = [v7 textLabel];
    [v21 setText:v20];

    v22 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v23 = *MEMORY[0x1E4F2BDC0];
    v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v24 scale];
    v25 = objc_msgSend(v22, "_applicationIconImageForBundleIdentifier:format:scale:", v23, 0);
    v26 = [v7 imageView];
    [v26 setImage:v25];

    objc_super v16 = [(HKSourceAuthorizationFamilyViewController *)self healthDataAuthorizationController];
    v17 = -[HKSourceAuthorizationFamilyViewController _valueStringForAnyCategoryEnabled:](self, "_valueStringForAnyCategoryEnabled:", [v16 anyTypeEnabled]);
    v18 = [v7 detailTextLabel];
    [v18 setText:v17];
  }
  else
  {
    if (v8) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v10 = [v9 localizedStringForKey:@"AUTHORIZATION_CLINICAL_HEALTH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v11 = [v7 textLabel];
    [v11 setText:v10];

    v12 = [(HKSourceAuthorizationFamilyViewController *)self clinicalAuthorizationController];
    v13 = -[HKSourceAuthorizationFamilyViewController _valueStringForAnyCategoryEnabled:](self, "_valueStringForAnyCategoryEnabled:", [v12 anyTypeEnabled]);
    v14 = [v7 detailTextLabel];
    [v14 setText:v13];

    v15 = (void *)MEMORY[0x1E4FB1818];
    objc_super v16 = HKHealthUIFrameworkBundle();
    v17 = [v15 imageNamed:@"health_records_category" inBundle:v16];
    v18 = [v7 imageView];
    [v18 setImage:v17];
  }

LABEL_8:
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  if (v7 == 1)
  {
    uint64_t v8 = [(HKSourceAuthorizationFamilyViewController *)self healthDataAuthorizationSettingsViewController];
    goto LABEL_5;
  }
  if (!v7)
  {
    uint64_t v8 = [(HKSourceAuthorizationFamilyViewController *)self clinicalAuthorizationSettingsViewController];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  v10 = [v15 cellForRowAtIndexPath:v6];
  uint64_t v11 = [v10 textLabel];
  v12 = [v11 text];
  v13 = [v9 navigationItem];
  [v13 setTitle:v12];

  v14 = [(HKSourceAuthorizationFamilyViewController *)self navigationController];
  [v14 pushViewController:v9 animated:1];
}

- (HKSource)source
{
  return self->_source;
}

- (HKClinicalSourceAuthorizationController)clinicalAuthorizationController
{
  return self->_clinicalAuthorizationController;
}

- (void)setClinicalAuthorizationController:(id)a3
{
}

- (HKSourceAuthorizationController)healthDataAuthorizationController
{
  return self->_healthDataAuthorizationController;
}

- (void)setHealthDataAuthorizationController:(id)a3
{
}

- (UIViewController)clinicalAuthorizationSettingsViewController
{
  return self->_clinicalAuthorizationSettingsViewController;
}

- (void)setClinicalAuthorizationSettingsViewController:(id)a3
{
}

- (UIViewController)healthDataAuthorizationSettingsViewController
{
  return self->_healthDataAuthorizationSettingsViewController;
}

- (void)setHealthDataAuthorizationSettingsViewController:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_healthDataAuthorizationSettingsViewController, 0);
  objc_storeStrong((id *)&self->_clinicalAuthorizationSettingsViewController, 0);
  objc_storeStrong((id *)&self->_healthDataAuthorizationController, 0);
  objc_storeStrong((id *)&self->_clinicalAuthorizationController, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end