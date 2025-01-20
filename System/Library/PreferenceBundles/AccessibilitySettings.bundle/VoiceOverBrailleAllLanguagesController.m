@interface VoiceOverBrailleAllLanguagesController
- (BOOL)accessibilityPerformEscape;
- (NSArray)allSpecifiers;
- (UISearchController)searchController;
- (id)keyboardLanguageCodes;
- (id)specifiers;
- (void)_dismiss;
- (void)setAllSpecifiers:(id)a3;
- (void)setSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation VoiceOverBrailleAllLanguagesController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)VoiceOverBrailleAllLanguagesController;
  [(VoiceOverBrailleAllLanguagesController *)&v15 viewDidLoad];
  id v3 = objc_alloc_init((Class)UISearchController);
  [(VoiceOverBrailleAllLanguagesController *)self setSearchController:v3];

  v4 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
  [v4 setSearchResultsUpdater:self];

  v5 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
  [v5 setHidesNavigationBarDuringPresentation:1];

  v6 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
  [v6 setObscuresBackgroundDuringPresentation:0];

  v7 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
  [v7 setAutomaticallyShowsCancelButton:1];

  v8 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
  v9 = [(VoiceOverBrailleAllLanguagesController *)self navigationItem];
  [v9 setSearchController:v8];

  v10 = [(VoiceOverBrailleAllLanguagesController *)self navigationItem];
  [v10 setHidesSearchBarWhenScrolling:0];

  v11 = settingsLocString(@"ADD_NEW_BRAILLE_LANGUAGE_TITLE", @"VoiceOverSettings");
  v12 = [(VoiceOverBrailleAllLanguagesController *)self navigationItem];
  [v12 setTitle:v11];

  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismiss"];
  v14 = [(VoiceOverBrailleAllLanguagesController *)self navigationItem];
  [v14 setLeftBarButtonItem:v13];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v75 = OBJC_IVAR___PSListController__specifiers;
    v76 = +[NSMutableArray array];
    v85 = [(VoiceOverBrailleAllLanguagesController *)self keyboardLanguageCodes];
    v4 = [(VoiceOverBrailleAllLanguagesController *)self searchController];
    v5 = [v4 searchBar];
    v87 = [v5 text];

    v6 = [(VoiceOverBrailleAllLanguagesController *)self specifier];
    v7 = objc_msgSend(v6, "propertyForKey:");

    v8 = [(VoiceOverBrailleAllLanguagesController *)self specifier];
    v9 = objc_msgSend(v8, "propertyForKey:");
    unsigned int v10 = [v9 BOOLValue];

    v11 = [(VoiceOverBrailleAllLanguagesController *)self specifier];
    v12 = objc_msgSend(v11, "propertyForKey:");

    id v13 = [(VoiceOverBrailleAllLanguagesController *)self specifier];
    v14 = [v13 propertyForKey:@"TableSelectionBlockKey"];

    objc_super v15 = [(VoiceOverBrailleAllLanguagesController *)self specifier];
    v16 = objc_msgSend(v15, "propertyForKey:");
    BOOL v17 = v16 != 0;
    v80 = v16;

    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = __52__VoiceOverBrailleAllLanguagesController_specifiers__block_invoke;
    v100[3] = &unk_20C360;
    v100[4] = self;
    id v18 = v7;
    id v101 = v18;
    unsigned int v81 = v10;
    char v104 = v10;
    id v82 = v12;
    id v103 = v82;
    id v74 = v14;
    id v102 = v74;
    BOOL v105 = v17;
    v84 = objc_retainBlock(v100);
    v86 = v18;
    v19 = [v18 supportedLanguageLocales];
    v77 = +[NSMutableArray array];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v96 objects:v108 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v97;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v97 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          v26 = [v25 languageCode];
          unsigned int v27 = [v85 containsObject:v26];

          if (v27)
          {
            v28 = +[AXLanguageManager sharedInstance];
            v29 = [v28 userLocale];
            v30 = [v25 localeIdentifier];
            v31 = [v29 localizedStringForLanguage:v30 context:3];

            if (![v31 length])
            {
              v32 = objc_opt_class();
              v33 = [v25 localeIdentifier];
              uint64_t v34 = [v32 localizedNameForLanguageAgnosticTableIdentifier:v33];

              v31 = (void *)v34;
            }
            if (![v87 length]
              || [v31 localizedCaseInsensitiveContainsString:v87])
            {
              v35 = ((void (*)(void *, void *, void *))v84[2])(v84, v31, v25);
              [v77 addObject:v35];
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v96 objects:v108 count:16];
      }
      while (v22);
    }
    v83 = self;

    if ([v77 count])
    {
      [v77 sortUsingComparator:&__block_literal_global_72];
      v36 = +[PSSpecifier groupSpecifierWithID:@"PreferredLanguageTables"];
      [v76 addObject:v36];

      [v76 addObjectsFromArray:v77];
    }
    v37 = +[NSMutableArray array];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v20;
    id v38 = [obj countByEnumeratingWithState:&v92 objects:v107 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v93;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v93 != v40) {
            objc_enumerationMutation(obj);
          }
          v42 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
          v43 = [v42 languageCode];
          unsigned __int8 v44 = [v85 containsObject:v43];

          if ((v44 & 1) == 0)
          {
            v45 = +[AXLanguageManager sharedInstance];
            v46 = [v45 userLocale];
            v47 = [v42 localeIdentifier];
            v48 = [v46 localizedStringForLanguage:v47 context:3];

            if (![v48 length]
              || ([v42 localeIdentifier],
                  v49 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v50 = [v48 isEqualToString:v49],
                  v49,
                  v50))
            {
              v51 = objc_opt_class();
              v52 = [v42 localeIdentifier];
              uint64_t v53 = [v51 localizedNameForLanguageAgnosticTableIdentifier:v52];

              v48 = (void *)v53;
            }
            if (![v87 length]
              || [v48 localizedCaseInsensitiveContainsString:v87])
            {
              v54 = ((void (*)(void *, void *, void *))v84[2])(v84, v48, v42);
              [v37 addObject:v54];
            }
          }
        }
        id v39 = [obj countByEnumeratingWithState:&v92 objects:v107 count:16];
      }
      while (v39);
    }

    if ([v37 count])
    {
      [v37 sortUsingComparator:&__block_literal_global_288];
      v55 = +[PSSpecifier groupSpecifierWithID:@"OtherLanguageTables"];
      [v76 addObject:v55];

      [v76 addObjectsFromArray:v37];
    }
    v73 = v37;
    v56 = +[NSMutableArray array];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v78 = [v86 languageAgnosticTableIdentifiers];
    id v57 = [v78 countByEnumeratingWithState:&v88 objects:v106 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v89;
      do
      {
        for (k = 0; k != v58; k = (char *)k + 1)
        {
          if (*(void *)v89 != v59) {
            objc_enumerationMutation(v78);
          }
          uint64_t v61 = *(void *)(*((void *)&v88 + 1) + 8 * (void)k);
          v62 = [(id)objc_opt_class() localizedNameForLanguageAgnosticTableIdentifier:v61];
          if (![v87 length]
            || [v62 localizedCaseInsensitiveContainsString:v87])
          {
            v63 = v56;
            v64 = +[PSSpecifier preferenceSpecifierNamed:v62 target:v83 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
            [v64 setProperty:v61 forKey:@"TableIdentifier"];
            [v64 setProperty:v86 forKey:@"TableEnumerator"];
            v65 = +[NSNumber numberWithBool:v81];
            [v64 setProperty:v65 forKey:@"IsAddingNewLanguage"];

            id v66 = objc_retainBlock(v82);
            [v64 setProperty:v66 forKey:@"DismissBlock"];

            [v64 setProperty:&__kCFBooleanTrue forKey:@"IsLanguageAgnostic"];
            v67 = +[NSNumber numberWithBool:v80 != 0];
            [v64 setProperty:v67 forKey:@"AllowDuplicatesKey"];

            v56 = v63;
            [v63 addObject:v64];
          }
        }
        id v58 = [v78 countByEnumeratingWithState:&v88 objects:v106 count:16];
      }
      while (v58);
    }

    if ([v56 count])
    {
      [v56 sortUsingComparator:&__block_literal_global_293];
      v68 = +[PSSpecifier groupSpecifierWithID:@"LanguageAgnosticTables"];
      [v76 addObject:v68];

      [v76 addObjectsFromArray:v56];
    }
    v69 = v56;
    v70 = *(void **)&v83->AXUISettingsBaseListController_opaque[v75];
    *(void *)&v83->AXUISettingsBaseListController_opaque[v75] = v76;
    id v71 = v76;

    id v3 = *(void **)&v83->AXUISettingsBaseListController_opaque[v75];
  }

  return v3;
}

