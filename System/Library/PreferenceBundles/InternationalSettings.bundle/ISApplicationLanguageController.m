@interface ISApplicationLanguageController
- (NSString)bundleIdentifier;
- (PSSpecifier)otherLanguageGroup;
- (PSSpecifier)suggestedLanguageGroup;
- (id)defaultLanguage;
- (id)languageSpecifiersFrom:(id)a3 forGroup:(id)a4 sorted:(BOOL)a5;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setOtherLanguageGroup:(id)a3;
- (void)setSuggestedLanguageGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ISApplicationLanguageController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
    id v47 = objc_alloc_init((Class)NSMutableArray);
    v4 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"bundleID"];
    [(ISApplicationLanguageController *)self setBundleIdentifier:v4];

    v49 = self;
    v5 = [(ISApplicationLanguageController *)self bundleIdentifier];
    v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5];

    v51 = v6;
    v7 = [v6 bundleURL];
    v8 = +[NSBundle bundleWithURL:v7];

    id v9 = objc_alloc((Class)NSMutableOrderedSet);
    v52 = v8;
    v10 = [v8 normalizedLocalizations];
    id v50 = [v9 initWithArray:v10];

    id v11 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v12 = +[NSLocale preferredLanguages];
    id v13 = [v12 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          v18 = [v52 normalizedLocalizations];
          uint64_t v57 = v17;
          v19 = +[NSArray arrayWithObjects:&v57 count:1];
          v20 = +[NSBundle preferredLocalizationsFromArray:v18 forPreferences:v19];
          [v11 addObjectsFromArray:v20];
        }
        id v14 = [v12 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v14);
    }

    v21 = [v11 array];
    [v50 removeObjectsInArray:v21];

    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"SUGGESTED_LANGUAGES" value:&stru_31478 table:@"InternationalSettings"];
    v24 = +[PSSpecifier groupSpecifierWithID:@"PREFERRED_LANGUAGE" name:v23];
    [(ISApplicationLanguageController *)v49 setSuggestedLanguageGroup:v24];

    v25 = [(ISApplicationLanguageController *)v49 suggestedLanguageGroup];
    uint64_t v26 = PSIsRadioGroupKey;
    [v25 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];

    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"SUGGESTED_LANGUAGE_INFO" value:&stru_31478 table:@"InternationalSettings"];
    v29 = [v51 localizedName];
    v30 = [v51 localizedName];
    v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v29, v30);

    v32 = [(ISApplicationLanguageController *)v49 suggestedLanguageGroup];
    [v32 setProperty:v31 forKey:PSFooterTextGroupKey];

    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"OTHER_LANGUAGES" value:&stru_31478 table:@"InternationalSettings"];
    v35 = +[PSSpecifier groupSpecifierWithID:@"OTHER_LANGUAGES" name:v34];
    [(ISApplicationLanguageController *)v49 setOtherLanguageGroup:v35];

    v36 = [(ISApplicationLanguageController *)v49 otherLanguageGroup];
    [v36 setProperty:&__kCFBooleanTrue forKey:v26];

    if ([v11 count])
    {
      v37 = [(ISApplicationLanguageController *)v49 suggestedLanguageGroup];
      [v47 addObject:v37];

      v38 = [v11 array];
      v39 = [(ISApplicationLanguageController *)v49 suggestedLanguageGroup];
      v40 = [(ISApplicationLanguageController *)v49 languageSpecifiersFrom:v38 forGroup:v39 sorted:0];
      [v47 addObjectsFromArray:v40];
    }
    if ([v50 count])
    {
      v41 = [(ISApplicationLanguageController *)v49 otherLanguageGroup];
      [v47 addObject:v41];

      v42 = [v50 array];
      v43 = [(ISApplicationLanguageController *)v49 otherLanguageGroup];
      v44 = [(ISApplicationLanguageController *)v49 languageSpecifiersFrom:v42 forGroup:v43 sorted:1];
      [v47 addObjectsFromArray:v44];
    }
    v45 = *(void **)&v49->PSListController_opaque[v48];
    *(void *)&v49->PSListController_opaque[v48] = v47;

    v3 = *(void **)&v49->PSListController_opaque[v48];
  }

  return v3;
}

- (id)languageSpecifiersFrom:(id)a3 forGroup:(id)a4 sorted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v41 = a4;
  id v45 = (id)objc_opt_new();
  v39 = v8;
  id v9 = [v8 mutableCopy];
  uint64_t v48 = self;
  v46 = [(ISApplicationLanguageController *)self defaultLanguage];
  if (v5)
  {
    [v9 sortUsingComparator:&stru_30F58];
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v54;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * v14);
        v16 = +[IntlUtility normalizedLanguageIDFromString:v15];
        unsigned __int8 v17 = [v16 isEqualToString:v46];

        if (v17) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
      id v18 = v15;

      if (!v18) {
        goto LABEL_15;
      }
      [v10 removeObject:v18];
      [v10 insertObject:v18 atIndex:0];
      id v10 = v18;
    }
LABEL_14:
  }
