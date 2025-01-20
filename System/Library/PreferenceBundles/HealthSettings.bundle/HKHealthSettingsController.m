@interface HKHealthSettingsController
- (BOOL)isPrimaryProfile;
- (HKHealthSettingsController)init;
- (HKHealthSettingsController)initWithHealthSettingsProfile:(id)a3;
- (HKHealthSettingsController)initWithPrimaryProfile:(BOOL)a3 healthSettingsProfile:(id)a4;
- (HKHealthSettingsProfile)healthSettingsProfile;
- (NSArray)sharedHealthDataIdentifiers;
- (NSDictionary)pendingURLDictionary;
- (PSSpecifier)healthRecordsSpecifier;
- (PSSystemPolicyForApp)appPolicy;
- (id)_getLastDataSourceInSpecifiers:(id)a3;
- (id)createSharedHealthDataSpecifiersWithProfileIdentifiers:(id)a3;
- (id)sourcesViewControllerForPrimaryProfile:(BOOL)a3 restorationSourceBundleIdentifier:(id)a4;
- (id)specifiers;
- (void)_submitScribeAnalyticEvent;
- (void)addHealthRecordsSpecifier:(BOOL)a3;
- (void)addSharedDataSpecifiersWithIdentifiers:(id)a3;
- (void)configureHealthChecklistItemInSpecifiers:(id)a3;
- (void)configureHealthRecordsItemInSpecifiers:(id)a3;
- (void)configureMedicalIDItemInSpecifiers:(id)a3;
- (void)configureOrganDonationItemInSpecifiers:(id)a3;
- (void)configureProfileCharacteristicsItemInSpecifiers:(id)a3;
- (void)configureSourcesItemInSpecifiers:(id)a3;
- (void)donateWithDeepLink:(id)a3 andTitle:(id)a4;
- (void)fetchHealthRecordsDataWithCompletion:(id)a3;
- (void)fetchSharedHealthData;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)openHealthChecklist:(id)a3;
- (void)setAppPolicy:(id)a3;
- (void)setHealthRecordsSpecifier:(id)a3;
- (void)setHealthSettingsProfile:(id)a3;
- (void)setPendingURLDictionary:(id)a3;
- (void)setSharedHealthDataIdentifiers:(id)a3;
- (void)showHealthRecords;
- (void)showHealthRecords:(id)a3;
- (void)showMedicalID:(id)a3;
- (void)showOrganDonation:(id)a3;
- (void)showProfileCharacteristics:(id)a3;
- (void)showSharedProfileHealthSettings:(id)a3;
- (void)showSources:(id)a3;
- (void)showSourcesForPrimaryProfile:(BOOL)a3 animated:(BOOL)a4 restorationSourceBundleIdentifier:(id)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation HKHealthSettingsController

- (HKHealthSettingsController)init
{
  v3 = +[HKHealthSettingsProfile sharedProfile];
  v4 = [(HKHealthSettingsController *)self initWithPrimaryProfile:1 healthSettingsProfile:v3];

  return v4;
}

- (HKHealthSettingsController)initWithHealthSettingsProfile:(id)a3
{
  return [(HKHealthSettingsController *)self initWithPrimaryProfile:0 healthSettingsProfile:a3];
}

