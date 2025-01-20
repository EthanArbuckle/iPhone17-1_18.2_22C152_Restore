@interface CharacteristicTypeDetailViewController
- (CharacteristicTypeDetailViewController)initWithCoder:(id)a3;
- (CharacteristicTypeDetailViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 identifier:(int64_t)a5 firstName:(id)a6 lastName:(id)a7;
- (CharacteristicTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CharacteristicTypeDetailViewControllerDelegate)delegate;
- (id)getBiologicalSex:(id)a3;
- (id)getBloodType:(id)a3;
- (id)getFirstName:(id)a3;
- (id)getFitzpatrickSkinType:(id)a3;
- (id)getLastName:(id)a3;
- (id)getWheelchairUse:(id)a3;
- (id)specifierForBiologicalSex;
- (id)specifierForBloodType;
- (id)specifierForFirstName;
- (id)specifierForFitzpatrickSkinType;
- (id)specifierForLastName;
- (id)specifierForWheelchairUse;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5;
- (void)didUpdateName;
- (void)setBiologicalSex:(id)a3 specifier:(id)a4;
- (void)setBloodType:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFirstName:(id)a3 specifier:(id)a4;
- (void)setFitzpatrickSkinType:(id)a3 specifier:(id)a4;
- (void)setLastName:(id)a3 specifier:(id)a4;
- (void)setWheelchairUse:(id)a3 specifier:(id)a4;
@end

@implementation CharacteristicTypeDetailViewController

- (CharacteristicTypeDetailViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 identifier:(int64_t)a5 firstName:(id)a6 lastName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CharacteristicTypeDetailViewController;
  v17 = [(CharacteristicTypeDetailViewController *)&v25 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_healthStore, a3);
    objc_storeStrong((id *)&v18->_characteristicType, a4);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F678C0]) initWithHealthStore:v13];
    userDefaults = v18->_userDefaults;
    v18->_userDefaults = (WDUserDefaults *)v19;

    v18->_specifierID = a5;
    objc_storeStrong((id *)&v18->_firstName, a6);
    objc_storeStrong((id *)&v18->_lastName, a7);
  }
  v21 = [(CharacteristicTypeDetailViewController *)v18 title];
  v22 = [(CharacteristicTypeDetailViewController *)v18 navigationItem];
  [v22 setTitle:v21];

  v23 = [(CharacteristicTypeDetailViewController *)v18 navigationItem];
  [v23 setStyle:0];

  return v18;
}

- (CharacteristicTypeDetailViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CharacteristicTypeDetailViewController;
  return [(CharacteristicTypeDetailViewController *)&v4 initWithCoder:a3];
}

- (CharacteristicTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    switch(self->_specifierID)
    {
      case 1:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForFirstName];
        goto LABEL_9;
      case 2:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForLastName];
        goto LABEL_9;
      case 3:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForBiologicalSex];
        goto LABEL_9;
      case 4:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForBloodType];
        goto LABEL_9;
      case 5:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForFitzpatrickSkinType];
        goto LABEL_9;
      case 6:
        uint64_t v6 = [(CharacteristicTypeDetailViewController *)self specifierForWheelchairUse];
LABEL_9:
        v7 = (void *)v6;
        [v5 addObject:v6];

        break;
      default:
        break;
    }
    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)specifierForFirstName
{
  v2 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F04402E8 target:self set:sel_setFirstName_specifier_ get:sel_getFirstName_ detail:0 cell:8 edit:0];
  [v2 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93128]];
  return v2;
}

- (id)specifierForLastName
{
  v2 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F04402E8 target:self set:sel_setLastName_specifier_ get:sel_getLastName_ detail:0 cell:8 edit:0];
  [v2 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93128]];
  return v2;
}

