@interface IP_pa_Arab_to_pa_Aran_migrator
- (id)performMigrationForPreferences:(id)a3;
@end

@implementation IP_pa_Arab_to_pa_Aran_migrator

- (id)performMigrationForPreferences:(id)a3
{
  id v4 = a3;
  if ([(ISMigrator *)self previousVersionIsOlderThanMacOS:@"10.15" iOS:@"17A" watchOS:@"17R" tvOS:@"17J"])
  {
    id v5 = (id)[v4 mutableCopy];
    v6 = [v4 objectForKeyedSubscript:@"AppleLanguages"];
    v7 = (void *)[v6 mutableCopy];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__IP_pa_Arab_to_pa_Aran_migrator_performMigrationForPreferences___block_invoke;
    v18[3] = &unk_1E63BFDB0;
    id v8 = v7;
    id v19 = v8;
    [v8 enumerateObjectsUsingBlock:v18];
    [v5 setObject:v8 forKeyedSubscript:@"AppleLanguages"];
    v9 = [v4 objectForKeyedSubscript:@"AppleLocale"];
    v10 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v9];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
    if ([v11 isEqualToString:@"pa"])
    {
      v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];
      int v13 = [v12 isEqualToString:@"Arab"];

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E4F1CA20];
        v15 = [v9 localeIdentifierWithUpdatedScript:@"Aran"];
        uint64_t v16 = [v14 canonicalLocaleIdentifierFromString:v15];

        [v5 setObject:v16 forKeyedSubscript:@"AppleLocale"];
        v9 = (void *)v16;
      }
    }
    else
    {
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

@end