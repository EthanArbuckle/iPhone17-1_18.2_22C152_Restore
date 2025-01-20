@interface BuddyMultilingualDataModelProvider
+ (id)_createDictationSelectorAllDataForExpress:(BOOL)a3;
+ (id)_createDictationSelectorDefaultsForExpress:(BOOL)a3;
+ (id)_createDictationSelectorIncludeSuggested:(BOOL)a3 shouldIncludeUserSelectedKeyboards:(BOOL)a4;
+ (id)_createKeyboardSelectorAllData;
+ (id)_createKeyboardSelectorDefaults;
+ (id)_createKeyboardSelectorSelectedData;
+ (id)_createLanguageSelectorAllData;
+ (id)_createLanguageSelectorDefaults;
+ (id)instanceForDictationSelector;
+ (id)instanceForDictationSelectorExpress;
+ (id)instanceForKeyboardSelector;
+ (id)instanceForLanguageSelector;
+ (id)selectedLanguage;
- (BuddyMultilingualDataModelProvider)initWithDefault:(id)a3 suggested:(id)a4 selected:(id)a5;
- (id)createDataSourceForPreselectedItems;
- (id)createDataSourceForSelectedItems;
- (id)createDataSourceItemsAvailableForAdding;
- (id)defaultDataProvider;
- (id)selectedDataProvider;
- (id)suggestedDataProvider;
- (void)setDefaultDataProvider:(id)a3;
- (void)setSelectedDataProvider:(id)a3;
- (void)setSuggestedDataProvider:(id)a3;
@end

@implementation BuddyMultilingualDataModelProvider

- (BuddyMultilingualDataModelProvider)initWithDefault:(id)a3 suggested:(id)a4 selected:(id)a5
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v7 = v21;
  id v21 = 0;
  v17.receiver = v7;
  v17.super_class = (Class)BuddyMultilingualDataModelProvider;
  v8 = [(BuddyMultilingualDataModelProvider *)&v17 init];
  id v21 = v8;
  objc_storeStrong(&v21, v8);
  if (v8)
  {
    id v9 = [location[0] copy];
    v10 = (void *)*((void *)v21 + 1);
    *((void *)v21 + 1) = v9;

    id v11 = [v19 copy];
    v12 = (void *)*((void *)v21 + 2);
    *((void *)v21 + 2) = v11;

    id v13 = [v18 copy];
    v14 = (void *)*((void *)v21 + 3);
    *((void *)v21 + 3) = v13;
  }
  v15 = (BuddyMultilingualDataModelProvider *)v21;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v21, 0);
  return v15;
}

