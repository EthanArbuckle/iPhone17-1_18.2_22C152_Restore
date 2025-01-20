@interface IKRestrictionsUtilities
+ (id)_purgableRatingsDictionary;
+ (id)_ratingDictionaryForDomain:(id)a3 countryCode:(id)a4;
+ (id)orderedRankingsInDomain:(id)a3 countryCode:(id)a4;
+ (id)rankingForRestrictionRating:(id)a3 inDomain:(id)a4 countryCode:(id)a5;
+ (id)ratingForRestrictionRanking:(id)a3 inDomain:(id)a4 countryCode:(id)a5;
- (void)cache:(id)a3 willEvictObject:(id)a4;
@end

@implementation IKRestrictionsUtilities

+ (id)_purgableRatingsDictionary
{
  if (_purgableRatingsDictionary_sOnce != -1) {
    dispatch_once(&_purgableRatingsDictionary_sOnce, &__block_literal_global_19);
  }
  id v3 = a1;
  objc_sync_enter(v3);
  v4 = [(id)_purgableRatingsDictionary_sCache objectForKey:@"dictionary"];
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 URLForResource:@"RatingProviders" withExtension:@"plist"];

    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6];
    [(id)_purgableRatingsDictionary_sCache setObject:v4 forKey:@"dictionary"];
  }
  objc_sync_exit(v3);

  return v4;
}

uint64_t __53__IKRestrictionsUtilities__purgableRatingsDictionary__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_purgableRatingsDictionary_sCache;
  _purgableRatingsDictionary_sCache = (uint64_t)v0;

  v2 = objc_alloc_init(IKRestrictionsUtilities);
  id v3 = (void *)_purgableRatingsDictionary_sDelegateInstance;
  _purgableRatingsDictionary_sDelegateInstance = (uint64_t)v2;

  v4 = (void *)_purgableRatingsDictionary_sCache;
  uint64_t v5 = _purgableRatingsDictionary_sDelegateInstance;
  return [v4 setDelegate:v5];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1E2ACE000, v4, OS_LOG_TYPE_INFO, "%@ cached ratings dictionary will be evicted", (uint8_t *)&v7, 0xCu);
  }
}

+ (id)ratingForRestrictionRanking:(id)a3 inDomain:(id)a4 countryCode:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _ratingDictionaryForDomain:v9 countryCode:v10];
  uint64_t v12 = [v8 integerValue];
  uint64_t v13 = [v11 count];
  uint64_t v14 = (int)*MEMORY[0x1E4F4BE18];
  if (v13)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v29 = v11;
      id v30 = v10;
      id v31 = v9;
      id v32 = v8;
      v33 = 0;
      uint64_t v18 = *(void *)v35;
      uint64_t v28 = v14;
      uint64_t v19 = v14;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "objectForKey:", @"rank", v28, v29, v30, v31, v32);
          uint64_t v23 = [v22 integerValue];

          if (v23 >= v12)
          {
            if (v19 >= v23) {
              uint64_t v24 = v23;
            }
            else {
              uint64_t v24 = v19;
            }
            if (v23 <= v19)
            {
              id v25 = v21;

              uint64_t v19 = v24;
              v33 = v25;
            }
            else
            {
              uint64_t v19 = v24;
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v17);

      id v9 = v31;
      id v8 = v32;
      v11 = v29;
      id v10 = v30;
      uint64_t v14 = v28;
      if (v33)
      {
        v26 = [v33 objectForKey:@"rating"];

        goto LABEL_27;
      }
    }
    else
    {
    }
    if (v12 == v14) {
      v26 = @"Any";
    }
    else {
      v26 = @"None";
    }
  }
  else if (v12 == v14)
  {
    v26 = @"Any";
  }
  else if (v12 == *MEMORY[0x1E4F4BE20])
  {
    v26 = @"None";
  }
  else
  {
    v26 = 0;
  }
LABEL_27:

  return v26;
}

+ (id)orderedRankingsInDomain:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _purgableRatingsDictionary];
  id v9 = (void *)*MEMORY[0x1E4F4BE10];
  if (v6) {
    id v9 = v6;
  }
  id v10 = v9;

  v11 = [v10 lowercaseString];

  uint64_t v12 = [v8 objectForKey:v11];

  uint64_t v13 = [v12 objectForKey:v7];

  uint64_t v14 = [v13 valueForKey:@"rank"];
  id v15 = [v14 sortedArrayUsingSelector:sel_compare_];

  return v15;
}

+ (id)rankingForRestrictionRating:(id)a3 inDomain:(id)a4 countryCode:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"Any"])
  {
    v11 = NSNumber;
    uint64_t v12 = (unsigned int *)MEMORY[0x1E4F4BE18];
LABEL_5:
    uint64_t v13 = [v11 numberWithInt:*v12];
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"None"])
  {
    v11 = NSNumber;
    uint64_t v12 = (unsigned int *)MEMORY[0x1E4F4BE20];
    goto LABEL_5;
  }
  [a1 _ratingDictionaryForDomain:v9 countryCode:v10];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
LABEL_8:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v24 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * v18);
      v20 = objc_msgSend(v19, "objectForKey:", @"rating", (void)v23);
      if ([v20 isEqualToString:v8]) {
        break;
      }

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
    id v21 = v19;

    if (!v21) {
      goto LABEL_17;
    }
    uint64_t v13 = [v21 objectForKey:@"rank"];
  }
  else
  {
LABEL_14:

LABEL_17:
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", *MEMORY[0x1E4F4BE18], (void)v23);
  }

LABEL_19:
  return v13;
}

+ (id)_ratingDictionaryForDomain:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _purgableRatingsDictionary];
  int v9 = [v6 isEqualToString:@"ratingApps"];
  id v10 = (void *)*MEMORY[0x1E4F4BE10];
  if (v7) {
    int v11 = v9;
  }
  else {
    int v11 = 1;
  }
  if (v11) {
    uint64_t v12 = (void *)*MEMORY[0x1E4F4BE10];
  }
  else {
    uint64_t v12 = v7;
  }
  id v13 = v12;

  id v14 = [v13 lowercaseString];
  uint64_t v15 = [v8 objectForKey:v14];

  if (!v15)
  {
    id v16 = v10;

    uint64_t v17 = [v16 lowercaseString];
    uint64_t v15 = [v8 objectForKey:v17];

    id v13 = v16;
  }
  uint64_t v18 = [v15 objectForKey:v6];

  return v18;
}

@end