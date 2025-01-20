@interface HKHeadphonePrivacyController
- (ADASManager)manager;
- (BOOL)otherSectionEnabled;
- (HKHeadphonePrivacyController)init;
- (PSSpecifier)forEightDaysCell;
- (PSSpecifier)measureLevelsGroup;
- (PSSpecifier)measureLevelsSwitch;
- (PSSpecifier)otherHeadphonesGroup;
- (PSSpecifier)otherHeadphonesSwitch;
- (PSSpecifier)saveInHealthGroup;
- (PSSpecifier)untilIDeleteCell;
- (id)preferenceValue:(id)a3;
- (id)specifiers;
- (void)_setInterruptionBehaviorSettingForSpecifier:(id)a3;
- (void)_setupMeasureLevelsGroup;
- (void)_setupOtherHeadphonesGroup;
- (void)_setupPruningGroup;
- (void)_updateSpecifiersForPruningPreference:(BOOL)a3;
- (void)setForEightDaysCell:(id)a3;
- (void)setManager:(id)a3;
- (void)setMeasureLevelsGroup:(id)a3;
- (void)setMeasureLevelsSwitch:(id)a3;
- (void)setOtherHeadphonesGroup:(id)a3;
- (void)setOtherHeadphonesSwitch:(id)a3;
- (void)setOtherSectionEnabled:(BOOL)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSaveInHealthGroup:(id)a3;
- (void)setUntilIDeleteCell:(id)a3;
- (void)toggleSecondSection;
@end

@implementation HKHeadphonePrivacyController

- (HKHeadphonePrivacyController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKHeadphonePrivacyController;
  v2 = [(HKHeadphonePrivacyController *)&v6 init];
  if (v2)
  {
    v3 = (ADASManager *)objc_alloc_init((Class)ADASManager);
    manager = v2->_manager;
    v2->_manager = v3;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    objc_super v6 = [(ADASManager *)self->_manager getNanoPreferenceFor:ADAFPreferenceKeyHAENotificationIsMandatory];
    if ([v6 BOOLValue])
    {
      [(HKHeadphonePrivacyController *)self _setupPruningGroup];
      [v5 addObject:self->_saveInHealthGroup];
      [v5 addObject:self->_forEightDaysCell];
      [v5 addObject:self->_untilIDeleteCell];
      v7 = [(ADASManager *)self->_manager getNanoPreferenceFor:ADAFPreferenceKeyHAESampleTransient];
      -[HKHeadphonePrivacyController _updateSpecifiersForPruningPreference:](self, "_updateSpecifiersForPruningPreference:", [v7 BOOLValue]);
    }
    else
    {
      [(HKHeadphonePrivacyController *)self _setupMeasureLevelsGroup];
      [v5 addObject:self->_measureLevelsGroup];
      [v5 addObject:self->_measureLevelsSwitch];
      [(HKHeadphonePrivacyController *)self _setupOtherHeadphonesGroup];
      [v5 addObject:self->_otherHeadphonesGroup];
      [v5 addObject:self->_otherHeadphonesSwitch];
    }
    id v8 = [v5 copy];
    v9 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v8;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_setupPruningGroup
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"SAVE_IN_HEALTH" value:&stru_C3E8 table:@"Privacy"];
  v5 = +[PSSpecifier groupSpecifierWithName:v4];
  saveInHealthGroup = self->_saveInHealthGroup;
  self->_saveInHealthGroup = v5;

  [(PSSpecifier *)self->_saveInHealthGroup setIdentifier:@"SAVE_IN_HEALTH_GROUP"];
  [(PSSpecifier *)self->_saveInHealthGroup setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"FOR_EIGHT_DAYS" value:&stru_C3E8 table:@"Privacy"];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];
  forEightDaysCell = self->_forEightDaysCell;
  self->_forEightDaysCell = v9;

  [(PSSpecifier *)self->_forEightDaysCell setButtonAction:"_setInterruptionBehaviorSettingForSpecifier:"];
  [(PSSpecifier *)self->_forEightDaysCell setIdentifier:@"FOR_EIGHT_DAYS_CELL"];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"UNTIL_I_DELETE" value:&stru_C3E8 table:@"Privacy"];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];
  untilIDeleteCell = self->_untilIDeleteCell;
  self->_untilIDeleteCell = v13;

  [(PSSpecifier *)self->_untilIDeleteCell setButtonAction:"_setInterruptionBehaviorSettingForSpecifier:"];
  v15 = self->_untilIDeleteCell;

  [(PSSpecifier *)v15 setIdentifier:@"UNTIL_I_DELETE_CELL"];
}

