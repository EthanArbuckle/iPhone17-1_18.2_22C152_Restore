@interface IP
@end

@implementation IP

void __65__IP_pa_Arab_to_pa_Aran_migrator_performMigrationForPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "componentsFromLocaleIdentifier:");
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  if ([v6 isEqualToString:@"pa"])
  {
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];
    int v8 = [v7 isEqualToString:@"Arab"];

    if (!v8) {
      goto LABEL_5;
    }
    v9 = [v10 localeIdentifierWithUpdatedScript:@"Aran"];
    v6 = +[IntlUtility normalizedLanguageIDFromString:v9];

    [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a3];
  }

LABEL_5:
}

void __61__IP_HK_MO_yue_Hant_migrator_performMigrationForPreferences___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a2];
  uint64_t v8 = *MEMORY[0x1E4F1C438];
  id v15 = v7;
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  if ([v9 isEqualToString:@"zh"])
  {
    id v10 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];
    int v11 = [v10 isEqualToString:@"Hant"];

    v12 = v15;
    if (!v11) {
      goto LABEL_5;
    }
    v9 = (void *)[v15 mutableCopy];
    [v9 setObject:@"yue" forKeyedSubscript:v8];
    v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v9];
    v14 = +[IntlUtility normalizedLanguageIDFromString:v13];

    [*(id *)(a1 + 32) insertObject:v14 atIndex:a3 + 1];
    *a4 = 1;
  }
  v12 = v15;
LABEL_5:
}

void __55__IP_Zawgyi_migrator_migrateToUseZawgyiForPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "componentsFromLocaleIdentifier:");
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  int v9 = [v8 isEqualToString:@"my"];

  if (v9)
  {
    id v10 = [v12 localeIdentifierWithUpdatedScript:@"Qaag"];
    int v11 = +[IntlUtility normalizedLanguageIDFromString:v10];

    [*(id *)(a1 + 32) setObject:v11 atIndexedSubscript:a3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end