- (HKHealthSettingsController)initWithPrimaryProfile:(BOOL)a3 healthSettingsProfile:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHealthSettingsController;
  v8 = [(HKHealthSettingsController *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_primaryProfile = a3;
    objc_storeStrong((id *)&v8->_healthSettingsProfile, a4);
    sharedHealthDataIdentifiers = v9->_sharedHealthDataIdentifiers;
    v9->_sharedHealthDataIdentifiers = (NSArray *)&__NSArray0__struct;

    hasHealthRecordsData = v9->_hasHealthRecordsData;
    v9->_hasHealthRecordsData = 0;

    pendingURLDictionary = v9->_pendingURLDictionary;
    v9->_pendingURLDictionary = 0;

    if (v9->_primaryProfile)
    {
      [(HKHealthSettingsController *)v9 fetchHealthRecordsDataWithCompletion:0];
      [(HKHealthSettingsController *)v9 fetchSharedHealthData];
    }
  }

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHealthSettingsController;
  [(HKHealthSettingsController *)&v5 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"prefs://root=HEALTH"];
  [(HKHealthSettingsController *)self donateWithDeepLink:v4 andTitle:0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthSettingsController;
  [(HKHealthSettingsController *)&v6 viewIsAppearing:a3];
  pendingURLDictionary = self->_pendingURLDictionary;
  if (pendingURLDictionary)
  {
    [(HKHealthSettingsController *)self handleURL:pendingURLDictionary withCompletion:0];
    objc_super v5 = self->_pendingURLDictionary;
    self->_pendingURLDictionary = 0;
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    objc_super v6 = [(HKHealthSettingsController *)self appPolicy];

    if (!v6)
    {
      id v7 = objc_alloc((Class)PSSystemPolicyForApp);
      id v8 = [v7 initWithBundleIdentifier:kHKHealthAppBundleIdentifier];
      [(HKHealthSettingsController *)self setAppPolicy:v8];

      v9 = [(HKHealthSettingsController *)self appPolicy];
      [v9 setDelegate:self];
    }
    v10 = [(HKHealthSettingsController *)self appPolicy];
    v11 = [v10 specifiersForPolicyOptions:8462337 force:0];
    id v12 = [v11 mutableCopy];

    [v5 addObjectsFromArray:v12];
    if (![(HKHealthSettingsController *)self isPrimaryProfile]) {
      [v5 removeObjectsInArray:v12];
    }
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v14 = [(HKHealthSettingsController *)self loadSpecifiersFromPlistName:@"HealthSettingsSpecifiers" target:self bundle:v13];
    [v5 addObjectsFromArray:v14];

    v15 = +[_HKBehavior sharedBehavior];
    if ([v15 healthAppHiddenOrNotInstalled]) {
      v16 = @"HEALTH_DATA_SETTINGS_TITLE";
    }
    else {
      v16 = @"HEALTH_SETTINGS_TITLE";
    }
    v17 = HKHealthSettingsLocalizedString(v16);
    [(HKHealthSettingsController *)self setTitle:v17];

    if (![(HKHealthSettingsController *)self isPrimaryProfile])
    {
      v18 = [(HKHealthSettingsController *)self healthSettingsProfile];
      v19 = [v18 localizedName];
      [(HKHealthSettingsController *)self setTitle:v19];
    }
    [(HKHealthSettingsController *)self configureProfileCharacteristicsItemInSpecifiers:v5];
    [(HKHealthSettingsController *)self configureMedicalIDItemInSpecifiers:v5];
    [(HKHealthSettingsController *)self configureOrganDonationItemInSpecifiers:v5];
    [(HKHealthSettingsController *)self configureSourcesItemInSpecifiers:v5];
    [(HKHealthSettingsController *)self configureHealthRecordsItemInSpecifiers:v5];
    if (self->_primaryProfile && [(NSArray *)self->_sharedHealthDataIdentifiers count])
    {
      v20 = [(HKHealthSettingsController *)self createSharedHealthDataSpecifiersWithProfileIdentifiers:self->_sharedHealthDataIdentifiers];
      v21 = [(HKHealthSettingsController *)self _getLastDataSourceInSpecifiers:v5];
      v22 = [v21 identifier];
      id v23 = [v5 indexOfSpecifierWithID:v22];

      v24 = [v5 objectAtIndexedSubscript:v23];
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v20, v24);
    }
    [(HKHealthSettingsController *)self configureHealthChecklistItemInSpecifiers:v5];
    v25 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  v9 = [v7 objectForKeyedSubscript:@"path"];
  v10 = [v9 componentsSeparatedByString:@"/"];
  v11 = [v10 firstObject];
  id v12 = +[HAServicesDefines healthSettingsSourcesHostName];
  unsigned int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    objc_super v14 = [(HKHealthSettingsController *)self view];
    v15 = [v14 window];

    if (v15)
    {
      v16 = [v10 lastObject];
      if ((+[HealthAppAuthorizationManagementLinkBuilder canOpenLinkWithSourceIdentifier:destinationIdentifier:](HealthAppAuthorizationManagementLinkBuilder, "canOpenLinkWithSourceIdentifier:destinationIdentifier:", 0, v16) & 1) != 0|| (+[HAServicesDefines healthSettingsSourcesHostName](HAServicesDefines, "healthSettingsSourcesHostName"), v17 = objc_claimAutoreleasedReturnValue(), unsigned int v18 = [v9 isEqualToString:v17], v17, v18))
      {
        [(HKHealthSettingsController *)self showSourcesForPrimaryProfile:[(HKHealthSettingsController *)self isPrimaryProfile] animated:1 restorationSourceBundleIdentifier:v16 completion:v8];
        v19 = +[HAServicesDefines externalSourceAssistantService];
        unsigned int v20 = [v16 isEqualToString:v19];

        if (v20) {
          [(HKHealthSettingsController *)self _submitScribeAnalyticEvent];
        }
      }
      else
      {
        v8[2](v8);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_pendingURLDictionary, a3);
      v8[2](v8);
    }
  }
  else if ([v9 containsString:@"HEALTH_RECORDS_ITEM"] {
         && [(HKHealthSettingsController *)self isPrimaryProfile]
  }
         && !self->_hasHealthRecordsData)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_56C8;
    v22[3] = &unk_10458;
    id v23 = v7;
    v24 = self;
    v25 = v8;
    [(HKHealthSettingsController *)self fetchHealthRecordsDataWithCompletion:v22];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)HKHealthSettingsController;
    [(HKHealthSettingsController *)&v21 handleURL:v7 withCompletion:v8];
  }
}

