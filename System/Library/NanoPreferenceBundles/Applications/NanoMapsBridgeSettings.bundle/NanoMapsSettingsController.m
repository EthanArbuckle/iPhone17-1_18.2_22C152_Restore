@interface NanoMapsSettingsController
- (NanoMapsSettingsController)initWithCoder:(id)a3;
- (NanoMapsSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_carPlayDrivingTurnAlertsEnabled:(id)a3;
- (id)_cyclingTurnAlertsEnabled:(id)a3;
- (id)_drivingTurnAlertsEnabled:(id)a3;
- (id)_legacyTurnAlertsEnabled:(id)a3;
- (id)_transitTurnAlertsEnabled:(id)a3;
- (id)_turnAlertsEnabled:(id)a3;
- (id)_walkingTurnAlertsEnabled:(id)a3;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)localizedPaneTitle;
- (void)_createSpecifiers;
- (void)_setCarPlayDrivingTurnAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)_setCyclingTurnAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)_setDrivingTurnAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)_setLegacyTurnAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)_setTransitTurnAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)_setTurnAlertsEnabled:(id)a3 forKey:(id)a4;
- (void)_setWalkingTurnAlertsEnabled:(id)a3 specifier:(id)a4;
@end

@implementation NanoMapsSettingsController

- (NanoMapsSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NanoMapsSettingsController;
  v4 = [(NanoMapsSettingsController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(NanoMapsSettingsController *)v4 _createSpecifiers];
  }
  return v5;
}

- (NanoMapsSettingsController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NanoMapsSettingsController;
  v3 = [(NanoMapsSettingsController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NanoMapsSettingsController *)v3 _createSpecifiers];
  }
  return v4;
}

- (void)_createSpecifiers
{
  v3 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v4 = [v3 localizedStringForKey:@"Turn Alerts [Bridge Title]" value:@"localized string not found" table:0];
  v5 = +[PSSpecifier groupSpecifierWithName:v4];
  turnAlertsGroup = self->_turnAlertsGroup;
  self->_turnAlertsGroup = v5;

  objc_super v7 = self->_turnAlertsGroup;
  v8 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v9 = [v8 localizedStringForKey:@"Turn Alerts Description [Bridge]" value:@"localized string not found" table:0];
  uint64_t v10 = PSFooterTextGroupKey;
  [(PSSpecifier *)v7 setProperty:v9 forKey:PSFooterTextGroupKey];

  v11 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v12 = [v11 localizedStringForKey:@"Show Navigation [Bridge]" value:@"localized string not found" table:0];
  v13 = +[PSSpecifier groupSpecifierWithName:v12];
  showNavGroup = self->_showNavGroup;
  self->_showNavGroup = v13;

  v15 = self->_showNavGroup;
  v16 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v17 = [v16 localizedStringForKey:@"Show Navigation Description [Bridge]" value:@"localized string not found" table:0];
  [(PSSpecifier *)v15 setProperty:v17 forKey:v10];

  v18 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v19 = [v18 localizedStringForKey:@"Turn Alerts [Bridge Switch]" value:@"localized string not found" table:0];
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"_setLegacyTurnAlertsEnabled:specifier:" get:"_legacyTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  legacyAlertSwitch = self->_legacyAlertSwitch;
  self->_legacyAlertSwitch = v20;

  v22 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v23 = [v22 localizedStringForKey:@"Driving [Bridge]" value:@"localized string not found" table:0];
  v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"_setDrivingTurnAlertsEnabled:specifier:" get:"_drivingTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  drivingAlertSwitch = self->_drivingAlertSwitch;
  self->_drivingAlertSwitch = v24;

  v26 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v27 = [v26 localizedStringForKey:@"Driving with CarPlay [Bridge]" value:@"localized string not found" table:0];
  v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"_setCarPlayDrivingTurnAlertsEnabled:specifier:" get:"_carPlayDrivingTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  carPlayDrivingAlertSwitch = self->_carPlayDrivingAlertSwitch;
  self->_carPlayDrivingAlertSwitch = v28;

  v30 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v31 = [v30 localizedStringForKey:@"Walking [Bridge]" value:@"localized string not found" table:0];
  v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:"_setWalkingTurnAlertsEnabled:specifier:" get:"_walkingTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  walkingAlertSwitch = self->_walkingAlertSwitch;
  self->_walkingAlertSwitch = v32;

  v34 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v35 = [v34 localizedStringForKey:@"Transit [Bridge]" value:@"localized string not found" table:0];
  v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:"_setTransitTurnAlertsEnabled:specifier:" get:"_transitTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  transitAlertSwitch = self->_transitAlertSwitch;
  self->_transitAlertSwitch = v36;

  v38 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v39 = [v38 localizedStringForKey:@"Cycling [Bridge]" value:@"localized string not found" table:0];
  v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:"_setCyclingTurnAlertsEnabled:specifier:" get:"_cyclingTurnAlertsEnabled:" detail:0 cell:6 edit:0];
  cyclingAlertSwitch = self->_cyclingAlertSwitch;
  self->_cyclingAlertSwitch = v40;

  id v45 = +[NanoMapsSettingsManager stringForKey:@"Build_Info"];
  v42 = +[GEOPlatform sharedPlatform];
  LODWORD(v38) = [v42 isInternalInstall];

  if (v38 && v45)
  {
    v43 = +[PSSpecifier groupSpecifierWithName:@"Build Info:"];
    buildInfoGroup = self->_buildInfoGroup;
    self->_buildInfoGroup = v43;

    [(PSSpecifier *)self->_buildInfoGroup setProperty:v45 forKey:v10];
  }
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:NSClassFromString(@"NanoMapsSettingsController")];
  v3 = [v2 localizedStringForKey:@"Maps [Bridge]" value:@"localized string not found" table:0];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.NanoMaps";
}

