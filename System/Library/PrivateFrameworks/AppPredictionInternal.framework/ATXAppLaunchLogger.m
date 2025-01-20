@interface ATXAppLaunchLogger
+ (id)sharedInstance;
- (id)_init;
- (id)createCustomSchema;
- (int64_t)latestVersion;
- (void)logAppLaunchFrom:(unint64_t)a3 at:(id)a4;
@end

@implementation ATXAppLaunchLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_83);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_13;
  return v2;
}

void __36__ATXAppLaunchLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  id v1 = [[ATXAppLaunchLogger alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_13;
  sharedInstance__pasExprOnceResult_13 = (uint64_t)v1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXAppLaunchLogger;
  id result = [(ATXAbstractVersionedDatabase *)&v3 initWithDefaultPath:@"_ATXLoggerStore.db"];
  if (result) {
    *((unsigned char *)result + 33) = 1;
  }
  return result;
}

- (id)createCustomSchema
{
  return &unk_1F27F2C40;
}

- (int64_t)latestVersion
{
  return 1;
}

- (void)logAppLaunchFrom:(unint64_t)a3 at:(id)a4
{
  id v7 = a4;
  queue = self->super._queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke;
  v14[3] = &unk_1E68AE7A8;
  v14[4] = self;
  id v15 = v7;
  unint64_t v16 = a3;
  v9 = v14;
  v10 = queue;
  id v11 = v7;
  sel_getName(a2);
  v12 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_txn_block_invoke;
  block[3] = &unk_1E68ABB98;
  id v18 = v12;
  id v19 = v9;
  id v13 = v12;
  dispatch_async(v10, block);
}

void __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[33])
  {
    objc_super v3 = [v2 db];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke_2;
    v6[3] = &unk_1E68AE780;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 prepAndRunQuery:@"INSERT OR IGNORE INTO launches (ts, launchType) VALUES (:ts, :launchType)", v6, 0, 0 onPrep onRow onError];
  }
}

void __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 timeIntervalSince1970];
  [v5 bindNamedParam:":ts" toInt64:(uint64_t)(v4 * 1000.0)];
  [v5 bindNamedParam:":launchType" toInteger:*(void *)(a1 + 40)];
}

@end