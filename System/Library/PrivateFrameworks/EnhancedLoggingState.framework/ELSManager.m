@interface ELSManager
+ (id)sharedManager;
- (BOOL)array:(id)a3 isEqualToArray:(id)a4;
- (BOOL)commitConsentDataTransaction:(id)a3;
- (BOOL)commitConsentHandlesTransaction:(id)a3;
- (BOOL)commitConsentTransaction:(id)a3;
- (BOOL)commitDatesTransaction:(id)a3;
- (BOOL)commitFollowUpOptions:(id)a3;
- (BOOL)commitIdentifiersToRetryTransaction:(id)a3;
- (BOOL)commitMetadataTransaction:(id)a3;
- (BOOL)commitQueueTransaction:(id)a3;
- (BOOL)commitRetriesRemainingTransaction:(id)a3;
- (BOOL)commitSessionDeviceTransaction:(id)a3;
- (BOOL)commitStatusTransaction:(id)a3;
- (BOOL)commitUploadCompletedPercentage:(id)a3;
- (BOOL)object:(id)a3 isEqualToObject:(id)a4;
- (ELSSnapshot)snapshot;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)transactionQueue;
- (id)initSingleton;
- (void)beginUpdates;
- (void)commitBatchTransaction:(id)a3;
- (void)dealloc;
- (void)finish;
- (void)finishWithCompletion:(id)a3;
- (void)finishWithFailure;
- (void)finishWithFailureBlock:(id)a3;
- (void)flush;
- (void)flushWithCompletion:(id)a3;
- (void)getBugSessionActivityWithCompletion:(id)a3;
- (void)refreshWithCompletion:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)transactionWithBlock:(id)a3;
- (void)transactionWithBlock:(id)a3 completion:(id)a4;
@end

@implementation ELSManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_singleton;
  return v2;
}

uint64_t __27__ELSManager_sharedManager__block_invoke()
{
  sharedManager_singleton = [[ELSManager alloc] initSingleton];
  return MEMORY[0x270F9A758]();
}

- (id)initSingleton
{
  v10.receiver = self;
  v10.super_class = (Class)ELSManager;
  v2 = [(ELSManager *)&v10 init];
  if (v2)
  {
    +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement];
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.enhanced-logging-state"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    uint64_t v5 = objc_opt_new();
    snapshot = v2->_snapshot;
    v2->_snapshot = (ELSSnapshot *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.enhanced-logging-state.transactionQueue", 0);
    transactionQueue = v2->_transactionQueue;
    v2->_transactionQueue = (OS_dispatch_queue *)v7;

    [(ELSManager *)v2 beginUpdates];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ELSManager;
  [(ELSManager *)&v4 dealloc];
}

- (void)beginUpdates
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  objc_super v4 = [MEMORY[0x263F08A48] mainQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__ELSManager_beginUpdates__block_invoke;
  v6[3] = &unk_264522BE0;
  v6[4] = self;
  id v5 = (id)[v3 addObserverForName:@"ELSDidBatchUpdate" object:0 queue:v4 usingBlock:v6];
}

void __26__ELSManager_beginUpdates__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transactionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__ELSManager_beginUpdates__block_invoke_2;
  block[3] = &unk_264522BB8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __26__ELSManager_beginUpdates__block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) snapshot];
  uint64_t v4 = [v3 status];

  id v5 = objc_opt_new();
  [*(id *)(a1 + 32) setSnapshot:v5];

  objc_sync_exit(v2);
  v6 = [*(id *)(a1 + 32) snapshot];
  uint64_t v7 = [v6 status];

  if (v4 != v7)
  {
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    v9 = *(void **)(a1 + 32);
    v13 = @"ELSUserInfo";
    objc_super v10 = [v9 snapshot];
    v11 = (void *)[v10 copy];
    v14[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v8 postNotificationName:@"ELSDidUpdateStatus" object:v9 userInfo:v12];
  }
}

- (void)transactionWithBlock:(id)a3
{
}