- (id)applicationGroupSpecifiers
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = [v3 getActivePairedDevice];

  v5 = [v4 valueForProperty:NRDevicePropertySystemVersion];
  objc_super v6 = [v5 componentsSeparatedByString:@"."];

  if ([v6 count]
    && ([v6 firstObject],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 integerValue],
        v7,
        (uint64_t)v8 >= 5))
  {
    drivingAlertSwitch = self->_drivingAlertSwitch;
    v18[0] = self->_turnAlertsGroup;
    v18[1] = drivingAlertSwitch;
    walkingAlertSwitch = self->_walkingAlertSwitch;
    v18[2] = self->_carPlayDrivingAlertSwitch;
    v18[3] = walkingAlertSwitch;
    showNavGroup = self->_showNavGroup;
    v18[4] = self->_cyclingAlertSwitch;
    v18[5] = showNavGroup;
    v18[6] = self->_transitAlertSwitch;
    v12 = +[NSArray arrayWithObjects:v18 count:7];
    v13 = v12;
    if (self->_buildInfoGroup)
    {
      uint64_t v14 = objc_msgSend(v12, "arrayByAddingObject:");

      v13 = (void *)v14;
    }
  }
  else
  {
    legacyAlertSwitch = self->_legacyAlertSwitch;
    v17[0] = self->_turnAlertsGroup;
    v17[1] = legacyAlertSwitch;
    v13 = +[NSArray arrayWithObjects:v17 count:2];
  }

  return v13;
}

- (void)_setTurnAlertsEnabled:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = MAPSGetTurnAlertsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[NanoMaps] Setting turn alerts %@ to %@", (uint8_t *)&v8, 0x16u);
  }

  +[NanoMapsSettingsManager setBool:forKey:](NanoMapsSettingsManager, "setBool:forKey:", [v5 BOOLValue], v6);
}

- (id)_turnAlertsEnabled:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NanoMapsSettingsManager BOOLForKey:defaultValue:](NanoMapsSettingsManager, "BOOLForKey:defaultValue:", v3, +[NanoMapsSettingsManager BOOLForKey:@"turnAlertsEnabled" defaultValue:1]);

  return +[NSNumber numberWithBool:v4];
}

