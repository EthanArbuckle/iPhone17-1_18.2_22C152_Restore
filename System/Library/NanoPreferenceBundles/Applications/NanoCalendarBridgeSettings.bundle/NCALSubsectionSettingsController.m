@interface NCALSubsectionSettingsController
- (id)_showAlerts:(id)a3;
- (id)_sound:(id)a3;
- (id)_subsectionId;
- (id)_vibration:(id)a3;
- (id)specifiers;
- (void)_setShowAlerts:(id)a3 withSpecifier:(id)a4;
- (void)_setSound:(id)a3 withSpecifier:(id)a4;
- (void)_setVibration:(id)a3 withSpecifier:(id)a4;
@end

@implementation NCALSubsectionSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    v7 = [v6 objectForKeyedSubscript:@"SpecifierUserInfoShowAlertString"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setShowAlerts:withSpecifier:" get:"_showAlerts:" detail:0 cell:6 edit:0];

    uint64_t v9 = PSAllowMultilineTitleKey;
    [v8 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v5 addObject:v8];
    v10 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v10];
    v11 = [(NCALSubsectionSettingsController *)self _showAlerts:v8];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      v13 = v5;
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"SOUND" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"_setSound:withSpecifier:" get:"_sound:" detail:0 cell:6 edit:0];

      [v16 setProperty:&__kCFBooleanTrue forKey:v9];
      [v13 addObject:v16];
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"VIBRATION" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
      v8 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"_setVibration:withSpecifier:" get:"_vibration:" detail:0 cell:6 edit:0];

      v5 = v13;
      [v8 setProperty:&__kCFBooleanTrue forKey:v9];
      [v13 addObject:v8];
    }
    id v19 = [v5 copy];
    v20 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v19;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_setShowAlerts:(id)a3 withSpecifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v6 = [(NCALSubsectionSettingsController *)self _subsectionId];
  [WeakRetained setShowAlerts:v5 forSubsectionId:v6];

  [(NCALSubsectionSettingsController *)self reloadSpecifiers];
}

- (id)_showAlerts:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  id v5 = [(NCALSubsectionSettingsController *)self _subsectionId];
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [WeakRetained showAlertsForSubsectionId:v5]);

  return v6;
}

- (void)_setSound:(id)a3 withSpecifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v7 = +[TLToneManager sharedToneManager];
  v6 = [(NCALSubsectionSettingsController *)self _subsectionId];
  [v7 _setCurrentToneWatchAlertPolicy:v5 forAlertType:10 accountIdentifier:v6];
}

- (id)_sound:(id)a3
{
  v4 = +[TLToneManager sharedToneManager];
  uint64_t v5 = [(NCALSubsectionSettingsController *)self _subsectionId];
  v6 = (char *)[v4 _currentToneWatchAlertPolicyForAlertType:10 accountIdentifier:v5];

  return +[NSNumber numberWithInt:v6 == (unsigned char *)&dword_0 + 1];
}

- (void)_setVibration:(id)a3 withSpecifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v7 = +[TLVibrationManager sharedVibrationManager];
  v6 = [(NCALSubsectionSettingsController *)self _subsectionId];
  [v7 _setCurrentVibrationWatchAlertPolicy:v5 forAlertType:10 accountIdentifier:v6];
}

- (id)_vibration:(id)a3
{
  v4 = +[TLVibrationManager sharedVibrationManager];
  uint64_t v5 = [(NCALSubsectionSettingsController *)self _subsectionId];
  v6 = (char *)[v4 _currentVibrationWatchAlertPolicyForAlertType:10 accountIdentifier:v5];

  return +[NSNumber numberWithInt:v6 == (unsigned char *)&dword_0 + 1];
}

- (id)_subsectionId
{
  v2 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"SpecifierUserInfoSubsectionID"];

  return v3;
}

@end