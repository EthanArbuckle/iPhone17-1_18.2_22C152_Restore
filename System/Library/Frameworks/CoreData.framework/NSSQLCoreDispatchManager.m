@interface NSSQLCoreDispatchManager
- (NSSQLCoreDispatchManager)initWithSQLCore:(id)a3 seedConnection:(id)a4;
- (uint64_t)disconnectAllConnections;
- (uint64_t)enumerateAvailableConnectionsWithBlock:(uint64_t)result;
- (uint64_t)routeStoreRequest:(uint64_t)result;
- (void)dealloc;
- (void)scheduleBarrierBlock:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLCoreDispatchManager

- (uint64_t)routeStoreRequest:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (v7 && ((*(uint64_t (**)(void))(v7[2] + 16))() & 1) != 0) {
            return [v7 handleStoreRequest:a2];
          }
          ++v6;
        }
        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v4 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (NSSQLCoreDispatchManager)initWithSQLCore:(id)a3 seedConnection:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)NSSQLCoreDispatchManager;
  uint64_t v6 = [(NSSQLCoreDispatchManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_sqlCore = (NSSQLCore *)a3;
    v6->_connectionManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
      long long v9 = off_1E544B0A0;
      if (!v8) {
        long long v9 = off_1E544B068;
      }
      long long v10 = (objc_class *)*v9;
    }
    else
    {
      long long v10 = (objc_class *)NSSQLDefaultConnectionManager;
    }
    long long v11 = (void *)[[v10 alloc] initWithSQLCore:a3 seedConnection:a4];
    if (v11)
    {
      [(NSMutableArray *)v7->_connectionManagers addObject:v11];
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (uint64_t)disconnectAllConnections
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    v1 = *(void **)(result + 16);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          [*(id *)(*((void *)&v5 + 1) + 8 * v4++) disconnectAllConnections];
        }
        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)enumerateAvailableConnectionsWithBlock:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) enumerateAvailableConnectionsWithBlock:a2];
        }
        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  self->_sqlCore = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLCoreDispatchManager;
  [(NSSQLCoreDispatchManager *)&v3 dealloc];
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_connectionManagers count] == 1)
  {
    uint64_t v5 = (void *)[(NSMutableArray *)self->_connectionManagers firstObject];
    [v5 setExclusiveLockingMode:v3];
  }
}

- (void)scheduleBarrierBlock:(id)a3
{
  uint64_t v4 = (void *)[(NSMutableArray *)self->_connectionManagers firstObject];

  [v4 scheduleBarrierBlock:a3];
}

@end