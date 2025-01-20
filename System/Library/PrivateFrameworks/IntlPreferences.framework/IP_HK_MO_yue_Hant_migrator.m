@interface IP_HK_MO_yue_Hant_migrator
- (id)performMigrationForPreferences:(id)a3;
@end

@implementation IP_HK_MO_yue_Hant_migrator

- (id)performMigrationForPreferences:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ISMigrator *)self previousSchemaVersion] >= 0x3E8)
  {
    id v17 = v4;
  }
  else
  {
    v5 = [v4 objectForKeyedSubscript:@"AppleLocale"];
    v6 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v5];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];
    if (([v7 isEqualToString:@"HK"] & 1) != 0
      || ([v7 isEqualToString:@"MO"] & 1) != 0)
    {
      v23 = v7;
      v24 = v6;
      v25 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v26 = v4;
      v8 = [v4 objectForKeyedSubscript:@"AppleLanguages"];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v30;
        uint64_t v12 = *MEMORY[0x1E4F1C438];
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            v14 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * i)];
            v15 = [v14 objectForKeyedSubscript:v12];
            char v16 = [v15 isEqualToString:@"yue"];

            if (v16)
            {
              id v4 = v26;
              id v17 = v26;

              goto LABEL_15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v4 = v26;
      id v17 = (id)[v26 mutableCopy];
      v18 = [v26 objectForKeyedSubscript:v22];
      v19 = (void *)[v18 mutableCopy];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __61__IP_HK_MO_yue_Hant_migrator_performMigrationForPreferences___block_invoke;
      v27[3] = &unk_1E63BFDB0;
      id v28 = v19;
      id v20 = v19;
      [v20 enumerateObjectsUsingBlock:v27];
      [v17 setObject:v20 forKeyedSubscript:v22];

LABEL_15:
      v6 = v24;
      v5 = v25;
      v7 = v23;
    }
    else
    {
      id v17 = v4;
    }
  }
  return v17;
}

@end