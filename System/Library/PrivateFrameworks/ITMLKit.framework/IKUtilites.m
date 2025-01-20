@interface IKUtilites
+ (BOOL)isAppTrusted;
+ (BOOL)isAppleTV;
+ (BOOL)runningAnInternalBuild;
+ (id)_arrayByAddingValuesFromArrayOfDictionaries:(id)a3;
+ (id)_entriesBySectionIndexForArrayOfStringEntries:(id)a3 currentCollation:(id)a4;
+ (id)sort:(id)a3 options:(id)a4;
@end

@implementation IKUtilites

+ (id)sort:(id)a3 options:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  v6 = [MEMORY[0x1E4F42B68] currentCollation];
  v29 = v5;
  v7 = [(id)objc_opt_class() _entriesBySectionIndexForArrayOfStringEntries:v5 currentCollation:v6];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30 = IKRequiredVisibilitySetForLocalizedIndexedCollation();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (v13 && [*(id *)(*((void *)&v33 + 1) + 8 * i) count])
        {
          v14 = [v6 sectionTitles];
          v15 = [v14 objectAtIndex:v10 + i];

          v16 = [v6 sectionIndexTitles];
          v17 = [v16 objectAtIndex:v10 + i];

          v18 = [NSString stringWithFormat:@"systemBucketID-%@", v15];
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v19 setObject:v15 forKey:@"sectionTitle"];
          [v19 setObject:v17 forKey:@"sectionIndexTitle"];
          [v19 setObject:v18 forKey:@"indexBarEntryID"];
          [v19 setObject:v13 forKey:@"values"];
          if ([v30 containsObject:v17]) {
            [v19 setObject:@"required" forKey:@"visibility"];
          }
          [v31 addObject:v19];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      v10 += i;
    }
    while (v9);
  }

  if (v28)
  {
    v20 = [v28 objectForKey:@"bucket"];

    v21 = v31;
    if (!v20
      || ([v28 objectForKey:@"bucket"],
          v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 BOOLValue],
          v22,
          (v23 & 1) != 0))
    {
      id v24 = v31;
      goto LABEL_20;
    }
    v25 = objc_opt_class();
  }
  else
  {
    v25 = objc_opt_class();
    v21 = v31;
  }
  id v24 = [v25 _arrayByAddingValuesFromArrayOfDictionaries:v21];
LABEL_20:
  v26 = v24;

  return v26;
}

+ (BOOL)runningAnInternalBuild
{
  if (!+[IKAppContext isInFactoryMode]
    && runningAnInternalBuild_onceToken != -1)
  {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_23);
  }
  return runningAnInternalBuild_internalBuild;
}

void __36__IKUtilites_runningAnInternalBuild__block_invoke()
{
  runningAnInternalBuild_internalBuild = 0;
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      runningAnInternalBuild_internalBuild = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v1);
  }
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_sOnce != -1) {
    dispatch_once(&isAppleTV_sOnce, &__block_literal_global_35);
  }
  return isAppleTV_sIsAppleTV;
}

uint64_t __23__IKUtilites_isAppleTV__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isAppleTV_sIsAppleTV = result == 4;
  return result;
}

+ (BOOL)isAppTrusted
{
  if (+[IKAppContext isInFactoryMode]) {
    return 0;
  }
  CFTypeID v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v2) {
    return 0;
  }
  v3 = v2;
  CFBooleanRef v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, @"com.apple.itunesstored.private", 0);
  if (v4)
  {
    CFBooleanRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

+ (id)_entriesBySectionIndexForArrayOfStringEntries:(id)a3 currentCollation:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 sectionIndexTitles];
  uint64_t v8 = [v7 count];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v8 >= 1)
  {
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      [v9 addObject:v11];

      --v10;
    }
    while (v10);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v18 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "sectionForObject:collationStringSelector:", v17, sel_self, (void)v23));
        [v18 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if (v8)
  {
    for (uint64_t j = 0; j != v8; ++j)
    {
      v20 = objc_msgSend(v9, "objectAtIndex:", j, (void)v23);
      v21 = [v6 sortedArrayFromArray:v20 collationStringSelector:sel_self];
      [v9 replaceObjectAtIndex:j withObject:v21];
    }
  }

  return v9;
}

+ (id)_arrayByAddingValuesFromArrayOfDictionaries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", @"values", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end