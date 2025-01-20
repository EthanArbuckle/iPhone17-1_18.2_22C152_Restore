@interface SRRelatedSpecifiers
+ (void)initialize;
- (id)specifiersForRelatedSettings:(id)a3;
- (id)valueForSpecifier:(id)a3;
- (void)navigateToAuthorization;
@end

@implementation SRRelatedSpecifiers

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_111A0 = (uint64_t)os_log_create("com.apple.SensorKit", "SRRelatedSpecifiers");
  }
}

- (id)specifiersForRelatedSettings:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableSet set];
  id v6 = +[NSMutableSet set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v8 = (void *)sub_748C();
  v9 = sub_7810(v8);
  id v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v14, "relatedSettingsCategories"), "containsObject:", a3))
        {
          objc_msgSend(v5, "addObject:", objc_msgSend(v14, "authorizationService"));
          objc_msgSend(v6, "addObject:", objc_msgSend(v14, "name"));
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v11);
  }
  if (![v5 count]) {
    return &__NSArray0__struct;
  }
  id v15 = [objc_alloc((Class)SRAuthorizationStore) initWithSensors:v6];
  id v16 = [v15 readerAuthorizationBundleIdValues];

  if (![v16 count]) {
    return &__NSArray0__struct;
  }
  v32 = v4;
  objc_msgSend(v4, "addObject:", +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APPS_AND_STUDIES_USING_RESEARCH_SENSORS", &stru_C670, 0)));
  v31 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"AUTHORIZED" value:&stru_C670 table:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v35 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v41;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v16);
        }
        uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
        id v20 = +[NSBundle sk_bundleWithIdentifier:v18];
        if (v20)
        {
          id v21 = v20;
          id v22 = [v16 objectForKeyedSubscript:v18];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v37;
            while (2)
            {
              id v26 = v16;
              for (k = 0; k != v24; k = (char *)k + 1)
              {
                if (*(void *)v37 != v25) {
                  objc_enumerationMutation(v22);
                }
                if (objc_msgSend(objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", *(void *)(*((void *)&v36 + 1) + 8 * (void)k)), "relatedSettingsCategories"), "containsObject:", a3))
                {
                  objc_msgSend(v32, "addObject:", +[PSSpecifier sk_appSpecifierForBundle:value:cellType:target:](PSSpecifier, "sk_appSpecifierForBundle:value:cellType:target:", v21, v31, 4, self));
                  id v16 = v26;
                  goto LABEL_28;
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
              id v16 = v26;
              if (v24) {
                continue;
              }
              break;
            }
          }
        }
LABEL_28:
      }
      id v35 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v35);
  }
  v28 = v32;
  if ([v32 count] == (char *)&dword_0 + 1) {
    return &__NSArray0__struct;
  }
  id v30 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"VIEW_MANAGE_AUTHORIZATION" value:&stru_C670 table:0], self, 0, 0, 0, 13, 0);
  [v30 setButtonAction:"navigateToAuthorization"];
  [v32 addObject:v30];
  return v28;
}

- (void)navigateToAuthorization
{
  uint64_t v4 = 0;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openSensitiveURL:withOptions:error:", sub_78A0(), 0, &v4);
  if (v4)
  {
    v2 = qword_111A0;
    if (os_log_type_enabled((os_log_t)qword_111A0, OS_LOG_TYPE_ERROR))
    {
      id v3 = sub_78A0();
      *(_DWORD *)buf = 138543618;
      id v6 = v3;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "Error opening %{public}@ because %{public}@", buf, 0x16u);
    }
  }
}

- (id)valueForSpecifier:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

@end