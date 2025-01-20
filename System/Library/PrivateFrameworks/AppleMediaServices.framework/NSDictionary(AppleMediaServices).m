@interface NSDictionary(AppleMediaServices)
- (id)ams_arrayUsingTransform:()AppleMediaServices;
- (id)ams_compactMapValues:()AppleMediaServices;
- (id)ams_componentsJoinedByString:()AppleMediaServices;
- (id)ams_dictionaryByAddingEntriesFromDictionary:()AppleMediaServices;
- (id)ams_dictionaryRemovingKeys:()AppleMediaServices;
- (id)ams_filterUsingTest:()AppleMediaServices;
- (id)ams_firstKeyObjectPassingTest:()AppleMediaServices;
- (id)ams_firstKeyPassingTest:()AppleMediaServices;
- (id)ams_firstObjectPassingTest:()AppleMediaServices;
- (id)ams_mapWithTransform:()AppleMediaServices;
- (id)ams_objectForCaseInsensitiveKey:()AppleMediaServices;
- (id)ams_objectForKey:()AppleMediaServices defaultValue:;
- (id)ams_sanitizedForSecureCoding;
- (id)hashedDescription;
@end

@implementation NSDictionary(AppleMediaServices)

- (id)hashedDescription
{
  v2 = objc_msgSend(a1, "ams_mapWithTransform:", &__block_literal_global_147);
  v3 = objc_msgSend(a1, "ams_generateDescriptionWithSubObjects:", v2);

  return v3;
}

- (id)ams_mapWithTransform:()AppleMediaServices
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __57__NSDictionary_AppleMediaServices__ams_mapWithTransform___block_invoke;
  v13 = &unk_1E55A88C0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_objectForKey:()AppleMediaServices defaultValue:
{
  id v6 = a4;
  id v7 = [a1 objectForKeyedSubscript:a3];
  if (!v7) {
    id v7 = v6;
  }

  return v7;
}

- (id)ams_objectForCaseInsensitiveKey:()AppleMediaServices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![v4 caseInsensitiveCompare:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          uint64_t v10 = [a1 objectForKeyedSubscript:v4];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)ams_arrayUsingTransform:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __60__NSDictionary_AppleMediaServices__ams_arrayUsingTransform___block_invoke;
  long long v13 = &unk_1E55A88C0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_filterUsingTest:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __56__NSDictionary_AppleMediaServices__ams_filterUsingTest___block_invoke;
  long long v13 = &unk_1E55A88C0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_sanitizedForSecureCoding
{
  v1 = objc_msgSend(a1, "ams_filterUsingTest:", &__block_literal_global_3_6);
  v2 = objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_5_1);

  return v2;
}

- (id)ams_compactMapValues:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __57__NSDictionary_AppleMediaServices__ams_compactMapValues___block_invoke;
  long long v13 = &unk_1E55A88C0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_componentsJoinedByString:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v6 = [a1 allKeys];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:v7];
      v9 = [a1 objectForKeyedSubscript:v8];
      [v5 appendFormat:@"%@:%@", v8, v9];
      if (v7 != [v6 count] - 1) {
        [v5 appendString:v4];
      }

      ++v7;
    }
    while (v7 < [v6 count]);
  }
  uint64_t v10 = (void *)[v5 copy];

  return v10;
}

- (id)ams_dictionaryByAddingEntriesFromDictionary:()AppleMediaServices
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

- (id)ams_firstKeyPassingTest:()AppleMediaServices
{
  v1 = objc_msgSend(a1, "ams_firstKeyObjectPassingTest:");
  v2 = [v1 first];

  return v2;
}

- (id)ams_firstKeyObjectPassingTest:()AppleMediaServices
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__79;
  id v15 = __Block_byref_object_dispose__79;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NSDictionary_AppleMediaServices__ams_firstKeyObjectPassingTest___block_invoke;
  v8[3] = &unk_1E55A88E8;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ams_firstObjectPassingTest:()AppleMediaServices
{
  v1 = objc_msgSend(a1, "ams_firstKeyObjectPassingTest:");
  v2 = [v1 second];

  return v2;
}

- (id)ams_dictionaryRemovingKeys:()AppleMediaServices
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectsForKeys:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

@end