@interface GuidedAccessSecurityController
- (id)accessibilityPreferenceForSpecifier:(id)a3;
- (id)specifiers;
- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4;
@end

@implementation GuidedAccessSecurityController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(GuidedAccessSecurityController *)self loadSpecifiersFromPlistName:@"GuidedAccessSecuritySettings" target:self];
    id v6 = [v5 mutableCopy];

    int IsMultiUser = AXDeviceIsMultiUser();
    if (AXDeviceHasPearl() && (IsMultiUser & 1) == 0)
    {
      v8 = AXLocStringKeyForExclusiveModel();
      v9 = +[PSSpecifier emptyGroupSpecifier];
      v10 = settingsLocString(v8, @"Accessibility");
      [v9 setProperty:v10 forKey:PSFooterTextGroupKey];

      [v6 addObject:v9];
      v11 = settingsLocString(@"GUIDED_ACCESS_FACE_ID_SWITCH_TITLE", @"Accessibility");
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"accessibilitySetPreference:specifier:" get:"accessibilityPreferenceForSpecifier:" detail:0 cell:6 edit:0];

      [v12 setProperty:@"GAXTouchIDSwitch" forKey:PSIDKey];
      [v6 addObject:v12];
    }
    if (((MGGetBoolAnswer() ^ 1 | IsMultiUser) & 1) == 0)
    {
      v13 = +[PSSpecifier emptyGroupSpecifier];
      v14 = settingsLocString(@"GUIDED_ACCESS_TOUCH_ID_DESCRIPTION", @"GuidedAccessSecuritySettings");
      [v13 setProperty:v14 forKey:PSFooterTextGroupKey];

      [v6 addObject:v13];
      v15 = settingsLocString(@"GUIDED_ACCESS_TOUCH_ID_SWITCH_TITLE", @"GuidedAccessSecuritySettings");
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"accessibilitySetPreference:specifier:" get:"accessibilityPreferenceForSpecifier:" detail:0 cell:6 edit:0];

      [v16 setProperty:@"GAXTouchIDSwitch" forKey:PSIDKey];
      [v6 addObject:v16];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v6;
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      uint64_t v21 = PSAllowMultilineTitleKey;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)v22) setObject:&__kCFBooleanTrue forKeyedSubscript:v21];
          v22 = (char *)v22 + 1;
        }
        while (v19 != v22);
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v19);
    }

    id v23 = [v17 copy];
    v24 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v23;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)accessibilityPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = [a3 properties];
  v4 = [v3 objectForKey:PSIDKey];

  if ([v4 isEqualToString:@"GAXTouchIDSwitch"])
  {
    v5 = +[AXSettings sharedInstance];
    id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 guidedAccessAllowsUnlockWithTouchID]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  v5 = [a4 properties];
  id v6 = [v5 objectForKey:PSIDKey];

  if ([v6 isEqualToString:@"GAXTouchIDSwitch"])
  {
    id v7 = [v9 BOOLValue];
    v8 = +[AXSettings sharedInstance];
    [v8 setGuidedAccessAllowsUnlockWithTouchID:v7];
  }
}

@end