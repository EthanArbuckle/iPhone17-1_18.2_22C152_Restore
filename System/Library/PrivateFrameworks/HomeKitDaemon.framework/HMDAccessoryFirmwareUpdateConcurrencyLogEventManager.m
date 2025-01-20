@interface HMDAccessoryFirmwareUpdateConcurrencyLogEventManager
- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)initWithCountersManager:(id)a3;
- (HMDEventCountersManager)countersManager;
- (NSMutableArray)currentActivity;
- (NSMutableArray)peakActivity;
- (NSMutableDictionary)inProgress;
- (unint64_t)differenceFromCounterWithCategory:(unint64_t)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setInProgress:(id)a3;
- (void)setPeakActivity:(id)a3;
- (void)startApplyWithAccessory:(id)a3;
- (void)startStagingWithAccessory:(id)a3;
- (void)startWithCategory:(unint64_t)a3 accessory:(id)a4;
- (void)stopApplyWithAccessory:(id)a3;
- (void)stopStagingWithAccessory:(id)a3;
- (void)stopWithCategory:(unint64_t)a3 accessory:(id)a4;
- (void)submitLogEvent;
@end

@implementation HMDAccessoryFirmwareUpdateConcurrencyLogEventManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_inProgress, 0);
  objc_storeStrong((id *)&self->_peakActivity, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (void)setInProgress:(id)a3
{
}

- (NSMutableDictionary)inProgress
{
  return self->_inProgress;
}

- (void)setPeakActivity:(id)a3
{
}

- (NSMutableArray)peakActivity
{
  return self->_peakActivity;
}

- (void)setCurrentActivity:(id)a3
{
}

- (NSMutableArray)currentActivity
{
  return self->_currentActivity;
}

- (void)submitLogEvent
{
  v3 = -[HMDAccessoryFirmwareUpdateConcurrencyLogEvent initWithPeakConcurrentIPAccessoryUpdateStaging:peakConcurrentIPAccessoryUpdateApply:peakConcurrentBLEAccessoryUpdateStaging:peakConcurrentBLEAccessoryUpdateApply:peakConcurrentThreadAccessoryUpdateStaging:peakConcurrentThreadAccessoryUpdateApply:]([HMDAccessoryFirmwareUpdateConcurrencyLogEvent alloc], "initWithPeakConcurrentIPAccessoryUpdateStaging:peakConcurrentIPAccessoryUpdateApply:peakConcurrentBLEAccessoryUpdateStaging:peakConcurrentBLEAccessoryUpdateApply:peakConcurrentThreadAccessoryUpdateStaging:peakConcurrentThreadAccessoryUpdateApply:", -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 1), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 2), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 3), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:",
           4),
         [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self differenceFromCounterWithCategory:5], [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self differenceFromCounterWithCategory:6]);
  v2 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v2 submitLogEvent:v3];
}

- (unint64_t)differenceFromCounterWithCategory:(unint64_t)a3
{
  if (a3 - 1 > 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = @"HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter";
    v6 = @"HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter";
  }
  v7 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self countersManager];
  uint64_t v8 = [v7 fetchEventCounterForEventName:v5 requestGroup:@"HMDLogEventAccessoryFirmwareUpdateRequestGroup"];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self peakActivity];
  v11 = [v10 objectAtIndexedSubscript:a3];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self currentActivity];
  v14 = [v13 objectAtIndexedSubscript:a3];
  uint64_t v15 = [v14 unsignedIntegerValue];

  if (!v8 && v12)
  {
    v16 = [NSNumber numberWithUnsignedInteger:v15];
    v17 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self peakActivity];
    [v17 setObject:v16 atIndexedSubscript:a3];
  }
  os_unfair_lock_unlock(p_lock);

  return v12 - v15;
}