- (id)specifierForBiologicalSex
{
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = HKHealthKitFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"BIOLOGICAL_SEX" value:&stru_1F04402E8 table:*MEMORY[0x1E4F29E40]];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setBiologicalSex_specifier_ get:sel_getBiologicalSex_ detail:objc_opt_class() cell:2 edit:0];

  v7 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
    [v7 addObject:v9];
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t j = 0; j != 4; ++j)
  {
    v12 = [(CharacteristicTypeDetailViewController *)self delegate];
    id v13 = [v12 _displayStringForBiologicalSex:j];

    [v10 addObject:v13];
  }
  [v6 setValues:v7 titles:v10];

  return v6;
}

- (id)specifierForBloodType
{
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = HKHealthKitFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"BLOOD_TYPE" value:&stru_1F04402E8 table:*MEMORY[0x1E4F29E40]];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setBloodType_specifier_ get:sel_getBloodType_ detail:objc_opt_class() cell:2 edit:0];

  v7 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 9; ++i)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
    [v7 addObject:v9];
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t j = 0; j != 9; ++j)
  {
    v12 = [(CharacteristicTypeDetailViewController *)self delegate];
    id v13 = [v12 _displayStringForBloodType:j];

    [v10 addObject:v13];
  }
  [v6 setValues:v7 titles:v10];

  return v6;
}

- (id)specifierForFitzpatrickSkinType
{
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = HKHealthKitFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"FITZPATRICK_SKIN_TYPE" value:&stru_1F04402E8 table:*MEMORY[0x1E4F29E40]];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setFitzpatrickSkinType_specifier_ get:sel_getFitzpatrickSkinType_ detail:objc_opt_class() cell:2 edit:0];

  v7 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 7; ++i)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
    [v7 addObject:v9];
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t j = 0; j != 7; ++j)
  {
    v12 = [(CharacteristicTypeDetailViewController *)self delegate];
    id v13 = [v12 _displayStringForFitzpatrickSkinType:j];

    [v10 addObject:v13];
  }
  [v6 setValues:v7 titles:v10];

  return v6;
}

- (id)specifierForWheelchairUse
{
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  objc_super v4 = HKHealthKitFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"WHEELCHAIR_USE" value:&stru_1F04402E8 table:*MEMORY[0x1E4F29E40]];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setWheelchairUse_specifier_ get:sel_getWheelchairUse_ detail:objc_opt_class() cell:2 edit:0];

  v7 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
    [v7 addObject:v9];
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t j = 0; j != 3; ++j)
  {
    v12 = [(CharacteristicTypeDetailViewController *)self delegate];
    id v13 = [v12 _displayStringForWheelchairUse:j];

    [v10 addObject:v13];
  }
  [v6 setValues:v7 titles:v10];

  return v6;
}

- (void)setFirstName:(id)a3 specifier:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = &stru_1F04402E8;
  }
  lastName = self->_lastName;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke;
  v15[3] = &unk_1E5E7CD40;
  if (lastName) {
    v10 = (__CFString *)lastName;
  }
  else {
    v10 = &stru_1F04402E8;
  }
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  v12 = v6;
  id v13 = v10;
  id v14 = v8;
  [(CharacteristicTypeDetailViewController *)self _updateFirstName:v14 lastName:v13 completion:v15];
}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2;
  block[3] = &unk_1E5E7CD18;
  char v12 = a2;
  uint64_t v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v5;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (a2) {
    [*(id *)(a1 + 32) didUpdateName];
  }
}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = *(void **)(a1 + 40);
    uint64_t v3 = (id *)(*(void *)(a1 + 32) + 1416);
    objc_storeStrong(v3, v2);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1();
    }
    [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 56)];
  }
}

- (id)getFirstName:(id)a3
{
  return self->_firstName;
}

- (void)setLastName:(id)a3 specifier:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  if (self->_firstName) {
    firstName = (__CFString *)self->_firstName;
  }
  else {
    firstName = &stru_1F04402E8;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke;
  v14[3] = &unk_1E5E7CD40;
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &stru_1F04402E8;
  }
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  char v12 = v9;
  id v13 = firstName;
  [(CharacteristicTypeDetailViewController *)self _updateFirstName:v13 lastName:v12 completion:v14];
}

