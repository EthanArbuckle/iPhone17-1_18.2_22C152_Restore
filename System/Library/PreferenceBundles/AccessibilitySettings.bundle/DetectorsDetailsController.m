@interface DetectorsDetailsController
- (DetectorsDetailsController)init;
- (NSString)alertTopic;
- (NSString)alertTypeDescription;
- (id)_customDetectorIsEnabledForSpec:(id)a3;
- (id)currentToneSelectedForSpecifier:(id)a3;
- (id)footerTextForSpec:(id)a3;
- (id)isDetectorEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (void)_bugButtonTapped;
- (void)_confirmedSetDetectorEnabled:(BOOL)a3 forSpec:(id)a4;
- (void)_kShotModelCreationCompleted;
- (void)_recordAgain:(id)a3;
- (void)_removeSound:(id)a3;
- (void)_setCustomDetectorEnabled:(id)a3 forSpec:(id)a4;
- (void)_showConfirmationAlertForSpec:(id)a3;
- (void)_updateSoundDetectionState;
- (void)dealloc;
- (void)setAlertTopic:(id)a3;
- (void)setAlertTypeDescription:(id)a3;
- (void)setDetectorEnabled:(id)a3 forSpec:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DetectorsDetailsController

- (DetectorsDetailsController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DetectorsDetailsController;
  v2 = [(DetectorsDetailsController *)&v7 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_kShotModelCreationCompleted, @"com.apple.accessibility.kshot.model.complete", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_kShotModelCreationError, @"com.apple.accessibility.kshot.model.error", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = v2;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DetectorsDetailsController;
  [(DetectorsDetailsController *)&v10 viewWillAppear:a3];
  if (AXIsInternalInstall())
  {
    v4 = [(DetectorsDetailsController *)self specifier];
    v5 = [v4 propertyForKey:@"AssociatedDetector"];

    if (v5)
    {
      id v6 = objc_alloc((Class)UIBarButtonItem);
      objc_super v7 = settingsLocString(@"BUG_BUTTON", @"SoundDetection");
      id v8 = [v6 initWithTitle:v7 style:0 target:self action:"_bugButtonTapped"];
      v9 = [(DetectorsDetailsController *)self navigationItem];
      [v9 setRightBarButtonItem:v8];
    }
  }
}

- (id)specifiers
{
  v2 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v3 = *v2;
  if (*v2) {
    goto LABEL_12;
  }
  v4 = self;
  v5 = [(DetectorsDetailsController *)self specifier];
  id v6 = +[NSMutableArray array];
  uint64_t v7 = [v5 propertyForKey:@"alertType"];
  alertTypeDescription = v4->_alertTypeDescription;
  v4->_alertTypeDescription = (NSString *)v7;

  uint64_t v9 = [v5 propertyForKey:@"accountIdentifier"];
  alertTopic = v4->_alertTopic;
  v4->_alertTopic = (NSString *)v9;

  uint64_t v11 = [v5 propertyForKey:@"AXSoundDetectionTypes"];
  v12 = [v5 propertyForKey:@"IsCustomSound"];

  v43 = (void *)v11;
  if (v12)
  {
    v13 = +[PSSpecifier emptyGroupSpecifier];
    v14 = [(DetectorsDetailsController *)v4 specifier];
    v15 = [(DetectorsDetailsController *)v4 footerTextForSpec:v14];
    [v13 setProperty:v15 forKey:PSFooterTextGroupKey];

    uint64_t v16 = PSIDKey;
    [v13 setProperty:@"GroupSpecKey" forKey:PSIDKey];
    [v6 addObject:v13];
  }
  else
  {
    uint64_t v16 = PSIDKey;
  }
  v17 = [(DetectorsDetailsController *)v4 specifier];
  v18 = [v17 name];
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:v4 set:"setDetectorEnabled:forSpec:" get:"isDetectorEnabledForSpecifier:" detail:0 cell:6 edit:0];

  v20 = [(DetectorsDetailsController *)v4 specifier];
  v21 = [v20 identifier];
  [v19 setProperty:v21 forKey:v16];

  v22 = [(DetectorsDetailsController *)v4 specifier];
  v23 = [v22 propertyForKey:@"IsCustomSound"];

  if (!v23) {
    goto LABEL_9;
  }
  v24 = [(DetectorsDetailsController *)v4 specifier];
  v25 = [v24 propertyForKey:@"AssociatedDetector"];

  if (![v25 modelFailed])
  {
    v36 = [(DetectorsDetailsController *)v4 specifier];
    v37 = [v36 name];
    v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:v4 set:"_setCustomDetectorEnabled:forSpec:" get:"_customDetectorIsEnabledForSpec:" detail:0 cell:6 edit:0];

    [v38 setProperty:v25 forKey:@"AssociatedDetector"];
    v39 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 isModelReady]);
    [v38 setProperty:v39 forKey:PSEnabledKey];

    [v38 setProperty:@"EnableSpecKey" forKey:v16];
    v19 = v38;
