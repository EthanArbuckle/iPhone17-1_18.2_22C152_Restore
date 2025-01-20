@interface MapsSettingsNavigationGuidanceController
- (BOOL)wantsUniqueEntityUpdateNotifications;
- (id)_enableScreenWakes:(id)a3;
- (id)_pauseSpokenAudio:(id)a3;
- (id)_specifierIDForVoiceVolume:(id)a3;
- (id)_useHFP:(id)a3;
- (id)specifiers;
- (void)_setEnableScreenWakes:(id)a3 specifier:(id)a4;
- (void)_setPauseSpokenAudio:(id)a3 specifier:(id)a4;
- (void)_setUseHFP:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MapsSettingsNavigationGuidanceController

- (BOOL)wantsUniqueEntityUpdateNotifications
{
  return 1;
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = *(void **)(&self->super + 1);
  *(void *)(&self->super + 1) = v4;

  v6 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v7 = [v6 localizedStringForKey:@"Voice Volume [Settings]" value:@"localized string not found" table:0];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  v61 = v8;
  [v3 addObject:v8];
  v9 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v10 = [v9 localizedStringForKey:@"Voice Volume Soft [Settings]" value:@"localized string not found" table:0];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v12 = PSIDKey;
  [v11 setProperty:@"NavigationVoiceVolumeSoftID" forKey:PSIDKey];
  uint64_t v13 = PSValueKey;
  [v11 setProperty:&off_7CCE8 forKey:PSValueKey];
  [v3 addObject:v11];
  [*(id *)(&self->super + 1) addObject:v11];
  v14 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v15 = [v14 localizedStringForKey:@"Voice Volume Normal [Settings]" value:@"localized string not found" table:0];
  v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v16 setProperty:@"NavigationVoiceVolumeNormalID" forKey:v12];
  [v16 setProperty:&off_7CD00 forKey:v13];
  [v3 addObject:v16];
  [*(id *)(&self->super + 1) addObject:v16];
  v17 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v18 = [v17 localizedStringForKey:@"Voice Volume Loud [Settings]" value:@"localized string not found" table:0];
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v59 = v12;
  [v19 setProperty:@"NavigationVoiceVolumeLoudID" forKey:v12];
  uint64_t v64 = v13;
  [v19 setProperty:&off_7CD18 forKey:v13];
  [v3 addObject:v19];
  [*(id *)(&self->super + 1) addObject:v19];
  v20 = +[PSSpecifier groupSpecifierWithID:@"PauseSpokenAudioGroupID"];
  [v3 addObject:v20];
  v21 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v22 = [v21 localizedStringForKey:@"Pause Spoken Audio Footer [Settings]" value:@"localized string not found" table:0];
  v60 = v20;
  uint64_t v62 = PSFooterTextGroupKey;
  objc_msgSend(v20, "setProperty:forKey:", v22);

  v23 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v24 = [v23 localizedStringForKey:@"Pause Spoken Audio Label [Settings]" value:@"localized string not found" table:0];
  v63 = self;
  v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"_setPauseSpokenAudio:specifier:" get:"_pauseSpokenAudio:" detail:0 cell:6 edit:0];

  if (qword_8E2D8 != -1) {
    dispatch_once(&qword_8E2D8, &stru_728C0);
  }
  v26 = [(id)qword_8E2D0 path];
  v27 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v27)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v27 BOOLValue];
      GEOConfigSetBOOL();
    }
    v28 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v28 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id BOOL = [v27 BOOLValue];
  }
  else
  {
    id BOOL = (id)GEOConfigGetBOOL();
  }
  id v30 = BOOL;

  v31 = +[NSNumber numberWithBool:v30];
  [v25 setProperty:v31 forKey:v64];

  uint64_t v32 = PSAllowMultilineTitleKey;
  [v25 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v3 addObject:v25];
  v33 = +[PSSpecifier groupSpecifierWithID:@"LockscreenSettingsGroupID"];
  [v3 addObject:v33];
  v34 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v35 = [v34 localizedStringForKey:@"Directions Wake Device Footer [Settings]" value:@"localized string not found" table:0];
  v58 = v33;
  [v33 setProperty:v35 forKey:v62];

  v36 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v37 = [v36 localizedStringForKey:@"Directions Wake Device Label [Settings]" value:@"localized string not found" table:0];
  v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:v63 set:"_setEnableScreenWakes:specifier:" get:"_enableScreenWakes:" detail:0 cell:6 edit:0];

  [v38 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  uint64_t v57 = v32;
  [v38 setProperty:&__kCFBooleanTrue forKey:v32];
  [v38 setProperty:@"NavigationPromptsUndimScreen" forKey:v59];
  [v38 setProperty:@"NavigationPromptsUndimScreen" forKey:v64];
  [v38 setProperty:GEODefaultsDomain() forKey:@"MapsSettingsSpecifierBundleID"];
  [v3 addObject:v38];
  v39 = +[PSSpecifier groupSpecifierWithID:@"UseHFPWhenAvailableGroupSpec"];
  [v3 addObject:v39];
  v40 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v41 = [v40 localizedStringForKey:@"Directions on Radio Footer [Settings]" value:@"localized string not found" table:0];
  [v39 setProperty:v41 forKey:v62];

  v42 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v43 = [v42 localizedStringForKey:@"Directions on Radio Label [Settings]" value:@"localized string not found" table:0];
  v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:v63 set:"_setUseHFP:specifier:" get:"_useHFP:" detail:0 cell:6 edit:0];

  if (qword_8E2D8 != -1) {
    dispatch_once(&qword_8E2D8, &stru_728C0);
  }
  v45 = [(id)qword_8E2D0 path];
  v46 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v46)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v46 BOOLValue];
      GEOConfigSetBOOL();
    }
    v47 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v47 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id v48 = [v46 BOOLValue];
  }
  else
  {
    id v48 = (id)GEOConfigGetBOOL();
  }
  id v49 = v48;

  v50 = +[NSNumber numberWithBool:v49];
  [v44 setProperty:v50 forKey:v64];

  [v44 setProperty:&__kCFBooleanTrue forKey:v57];
  [v3 addObject:v44];
  [(MapsSettingsNavigationGuidanceController *)v63 setSpecifiers:v3];
  v51 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v52 = [v51 localizedStringForKey:@"Navigation Guidance" value:@"localized string not found" table:0];

  v53 = +[NSNumber numberWithInteger:GEOConfigGetInteger()];
  v54 = [(MapsSettingsNavigationGuidanceController *)v63 _specifierIDForVoiceVolume:v53];
  v55 = [(MapsSettingsNavigationGuidanceController *)v63 specifierForID:v54];
  [v61 setProperty:v55 forKey:PSRadioGroupCheckedSpecifierKey];

  return v3;
}