LABEL_15:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v9;
  id v19 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v47 = *(void *)v50;
    uint64_t v44 = PSCellClassKey;
    uint64_t v43 = PSTableCellSubtitleTextKey;
    uint64_t v40 = PSRadioGroupCheckedSpecifierKey;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v23 = +[NSLocale _deviceLanguage];
        v24 = +[NSLocale localeWithLocaleIdentifier:v23];
        v25 = [v24 localizedStringForLanguage:v22 context:3];

        uint64_t v26 = +[NSLocale localeWithLocaleIdentifier:v22];
        unsigned int v27 = +[IntlUtility canCapitalizeAutonymForLanguage:v22];
        uint64_t v28 = 3;
        if (v27)
        {
          if (+[IntlUtility forceCapitalizationInLanguageLists])uint64_t v28 = 4; {
          else
          }
            uint64_t v28 = 3;
        }
        v29 = [v26 localizedStringForLanguage:v22 context:v28];
        if (v29)
        {
          v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v48 set:0 get:0 detail:0 cell:3 edit:0];
          [v30 setProperty:v22 forKey:@"PSLanguageCodeKey"];
          [v30 setProperty:objc_opt_class() forKey:v44];
          v31 = +[IntlUtility normalizedLanguageIDFromString:v22];
          unsigned int v32 = [v31 isEqualToString:v46];

          if (v32)
          {
            v33 = +[NSBundle bundleForClass:objc_opt_class()];
            v34 = [v33 localizedStringForKey:@"DEFAULT_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
            [v30 setProperty:v34 forKey:v43];
          }
          else
          {
            [v30 setProperty:v25 forKey:v43];
          }
          v35 = [(ISApplicationLanguageController *)v48 bundleIdentifier];
          v36 = +[IntlUtility preferredLanguageForBundleID:v35];
          unsigned int v37 = [v22 isEqual:v36];

          if (v37) {
            [v41 setProperty:v30 forKey:v40];
          }
          [v45 addObject:v30];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v20);
  }

  return v45;
}

- (id)defaultLanguage
{
  v2 = [(ISApplicationLanguageController *)self bundleIdentifier];
  v3 = +[NSBundle bundleWithIdentifier:v2];

  v4 = +[NSLocale preferredLanguages];
  BOOL v5 = [v3 localizations];
  v6 = +[NSBundle preferredLocalizationsFromArray:v5 forPreferences:v4];
  v7 = [v6 firstObject];

  id v8 = +[IntlUtility normalizedLanguageIDFromString:v7];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)ISApplicationLanguageController;
  id v6 = a4;
  [(ISApplicationLanguageController *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[ISApplicationLanguageController indexForIndexPath:](self, "indexForIndexPath:", v6, v20.receiver, v20.super_class);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v7];
  }
  id v9 = [(ISApplicationLanguageController *)self getGroupSpecifierForSpecifier:v8];
  id v10 = [(ISApplicationLanguageController *)self suggestedLanguageGroup];
  if (v9 == v10) {
    [(ISApplicationLanguageController *)self otherLanguageGroup];
  }
  else {
  id v11 = [(ISApplicationLanguageController *)self suggestedLanguageGroup];
  }

  id v12 = [v9 propertyForKey:PSIsRadioGroupKey];
  unsigned int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [(ISApplicationLanguageController *)self suggestedLanguageGroup];
    uint64_t v15 = PSRadioGroupCheckedSpecifierKey;
    [v14 removePropertyForKey:PSRadioGroupCheckedSpecifierKey];

    v16 = [(ISApplicationLanguageController *)self otherLanguageGroup];
    [v16 removePropertyForKey:v15];

    unsigned __int8 v17 = [v8 propertyForKey:@"PSLanguageCodeKey"];
    [v9 setProperty:v8 forKey:v15];
    id v18 = [(ISApplicationLanguageController *)self bundleIdentifier];
    +[IntlUtility setPreferredLanguage:v17 forBundleID:v18];
  }
  [(ISApplicationLanguageController *)self reloadSpecifier:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)ISApplicationLanguageController;
  id v6 = a4;
  id v7 = [(ISApplicationLanguageController *)&v21 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = [(ISApplicationLanguageController *)self indexForIndexPath:v6];

  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
    id v10 = [(ISApplicationLanguageController *)self getGroupSpecifierForSpecifier:v9];
    id v11 = [v10 propertyForKey:PSIsRadioGroupKey];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      unsigned int v13 = [v9 propertyForKey:@"PSLanguageCodeKey"];
      id v14 = objc_alloc((Class)NSAttributedString);
      uint64_t v15 = [v7 textLabel];
      v16 = [v15 text];
      CFStringRef v22 = kCTLanguageAttributeName;
      v23 = v13;
      unsigned __int8 v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v18 = [v14 initWithString:v16 attributes:v17];

      id v19 = [v7 textLabel];
      [v19 setAttributedText:v18];
    }
  }

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ISApplicationLanguageController;
  [(ISApplicationLanguageController *)&v11 viewWillDisappear:a3];
  v4 = [(ISApplicationLanguageController *)self bundleIdentifier];
  BOOL v5 = +[IntlUtility preferredLanguageForBundleID:v4];

  if ([v5 length])
  {
    id v6 = +[NSLocale localeWithLocaleIdentifier:v5];
    id v7 = [v6 regionCode];

    if (!v7)
    {
      id v8 = +[NSLocale currentLocale];
      id v9 = [v8 regionCode];
      uint64_t v10 = +[NSLocale languageFromLanguage:v5 byReplacingRegion:v9];

      BOOL v5 = (void *)v10;
    }
    +[NSLocale registerPreferredLanguageForAddedKeyboardLanguage:v5];
  }
}

- (PSSpecifier)suggestedLanguageGroup
{
  return self->_suggestedLanguageGroup;
}

- (void)setSuggestedLanguageGroup:(id)a3
{
}

- (PSSpecifier)otherLanguageGroup
{
  return self->_otherLanguageGroup;
}

- (void)setOtherLanguageGroup:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_otherLanguageGroup, 0);

  objc_storeStrong((id *)&self->_suggestedLanguageGroup, 0);
}

@end