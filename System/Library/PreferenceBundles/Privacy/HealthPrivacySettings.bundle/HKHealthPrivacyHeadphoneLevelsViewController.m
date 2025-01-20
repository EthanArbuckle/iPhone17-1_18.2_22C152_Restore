@interface HKHealthPrivacyHeadphoneLevelsViewController
- (ADASManager)manager;
- (BOOL)shouldShowOtherSection;
- (HKHealthPrivacyHeadphoneLevelsViewController)init;
- (PSSpecifier)forEightDaysCell;
- (PSSpecifier)measureLevelsGroup;
- (PSSpecifier)measureLevelsSwitch;
- (PSSpecifier)otherHeadphonesGroup;
- (PSSpecifier)otherHeadphonesSwitch;
- (PSSpecifier)saveInHealthGroup;
- (PSSpecifier)untilIDeleteCell;
- (id)_getIncludeOtherHeadphonesValue:(id)a3;
- (id)_getMeasureLevelsValue:(id)a3;
- (id)appleAndCalibratedPairedDevicesInverted:(BOOL)a3;
- (id)measureLevelsFooterText;
- (id)otherHeadphonesFooterText;
- (id)specifiers;
- (void)_setIncludeOtherHeadphonesValue:(id)a3 specifier:(id)a4;
- (void)_setInterruptionBehaviorSettingForSpecifier:(id)a3;
- (void)_setMeasureLevelsValue:(id)a3 specifier:(id)a4;
- (void)_updateSpecifiersForPruningPreference:(BOOL)a3;
- (void)setForEightDaysCell:(id)a3;
- (void)setManager:(id)a3;
- (void)setMeasureLevelsGroup:(id)a3;
- (void)setMeasureLevelsSwitch:(id)a3;
- (void)setOtherHeadphonesGroup:(id)a3;
- (void)setOtherHeadphonesSwitch:(id)a3;
- (void)setSaveInHealthGroup:(id)a3;
- (void)setShouldShowOtherSection:(BOOL)a3;
- (void)setUntilIDeleteCell:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKHealthPrivacyHeadphoneLevelsViewController

- (HKHealthPrivacyHeadphoneLevelsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthPrivacyHeadphoneLevelsViewController;
  v2 = [(HKHealthPrivacyHeadphoneLevelsViewController *)&v6 init];
  if (v2)
  {
    v3 = (ADASManager *)objc_alloc_init((Class)ADASManager);
    manager = v2->_manager;
    v2->_manager = v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKHealthPrivacyHeadphoneLevelsViewController;
  [(HKHealthPrivacyHeadphoneLevelsViewController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"HEADPHONE_AUDIO_LEVELS" value:&stru_8350 table:0];
  [(HKHealthPrivacyHeadphoneLevelsViewController *)self setTitle:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = objc_opt_new();
    v41 = [(ADASManager *)self->_manager getPreferenceFor:ADAFPreferenceKeyHAENotificationIsMandatory];
    if ([v41 BOOLValue])
    {
      objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = [v6 localizedStringForKey:@"SAVE_IN_HEALTH" value:&stru_8350 table:0];
      v8 = +[PSSpecifier groupSpecifierWithName:v7];
      saveInHealthGroup = self->_saveInHealthGroup;
      self->_saveInHealthGroup = v8;

      [(PSSpecifier *)self->_saveInHealthGroup setIdentifier:@"SAVE_IN_HEALTH_GROUP"];
      [(PSSpecifier *)self->_saveInHealthGroup setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
      [v5 addObject:self->_saveInHealthGroup];
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"FOR_EIGHT_DAYS" value:&stru_8350 table:0];
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
      forEightDaysCell = self->_forEightDaysCell;
      self->_forEightDaysCell = v12;

      [(PSSpecifier *)self->_forEightDaysCell setButtonAction:"_setInterruptionBehaviorSettingForSpecifier:"];
      [(PSSpecifier *)self->_forEightDaysCell setIdentifier:@"FOR_EIGHT_DAYS_CELL"];
      [v5 addObject:self->_forEightDaysCell];
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"UNTIL_I_DELETE" value:&stru_8350 table:0];
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];
      untilIDeleteCell = self->_untilIDeleteCell;
      self->_untilIDeleteCell = v16;

      [(PSSpecifier *)self->_untilIDeleteCell setButtonAction:"_setInterruptionBehaviorSettingForSpecifier:"];
      [(PSSpecifier *)self->_untilIDeleteCell setIdentifier:@"UNTIL_I_DELETE_CELL"];
      v18 = v41;
      [v5 addObject:self->_untilIDeleteCell];
      v19 = [(ADASManager *)self->_manager getPreferenceFor:ADAFPreferenceKeyHAESampleTransient];
      -[HKHealthPrivacyHeadphoneLevelsViewController _updateSpecifiersForPruningPreference:](self, "_updateSpecifiersForPruningPreference:", [v19 BOOLValue]);
    }
    else
    {
      v20 = +[PSSpecifier groupSpecifierWithID:@"MEASURE_LEVELS_GROUP"];
      measureLevelsGroup = self->_measureLevelsGroup;
      self->_measureLevelsGroup = v20;

      v22 = self->_measureLevelsGroup;
      v23 = [(HKHealthPrivacyHeadphoneLevelsViewController *)self measureLevelsFooterText];
      uint64_t v24 = PSFooterTextGroupKey;
      [(PSSpecifier *)v22 setProperty:v23 forKey:PSFooterTextGroupKey];

      [v5 addObject:self->_measureLevelsGroup];
      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"MEASURE_LEVELS" value:&stru_8350 table:0];
      v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:"_setMeasureLevelsValue:specifier:" get:"_getMeasureLevelsValue:" detail:0 cell:6 edit:0];
      measureLevelsSwitch = self->_measureLevelsSwitch;
      self->_measureLevelsSwitch = v27;

      [(PSSpecifier *)self->_measureLevelsSwitch setIdentifier:@"MEASURE_LEVELS_SWITCH"];
      [v5 addObject:self->_measureLevelsSwitch];
      v29 = +[PSSpecifier groupSpecifierWithID:@"OTHER_HEADPHONES_GROUP"];
      otherHeadphonesGroup = self->_otherHeadphonesGroup;
      self->_otherHeadphonesGroup = v29;

      v31 = self->_otherHeadphonesGroup;
      v32 = [(HKHealthPrivacyHeadphoneLevelsViewController *)self otherHeadphonesFooterText];
      [(PSSpecifier *)v31 setProperty:v32 forKey:v24];

      v33 = +[NSBundle bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"INCLUDE_OTHER_HEADPHONES" value:&stru_8350 table:0];
      v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:"_setIncludeOtherHeadphonesValue:specifier:" get:"_getIncludeOtherHeadphonesValue:" detail:0 cell:6 edit:0];
      otherHeadphonesSwitch = self->_otherHeadphonesSwitch;
      self->_otherHeadphonesSwitch = v35;

      [(PSSpecifier *)self->_otherHeadphonesSwitch setIdentifier:@"OTHER_HEADPHONES_SWITCH"];
      v37 = [(HKHealthPrivacyHeadphoneLevelsViewController *)self _getMeasureLevelsValue:self->_measureLevelsSwitch];
      self->_shouldShowOtherSection = [v37 BOOLValue];

      v18 = v41;
      if (self->_shouldShowOtherSection)
      {
        [v5 addObject:self->_otherHeadphonesGroup];
        [v5 addObject:self->_otherHeadphonesSwitch];
      }
    }
    id v38 = [v5 copy];
    v39 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v38;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)measureLevelsFooterText
{
  v2 = [(HKHealthPrivacyHeadphoneLevelsViewController *)self appleAndCalibratedPairedDevicesInverted:0];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MEASURE_LEVELS_FOOTER_TEXT" value:&stru_8350 table:0];

  objc_super v5 = [v4 stringByAppendingString:@"\n"];

  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"MEASURE_LEVELS_FOOTER_TEXT_GENERIC" value:&stru_8350 table:0];
  v8 = [v5 stringByAppendingString:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v2;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v8 stringByAppendingString:@"\n"];

        v15 = +[NSBundle bundleForClass:objc_opt_class()];
        v16 = [v15 localizedStringForKey:@"INCLUDE_OTHER_HEADPHONE_HEADPHONE_LIST_%@" value:&stru_8350 table:0];
        v17 = [v13 name];
        v8 = objc_msgSend(v14, "stringByAppendingFormat:", v16, v17);
      }
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)otherHeadphonesFooterText
{
  v2 = [(HKHealthPrivacyHeadphoneLevelsViewController *)self appleAndCalibratedPairedDevicesInverted:1];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"INCLUDE_OTHER_HEADPHONES_FOOTER_TEXT"];
  objc_super v5 = [v3 localizedStringForKey:v4 value:&stru_8350 table:0];

  objc_super v6 = [v5 stringByAppendingString:@"\n"];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"INCLUDE_OTHER_HEADPHONES_FOOTER_TEXT_GENERIC"];
  id v9 = [v7 localizedStringForKey:v8 value:&stru_8350 table:0];
  id v10 = [v6 stringByAppendingString:v9];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v2;
  id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v16 = [v10 stringByAppendingString:@"\n"];

        v17 = +[NSBundle bundleForClass:objc_opt_class()];
        v18 = [v17 localizedStringForKey:@"INCLUDE_OTHER_HEADPHONE_HEADPHONE_LIST_%@" value:&stru_8350 table:0];
        v19 = [v15 name];
        id v10 = objc_msgSend(v16, "stringByAppendingFormat:", v18, v19);
      }
      id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v10;
}