LABEL_9:
    v35 = v43;
    [v19 setProperty:v43 forKey:@"AXSoundDetectionTypes"];
    [v6 addObject:v19];
    v40 = settingsLocString(@"SOUND_ALERT_TONES", @"SoundDetection");
    v30 = +[PSSpecifier preferenceSpecifierNamed:v40 target:v4 set:0 get:"currentToneSelectedForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    [v30 setProperty:v4->_alertTypeDescription forKey:@"alertType"];
    [v30 setProperty:v4->_alertTopic forKey:@"accountIdentifier"];
    [v30 setProperty:v43 forKey:@"AXSoundDetectionTypes"];
    [v6 addObject:v30];
    id v41 = v6;
    v25 = *v2;
    id *v2 = v41;
    int v34 = 1;
    goto LABEL_10;
  }
  v26 = settingsLocString(@"RECORD_AGAIN", @"SoundDetection");
  v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:v4 set:0 get:0 detail:0 cell:13 edit:0];

  [v27 setButtonAction:"_recordAgain:"];
  [v6 addObject:v27];
  v28 = +[PSSpecifier emptyGroupSpecifier];
  [v6 addObject:v28];
  v29 = settingsLocString(@"REMOVE_SOUND", @"SoundDetection");
  v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v4 set:0 get:0 detail:0 cell:13 edit:0];

  [v30 setButtonAction:"_removeSound:"];
  v31 = [v30 propertyForKey:PSTableCellKey];
  v32 = [v31 titleLabel];
  v33 = +[UIColor systemRedColor];
  [v32 setTextColor:v33];

  [v6 addObject:v30];
  objc_storeStrong(v2, v6);
  v4 = (DetectorsDetailsController *)*v2;

  int v34 = 0;
  v35 = v43;
LABEL_10:

  if (!v34) {
    goto LABEL_13;
  }
  id v3 = *v2;
LABEL_12:
  v4 = (DetectorsDetailsController *)v3;
LABEL_13:

  return v4;
}

- (void)_recordAgain:(id)a3
{
  v4 = [(DetectorsDetailsController *)self specifier];
  id v9 = [v4 propertyForKey:@"AssociatedDetector"];

  v5 = +[AXSDSettings sharedInstance];
  [v5 deleteTrainingFilesForDetector:v9];

  id v6 = +[AXSDSettings sharedInstance];
  [v6 setKShotDetectorModelFailed:v9 modelFailed:0];

  uint64_t v7 = [(DetectorsDetailsController *)self navigationController];
  id v8 = [v7 popViewControllerAnimated:1];
}

- (void)_removeSound:(id)a3
{
  v4 = [(DetectorsDetailsController *)self specifier];
  id v8 = [v4 propertyForKey:@"AssociatedDetector"];

  v5 = +[AXSDSettings sharedInstance];
  [v5 removeKShotDetector:v8];

  id v6 = [(DetectorsDetailsController *)self navigationController];
  id v7 = [v6 popViewControllerAnimated:1];
}

- (void)setSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DetectorsDetailsController;
  id v4 = a3;
  [(DetectorsDetailsController *)&v6 setSpecifier:v4];
  v5 = objc_msgSend(v4, "name", v6.receiver, v6.super_class);

  [(DetectorsDetailsController *)self setTitle:v5];
}

