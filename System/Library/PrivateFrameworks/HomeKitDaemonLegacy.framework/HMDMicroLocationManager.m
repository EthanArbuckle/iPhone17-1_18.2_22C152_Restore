@interface HMDMicroLocationManager
+ (id)logCategory;
- (HMDMicroLocationManager)initWithLocationManager:(id)a3;
- (HMDMicroLocationManager)initWithLocationManager:(id)a3 dateFactory:(id)a4;
- (void)triggerThrottledMicroLocationLocalizationScanWithMetadata:(id)a3 triggerType:(unint64_t)a4;
- (void)triggerThrottledMicroLocationRecordingScanWithMetadata:(id)a3 triggerType:(unint64_t)a4;
@end

@implementation HMDMicroLocationManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateFactory, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastLocalizationScanTimes, 0);
  objc_storeStrong((id *)&self->_lastRecordingScanTimes, 0);
}

- (void)triggerThrottledMicroLocationLocalizationScanWithMetadata:(id)a3 triggerType:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 >= 3)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [NSNumber numberWithUnsignedInteger:a4];
      int v34 = 138543618;
      v35 = v11;
      __int16 v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid HMDMicroLocationScanTriggerType: %@ for Localization Scan", (uint8_t *)&v34, 0x16u);
    }
    goto LABEL_16;
  }
  if (self) {
    Property = (void (**)(void))objc_getProperty(self, v6, 40, 1);
  }
  else {
    Property = 0;
  }
  v14 = Property[2]();
  [v14 timeIntervalSince1970];
  double v16 = v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v18 = [(NSMutableArray *)self->_lastLocalizationScanTimes objectAtIndexedSubscript:a4];
  [v18 doubleValue];
  double v20 = v19 + 5.0;
  if (v20 <= v16)
  {
  }
  else
  {
    double v21 = vabdd_f64(v20, v16);

    if (v21 >= 2.22044605e-16)
    {
      v22 = (void *)MEMORY[0x1D9452090]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        v26 = off_1E6A18E28[a4];
        int v34 = 138543618;
        v35 = v25;
        __int16 v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping microlocation localization scan for event: %@, throttling in effect", (uint8_t *)&v34, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      goto LABEL_16;
    }
  }
  v27 = [NSNumber numberWithDouble:v16];
  [(NSMutableArray *)self->_lastLocalizationScanTimes setObject:v27 atIndexedSubscript:a4];

  os_unfair_lock_unlock(&self->_lock);
  v28 = (void *)MEMORY[0x1D9452090]();
  v29 = self;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = HMFGetLogIdentifier();
    v32 = off_1E6A18E28[a4];
    int v34 = 138543618;
    v35 = v31;
    __int16 v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing microlocation localization scan for event: %@", (uint8_t *)&v34, 0x16u);
  }
  objc_msgSend(objc_getProperty(v29, v33, 32, 1), "requestMicroLocationLocalizationScanWithMetadata:", v7);
LABEL_16:
}

- (void)triggerThrottledMicroLocationRecordingScanWithMetadata:(id)a3 triggerType:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 >= 3)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [NSNumber numberWithUnsignedInteger:a4];
      int v34 = 138543618;
      v35 = v11;
      __int16 v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid HMDMicroLocationScanTriggerType: %@ for Recording Scan", (uint8_t *)&v34, 0x16u);
    }
    goto LABEL_16;
  }
  if (self) {
    Property = (void (**)(void))objc_getProperty(self, v6, 40, 1);
  }
  else {
    Property = 0;
  }
  v14 = Property[2]();
  [v14 timeIntervalSince1970];
  double v16 = v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v18 = [(NSMutableArray *)self->_lastRecordingScanTimes objectAtIndexedSubscript:a4];
  [v18 doubleValue];
  double v20 = v19 + 5.0;
  if (v20 <= v16)
  {
  }
  else
  {
    double v21 = vabdd_f64(v20, v16);

    if (v21 >= 2.22044605e-16)
    {
      v22 = (void *)MEMORY[0x1D9452090]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        v26 = off_1E6A18E28[a4];
        int v34 = 138543618;
        v35 = v25;
        __int16 v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping microlocation recording scan for event type: %@, throttling in effect", (uint8_t *)&v34, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      goto LABEL_16;
    }
  }
  v27 = [NSNumber numberWithDouble:v16];
  [(NSMutableArray *)self->_lastRecordingScanTimes setObject:v27 atIndexedSubscript:a4];

  os_unfair_lock_unlock(&self->_lock);
  v28 = (void *)MEMORY[0x1D9452090]();
  v29 = self;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = HMFGetLogIdentifier();
    v32 = off_1E6A18E28[a4];
    int v34 = 138543618;
    v35 = v31;
    __int16 v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing microlocation recording scan for event: %@", (uint8_t *)&v34, 0x16u);
  }
  objc_msgSend(objc_getProperty(v29, v33, 32, 1), "requestMicroLocationRecordingScanWithMetadata:", v7);
LABEL_16:
}

- (HMDMicroLocationManager)initWithLocationManager:(id)a3
{
  return [(HMDMicroLocationManager *)self initWithLocationManager:a3 dateFactory:&__block_literal_global_7_185734];
}

uint64_t __51__HMDMicroLocationManager_initWithLocationManager___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] now];
}

- (HMDMicroLocationManager)initWithLocationManager:(id)a3 dateFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDMicroLocationManager;
  v9 = [(HMDMicroLocationManager *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "na_arrayByRepeatingWithCount:generatorBlock:", 3, &__block_literal_global_185740);
    lastRecordingScanTimes = v10->_lastRecordingScanTimes;
    v10->_lastRecordingScanTimes = (NSMutableArray *)v11;

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "na_arrayByRepeatingWithCount:generatorBlock:", 3, &__block_literal_global_4_185741);
    lastLocalizationScanTimes = v10->_lastLocalizationScanTimes;
    v10->_lastLocalizationScanTimes = (NSMutableArray *)v13;

    double v15 = _Block_copy(v8);
    id dateFactory = v10->_dateFactory;
    v10->_id dateFactory = v15;
  }
  return v10;
}

void *__63__HMDMicroLocationManager_initWithLocationManager_dateFactory___block_invoke_2()
{
  return &unk_1F2DC9EF8;
}

void *__63__HMDMicroLocationManager_initWithLocationManager_dateFactory___block_invoke()
{
  return &unk_1F2DC9EF8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_185753 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_185753, &__block_literal_global_22_185754);
  }
  v2 = (void *)logCategory__hmf_once_v9_185755;
  return v2;
}

uint64_t __38__HMDMicroLocationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_185755;
  logCategory__hmf_once_v9_185755 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end