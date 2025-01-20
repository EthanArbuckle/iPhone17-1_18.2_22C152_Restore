@interface BTLEScanner
+ (id)sharedBTLEScanner;
- (BTLEScanner)init;
- (void)_checkCanScan;
- (void)_flushQueue;
- (void)_stopScan;
- (void)_stopTimer;
- (void)didUpdateBTLEState:(int64_t)a3;
- (void)setScanTimer:(uint64_t)a1;
- (void)timerDidFire:(id)a3;
@end

@implementation BTLEScanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_cubleScanner, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)timerDidFire:(id)a3
{
  v6 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    scanTimer = self->_scanTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    scanTimer = 0;
  }
  v5 = v6;
  if (scanTimer == v6)
  {
    [(BTLEScanner *)self _stopScan];
    [(BTLEScanner *)self _flushQueue];
    v5 = v6;
  }
}

- (void)_stopScan
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    [(BTLEScanner *)self _stopTimer];
    cubleScanner = self->_cubleScanner;
    if (cubleScanner)
    {
      [(CUBLEScanner *)cubleScanner invalidate];
      objc_storeStrong((id *)&self->_cubleScanner, 0);
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    [0 _stopTimer];
  }
}

- (void)_checkCanScan
{
  v2 = self;
  if (self) {
    self = (BTLEScanner *)self->_scanQueue;
  }
  if ([(BTLEScanner *)self countForQueue:@"ScanQueue"])
  {
    uint64_t v30 = 0;
    v31 = (double *)&v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    if (v2) {
      scanQueue = v2->_scanQueue;
    }
    else {
      scanQueue = 0;
    }
    v4 = scanQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __28__BTLEScanner__checkCanScan__block_invoke;
    v29[3] = &unk_1E6A0AD40;
    v29[4] = &v30;
    [(HMDAccessoryQueues *)v4 enumerateQueue:@"ScanQueue" enumerateAccessory:v29];

    id v5 = objc_alloc(MEMORY[0x1E4F65580]);
    v6 = (void *)[v5 initWithTimeInterval:1 options:v31[3]];
    -[BTLEScanner setScanTimer:]((uint64_t)v2, v6);

    if (v2) {
      scanTimer = v2->_scanTimer;
    }
    else {
      scanTimer = 0;
    }
    v8 = scanTimer;
    [(HMFTimer *)v8 setDelegate:v2];

    if (v2)
    {
      v9 = v2->_workQueue;
      v10 = v2->_scanTimer;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v11 = v10;
    [(HMFTimer *)v11 setDelegateQueue:v9];

    if (v2) {
      v12 = v2->_scanTimer;
    }
    else {
      v12 = 0;
    }
    v13 = v12;
    [(HMFTimer *)v13 resume];

    objc_initWeak(&location, v2);
    id v14 = objc_alloc_init(MEMORY[0x1E4F5E0D8]);
    v15 = v14;
    if (v2)
    {
      objc_storeStrong((id *)&v2->_cubleScanner, v14);

      cubleScanner = v2->_cubleScanner;
    }
    else
    {

      cubleScanner = 0;
    }
    v17 = cubleScanner;
    [(CUBLEScanner *)v17 setScanFlags:64];

    if (IsAppleTV())
    {
      if (v2) {
        v18 = v2->_cubleScanner;
      }
      else {
        v18 = 0;
      }
      v19 = v18;
      [(CUBLEScanner *)v19 setScanFlags:[(CUBLEScanner *)v19 scanFlags] | 1];
    }
    if (v2) {
      v20 = v2->_cubleScanner;
    }
    else {
      v20 = 0;
    }
    v21 = v20;
    [(CUBLEScanner *)v21 setChangeFlags:0];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __28__BTLEScanner__checkCanScan__block_invoke_2;
    v26[3] = &unk_1E6A0AD90;
    objc_copyWeak(&v27, &location);
    if (v2) {
      v22 = v2->_cubleScanner;
    }
    else {
      v22 = 0;
    }
    v23 = v22;
    [(CUBLEScanner *)v23 setDeviceFoundHandler:v26];

    if (v2) {
      v24 = v2->_cubleScanner;
    }
    else {
      v24 = 0;
    }
    v25 = v24;
    [(CUBLEScanner *)v25 activate];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    [(BTLEScanner *)v2 _stopScan];
  }
}

uint64_t __28__BTLEScanner__checkCanScan__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v3 = *(void *)(a3 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

- (void)setScanTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void __28__BTLEScanner__checkCanScan__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    v6 = WeakRetained[1];
  }
  else {
    v6 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__BTLEScanner__checkCanScan__block_invoke_3;
  v8[3] = &unk_1E6A197C8;
  v8[4] = WeakRetained;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void __28__BTLEScanner__checkCanScan__block_invoke_3(uint64_t a1)
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__48857;
  v24 = __Block_byref_object_dispose__48858;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[5];
  }
  id v3 = v2;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __28__BTLEScanner__checkCanScan__block_invoke_11;
  v11 = &unk_1E6A0AD68;
  v4 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v4;
  id v14 = &v16;
  v15 = &v20;
  [v3 enumerateQueue:@"ScanQueue" enumerateAccessory:&v8];

  id v5 = v21;
  if (v21[5])
  {
    v6 = *(void **)(a1 + 32);
    if (v6) {
      v6 = (void *)v6[5];
    }
    id v7 = v6;
    objc_msgSend(v7, "removeAccessory:", v5[5], v8, v9, v10, v11, v12);

    [(id)v21[5] scanningCompleteWithAccessoryFound:1 suspended:*((unsigned __int8 *)v17 + 24)];
    [*(id *)(a1 + 32) _checkCanScan];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

uint64_t __28__BTLEScanner__checkCanScan__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  v4 = a2;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = id v25 = v4;
    [v6 connectivityInfo];
    uint64_t v12 = v24 = v7;
    id v13 = [v12 woBLEInfo];
    id v14 = [v13 bleIdentifier];
    v15 = [*(id *)(a1 + 40) lgBTAddress];
    *(_DWORD *)buf = 138543874;
    id v27 = v11;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Scan result -- looking for %@ found %@", buf, 0x20u);

    id v7 = v24;
    v4 = v25;
  }

  uint64_t v16 = [v6 connectivityInfo];
  v17 = [v16 woBLEInfo];
  uint64_t v18 = [v17 bleIdentifier];
  char v19 = [*(id *)(a1 + 40) lgBTAddress];
  uint64_t IsReversed = HMFDataIsReversed();

  if (IsReversed)
  {
    id v21 = [*(id *)(a1 + 40) manufacturerData];
    uint64_t v22 = [v21 bytes];

    if (*(unsigned char *)(v22 + 5) == 18) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
  }

  return IsReversed;
}