- (void)_setupMeasureLevelsGroup
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"MEASURE_LEVELS_GROUP"];
  measureLevelsGroup = self->_measureLevelsGroup;
  self->_measureLevelsGroup = v3;

  v5 = self->_measureLevelsGroup;
  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"MEASURE_LEVELS_FOOTER_TEXT" value:&stru_C3E8 table:@"Privacy"];
  [(PSSpecifier *)v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"MEASURE_LEVELS" value:&stru_C3E8 table:@"Privacy"];
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setPreferenceValue:specifier:" get:"preferenceValue:" detail:0 cell:6 edit:0];
  measureLevelsSwitch = self->_measureLevelsSwitch;
  self->_measureLevelsSwitch = v10;

  v12 = self->_measureLevelsSwitch;

  [(PSSpecifier *)v12 setIdentifier:@"MEASURE_LEVELS_SWITCH"];
}

- (void)_setupOtherHeadphonesGroup
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"OTHER_HEADPHONES_GROUP"];
  otherHeadphonesGroup = self->_otherHeadphonesGroup;
  self->_otherHeadphonesGroup = v3;

  v5 = self->_otherHeadphonesGroup;
  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"INCLUDE_OTHER_HEADPHONES_FOOTER_TEXT" value:&stru_C3E8 table:@"Privacy"];
  [(PSSpecifier *)v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"INCLUDE_OTHER_HEADPHONES" value:&stru_C3E8 table:@"Privacy"];
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setPreferenceValue:specifier:" get:"preferenceValue:" detail:0 cell:6 edit:0];
  otherHeadphonesSwitch = self->_otherHeadphonesSwitch;
  self->_otherHeadphonesSwitch = v10;

  v12 = self->_otherHeadphonesSwitch;

  [(PSSpecifier *)v12 setIdentifier:@"OTHER_HEADPHONES_SWITCH"];
}

- (void)_updateSpecifiersForPruningPreference:(BOOL)a3
{
  saveInHealthGroup = self->_saveInHealthGroup;
  if (a3)
  {
    [(PSSpecifier *)saveInHealthGroup setProperty:self->_forEightDaysCell forKey:PSRadioGroupCheckedSpecifierKey];
    v5 = self->_saveInHealthGroup;
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"SAVE_IN_HEALTH_FOR_8_DAYS_FOOTER_TEXT";
  }
  else
  {
    [(PSSpecifier *)saveInHealthGroup setProperty:self->_untilIDeleteCell forKey:PSRadioGroupCheckedSpecifierKey];
    v5 = self->_saveInHealthGroup;
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = v6;
    CFStringRef v8 = @"SAVE_IN_HEALTH_UNTIL_I_DELETE_FOOTER_TEXT";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_C3E8 table:@"Privacy"];
  [(PSSpecifier *)v5 setProperty:v9 forKey:PSFooterTextGroupKey];

  v10 = self->_saveInHealthGroup;

  [(HKHeadphonePrivacyController *)self reloadSpecifier:v10];
}

- (void)_setInterruptionBehaviorSettingForSpecifier:(id)a3
{
  v4 = [a3 identifier];
  v5 = [(PSSpecifier *)self->_forEightDaysCell identifier];
  id v6 = [v4 isEqualToString:v5];

  _HKInitializeLogging();
  v7 = (void *)HKLogHearing;
  if (os_log_type_enabled(HKLogHearing, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = v7;
    *(_DWORD *)v14 = 138543619;
    *(void *)&v14[4] = objc_opt_class();
    *(_WORD *)&v14[12] = 1025;
    *(_DWORD *)&v14[14] = v6;
    id v9 = *(id *)&v14[4];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting pruning preference to: %{private}d", v14, 0x12u);
  }
  manager = self->_manager;
  uint64_t v11 = ADAFPreferenceKeyHAESampleTransient;
  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6, *(_OWORD *)v14, *(void *)&v14[16]);
  id v13 = [(ADASManager *)manager setNanoPreferenceFor:v11 value:v12];

  [(HKHeadphonePrivacyController *)self _updateSpecifiersForPruningPreference:v6];
}