- (void)setDetectorEnabled:(id)a3 forSpec:(id)a4
{
  id v15 = a4;
  id v6 = [a3 BOOLValue];
  id v7 = +[AXSDSettings sharedInstance];
  id v8 = [v7 enabledSoundDetectionTypes];
  id v9 = [v8 count];

  objc_super v10 = +[VTPreferences sharedPreferences];
  unsigned int v11 = [v10 voiceTriggerEnabled];

  char v12 = AXDeviceSupportsConcurrentHPLPMics();
  if (v9) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v6 == 0;
  }
  BOOL v14 = v13 || v11 == 0;
  if (v14 || (v12 & 1) != 0) {
    [(DetectorsDetailsController *)self _confirmedSetDetectorEnabled:v6 forSpec:v15];
  }
  else {
    [(DetectorsDetailsController *)self _showConfirmationAlertForSpec:v15];
  }
}

- (id)isDetectorEnabledForSpecifier:(id)a3
{
  [a3 propertyForKey:@"AXSoundDetectionTypes"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v8 = +[AXSDSettings sharedInstance];
        id v9 = [v8 enabledSoundDetectionTypes];
        LOBYTE(v7) = [v9 containsObject:v7];

        if (v7)
        {
          id v4 = &dword_0 + 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_super v10 = +[NSNumber numberWithBool:v4];

  return v10;
}

- (id)currentToneSelectedForSpecifier:(id)a3
{
  uint64_t v4 = TLAlertTypeFromString();
  uint64_t v5 = +[TLToneManager sharedToneManager];
  id v6 = [v5 currentToneIdentifierForAlertType:v4 topic:self->_alertTopic];

  uint64_t v7 = +[TLToneManager sharedToneManager];
  id v8 = [v7 nameForToneIdentifier:v6];

  return v8;
}

- (void)_setCustomDetectorEnabled:(id)a3 forSpec:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 propertyForKey:@"AssociatedDetector"];
  id v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DetectorsDetailsController _setCustomDetectorEnabled:forSpec:](v7, v8);
  }

  id v9 = +[AXSDSettings sharedInstance];
  id v10 = [v6 BOOLValue];

  [v9 setKShotDetectorIsEnabled:v7 isEnabled:v10];
  [(DetectorsDetailsController *)self _updateSoundDetectionState];
}

- (id)_customDetectorIsEnabledForSpec:(id)a3
{
  id v3 = [a3 propertyForKey:@"AssociatedDetector"];
  if ([v3 isModelReady])
  {
    uint64_t v4 = +[AXSDSettings sharedInstance];
    uint64_t v5 = [v4 enabledKShotDetectorIdentifiers];
    id v6 = [v3 identifier];
    uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 containsObject:v6]);
  }
  else
  {
    uint64_t v7 = &__kCFBooleanTrue;
  }

  return v7;
}

- (id)footerTextForSpec:(id)a3
{
  id v3 = [a3 propertyForKey:@"AssociatedDetector"];
  if ([v3 modelFailed])
  {
    uint64_t v4 = @"TRAINING_FAILED_DETAIL";
  }
  else
  {
    if ([v3 isModelReady])
    {
      uint64_t v5 = &stru_20F6B8;
      goto LABEL_7;
    }
    uint64_t v4 = @"TRAINING_PROGRESS_FOOTER";
  }
  settingsLocString(v4, @"SoundDetection");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.accessibility.kshot.model.complete", 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.accessibility.kshot.model.error", 0);
  v5.receiver = self;
  v5.super_class = (Class)DetectorsDetailsController;
  [(DetectorsDetailsController *)&v5 dealloc];
}

