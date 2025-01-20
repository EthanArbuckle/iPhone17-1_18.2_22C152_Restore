@interface NSArray(MessagesFromMixedStoresConvenience)
- (id)mf_dictionaryWithMessagesSortedByStore;
@end

@implementation NSArray(MessagesFromMixedStoresConvenience)

- (id)mf_dictionaryWithMessagesSortedByStore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = objc_msgSend(v7, "messageStore", (void)v11);
          if (v8)
          {
            v9 = [v2 objectForKey:v8];
            if (!v9)
            {
              v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
              [v2 setObject:v9 forKey:v8];
            }
            [v9 addObject:v7];
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v2;
}

@end