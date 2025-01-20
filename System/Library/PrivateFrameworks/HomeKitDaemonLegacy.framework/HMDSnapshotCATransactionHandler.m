@interface HMDSnapshotCATransactionHandler
+ (id)logCategory;
+ (id)sharedHandler;
- (BSPortDeathWatcher)backboardServicesWatcher;
- (CAContext)snapshotContext;
- (CGImage)createSnapshotCGImageRef:(id)a3;
- (HMDSnapshotCATransactionHandler)init;
- (OS_dispatch_queue)clientQueue;
- (id)_createSlotWithFilePath:(id)a3 snapshotCATransaction:(id)a4;
- (id)createSlotWithFilePath:(id)a3;
- (void)_backboardServicesRelaunched;
- (void)_createSnapshotContext;
- (void)_deleteSlotWithIdentifier:(id)a3 filePath:(id)a4 snapshotCATransaction:(id)a5;
- (void)clearSlotWithIdentifier:(id)a3;
- (void)deleteSlotWithIdentifier:(id)a3 filePath:(id)a4;
- (void)fillSlotWithIdentifier:(id)a3 filePath:(id)a4;
- (void)setBackboardServicesWatcher:(id)a3;
- (void)setSnapshotContext:(id)a3;
@end

@implementation HMDSnapshotCATransactionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backboardServicesWatcher, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_snapshotContext, 0);
}

- (void)setBackboardServicesWatcher:(id)a3
{
}

- (BSPortDeathWatcher)backboardServicesWatcher
{
  return self->_backboardServicesWatcher;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setSnapshotContext:(id)a3
{
}

- (CAContext)snapshotContext
{
  return self->_snapshotContext;
}

- (CGImage)createSnapshotCGImageRef:(id)a3
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFURLRef v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  v6 = (void *)*MEMORY[0x1E4F1CFC8];
  v7 = (void *)*MEMORY[0x1E4F2FF00];
  keys[0] = *(void **)MEMORY[0x1E4F2FF08];
  keys[1] = v7;
  v8 = (void *)*MEMORY[0x1E4F1CFD0];
  values[0] = v6;
  values[1] = v8;
  CFDictionaryRef v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v10 = CGImageSourceCreateWithURL(v5, v9);
  CFRelease(v9);
  if (!v10)
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v16;
      __int16 v21 = 2112;
      id v22 = v4;
      v17 = "%{public}@Image source is NULL, %@.";
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x16u);
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
  CFRelease(v10);
  if (!ImageAtIndex)
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v16;
      __int16 v21 = 2112;
      id v22 = v4;
      v17 = "%{public}@Image not created from image source, %@.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v12 = (CGImage *)CFAutorelease(ImageAtIndex);
LABEL_10:

  return v12;
}

- (void)_deleteSlotWithIdentifier:(id)a3 filePath:(id)a4 snapshotCATransaction:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = [v8 unsignedIntegerValue];
  [MEMORY[0x1E4F39CF8] begin];
  v13 = [(HMDSnapshotCATransactionHandler *)self snapshotContext];
  [v13 deleteSlot:v12];

  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138543874;
    int v19 = v17;
    __int16 v20 = 1024;
    int v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Released the snapshot slot %u for file %@", (uint8_t *)&v18, 0x1Cu);
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)deleteSlotWithIdentifier:(id)a3 filePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.snapshot-catransaction-deleteslot."];
  id v9 = [(HMDSnapshotCATransactionHandler *)self clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HMDSnapshotCATransactionHandler_deleteSlotWithIdentifier_filePath___block_invoke;
  v13[3] = &unk_1E6A18668;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

uint64_t __69__HMDSnapshotCATransactionHandler_deleteSlotWithIdentifier_filePath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSlotWithIdentifier:*(void *)(a1 + 40) filePath:*(void *)(a1 + 48) snapshotCATransaction:*(void *)(a1 + 56)];
}

- (id)_createSlotWithFilePath:(id)a3 snapshotCATransaction:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  id v8 = [(HMDSnapshotCATransactionHandler *)self snapshotContext];
  uint64_t v9 = [v8 createSlot];

  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v16 = 138543874;
    v17 = v13;
    __int16 v18 = 1024;
    int v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Created snapshot slot %u for file %@", (uint8_t *)&v16, 0x1Cu);
  }
  [MEMORY[0x1E4F39CF8] commit];
  id v14 = [NSNumber numberWithUnsignedInt:v9];

  return v14;
}

- (void)clearSlotWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v5 = [v4 unsignedIntegerValue];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing slot %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HMDSnapshotCATransactionHandler *)v7 snapshotContext];
  [v10 setObject:0 forSlot:v5];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)fillSlotWithIdentifier:(id)a3 filePath:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = [v6 unsignedIntegerValue];
  [MEMORY[0x1E4F39CF8] begin];
  id v10 = [(HMDSnapshotCATransactionHandler *)self createSnapshotCGImageRef:v7];
  if (v10)
  {
    int v11 = v10;
    id v12 = (void *)MEMORY[0x1D9452090]();
    __int16 v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138544130;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot %u for file %@ with image %@", (uint8_t *)&v17, 0x26u);
    }
    int v16 = [(HMDSnapshotCATransactionHandler *)v13 snapshotContext];
    [v16 setObject:v11 forSlot:v9];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (id)createSlotWithFilePath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__43412;
  __int16 v19 = __Block_byref_object_dispose__43413;
  id v20 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.snapshot-catransaction-createslot."];
  id v6 = [(HMDSnapshotCATransactionHandler *)self clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HMDSnapshotCATransactionHandler_createSlotWithFilePath___block_invoke;
  v11[3] = &unk_1E6A0A750;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v14 = &v15;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __58__HMDSnapshotCATransactionHandler_createSlotWithFilePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createSlotWithFilePath:*(void *)(a1 + 40) snapshotCATransaction:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_backboardServicesRelaunched
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Backboard services is relaunched", (uint8_t *)&v8, 0xCu);
  }
  [(HMDSnapshotCATransactionHandler *)v4 _createSnapshotContext];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"HMDBackboardServicesRelaunchNotification" object:0];

  __createBackboardWatcher(v4);
}

- (void)_createSnapshotContext
{
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v4 = [MEMORY[0x1E4F39B58] remoteContext];
  [(HMDSnapshotCATransactionHandler *)self setSnapshotContext:v4];

  [MEMORY[0x1E4F39CF8] commit];
}

- (HMDSnapshotCATransactionHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotCATransactionHandler;
  uint64_t v2 = [(HMDSnapshotCATransactionHandler *)&v9 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (const char *)[v3 UTF8String];
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    [(HMDSnapshotCATransactionHandler *)v2 _createSnapshotContext];
    __createBackboardWatcher(v2);
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_43431 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_43431, &__block_literal_global_3_43432);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v3_43433;
  return v2;
}

uint64_t __46__HMDSnapshotCATransactionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_43433;
  logCategory__hmf_once_v3_43433 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_43438);
  }
  uint64_t v2 = (void *)handler;
  return v2;
}

uint64_t __48__HMDSnapshotCATransactionHandler_sharedHandler__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDSnapshotCATransactionHandler);
  uint64_t v1 = handler;
  handler = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end