id __52__VoiceOverBrailleAllLanguagesController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:v5 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v8 setProperty:v6 forKey:@"Locale"];
  [v8 setProperty:*(void *)(a1 + 40) forKey:@"TableEnumerator"];
  v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  [v8 setProperty:v9 forKey:@"IsAddingNewLanguage"];

  id v10 = objc_retainBlock(*(id *)(a1 + 56));
  [v8 setProperty:v10 forKey:@"DismissBlock"];

  [v8 setProperty:*(void *)(a1 + 48) forKey:@"TableSelectionBlockKey"];
  v11 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  [v8 setProperty:v11 forKey:@"AllowDuplicatesKey"];

  return v8;
}

int64_t __52__VoiceOverBrailleAllLanguagesController_specifiers__block_invoke_2(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a3;
  uint64_t v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

int64_t __52__VoiceOverBrailleAllLanguagesController_specifiers__block_invoke_3(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a3;
  uint64_t v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

int64_t __52__VoiceOverBrailleAllLanguagesController_specifiers__block_invoke_4(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a3;
  uint64_t v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

- (void)_dismiss
{
  id v2 = [(VoiceOverBrailleAllLanguagesController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)keyboardLanguageCodes
{
  id v2 = +[AXLanguageManager sharedInstance];
  id v3 = [v2 preferredLanguageIDsFromUserSelectedKeyboards];

  v4 = +[NSMutableSet set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        v11 = v10;
        if (v10)
        {
          v12 = [v10 languageCode];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (void)setAllSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSpecifiers, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end