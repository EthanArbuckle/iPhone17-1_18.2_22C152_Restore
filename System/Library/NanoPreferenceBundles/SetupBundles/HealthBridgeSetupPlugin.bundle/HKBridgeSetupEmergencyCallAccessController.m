@interface HKBridgeSetupEmergencyCallAccessController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (HKBridgeSetupEmergencyCallAccessController)init;
- (HKBridgeSetupEmergencyCallAccessController)initWithConfiguration:(id)a3;
- (_HKBridgeSetupConfiguration)configuration;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)learnMoreButtonTitle;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)termsOfAddress;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)completeMiniFlowStep;
- (void)learnMoreButtonPressed:(id)a3;
- (void)okayButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateMedicalIDShareDuringEmergency:(BOOL)a3;
- (void)updateMedicalIDShareDuringEmergencyInSkippedPane:(BOOL)a3;
@end

@implementation HKBridgeSetupEmergencyCallAccessController

- (HKBridgeSetupEmergencyCallAccessController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HKBridgeSetupEmergencyCallAccessController;
  v5 = [(HKBridgeSetupEmergencyCallAccessController *)&v20 init];
  v6 = v5;
  if (v5)
  {
    [(HKBridgeSetupEmergencyCallAccessController *)v5 setStyle:58];
    v7 = (_HKBridgeSetupConfiguration *)[v4 copy];
    configuration = v6->_configuration;
    v6->_configuration = v7;

    uint64_t v9 = [(_HKBridgeSetupConfiguration *)v6->_configuration healthStore];
    healthStore = v6->_healthStore;
    v6->_healthStore = (HKHealthStore *)v9;

    uint64_t v11 = [(_HKBridgeSetupConfiguration *)v6->_configuration medicalIDStore];
    medicalIDStore = v6->_medicalIDStore;
    v6->_medicalIDStore = (HKMedicalIDStore *)v11;

    v13 = [(_HKBridgeSetupConfiguration *)v6->_configuration familyMember];
    uint64_t v14 = [v13 firstName];
    firstName = v6->_firstName;
    v6->_firstName = (NSString *)v14;

    v16 = v6->_medicalIDStore;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_5624;
    v18[3] = &unk_C3D8;
    v19 = v6;
    [(HKMedicalIDStore *)v16 fetchMedicalIDDataWithCompletion:v18];
  }
  return v6;
}

- (HKBridgeSetupEmergencyCallAccessController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKBridgeSetupEmergencyCallAccessController;
  v2 = [(HKBridgeSetupEmergencyCallAccessController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKBridgeSetupEmergencyCallAccessController *)v2 setStyle:26];
  }
  return v3;
}

- (id)titleString
{
  if (!self->_firstName)
  {
    v3 = [(HKBridgeSetupEmergencyCallAccessController *)self delegate];
    id v4 = [v3 setupFlowUserInfo];
    objc_super v5 = [v4 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

    v6 = [v5 firstName];
    firstName = self->_firstName;
    self->_firstName = v6;
  }
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"eed_onboarding_share_emergency_call_title_%@" value:&stru_C4E8 table:@"Localizable-tinker"];

  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, self->_firstName);

  return v10;
}

- (id)detailString
{
  if (!self->_firstName)
  {
    v3 = [(HKBridgeSetupEmergencyCallAccessController *)self delegate];
    id v4 = [v3 setupFlowUserInfo];
    objc_super v5 = [v4 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

    v6 = [v5 firstName];
    firstName = self->_firstName;
    self->_firstName = v6;
  }
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedAttributedStringForKey:@"eed_onboarding_share_emergency_call_detail_watch_%@" value:&stru_C4E8 table:@"Localizable-tinker"];

  id v10 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringFormattingContextKey v18 = NSInflectionConceptsKey;
  uint64_t v11 = [(HKBridgeSetupEmergencyCallAccessController *)self termsOfAddress];
  v17 = v11;
  v12 = +[NSArray arrayWithObjects:&v17 count:1];
  v19 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v14 = objc_msgSend(v10, "initWithFormat:options:locale:context:", v9, 0, 0, v13, self->_firstName);

  v15 = [v14 string];

  return v15;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"eed_onboarding_share_emergency_call_share_button" value:&stru_C4E8 table:@"Localizable-tinker"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"eed_onboarding_share_emergency_call_dont_share_button" value:&stru_C4E8 table:@"Localizable-tinker"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"eed_onboarding_share_emergency_call_set_up_later" value:&stru_C4E8 table:@"Localizable-tinker"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"eed_onboarding_share_emergency_call_learn_more" value:&stru_C4E8 table:@"Localizable-tinker"];

  return v3;
}

- (id)imageResource
{
  return @"emergency_access_header";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)termsOfAddress
{
  v2 = [(HKBridgeSetupEmergencyCallAccessController *)self delegate];
  v3 = [v2 setupFlowUserInfo];
  id v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  uint64_t v10 = CNContactAddressingGrammarKey;
  objc_super v5 = +[NSArray arrayWithObjects:&v10 count:1];
  id v6 = objc_alloc_init((Class)CNContactStore);
  v7 = [v4 contactWithKeys:v5 contactStore:v6];

  if (v7)
  {
    v8 = [v7 termsOfAddress];
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)learnMoreButtonPressed:(id)a3
{
  id v4 = +[MIUIMedicalIDLearnMoreNavigationViewControllerFactory makeViewController];
  [(HKBridgeSetupEmergencyCallAccessController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)updateMedicalIDShareDuringEmergency:(BOOL)a3
{
  if (self->_healthStore)
  {
    [(_HKMedicalIDData *)self->_medicalIDData setShareDuringEmergency:a3];
    medicalIDStore = self->_medicalIDStore;
    medicalIDData = self->_medicalIDData;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5F48;
    v6[3] = &unk_C438;
    v6[4] = self;
    [(HKMedicalIDStore *)medicalIDStore updateMedicalIDData:medicalIDData completion:v6];
  }
  else
  {
    [(HKBridgeSetupEmergencyCallAccessController *)self updateMedicalIDShareDuringEmergencyInSkippedPane:a3];
  }
}

- (void)updateMedicalIDShareDuringEmergencyInSkippedPane:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_6074;
  v3[3] = &unk_C488;
  v3[4] = self;
  BOOL v4 = a3;
  +[HKBridgeSetupPrincipalClass getDeviceProfileIdentifierWithCompletion:v3];
}

- (void)okayButtonPressed:(id)a3
{
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(_HKBridgeSetupConfiguration *)self->_configuration device];
  +[BPSFollowUpController markSkippedSetupPaneClass:v4 forDevice:v5];

  [(HKBridgeSetupEmergencyCallAccessController *)self completeMiniFlowStep];
}

- (void)completeMiniFlowStep
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6504;
  block[3] = &unk_C410;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
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
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end