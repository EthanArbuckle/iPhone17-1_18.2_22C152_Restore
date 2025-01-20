@interface VoiceOverAddLanguageRotorController
+ (id)ignoredLanguageCodes;
- (id)_languageSpecs;
- (id)specifiers;
- (void)_languagedSpecifierSelected:(id)a3;
@end

@implementation VoiceOverAddLanguageRotorController

+ (id)ignoredLanguageCodes
{
  v2 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
  if (!ignoredLanguageCodes__IgnoredLanguageCodes)
  {
    uint64_t v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA08]), "initWithObjects:", @"zh", @"zh-Hans", @"zh-Hant", @"en", @"en-UK", @"pt", @"ms", 0);
    v4 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
    ignoredLanguageCodes__IgnoredLanguageCodes = v3;

    v2 = (void *)ignoredLanguageCodes__IgnoredLanguageCodes;
  }

  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [(VoiceOverAddLanguageRotorController *)self _languageSpecs];
    [v5 addObjectsFromArray:v6];

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_languageSpecs
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  v48 = [MEMORY[0x263F228D0] sharedInstance];
  uint64_t v3 = *MEMORY[0x263F8B400];
  v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v47 = self;
  v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];

  v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    uint64_t v10 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:@"Enabled"];
        int v14 = [v13 BOOLValue];

        if (v14)
        {
          v15 = [v12 objectForKeyedSubscript:@"RotorItem"];
          [v6 setObject:v10 forKey:v15];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v8);
  }

  v49 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v16 = [MEMORY[0x263F7EEA0] sharedInstance];
  v17 = [v16 resourcesWithType:1 subType:1];

  v18 = v17;
  uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v54;
    uint64_t v46 = *MEMORY[0x263F60138];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v53 + 1) + 8 * v22) primaryLanguage];
        v24 = @"es";
        if (([v23 isEqualToString:@"es-ES"] & 1) == 0)
        {
          v24 = @"no";
          if (([v23 isEqualToString:@"no-NO"] & 1) == 0)
          {
            v24 = @"fr";
            if (([v23 isEqualToString:@"fr-FR"] & 1) == 0)
            {
              v24 = @"nl";
              if (([v23 isEqualToString:@"nl-NL"] & 1) == 0) {
                v24 = (__CFString *)v23;
              }
            }
          }
        }

        v25 = AXCLanguageConvertToCanonicalForm();

        v26 = [v6 objectForKey:v25];
        if ([v26 BOOLValue]) {
          goto LABEL_21;
        }
        v27 = MEMORY[0x24C53F430](v25);
        v28 = [v6 objectForKey:v27];
        char v29 = [v28 BOOLValue];

        if ((v29 & 1) == 0)
        {
          v30 = [v49 objectForKeyedSubscript:v25];

          if (!v30)
          {
            v26 = [v48 dialectForLanguageID:v25];
            v31 = (void *)MEMORY[0x263F5FC40];
            v32 = [v26 languageNameAndLocaleInCurrentLocale];
            v33 = [v31 preferenceSpecifierNamed:v32 target:v47 set:0 get:0 detail:0 cell:13 edit:0];

            v34 = [v26 langMap];
            v35 = [v34 generalLanguageID];
            [v33 setProperty:v35 forKey:v46];

            v36 = [v26 specificLanguageID];
            [v33 setProperty:v36 forKey:@"languageCode"];

            [v33 setProperty:v26 forKey:@"dialect"];
            [v33 setButtonAction:sel__languagedSpecifierSelected_];
            [v49 setObject:v33 forKeyedSubscript:v25];

LABEL_21:
          }
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v37 = [v18 countByEnumeratingWithState:&v53 objects:v61 count:16];
      uint64_t v20 = v37;
    }
    while (v37);
  }

  v38 = [v49 allValues];
  [v45 addObjectsFromArray:v38];

  v39 = [v48 dialectForSystemLanguage];
  v40 = [v39 langMap];
  v41 = [v40 generalLanguageID];

  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __53__VoiceOverAddLanguageRotorController__languageSpecs__block_invoke;
  v51[3] = &unk_2651F2548;
  id v42 = v41;
  id v52 = v42;
  [v45 sortUsingComparator:v51];
  if ([v45 count])
  {
    v43 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v45 insertObject:v43 atIndex:0];
  }

  return v45;
}

uint64_t __53__VoiceOverAddLanguageRotorController__languageSpecs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F60138];
  uint64_t v8 = [v5 propertyForKey:*MEMORY[0x263F60138]];
  char v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = -1;
  }
  else
  {
    v11 = [v6 propertyForKey:v7];
    char v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

    if (v12)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v13 = [v5 propertyForKey:v7];
      int v14 = [v6 propertyForKey:v7];
      int v15 = [v13 isEqualToString:v14];

      if (v15)
      {
        v16 = [v5 propertyForKey:@"dialect"];
        v17 = [v16 localeNameInCurrentLocale];
        v18 = [v6 propertyForKey:@"dialect"];
        uint64_t v19 = [v18 localeNameInCurrentLocale];
        uint64_t v10 = [v17 localizedStandardCompare:v19];
      }
      else
      {
        v16 = [v5 name];
        v17 = [v6 name];
        uint64_t v10 = [v16 localizedStandardCompare:v17];
      }
    }
  }

  return v10;
}

- (void)_languagedSpecifierSelected:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F8B400];
  uint64_t v6 = *MEMORY[0x263F8B400];
  uint64_t v7 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v33 = self;
  uint64_t v8 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v6 domainAccessor:v7];

  char v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v10 = [v4 propertyForKey:@"languageCode"];
  v32 = AXCLanguageConvertToCanonicalForm();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v28 = v10;
    id v29 = v4;
    v30 = v9;
    v31 = 0;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "objectForKey:", @"RotorItem", v28, v29);
        if (([v17 isEqualToString:@"ms"] & 1) == 0)
        {
          v18 = [(id)objc_opt_class() ignoredLanguageCodes];
          char v19 = [v18 containsObject:v17];

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = AXCLanguageConvertToCanonicalForm();
            if ([v32 isEqualToString:v20])
            {
              uint64_t v21 = (void *)[v16 mutableCopy];

              [v21 setObject:MEMORY[0x263EFFA88] forKey:@"Enabled"];
              v31 = v21;
            }
            else
            {
              [v30 addObject:v16];
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v13);

    id v4 = v29;
    char v9 = v30;
    id v5 = (void *)MEMORY[0x263F8B400];
    uint64_t v10 = v28;
    uint64_t v22 = v31;
    if (v31)
    {
      [v30 addObject:v31];
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v23 = [(id)objc_opt_class() ignoredLanguageCodes];
  char v24 = [v23 containsObject:v10];

  if ((v24 & 1) == 0)
  {
    v38[0] = @"Enabled";
    v38[1] = @"RotorItem";
    v39[0] = MEMORY[0x263EFFA88];
    v39[1] = v10;
    v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    [v9 addObject:v25];
  }
  uint64_t v22 = 0;
LABEL_20:
  [(AccessibilityBridgeBaseController *)v33 setGizmoAccessibilityPref:v9 forKey:*v5];
  v26 = [(VoiceOverAddLanguageRotorController *)v33 navigationController];
  id v27 = (id)[v26 popViewControllerAnimated:1];
}

@end