- (void)_stopTimer
{
  if (self)
  {
    [(HMFTimer *)self->_scanTimer suspend];
    objc_storeStrong((id *)&self->_scanTimer, 0);
  }
  else
  {
    [0 suspend];
  }
}

- (void)_flushQueue
{
  id v3 = 0;
  if (!self) {
    goto LABEL_5;
  }
LABEL_2:
  for (i = self->_scanQueue; ; i = 0)
  {
    id v5 = [(HMDAccessoryQueues *)i popAccessoryFromQueue:@"ScanQueue"];

    if (!v5) {
      break;
    }
    [v5 scanningCompleteWithAccessoryFound:0 suspended:0];
    id v3 = v5;
    if (self) {
      goto LABEL_2;
    }
LABEL_5:
    ;
  }
}

- (BTLEScanner)init
{
  v13.receiver = self;
  v13.super_class = (Class)BTLEScanner;
  uint64_t v2 = [(BTLEScanner *)&v13 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F5BC60] getInstance];
    centralManager = v2->_centralManager;
    v2->_centralManager = (HAPBTLECentralManager *)v8;

    v10 = objc_alloc_init(HMDAccessoryQueues);
    scanQueue = v2->_scanQueue;
    v2->_scanQueue = v10;

    [(HMDAccessoryQueues *)v2->_scanQueue createQueue:@"ScanQueue"];
    [(HAPBTLECentralManager *)v2->_centralManager registerCentralManagerDelegate:v2];
  }
  return v2;
}

- (void)didUpdateBTLEState:(int64_t)a3
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__BTLEScanner_didUpdateBTLEState___block_invoke;
  v4[3] = &unk_1E6A189D0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

uint64_t __34__BTLEScanner_didUpdateBTLEState___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) != 5)
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) _stopScan];
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _flushQueue];
  }
  return result;
}

+ (id)sharedBTLEScanner
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__BTLEScanner_sharedBTLEScanner__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedBTLEScanner_onceToken != -1) {
    dispatch_once(&sharedBTLEScanner_onceToken, block);
  }
  uint64_t v1 = (void *)sharedBTLEScanner_sharedScanner;
  return v1;
}

uint64_t __32__BTLEScanner_sharedBTLEScanner__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedBTLEScanner_sharedScanner;
  sharedBTLEScanner_sharedScanner = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end