- (void)transactionWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ELSManager *)self transactionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ELSManager_transactionWithBlock_completion___block_invoke;
  block[3] = &unk_264522C08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __46__ELSManager_transactionWithBlock_completion___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v2 = dispatch_semaphore_create(0);
  uint64_t v3 = [*(id *)(a1 + 32) snapshot];
  uint64_t v4 = [v3 status];

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  id v6 = [*(id *)(a1 + 32) snapshot];
  id v7 = (void *)[v6 copy];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) commitBatchTransaction:v7];
  [*(id *)(a1 + 32) setSnapshot:v7];
  dispatch_semaphore_signal(v2);
  objc_sync_exit(v5);

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v8);
  if (v4 != [v7 status])
  {
    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = @"ELSUserInfo";
    v14[0] = v7;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v9 postNotificationName:@"ELSDidUpdateStatus" object:v10 userInfo:v11];
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v7);
  }
}

- (void)finish
{
}

- (void)finishWithFailure
{
}

- (void)finishWithFailureBlock:(id)a3
{
}

void __37__ELSManager_finishWithFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStatus:8];
  [v2 setConsent:0];
  [v2 setQueue:0];
  [v2 setRetriesRemaining:0];
  [v2 setIdentifiersToRetry:0];
  [v2 setMetadata:0];
  [v2 setUploadCompletedPercentage:0];
  [v2 setFollowUpOptions:0];
  [v2 setTargetDevices:0];
  [v2 setConsentHandles:0];
  [v2 setConsentData:0];
}

- (void)finishWithCompletion:(id)a3
{
}

void __35__ELSManager_finishWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStatus:7];
  [v2 setConsent:0];
  [v2 setQueue:0];
  [v2 setRetriesRemaining:0];
  [v2 setIdentifiersToRetry:0];
  [v2 setMetadata:0];
  [v2 setUploadCompletedPercentage:0];
  [v2 setFollowUpOptions:0];
  [v2 setTargetDevices:0];
  [v2 setConsentHandles:0];
  [v2 setConsentData:0];
}

- (void)flush
{
}

- (void)flushWithCompletion:(id)a3
{
}

void __34__ELSManager_flushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStatus:0];
  [v2 setConsent:0];
  [v2 setStartDate:0];
  [v2 setEndDate:0];
  [v2 setQueue:0];
  [v2 setRetriesRemaining:0];
  [v2 setIdentifiersToRetry:0];
  [v2 setMetadata:0];
  [v2 setUploadCompletedPercentage:0];
  [v2 setFollowUpOptions:0];
  [v2 setTargetDevices:0];
  [v2 setConsentHandles:0];
  [v2 setConsentData:0];
}

- (void)commitBatchTransaction:(id)a3
{
  id v4 = a3;
  BOOL v14 = [(ELSManager *)self commitStatusTransaction:v4];
  BOOL v15 = [(ELSManager *)self commitConsentTransaction:v4];
  BOOL v17 = [(ELSManager *)self commitDatesTransaction:v4];
  BOOL v16 = [(ELSManager *)self commitQueueTransaction:v4];
  BOOL v5 = [(ELSManager *)self commitConsentHandlesTransaction:v4];
  BOOL v6 = [(ELSManager *)self commitRetriesRemainingTransaction:v4];
  BOOL v7 = [(ELSManager *)self commitIdentifiersToRetryTransaction:v4];
  BOOL v8 = [(ELSManager *)self commitMetadataTransaction:v4];
  BOOL v9 = [(ELSManager *)self commitUploadCompletedPercentage:v4];
  BOOL v10 = [(ELSManager *)self commitFollowUpOptions:v4];
  BOOL v11 = [(ELSManager *)self commitSessionDeviceTransaction:v4];
  BOOL v12 = [(ELSManager *)self commitConsentDataTransaction:v4];

  if (v12 || v11 || v10 || v9 || v8 || v7 || v6 || v5 || v16 || v17 || v15 || v14)
  {
    id v13 = [(ELSManager *)self defaults];
    [v13 synchronize];

    id v18 = [MEMORY[0x263F087C8] defaultCenter];
    [v18 postNotificationName:@"ELSDidBatchUpdate" object:0 userInfo:0 deliverImmediately:1];
  }
}

- (BOOL)commitStatusTransaction:(id)a3
{
  id v4 = a3;
  if (![v4 status])
  {
    BOOL v11 = [(ELSManager *)self snapshot];
    uint64_t v12 = [v11 status];

    if (v12)
    {
      BOOL v9 = [(ELSManager *)self defaults];
      [v9 removeObjectForKey:@"status"];
      goto LABEL_7;
    }
  }
  uint64_t v5 = [v4 status];
  BOOL v6 = [(ELSManager *)self snapshot];
  uint64_t v7 = [v6 status];

  if (v5 != v7)
  {
    BOOL v9 = [(ELSManager *)self defaults];
    BOOL v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "status"));
    [v9 setObject:v10 forKey:@"status"];

LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitConsentTransaction:(id)a3
{
  id v4 = a3;
  if (![v4 consent])
  {
    BOOL v11 = [(ELSManager *)self snapshot];
    uint64_t v12 = [v11 consent];

    if (v12)
    {
      BOOL v9 = [(ELSManager *)self defaults];
      [v9 removeObjectForKey:@"consent"];
      goto LABEL_7;
    }
  }
  uint64_t v5 = [v4 consent];
  BOOL v6 = [(ELSManager *)self snapshot];
  uint64_t v7 = [v6 consent];

  if (v5 != v7)
  {
    BOOL v9 = [(ELSManager *)self defaults];
    BOOL v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "consent"));
    [v9 setObject:v10 forKey:@"consent"];

LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitDatesTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ELSManager *)self defaults];
  BOOL v6 = [v5 objectForKey:@"dates"];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [NSDictionary dictionary];
  }
  BOOL v9 = v8;

  BOOL v10 = (void *)[v9 mutableCopy];
  BOOL v11 = [v4 startDate];
  uint64_t v12 = [(ELSManager *)self snapshot];
  id v13 = [v12 startDate];
  if ([(ELSManager *)self object:v11 isEqualToObject:v13])
  {
  }
  else
  {
    BOOL v14 = [v4 startDate];

    if (v14)
    {
      BOOL v15 = [v4 startDate];
      [v10 setObject:v15 forKeyedSubscript:@"startDate"];

      goto LABEL_12;
    }
  }
  BOOL v16 = [v4 startDate];
  if (v16)
  {
  }
  else
  {
    BOOL v17 = [(ELSManager *)self snapshot];
    id v18 = [v17 startDate];

    if (v18) {
      [v10 removeObjectForKey:@"startDate"];
    }
  }
LABEL_12:
  v19 = [v4 endDate];
  v20 = [(ELSManager *)self snapshot];
  v21 = [v20 endDate];
  if ([(ELSManager *)self object:v19 isEqualToObject:v21])
  {
  }
  else
  {
    v22 = [v4 endDate];

    if (v22)
    {
      v23 = [v4 endDate];
      [v10 setObject:v23 forKeyedSubscript:@"endDate"];

      goto LABEL_20;
    }
  }
  v24 = [v4 endDate];
  if (v24)
  {
  }
  else
  {
    v25 = [(ELSManager *)self snapshot];
    v26 = [v25 endDate];

    if (v26) {
      [v10 removeObjectForKey:@"endDate"];
    }
  }
LABEL_20:
  v27 = [NSDictionary dictionaryWithDictionary:v10];
  v28 = [v27 allKeys];
  if ([v28 count])
  {
  }
  else
  {
    v31 = [v9 allKeys];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      v30 = [(ELSManager *)self defaults];
      [v30 removeObjectForKey:@"dates"];
      goto LABEL_27;
    }
  }
  if (![(ELSManager *)self object:v27 isEqualToObject:v9])
  {
    v30 = [(ELSManager *)self defaults];
    [v30 setObject:v27 forKey:@"dates"];
LABEL_27:

    BOOL v29 = 1;
    goto LABEL_28;
  }
  BOOL v29 = 0;
LABEL_28:

  return v29;
}

