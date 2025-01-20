@interface DetectorsController
- (BOOL)_isAlarmsFull;
- (BOOL)_isHouseholdFull;
- (BOOL)_shouldUseKShotEnrollment;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (DetectorsController)init;
- (LAContext)localAuthContext;
- (NSMutableDictionary)customDetectors;
- (id)_customDetectorIsEnabledForSpec:(id)a3;
- (id)_internalSettingsButton;
- (id)isDetectorEnabledForSpecifier:(id)a3;
- (id)numberOfSoundRecordings:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_internalSettingsPressed:(id)a3;
- (void)_manageEditButton;
- (void)_manageRecordCustomSoundButtons;
- (void)_presentKShotOnboardingController:(id)a3;
- (void)_presentKShotOnboardingControllerWithCategory:(id)a3;
- (void)_presentKShotOnboardingControllerWithDetector:(id)a3;
- (void)_reloadSettings;
- (void)_startKShotOnboarding:(id)a3;
- (void)_startRenameSoundFlow:(id)a3;
- (void)cancelCustomDetectorTrainingForTarget:(id)a3;
- (void)dealloc;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)exitedOnboardingFlow;
- (void)loadCustomDetectorsFromSettings;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)renameDetector:(id)a3 to:(id)a4;
- (void)secureIntentViewControllerDidCancel:(id)a3;
- (void)secureIntentViewControllerDidFinish:(id)a3;
- (void)setCustomDetectors:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLocalAuthContext:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DetectorsController

- (DetectorsController)init
{
  v20.receiver = self;
  v20.super_class = (Class)DetectorsController;
  v2 = [(DetectorsController *)&v20 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    customDetectors = v2->_customDetectors;
    v2->_customDetectors = (NSMutableDictionary *)v3;

    cachedSpecifier = v2->_cachedSpecifier;
    v2->_cachedSpecifier = 0;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_kShotModelCreationCompleted_0, @"com.apple.accessibility.kshot.model.complete", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)_kShotModelCreationError_0, @"com.apple.accessibility.kshot.model.error", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v2);
    v8 = +[AXSDSettings sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __27__DetectorsController_init__block_invoke;
    v17[3] = &unk_208798;
    objc_copyWeak(&v18, &location);
    [v8 registerUpdateBlock:v17 forRetrieveSelector:"soundDetectionState" withListener:v2];

    v9 = +[AXSDSettings sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __27__DetectorsController_init__block_invoke_2;
    v15[3] = &unk_208798;
    objc_copyWeak(&v16, &location);
    [v9 registerUpdateBlock:v15 forRetrieveSelector:"enabledSoundDetectionTypes" withListener:v2];

    v10 = +[AXSDSettings sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __27__DetectorsController_init__block_invoke_3;
    v13[3] = &unk_208798;
    objc_copyWeak(&v14, &location);
    [v10 registerUpdateBlock:v13 forRetrieveSelector:"isActivelyTrainingAKShotModel" withListener:v2];

    v11 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __27__DetectorsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSettings];
}

void __27__DetectorsController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSettings];
}

