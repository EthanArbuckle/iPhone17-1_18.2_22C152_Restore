@interface SAUIAddViews(AnalyticsContextVending)
- (id)af_dialogIdentifiersForAnalyticsContext;
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SAUIAddViews(AnalyticsContextVending)

- (id)af_dialogIdentifiersForAnalyticsContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "views", 0);
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&off_1EEED7A40;
  objc_msgSendSuper2(&v18, sel_af_addEntriesToAnalyticsContext_, v4);
  uint64_t v5 = [a1 dialogPhase];
  if (v5) {
    [v4 setObject:v5 forKey:@"dialogPhase"];
  }
  v6 = objc_msgSend(a1, "af_dialogIdentifiersForAnalyticsContext");
  if ([v6 count]) {
    [v4 setObject:v6 forKey:@"dialogIdentifiers"];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = objc_msgSend(a1, "views", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "af_analyticsContext");
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [v4 setObject:v7 forKey:@"views"];
  }
}

@end