- (id)_useHFP:(id)a3
{
  id v3 = a3;
  if (qword_8E2D8 != -1) {
    dispatch_once(&qword_8E2D8, &stru_728C0);
  }
  id v4 = [(id)qword_8E2D0 path];
  v5 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v5)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v5 BOOLValue];
      GEOConfigSetBOOL();
    }
    v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v6 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id BOOL = [v5 BOOLValue];
  }
  else
  {
    id BOOL = (id)GEOConfigGetBOOL();
  }
  id v8 = BOOL;

  v9 = +[NSNumber numberWithBool:v8];

  return v9;
}

- (void)_setUseHFP:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_pauseSpokenAudio:(id)a3
{
  id v3 = a3;
  if (qword_8E2D8 != -1) {
    dispatch_once(&qword_8E2D8, &stru_728C0);
  }
  id v4 = [(id)qword_8E2D0 path];
  v5 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v5)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v5 BOOLValue];
      GEOConfigSetBOOL();
    }
    v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v6 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id BOOL = [v5 BOOLValue];
  }
  else
  {
    id BOOL = (id)GEOConfigGetBOOL();
  }
  id v8 = BOOL;

  v9 = +[NSNumber numberWithBool:v8];

  return v9;
}

- (void)_setPauseSpokenAudio:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];

  GEOConfigSetBOOL();
}

- (id)_enableScreenWakes:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", MapsConfig_NavigationPromptsUndimScreen, off_8B780);
}

- (void)_setEnableScreenWakes:(id)a3 specifier:(id)a4
{
}

- (id)_specifierIDForVoiceVolume:(id)a3
{
  id v3 = (char *)[a3 integerValue];
  CFStringRef v4 = @"NavigationVoiceVolumeNormalID";
  if (v3 == (unsigned char *)&dword_0 + 2) {
    CFStringRef v4 = @"NavigationVoiceVolumeLoudID";
  }
  if (v3) {
    return (id)v4;
  }
  else {
    return @"NavigationVoiceVolumeSoftID";
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MapsSettingsNavigationGuidanceController;
  [(MapsSettingsNavigationGuidanceController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(MapsSettingsNavigationGuidanceController *)self indexForIndexPath:v6];
  id v8 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndexedSubscript:v7];
  v9 = [v8 propertyForKey:PSValueKey];
  if ([*(id *)(&self->super + 1) containsObject:v8])
  {
    +[MapsSettings setValue:v9 forDefaultsKey:@"NavVolumeSettingSpokenVoiceVolume" bundleID:0 syncToNano:0];
    [v6 row];
    GEOConfigSetInteger();
  }
}

- (void).cxx_destruct
{
}

@end