- (id)preferenceValue:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [(PSSpecifier *)self->_measureLevelsSwitch identifier];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    CFStringRef v8 = [(ADASManager *)self->_manager getNanoPreferenceFor:ADAFPreferenceKeyHAEEnableHKWrite];
    self->_otherSectionEnabled = [v8 BOOLValue];
    [(HKHeadphonePrivacyController *)self toggleSecondSection];
  }
  else
  {
    id v9 = [v4 identifier];
    v10 = [(PSSpecifier *)self->_otherHeadphonesSwitch identifier];
    unsigned int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [(ADASManager *)self->_manager getNanoPreferenceFor:ADAFPreferenceKeyHAEEnableOtherDevices];
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)HKHeadphonePrivacyController;
      uint64_t v12 = [(HKHeadphonePrivacyController *)&v14 readPreferenceValue:v4];
    }
    CFStringRef v8 = (void *)v12;
  }

  return v8;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [v7 identifier];
  id v9 = [(PSSpecifier *)self->_measureLevelsSwitch identifier];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    _HKInitializeLogging();
    unsigned int v11 = (void *)HKLogHearing;
    if (os_log_type_enabled(HKLogHearing, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      id v13 = objc_opt_class();
      id v14 = v13;
      *(_DWORD *)buf = 138543619;
      v26 = v13;
      __int16 v27 = 1025;
      unsigned int v28 = [v6 BOOLValue];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting measure levels preference to: %{private}d", buf, 0x12u);
    }
    id v15 = [(ADASManager *)self->_manager setNanoPreferenceFor:ADAFPreferenceKeyHAEEnableHKWrite value:v6];
    self->_otherSectionEnabled = [v6 BOOLValue];
    [(HKHeadphonePrivacyController *)self toggleSecondSection];
  }
  else
  {
    v16 = [v7 identifier];
    v17 = [(PSSpecifier *)self->_otherHeadphonesSwitch identifier];
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v18)
    {
      _HKInitializeLogging();
      v19 = (void *)HKLogHearing;
      if (os_log_type_enabled(HKLogHearing, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = objc_opt_class();
        id v22 = v21;
        *(_DWORD *)buf = 138543619;
        v26 = v21;
        __int16 v27 = 1025;
        unsigned int v28 = [v6 BOOLValue];
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting measure levels (other devices) preference to: %{private}d", buf, 0x12u);
      }
      id v23 = [(ADASManager *)self->_manager setNanoPreferenceFor:ADAFPreferenceKeyHAEEnableOtherDevices value:v6];
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)HKHeadphonePrivacyController;
      [(HKHeadphonePrivacyController *)&v24 setPreferenceValue:v6 specifier:v7];
    }
  }
}

- (void)toggleSecondSection
{
  BOOL otherSectionEnabled = self->_otherSectionEnabled;
  otherHeadphonesSwitch = self->_otherHeadphonesSwitch;
  if (otherSectionEnabled) {
    v5 = &__kCFBooleanTrue;
  }
  else {
    v5 = &__kCFBooleanFalse;
  }
  [(PSSpecifier *)otherHeadphonesSwitch setProperty:v5 forKey:PSEnabledKey];
  id v6 = self->_otherHeadphonesSwitch;

  [(HKHeadphonePrivacyController *)self reloadSpecifier:v6];
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

- (BOOL)otherSectionEnabled
{
  return self->_otherSectionEnabled;
}

- (void)setOtherSectionEnabled:(BOOL)a3
{
  self->_BOOL otherSectionEnabled = a3;
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