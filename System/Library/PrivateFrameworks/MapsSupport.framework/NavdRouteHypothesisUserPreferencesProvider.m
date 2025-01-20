@interface NavdRouteHypothesisUserPreferencesProvider
- (id)currentTransitOptions;
- (id)currentUserPreferences;
@end

@implementation NavdRouteHypothesisUserPreferencesProvider

- (id)currentUserPreferences
{
  id v2 = objc_alloc_init((Class)GEOUserPreferences);
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
  v5 = [v4 path];

  [v2 setAvoidTolls:_CFPreferencesGetAppBooleanValueWithContainer() != 0];
  [v2 setAvoidHighways:_CFPreferencesGetAppBooleanValueWithContainer() != 0];

  return v2;
}

- (id)currentTransitOptions
{
  id v2 = +[NSFileManager defaultManager];
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
  v4 = [v3 path];
  v5 = (void *)_CFPreferencesCopyAppValueWithContainer();

  unint64_t v6 = (unint64_t)[v5 integerValue] & 0xF;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)GEOTransitOptions);
    if (GEOConfigGetBOOL()) {
      [v7 setRoutingBehavior:1];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = sub_100013CAC(v6);
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addAvoidedMode:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14));
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end