@interface NSArray(BCSProtoLocalizedStringsHelper)
- (id)defaultLocalizedStringsValue;
- (id)localizedStringsToDictionary;
@end

@implementation NSArray(BCSProtoLocalizedStringsHelper)

- (id)localizedStringsToDictionary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "text", (void)v12);
        v10 = [v8 locale];
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)defaultLocalizedStringsValue
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "isDefault", (void)v9))
        {
          v7 = [v6 text];

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v1 = [v1 firstObject];
  v7 = [v1 text];
LABEL_11:

  return v7;
}

@end