void __27__DetectorsController_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSettings];
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_58;
  }
  uint64_t v67 = OBJC_IVAR___PSListController__specifiers;
  v66 = +[NSMutableArray array];
  v68 = self;
  v4 = [(DetectorsController *)self loadSpecifiersFromPlistName:@"DetectorSettings" target:self];
  id v5 = [v4 mutableCopy];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v80;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if ([v11 cellType] == (char *)&dword_0 + 2)
        {
          v12 = [v11 propertyForKey:@"AXSoundDetectionTypes"];
          if ([v12 count])
          {
            v13 = [v12 firstObject];
            id v14 = +[AXSDSettings sharedInstance];
            v15 = [v14 soundAlertTopicForSoundDetectionType:v13];
            [v11 setProperty:v15 forKey:@"accountIdentifier"];
          }
          [v11 setProperty:@"TLAlertTypeSoundRecognition" forKey:@"alertType"];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v8);
  }

  id v16 = +[AXSDSettings sharedInstance];
  v17 = [v16 supportedSoundDetectionTypes];

  v69 = +[NSMutableArray array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v6;
  id v18 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v76;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v76 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
        v23 = [v22 propertyForKey:@"AXSoundDetectionTypes"];
        v24 = v23;
        if (v23)
        {
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v25 = v23;
          id v26 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v72;
            while (2)
            {
              for (k = 0; k != v27; k = (char *)k + 1)
              {
                if (*(void *)v72 != v28) {
                  objc_enumerationMutation(v25);
                }
                if ([v17 containsObject:*(void *)(*((void *)&v71 + 1) + 8 * (void)k)])
                {

                  goto LABEL_29;
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          [v69 addObject:v22];
        }
LABEL_29:
      }
      id v19 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v19);
  }

  [obj removeObjectsInArray:v69];
  v30 = +[NSProcessInfo processInfo];
  if ((unint64_t)[v30 physicalMemory] < 0x77359400)
  {
    v32 = v68;
LABEL_51:

    goto LABEL_52;
  }
  int v31 = _os_feature_enabled_impl();

  v32 = v68;
  if (v31)
  {
    [(DetectorsController *)v68 loadCustomDetectorsFromSettings];
    v33 = settingsLocString(@"CUSTOM_ALARM", @"SoundDetection");
    v30 = +[PSSpecifier preferenceSpecifierNamed:v33 target:v68 set:0 get:0 detail:0 cell:13 edit:0];

    objc_msgSend(v30, "setButtonAction:");
    uint64_t v64 = PSIDKey;
    objc_msgSend(v30, "setProperty:forKey:", @"RecordCustomAlarmSpec");
    [v30 setProperty:AXSDDetectorCategoryAlarm forKey:@"kCategoryKey"];
    uint64_t v34 = PSAllowMultilineTitleKey;
    [v30 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    if ([(DetectorsController *)v68 _isAlarmsFull])
    {
      uint64_t v35 = 0;
    }
    else
    {
      v36 = +[AXSDSettings sharedInstance];
      uint64_t v35 = [v36 isActivelyTrainingAKShotModel] ^ 1;
    }
    v37 = +[NSNumber numberWithBool:v35];
    uint64_t v38 = PSEnabledKey;
    [v30 setProperty:v37 forKey:PSEnabledKey];

    uint64_t v39 = [obj specifierForID:@"last_alarm_spec"];
    v40 = [obj specifierForID:@"alarms_group"];
    if ([(DetectorsController *)v68 _isAlarmsFull])
    {
      v41 = settingsLocString(@"MAX_REACHED_ALARM", @"SoundDetection");
      uint64_t v42 = PSFooterTextGroupKey;
      [v40 setProperty:v41 forKey:PSFooterTextGroupKey];
    }
    else
    {
      uint64_t v42 = PSFooterTextGroupKey;
      [v40 setProperty:0 forKey:PSFooterTextGroupKey];
    }
    if (AXRuntimeCheck_HasANE()) {
      objc_msgSend(obj, "ps_insertObject:afterObject:", v30, v39);
    }
    v65 = (void *)v39;
    v43 = settingsLocString(@"CUSTOM_APPLIANCE", @"SoundDetection");
    v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:v68 set:0 get:0 detail:0 cell:13 edit:0];

    [v44 setButtonAction:"_startKShotOnboarding:"];
    [v44 setProperty:@"RecordCustomHouseholdSpec" forKey:v64];
    [v44 setProperty:AXSDDetectorCategoryHousehold forKey:@"kCategoryKey"];
    [v44 setProperty:&__kCFBooleanTrue forKey:v34];
    if ([(DetectorsController *)v68 _isHouseholdFull])
    {
      uint64_t v45 = 0;
    }
    else
    {
      v46 = +[AXSDSettings sharedInstance];
      uint64_t v45 = [v46 isActivelyTrainingAKShotModel] ^ 1;
    }
    v47 = +[NSNumber numberWithBool:v45];
    [v44 setProperty:v47 forKey:v38];

    v48 = [obj specifierForID:@"last_household_spec"];
    v49 = [obj specifierForID:@"household_group"];
    if ([(DetectorsController *)v68 _isHouseholdFull])
    {
      v50 = settingsLocString(@"MAX_REACHED_APPLIANCE", @"SoundDetection");
      [v49 setProperty:v50 forKey:v42];
    }
    else
    {
      [v49 setProperty:0 forKey:v42];
    }
    if (AXRuntimeCheck_HasANE()) {
      objc_msgSend(obj, "ps_insertObject:afterObject:", v44, v48);
    }
    v51 = [(DetectorsController *)v68 customDetectors];
    v52 = [v51 objectForKeyedSubscript:AXSDDetectorCategoryHousehold];
    objc_msgSend(obj, "ps_insertObjectsFromArray:afterObject:", v52, v48);

    v53 = [(DetectorsController *)v68 customDetectors];
    v54 = [v53 objectForKeyedSubscript:AXSDDetectorCategoryAlarm];
    objc_msgSend(obj, "ps_insertObjectsFromArray:afterObject:", v54, v65);

    goto LABEL_51;
  }
LABEL_52:
  id v55 = [obj count];
  if ((uint64_t)v55 - 1 >= 0)
  {
    uint64_t v56 = (uint64_t)v55;
    unint64_t v57 = 0;
    do
    {
      v58 = [obj objectAtIndexedSubscript:--v56];
      unint64_t v59 = (unint64_t)[v58 cellType];
      if (!(v57 | v59)) {
        [obj removeObjectAtIndex:v56];
      }

      unint64_t v57 = v59;
    }
    while (v56 > 0);
  }
  [v66 addObjectsFromArray:obj];
  v60 = +[PSSpecifier groupSpecifierWithName:0];
  [v66 addObject:v60];
  v61 = +[PSSpecifier emptyGroupSpecifier];
  [v66 addObject:v61];

  v62 = *(void **)&v32->PSListController_opaque[v67];
  *(void *)&v32->PSListController_opaque[v67] = v66;

  uint64_t v3 = *(void **)&v32->PSListController_opaque[v67];
LABEL_58:

  return v3;
}

