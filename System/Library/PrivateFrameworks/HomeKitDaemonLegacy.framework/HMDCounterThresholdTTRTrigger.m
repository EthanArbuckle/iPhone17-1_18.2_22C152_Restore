@interface HMDCounterThresholdTTRTrigger
- (BOOL)primaryOnly;
- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarInitiator:(id)a5;
- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(int64_t)a8 radarInitiator:(id)a9;
- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(int64_t)a8 radarInitiator:(id)a9 primaryOnly:(BOOL)a10 dataSource:(id)a11;
- (HMDTTRTriggerDataSource)dataSource;
- (HMMRadarInitiating)radarInitiator;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)displayReason;
- (NSString)radarTitle;
- (int64_t)activeThreshold;
- (int64_t)componentID;
- (int64_t)targetThreshold;
- (void)setTargetThreshold:(int64_t)a3;
- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5;
@end

@implementation HMDCounterThresholdTTRTrigger

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_displayReason, 0);
}

- (HMMRadarInitiating)radarInitiator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radarInitiator);
  return (HMMRadarInitiating *)WeakRetained;
}

- (HMDTTRTriggerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDTTRTriggerDataSource *)WeakRetained;
}

- (BOOL)primaryOnly
{
  return self->_primaryOnly;
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)displayReason
{
  return self->_displayReason;
}

- (void)setTargetThreshold:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_activeThreshold < a3) {
    self->_activeThreshold = a3;
  }
  self->_targetThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)targetThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t targetThreshold = self->_targetThreshold;
  os_unfair_lock_unlock(p_lock);
  return targetThreshold;
}

- (int64_t)activeThreshold
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t activeThreshold = self->_activeThreshold;
  os_unfair_lock_unlock(p_lock);
  return activeThreshold;
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  int64_t activeThreshold = self->_activeThreshold;
  os_unfair_lock_unlock(&self->_lock);
  if (activeThreshold > a5 || activeThreshold <= a4)
  {
LABEL_10:
    if (!a5)
    {
      os_unfair_lock_lock_with_options();
      self->_int64_t activeThreshold = self->_targetThreshold;
      os_unfair_lock_unlock(&self->_lock);
    }
    goto LABEL_15;
  }
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [(HMDCounterThresholdTTRTrigger *)v12 radarTitle];
    int v27 = 138544130;
    v28 = v14;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    v32 = v15;
    __int16 v33 = 2048;
    int64_t v34 = a5;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@TTR threshold trigger: eventName=%{public}@, radarTitle=%{public}@, value=%lu", (uint8_t *)&v27, 0x2Au);
  }
  if (![(HMDCounterThresholdTTRTrigger *)v12 primaryOnly]
    || ([(HMDCounterThresholdTTRTrigger *)v12 dataSource],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 isCurrentDeviceConfirmedPrimaryResident],
        v16,
        (v17 & 1) != 0))
  {
    v18 = [(HMDCounterThresholdTTRTrigger *)v12 radarInitiator];
    v19 = [(HMDCounterThresholdTTRTrigger *)v12 displayReason];
    v20 = [(HMDCounterThresholdTTRTrigger *)v12 radarTitle];
    v21 = [(HMDCounterThresholdTTRTrigger *)v12 componentName];
    v22 = [(HMDCounterThresholdTTRTrigger *)v12 componentVersion];
    objc_msgSend(v18, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", v19, v20, v21, v22, -[HMDCounterThresholdTTRTrigger componentID](v12, "componentID"));

    goto LABEL_10;
  }
  v23 = (void *)MEMORY[0x1D9452090]();
  v24 = v12;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Device needs to be primary, but is not; skipping TTR.",
      (uint8_t *)&v27,
      0xCu);
  }
LABEL_15:
}

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(int64_t)a8 radarInitiator:(id)a9 primaryOnly:(BOOL)a10 dataSource:(id)a11
{
  id v17 = a4;
  id v18 = a5;
  id v35 = a6;
  id v34 = a7;
  id v19 = a9;
  id v20 = a11;
  if (v19)
  {
    v21 = v20;
    v36.receiver = self;
    v36.super_class = (Class)HMDCounterThresholdTTRTrigger;
    v22 = [(HMDCounterThresholdTTRTrigger *)&v36 init];
    v23 = v22;
    if (v22)
    {
      v22->_int64_t activeThreshold = a3;
      v22->_int64_t targetThreshold = a3;
      objc_storeStrong((id *)&v22->_displayReason, a4);
      objc_storeStrong((id *)&v23->_radarTitle, a5);
      objc_storeStrong((id *)&v23->_componentName, a6);
      objc_storeStrong((id *)&v23->_componentVersion, a7);
      v23->_componentID = a8;
      objc_storeWeak((id *)&v23->_radarInitiator, v19);
      v23->_primaryOnly = a10;
      objc_storeWeak((id *)&v23->_dataSource, v21);
    }

    return v23;
  }
  else
  {
    v25 = (HMDCounterThresholdTTRTrigger *)_HMFPreconditionFailureWithFormat();
    return [(HMDCounterThresholdTTRTrigger *)v25 initWithThreshold:v27 displayReason:v28 radarTitle:v29 componentName:v30 componentVersion:v31 componentID:v32 radarInitiator:a9];
  }
}

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(int64_t)a8 radarInitiator:(id)a9
{
  LOBYTE(v10) = 0;
  return [(HMDCounterThresholdTTRTrigger *)self initWithThreshold:a3 displayReason:a4 radarTitle:a5 componentName:a6 componentVersion:a7 componentID:a8 radarInitiator:a9 primaryOnly:v10 dataSource:0];
}

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 displayReason:(id)a4 radarInitiator:(id)a5
{
  id v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 stringWithFormat:@"Radar initiated on this device because %@", v10];
  v12 = [(HMDCounterThresholdTTRTrigger *)self initWithThreshold:a3 displayReason:v10 radarTitle:v11 componentName:@"HomeKit" componentVersion:@"New Bugs" componentID:590644 radarInitiator:v9];

  return v12;
}

@end