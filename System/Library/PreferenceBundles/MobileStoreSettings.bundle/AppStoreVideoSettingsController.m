@interface AppStoreVideoSettingsController
- (AppStoreVideoSettingsController)init;
- (id)_autoPlayVideoSetting;
- (id)specifiers;
- (void)_setAutoPlayVideoSetting:(id)a3;
- (void)_updateSpecifierValues;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AppStoreVideoSettingsController

- (AppStoreVideoSettingsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppStoreVideoSettingsController;
  return [(AppStoreVideoSettingsController *)&v3 init];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v25 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier groupSpecifierWithID:@"AUTO_PLAY_VIDEO_MODE"];
    v6 = +[NSNumber numberWithBool:1];
    [v5 setProperty:v6 forKey:PSIsRadioGroupKey];

    LODWORD(v6) = MGGetBoolAnswer();
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = v7;
    if (v6) {
      CFStringRef v9 = @"AUTO_PLAY_VIDEO_MODE_DESCRIPTION_WLAN";
    }
    else {
      CFStringRef v9 = @"AUTO_PLAY_VIDEO_MODE_DESCRIPTION_WIFI";
    }
    v10 = [v7 localizedStringForKey:v9 value:&stru_14C40 table:@"StoreSettings"];
    [v5 setProperty:v10 forKey:PSFooterTextGroupKey];

    [v25 addObject:v5];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"AUTO_PLAY_VIDEO_MODE_ON" value:&stru_14C40 table:@"StoreSettings"];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_setAutoPlayVideoSetting:" get:0 detail:0 cell:3 edit:0];

    [v13 setIdentifier:@"AUTO_PLAY_ON"];
    [v25 addObject:v13];
    int v14 = MGGetBoolAnswer();
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = v15;
    if (v14) {
      CFStringRef v17 = @"AUTO_PLAY_VIDEO_MODE_WLAN_ONLY";
    }
    else {
      CFStringRef v17 = @"AUTO_PLAY_VIDEO_MODE_WIFI_ONLY";
    }
    v18 = [v15 localizedStringForKey:v17 value:&stru_14C40 table:@"StoreSettings"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"_setAutoPlayVideoSetting:" get:0 detail:0 cell:3 edit:0];

    [v19 setIdentifier:@"AUTO_PLAY_WIFI_ONLY"];
    [v25 addObject:v19];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"AUTO_PLAY_VIDEO_MODE_OFF" value:&stru_14C40 table:@"StoreSettings"];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"_setAutoPlayVideoSetting:" get:0 detail:0 cell:3 edit:0];

    [v22 setIdentifier:@"AUTO_PLAY_OFF"];
    [v25 addObject:v22];
    v23 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v25;

    [(AppStoreVideoSettingsController *)self _updateSpecifierValues];
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AppStoreVideoSettingsController;
  [(AppStoreVideoSettingsController *)&v4 viewWillAppear:a3];
  [(AppStoreVideoSettingsController *)self _updateSpecifierValues];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AppStoreVideoSettingsController;
  [(AppStoreVideoSettingsController *)&v15 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(AppStoreVideoSettingsController *)self specifierAtIndex:[(AppStoreVideoSettingsController *)self indexForIndexPath:v7]];
  CFStringRef v9 = v8;
  if (*(void *)&v8[OBJC_IVAR___PSSpecifier_cellType] == 3)
  {
    v10 = [v8 target];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [v9 target];
      v13 = (void (*)(id, void, char *))[v12 methodForSelector:*(void *)&v9[OBJC_IVAR___PSSpecifier_setter]];

      id WeakRetained = objc_loadWeakRetained((id *)&v9[OBJC_IVAR___PSSpecifier_target]);
      v13(WeakRetained, *(void *)&v9[OBJC_IVAR___PSSpecifier_setter], v9);
    }
  }
}

- (id)_autoPlayVideoSetting
{
  v2 = (void *)CFPreferencesCopyAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, kSSAppStoreUserDefaultsIdentifier);

  return v2;
}

- (void)_setAutoPlayVideoSetting:(id)a3
{
  id v4 = a3;
  id v11 = [(AppStoreVideoSettingsController *)self specifierForID:@"AUTO_PLAY_VIDEO_MODE"];
  [v11 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];
  v5 = [v4 identifier];

  if ([v5 isEqualToString:@"AUTO_PLAY_ON"])
  {
    id v6 = (id *)&SSAutoPlayVideoSettingOn;
LABEL_7:
    id v7 = *v6;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"AUTO_PLAY_WIFI_ONLY"])
  {
    id v6 = (id *)&SSAutoPlayVideoSettingWIFIOnly;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"AUTO_PLAY_OFF"])
  {
    id v6 = (id *)&SSAutoPlayVideoSettingOff;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_8:
  CFStringRef v8 = (const __CFString *)kSSAppStoreUserDefaultsIdentifier;
  CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, v7, kSSAppStoreUserDefaultsIdentifier);
  CFStringRef v9 = (const __CFString *)kSSUserDefaultsKeyLastMotionAutoPlayVideoValue;
  if (UIAccessibilityIsVideoAutoplayEnabled()) {
    CFBooleanRef v10 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v10 = kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(v9, v10, v8);
  CFPreferencesSetAppValue(kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue, kCFBooleanFalse, v8);
  CFPreferencesSetAppValue(kSSUserDefaultsKeyUserSetAutoPlayVideoSetting, kCFBooleanTrue, v8);
  CFPreferencesSetAppValue(kSSUserDefaultsKeyLastUserSetAutoPlayVideoValue, v7, v8);
  CFPreferencesAppSynchronize(v8);
}

- (void)_updateSpecifierValues
{
  id v6 = [(AppStoreVideoSettingsController *)self specifierForID:@"AUTO_PLAY_VIDEO_MODE"];
  uint64_t v3 = [(AppStoreVideoSettingsController *)self _autoPlayVideoSetting];
  if ([v3 isEqualToString:SSAutoPlayVideoSettingOn])
  {
    CFStringRef v4 = @"AUTO_PLAY_ON";
LABEL_7:
    v5 = [(AppStoreVideoSettingsController *)self specifierForID:v4];
    [v6 setProperty:v5 forKey:PSRadioGroupCheckedSpecifierKey];

    goto LABEL_8;
  }
  if ([v3 isEqualToString:SSAutoPlayVideoSettingWIFIOnly])
  {
    CFStringRef v4 = @"AUTO_PLAY_WIFI_ONLY";
    goto LABEL_7;
  }
  if ([v3 isEqualToString:SSAutoPlayVideoSettingOff])
  {
    CFStringRef v4 = @"AUTO_PLAY_OFF";
    goto LABEL_7;
  }
  [v6 removePropertyForKey:PSRadioGroupCheckedSpecifierKey];
LABEL_8:
}

@end