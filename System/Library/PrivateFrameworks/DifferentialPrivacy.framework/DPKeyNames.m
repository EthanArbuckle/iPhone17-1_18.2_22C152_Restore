@interface DPKeyNames
@end

@implementation DPKeyNames

void __39___DPKeyNames_propertiesFromNamesFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"override.keynames" ofType:@"plist"];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyNames_propertiesFromNamesFile___block_invoke_6;
  v9[3] = &unk_1E6C43EC8;
  v9[4] = &v10;
  uint64_t v5 = +[_DPPListHelper loadPropertyListFromPath:v4 overridePath:v3 usingBlock:v9];
  v6 = (void *)allKeys;
  allKeys = v5;

  uint64_t v7 = [(id)v11[5] copy];
  v8 = (void *)allKeyNamePatterns;
  allKeyNamePatterns = v7;

  _Block_object_dispose(&v10, 8);
}

id __39___DPKeyNames_propertiesFromNamesFile___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 objectForKeyedSubscript:@"PropertiesName"];
  if (v6)
  {
    uint64_t v7 = +[_DPKeyProperties keyPropertiesForName:v6];
    if ([v7 keyPatternsAllowed]) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __44___DPKeyNames_keyNamesGroupedByPropertyName__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = +[_DPStrings keyNamesPath];
  v3 = [v1 propertiesFromNamesFile:v2];

  uint64_t v4 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v3 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 propertiesName];

        v13 = [v4 objectForKeyedSubscript:v12];
        v14 = (void *)[v13 mutableCopy];

        if (!v14) {
          v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        }
        [v14 addObject:v10];
        id v15 = (void *)[v14 copy];
        [v4 setObject:v15 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v16 = [v4 copy];
  v17 = (void *)allKeysGroupedByPropertyName;
  allKeysGroupedByPropertyName = v16;
}

@end