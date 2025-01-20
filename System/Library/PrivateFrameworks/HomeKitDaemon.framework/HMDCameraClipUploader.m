@interface HMDCameraClipUploader
+ (id)logCategory;
- (BOOL)_isCancelledError:(id)a3;
- (BOOL)hasAddedCreateClipOperation;
- (HMBLocalZone)localZone;
- (HMCameraClipEncryptionManager)encryptionManager;
- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9;
- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9 encryptionManager:(id)a10 factory:(id)a11;
- (HMDCameraClipUploaderDelegate)delegate;
- (HMDCameraClipUploaderFactory)factory;
- (NAFuture)didCreateClipFuture;
- (NSDate)startDate;
- (NSDictionary)stateDump;
- (NSMutableArray)operations;
- (NSString)logIdentifier;
- (NSUUID)clipUUID;
- (OS_dispatch_queue)workQueue;
- (double)targetFragmentDuration;
- (id)_addOperation:(id)a3 finalizeClipOnError:(BOOL)a4;
- (id)_createClip;
- (id)_createClipWithSignificantEvent:(id)a3;
- (id)addNotificationForSignificantEvent:(id)a3;
- (id)addVideoInitData:(id)a3;
- (id)addVideoSegmentData:(id)a3 duration:(double)a4 timeOffsetWithinClip:(double)a5 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a6;
- (id)attributeDescriptions;
- (id)createClip;
- (id)finish;
- (int64_t)quality;
- (void)_handleFatalOperationFailureDueToError:(id)a3;
- (void)_operationCompleted:(id)a3 finalizeOnError:(BOOL)a4 future:(id)a5;
- (void)_startNextOperation;
- (void)setDelegate:(id)a3;
- (void)setDidCreateClipFuture:(id)a3;
@end

@implementation HMDCameraClipUploader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didCreateClipFuture, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clipUUID, 0);
}

- (void)setDidCreateClipFuture:(id)a3
{
}

- (NAFuture)didCreateClipFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableArray)operations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraClipUploaderFactory)factory
{
  return (HMDCameraClipUploaderFactory *)objc_getProperty(self, a2, 80, 1);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraClipUploaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraClipUploaderDelegate *)WeakRetained;
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCameraClipUploader *)self logIdentifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v18[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCameraClipUploader *)self clipUUID];
  v8 = (void *)[v6 initWithName:@"Clip UUID" value:v7];
  v18[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCameraClipUploader *)self startDate];
  v11 = (void *)[v9 initWithName:@"Start Date" value:v10];
  v18[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = NSNumber;
  [(HMDCameraClipUploader *)self targetFragmentDuration];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)[v12 initWithName:@"Target Fragment Duration" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

- (BOOL)_isCancelledError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"HMDCameraClipUploaderErrorDomain"]) {
    BOOL v5 = [v3 code] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_handleFatalOperationFailureDueToError:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x263F087E8];
  if (v4)
  {
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v4;
    v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v8 = [v6 errorWithDomain:@"HMDCameraClipUploaderErrorDomain" code:1 userInfo:v7];
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"HMDCameraClipUploaderErrorDomain" code:1 userInfo:0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(HMDCameraClipUploader *)self operations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13++) cancelWithError:v8];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  v14 = [(HMDCameraClipUploader *)self delegate];
  [v14 uploaderDidFailUpload:self];
}

- (void)_startNextOperation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraClipUploader *)self operations];
  id v4 = [v3 firstObject];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting next operation: %@", (uint8_t *)&v9, 0x16u);
    }
    [v4 start];
  }
}

- (void)_operationCompleted:(id)a3 finalizeOnError:(BOOL)a4 future:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 error];
  if (v10 && v6 && ![(HMDCameraClipUploader *)self _isCancelledError:v10])
  {
    __int16 v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v14;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling fatal error for operation %{public}@: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    [(HMDCameraClipUploader *)v12 _handleFatalOperationFailureDueToError:v10];
  }
  long long v15 = [(HMDCameraClipUploader *)self operations];
  [v15 removeObject:v8];

  long long v16 = (void *)MEMORY[0x230FBD990]();
  long long v17 = self;
  long long v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    int v20 = 138543618;
    v21 = v19;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Operation completed: %@", (uint8_t *)&v20, 0x16u);
  }
  [(HMDCameraClipUploader *)v17 _startNextOperation];
  if (v10) {
    [v9 finishWithError:v10];
  }
  else {
    [v9 finishWithNoResult];
  }
}