- (BOOL)commitQueueTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 queue];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    BOOL v14 = [v13 queue];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"queue"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 queue];
  uint64_t v7 = [(ELSManager *)self snapshot];
  id v8 = [v7 queue];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 encodedQueue];
    [v11 setObject:v12 forKey:@"queue"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitConsentHandlesTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 consentHandles];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    BOOL v14 = [v13 consentHandles];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"consentHandles"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 consentHandles];
  uint64_t v7 = [(ELSManager *)self snapshot];
  id v8 = [v7 consentHandles];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 consentHandles];
    [v11 setObject:v12 forKey:@"consentHandles"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitSessionDeviceTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 targetDevices];
  if (v5)
  {
  }
  else
  {
    BOOL v16 = [(ELSManager *)self snapshot];
    BOOL v17 = [v16 targetDevices];

    if (v17)
    {
      id v18 = [(ELSManager *)self defaults];
      [v18 removeObjectForKey:@"targetDevices"];

      BOOL v10 = 1;
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 targetDevices];
  uint64_t v7 = [(ELSManager *)self snapshot];
  id v8 = [v7 targetDevices];
  BOOL v9 = [(ELSManager *)self array:v6 isEqualToArray:v8];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x263F08910];
    uint64_t v12 = [v4 targetDevices];
    id v20 = 0;
    id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:0 error:&v20];
    id v14 = v20;

    BOOL v15 = [(ELSManager *)self defaults];
    [v15 setObject:v13 forKey:@"targetDevices"];

    BOOL v10 = v14 == 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)commitConsentDataTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 consentData];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    id v14 = [v13 consentData];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"consentData"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 consentData];
  uint64_t v7 = [(ELSManager *)self snapshot];
  id v8 = [v7 consentData];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 consentData];
    [v11 setObject:v12 forKey:@"consentData"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitRetriesRemainingTransaction:(id)a3
{
  id v4 = a3;
  if (![v4 retriesRemaining])
  {
    BOOL v11 = [(ELSManager *)self snapshot];
    uint64_t v12 = [v11 retriesRemaining];

    if (v12)
    {
      BOOL v9 = [(ELSManager *)self defaults];
      [v9 removeObjectForKey:@"retriesRemaining"];
      goto LABEL_7;
    }
  }
  uint64_t v5 = [v4 retriesRemaining];
  BOOL v6 = [(ELSManager *)self snapshot];
  uint64_t v7 = [v6 retriesRemaining];

  if (v5 != v7)
  {
    BOOL v9 = [(ELSManager *)self defaults];
    BOOL v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "retriesRemaining"));
    [v9 setObject:v10 forKey:@"retriesRemaining"];

LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitIdentifiersToRetryTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifiersToRetry];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    id v14 = [v13 identifiersToRetry];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"identifiersToRetry"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 identifiersToRetry];
  uint64_t v7 = [(ELSManager *)self snapshot];
  BOOL v8 = [v7 identifiersToRetry];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 identifiersToRetry];
    [v11 setObject:v12 forKey:@"identifiersToRetry"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitMetadataTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    id v14 = [v13 metadata];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"metadata"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 metadata];
  uint64_t v7 = [(ELSManager *)self snapshot];
  BOOL v8 = [v7 metadata];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 metadata];
    [v11 setObject:v12 forKey:@"metadata"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitUploadCompletedPercentage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uploadCompletedPercentage];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    id v14 = [v13 uploadCompletedPercentage];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"uploadCompletedPercentage"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 uploadCompletedPercentage];
  uint64_t v7 = [(ELSManager *)self snapshot];
  BOOL v8 = [v7 uploadCompletedPercentage];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 uploadCompletedPercentage];
    [v11 setObject:v12 forKey:@"uploadCompletedPercentage"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitFollowUpOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 followUpOptions];
  if (v5)
  {
  }
  else
  {
    id v13 = [(ELSManager *)self snapshot];
    id v14 = [v13 followUpOptions];

    if (v14)
    {
      BOOL v11 = [(ELSManager *)self defaults];
      [v11 removeObjectForKey:@"followUpOptions"];
      goto LABEL_8;
    }
  }
  BOOL v6 = [v4 followUpOptions];
  uint64_t v7 = [(ELSManager *)self snapshot];
  BOOL v8 = [v7 followUpOptions];
  BOOL v9 = [(ELSManager *)self object:v6 isEqualToObject:v8];

  if (!v9)
  {
    BOOL v11 = [(ELSManager *)self defaults];
    uint64_t v12 = [v4 followUpOptions];
    [v11 setObject:v12 forKey:@"followUpOptions"];

LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqual:a4];
  }
  else {
    return 1;
  }
}

- (BOOL)array:(id)a3 isEqualToArray:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToArray:a4];
  }
  else {
    return 1;
  }
}

