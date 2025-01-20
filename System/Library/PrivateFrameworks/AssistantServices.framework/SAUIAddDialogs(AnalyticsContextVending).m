@interface SAUIAddDialogs(AnalyticsContextVending)
- (id)af_dialogIdentifiersForAnalyticsContext;
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SAUIAddDialogs(AnalyticsContextVending)

- (id)af_dialogIdentifiersForAnalyticsContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "dialogs", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "af_dialogIdentifiersForAnalyticsContext");
        if ([v7 count])
        {
          if (!v4) {
            id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v4 addObjectsFromArray:v7];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  v8 = (void *)[v4 copy];
  return v8;
}

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&off_1EEED8A38;
  objc_msgSendSuper2(&v17, sel_af_addEntriesToAnalyticsContext_, v4);
  uint64_t v5 = objc_msgSend(a1, "af_dialogIdentifiersForAnalyticsContext");
  if ([v5 count]) {
    [v4 setObject:v5 forKey:@"dialogIdentifiers"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(a1, "dialogs", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "af_analyticsContext");
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v4 setObject:v6 forKey:@"dialogs"];
  }
}

@end