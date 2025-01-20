@interface HKBridgeSetupMedicalIDController
- (BOOL)holdBeforeDisplaying;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (HKBridgeSetupMedicalIDController)initWithConfiguration:(id)a3;
- (_HKBridgeSetupConfiguration)configuration;
- (id)_title;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (void)_dismissMedicalID;
- (void)_loadMedicalIDDataFromHealthStore;
- (void)_presentMedicalID;
- (void)_updateHealthProfileInformationFromMedicalIDData;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation HKBridgeSetupMedicalIDController

- (HKBridgeSetupMedicalIDController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKBridgeSetupMedicalIDController;
  v5 = [(HKBridgeSetupMedicalIDController *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(HKBridgeSetupMedicalIDController *)v5 setStyle:2];
    v7 = (_HKBridgeSetupConfiguration *)[v4 copy];
    configuration = v6->_configuration;
    v6->_configuration = v7;

    uint64_t v9 = [(_HKBridgeSetupConfiguration *)v6->_configuration healthStore];
    healthStore = v6->_healthStore;
    v6->_healthStore = (HKHealthStore *)v9;

    uint64_t v11 = [(_HKBridgeSetupConfiguration *)v6->_configuration medicalIDStore];
    medicalIDStore = v6->_medicalIDStore;
    v6->_medicalIDStore = (HKMedicalIDStore *)v11;

    v6->_loadingMedicalIDData = 1;
    [(HKBridgeSetupMedicalIDController *)v6 _loadMedicalIDDataFromHealthStore];
  }

  return v6;
}

- (void)_loadMedicalIDDataFromHealthStore
{
  medicalIDStore = self->_medicalIDStore;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_359C;
  v3[3] = &unk_C3D8;
  v3[4] = self;
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:v3];
}

- (void)_presentMedicalID
{
  v3 = +[_HKBehavior sharedBehavior];
  id v4 = [v3 features];
  unsigned int v5 = [v4 medicalIDV2];

  if (v5)
  {
    v6 = +[MIUIDisplayConfiguration standardConfiguration];
    [v6 setAccessPoint:8];
    [v6 setIsShareDuringEmergencyCallVisible:0];
    [v6 setShouldSaveDataToHealthDetails:1];
    id v12 = [objc_alloc((Class)MIUIMedicalIDViewController) initWithHealthStore:self->_healthStore medicalIDData:self->_medicalIDData displayConfiguration:v6];
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissMedicalID"];
    v8 = [v12 navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  else
  {
    id v12 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:1 inBuddy:0 organDonationSignupAvailable:0];
    [v12 setHealthStore:self->_healthStore];
    [v12 setMedicalIDStore:self->_medicalIDStore];
    [v12 setMedicalID:self->_medicalIDData];
    [v12 setDelegate:self];
    [v12 setShowsDeleteButton:0];
    [v12 setIsSecondaryProfileMedicalID:1];
    [v12 setShowsEmergencyAccessState:0];
  }
  uint64_t v9 = [(HKBridgeSetupMedicalIDController *)self _title];
  [v12 setTitle:v9];

  id v10 = [objc_alloc((Class)HKNavigationController) initWithRootViewController:v12];
  uint64_t v11 = [(HKBridgeSetupMedicalIDController *)self navigationController];
  [v11 presentViewController:v10 animated:1 completion:0];
}

- (void)_dismissMedicalID
{
  [(HKBridgeSetupMedicalIDController *)self dismissViewControllerAnimated:1 completion:0];
  id v3 = [(HKBridgeSetupMedicalIDController *)self miniFlowDelegate];
  [v3 miniFlowStepComplete:self];
}

- (id)_title
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TINKER_MEDICAL_ID_TITLE_%@" value:&stru_C4E8 table:@"Localizable-tinker"];
  unsigned int v5 = [(_HKBridgeSetupConfiguration *)self->_configuration familyMember];
  v6 = [v5 firstName];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return v7;
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v4 = [(HKBridgeSetupMedicalIDController *)self presentedViewController];

  if (v4)
  {
    [(HKBridgeSetupMedicalIDController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v8 = a3;
  id v4 = [(HKBridgeSetupMedicalIDController *)self presentedViewController];

  if (v4) {
    [(HKBridgeSetupMedicalIDController *)self dismissViewControllerAnimated:1 completion:0];
  }
  unsigned int v5 = [v8 medicalID];
  medicalIDData = self->_medicalIDData;
  self->_medicalIDData = v5;

  [(HKBridgeSetupMedicalIDController *)self _updateHealthProfileInformationFromMedicalIDData];
  id v7 = [(HKBridgeSetupMedicalIDController *)self miniFlowDelegate];
  [v7 miniFlowStepComplete:self];
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TINKER_MEDICAL_ID_DETAIL" value:&stru_C4E8 table:@"Localizable-tinker"];
  id v4 = +[NSString stringWithFormat:v3];

  return v4;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TINKER_MEDICAL_ID_SUGGESTED_BUTTON" value:&stru_C4E8 table:@"Localizable-tinker"];

  return v3;
}

- (id)imageResource
{
  return @"MedicalID_BridgeBuddy";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (BOOL)holdBeforeDisplaying
{
  return self->_loadingMedicalIDData;
}

- (void)_updateHealthProfileInformationFromMedicalIDData
{
  p_medicalIDData = &self->_medicalIDData;
  id v4 = [(_HKMedicalIDData *)self->_medicalIDData gregorianBirthday];

  if (v4)
  {
    healthStore = self->_healthStore;
    v6 = [(_HKMedicalIDData *)*p_medicalIDData gregorianBirthday];
    id v29 = 0;
    LOBYTE(healthStore) = [(HKHealthStore *)healthStore _setDateOfBirthComponents:v6 error:&v29];
    id v7 = v29;

    if ((healthStore & 1) == 0)
    {
      _HKInitializeLogging();
      id v8 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_6A80((uint64_t)p_medicalIDData, v8);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v9 = [(_HKMedicalIDData *)*p_medicalIDData weight];

  if (v9)
  {
    id v10 = self->_healthStore;
    uint64_t v11 = [(_HKMedicalIDData *)*p_medicalIDData weight];
    id v28 = v7;
    unsigned __int8 v12 = [(HKHealthStore *)v10 _setBodyMassCharacteristicQuantity:v11 error:&v28];
    id v13 = v28;

    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      objc_super v14 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_69EC((uint64_t)p_medicalIDData, v14);
      }
    }
  }
  else
  {
    id v13 = v7;
  }
  v15 = [(_HKMedicalIDData *)*p_medicalIDData height];

  if (v15)
  {
    v16 = self->_healthStore;
    v17 = [(_HKMedicalIDData *)*p_medicalIDData height];
    id v27 = v13;
    unsigned __int8 v18 = [(HKHealthStore *)v16 _setHeightCharacteristicQuantity:v17 error:&v27];
    id v19 = v27;

    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      v20 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_6958((uint64_t)p_medicalIDData, v20);
      }
    }
  }
  else
  {
    id v19 = v13;
  }
  if ([(_HKMedicalIDData *)*p_medicalIDData bloodType])
  {
    v21 = self->_healthStore;
    id v22 = [(_HKMedicalIDData *)*p_medicalIDData bloodType];
    id v26 = v19;
    unsigned __int8 v23 = [(HKHealthStore *)v21 _setBloodType:v22 error:&v26];
    id v24 = v26;

    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_68D0((uint64_t)p_medicalIDData, v25);
      }
    }
  }
  else
  {
    id v24 = v19;
  }
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (_HKBridgeSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end