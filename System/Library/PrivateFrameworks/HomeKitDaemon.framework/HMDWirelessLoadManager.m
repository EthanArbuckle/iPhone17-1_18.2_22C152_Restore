@interface HMDWirelessLoadManager
+ (id)sharedInstance;
- (HMDWirelessLoadManager)init;
- (NSDate)lastLoadTimestamp;
- (id)getBtLoadData;
- (int)btAudioTask;
- (int)btLoad;
- (int)btNonAudioTask;
@end

@implementation HMDWirelessLoadManager

- (void).cxx_destruct
{
}

- (NSDate)lastLoadTimestamp
{
  return self->_lastLoadTimestamp;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (id)getBtLoadData
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(HMDWirelessLoadManager *)v2 lastLoadTimestamp];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 >= 10.0)
  {
    objc_storeStrong((id *)&v2->_lastLoadTimestamp, v3);
    id v7 = objc_alloc_init(MEMORY[0x263F86498]);
    [v7 registerClient:40 queue:0];
    uint64_t v8 = [v7 getWirelessRadioManagerReportLoad:0 loadDuration:0 callback:0.0];
    uint64_t v9 = [v7 unregisterClient];
    v2->_btLoad = v8;
    *(int8x8_t *)&v2->_btAudioTask = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v8), (uint32x2_t)0xFFFFFFF4FFFFFFF8), (int8x8_t)0xF0000000FLL);
    v10 = (void *)MEMORY[0x230FBD990](v9);
    v11 = v2;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      id v22 = v13;
      __int16 v23 = 1024;
      int v24 = [(HMDWirelessLoadManager *)v11 btLoad];
      __int16 v25 = 1024;
      int v26 = [(HMDWirelessLoadManager *)v11 btAudioTask];
      __int16 v27 = 1024;
      int v28 = [(HMDWirelessLoadManager *)v11 btNonAudioTask];
      __int16 v29 = 2048;
      uint64_t v30 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@BT Load: %d AudioTsk: %d NonAudioTsk: %d Raw: %lld", buf, 0x28u);
    }
  }
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDWirelessLoadManager btLoad](v2, "btLoad", @"kBtLoadKey"));
  v20[0] = v14;
  v19[1] = @"kBtAudioTask";
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDWirelessLoadManager btAudioTask](v2, "btAudioTask"));
  v20[1] = v15;
  v19[2] = @"kBtNonAudioTask";
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDWirelessLoadManager btNonAudioTask](v2, "btNonAudioTask"));
  v20[2] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  objc_sync_exit(v2);
  return v17;
}

- (HMDWirelessLoadManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDWirelessLoadManager;
  v2 = [(HMDWirelessLoadManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] distantPast];
    lastLoadTimestamp = v2->_lastLoadTimestamp;
    v2->_lastLoadTimestamp = (NSDate *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDWirelessLoadManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__hmf_once_t0_134621 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0_134621, block);
  }
  v2 = (void *)sharedInstance__hmf_once_v1_134622;
  return v2;
}

void __40__HMDWirelessLoadManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__hmf_once_v1_134622;
  sharedInstance__hmf_once_v1_134622 = (uint64_t)v1;
}

@end