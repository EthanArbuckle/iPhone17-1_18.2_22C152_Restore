@interface BMBookmarkableSubscription
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (void)cancel;
- (void)requestDemand:(int64_t)a3;
@end

@implementation BMBookmarkableSubscription

- (void)cancel
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (id)upstreamSubscriptions
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

- (id)newBookmark
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(BMBookmarkableSubscription *)self upstreamSubscriptions];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1F040FEE8])
        {
          uint64_t v10 = [v9 newBookmark];
          if (v10) {
            goto LABEL_13;
          }
        }
        else
        {
          v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v9;
            _os_log_error_impl(&dword_1AD01F000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }
        }
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
LABEL_13:
        v12 = (void *)v10;
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  v13 = [BMBookmarkNode alloc];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = [(BMBookmarkNode *)v13 initWithValue:0 upstreams:v3 name:v15];

  return v16;
}

@end