- (void)_submitScribeAnalyticEvent
{
  id v2 = objc_alloc_init((Class)HealthAppScribeAnalyticEventManager);
  [v2 submitHealthEventWithDescription:@"Authorization Management: Settings" requestInterval:0];
}

- (void)configureProfileCharacteristicsItemInSpecifiers:(id)a3
{
  id v3 = [a3 specifierForID:@"HEALTH_DETAILS_ITEM"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v3 setControllerLoadAction:"showProfileCharacteristics:"];
}

- (void)configureMedicalIDItemInSpecifiers:(id)a3
{
  id v6 = a3;
  id v3 = [v6 specifierForID:@"MEDICAL_ID_ITEM"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  if (v3
    && (+[HKHealthChecklistUtilities shared],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isMedicalIDAvailable],
        v4,
        (v5 & 1) != 0))
  {
    [v3 setControllerLoadAction:"showMedicalID:"];
  }
  else
  {
    [v6 removeObject:v3];
  }
}

- (void)configureOrganDonationItemInSpecifiers:(id)a3
{
  id v5 = a3;
  v4 = [v5 specifierForID:@"ORGAN_DONATION_ITEM"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v4 setControllerLoadAction:"showOrganDonation:"];
  if (!v4
    || !+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable")|| !+[HKOrganDonationConnectionManager hasStoredRegistrant]|| ![(HKHealthSettingsController *)self isPrimaryProfile])
  {
    [v5 removeObject:v4];
  }
}

- (void)configureHealthRecordsItemInSpecifiers:(id)a3
{
  id v8 = a3;
  v4 = [v8 specifierForID:@"HEALTH_RECORDS_ITEM"];
  healthRecordsSpecifier = self->_healthRecordsSpecifier;
  self->_healthRecordsSpecifier = v4;

  [(PSSpecifier *)self->_healthRecordsSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [(PSSpecifier *)self->_healthRecordsSpecifier setControllerLoadAction:"showHealthRecords:"];
  if (self->_healthRecordsSpecifier)
  {
    if ([(HKHealthSettingsController *)self isPrimaryProfile]
      && [(NSNumber *)self->_hasHealthRecordsData BOOLValue])
    {
      id v6 = [(PSSpecifier *)self->_healthRecordsSpecifier identifier];
      id v7 = [v8 specifierForID:v6];

      if (!v7) {
        objc_msgSend(v8, "insertObject:atIndex:", self->_healthRecordsSpecifier, objc_msgSend(v8, "indexOfSpecifierWithID:", @"SOURCES_ITEM"));
      }
    }
    else
    {
      [v8 removeObject:self->_healthRecordsSpecifier];
    }
  }
}

- (void)configureSourcesItemInSpecifiers:(id)a3
{
  id v3 = [a3 specifierForID:@"SOURCES_ITEM"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v3 setControllerLoadAction:"showSources:"];
}

- (void)configureHealthChecklistItemInSpecifiers:(id)a3
{
  id v4 = a3;
  id v5 = [v4 specifierForID:@"HEALTH_CHECKLIST_GROUP"];
  id v6 = [v4 specifierForID:@"HEALTH_CHECKLIST_ITEM"];
  if ([(HKHealthSettingsController *)self isPrimaryProfile])
  {
    id v7 = +[_HKBehavior sharedBehavior];
    unsigned __int8 v8 = [v7 healthAppHiddenOrNotInstalled];

    v9 = +[HKHealthChecklistUtilities shared];
    unsigned int v10 = [v9 isHealthChecklistAvailable];

    if ((v8 & 1) != 0 || !v10)
    {
      v14[0] = v5;
      v14[1] = v6;
      unsigned int v13 = +[NSArray arrayWithObjects:v14 count:2];
      [v4 removeObjectsInArray:v13];
    }
    else
    {
      if (+[_HKBehavior hasPairedWatch]) {
        v11 = @"HEALTH_CHECKLIST_FOOTER_PHONE_WATCH";
      }
      else {
        v11 = @"HEALTH_CHECKLIST_FOOTER_PHONE_ONLY";
      }
      id v12 = HKHealthSettingsSpecifiersLocalizedString(v11);
      [v5 setProperty:v12 forKey:PSFooterTextGroupKey];

      [v6 setButtonAction:"openHealthChecklist:"];
      [v6 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    }
  }
  else
  {
    [v4 removeObject:v6];
  }
}

- (id)createSharedHealthDataSpecifiersWithProfileIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (v4 && [v4 count])
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"SHARED_DATA_GROUP_TITLE" value:&stru_10A60 table:@"Localizable-tinker"];

    unsigned int v18 = (void *)v7;
    v17 = +[PSSpecifier groupSpecifierWithID:@"HealthSettingsTinkerProfileSpecifierID" name:v7];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v4;
    id obj = v4;
    id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      uint64_t v11 = PSAllowMultilineTitleKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          unsigned int v13 = [[HKHealthSettingsProfile alloc] initWithProfileIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          objc_super v14 = [(HKHealthSettingsProfile *)v13 localizedName];
          v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:1 edit:0];

          [v15 setProperty:v13 forKey:@"HealthSettingsProfileProperty"];
          [v15 setProperty:&__kCFBooleanTrue forKey:v11];
          [v15 setControllerLoadAction:"showSharedProfileHealthSettings:"];
          [v5 addObject:v15];
        }
        id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [v5 sortUsingComparator:&stru_10498];
    [v5 insertObject:v17 atIndex:0];

    id v4 = v19;
  }

  return v5;
}