- (void)_setLegacyTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
}

- (id)_legacyTurnAlertsEnabled:(id)a3
{
  BOOL v3 = +[NanoMapsSettingsManager BOOLForKey:@"turnAlertsEnabled" defaultValue:1];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setDrivingTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(NanoMapsSettingsController *)self _setTurnAlertsEnabled:v5 forKey:@"drivingTurnAlertsEnabled"];
  unsigned int v6 = [v5 BOOLValue];

  +[NanoMapsSettingsManager setBool:v6 ^ 1 forKey:@"navVoiceMutedForDrivingTurnAlerts"];
}

- (id)_drivingTurnAlertsEnabled:(id)a3
{
  return [(NanoMapsSettingsController *)self _turnAlertsEnabled:@"drivingTurnAlertsEnabled"];
}

- (void)_setCarPlayDrivingTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(NanoMapsSettingsController *)self _setTurnAlertsEnabled:v5 forKey:@"carPlayDrivingTurnAlertsEnabled"];
  unsigned int v6 = [v5 BOOLValue];

  +[NanoMapsSettingsManager setBool:v6 ^ 1 forKey:@"navVoiceMutedForCarPlayDrivingTurnAlerts"];
}

- (id)_carPlayDrivingTurnAlertsEnabled:(id)a3
{
  return [(NanoMapsSettingsController *)self _turnAlertsEnabled:@"carPlayDrivingTurnAlertsEnabled"];
}

- (void)_setWalkingTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(NanoMapsSettingsController *)self _setTurnAlertsEnabled:v5 forKey:@"walkingTurnAlertsEnabled"];
  unsigned int v6 = [v5 BOOLValue];

  +[NanoMapsSettingsManager setBool:v6 ^ 1 forKey:@"navVoiceMutedForWalkingTurnAlerts"];
}

- (id)_walkingTurnAlertsEnabled:(id)a3
{
  return [(NanoMapsSettingsController *)self _turnAlertsEnabled:@"walkingTurnAlertsEnabled"];
}

- (void)_setTransitTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(NanoMapsSettingsController *)self _setTurnAlertsEnabled:v5 forKey:@"transitTurnAlertsEnabled"];
  unsigned int v6 = [v5 BOOLValue];

  +[NanoMapsSettingsManager setBool:v6 ^ 1 forKey:@"navVoiceMutedForTransitTurnAlerts"];
}

- (id)_transitTurnAlertsEnabled:(id)a3
{
  return [(NanoMapsSettingsController *)self _turnAlertsEnabled:@"transitTurnAlertsEnabled"];
}

- (void)_setCyclingTurnAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(NanoMapsSettingsController *)self _setTurnAlertsEnabled:v5 forKey:@"cyclingTurnAlertsEnabled"];
  unsigned int v6 = [v5 BOOLValue];

  +[NanoMapsSettingsManager setBool:v6 ^ 1 forKey:@"navVoiceMutedForCyclingTurnAlerts"];
}

- (id)_cyclingTurnAlertsEnabled:(id)a3
{
  return [(NanoMapsSettingsController *)self _turnAlertsEnabled:@"cyclingTurnAlertsEnabled"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildInfoGroup, 0);
  objc_storeStrong((id *)&self->_cyclingAlertSwitch, 0);
  objc_storeStrong((id *)&self->_transitAlertSwitch, 0);
  objc_storeStrong((id *)&self->_walkingAlertSwitch, 0);
  objc_storeStrong((id *)&self->_carPlayDrivingAlertSwitch, 0);
  objc_storeStrong((id *)&self->_drivingAlertSwitch, 0);
  objc_storeStrong((id *)&self->_legacyAlertSwitch, 0);
  objc_storeStrong((id *)&self->_showNavGroup, 0);

  objc_storeStrong((id *)&self->_turnAlertsGroup, 0);
}

@end