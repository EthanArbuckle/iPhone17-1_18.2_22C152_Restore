@interface _DPKeyNames
+ (id)allKeyNames;
+ (id)keyNamesGroupedByPropertyName;
+ (id)keyPropertiesForKey:(id)a3;
+ (id)propertiesFromNamesFile:(id)a3;
@end

@implementation _DPKeyNames

+ (id)keyPropertiesForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[_DPStrings keyNamesPath];
  v6 = [a1 propertiesFromNamesFile:v5];

  v7 = [v6 objectForKeyedSubscript:v4];
  if (!v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)allKeyNamePatterns;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v4, "hasPrefix:", v13, (void)v16))
          {
            uint64_t v14 = [v6 objectForKeyedSubscript:v13];
            if (v14)
            {
              v7 = (void *)v14;
              goto LABEL_13;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    v7 = 0;
LABEL_13:
  }
  return v7;
}

+ (id)propertiesFromNamesFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E019F810]();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyNames_propertiesFromNamesFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v11 = a1;
  id v6 = v4;
  id v10 = v6;
  if (propertiesFromNamesFile__onceToken != -1) {
    dispatch_once(&propertiesFromNamesFile__onceToken, v9);
  }

  id v7 = (id)allKeys;

  return v7;
}

+ (id)allKeyNames
{
  v3 = +[_DPStrings keyNamesPath];
  id v4 = [a1 propertiesFromNamesFile:v3];

  v5 = [v4 allKeys];

  return v5;
}

+ (id)keyNamesGroupedByPropertyName
{
  v3 = (void *)MEMORY[0x1E019F810](a1, a2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___DPKeyNames_keyNamesGroupedByPropertyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (keyNamesGroupedByPropertyName_onceToken != -1) {
    dispatch_once(&keyNamesGroupedByPropertyName_onceToken, block);
  }
  id v4 = (void *)allKeysGroupedByPropertyName;
  return v4;
}

@end