- (id)_addOperation:(id)a3 finalizeClipOnError:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_initWeak(&location, v6);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke;
  v20[3] = &unk_264A29970;
  v20[4] = self;
  objc_copyWeak(&v22, &location);
  BOOL v23 = a4;
  id v9 = v8;
  id v21 = v9;
  uint64_t v10 = (void *)MEMORY[0x230FBD990]([v6 setCompletionBlock:v20]);
  __int16 v11 = self;
  HMFGetOSLogHandle();
  uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding operation to queue: %@", buf, 0x16u);
  }
  v14 = [(HMDCameraClipUploader *)v11 operations];
  [v14 addObject:v6];

  long long v15 = [(HMDCameraClipUploader *)v11 operations];
  BOOL v16 = [v15 count] == 1;

  if (v16) {
    [(HMDCameraClipUploader *)v11 _startNextOperation];
  }
  long long v17 = v21;
  id v18 = v9;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

void __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke_2;
  v4[3] = &unk_264A29970;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v2, v4);

  objc_destroyWeak(&v6);
}

void __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) _operationCompleted:WeakRetained finalizeOnError:*(unsigned __int8 *)(a1 + 56) future:*(void *)(a1 + 40)];
}

- (id)_createClipWithSignificantEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipUploader *)self factory];
  char v7 = [(HMDCameraClipUploader *)self clipUUID];
  id v8 = [(HMDCameraClipUploader *)self localZone];
  [(HMDCameraClipUploader *)self targetFragmentDuration];
  double v10 = v9;
  __int16 v11 = [(HMDCameraClipUploader *)self startDate];
  int64_t v12 = [(HMDCameraClipUploader *)self quality];
  uint64_t v13 = [(HMDCameraClipUploader *)self encryptionManager];
  v14 = [v6 createCreateClipWithSignificantEventOperationForClipModelID:v7 localZone:v8 significantEvent:v4 targetFragmentDuration:v11 clipStartDate:v12 quality:v13 encryptionManager:v10];

  long long v15 = [(HMDCameraClipUploader *)self _addOperation:v14 finalizeClipOnError:1];

  return v15;
}

- (id)_createClip
{
  id v3 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipUploader *)self factory];
  id v5 = [(HMDCameraClipUploader *)self clipUUID];
  id v6 = [(HMDCameraClipUploader *)self localZone];
  [(HMDCameraClipUploader *)self targetFragmentDuration];
  double v8 = v7;
  double v9 = [(HMDCameraClipUploader *)self startDate];
  int64_t v10 = [(HMDCameraClipUploader *)self quality];
  __int16 v11 = [(HMDCameraClipUploader *)self encryptionManager];
  int64_t v12 = [v4 createCreateClipOperationForClipModelID:v5 localZone:v6 targetFragmentDuration:v9 clipStartDate:v10 quality:v11 encryptionManager:v8];

  uint64_t v13 = [(HMDCameraClipUploader *)self _addOperation:v12 finalizeClipOnError:1];

  return v13;
}

- (BOOL)hasAddedCreateClipOperation
{
  v2 = [(HMDCameraClipUploader *)self didCreateClipFuture];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)finish
{
  BOOL v3 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipUploader *)self factory];
  id v5 = [(HMDCameraClipUploader *)self clipUUID];
  id v6 = [(HMDCameraClipUploader *)self localZone];
  double v7 = [v4 createFinalizeClipOperationForModelID:v5 localZone:v6];

  double v8 = [(HMDCameraClipUploader *)self _addOperation:v7 finalizeClipOnError:0];

  return v8;
}