- (id)isDetectorEnabledForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"AXSoundDetectionTypes"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v5 = @"OFF";
  if (v4)
  {
    id v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = +[AXSDSettings sharedInstance];
        v12 = [v11 enabledSoundDetectionTypes];
        LOBYTE(v10) = [v12 containsObject:v10];

        v7 |= v10;
      }
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
    if (v7) {
      id v5 = @"ON";
    }
  }
  v13 = settingsLocString(v5, @"Accessibility");

  return v13;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)DetectorsController;
  [(DetectorsController *)&v5 dealloc];
}

- (void)_reloadSettings
{
  [(DetectorsController *)self reloadSpecifiers];

  [(DetectorsController *)self _manageRecordCustomSoundButtons];
}

- (id)_internalSettingsButton
{
  uint64_t v3 = +[UIImage systemImageNamed:@"gear"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v3 style:0 target:self action:"_internalSettingsPressed:"];

  return v4;
}

- (void)_internalSettingsPressed:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Accessibility/Assets"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DetectorsController;
  [(DetectorsController *)&v5 viewDidLoad];
  uint64_t v3 = [(DetectorsController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  [(DetectorsController *)self _manageEditButton];
  [(DetectorsController *)self _manageRecordCustomSoundButtons];
  id v4 = [(DetectorsController *)self navigationController];
  [v4 setDelegate:self];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(DetectorsController *)self reloadSpecifiers];
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
}

- (void)_startKShotOnboarding:(id)a3
{
  id v6 = a3;
  if ([(DetectorsController *)self isEditing])
  {
    [(DetectorsController *)self setEditing:0 animated:1];
    [(DetectorsController *)self _manageEditButton];
  }
  [(DetectorsController *)self _shouldUseKShotEnrollment];
  id v4 = [v6 propertyForKey:@"AssociatedDetector"];

  if (v4)
  {
    objc_super v5 = [v6 propertyForKey:@"AssociatedDetector"];
    [(DetectorsController *)self _presentKShotOnboardingControllerWithDetector:v5];
  }
  else
  {
    objc_super v5 = [v6 propertyForKey:@"kCategoryKey"];
    [(DetectorsController *)self _presentKShotOnboardingControllerWithCategory:v5];
  }
}

- (void)_presentKShotOnboardingControllerWithCategory:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CustomDetectorOnboardingController alloc] initWithCategory:v4];

  [(DetectorsController *)self _presentKShotOnboardingController:v5];
}

- (void)_presentKShotOnboardingControllerWithDetector:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CustomDetectorOnboardingController alloc] initWithDetector:v4];

  [(DetectorsController *)self _presentKShotOnboardingController:v5];
}

