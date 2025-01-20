@interface _HKCBCentralManagerLoader
- (_HKCBCentralManagerLoader)init;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)getCentralManagerWithCompletion:(id)a3;
@end

@implementation _HKCBCentralManagerLoader

- (_HKCBCentralManagerLoader)init
{
  v11.receiver = self;
  v11.super_class = (Class)_HKCBCentralManagerLoader;
  v2 = [(_HKCBCentralManagerLoader *)&v11 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = HKCreateSerialDispatchQueue(v2, @"queue");
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1BD18]) initWithDelegate:v3 queue:v3->_queue];
    centralManager = v3->_centralManager;
    v3->_centralManager = (CBCentralManager *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingHandlers = v3->_pendingHandlers;
    v3->_pendingHandlers = v8;
  }
  return v3;
}

- (void)getCentralManagerWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___HKCBCentralManagerLoader_getCentralManagerWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 5)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogServices;
    if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      pendingHandlers = self->_pendingHandlers;
      v7 = v5;
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = [(NSMutableArray *)pendingHandlers count];
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "%@ CBCentralManager did become available, %lu pending handlers", buf, 0x16u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = self->_pendingHandlers;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_pendingHandlers removeAllObjects];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end