- (void)_kShotModelCreationCompleted
{
  id v4 = [(DetectorsDetailsController *)self specifierForID:@"EnableSpecKey"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  id v3 = [(DetectorsDetailsController *)self specifierForID:@"GroupSpecKey"];
  [v3 setProperty:&stru_20F6B8 forKey:PSFooterTextGroupKey];
  [(DetectorsDetailsController *)self reloadSpecifiers];
}

- (void)_bugButtonTapped
{
  id v3 = [(DetectorsDetailsController *)self specifier];
  id v4 = [v3 propertyForKey:@"AssociatedDetector"];

  objc_super v5 = settingsLocString(@"TTR_ALERT_TITLE", @"SoundDetection");
  id v6 = settingsLocString(@"TTR_ALERT_MESSAGE", @"SoundDetection");
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v8 = settingsLocString(@"TTR_CONTINUE_TITLE", @"SoundDetection");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __46__DetectorsDetailsController__bugButtonTapped__block_invoke;
  v13[3] = &unk_208B68;
  id v14 = v4;
  id v9 = v4;
  id v10 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v13];

  [v7 addAction:v10];
  unsigned int v11 = settingsLocString(@"TTR_CANCEL_TITLE", @"SoundDetection");
  long long v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:&__block_literal_global_28];

  [v7 addAction:v12];
  [(DetectorsDetailsController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __46__DetectorsDetailsController__bugButtonTapped__block_invoke()
{
  return AXSDKShotGatherFilesAndGenerateRadarForDetector();
}

- (void)_showConfirmationAlertForSpec:(id)a3
{
  id v4 = a3;
  objc_super v5 = settingsLocString(@"CONFIRMATION_ALERT_TITLE", @"SoundDetection");
  id v6 = settingsLocString(@"CONFIRMATION_ALERT_BODY", @"SoundDetection");
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v8 = settingsLocString(@"CONFIRMATION_ALERT_CANCEL", @"SoundDetection");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __60__DetectorsDetailsController__showConfirmationAlertForSpec___block_invoke;
  v15[3] = &unk_208B68;
  v15[4] = self;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v15];

  id v10 = settingsLocString(@"CONFIRMATION_ALERT_OK", @"SoundDetection");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __60__DetectorsDetailsController__showConfirmationAlertForSpec___block_invoke_2;
  v13[3] = &unk_209CD8;
  void v13[4] = self;
  id v14 = v4;
  id v11 = v4;
  long long v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v13];

  [v7 addAction:v9];
  [v7 addAction:v12];
  [(DetectorsDetailsController *)self presentViewController:v7 animated:1 completion:0];
}

id __60__DetectorsDetailsController__showConfirmationAlertForSpec___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id __60__DetectorsDetailsController__showConfirmationAlertForSpec___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _confirmedSetDetectorEnabled:1 forSpec:*(void *)(a1 + 40)];
}

- (void)_confirmedSetDetectorEnabled:(BOOL)a3 forSpec:(id)a4
{
  id v6 = [a4 propertyForKey:@"AXSoundDetectionTypes"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = +[AXSDSettings sharedInstance];
        long long v13 = v12;
        if (a3) {
          [v12 addSoundDetectionType:v11];
        }
        else {
          [v12 removeSoundDetectionType:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [(DetectorsDetailsController *)self _updateSoundDetectionState];
}

- (void)_updateSoundDetectionState
{
  v2 = +[AXSDSettings sharedInstance];
  id v3 = [v2 enabledSoundDetectionTypes];
  id v4 = [v3 count];
  objc_super v5 = +[AXSDSettings sharedInstance];
  id v6 = [v5 enabledKShotDetectorIdentifiers];
  if ((char *)[v6 count] + (void)v4)
  {
  }
  else
  {
    id v7 = +[AXSDSettings sharedInstance];
    id v8 = (char *)[v7 soundDetectionState];

    if (v8 == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v9 = +[AXSDSettings sharedInstance];
      id v17 = v9;
      uint64_t v10 = 1;
LABEL_9:
      [v9 setSoundDetectionState:v10];
      goto LABEL_10;
    }
  }
  id v17 = +[AXSDSettings sharedInstance];
  uint64_t v11 = [v17 enabledSoundDetectionTypes];
  id v12 = [v11 count];
  long long v13 = +[AXSDSettings sharedInstance];
  long long v14 = [v13 enabledKShotDetectorIdentifiers];
  if ((char *)[v14 count] + (void)v12)
  {
    long long v15 = +[AXSDSettings sharedInstance];
    long long v16 = (char *)[v15 soundDetectionState];

    if (v16 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    uint64_t v9 = +[AXSDSettings sharedInstance];
    id v17 = v9;
    uint64_t v10 = 2;
    goto LABEL_9;
  }

LABEL_10:
}

- (NSString)alertTypeDescription
{
  return self->_alertTypeDescription;
}

- (void)setAlertTypeDescription:(id)a3
{
}

- (NSString)alertTopic
{
  return self->_alertTopic;
}

- (void)setAlertTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertTopic, 0);

  objc_storeStrong((id *)&self->_alertTypeDescription, 0);
}

- (void)_setCustomDetectorEnabled:(void *)a1 forSpec:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  id v4 = [a1 name];
  objc_super v5 = [a1 identifier];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Enable/Disable custom detector in settings %@ %@", (uint8_t *)&v6, 0x16u);
}

@end