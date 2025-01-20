@interface NSDictionary(GKCollectionUtils)
+ (id)_gkDictionaryWithFormEncodedString:()GKCollectionUtils;
- (double)doubleValueFromKey:()GKCollectionUtils defaultValue:;
- (id)_gkAddEntriesFrom:()GKCollectionUtils;
- (id)_gkDictionaryByRemovingObjectForKey:()GKCollectionUtils;
- (id)_gkDictionaryByRemovingObjectsForKeys:()GKCollectionUtils;
- (id)_gkDictionaryWithValue:()GKCollectionUtils forKey:;
- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils;
- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils mappedToNewKeys:;
- (id)_gkValuesForKeys:()GKCollectionUtils;
- (id)numberValueFromKey:()GKCollectionUtils;
- (uint64_t)BOOLValueFromKey:()GKCollectionUtils defaultValue:;
- (uint64_t)integerValueFromKey:()GKCollectionUtils defaultValue:;
- (uint64_t)unsignedIntegerValueFromKey:()GKCollectionUtils defaultValue:;
@end

@implementation NSDictionary(GKCollectionUtils)

- (id)_gkDictionaryByRemovingObjectsForKeys:()GKCollectionUtils
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectsForKeys:v4];

  return v5;
}

- (id)_gkDictionaryByRemovingObjectForKey:()GKCollectionUtils
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectForKey:v4];

  return v5;
}

- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "objectForKey:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils mappedToNewKeys:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  if (v8 != [v6 count])
  {
    uint64_t v9 = NSString;
    v10 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCollectionUtils.m"];
    id v12 = [v11 lastPathComponent];
    v13 = [v9 stringWithFormat:@"%@ ([newKeys count] == [keys count])\n[%s (%s:%d)]", v10, "-[NSDictionary(GKCollectionUtils) _gkSubDictionaryWithKeys:mappedToNewKeys:]", objc_msgSend(v12, "UTF8String"), 346];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  long long v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__NSDictionary_GKCollectionUtils___gkSubDictionaryWithKeys_mappedToNewKeys___block_invoke;
  v20[3] = &unk_1E646CB08;
  v20[4] = a1;
  id v15 = v14;
  id v21 = v15;
  id v22 = v7;
  id v16 = v7;
  [v6 enumerateObjectsUsingBlock:v20];
  long long v17 = v22;
  id v18 = v15;

  return v18;
}

+ (id)_gkDictionaryWithFormEncodedString:()GKCollectionUtils
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    id v6 = [v4 dictionary];
    [v6 _gkAddEntriesFromFormEncodedString:v5];

    id v7 = [a1 dictionaryWithDictionary:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_gkValuesForKeys:()GKCollectionUtils
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gkDictionaryWithValue:()GKCollectionUtils forKey:
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = (void *)[a1 mutableCopy];
    [v8 setObject:v7 forKey:v6];

    id v9 = (id)[v8 copy];
  }
  else
  {
    id v9 = a1;
  }

  return v9;
}

- (id)_gkAddEntriesFrom:()GKCollectionUtils
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    id v6 = [v4 dictionaryWithDictionary:a1];
    [v6 addEntriesFromDictionary:v5];

    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (uint64_t)BOOLValueFromKey:()GKCollectionUtils defaultValue:
{
  id v5 = objc_msgSend(a1, "numberValueFromKey:");
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (uint64_t)integerValueFromKey:()GKCollectionUtils defaultValue:
{
  id v5 = objc_msgSend(a1, "numberValueFromKey:");
  id v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (uint64_t)unsignedIntegerValueFromKey:()GKCollectionUtils defaultValue:
{
  id v5 = objc_msgSend(a1, "numberValueFromKey:");
  id v6 = v5;
  if (v5) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (double)doubleValueFromKey:()GKCollectionUtils defaultValue:
{
  v3 = objc_msgSend(a1, "numberValueFromKey:");
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    a2 = v5;
  }

  return a2;
}

- (id)numberValueFromKey:()GKCollectionUtils
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end