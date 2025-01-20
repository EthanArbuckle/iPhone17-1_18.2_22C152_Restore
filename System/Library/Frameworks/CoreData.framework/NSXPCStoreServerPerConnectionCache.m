@interface NSXPCStoreServerPerConnectionCache
- (NSPersistentStoreCoordinator)coordinator;
- (NSXPCStoreServerPerConnectionCache)initWithCoordinator:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)releaseQueryGenerationForRemoteGeneration:(id *)result;
- (uint64_t)localGenerationForRemoteGeneration:(id *)a1;
- (void)dealloc;
- (void)registerQueryGeneration:(uint64_t)a3 forRemoteGeneration:;
- (void)setClientIdentifier:(void *)result;
@end

@implementation NSXPCStoreServerPerConnectionCache

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSXPCStoreServerPerConnectionCache)initWithCoordinator:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSXPCStoreServerPerConnectionCache;
  v4 = [(NSXPCStoreServerPerConnectionCache *)&v7 init];
  if (v4)
  {
    v4->_coordinator = (NSPersistentStoreCoordinator *)a3;
    v5 = -[NSSQLitePrefetchRequestCache initWithSQLCore:]([NSSQLitePrefetchRequestCache alloc], "initWithSQLCore:", objc_msgSend((id)objc_msgSend(a3, "persistentStores"), "lastObject"));
    v4->_generationTokenMap = 0;
    v4->_transaction = 0;
    v4->_prefetchRequestCache = v5;
  }
  return v4;
}

- (void)dealloc
{
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
  }

  self->_coordinator = 0;
  self->_generationTokenMap = 0;

  self->_prefetchRequestCache = 0;
  self->_clientIdentifier = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSXPCStoreServerPerConnectionCache;
  [(NSXPCStoreServerPerConnectionCache *)&v4 dealloc];
}

- (uint64_t)localGenerationForRemoteGeneration:(id *)a1
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    objc_sync_enter(a1);
    uint64_t v5 = [a1[3] objectForKey:a2];
    if (v5) {
      uint64_t v2 = *(void *)(v5 + 8);
    }
    else {
      uint64_t v2 = 0;
    }
    objc_sync_exit(a1);
  }
  return v2;
}

- (void)registerQueryGeneration:(uint64_t)a3 forRemoteGeneration:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_sync_enter(result);
    id v6 = (id)*((void *)v5 + 3);
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v5 + 3) = v6;
    }
    if (![v6 count] && !*((void *)v5 + 4)) {
      *((void *)v5 + 4) = os_transaction_create();
    }
    id v7 = (id)[*((id *)v5 + 3) objectForKey:a3];
    if (v7) {
      goto LABEL_12;
    }
    v8 = [_NSGenerationTokenMapEntry alloc];
    if (v8)
    {
      v9.receiver = v8;
      v9.super_class = (Class)_NSGenerationTokenMapEntry;
      id v7 = objc_msgSendSuper2(&v9, sel_init);
      if (v7)
      {
        *((void *)v7 + 1) = a2;
        *((_DWORD *)v7 + 4) = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    [*((id *)v5 + 3) setObject:v7 forKey:a3];

    if (v7) {
LABEL_12:
    }
      atomic_fetch_add_explicit((atomic_uint *volatile)v7 + 4, 1u, memory_order_relaxed);
    return objc_sync_exit(v5);
  }
  return result;
}

- (id)releaseQueryGenerationForRemoteGeneration:(id *)result
{
  if (result)
  {
    v3 = result;
    objc_sync_enter(result);
    uint64_t v4 = [v3[3] objectForKey:a2];
    if (v4)
    {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 16), 0xFFFFFFFF, memory_order_relaxed);
      int v5 = *(_DWORD *)(v4 + 16);
      if (v5)
      {
        if (v5 < 0)
        {
          uint64_t v6 = [NSString stringWithUTF8String:"refCount can't be negative"];
          _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v14);
          v13 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v14) = 0;
            _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: refCount can't be negative", (uint8_t *)&v14, 2u);
          }
        }
      }
      else
      {
        [v3[3] removeObjectForKey:a2];
      }
    }
    if (v3[4])
    {
      if (![v3[3] count])
      {

        v3[4] = 0;
      }
    }
    return (id *)objc_sync_exit(v3);
  }
  return result;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return [(NSSQLitePrefetchRequestCache *)self->_prefetchRequestCache inverseIsToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return [(NSSQLitePrefetchRequestCache *)self->_prefetchRequestCache manyToOnePrefetchRequestForRelationshipNamed:a3 onEntity:a4];
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return [(NSSQLitePrefetchRequestCache *)self->_prefetchRequestCache manyToManyPrefetchRequestsForRelationshipNamed:a3 onEntity:a4];
}

- (void)setClientIdentifier:(void *)result
{
  if (result)
  {
    v3 = result;
    uint64_t v4 = (void *)result[6];
    if (v4)
    {

      v3[6] = 0;
    }
    result = a2;
    v3[6] = result;
  }
  return result;
}

@end