- (void)_presentKShotOnboardingController:(id)a3
{
  id v5 = a3;
  id v4 = +[UIApplication sharedApplication];
  [v4 setIdleTimerDisabled:1];

  [v5 setCustomDetectorDelegate:self];
  [(DetectorsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_startRenameSoundFlow:(id)a3
{
  id v4 = a3;
  id v5 = [[RenameDetectorFlowController alloc] initWithDetectorSpecifier:v4];

  [(RenameDetectorFlowController *)v5 setRenameDetectorDelegate:self];
  [(DetectorsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)loadCustomDetectorsFromSettings
{
  int v31 = +[NSMutableArray array];
  v30 = +[NSMutableArray array];
  v2 = +[AXSDDetectorStore sharedInstance];
  uint64_t v3 = [v2 customDetectors];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v33;
    uint64_t v27 = PSEnabledKey;
    uint64_t v8 = PSIDKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        buf[0] = 0;
        objc_opt_class();
        v11 = __UIAccessibilityCastAsClass();
        if (buf[0]) {
          abort();
        }
        v12 = v11;
        if (v11)
        {
          v13 = [v11 recordings];
          id v14 = [v13 count];
          if (v13) {
            BOOL v15 = (unint64_t)v14 > 4;
          }
          else {
            BOOL v15 = 0;
          }
          if (v15 || ([v12 isModelReady] & 1) != 0)
          {
            long long v16 = [v12 name];
            long long v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"_customDetectorIsEnabledForSpec:" detail:objc_opt_class() cell:2 edit:0];
          }
          else
          {
            long long v18 = [v12 name];
            long long v17 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"numberOfSoundRecordings:" detail:0 cell:2 edit:0];

            [v17 setButtonAction:"_startKShotOnboarding:"];
            [v17 setProperty:kCFBooleanTrue forKey:v27];
          }
          id v19 = [v12 identifier];
          [v17 setProperty:v19 forKey:v8];

          [v17 setProperty:v12 forKey:@"AssociatedDetector"];
          uint64_t v20 = [v12 category];
          [v17 setProperty:v20 forKey:@"kCategoryKey"];

          [v17 setProperty:&__kCFBooleanTrue forKey:@"IsCustomSound"];
          [v17 setProperty:@"TLAlertTypeSoundRecognition" forKey:@"alertType"];
          v21 = [v12 identifier];
          [v17 setProperty:v21 forKey:@"accountIdentifier"];

          v22 = [v12 category];
          unsigned int v23 = [v22 isEqualToString:AXSDDetectorCategoryAlarm];

          if (v23) {
            v24 = v31;
          }
          else {
            v24 = v30;
          }
          [v24 addObject:v17];
          id v6 = v17;
        }
        else
        {
          v13 = AXLogUltron();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v10;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Recieved a detector that was not a custom detector. Detector: %@", buf, 0xCu);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  id v25 = [(DetectorsController *)self customDetectors];
  [v25 setObject:v31 forKey:AXSDDetectorCategoryAlarm];

  id v26 = [(DetectorsController *)self customDetectors];
  [v26 setObject:v30 forKey:AXSDDetectorCategoryHousehold];
}

- (id)numberOfSoundRecordings:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"AssociatedDetector"];
  id v4 = [v3 recordings];
  id v5 = [v4 count];

  id v6 = settingsLocString(@"OF_FIVE", @"SoundDetection");
  uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v5, 5);

  return v7;
}

- (BOOL)_isAlarmsFull
{
  v2 = [(DetectorsController *)self customDetectors];
  uint64_t v3 = [v2 objectForKey:AXSDDetectorCategoryAlarm];
  BOOL v4 = (unint64_t)[v3 count] > 9;

  return v4;
}

- (BOOL)_isHouseholdFull
{
  v2 = [(DetectorsController *)self customDetectors];
  uint64_t v3 = [v2 objectForKey:AXSDDetectorCategoryHousehold];
  BOOL v4 = (unint64_t)[v3 count] > 9;

  return v4;
}

- (id)_customDetectorIsEnabledForSpec:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"AssociatedDetector"];
  if ([v3 modelFailed])
  {
    BOOL v4 = @"TRAINING_FAILED";
    id v5 = @"SoundDetection";
  }
  else
  {
    id v6 = +[AXSDSettings sharedInstance];
    uint64_t v7 = [v6 enabledKShotDetectorIdentifiers];
    uint64_t v8 = [v3 identifier];
    unsigned int v9 = [v7 containsObject:v8];

    if (v9) {
      BOOL v4 = @"ON";
    }
    else {
      BOOL v4 = @"OFF";
    }
    id v5 = @"Accessibility";
  }
  uint64_t v10 = settingsLocString(v4, v5);

  return v10;
}