- (void)_updateSpecifiersForPruningPreference:(BOOL)a3
{
  saveInHealthGroup = self->_saveInHealthGroup;
  if (a3)
  {
    [(PSSpecifier *)saveInHealthGroup setProperty:self->_forEightDaysCell forKey:PSRadioGroupCheckedSpecifierKey];
    objc_super v5 = self->_saveInHealthGroup;
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"SAVE_IN_HEALTH_FOR_8_DAYS_FOOTER_TEXT";
  }
  else
  {
    [(PSSpecifier *)saveInHealthGroup setProperty:self->_untilIDeleteCell forKey:PSRadioGroupCheckedSpecifierKey];
    objc_super v5 = self->_saveInHealthGroup;
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"SAVE_IN_HEALTH_FOOTER_TEXT";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_8350 table:0];
  [(PSSpecifier *)v5 setProperty:v9 forKey:PSFooterTextGroupKey];

  id v10 = self->_saveInHealthGroup;

  [(HKHealthPrivacyHeadphoneLevelsViewController *)self reloadSpecifier:v10];
}

- (void)_setInterruptionBehaviorSettingForSpecifier:(id)a3
{
  v4 = [a3 identifier];
  objc_super v5 = [(PSSpecifier *)self->_forEightDaysCell identifier];
  id v6 = [v4 isEqualToString:v5];

  manager = self->_manager;
  uint64_t v8 = ADAFPreferenceKeyHAESampleTransient;
  id v9 = +[NSNumber numberWithBool:v6];
  id v10 = [(ADASManager *)manager setPreferenceFor:v8 value:v9];

  [(HKHealthPrivacyHeadphoneLevelsViewController *)self _updateSpecifiersForPruningPreference:v6];
}

- (id)_getMeasureLevelsValue:(id)a3
{
  return [(ADASManager *)self->_manager getPreferenceFor:ADAFPreferenceKeyHAEEnableHKWrite];
}

- (id)_getIncludeOtherHeadphonesValue:(id)a3
{
  return [(ADASManager *)self->_manager getPreferenceFor:ADAFPreferenceKeyHAEEnableOtherDevices];
}

- (void)_setMeasureLevelsValue:(id)a3 specifier:(id)a4
{
  manager = self->_manager;
  uint64_t v6 = ADAFPreferenceKeyHAEEnableHKWrite;
  id v7 = a3;
  id v8 = [(ADASManager *)manager setPreferenceFor:v6 value:v7];
  id v9 = [v7 BOOLValue];

  [(HKHealthPrivacyHeadphoneLevelsViewController *)self setShouldShowOtherSection:v9];
}

