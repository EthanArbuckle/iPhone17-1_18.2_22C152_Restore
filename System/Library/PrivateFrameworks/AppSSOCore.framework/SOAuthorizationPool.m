@interface SOAuthorizationPool
- (SOAuthorizationPool)init;
- (void)addAuthorization:(id)a3 delegate:(id)a4;
- (void)removeAuthorization:(id)a3;
@end

@implementation SOAuthorizationPool

- (SOAuthorizationPool)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationPool;
  v2 = [(SOAuthorizationPool *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    pool = v2->_pool;
    v2->_pool = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addAuthorization:(id)a3 delegate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [v9 setDelegate:v6];
  v8 = [[SOAuthorizationPoolItem alloc] initWithAuthorization:v9 delegate:v6];
  [(NSMutableArray *)v7->_pool addObject:v8];

  objc_sync_exit(v7);
}

- (void)removeAuthorization:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5->_pool;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "authorization", (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v12 = v11 == v4;

        if (v12)
        {
          id v13 = v10;

          if (v13) {
            [(NSMutableArray *)v5->_pool removeObject:v13];
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = 0;
LABEL_12:

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

@end