@interface MapsSettingsTransitController
- (BOOL)_isModeDisabled:(unint64_t)a3;
- (BOOL)wantsUniqueEntityUpdateNotifications;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_configureCell:(id)a3 forTransitSpecifier:(id)a4;
- (void)_toggleMode:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MapsSettingsTransitController

- (BOOL)wantsUniqueEntityUpdateNotifications
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MapsSettingsTransitController;
  id v6 = a4;
  [(MapsSettingsTransitController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[MapsSettingsTransitController indexForIndexPath:](self, "indexForIndexPath:", v6, v11.receiver, v11.super_class);

  v8 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndexedSubscript:v7];
  v9 = [v8 propertyForKey:PSValueKey];
  v10 = v9;
  if (v9)
  {
    -[MapsSettingsTransitController _toggleMode:](self, "_toggleMode:", [v9 integerValue]);
    [(MapsSettingsTransitController *)self reloadSpecifiers];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MapsSettingsTransitController;
  id v6 = a4;
  id v7 = [(MapsSettingsTransitController *)&v11 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[MapsSettingsTransitController indexForIndexPath:](self, "indexForIndexPath:", v6, v11.receiver, v11.super_class);

  v9 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndexedSubscript:v8];
  [(MapsSettingsTransitController *)self _configureCell:v7 forTransitSpecifier:v9];

  return v7;
}

- (void)_configureCell:(id)a3 forTransitSpecifier:(id)a4
{
  uint64_t v5 = PSValueKey;
  id v6 = a3;
  id v13 = [a4 propertyForKey:v5];
  id v7 = [v13 integerValue];
  id v8 = +[MapsSettings valueForDefaultsKey:@"DefaultDisabledTransitModesKey"];
  char v9 = ~[v8 integerValue];

  if (v13) {
    BOOL v10 = (v9 & 0xF) == (void)v7;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = !v10;
  if (v10)
  {
    v12 = +[UIColor grayColor];
    [v6 setTintColor:v12];
  }
  else
  {
    [v6 setTintColor:0];
  }
  [v6 setUserInteractionEnabled:v11];
}

- (BOOL)_isModeDisabled:(unint64_t)a3
{
  v4 = +[MapsSettings valueForDefaultsKey:@"DefaultDisabledTransitModesKey"];
  unint64_t v5 = (unint64_t)[v4 integerValue] & 0xF;

  return +[TransitPreferences isModeDisabled:a3 inModes:v5];
}

- (void)_toggleMode:(unint64_t)a3
{
  v4 = +[MapsSettings valueForDefaultsKey:@"DefaultDisabledTransitModesKey"];
  unint64_t v5 = (unint64_t)[v4 integerValue] & 0xF;

  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[TransitPreferences disabledModesByTogglingMode:a3 inModes:v5]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MapsSettings setValue:v6 forDefaultsKey:@"DefaultDisabledTransitModesKey" bundleID:0 syncToNano:1];
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[TransitPreferencesText headerTextForDisabledModes];
  unint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  id v6 = +[TransitPreferencesText footerTextForDisabledModes];
  [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v5];
  if (qword_8E2B8 != -1) {
    dispatch_once(&qword_8E2B8, &stru_72788);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)qword_8E2B0;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    v24 = v5;
    char v9 = 0;
    uint64_t v28 = *(void *)v30;
    uint64_t v27 = PSIconImageKey;
    uint64_t v26 = PSValueKey;
    uint64_t v10 = PSAccessoryKey;
    do
    {
      uint64_t v11 = 0;
      v12 = v9;
      do
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v13 = (char *)[*(id *)(*((void *)&v29 + 1) + 8 * (void)v11) integerValue];
        uint64_t v14 = (uint64_t)v13;
        if ((unint64_t)(v13 - 1) > 7) {
          v15 = 0;
        }
        else {
          v15 = off_727A8[(void)(v13 - 1)];
        }
        v16 = +[NSBundle bundleForClass:objc_opt_class()];
        v17 = +[UIImage imageNamed:v15 inBundle:v16];

        v18 = MapsTransitModesLocalizedLongNameForIndividualMode(v14);
        char v9 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

        [v9 setProperty:v17 forKey:v27];
        v19 = +[NSNumber numberWithUnsignedInteger:v14];
        [v9 setProperty:v19 forKey:v26];

        if ([(MapsSettingsTransitController *)self _isModeDisabled:v14]) {
          v20 = &off_7CC58;
        }
        else {
          v20 = &off_7CC70;
        }
        [v9 setProperty:v20 forKey:v10];
        [v3 addObject:v9];

        uint64_t v11 = (char *)v11 + 1;
        v12 = v9;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);

    unint64_t v5 = v24;
  }
  v21 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v22 = [v21 localizedStringForKey:@"Transit" value:@"localized string not found" table:0];

  [(MapsSettingsTransitController *)self setSpecifiers:v3];

  return v3;
}

@end