- (void)fetchSharedHealthData
{
  objc_initWeak(&location, self);
  id v3 = [(HKHealthSettingsController *)self healthSettingsProfile];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6088;
  v4[3] = &unk_104E8;
  objc_copyWeak(&v5, &location);
  [v3 getProfilesOfType:3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)fetchHealthRecordsDataWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)HKClinicalAccountStore);
  id v6 = [(HKHealthSettingsController *)self healthSettingsProfile];
  uint64_t v7 = [v6 healthStore];
  id v8 = [v5 initWithHealthStore:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_62F0;
  v10[3] = &unk_10538;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v8 hasAnyHealthRecordsAccountWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)addSharedDataSpecifiersWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(HKHealthSettingsController *)self createSharedHealthDataSpecifiersWithProfileIdentifiers:v5];
    uint64_t v7 = [(HKHealthSettingsController *)self specifiers];
    id v8 = [(HKHealthSettingsController *)self _getLastDataSourceInSpecifiers:v7];

    if (v8)
    {
      [(HKHealthSettingsController *)self insertContiguousSpecifiers:v6 afterSpecifier:v8 animated:0];
    }
    else
    {
      _HKInitializeLogging();
      id v9 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
        sub_A210(v9, self);
      }
    }
  }
}

- (void)addHealthRecordsSpecifier:(BOOL)a3
{
  if (self->_healthRecordsSpecifier) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id v5 = [(HKHealthSettingsController *)self specifiers];
    id v6 = [v5 specifierForID:@"SOURCES_ITEM"];

    if (v6)
    {
      [(HKHealthSettingsController *)self insertSpecifier:self->_healthRecordsSpecifier afterSpecifier:v6 animated:0];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v7 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_A2A8(v7, self);
      }
    }
  }
}

