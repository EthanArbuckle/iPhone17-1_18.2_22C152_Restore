@interface HMDBTLEAdvertiser
+ (id)initializeAdvertiser;
+ (id)sharedAdvertiser;
- (BOOL)isAdvertisingForAccessory:(id)a3;
- (BOOL)isReady;
- (CUBLEAdvertiser)leAdvertiser;
- (HAPBTLECentralManager)centralManager;
- (HMDAccessoryQueues)powerOnQueues;
- (HMDBTLEAdvertiser)init;
- (HMDHAPAccessory)accessory;
- (HMFTimer)advertisementTimer;
- (OS_dispatch_queue)workQueue;
- (double)advertisementTimeInterval;
- (double)reachabilityTimeInterval;
- (void)_advertisementTimeout;
- (void)_cancelOn:(id)a3;
- (void)_clearAdvertiser;
- (void)_completePendingPowerOnRequest:(id)a3;
- (void)_flushQueue:(id)a3;
- (void)_flushQueues;
- (void)_startAdvertising;
- (void)_stopAdvertisement:(id)a3;
- (void)cancelOn:(id)a3;
- (void)didUpdateBTLEState:(int64_t)a3;
- (void)powerOn:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAdvertisementTimeInterval:(double)a3;
- (void)setAdvertisementTimer:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setLeAdvertiser:(id)a3;
- (void)setPowerOnQueues:(id)a3;
- (void)setReachabilityTimeInterval:(double)a3;
- (void)stopAdvertisement:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDBTLEAdvertiser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_powerOnQueues, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_advertisementTimer, 0);
  objc_storeStrong((id *)&self->_leAdvertiser, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setReachabilityTimeInterval:(double)a3
{
  self->_reachabilityTimeInterval = a3;
}

- (double)reachabilityTimeInterval
{
  return self->_reachabilityTimeInterval;
}

- (void)setAdvertisementTimeInterval:(double)a3
{
  self->_advertisementTimeInterval = a3;
}

- (double)advertisementTimeInterval
{
  return self->_advertisementTimeInterval;
}

- (void)setPowerOnQueues:(id)a3
{
}

- (HMDAccessoryQueues)powerOnQueues
{
  return self->_powerOnQueues;
}

- (void)setCentralManager:(id)a3
{
}

- (HAPBTLECentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  return self->_accessory;
}

- (void)setAdvertisementTimer:(id)a3
{
}

- (HMFTimer)advertisementTimer
{
  return self->_advertisementTimer;
}

- (void)setLeAdvertiser:(id)a3
{
}

- (CUBLEAdvertiser)leAdvertiser
{
  return self->_leAdvertiser;
}

- (BOOL)isReady
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v3 = [(HMDBTLEAdvertiser *)self workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__HMDBTLEAdvertiser_isReady__block_invoke;
  v5[3] = &unk_264A2F0A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __28__HMDBTLEAdvertiser_isReady__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) centralManager];
  unint64_t v3 = [v2 state];

  if (v3 > 5 || ((1 << v3) & 0x29) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)isAdvertisingForAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v5 = [(HMDBTLEAdvertiser *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__HMDBTLEAdvertiser_isAdvertisingForAccessory___block_invoke;
    block[3] = &unk_264A2F698;
    block[4] = self;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __47__HMDBTLEAdvertiser_isAdvertisingForAccessory___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) powerOnQueues];
  unint64_t v3 = [v2 whichQueueForAccessory:*(void *)(a1 + 40)];

  if (v3
    || (id v4 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) accessory],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__61212;
  v13[4] = __Block_byref_object_dispose__61213;
  id v4 = a3;
  id v14 = v4;
  v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [(HMDBTLEAdvertiser *)v6 accessory];
    v10 = [v9 identifier];
    *(_DWORD *)buf = 138543874;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Wireless Timer: %@ did fire for %@", buf, 0x20u);
  }
  uint64_t v11 = [(HMDBTLEAdvertiser *)v6 workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __34__HMDBTLEAdvertiser_timerDidFire___block_invoke;
  v12[3] = &unk_264A2F0A0;
  v12[4] = v6;
  v12[5] = v13;
  dispatch_async(v11, v12);

  _Block_object_dispose(v13, 8);
}

