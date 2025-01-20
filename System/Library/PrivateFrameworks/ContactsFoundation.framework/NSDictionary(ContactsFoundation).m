@interface NSDictionary(ContactsFoundation)
- (id)_cn_diff:()ContactsFoundation;
- (id)_cn_filter:()ContactsFoundation;
- (id)_cn_keysAndValues;
- (id)_cn_map:()ContactsFoundation;
- (id)_cn_mapKeys:()ContactsFoundation;
- (id)_cn_mapValues:()ContactsFoundation;
- (id)_cn_objectForKey:()ContactsFoundation ofClass:;
- (void)_cn_each:()ContactsFoundation;
@end

@implementation NSDictionary(ContactsFoundation)

- (id)_cn_filter:()ContactsFoundation
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __47__NSDictionary_ContactsFoundation___cn_filter___block_invoke;
  v13 = &unk_1E56A0178;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)_cn_objectForKey:()ContactsFoundation ofClass:
{
  objc_msgSend(a1, "objectForKey:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    if (!v7) {
      +[CNSimulatedCrashReporter simulateCrashWithMessage:@"Expected class of %@ but was %@", a4, objc_opt_class()];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_cn_each:()ContactsFoundation
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NSDictionary_ContactsFoundation___cn_each___block_invoke;
  v6[3] = &unk_1E56A0128;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
}

- (id)_cn_keysAndValues
{
  v2 = [a1 allKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__NSDictionary_ContactsFoundation___cn_keysAndValues__block_invoke;
  v6[3] = &unk_1E56A0150;
  void v6[4] = a1;
  v3 = objc_msgSend(v2, "_cn_map:", v6);
  id v4 = +[CNPair pairWithFirst:v2 second:v3];

  return v4;
}

- (id)_cn_map:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NSDictionary_ContactsFoundation___cn_map___block_invoke;
  v11[3] = &unk_1E56A0178;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_cn_mapKeys:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__NSDictionary_ContactsFoundation___cn_mapKeys___block_invoke;
  v11[3] = &unk_1E56A0178;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_cn_mapValues:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NSDictionary_ContactsFoundation___cn_mapValues___block_invoke;
  v11[3] = &unk_1E56A0178;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_cn_diff:()ContactsFoundation
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA70];
  id v6 = [a1 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];
  v8 = [v5 orderedSetWithArray:v7];

  id v9 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v10 = [v4 allKeys];
  uint64_t v11 = [v10 sortedArrayUsingSelector:sel_compare_];
  v44 = [v9 orderedSetWithArray:v11];

  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v43 = v8;
  id v13 = [v8 array];
  id v14 = (void *)[v13 copy];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v59 count:16];
  v42 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        [v43 removeObject:v20];
        [v44 removeObject:v20];
        uint64_t v21 = [a1 objectForKeyedSubscript:v20];
        id v22 = v4;
        uint64_t v23 = [v4 objectForKeyedSubscript:v20];
        if (v21 | v23 && ([(id)v21 isEqual:v23] & 1) == 0)
        {
          v24 = +[CNPair pairWithFirst:v21 second:v23];
          [v12 setObject:v24 forKeyedSubscript:v20];

          id v15 = v42;
        }

        id v4 = v22;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v17);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v25 = v43;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        v31 = [a1 objectForKeyedSubscript:v30];
        v32 = +[CNPair pairWithFirst:v31 second:0];
        [v12 setObject:v32 forKeyedSubscript:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v27);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v33 = v44;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        v39 = [v4 objectForKeyedSubscript:v38];
        v40 = +[CNPair pairWithFirst:0 second:v39];
        [v12 setObject:v40 forKeyedSubscript:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v35);
  }

  return v12;
}

@end