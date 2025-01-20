@interface EDTransactionService
- (BOOL)hasPendingTransactions;
- (EDTransactionService)initWithServiceName:(id)a3;
- (NSString)serviceName;
- (OS_dispatch_queue)serialQueue;
- (id)startTransaction;
- (void)endTransaction:(id)a3;
- (void)resetPendingTransactions;
- (void)setSerialQueue:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation EDTransactionService

- (EDTransactionService)initWithServiceName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EDTransactionService;
  v5 = [(EDTransactionService *)&v18 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 stringWithFormat:@"%@-%@", v8, v4];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v9;

    v11 = NSString;
    v12 = [(EDTransactionService *)v5 serviceName];
    v13 = [v11 stringWithFormat:@"com.apple.mail.NNMKCrashDetectionService.%@", v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (id)startTransaction
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__EDTransactionService_startTransaction__block_invoke;
  v5[3] = &unk_1E6C07858;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__EDTransactionService_startTransaction__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [*(id *)(a1 + 32) serviceName];
  id v12 = [v2 objectForKey:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  if (v12) {
    [v4 setArray:v12];
  }
  v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [v4 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v10 = [*(id *)(a1 + 32) serviceName];
  [v9 setObject:v4 forKey:v10];

  id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v11 synchronize];
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__EDTransactionService_endTransaction___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __39__EDTransactionService_endTransaction___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [*(id *)(a1 + 32) serviceName];
  id v4 = [v2 objectForKey:v3];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", *(void *)(a1 + 40), (void)v14) & 1) == 0) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v12 = [*(id *)(a1 + 32) serviceName];
    [v11 setObject:v5 forKey:v12];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v12 = [*(id *)(a1 + 32) serviceName];
    [v11 removeObjectForKey:v12];
  }

  v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 synchronize];
}

- (BOOL)hasPendingTransactions
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(EDTransactionService *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__EDTransactionService_hasPendingTransactions__block_invoke;
  v5[3] = &unk_1E6C07858;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__EDTransactionService_hasPendingTransactions__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [*(id *)(a1 + 32) serviceName];
  id v4 = [v2 objectForKey:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count] != 0;
}

- (void)resetPendingTransactions
{
  id v3 = [(EDTransactionService *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDTransactionService_resetPendingTransactions__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __48__EDTransactionService_resetPendingTransactions__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = [*(id *)(a1 + 32) serviceName];
  [v3 removeObjectForKey:v2];

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 synchronize];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end