- (void)refreshWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F731000, v5, OS_LOG_TYPE_DEFAULT, "Performing refresh of enhanced logging state...", buf, 2u);
  }

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  uint64_t v24 = 0;
  BOOL v6 = [(ELSManager *)self snapshot];
  uint64_t v7 = [v6 status];

  uint64_t v24 = v7;
  *(void *)buf = 0;
  id v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  BOOL v8 = [(ELSManager *)self snapshot];
  id v22 = [v8 dedSessionIdentifier];

  BOOL v9 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *((void *)v18 + 5);
    *(_DWORD *)v25 = 138412290;
    uint64_t v26 = v10;
    _os_log_impl(&dword_21F731000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing %@ bug session...", v25, 0xCu);
  }

  objc_initWeak((id *)v25, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__ELSManager_refreshWithCompletion___block_invoke;
  v12[3] = &unk_264522C78;
  id v14 = buf;
  BOOL v15 = v23;
  objc_copyWeak(&v16, (id *)v25);
  id v11 = v4;
  id v13 = v11;
  [(ELSManager *)self getBugSessionActivityWithCompletion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)v25);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v23, 8);
}

void __36__ELSManager_refreshWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_21F731000, v4, OS_LOG_TYPE_DEFAULT, "Successfully retrieved %@ bug session activity...", buf, 0xCu);
  }

  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6 == 8)
  {
    uint64_t v7 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = +[ELSSnapshot statusToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      BOOL v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v9;
      _os_log_impl(&dword_21F731000, v7, OS_LOG_TYPE_DEFAULT, "ELS is at [%@] but no %@ session exists: marking ELS failed...", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __36__ELSManager_refreshWithCompletion___block_invoke_28;
    v26[3] = &unk_264522C50;
    id v27 = *(id *)(a1 + 32);
    char v28 = a2;
    [WeakRetained finishWithFailureBlock:v26];

    id v11 = v27;
    goto LABEL_19;
  }
  uint64_t v12 = ELSLogHandleForCategory(11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 3 && (a2 & 1) == 0)
  {
    if (v13)
    {
      id v14 = +[ELSSnapshot statusToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      BOOL v15 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      __int16 v31 = 2112;
      uint64_t v32 = v15;
      _os_log_impl(&dword_21F731000, v12, OS_LOG_TYPE_DEFAULT, "ELS is at [%@] but no %@ session exists: marking ELS finished...", buf, 0x16u);
    }
    id v16 = objc_loadWeakRetained((id *)(a1 + 56));
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __36__ELSManager_refreshWithCompletion___block_invoke_29;
    void v23[3] = &unk_264522C50;
    id v24 = *(id *)(a1 + 32);
    char v25 = a2;
    [v16 finishWithCompletion:v23];

    id v11 = v24;
    goto LABEL_19;
  }
  if (v13)
  {
    BOOL v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (a2) {
      id v18 = @"active";
    }
    else {
      id v18 = @"inactive";
    }
    uint64_t v19 = +[ELSSnapshot statusToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    *(_DWORD *)buf = 138412802;
    v30 = v17;
    __int16 v31 = 2112;
    uint64_t v32 = v18;
    __int16 v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_21F731000, v12, OS_LOG_TYPE_DEFAULT, "%@ bug session is %@, and ELS is at [%@]: no change needed.", buf, 0x20u);
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20)
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    v21 = [v11 snapshot];
    id v22 = (void *)[v21 copy];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v20 + 16))(v20, v22, a2, 0);

LABEL_19:
  }
}

void __36__ELSManager_refreshWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21F731000, v4, OS_LOG_TYPE_DEFAULT, "Successfully flushed ELS.", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __36__ELSManager_refreshWithCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21F731000, v4, OS_LOG_TYPE_DEFAULT, "Successfully flushed ELS.", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBugSessionActivityWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = ELSLogHandleForCategory(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(ELSManager *)self snapshot];
    uint64_t v7 = [v6 dedSessionIdentifier];
    int v16 = 138412290;
    BOOL v17 = v7;
    _os_log_impl(&dword_21F731000, v5, OS_LOG_TYPE_DEFAULT, "Checking %@ bug session activity (defaults scan)...", (uint8_t *)&v16, 0xCu);
  }
  BOOL v8 = [(ELSManager *)self snapshot];
  BOOL v9 = [v8 targetDevices];

  if (v9)
  {
    uint64_t v10 = 1;
  }
  else
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.diagnosticextensionsd"];
    uint64_t v12 = v11;
    if (v11)
    {
      BOOL v13 = [v11 objectForKey:@"sessionIdentifiers"];
      if (v13)
      {
        id v14 = [(ELSManager *)self snapshot];
        BOOL v15 = [v14 dedSessionIdentifier];
        uint64_t v10 = [v13 containsObject:v15];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  v4[2](v4, v10);
}

- (ELSSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end