- (void)_manageEditButton
{
  int v3 = AXIsInternalInstall();
  BOOL v4 = [(DetectorsController *)self customDetectors];
  id v5 = [v4 count];

  if (v3)
  {
    if (v5)
    {
      if ([(DetectorsController *)self isEditing]) {
        return;
      }
      id v6 = [(DetectorsController *)self editButtonItem];
      [v6 setAction:"_editPressed:"];

      uint64_t v7 = [(DetectorsController *)self navigationItem];
      uint64_t v8 = [(DetectorsController *)self editButtonItem];
      v17[0] = v8;
      unsigned int v9 = [(DetectorsController *)self _internalSettingsButton];
      v17[1] = v9;
      uint64_t v10 = +[NSArray arrayWithObjects:v17 count:2];
      [v7 setRightBarButtonItems:v10];
    }
    else
    {
      [(DetectorsController *)self setEditing:0 animated:1];
      uint64_t v7 = [(DetectorsController *)self navigationItem];
      v13 = [(DetectorsController *)self _internalSettingsButton];
      long long v16 = v13;
      id v14 = +[NSArray arrayWithObjects:&v16 count:1];
      [v7 setRightBarButtonItems:v14];
    }
  }
  else
  {
    if (v5)
    {
      if ([(DetectorsController *)self isEditing]) {
        return;
      }
      v11 = [(DetectorsController *)self editButtonItem];
      [v11 setAction:"_editPressed:"];

      id v15 = [(DetectorsController *)self navigationItem];
      v12 = [(DetectorsController *)self editButtonItem];
      [v15 setRightBarButtonItem:v12];
    }
    else
    {
      [(DetectorsController *)self setEditing:0 animated:1];
      id v15 = [(DetectorsController *)self navigationItem];
      [v15 setRightBarButtonItem:0];
    }
  }
}

- (void)_manageRecordCustomSoundButtons
{
  int v3 = +[NSProcessInfo processInfo];
  id v4 = [v3 physicalMemory];

  if ((unint64_t)v4 >= 0x77359400)
  {
    id v13 = [(DetectorsController *)self specifierForID:@"RecordCustomAlarmSpec"];
    if ([(DetectorsController *)self _isAlarmsFull])
    {
      uint64_t v5 = 0;
    }
    else
    {
      id v6 = +[AXSDSettings sharedInstance];
      uint64_t v5 = [v6 isActivelyTrainingAKShotModel] ^ 1;
    }
    uint64_t v7 = +[NSNumber numberWithBool:v5];
    uint64_t v8 = PSEnabledKey;
    [v13 setProperty:v7 forKey:PSEnabledKey];

    [(DetectorsController *)self reloadSpecifier:v13];
    unsigned int v9 = [(DetectorsController *)self specifierForID:@"RecordCustomHouseholdSpec"];
    if ([(DetectorsController *)self _isHouseholdFull])
    {
      uint64_t v10 = 0;
    }
    else
    {
      v11 = +[AXSDSettings sharedInstance];
      uint64_t v10 = [v11 isActivelyTrainingAKShotModel] ^ 1;
    }
    v12 = +[NSNumber numberWithBool:v10];
    [v9 setProperty:v12 forKey:v8];

    [(DetectorsController *)self reloadSpecifier:v9];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DetectorsController;
  -[DetectorsController setEditing:animated:](&v8, "setEditing:animated:");
  uint64_t v7 = [(DetectorsController *)self table];
  [v7 setEditing:v5 animated:v4];
}

- (void)_editPressed:(id)a3
{
  [(DetectorsController *)self setEditing:1 animated:1];
  id v4 = [(DetectorsController *)self editButtonItem];
  [v4 setAction:"_donePressed"];
}

- (void)_donePressed
{
  [(DetectorsController *)self setEditing:0 animated:1];
  [(DetectorsController *)self _manageEditButton];

  [(DetectorsController *)self _reloadSettings];
}

- (void)exitedOnboardingFlow
{
  [(DetectorsController *)self _reloadSettings];
  [(DetectorsController *)self _manageEditButton];
  id v3 = +[UIApplication sharedApplication];
  [v3 setIdleTimerDisabled:0];
}

- (void)renameDetector:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setName:v6];
  [(DetectorsController *)self reloadSpecifier:v7];
  id v9 = [v7 propertyForKey:@"AssociatedDetector"];

  objc_super v8 = +[AXSDSettings sharedInstance];
  [v8 editKShotDetectorName:v9 newName:v6];
}