- (id)createDataSourceItemsAvailableForAdding
{
  id v2 = [(BuddyMultilingualDataModelProvider *)self suggestedDataProvider];

  if (v2)
  {
    v3 = (uint64_t (**)(void))[(BuddyMultilingualDataModelProvider *)self suggestedDataProvider];
    id v6 = (id)v3[2](v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createDataSourceForPreselectedItems
{
  id v2 = [(BuddyMultilingualDataModelProvider *)self defaultDataProvider];

  if (v2)
  {
    v3 = (uint64_t (**)(void))[(BuddyMultilingualDataModelProvider *)self defaultDataProvider];
    id v6 = (id)v3[2](v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createDataSourceForSelectedItems
{
  id v2 = [(BuddyMultilingualDataModelProvider *)self selectedDataProvider];

  if (v2)
  {
    v3 = (uint64_t (**)(void))[(BuddyMultilingualDataModelProvider *)self selectedDataProvider];
    id v6 = (id)v3[2](v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)instanceForLanguageSelector
{
  id v2 = -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_1002B1A40, &stru_1002B1A60, 0, a2, a1);

  return v2;
}

+ (id)instanceForKeyboardSelector
{
  id v2 = -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_1002B1A80, &stru_1002B1AA0, &stru_1002B1AC0, a2, a1);

  return v2;
}

+ (id)instanceForDictationSelector
{
  id v2 = -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_1002B1AE0, &stru_1002B1B00, 0, a2, a1);

  return v2;
}

+ (id)instanceForDictationSelectorExpress
{
  id v2 = -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_1002B1B20, &stru_1002B1B40, 0, a2, a1);

  return v2;
}

+ (id)selectedLanguage
{
  id v9 = a1;
  SEL v8 = a2;
  id v2 = +[NSLocale preferredLanguages];
  id v3 = [(NSArray *)v2 firstObject];
  id location = +[NSLocale baseLanguageFromLanguage:v3];

  if (!location)
  {
    v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:v8 object:v9 file:@"BuddyMultilingualDataModelProvider.m" lineNumber:109 description:@"selectedLanguage should not be nil, it should have been set from the second pane in buddy."];
  }
  id v5 = location;
  objc_storeStrong(&location, 0);
  return v5;
}

+ (id)_createLanguageSelectorDefaults
{
  v22[2] = a1;
  v22[1] = (id)a2;
  v22[0] = +[NSLocale buddyDefaultLanguages];
  id v21 = objc_alloc_init((Class)NSMutableOrderedSet);
  memset(__b, 0, sizeof(__b));
  id v2 = v22[0];
  id v3 = [v2 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * i);
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = oslog;
          os_log_type_t v7 = v17;
          id v8 = +[BuddyMultilingualDataModelProvider selectedLanguage];
          uint64_t v9 = v20;
          id v10 = +[BuddyMultilingualDataModelProvider selectedLanguage];
          sub_1000885D0((uint64_t)buf, (uint64_t)v8, v9, [v10 isEqualToString:v20] & 1);
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "Called from _createLanguageSelectorDefaults: currentLocale languageCode is %@, language from defaultLanguages:%@ and are they equal == %i", buf, 0x1Cu);
        }
        objc_storeStrong((id *)&oslog, 0);
        uint64_t v16 = 3;
        id v11 = +[BuddyMultilingualDataModelProvider selectedLanguage];
        unsigned __int8 v12 = [v11 isEqualToString:v20];

        if (v12) {
          uint64_t v16 = 0;
        }
        id location = +[BuddyMultilingualLanguageData withLanguage:v20 defaults:v22[0] editingOption:v16];
        [v21 addObject:location];
        objc_storeStrong(&location, 0);
      }
      id v3 = [v2 countByEnumeratingWithState:__b objects:v24 count:16];
    }
    while (v3);
  }

  id v13 = [v21 array];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);

  return v13;
}

+ (id)_createLanguageSelectorAllData
{
  v34[2] = a1;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init((Class)NSMutableOrderedSet);
  id v33 = +[IPLanguageListManager manager];
  id v32 = [v33 deviceLanguagesForChangingDeviceLanguage:0];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v32);
    _os_log_impl((void *)&_mh_execute_header, oslog, v30, "Called from _createLanguageSelectorAllData: iPhone Languages from IPLanguageListManager %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v29 = [v33 otherLanguages];
  os_log_t v28 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v36, (uint64_t)v29);
    _os_log_impl((void *)&_mh_execute_header, v28, v27, "Called from _createLanguageSelectorAllData: Other Languages from IPLanguageListManager %@", v36, 0xCu);
  }
  objc_storeStrong((id *)&v28, 0);
  id v2 = [v32 arrayByAddingObjectsFromArray:v29];
  id v3 = v32;
  id v32 = v2;

  memset(__b, 0, sizeof(__b));
  id v4 = v32;
  id v5 = [v4 countByEnumeratingWithState:__b objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v4);
        }
        id v26 = *(id *)(__b[1] + 8 * i);
        id v8 = [v26 localizedStringForName];
        id v9 = [v26 name];
        id v10 = [v26 identifier];
        id location = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:v8 secondaryDisplayText:v9 identifier:v10 isDefault:1 editingOption:3];

        [v34[0] addObject:location];
        objc_storeStrong(&location, 0);
      }
      id v5 = [v4 countByEnumeratingWithState:__b objects:v35 count:16];
    }
    while (v5);
  }

  id v11 = +[NSLocale buddySuggestedLanguages];
  id v23 = +[NSOrderedSet orderedSetWithArray:v11];

  id v12 = +[NSLocale buddyDefaultLanguages];
  id v22 = +[NSOrderedSet orderedSetWithArray:v12];

  id v13 = v34[0];
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100088A98;
  id v19 = &unk_1002B1B68;
  id v20 = v23;
  id v21 = v22;
  [v13 sortUsingComparator:&v16];
  id v14 = [v34[0] array:v16, v17, v18, v19, v20];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v34, 0);

  return v14;
}