void __34__HMDBTLEAdvertiser_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  unint64_t v3 = [*(id *)(a1 + 32) advertisementTimer];

  if (v2 == v3)
  {
    BOOL v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      v10 = [*(id *)(a1 + 32) accessory];
      uint64_t v11 = [v10 identifier];
      int v18 = 138543618;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Wireless BTLE Advertisement timeout for %@", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) _advertisementTimeout];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) powerOnQueues];
    v5 = [v4 getAccessoryForContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fromQueue:@"ReachabilityQueue"];

    if (v5)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) suspend];
      [*(id *)(a1 + 32) _completePendingPowerOnRequest:v5];
    }
    else
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        id v16 = [*(id *)(a1 + 32) accessory];
        __int16 v17 = [v16 identifier];
        int v18 = 138543618;
        __int16 v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected BTLE Advertisement timer for %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)_advertisementTimeout
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDBTLEAdvertiser *)self leAdvertiser];

  if (v3)
  {
    id v4 = [(HMDBTLEAdvertiser *)self advertisementTimer];
    [v4 suspend];

    [(HMDBTLEAdvertiser *)self setAdvertisementTimer:0];
    v5 = [(HMDBTLEAdvertiser *)self accessory];
    [(HMDBTLEAdvertiser *)self setAccessory:0];
    BOOL v6 = (void *)MEMORY[0x230FBD990]([(HMDBTLEAdvertiser *)self _clearAdvertiser]);
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      v10 = [v5 identifier];
      int v18 = 138543618;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Wireless - Starting reachable timer for accessory: %@", (uint8_t *)&v18, 0x16u);
    }
    if ([v5 isReachable])
    {
      [(HMDBTLEAdvertiser *)v7 _completePendingPowerOnRequest:v5];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x263F42658]);
      [(HMDBTLEAdvertiser *)v7 reachabilityTimeInterval];
      id v16 = objc_msgSend(v15, "initWithTimeInterval:options:", 1);
      [v16 setDelegate:v7];
      [v16 resume];
      __int16 v17 = [(HMDBTLEAdvertiser *)v7 powerOnQueues];
      [v17 addAccessory:v5 toQueue:@"ReachabilityQueue" context:v16];
    }
    [(HMDBTLEAdvertiser *)v7 _startAdvertising];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v18 = 138543362;
      __int16 v19 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Wireless LE Timeout - no gleAdvertiser", (uint8_t *)&v18, 0xCu);
    }
    v5 = [(HMDBTLEAdvertiser *)v12 accessory];
    [(HMDBTLEAdvertiser *)v12 _completePendingPowerOnRequest:v5];
  }
}

- (void)powerOn:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBTLEAdvertiser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HMDBTLEAdvertiser_powerOn___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __29__HMDBTLEAdvertiser_powerOn___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) centralManager];
  unint64_t v3 = [v2 state];

  if (v3 > 5 || ((1 << v3) & 0x29) == 0)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138543618;
      id v16 = v11;
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Wireless - Ignoring power on request -- Bluetooth not in a state to turn on accessory: %@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:54 userInfo:0];
    [*(id *)(a1 + 40) powerOnComplete:v13];
  }
  else
  {
    v5 = [*(id *)(a1 + 32) accessory];
    id v6 = *(void **)(a1 + 40);

    if (v5 != v6)
    {
      id v7 = [*(id *)(a1 + 32) powerOnQueues];
      [v7 addAccessory:*(void *)(a1 + 40) toQueue:@"AdvertisementQueue" context:0];

      [*(id *)(a1 + 32) _startAdvertising];
      id v14 = [MEMORY[0x263F08A00] defaultCenter];
      [v14 postNotificationName:@"kHMDAccessoryWakeNotificationStarted" object:*(void *)(a1 + 40)];
    }
  }
}

