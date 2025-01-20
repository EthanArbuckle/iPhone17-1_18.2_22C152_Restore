@interface MFMailPopoverManager
+ (id)managerForWindow:(id)a3 createIfNeeded:(BOOL)a4;
+ (void)enumerateManagersUsingBlock:(id)a3;
- (MFMailPopoverManager)init;
- (id)_init;
- (id)allPassThroughViews;
- (void)addPassthroughViewProvider:(id)a3;
- (void)dealloc;
- (void)removePassthroughViewProvider:(id)a3;
@end

@implementation MFMailPopoverManager

+ (id)managerForWindow:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"MFMailPopoverManager.m" lineNumber:35 description:@"Current thread must be main"];

    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"MFMailPopoverManager.m" lineNumber:36 description:@"window can't be nil"];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  v8 = [(id)sManagersMap objectForKey:v7];
  v9 = v8;
  if (v8 || !v4)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [[MFMailPopoverManager alloc] _init];
    v11 = (void *)sManagersMap;
    if (!sManagersMap)
    {
      uint64_t v12 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      v13 = (void *)sManagersMap;
      sManagersMap = v12;

      v11 = (void *)sManagersMap;
    }
    [v11 setObject:v10 forKey:v7];
  }

  return v10;
}

+ (void)enumerateManagersUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t, char *))a3;
  if (pthread_main_np() != 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"MFMailPopoverManager.m" lineNumber:50 description:@"Current thread must be main"];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(id)sManagersMap objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 0;
      v5[2](v5, v10, &v12);
      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (MFMailPopoverManager)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MFMailPopoverManager.m" lineNumber:61 description:@"Don't instantiate this class directly.  Use +managerForWindow:createIfNeeded:."];

  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailPopoverManager;
  v2 = [(MFMailPopoverManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    passThroughProviders = v2->_passThroughProviders;
    v2->_passThroughProviders = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (pthread_main_np() != 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFMailPopoverManager.m" lineNumber:73 description:@"Current thread must be main"];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = [(id)sManagersMap keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [(id)sManagersMap objectForKey:v8];
        if (v9 == self)
        {
          [(id)sManagersMap removeObjectForKey:v8];

          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v11.receiver = self;
  v11.super_class = (Class)MFMailPopoverManager;
  [(MFMailPopoverManager *)&v11 dealloc];
}

- (void)addPassthroughViewProvider:(id)a3
{
}

- (void)removePassthroughViewProvider:(id)a3
{
}

- (id)allPassThroughViews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = self->_passThroughProviders;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "passthroughViews", (void)v10);
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end