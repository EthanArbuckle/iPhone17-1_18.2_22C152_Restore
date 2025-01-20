@interface INIntent(IntentUtilities)
- (BOOL)atx_isEqualToIntent:()IntentUtilities;
- (id)atx_hashApproximately;
- (id)atx_nonNilParameters;
- (id)atx_nonNilParametersByName;
- (id)atx_parameterValueForKey:()IntentUtilities;
- (uint64_t)atx_backingStoreDataHash;
@end

@implementation INIntent(IntentUtilities)

- (id)atx_nonNilParameters
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (objc_class *)MEMORY[0x263EFF9C0];
    id v3 = a1;
    id v4 = objc_alloc_init(v2);
    v5 = [v3 serializedParameters];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__INIntent_IntentUtilities__atx_nonNilParameters__block_invoke;
    v8[3] = &unk_26528E498;
    id v6 = v4;
    id v9 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = [a1 _nonNilParameters];
  }
  return v6;
}

- (id)atx_parameterValueForKey:()IntentUtilities
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) == 0)
  {
    v13 = [a1 valueForKey:v4];
    goto LABEL_10;
  }
  id v6 = a1;
  v7 = [v6 appIntentIdentifier];
  if (![v7 isEqualToString:@"SettingsNavigationEventDonationIntent"])
  {

    goto LABEL_8;
  }
  int v8 = [v4 isEqualToString:@"target"];

  if (!v8)
  {
LABEL_8:
    v11 = [v6 serializedParameters];
    v13 = [v11 objectForKeyedSubscript:v4];
    goto LABEL_9;
  }
  id v9 = [v6 serializedParameters];
  v10 = [v9 valueForKeyPath:@"target.value.properties"];
  v11 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_0);

  v12 = [v11 firstObject];
  v13 = [v12 valueForKeyPath:@"value.value"];

LABEL_9:
LABEL_10:

  return v13;
}

- (id)atx_nonNilParametersByName
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "atx_nonNilParameters");
  id v3 = (void *)[v2 copy];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(a1, "atx_parameterValueForKey:", v10, (void)v14);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)atx_hashApproximately
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x24C5D0000]();
  id v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x24C5D0000]();
  id v5 = [a1 _className];
  uint64_t v6 = [v5 dataUsingEncoding:4];
  [v3 appendData:v6];

  uint64_t v7 = objc_msgSend(a1, "atx_nonNilParametersByName");
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend(v7, "allKeys", 0);
  id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = (void *)MEMORY[0x24C5D0000]();
        long long v16 = [v14 dataUsingEncoding:4];
        [v3 appendData:v16];

        long long v17 = [v7 objectForKeyedSubscript:v14];
        hashIt(v17, v3);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = v3;
  CC_SHA256((const void *)[v18 bytes], objc_msgSend(v18, "length"), md);
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:md length:8];

  return v19;
}

- (uint64_t)atx_backingStoreDataHash
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  v1 = [a1 backingStore];
  v2 = [v1 data];

  id v3 = v2;
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), (unsigned __int8 *)v6);
  uint64_t v4 = LODWORD(v6[0]);

  return v4;
}

- (BOOL)atx_isEqualToIntent:()IntentUtilities
{
  return a3
      && +[ATXIntentComparator intent:a1 isEqualToIntent:a3];
}

@end