- (id)_getLastDataSourceInSpecifiers:(id)a3
{
  id v3 = a3;
  id v4 = [v3 specifierForID:@"SOURCES_ITEM"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = [v3 specifierForID:@"HEALTH_RECORDS_ITEM"];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;

      id v6 = v9;
    }
    id v10 = v6;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)showProfileCharacteristics:(id)a3
{
  id v4 = [(HKHealthSettingsController *)self healthSettingsProfile];
  id v5 = [v4 healthStore];
  id v6 = +[ProfileCharacteristicsViewController makeWithSharedDiskHealthExperienceStoreWithHealthStore:v5];

  [v6 setAccessType:5];
  [v6 setSettingsNavigationDonatingDelegate:self];
  [(HKHealthSettingsController *)self hk_authenticateWithCompletionViewController:v6];
}

- (void)showMedicalID:(id)a3
{
  id v4 = [HKHealthSettingsMedicalIDViewController alloc];
  id v5 = [(HKHealthSettingsController *)self healthSettingsProfile];
  id v6 = [(HKHealthSettingsMedicalIDViewController *)v4 initWithHealthSettingsProfile:v5];

  [(HKHealthSettingsMedicalIDViewController *)v6 setSettingsNavigationDonatingDelegate:self];
  [(HKHealthSettingsController *)self showViewController:v6 sender:0];
}

- (void)showOrganDonation:(id)a3
{
  id v4 = objc_alloc_init(HKHealthSettingsOrganDonationViewController);
  [(HKHealthSettingsController *)self hk_authenticateWithCompletionViewController:v4];
}

- (void)showHealthRecords:(id)a3
{
}