void __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke_2;
  block[3] = &unk_1E5E7CD18;
  char v12 = a2;
  uint64_t v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v5;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (a2) {
    [*(id *)(a1 + 32) didUpdateName];
  }
}

void __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = *(void **)(a1 + 40);
    uint64_t v3 = (id *)(*(void *)(a1 + 32) + 1424);
    objc_storeStrong(v3, v2);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1();
    }
    [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 56)];
  }
}

- (id)getLastName:(id)a3
{
  return self->_lastName;
}

- (void)setBiologicalSex:(id)a3 specifier:(id)a4
{
  healthStore = self->_healthStore;
  id v13 = 0;
  int v6 = -[HKHealthStore _setBiologicalSex:error:](healthStore, "_setBiologicalSex:error:", [a3 integerValue], &v13);
  id v7 = v13;
  if (v6)
  {
    v8 = self->_healthStore;
    id v12 = v7;
    id v9 = [(HKHealthStore *)v8 biologicalSexWithError:&v12];
    id v10 = v12;

    biologicalSexObject = self->_biologicalSexObject;
    self->_biologicalSexObject = v9;

    id v7 = v10;
  }
}

- (id)getBiologicalSex:(id)a3
{
  healthStore = self->_healthStore;
  id v12 = 0;
  id v5 = [(HKHealthStore *)healthStore biologicalSexWithError:&v12];
  id v6 = v12;
  biologicalSexObject = self->_biologicalSexObject;
  self->_biologicalSexObject = v5;

  v8 = (void *)MEMORY[0x1E4F28ED0];
  HKBiologicalSex v9 = [(HKBiologicalSexObject *)self->_biologicalSexObject biologicalSex];

  id v10 = [v8 numberWithInteger:v9];
  return v10;
}

- (void)setBloodType:(id)a3 specifier:(id)a4
{
  healthStore = self->_healthStore;
  id v13 = 0;
  int v6 = -[HKHealthStore _setBloodType:error:](healthStore, "_setBloodType:error:", [a3 integerValue], &v13);
  id v7 = v13;
  if (v6)
  {
    v8 = self->_healthStore;
    id v12 = v7;
    HKBiologicalSex v9 = [(HKHealthStore *)v8 bloodTypeWithError:&v12];
    id v10 = v12;

    bloodTypeObject = self->_bloodTypeObject;
    self->_bloodTypeObject = v9;

    id v7 = v10;
  }
}

- (id)getBloodType:(id)a3
{
  healthStore = self->_healthStore;
  id v12 = 0;
  id v5 = [(HKHealthStore *)healthStore bloodTypeWithError:&v12];
  id v6 = v12;
  bloodTypeObject = self->_bloodTypeObject;
  self->_bloodTypeObject = v5;

  v8 = (void *)MEMORY[0x1E4F28ED0];
  HKBloodType v9 = [(HKBloodTypeObject *)self->_bloodTypeObject bloodType];

  id v10 = [v8 numberWithInteger:v9];
  return v10;
}

- (void)setFitzpatrickSkinType:(id)a3 specifier:(id)a4
{
  healthStore = self->_healthStore;
  id v14 = 0;
  int v6 = -[HKHealthStore _setFitzpatrickSkinType:error:](healthStore, "_setFitzpatrickSkinType:error:", [a3 integerValue], &v14);
  id v7 = v14;
  if (v6)
  {
    v8 = self->_healthStore;
    id v13 = v7;
    HKBloodType v9 = [(HKHealthStore *)v8 fitzpatrickSkinTypeWithError:&v13];
    id v10 = v13;

    fitzpatrickSkinTypeObject = self->_fitzpatrickSkinTypeObject;
    self->_fitzpatrickSkinTypeObject = v9;

    id v7 = v10;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[CharacteristicTypeDetailViewController setFitzpatrickSkinType:specifier:]((uint64_t)v7, v12);
    }
  }
}

