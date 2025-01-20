@interface NSLocale
+ (id)buddyDefaultKeyboards;
+ (id)buddyDefaultLanguages;
+ (id)buddyLocaleIdentifierFromIdentifier:(id)a3 byAddingRegion:(id)a4;
+ (id)buddySubregionLocalesForCellularInformation:(id)a3;
+ (id)buddySuggestedKeyboards;
+ (id)buddySuggestedLanguages;
@end

@implementation NSLocale

+ (id)buddySubregionLocalesForCellularInformation:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = objc_alloc_init((Class)NSMutableArray);
  v3 = +[NSLocale currentLocale];
  id v4 = [(NSLocale *)v3 objectForKey:NSLocaleCountryCode];
  unsigned __int8 v5 = [v4 isEqualToString:@"IN"];

  if (v5)
  {
    id v33 = objc_alloc_init((Class)NSMutableOrderedSet);
    memset(__b, 0, sizeof(__b));
    id v6 = location[0];
    id v7 = [v6 countByEnumeratingWithState:__b objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v7; ++i)
        {
          if (*(void *)__b[2] != v8) {
            objc_enumerationMutation(v6);
          }
          id v32 = *(id *)(__b[1] + 8 * i);
          id v10 = v33;
          id v11 = [v32 homeSubregionISOCodes];
          [v10 addObjectsFromArray:v11];

          id v12 = v33;
          id v13 = [v32 networkSubregionISOCodes];
          [v12 addObjectsFromArray:v13];
        }
        id v7 = [v6 countByEnumeratingWithState:__b objects:v37 count:16];
      }
      while (v7);
    }

    memset(v29, 0, sizeof(v29));
    id v14 = v33;
    id v15 = [v14 countByEnumeratingWithState:v29 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29[2];
      do
      {
        for (unint64_t j = 0; j < (unint64_t)v15; ++j)
        {
          if (*(void *)v29[2] != v16) {
            objc_enumerationMutation(v14);
          }
          id v30 = *(id *)(v29[1] + 8 * j);
          id v18 = [v30 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1002B4E18];
          id v28 = [v18 lowercaseString];

          id v19 = objc_alloc((Class)NSMutableDictionary);
          v20 = +[NSLocale currentLocale];
          v21 = [(NSLocale *)v20 localeIdentifier];
          v22 = +[NSLocale componentsFromLocaleIdentifier:v21];
          id v27 = [v19 initWithDictionary:v22];

          [v27 setValue:v28 forKey:@"sd"];
          v23 = +[NSLocale localeIdentifierFromComponents:v27];
          id v26 = +[NSLocale localeWithLocaleIdentifier:v23];

          [v34 addObject:v26];
          objc_storeStrong(&v26, 0);
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
        id v15 = [v14 countByEnumeratingWithState:v29 objects:v36 count:16];
      }
      while (v15);
    }

    objc_storeStrong(&v33, 0);
  }
  id v24 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (id)buddySuggestedLanguages
{
  id v21 = a1;
  SEL v20 = a2;
  id v19 = +[NSLocale currentLocale];
  if (!v19)
  {
    v2 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v2 handleFailureInMethod:v20 object:v21 file:@"NSLocale+MultilingualFlow.m" lineNumber:47 description:@"locale should not be nil as it should have already been picked before arriving here!"];
  }
  id v18 = objc_alloc_init(BYSIMRegionService);
  id v3 = [v18 cellularNetworkInformation];
  id v17 = +[NSLocale buddySubregionLocalesForCellularInformation:v3];

  id v4 = objc_alloc((Class)NSMutableOrderedSet);
  id v5 = [v19 languagesForMultilingualSetup];
  id location = [v4 initWithArray:v5];

  memset(v14, 0, sizeof(v14));
  id v6 = v17;
  id v7 = [v6 countByEnumeratingWithState:v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(void *)v14[2] != v8) {
          objc_enumerationMutation(v6);
        }
        id v15 = *(id *)(v14[1] + 8 * i);
        id v10 = location;
        id v11 = [v15 languagesForMultilingualSetup];
        [v10 addObjectsFromArray:v11];
      }
      id v7 = [v6 countByEnumeratingWithState:v14 objects:v22 count:16];
    }
    while (v7);
  }

  id v12 = [location array];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);

  return v12;
}

+ (id)buddyDefaultLanguages
{
  id v21 = a1;
  SEL v20 = a2;
  id v19 = +[NSLocale currentLocale];
  if (!v19)
  {
    v2 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v2 handleFailureInMethod:v20 object:v21 file:@"NSLocale+MultilingualFlow.m" lineNumber:63 description:@"locale should not be nil as it should have already been picked before arriving here!"];
  }
  id v18 = objc_alloc_init(BYSIMRegionService);
  id v3 = [v18 cellularNetworkInformation];
  id v17 = +[NSLocale buddySubregionLocalesForCellularInformation:v3];

  id v4 = objc_alloc((Class)NSMutableOrderedSet);
  id v5 = [v19 defaultLanguagesForMultilingualSetup];
  id location = [v4 initWithArray:v5];

  memset(v14, 0, sizeof(v14));
  id v6 = v17;
  id v7 = [v6 countByEnumeratingWithState:v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(void *)v14[2] != v8) {
          objc_enumerationMutation(v6);
        }
        id v15 = *(id *)(v14[1] + 8 * i);
        id v10 = location;
        id v11 = [v15 defaultLanguagesForMultilingualSetup];
        [v10 addObjectsFromArray:v11];
      }
      id v7 = [v6 countByEnumeratingWithState:v14 objects:v22 count:16];
    }
    while (v7);
  }

  id v12 = [location array];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);

  return v12;
}

+ (id)buddySuggestedKeyboards
{
  id v17 = a1;
  v16[1] = (id)a2;
  id v2 = +[NSLocale buddyDefaultLanguages];
  v16[0] = [v2 mutableCopy];

  id v3 = +[NSLocale preferredLanguages];
  [v16[0] addObjectsFromArray:v3];

  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_1001191E8;
  id v13 = &unk_1002B34D0;
  id v14 = v17;
  id location = [v16[0] buddy_mapOrderedSet:&v9];
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [location array];
  id v8 = [v4 suggestedInputModesForLocales:v5];

  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
  return v6;
}

+ (id)buddyDefaultKeyboards
{
  id v2 = [a1 buddySuggestedKeyboards:a2, a1];
  id v3 = [v2 buddy_filterToOrderedSet:&stru_1002B3510];
  id v4 = [v3 array];

  return v4;
}

+ (id)buddyLocaleIdentifierFromIdentifier:(id)a3 byAddingRegion:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v5 = +[NSLocale componentsFromLocaleIdentifier:location[0]];
  id v10 = [(NSDictionary *)v5 mutableCopy];

  id v6 = [v10 objectForKeyedSubscript:NSLocaleCountryCode];
  id v7 = [v6 length];

  if (v7)
  {
    id v13 = (NSString *)location[0];
  }
  else
  {
    [v10 setObject:v11 forKeyedSubscript:NSLocaleCountryCode];
    id v13 = +[NSLocale localeIdentifierFromComponents:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  id v8 = v13;

  return v8;
}

@end