- (void)cancelCustomDetectorTrainingForTarget:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = +[AXSDSettings sharedInstance];
    [v5 removeKShotDetector:v4];

    [(DetectorsController *)self _reloadSettings];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:a4]];
  BOOL v5 = [v4 propertyForKey:@"IsCustomSound"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:a4]];
  BOOL v5 = [v4 propertyForKey:@"IsCustomSound"];
  unsigned int v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v4 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:a4]];
  BOOL v5 = [v4 propertyForKey:@"IsCustomSound"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v12 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:a5]];
  id v7 = [v12 propertyForKey:@"AssociatedDetector"];
  if (a4 == 1)
  {
    objc_super v8 = [(DetectorsController *)self customDetectors];
    id v9 = [v12 propertyForKey:@"kCategoryKey"];
    uint64_t v10 = [v8 objectForKey:v9];
    [v10 removeObject:v12];

    [(DetectorsController *)self removeSpecifier:v12 animated:1];
    v11 = +[AXSDSettings sharedInstance];
    [v11 removeKShotDetector:v7];
  }
  [(DetectorsController *)self _manageRecordCustomSoundButtons];
  [(DetectorsController *)self performSelector:"_manageEditButton" withObject:self afterDelay:0.1];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  BOOL v5 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:a4]];
  if ([(DetectorsController *)self isEditing])
  {
    unsigned __int8 v6 = [v5 propertyForKey:@"IsCustomSound"];
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:v5]];
  if ([(DetectorsController *)self isEditing]
    && ([v6 propertyForKey:@"IsCustomSound"],
        unsigned __int8 v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLValue],
        v7,
        !v8))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(DetectorsController *)self specifierAtIndex:[(DetectorsController *)self indexForIndexPath:v7]];
  if ([(DetectorsController *)self isEditing]
    && ([v8 propertyForKey:@"IsCustomSound"],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 BOOLValue],
        v9,
        v10))
  {
    [(DetectorsController *)self _startRenameSoundFlow:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DetectorsController;
    [(DetectorsController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (BOOL)_shouldUseKShotEnrollment
{
  if (AXRuntimeCheck_SoundRecognitionMedinaKShotEnrollmentEnabled()) {
    return AXDeviceIsKShotMedinaEnabled() ^ 1;
  }
  v2 = +[AXSDSettings sharedInstance];
  unsigned int v3 = [v2 forceMedinaSupport];

  if (v3) {
    return AXDeviceIsKShotMedinaEnabled() ^ 1;
  }
  else {
    return 0;
  }
}

- (void)secureIntentViewControllerDidCancel:(id)a3
{
  unsigned int v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "SecureIntent: Secure Intent view was cancelled.", v4, 2u);
  }
}

- (void)secureIntentViewControllerDidFinish:(id)a3
{
  unsigned int v4 = [a3 isEnrolled];
  id v5 = AXLogUltronKShot();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      cachedSpecifier = self->_cachedSpecifier;
      int v8 = 138412290;
      id v9 = cachedSpecifier;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SecureIntent: Secure Intent did finish. Continue training with cached specifier: %@", (uint8_t *)&v8, 0xCu);
    }

    [(DetectorsController *)self _startKShotOnboarding:self->_cachedSpecifier];
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SecureIntent: Secure Intent did finish but still not authenticated. Will not present training view.", (uint8_t *)&v8, 2u);
    }
  }
}

- (NSMutableDictionary)customDetectors
{
  return self->_customDetectors;
}

- (void)setCustomDetectors:(id)a3
{
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (void)setLocalAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_customDetectors, 0);

  objc_storeStrong((id *)&self->_cachedSpecifier, 0);
}

@end