@interface NSDictionary(AAAFoundation)
+ (uint64_t)aaf_empty;
- (BOOL)aaf_hasObjects;
- (id)aaf_dictionaryByAddingEntriesFromDictionary:()AAAFoundation;
- (id)aaf_dictionaryByAddingValue:()AAAFoundation forKey:;
- (id)aaf_filter:()AAAFoundation;
- (id)aaf_map:()AAAFoundation;
- (id)aaf_mapStoppable:()AAAFoundation;
- (id)aaf_toUrlQueryItems;
- (id)aaf_toUrlQueryString;
@end

@implementation NSDictionary(AAAFoundation)

- (id)aaf_map:()AAAFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NSDictionary_AAAFoundation__aaf_map___block_invoke;
  v8[3] = &unk_1E6CFA688;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "aaf_mapStoppable:", v8);

  return v6;
}

- (id)aaf_mapStoppable:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __48__NSDictionary_AAAFoundation__aaf_mapStoppable___block_invoke;
    v12 = &unk_1E6CFA660;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateKeysAndObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "aaf_empty");
  }

  return v7;
}

+ (uint64_t)aaf_empty
{
  return MEMORY[0x1E4F1CC08];
}

- (BOOL)aaf_hasObjects
{
  return [a1 count] != 0;
}

- (id)aaf_filter:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __42__NSDictionary_AAAFoundation__aaf_filter___block_invoke;
    v12 = &unk_1E6CFA660;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateKeysAndObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "aaf_empty");
  }

  return v7;
}

- (id)aaf_dictionaryByAddingValue:()AAAFoundation forKey:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = (void *)[a1 mutableCopy];
    [v8 setValue:v7 forKey:v6];

    id v9 = (id)[v8 copy];
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (id)aaf_dictionaryByAddingEntriesFromDictionary:()AAAFoundation
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  uint64_t v6 = [v4 count];
  if (v5)
  {
    if (v6)
    {
      id v7 = (void *)[a1 mutableCopy];
      [v7 addEntriesFromDictionary:v4];
      v8 = (void *)[v7 copy];

      goto LABEL_10;
    }
    id v9 = a1;
  }
  else
  {
    if (!v6)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "aaf_empty");
      goto LABEL_9;
    }
    id v9 = v4;
  }
  uint64_t v10 = [v9 copy];
LABEL_9:
  v8 = (void *)v10;
LABEL_10:

  return v8;
}

- (id)aaf_toUrlQueryString
{
  if ([a1 count])
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:@"/"];
    v3 = objc_msgSend(a1, "aaf_toUrlQueryItems");
    [v2 setQueryItems:v3];

    id v4 = [v2 percentEncodedQuery];
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)aaf_toUrlQueryItems
{
  if ([a1 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__NSDictionary_AAAFoundation__aaf_toUrlQueryItems__block_invoke;
    v6[3] = &unk_1E6CFA6B0;
    id v7 = v2;
    id v3 = v2;
    [a1 enumerateKeysAndObjectsUsingBlock:v6];
    id v4 = (void *)[v3 copy];
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "aaf_empty");
  }
  return v4;
}

@end