@interface IP_Zawgyi_migrator
- (id)migrateToUseZawgyiForPreferences:(id)a3;
- (id)performMigrationForPreferences:(id)a3;
@end

@implementation IP_Zawgyi_migrator

- (id)migrateToUseZawgyiForPreferences:(id)a3
{
  id v3 = a3;
  v4 = (void *)[v3 mutableCopy];
  v5 = [v3 objectForKeyedSubscript:@"AppleLanguages"];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v3 objectForKeyedSubscript:@"AppleLocale"];
  v8 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v7];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __55__IP_Zawgyi_migrator_migrateToUseZawgyiForPreferences___block_invoke;
  v22 = &unk_1E63BFDD8;
  id v9 = v6;
  id v23 = v9;
  v24 = &v25;
  [v9 enumerateObjectsUsingBlock:&v19];
  if (!*((unsigned char *)v26 + 24))
  {
    v10 = (void *)MEMORY[0x1E4F1CA20];
    v11 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F1C400], v19, v20, v21, v22);
    v12 = [v10 languageFromLanguage:@"my-Qaag" byReplacingRegion:v11];

    [v9 addObject:v12];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, @"AppleLanguages", v19, v20, v21, v22);
  v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  int v14 = [v13 isEqualToString:@"my"];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F1CA20];
    v16 = [v7 localeIdentifierWithUpdatedScript:@"Qaag"];
    uint64_t v17 = [v15 canonicalLocaleIdentifierFromString:v16];

    [v4 setObject:v17 forKeyedSubscript:@"AppleLocale"];
    v7 = (void *)v17;
  }

  _Block_object_dispose(&v25, 8);
  return v4;
}

- (id)performMigrationForPreferences:(id)a3
{
  id v4 = a3;
  if ([(ISMigrator *)self previousSchemaVersion] >= 0x3E9
    || [(ISMigrator *)self platform] != 1 && [(ISMigrator *)self platform] != 2)
  {
    goto LABEL_8;
  }
  v5 = CTFontDescriptorCreateWithNameAndSize(@"Zawgyi-One", 0.0);
  CTFontDescriptorRef MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v5, 0);
  if (v5) {
    CFRelease(v5);
  }
  if (MatchingFontDescriptor)
  {
    CFRelease(MatchingFontDescriptor);
    id v7 = [(IP_Zawgyi_migrator *)self migrateToUseZawgyiForPreferences:v4];
  }
  else
  {
LABEL_8:
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

@end