- (id)getFitzpatrickSkinType:(id)a3
{
  healthStore = self->_healthStore;
  id v12 = 0;
  id v5 = [(HKHealthStore *)healthStore fitzpatrickSkinTypeWithError:&v12];
  id v6 = v12;
  fitzpatrickSkinTypeObject = self->_fitzpatrickSkinTypeObject;
  self->_fitzpatrickSkinTypeObject = v5;

  v8 = (void *)MEMORY[0x1E4F28ED0];
  HKFitzpatrickSkinType v9 = [(HKFitzpatrickSkinTypeObject *)self->_fitzpatrickSkinTypeObject skinType];

  id v10 = [v8 numberWithInteger:v9];
  return v10;
}

- (void)setWheelchairUse:(id)a3 specifier:(id)a4
{
  healthStore = self->_healthStore;
  id v14 = 0;
  int v6 = -[HKHealthStore _setWheelchairUse:error:](healthStore, "_setWheelchairUse:error:", [a3 integerValue], &v14);
  id v7 = v14;
  if (v6)
  {
    v8 = self->_healthStore;
    id v13 = v7;
    HKFitzpatrickSkinType v9 = [(HKHealthStore *)v8 wheelchairUseWithError:&v13];
    id v10 = v13;

    wheelchairUseObject = self->_wheelchairUseObject;
    self->_wheelchairUseObject = v9;

    id v7 = v10;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[CharacteristicTypeDetailViewController setWheelchairUse:specifier:]((uint64_t)v7, v12);
    }
  }
}

- (id)getWheelchairUse:(id)a3
{
  healthStore = self->_healthStore;
  id v12 = 0;
  id v5 = [(HKHealthStore *)healthStore wheelchairUseWithError:&v12];
  id v6 = v12;
  wheelchairUseObject = self->_wheelchairUseObject;
  self->_wheelchairUseObject = v5;

  v8 = (void *)MEMORY[0x1E4F28ED0];
  HKWheelchairUse v9 = [(HKWheelchairUseObject *)self->_wheelchairUseObject wheelchairUse];

  id v10 = [v8 numberWithInteger:v9];
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CharacteristicTypeDetailViewController;
  objc_super v4 = [(CharacteristicTypeDetailViewController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == 8)
  {
    id v5 = [v4 editableTextField];
    [v5 setAutocapitalizationType:2];
    [v5 setAutocorrectionType:1];
    [v5 setAdjustsFontSizeToFitWidth:1];
    [v5 setTextAlignment:4];
    [v5 setReturnKeyType:9];
    [v5 setClearButtonMode:3];
  }
  return v4;
}

- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  healthStore = self->_healthStore;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(HKHealthStore *)healthStore profileIdentifier];
  uint64_t v13 = [v12 type];

  if (v13 == 1)
  {
    uint64_t v14 = *MEMORY[0x1E4F2BFA0];
    v17[0] = *MEMORY[0x1E4F2BF98];
    v17[1] = v14;
    v18[0] = v11;
    v18[1] = v10;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    [(WDUserDefaults *)self->_userDefaults setValue:v15 forKey:*MEMORY[0x1E4F2BFB0] completion:v9];
  }
  else
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F2B360]) initWithHealthStore:self->_healthStore];
    [v16 setDisplayFirstName:v11 lastName:v10 completion:v9];
  }
}

- (void)didUpdateName
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4F2BFA8] object:0];
}

- (CharacteristicTypeDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CharacteristicTypeDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeObject, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1AD1A4000, v0, OS_LOG_TYPE_ERROR, "Error setting name to %@: %{public}@", v1, 0x16u);
}

- (void)setFitzpatrickSkinType:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD1A4000, a2, OS_LOG_TYPE_ERROR, "Error setting Fitzpatrick skin type: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setWheelchairUse:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD1A4000, a2, OS_LOG_TYPE_ERROR, "Error setting wheelchair use: %@", (uint8_t *)&v2, 0xCu);
}

@end