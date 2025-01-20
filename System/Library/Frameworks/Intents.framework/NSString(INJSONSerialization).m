@interface NSString(INJSONSerialization)
+ (INDeferredLocalizedString)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSString(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = [v8 _formatKey];
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v10, @"formatKey");

    v11 = [v8 _table];
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v11, @"table");

    v12 = [v8 _bundleIdentifier];
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v12, @"bundleIdentifier");

    v13 = [v8 _bundleURL];
    v14 = [v6 encodeObject:v13];
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v14, @"bundleURL");

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v16 = objc_msgSend(v8, "_arguments", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v6 encodeObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          objc_msgSend(v15, "if_addObjectIfNonNil:", v21);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }

    if (![v15 count])
    {

      id v15 = 0;
    }
    v22 = (void *)[v15 copy];

    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v22, @"arguments");
    v23 = [v6 _storedConfiguration];
    v24 = [v23 languageCode];

    if (v24)
    {
      v25 = [v6 configuration];
      v26 = [v25 languageCode];
      v27 = [v8 localizeForLanguage:v26];
      objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v27, @"localizedValue");
    }
    id v28 = (id)[v9 copy];
  }
  else
  {

    id v28 = v8;
  }

  return v28;
}

+ (INDeferredLocalizedString)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = [v9 objectForKeyedSubscript:@"formatKey"];
    uint64_t v11 = [v9 objectForKeyedSubscript:@"table"];
    uint64_t v12 = [v9 objectForKeyedSubscript:@"bundleIdentifier"];
    uint64_t v13 = objc_opt_class();
    v14 = [v9 objectForKeyedSubscript:@"bundleURL"];
    id v15 = [v7 decodeObjectOfClass:v13 from:v14];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v17 = [v9 objectForKeyedSubscript:@"arguments"];
    long long v31 = (void *)v11;
    long long v32 = (void *)v10;
    long long v30 = (void *)v12;
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v20 = v18;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [v7 decodeObjectOfClass:objc_opt_class() from:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          objc_msgSend(v16, "if_addObjectIfNonNil:", v26);
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v23);
    }

    if (v32)
    {
      id v28 = v30;
      v27 = v31;
      uint64_t v19 = [[INDeferredLocalizedString alloc] initWithDeferredFormat:v32 fromTable:v31 bundleIdentifier:v30 bundleURL:v15 arguments:v16];
    }
    else
    {
      uint64_t v19 = 0;
      id v28 = v30;
      v27 = v31;
    }
  }
  else
  {

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = (INDeferredLocalizedString *)v9;
    }
    else {
      uint64_t v19 = 0;
    }
  }

  return v19;
}

@end