@interface AccessibilityAirPodChooserSettingsController
- (id)_deviceConnected:(id)a3;
- (id)specifiers;
@end

@implementation AccessibilityAirPodChooserSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[AXAirPodSettingsManager sharedInstance];
    v6 = [v5 disambiguationString];
    uint64_t v7 = +[PSSpecifier groupSpecifierWithName:v6];

    v20 = (void *)v7;
    [v4 addObject:v7];
    v8 = [(AccessibilityAirPodChooserSettingsController *)self specifier];
    v9 = [v8 propertyForKey:@"AirPods"];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = [v14 name];
          v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"_deviceConnected:" detail:objc_opt_class() cell:2 edit:0];

          v27 = v14;
          v17 = +[NSArray arrayWithObjects:&v27 count:1];
          [v16 setProperty:v17 forKey:@"AirPods"];

          [v4 addObject:v16];
        }
        id v11 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
    *(void *)&self->AXUISettingsBaseListController_opaque[v21] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
  }

  return v3;
}

- (id)_deviceConnected:(id)a3
{
  v3 = [a3 propertyForKey:@"AirPods"];
  id v4 = [v3 firstObject];

  if ([v4 connected])
  {
    AXAirPodsLocalizedStringForKey();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_20F6B8;
  }

  return v5;
}

@end