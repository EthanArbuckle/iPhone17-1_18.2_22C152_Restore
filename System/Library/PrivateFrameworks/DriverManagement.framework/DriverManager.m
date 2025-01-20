@interface DriverManager
+ (id)sharedManager;
- (DriverManager)initWithSwiftManager:(id)a3;
- (id)driverApprovalStatesForThirdPartyApp:(id)a3;
- (int64_t)driverCount;
- (int64_t)driverCountForAppID:(id)a3;
- (int64_t)thirdPartyDriverCount;
- (void)addObserver:(id)a3;
- (void)refresh;
- (void)removeObserver:(id)a3;
- (void)setDriverState:(id)a3 approved:(BOOL)a4;
@end

@implementation DriverManager

- (DriverManager)initWithSwiftManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DriverManager;
  v6 = [(DriverManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_swiftManager, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;
  }
  return v7;
}

+ (id)sharedManager
{
  v2 = [DriverManager alloc];
  v3 = +[_SwiftDriverManager sharedManager];
  v4 = [(DriverManager *)v2 initWithSwiftManager:v3];

  return v4;
}

- (void)addObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[ProxyDriverManagerObserver alloc] initWithObserver:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_observers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(id *)(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 8) == v4)
        {

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  -[_SwiftDriverManager addObserver:](self->_swiftManager, "addObserver:", v5, (void)v11);
  [(NSMutableArray *)self->_observers addObject:v5];
LABEL_11:
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_observers count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [(NSMutableArray *)self->_observers objectAtIndex:v4];
      if ((id)v5[1] == v6) {
        break;
      }

      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_observers count]) {
        goto LABEL_7;
      }
    }
    [(NSMutableArray *)self->_observers removeObjectAtIndex:v4];
    [(_SwiftDriverManager *)self->_swiftManager removeObserver:v5];
  }
LABEL_7:
}

- (int64_t)driverCount
{
  return [(_SwiftDriverManager *)self->_swiftManager driverCount];
}

- (int64_t)thirdPartyDriverCount
{
  return [(_SwiftDriverManager *)self->_swiftManager thirdPartyDriverCount];
}

- (int64_t)driverCountForAppID:(id)a3
{
  return [(_SwiftDriverManager *)self->_swiftManager driverCountForAppID:a3];
}

- (void)refresh
{
}

- (void)setDriverState:(id)a3 approved:(BOOL)a4
{
}

- (id)driverApprovalStatesForThirdPartyApp:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(_SwiftDriverManager *)self->_swiftManager driverApprovalStatesForThirdPartyApp:a3];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [DriverApprovalState alloc];
        long long v12 = -[DriverApprovalState initWithSwiftDriverApprovalState:](v11, "initWithSwiftDriverApprovalState:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_swiftManager, 0);
}

@end