- (id)addVideoSegmentData:(id)a3 duration:(double)a4 timeOffsetWithinClip:(double)a5 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  __int16 v11 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v11);

  if ([(HMDCameraClipUploader *)self hasAddedCreateClipOperation])
  {
    int64_t v12 = objc_alloc_init(HMDCameraClipSegmentMetadata);
    [(HMDCameraClipSegmentMetadata *)v12 setType:1];
    [(HMDCameraClipSegmentMetadata *)v12 setDuration:a4];
    [(HMDCameraClipSegmentMetadata *)v12 setTimeOffset:a5];
    uint64_t v13 = [(HMDCameraClipUploader *)self factory];
    v14 = [(HMDCameraClipUploader *)self clipUUID];
    long long v15 = [(HMDCameraClipUploader *)self localZone];
    BOOL v16 = [(HMDCameraClipUploader *)self encryptionManager];
    long long v17 = [v13 createUploadVideoSegmentOperationForModelID:v14 localZone:v15 data:v10 metadata:v12 encryptionManager:v16];

    id v18 = [v17 uploadOperationEvent];
    [v18 setDidCausePreviousClipToFinalizeDueToDurationLimit:v6];

    v19 = [(HMDCameraClipUploader *)self _addOperation:v17 finalizeClipOnError:1];
  }
  else
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Asked to add video segment before clip has been created", (uint8_t *)&v27, 0xCu);
    }
    __int16 v24 = (void *)MEMORY[0x263F58190];
    v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    v19 = [v24 futureWithError:v25];
  }
  return v19;
}

- (id)addVideoInitData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDCameraClipUploader *)self hasAddedCreateClipOperation])
  {
    BOOL v6 = objc_alloc_init(HMDCameraClipSegmentMetadata);
    [(HMDCameraClipSegmentMetadata *)v6 setType:0];
    double v7 = [(HMDCameraClipUploader *)self factory];
    double v8 = [(HMDCameraClipUploader *)self clipUUID];
    double v9 = [(HMDCameraClipUploader *)self localZone];
    id v10 = [(HMDCameraClipUploader *)self encryptionManager];
    __int16 v11 = [v7 createUploadVideoSegmentOperationForModelID:v8 localZone:v9 data:v4 metadata:v6 encryptionManager:v10];

    int64_t v12 = [(HMDCameraClipUploader *)self _addOperation:v11 finalizeClipOnError:1];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Asked to add video init data before clip has been created", (uint8_t *)&v19, 0xCu);
    }
    long long v17 = (void *)MEMORY[0x263F58190];
    BOOL v6 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    int64_t v12 = [v17 futureWithError:v6];
  }

  return v12;
}

- (id)addNotificationForSignificantEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDCameraClipUploader *)self didCreateClipFuture];
  if (v6)
  {
    id v7 = (id)v6;
    double v8 = [(HMDCameraClipUploader *)self factory];
    double v9 = [(HMDCameraClipUploader *)self clipUUID];
    id v10 = [(HMDCameraClipUploader *)self localZone];
    __int16 v11 = [v8 createAddSignificantEventOperationForClipModelID:v9 localZone:v10 significantEvent:v4];

    id v12 = objc_alloc_init(MEMORY[0x263F58190]);
    objc_initWeak(&location, v11);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke;
    v25[3] = &unk_264A2B5D8;
    v25[4] = self;
    objc_copyWeak(&v27, &location);
    id v13 = v12;
    id v26 = v13;
    [v11 setCompletionBlock:v25];
    objc_initWeak(&from, self);
    v14 = [(HMDCameraClipUploader *)self didCreateClipFuture];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke_3;
    v21[3] = &unk_264A2A530;
    objc_copyWeak(&v23, &from);
    id v15 = v11;
    id v22 = v15;
    id v16 = (id)[v14 addSuccessBlock:v21];

    long long v17 = v22;
    id v18 = v13;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    int v19 = [(HMDCameraClipUploader *)self _createClipWithSignificantEvent:v4];
    [(HMDCameraClipUploader *)self setDidCreateClipFuture:v19];
    id v7 = v19;
    id v18 = v7;
  }

  return v18;
}

void __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke(id *a1)
{
  v2 = [a1[4] workQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke_2;
  v3[3] = &unk_264A2C148;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting significant event operation: %@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) start];
}

void __60__HMDCameraClipUploader_addNotificationForSignificantEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained error];
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 finishWithError:v2];
  }
  else {
    [v3 finishWithNoResult];
  }
}