- (void)showHealthRecords
{
  id v3 = GSSystemRootDirectory();
  id v4 = [v3 stringByAppendingPathComponent:@"/System/Library/PreferenceBundles/HealthRecordsSettings.bundle"];
  id v5 = +[NSBundle bundleWithPath:v4];

  if (v5)
  {
    id v6 = (objc_class *)[v5 principalClass];
    if (v6)
    {
      id v7 = objc_alloc_init(v6);
      if ([v7 conformsToProtocol:&OBJC_PROTOCOL___HKHealthSettingsNavigationDonaterConsuming])objc_msgSend(v7, "setSettingsNavigationDonatingDelegate:", self); {
      if (v7)
      }
      {
        [(HKHealthSettingsController *)self hk_authenticateWithCompletionViewController:v7];
      }
      else
      {
        _HKInitializeLogging();
        long long v24 = HKLogDefault;
        if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
          sub_A3B0(v24, v25, v26, v27, v28, v29, v30, v31);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
        sub_A378(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
      sub_A340(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)showSources:(id)a3
{
  BOOL v4 = [(HKHealthSettingsController *)self isPrimaryProfile];

  [(HKHealthSettingsController *)self showSourcesForPrimaryProfile:v4 animated:1 restorationSourceBundleIdentifier:0 completion:0];
}

- (void)showSourcesForPrimaryProfile:(BOOL)a3 animated:(BOOL)a4 restorationSourceBundleIdentifier:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  uint64_t v11 = [(HKHealthSettingsController *)self sourcesViewControllerForPrimaryProfile:v8 restorationSourceBundleIdentifier:a5];
  [v11 setSettingsNavigationDonatingDelegate:self];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_6AC8;
  v14[3] = &unk_10588;
  v14[4] = self;
  id v15 = v11;
  BOOL v17 = a4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v11;
  +[AuthenticationHelper authenticateWithCompletion:v14];
}

- (id)sourcesViewControllerForPrimaryProfile:(BOOL)a3 restorationSourceBundleIdentifier:(id)a4
{
  if (a3) {
    id v6 = HKHealthSettingsSourcesViewController;
  }
  else {
    id v6 = HKHealthSettingsSecondaryProfileSourcesViewController;
  }
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v9 = [(HKHealthSettingsController *)self healthSettingsProfile];
  id v10 = [v8 initWithProfile:v9 usingInsetStyling:1];

  [v10 setRestorationSourceBundleIdentifier:a4];

  return v10;
}

- (void)openHealthChecklist:(id)a3
{
  +[NSURL URLWithString:@"x-apple-health://HealthChecklist?urlSource=HealthSettings"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:&__NSDictionary0__struct];
}

- (void)showSharedProfileHealthSettings:(id)a3
{
  id v5 = [a3 propertyForKey:@"HealthSettingsProfileProperty"];
  id v4 = [[HKHealthSettingsController alloc] initWithHealthSettingsProfile:v5];
  [(HKHealthSettingsController *)self hk_authenticateWithCompletionViewController:v4];
}

- (void)donateWithDeepLink:(id)a3 andTitle:(id)a4
{
  long long v24 = (__CFString *)a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)_NSLocalizedStringResource);
  id v8 = +[NSLocale currentLocale];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 bundleURL];
  uint64_t v11 = @"Health";
  id v12 = [v7 initWithKey:@"Health" table:0 locale:v8 bundleURL:v10];

  id v13 = +[NSMutableArray array];
  [v13 addObject:v12];
  if (v24)
  {
    id v14 = objc_alloc((Class)_NSLocalizedStringResource);
    id v15 = +[NSLocale currentLocale];
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v17 = [v16 bundleURL];
    id v18 = [v14 initWithKey:v24 table:0 locale:v15 bundleURL:v17];

    [v13 addObject:v18];
    uint64_t v11 = v24;
  }
  id v19 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v20 = +[NSLocale currentLocale];
  uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 bundleURL];
  id v23 = [v19 initWithKey:v11 table:0 locale:v20 bundleURL:v22];

  [(HKHealthSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Health" title:v23 localizedNavigationComponents:v13 deepLink:v6];
}

- (BOOL)isPrimaryProfile
{
  return self->_primaryProfile;
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (HKHealthSettingsProfile)healthSettingsProfile
{
  return self->_healthSettingsProfile;
}

- (void)setHealthSettingsProfile:(id)a3
{
}

- (PSSpecifier)healthRecordsSpecifier
{
  return self->_healthRecordsSpecifier;
}

- (void)setHealthRecordsSpecifier:(id)a3
{
}

- (NSArray)sharedHealthDataIdentifiers
{
  return self->_sharedHealthDataIdentifiers;
}

- (void)setSharedHealthDataIdentifiers:(id)a3
{
}

- (NSDictionary)pendingURLDictionary
{
  return self->_pendingURLDictionary;
}

- (void)setPendingURLDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingURLDictionary, 0);
  objc_storeStrong((id *)&self->_sharedHealthDataIdentifiers, 0);
  objc_storeStrong((id *)&self->_healthRecordsSpecifier, 0);
  objc_storeStrong((id *)&self->_healthSettingsProfile, 0);
  objc_storeStrong((id *)&self->_appPolicy, 0);

  objc_storeStrong((id *)&self->_hasHealthRecordsData, 0);
}

@end