- (void)_startAdvertising
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDBTLEAdvertiser *)self leAdvertiser];

  if (!v3)
  {
    id v4 = [(HMDBTLEAdvertiser *)self powerOnQueues];
    int v5 = [v4 countForQueue:@"AdvertisementQueue"];

    if (v5)
    {
      id v6 = [(HMDBTLEAdvertiser *)self powerOnQueues];
      id v7 = [v6 popAccessoryFromQueue:@"AdvertisementQueue"];
      [(HMDBTLEAdvertiser *)self setAccessory:v7];

      id v8 = objc_alloc_init(MEMORY[0x263F38520]);
      [(HMDBTLEAdvertiser *)self setLeAdvertiser:v8];

      id v9 = objc_alloc(MEMORY[0x263F42558]);
      v10 = [(HMDBTLEAdvertiser *)self accessory];
      uint64_t v11 = [v10 pairingUsername];
      v12 = (void *)[v9 initWithAddressString:v11 length:6];

      id v13 = [v12 data];
      id v14 = [(HMDBTLEAdvertiser *)self leAdvertiser];
      [v14 setLgDeviceID:v13];

      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        uint64_t v19 = [(HMDBTLEAdvertiser *)v16 accessory];
        __int16 v20 = [v19 identifier];
        int v26 = 138543618;
        v27 = v18;
        __int16 v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Wireless - Starting BT LE Advertisement for %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v21 = [(HMDBTLEAdvertiser *)v16 leAdvertiser];
      [v21 activate];

      id v22 = objc_alloc(MEMORY[0x263F42658]);
      [(HMDBTLEAdvertiser *)v16 advertisementTimeInterval];
      v23 = objc_msgSend(v22, "initWithTimeInterval:options:", 1);
      [(HMDBTLEAdvertiser *)v16 setAdvertisementTimer:v23];

      v24 = [(HMDBTLEAdvertiser *)v16 advertisementTimer];
      [v24 setDelegate:v16];

      v25 = [(HMDBTLEAdvertiser *)v16 advertisementTimer];
      [v25 resume];
    }
  }
}

- (void)cancelOn:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDBTLEAdvertiser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__HMDBTLEAdvertiser_cancelOn___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __30__HMDBTLEAdvertiser_cancelOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelOn:*(void *)(a1 + 40)];
}

- (void)_cancelOn:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 identifier];
    int v17 = 138543618;
    int v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Wireless - Cancelling advertisement timer for %@", (uint8_t *)&v17, 0x16u);
  }
  if (v4)
  {
    if (([v4 custom1WoBLE] & 1) != 0
      && ([(HMDBTLEAdvertiser *)v6 accessory], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v11 = (void *)v10,
          [(HMDBTLEAdvertiser *)v6 accessory],
          id v12 = (id)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12 == v4))
    {
      [(HMDBTLEAdvertiser *)v6 setAccessory:0];
      id v13 = [(HMDBTLEAdvertiser *)v6 advertisementTimer];

      if (v13)
      {
        id v14 = [(HMDBTLEAdvertiser *)v6 advertisementTimer];
        [v14 suspend];

        [(HMDBTLEAdvertiser *)v6 setAdvertisementTimer:0];
      }
      id v15 = [(HMDBTLEAdvertiser *)v6 powerOnQueues];
      id v16 = [v15 getContextForAccessory:v4];

      if (v16) {
        [v16 suspend];
      }
      [(HMDBTLEAdvertiser *)v6 _clearAdvertiser];
      [(HMDBTLEAdvertiser *)v6 _completePendingPowerOnRequest:v4];
      [(HMDBTLEAdvertiser *)v6 _startAdvertising];
    }
    else
    {
      [(HMDBTLEAdvertiser *)v6 _completePendingPowerOnRequest:v4];
    }
  }
}

- (void)_completePendingPowerOnRequest:(id)a3
{
  id v6 = a3;
  if ([v6 isReachable])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:4 userInfo:0];
  }
  if (v6)
  {
    int v5 = [(HMDBTLEAdvertiser *)self powerOnQueues];
    [v5 removeAccessory:v6];

    [v6 powerOnComplete:v4];
  }
}

- (void)stopAdvertisement:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDBTLEAdvertiser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HMDBTLEAdvertiser_stopAdvertisement___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__HMDBTLEAdvertiser_stopAdvertisement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAdvertisement:*(void *)(a1 + 40)];
}

