@interface _DKSyncDeletedEventIDs
- (_DKSyncDeletedEventIDs)init;
- (id)deletedEventIDsForSourceDeviceID:(id *)a1;
- (id)sourceDeviceIDs;
- (uint64_t)count;
- (void)addDeletedEventID:(void *)a3 forSourceDeviceID:;
@end

@implementation _DKSyncDeletedEventIDs

- (_DKSyncDeletedEventIDs)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKSyncDeletedEventIDs;
  v2 = [(_DKSyncDeletedEventIDs *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deletedEventIDsBySourceDeviceID = v2->_deletedEventIDsBySourceDeviceID;
    v2->_deletedEventIDsBySourceDeviceID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (uint64_t)count
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        v5 += [v8 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)sourceDeviceIDs
{
  if (a1)
  {
    a1 = [a1[1] allKeys];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)deletedEventIDsForSourceDeviceID:(id *)a1
{
  if (a1)
  {
    a1 = [a1[1] objectForKeyedSubscript:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)addDeletedEventID:(void *)a3 forSourceDeviceID:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 8) objectForKeyedSubscript:v5];
    if (!v6)
    {
      uint64_t v6 = objc_opt_new();
      [*(id *)(a1 + 8) setObject:v6 forKeyedSubscript:v5];
    }
    [v6 addObject:v7];
  }
}

- (void).cxx_destruct
{
}

@end