@interface HMDHomeKeyDataRecorder
+ (id)sharedRecorder;
- (HMDHomeKeyDataRecorder)init;
- (NSArray)records;
- (NSMutableArray)mutableRecords;
- (OS_dispatch_queue)workQueue;
- (void)addRecord:(id)a3 clearPrevious:(BOOL)a4;
- (void)recordAddedWalletKey:(id)a3;
- (void)recordAddedWalletKey:(id)a3 passJSONDict:(id)a4;
- (void)recordInitialWalletKeys:(id)a3;
- (void)recordRemovedWalletKeyWithSerialNumber:(id)a3 noWalletKeysRemaining:(BOOL)a4;
- (void)recordUpdatedWalletKey:(id)a3;
- (void)recordUpdatedWalletKey:(id)a3 passJSONDict:(id)a4;
@end

@implementation HMDHomeKeyDataRecorder

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)addRecord:(id)a3 clearPrevious:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v6 = [(HMDHomeKeyDataRecorder *)self mutableRecords];
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];

    v6 = (void *)v7;
  }
  [v6 addObject:v10];
  if ([v6 count] - 10 >= 1) {
    [v6 removeObjectsInRange:0];
  }
  v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v9 = (void *)[v6 copy];
  [v8 setObject:v9 forKey:@"HMDHomeKeyDataRecorderRecordsKey"];
}

- (NSMutableArray)mutableRecords
{
  v2 = [(HMDHomeKeyDataRecorder *)self records];
  v3 = (void *)[v2 mutableCopy];

  return (NSMutableArray *)v3;
}

- (NSArray)records
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 arrayForKey:@"HMDHomeKeyDataRecorderRecordsKey"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF8C0] array];
  }
  v5 = v4;

  return (NSArray *)v5;
}

- (void)recordRemovedWalletKeyWithSerialNumber:(id)a3 noWalletKeysRemaining:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDHomeKeyDataRecorder *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMDHomeKeyDataRecorder_recordRemovedWalletKeyWithSerialNumber_noWalletKeysRemaining___block_invoke;
  block[3] = &unk_264A2DFC8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __87__HMDHomeKeyDataRecorder_recordRemovedWalletKeyWithSerialNumber_noWalletKeysRemaining___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ removedWalletKeyWithSerialNumber: %@", v5, *(void *)(a1 + 40)];
  [v2 addRecord:v4 clearPrevious:*(unsigned __int8 *)(a1 + 48)];
}

- (void)recordUpdatedWalletKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeKeyDataRecorder *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HMDHomeKeyDataRecorder_recordUpdatedWalletKey___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDHomeKeyDataRecorder_recordUpdatedWalletKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ updatedWalletKey: %@", v5, *(void *)(a1 + 40)];
  [v2 addRecord:v4 clearPrevious:0];
}

- (void)recordUpdatedWalletKey:(id)a3 passJSONDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeKeyDataRecorder *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDHomeKeyDataRecorder_recordUpdatedWalletKey_passJSONDict___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__HMDHomeKeyDataRecorder_recordUpdatedWalletKey_passJSONDict___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ updatedWalletKey: %@, passJSONDict: %@", v5, a1[5], a1[6]];
  [v2 addRecord:v4 clearPrevious:0];
}

- (void)recordAddedWalletKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeKeyDataRecorder *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHomeKeyDataRecorder_recordAddedWalletKey___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HMDHomeKeyDataRecorder_recordAddedWalletKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ addedWalletKey: %@", v5, *(void *)(a1 + 40)];
  [v2 addRecord:v4 clearPrevious:0];
}

- (void)recordAddedWalletKey:(id)a3 passJSONDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeKeyDataRecorder *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDHomeKeyDataRecorder_recordAddedWalletKey_passJSONDict___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__HMDHomeKeyDataRecorder_recordAddedWalletKey_passJSONDict___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ addedWalletKey: %@, passJSONDict: %@", v5, a1[5], a1[6]];
  [v2 addRecord:v4 clearPrevious:0];
}

- (void)recordInitialWalletKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeKeyDataRecorder *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMDHomeKeyDataRecorder_recordInitialWalletKeys___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDHomeKeyDataRecorder_recordInitialWalletKeys___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 stringWithFormat:@"%@ initialWalletKeysOnDeviceSetup: %@", v5, *(void *)(a1 + 40)];
  [v2 addRecord:v4 clearPrevious:0];
}

- (HMDHomeKeyDataRecorder)init
{
  HMDispatchQueueNameString();
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create(v4, v5);

  v10.receiver = self;
  v10.super_class = (Class)HMDHomeKeyDataRecorder;
  id v7 = [(HMDHomeKeyDataRecorder *)&v10 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_workQueue, v6);
  }

  return v8;
}

+ (id)sharedRecorder
{
  if (sharedRecorder_onceToken != -1) {
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_151592);
  }
  v2 = (void *)sharedRecorder_sharedRecorder;
  return v2;
}

void __40__HMDHomeKeyDataRecorder_sharedRecorder__block_invoke()
{
  if (isInternalBuild())
  {
    v0 = objc_alloc_init(HMDHomeKeyDataRecorder);
    v1 = (void *)sharedRecorder_sharedRecorder;
    sharedRecorder_sharedRecorder = (uint64_t)v0;
  }
}

@end