- (void)_stopAdvertisement:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBTLEAdvertiser *)self accessory];

  if (v4)
  {
    if (v5 == v4)
    {
      id v6 = [(HMDBTLEAdvertiser *)self leAdvertiser];

      if (v6)
      {
        [(HMDBTLEAdvertiser *)self _clearAdvertiser];
      }
    }
  }
}

- (void)_clearAdvertiser
{
  unint64_t v3 = [(HMDBTLEAdvertiser *)self leAdvertiser];

  if (v3)
  {
    id v4 = [(HMDBTLEAdvertiser *)self leAdvertiser];
    [v4 invalidate];

    [(HMDBTLEAdvertiser *)self setLeAdvertiser:0];
  }
}

- (void)didUpdateBTLEState:(int64_t)a3
{
  id v5 = [(HMDBTLEAdvertiser *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HMDBTLEAdvertiser_didUpdateBTLEState___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __40__HMDBTLEAdvertiser_didUpdateBTLEState___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) != 5)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    unint64_t v3 = [v2 accessory];
    [v2 stopAdvertisement:v3];

    id v4 = *(void **)(v1 + 32);
    return [v4 _flushQueues];
  }
  return result;
}

- (void)_flushQueues
{
  [(HMDBTLEAdvertiser *)self _flushQueue:@"AdvertisementQueue"];
  [(HMDBTLEAdvertiser *)self _flushQueue:@"ReachabilityQueue"];
}

- (void)_flushQueue:(id)a3
{
  id v8 = a3;
  id v4 = [(HMDBTLEAdvertiser *)self powerOnQueues];
  id v5 = [v4 popAccessoryFromQueue:v8];

  if (v5)
  {
    do
    {
      [(HMDBTLEAdvertiser *)self _completePendingPowerOnRequest:v5];
      id v6 = [(HMDBTLEAdvertiser *)self powerOnQueues];
      uint64_t v7 = [v6 popAccessoryFromQueue:v8];

      id v5 = (void *)v7;
    }
    while (v7);
  }
}

- (HMDBTLEAdvertiser)init
{
  v21.receiver = self;
  v21.super_class = (Class)HMDBTLEAdvertiser;
  v2 = [(HMDBTLEAdvertiser *)&v21 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    id v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263F358C0] getInstance];
    centralManager = v2->_centralManager;
    v2->_centralManager = (HAPBTLECentralManager *)v8;

    [(HAPBTLECentralManager *)v2->_centralManager registerCentralManagerDelegate:v2];
    uint64_t v10 = objc_alloc_init(HMDAccessoryQueues);
    powerOnQueues = v2->_powerOnQueues;
    v2->_powerOnQueues = v10;

    [(HMDAccessoryQueues *)v2->_powerOnQueues createQueue:@"AdvertisementQueue"];
    [(HMDAccessoryQueues *)v2->_powerOnQueues createQueue:@"ReachabilityQueue"];
    id v12 = [MEMORY[0x263F42608] sharedPreferences];
    id v13 = [v12 preferenceForKey:@"BTLEAdvertisingTimeout"];
    id v14 = [v13 numberValue];

    [v14 doubleValue];
    v2->_advertisementTimeInterval = v15;
    id v16 = [MEMORY[0x263F42608] sharedPreferences];
    int v17 = [v16 preferenceForKey:@"wirelessReachabilityTimeout"];
    int v18 = [v17 numberValue];

    [v18 doubleValue];
    v2->_reachabilityTimeInterval = v19;
  }
  return v2;
}

+ (id)initializeAdvertiser
{
  return +[HMDBTLEAdvertiser sharedAdvertiser];
}

+ (id)sharedAdvertiser
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDBTLEAdvertiser_sharedAdvertiser__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAdvertiser_onceToken != -1) {
    dispatch_once(&sharedAdvertiser_onceToken, block);
  }
  v2 = (void *)sharedAdvertiser_sharedAdvertiser;
  return v2;
}

void __37__HMDBTLEAdvertiser_sharedAdvertiser__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAdvertiser_sharedAdvertiser;
  sharedAdvertiser_sharedAdvertiser = (uint64_t)v1;
}

@end