+ (id)_createKeyboardSelectorDefaults
{
  v16[2] = a1;
  v16[1] = (id)a2;
  v16[0] = +[NSLocale buddyDefaultKeyboards];
  id v15 = objc_alloc_init((Class)NSMutableOrderedSet);
  id location = [v16[0] buddy_mapCountedSet:&stru_1002B1BA8];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Called from _createKeyboardSelectorDefaults: identifierSet %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v2 = v16[0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_100088F84;
  id v9 = &unk_1002B1BD0;
  id v10 = location;
  id v11 = v15;
  [v2 enumerateObjectsUsingBlock:&v5];
  id v3 = [v15 array];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);

  return v3;
}

+ (id)_createKeyboardSelectorAllData
{
  v18[2] = a1;
  v18[1] = (id)a2;
  v18[0] = +[NSLocale buddyDefaultKeyboards];
  id v17 = +[NSLocale buddySuggestedKeyboards];
  id v16 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v15 = [v18[0] buddy_mapSet:&stru_1002B1C10];
  id location = [v17 buddy_mapCountedSet:&stru_1002B1C30];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Called from _createKeyboardSelectorAllData: identifierSet %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v2 = v17;
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  int v7 = sub_100089440;
  id v8 = &unk_1002B1C58;
  id v9 = location;
  id v10 = v15;
  id v11 = v16;
  [v2 enumerateObjectsUsingBlock:&v5];
  id v3 = [v16 array:v5, v6, v7, v8, v9, v10];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);

  return v3;
}

+ (id)_createKeyboardSelectorSelectedData
{
  v35[2] = a1;
  v35[1] = (id)a2;
  v35[0] = +[NSLocale buddyDefaultKeyboards];
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v34 = [v2 enabledInputModeIdentifiers];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v32, "_createKeyboardSelectorSelectedData: enabled identifiers before aggregating sets %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v31 = +[UIKeyboardInputMode multilingualSetsFromInputModeIdentifiers:v34];
  os_log_t v30 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id location = [v31 buddy_mapArray:&stru_1002B1C78];
    sub_10004B238((uint64_t)v38, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, v30, v29, "_createKeyboardSelectorSelectedData: enabled identifiers after aggregating sets %@", v38, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&v30, 0);
  id v27 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v26 = [v35[0] buddy_mapSet:&stru_1002B1C98];
  id v25 = [v31 buddy_mapCountedSet:&stru_1002B1CB8];
  os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v37, (uint64_t)v25);
    _os_log_impl((void *)&_mh_execute_header, v24, v23, "_createKeyboardSelectorSelectedData: identifierSet %@", v37, 0xCu);
  }
  objc_storeStrong((id *)&v24, 0);
  memset(__b, 0, sizeof(__b));
  id v3 = v31;
  id v4 = [v3 countByEnumeratingWithState:__b objects:v36 count:16];
  if (v4)
  {
    id v17 = (void **)&__b[2];
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (**v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v22 = *(id *)(__b[1] + 8 * i);
        id v20 = [v22 displayName:v17];
        id v19 = 0;
        if ((unint64_t)[v25 countForObject:v20] > 1)
        {
          id v7 = [v22 identifier];
          id v8 = (id)UIKeyboardLocalizedSWLayoutName();
          id v9 = v19;
          id v19 = v8;
        }
        id v10 = v20;
        id v11 = v19;
        id v12 = [v22 identifier];
        id v13 = v26;
        id v14 = [v22 identifier];
        id v18 = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:](BuddyMultilingualLanguageData, "withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:", v10, v11, v12, (unint64_t)[v13 containsObject:v14] & 1, 3);

        [v27 addObject:v18];
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v36 count:16];
    }
    while (v4);
  }

  id v15 = [v27 array];
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v35, 0);

  return v15;
}

