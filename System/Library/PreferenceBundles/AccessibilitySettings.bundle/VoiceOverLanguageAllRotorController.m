@interface VoiceOverLanguageAllRotorController
+ (id)ignoredLanguageCodes;
- (AXSpeechSettingsModelController)speechModelController;
- (VoiceOverLanguageAllRotorController)init;
- (id)_languageSpecs;
- (id)specifiers;
- (void)setSpeechModelController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverLanguageAllRotorController

+ (id)ignoredLanguageCodes
{
  v2 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
  if (!ignoredLanguageCodes__IgnoredLanguageCodes)
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)NSSet), "initWithObjects:", @"zh", @"zh-Hans", @"zh-Hant", @"en", @"en-UK", @"pt", 0);
    v4 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
    ignoredLanguageCodes__IgnoredLanguageCodes = (uint64_t)v3;

    v2 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
  }

  return v2;
}

- (VoiceOverLanguageAllRotorController)init
{
  v5.receiver = self;
  v5.super_class = (Class)VoiceOverLanguageAllRotorController;
  v2 = [(VoiceOverLanguageAllRotorController *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXSpeechSettingsModelController);
    [(VoiceOverLanguageAllRotorController *)v2 setSpeechModelController:v3];
  }
  return v2;
}

- (id)_languageSpecs
{
  id v37 = objc_alloc_init((Class)NSMutableArray);
  v41 = +[AXLanguageManager sharedInstance];
  v2 = (void *)_AXSVoiceOverTouchCopyLanguageRotorItems();
  id v3 = +[NSMutableDictionary dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v51;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"Enabled"];
        unsigned int v10 = [v9 BOOLValue];

        if (v10)
        {
          v11 = [v8 objectForKeyedSubscript:@"RotorItem"];
          [v3 setObject:&__kCFBooleanTrue forKey:v11];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v5);
  }

  v42 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v12 = +[TTSAXResourceManager sharedInstance];
  v13 = [v12 resourcesWithType:1 subType:1];

  id v14 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v47;
    uint64_t v39 = PSIDKey;
    uint64_t v38 = PSCellClassKey;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)v17) primaryLanguage];
        v19 = AXCLanguageConvertToCanonicalForm();

        v20 = [v3 objectForKey:v19];
        if ([v20 BOOLValue]) {
          goto LABEL_16;
        }
        v21 = AXLanguageCanonicalFormToGeneralLanguage();
        v22 = [v3 objectForKey:v21];
        unsigned __int8 v23 = [v22 BOOLValue];

        if ((v23 & 1) == 0)
        {
          v24 = [v42 objectForKeyedSubscript:v19];

          if (!v24)
          {
            v20 = [v41 dialectForLanguageID:v19];
            v25 = [v20 languageNameAndLocaleInCurrentLocale];
            v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:3 edit:0];

            v27 = [v20 langMap];
            v28 = [v27 generalLanguageID];
            [v26 setProperty:v28 forKey:v39];

            v29 = [v20 specificLanguageID];
            [v26 setProperty:v29 forKey:@"languageCode"];

            [v26 setProperty:v20 forKey:@"dialect"];
            [v26 setProperty:objc_opt_class() forKey:v38];
            [v42 setObject:v26 forKeyedSubscript:v19];

LABEL_16:
          }
        }

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v30 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
      id v15 = v30;
    }
    while (v30);
  }

  v31 = [v42 allValues];
  [v37 addObjectsFromArray:v31];

  v32 = [v41 dialectForSystemLanguage];
  v33 = [v32 langMap];
  v34 = [v33 generalLanguageID];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = __53__VoiceOverLanguageAllRotorController__languageSpecs__block_invoke;
  v44[3] = &unk_20C090;
  id v45 = v34;
  id v35 = v34;
  [v37 sortUsingComparator:v44];

  return v37;
}

uint64_t __53__VoiceOverLanguageAllRotorController__languageSpecs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PSIDKey;
  v8 = [v5 propertyForKey:PSIDKey];
  unsigned __int8 v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = -1;
  }
  else
  {
    v11 = [v6 propertyForKey:v7];
    unsigned __int8 v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

    if (v12)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v13 = [v5 propertyForKey:v7];
      id v14 = [v6 propertyForKey:v7];
      unsigned int v15 = [v13 isEqualToString:v14];

      if (v15)
      {
        uint64_t v16 = [v5 propertyForKey:@"dialect"];
        v17 = [v16 localeNameInCurrentLocale];
        v18 = [v6 propertyForKey:@"dialect"];
        v19 = [v18 localeNameInCurrentLocale];
        uint64_t v10 = (uint64_t)[v17 localizedStandardCompare:v19];
      }
      else
      {
        uint64_t v16 = [v5 name];
        v17 = [v6 name];
        uint64_t v10 = (uint64_t)[v16 localizedStandardCompare:v17];
      }
    }
  }

  return v10;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(VoiceOverLanguageAllRotorController *)self _languageSpecs];
    if ([v6 count]) {
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 cellForRowAtIndexPath:v7];
  unsigned __int8 v9 = [v8 specifier];

  uint64_t v10 = (void *)_AXSVoiceOverTouchCopyLanguageRotorItems();
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  unsigned __int8 v12 = [v9 propertyForKey:@"languageCode"];
  v40 = AXLanguageConvertToCanonicalForm();

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  id v37 = v6;
  if (!v14)
  {

    v24 = v13;
LABEL_16:
    v45[0] = @"RotorItem";
    v45[1] = @"Enabled";
    v26 = v40;
    v46[0] = v40;
    v46[1] = &__kCFBooleanTrue;
    v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    [v11 addObject:v27];

    v25 = 0;
    goto LABEL_17;
  }
  id v15 = v14;
  uint64_t v38 = v11;
  uint64_t v39 = 0;
  id v35 = v9;
  id v36 = v7;
  uint64_t v16 = *(void *)v42;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v19 = objc_msgSend(v18, "objectForKey:", @"RotorItem", v35, v36, v37);
      v20 = [(id)objc_opt_class() ignoredLanguageCodes];
      unsigned __int8 v21 = [v20 containsObject:v19];

      if ((v21 & 1) == 0)
      {
        v22 = AXLanguageConvertToCanonicalForm();
        if ([v40 isEqualToString:v22])
        {
          id v23 = [v18 mutableCopy];

          [v23 setObject:&__kCFBooleanTrue forKey:@"Enabled"];
          uint64_t v39 = v23;
        }
        else
        {
          [v38 addObject:v18];
        }
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  }
  while (v15);
  v24 = v13;

  unsigned __int8 v9 = v35;
  id v7 = v36;
  v11 = v38;
  v25 = v39;
  if (!v39) {
    goto LABEL_16;
  }
  [v38 addObject:v39];
  v26 = v40;
LABEL_17:
  v28 = [(VoiceOverLanguageAllRotorController *)self speechModelController];
  uint64_t v29 = AXSpeechSourceKeyVoiceOver;
  id v30 = [v28 selectedVoiceIdentifierForSpeechSourceKey:AXSpeechSourceKeyVoiceOver languageCode:v26];

  v31 = +[TTSAXResourceMigrationUtilities sharedInstance];
  [v31 downloadCompactResourceIfNeededForIdentifier:v30];

  v32 = +[AXSettings sharedInstance];
  [v32 setSpeechVoiceIdentifier:v30 forLanguage:v26 sourceKey:v29];

  _AXSVoiceOverTouchSetLanguageRotorItems();
  v33 = [(VoiceOverLanguageAllRotorController *)self navigationController];
  id v34 = [v33 popViewControllerAnimated:1];
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end