- (void)stopWithCategory:(unint64_t)a3 accessory:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a4;
  v7 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self inProgress];
  uint64_t v8 = [(__CFString *)v6 uuid];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v9 unsignedIntValue];
    if (v10 != a3)
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = (void *)v14;
        if (a3 - 1 > 6) {
          v16 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
        }
        else {
          v16 = off_264A1FDC8[a3 - 1];
        }
        if ((v10 - 1) > 6) {
          v23 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
        }
        else {
          v23 = off_264A1FDC8[(v10 - 1)];
        }
        int v38 = 138543874;
        uint64_t v39 = v14;
        __int16 v40 = 2112;
        v41 = v16;
        __int16 v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping with mismatched categories current: %@, at start: %@", (uint8_t *)&v38, 0x20u);
      }
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v25 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self currentActivity];
    v26 = [v25 objectAtIndexedSubscript:v10];
    uint64_t v27 = [v26 unsignedIntegerValue];

    if (v27)
    {
      v28 = [NSNumber numberWithUnsignedInteger:v27 - 1];
      v29 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self currentActivity];
      [v29 setObject:v28 atIndexedSubscript:v10];
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        v34 = (void *)v33;
        if ((v10 - 1) > 6) {
          v35 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
        }
        else {
          v35 = off_264A1FDC8[(v10 - 1)];
        }
        int v38 = 138543874;
        uint64_t v39 = v33;
        __int16 v40 = 2112;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Stopping category %@ when current activity is 0 for accessory %@", (uint8_t *)&v38, 0x20u);
      }
    }
    v36 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self inProgress];
    v37 = [(__CFString *)v6 uuid];
    [v36 setObject:0 forKeyedSubscript:v37];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = HMFGetLogIdentifier();
      unsigned int v21 = [0 unsignedIntValue] - 1;
      if (v21 > 6) {
        v22 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
      }
      else {
        v22 = off_264A1FDC8[v21];
      }
      int v38 = 138543874;
      uint64_t v39 = (uint64_t)v20;
      __int16 v40 = 2112;
      v41 = v22;
      __int16 v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping %@ when nothing is in progress for accessory %@", (uint8_t *)&v38, 0x20u);
    }
  }
}

- (void)startWithCategory:(unint64_t)a3 accessory:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self inProgress];
  uint64_t v8 = [v6 uuid];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      if (a3 - 1 > 6) {
        uint64_t v14 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
      }
      else {
        uint64_t v14 = off_264A1FDC8[a3 - 1];
      }
      unsigned int v15 = [v9 unsignedIntValue] - 1;
      if (v15 > 6) {
        v16 = @"HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown";
      }
      else {
        v16 = off_264A1FDC8[v15];
      }
      int v31 = 138544130;
      v32 = v13;
      __int16 v33 = 2112;
      v34 = v14;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting %@ while %@ is in progress for accessory %@", (uint8_t *)&v31, 0x2Au);
    }
    [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)v11 stopStagingWithAccessory:v6];
  }
  os_unfair_lock_lock_with_options();
  v17 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self currentActivity];
  v18 = [v17 objectAtIndexedSubscript:a3];
  uint64_t v19 = [v18 unsignedIntegerValue];

  v20 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self peakActivity];
  unsigned int v21 = [v20 objectAtIndexedSubscript:a3];
  unint64_t v22 = [v21 unsignedIntegerValue];

  if (v19 + 1 > v22) {
    unint64_t v23 = v19 + 1;
  }
  else {
    unint64_t v23 = v22;
  }
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v25 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self currentActivity];
  [v25 setObject:v24 atIndexedSubscript:a3];

  v26 = [NSNumber numberWithUnsignedInteger:v23];
  uint64_t v27 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self peakActivity];
  [v27 setObject:v26 atIndexedSubscript:a3];

  v28 = [NSNumber numberWithUnsignedInteger:a3];
  v29 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self inProgress];
  v30 = [v6 uuid];
  [v29 setObject:v28 forKeyedSubscript:v30];

  os_unfair_lock_unlock(&self->_lock);
  [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self submitLogEvent];
}

- (void)stopApplyWithAccessory:(id)a3
{
  id v6 = a3;
  uint64_t AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2 * (AccessoryFirmwareUpdateActiveTransport - 2) + 2;
  }
  [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self stopWithCategory:v5 accessory:v6];
}

- (void)stopStagingWithAccessory:(id)a3
{
  id v6 = a3;
  uint64_t AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (2 * (AccessoryFirmwareUpdateActiveTransport - 2)) | 1;
  }
  [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self stopWithCategory:v5 accessory:v6];
}

- (void)startApplyWithAccessory:(id)a3
{
  id v6 = a3;
  uint64_t AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2 * (AccessoryFirmwareUpdateActiveTransport - 2) + 2;
  }
  [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self startWithCategory:v5 accessory:v6];
}

- (void)startStagingWithAccessory:(id)a3
{
  id v6 = a3;
  uint64_t AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (2 * (AccessoryFirmwareUpdateActiveTransport - 2)) | 1;
  }
  [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)self startWithCategory:v5 accessory:v6];
}

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)initWithCountersManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryFirmwareUpdateConcurrencyLogEventManager;
  id v6 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
    currentActivity = v7->_currentActivity;
    v7->_currentActivity = (NSMutableArray *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
    peakActivity = v7->_peakActivity;
    v7->_peakActivity = (NSMutableArray *)v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inProgress = v7->_inProgress;
    v7->_inProgress = v12;

    objc_storeStrong((id *)&v7->_countersManager, a3);
    for (uint64_t i = 0; i != 7; ++i)
    {
      [(NSMutableArray *)v7->_currentActivity setObject:&unk_26E471A28 atIndexedSubscript:i];
      [(NSMutableArray *)v7->_peakActivity setObject:&unk_26E471A28 atIndexedSubscript:i];
    }
  }

  return v7;
}

@end