- (id)createClip
{
  id v3 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipUploader *)self didCreateClipFuture];

  if (v4)
  {
    long long v17 = (HMDCameraClipUploader *)_HMFPreconditionFailure();
    return [(HMDCameraClipUploader *)v17 stateDump];
  }
  else
  {
    id v5 = [(HMDCameraClipUploader *)self factory];
    id v6 = [(HMDCameraClipUploader *)self clipUUID];
    id v7 = [(HMDCameraClipUploader *)self localZone];
    [(HMDCameraClipUploader *)self targetFragmentDuration];
    double v9 = v8;
    int v10 = [(HMDCameraClipUploader *)self startDate];
    int64_t v11 = [(HMDCameraClipUploader *)self quality];
    __int16 v12 = [(HMDCameraClipUploader *)self encryptionManager];
    uint64_t v13 = [v5 createCreateClipOperationForClipModelID:v6 localZone:v7 targetFragmentDuration:v10 clipStartDate:v11 quality:v12 encryptionManager:v9];

    uint64_t v14 = [(HMDCameraClipUploader *)self _addOperation:v13 finalizeClipOnError:1];
    [(HMDCameraClipUploader *)self setDidCreateClipFuture:v14];

    id v15 = [(HMDCameraClipUploader *)self didCreateClipFuture];

    return v15;
  }
}

- (NSDictionary)stateDump
{
  id v3 = [(HMDCameraClipUploader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [(HMDCameraClipUploader *)self operations];
  id v6 = [v5 firstObject];
  id v7 = [v6 description];
  [v4 setObject:v7 forKeyedSubscript:@"Current Operation"];

  double v8 = NSNumber;
  double v9 = [(HMDCameraClipUploader *)self operations];
  int v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [v4 setObject:v10 forKeyedSubscript:@"Total Operations Count"];

  int64_t v11 = (void *)[v4 copy];
  return (NSDictionary *)v11;
}

- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9 encryptionManager:(id)a10 factory:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id v44 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (fabs(a5) < 2.22044605e-16)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v44)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v20)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v21)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  __int16 v24 = v23;
  if (!v23)
  {
LABEL_19:
    v34 = (HMDCameraClipUploader *)_HMFPreconditionFailure();
    return [(HMDCameraClipUploader *)v34 initWithClipUUID:v36 startDate:v37 targetFragmentDuration:v42 quality:v38 localZone:v39 workQueue:v40 logIdentifier:v41];
  }
  v45.receiver = self;
  v45.super_class = (Class)HMDCameraClipUploader;
  v25 = [(HMDCameraClipUploader *)&v45 init];
  id v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_clipUUID, a3);
    uint64_t v27 = [v19 copy];
    startDate = v26->_startDate;
    v26->_startDate = (NSDate *)v27;

    v26->_targetFragmentDuration = a5;
    v26->_quality = a6;
    objc_storeStrong((id *)&v26->_localZone, a7);
    objc_storeStrong((id *)&v26->_workQueue, a8);
    uint64_t v29 = [NSString stringWithFormat:@"%@/%@", v21, v18];
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v29;

    objc_storeStrong((id *)&v26->_encryptionManager, a10);
    objc_storeStrong((id *)&v26->_factory, a11);
    uint64_t v31 = [MEMORY[0x263EFF980] array];
    operations = v26->_operations;
    v26->_operations = (NSMutableArray *)v31;
  }
  return v26;
}

- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9
{
  id v16 = (objc_class *)MEMORY[0x263F0E1A8];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a4;
  id v21 = a3;
  id v22 = objc_alloc_init(v16);
  id v23 = objc_alloc_init(HMDCameraClipUploaderFactory);
  __int16 v24 = [(HMDCameraClipUploader *)self initWithClipUUID:v21 startDate:v20 targetFragmentDuration:a6 quality:v19 localZone:v18 workQueue:v17 logIdentifier:a5 encryptionManager:v22 factory:v23];

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_230773 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_230773, &__block_literal_global_230774);
  }
  v2 = (void *)logCategory__hmf_once_v8_230775;
  return v2;
}

void __36__HMDCameraClipUploader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_230775;
  logCategory__hmf_once_v8_230775 = v0;
}

@end