- (void)_setIncludeOtherHeadphonesValue:(id)a3 specifier:(id)a4
{
  id v4 = [(ADASManager *)self->_manager setPreferenceFor:ADAFPreferenceKeyHAEEnableOtherDevices value:a3];
}

- (void)setShouldShowOtherSection:(BOOL)a3
{
  if (self->_shouldShowOtherSection != a3)
  {
    self->_shouldShowOtherSection = a3;
    otherHeadphonesSwitch = self->_otherHeadphonesSwitch;
    if (a3)
    {
      v7[0] = self->_otherHeadphonesGroup;
      v7[1] = otherHeadphonesSwitch;
      objc_super v5 = +[NSArray arrayWithObjects:v7 count:2];
      [(HKHealthPrivacyHeadphoneLevelsViewController *)self insertContiguousSpecifiers:v5 afterSpecifier:self->_measureLevelsSwitch animated:1];
    }
    else
    {
      v6[0] = self->_otherHeadphonesGroup;
      v6[1] = otherHeadphonesSwitch;
      objc_super v5 = +[NSArray arrayWithObjects:v6 count:2];
      [(HKHealthPrivacyHeadphoneLevelsViewController *)self removeContiguousSpecifiers:v5 animated:1];
    }
  }
}

- (id)appleAndCalibratedPairedDevicesInverted:(BOOL)a3
{
  id v4 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v5 = +[BluetoothManager sharedInstance];
  uint64_t v6 = [v5 pairedDevices];

  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v11 type] & 0xFFFFFFFB) == 0x10) {
          [v4 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  id v12 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = +[BluetoothManager sharedInstance];
  v14 = [v13 pairedNonAppleHAEDevices];

  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        [v12 addObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
      }
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }

  long long v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_3744;
  v26 = &unk_82C8;
  id v27 = v12;
  BOOL v28 = a3;
  id v19 = v12;
  long long v20 = +[NSPredicate predicateWithBlock:&v23];
  long long v21 = objc_msgSend(v4, "filteredArrayUsingPredicate:", v20, v23, v24, v25, v26);

  return v21;
}

- (ADASManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (PSSpecifier)saveInHealthGroup
{
  return self->_saveInHealthGroup;
}

- (void)setSaveInHealthGroup:(id)a3
{
}

- (PSSpecifier)forEightDaysCell
{
  return self->_forEightDaysCell;
}

- (void)setForEightDaysCell:(id)a3
{
}

- (PSSpecifier)untilIDeleteCell
{
  return self->_untilIDeleteCell;
}

- (void)setUntilIDeleteCell:(id)a3
{
}

- (PSSpecifier)measureLevelsGroup
{
  return self->_measureLevelsGroup;
}

- (void)setMeasureLevelsGroup:(id)a3
{
}

- (PSSpecifier)measureLevelsSwitch
{
  return self->_measureLevelsSwitch;
}

- (void)setMeasureLevelsSwitch:(id)a3
{
}

- (PSSpecifier)otherHeadphonesGroup
{
  return self->_otherHeadphonesGroup;
}

- (void)setOtherHeadphonesGroup:(id)a3
{
}

- (PSSpecifier)otherHeadphonesSwitch
{
  return self->_otherHeadphonesSwitch;
}

- (void)setOtherHeadphonesSwitch:(id)a3
{
}

- (BOOL)shouldShowOtherSection
{
  return self->_shouldShowOtherSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHeadphonesSwitch, 0);
  objc_storeStrong((id *)&self->_otherHeadphonesGroup, 0);
  objc_storeStrong((id *)&self->_measureLevelsSwitch, 0);
  objc_storeStrong((id *)&self->_measureLevelsGroup, 0);
  objc_storeStrong((id *)&self->_untilIDeleteCell, 0);
  objc_storeStrong((id *)&self->_forEightDaysCell, 0);
  objc_storeStrong((id *)&self->_saveInHealthGroup, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end