+ (id)_createDictationSelectorDefaultsForExpress:(BOOL)a3
{
  return [a1 _createDictationSelectorIncludeSuggested:0 shouldIncludeUserSelectedKeyboards:!a3];
}

+ (id)_createDictationSelectorAllDataForExpress:(BOOL)a3
{
  return [a1 _createDictationSelectorIncludeSuggested:1 shouldIncludeUserSelectedKeyboards:!a3];
}

+ (id)_createDictationSelectorIncludeSuggested:(BOOL)a3 shouldIncludeUserSelectedKeyboards:(BOOL)a4
{
  id v42 = a1;
  SEL v41 = a2;
  BOOL v40 = a3;
  BOOL v39 = a4;
  id v38 = +[NSMutableOrderedSet orderedSet];
  id v37 = 0;
  if (v39)
  {
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 activeInputModes];
    id v6 = v37;
    id v37 = v5;
  }
  else
  {
    id v7 = +[NSLocale buddyDefaultKeyboards];
    id v8 = v37;
    id v37 = v7;
  }
  memset(__b, 0, sizeof(__b));
  id v9 = v37;
  id v10 = [v9 countByEnumeratingWithState:__b objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v10; ++i)
      {
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(v9);
        }
        id v36 = *(id *)(__b[1] + 8 * i);
        id v13 = v38;
        id v14 = [v36 languageWithRegion];
        [v13 addObject:v14];
      }
      id v10 = [v9 countByEnumeratingWithState:__b objects:v45 count:16];
    }
    while (v10);
  }

  id v15 = +[TUIPreferencesController sharedPreferencesController];
  id v16 = [v38 array];
  id v34 = [v15 suggestedDictationModesForKeyboardLanguages:v16];

  id v33 = objc_alloc_init((Class)NSMutableOrderedSet);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v34 description];
    id location = v17;
    if (v40) {
      CFStringRef v18 = @"YES";
    }
    else {
      CFStringRef v18 = @"NO";
    }
    sub_100051470((uint64_t)buf, (uint64_t)v17, (uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "_createDictationSelectorDefaults dictation languages %@, inlude disabled %@", buf, 0x16u);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(v28, 0, sizeof(v28));
  id v19 = v34;
  id v20 = [v19 countByEnumeratingWithState:v28 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v28[2];
    do
    {
      for (unint64_t j = 0; j < (unint64_t)v20; ++j)
      {
        if (*(void *)v28[2] != v21) {
          objc_enumerationMutation(v19);
        }
        id v29 = *(id *)(v28[1] + 8 * j);
        if (v40 || ([v29 enabled] & 1) != 0)
        {
          id v23 = [v29 displayName];
          id v24 = [v29 identifier];
          id v27 = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:v23 secondaryDisplayText:&stru_1002B4E18 identifier:v24 isDefault:0 editingOption:2];

          [v27 setShowDetailText:0];
          [v33 addObject:v27];
          objc_storeStrong(&v27, 0);
        }
      }
      id v20 = [v19 countByEnumeratingWithState:v28 objects:v43 count:16];
    }
    while (v20);
  }

  id v25 = [v33 array];
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);

  return v25;
}

- (id)defaultDataProvider
{
  return self->_defaultDataProvider;
}

- (void)setDefaultDataProvider:(id)a3
{
}

- (id)suggestedDataProvider
{
  return self->_suggestedDataProvider;
}

- (void)setSuggestedDataProvider:(id)a3
{
}

- (id)selectedDataProvider
{
  return self->_selectedDataProvider;
}

- (void)setSelectedDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end