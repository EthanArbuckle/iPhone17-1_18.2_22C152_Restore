@interface HMDHouseholdActivityLogEvent
+ (id)coalescedEventFromHouseholdActivityLogEvents:(id)a3 homeUUID:(id)a4 contributors:(id)a5;
+ (id)logCategory;
- (BOOL)isActiveDay;
- (HMDHouseholdActivityLogEvent)initWithDictionary:(id)a3 contributors:(id)a4;
- (HMDHouseholdActivityLogEvent)initWithHomeUUID:(id)a3 contributors:(id)a4;
- (NSArray)contributors;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (id)initPopulatedFromDate:(id)a3 homeUUID:(id)a4 contributors:(id)a5;
- (id)serializedMetric;
- (int64_t)activeDaysPerMonthCount;
- (int64_t)countOfDaysSinceLastActive;
- (unint64_t)activeDaysBitField;
- (unint64_t)activeDeviceCount;
- (unint64_t)cameraStreamStartFailureCount;
- (unint64_t)cameraStreamStartSuccessCount;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)fetchCameraClipVideoSegmentAssetCount;
- (unint64_t)numAccessoriesAdded;
- (unint64_t)numReadFirstPartyApp;
- (unint64_t)numReadSiri;
- (unint64_t)numReadThirdPartyApp;
- (unint64_t)numScenesAdded;
- (unint64_t)numScenesUserRun;
- (unint64_t)numShortcutsAdded;
- (unint64_t)numShortcutsRun;
- (unint64_t)numTriggersAdded;
- (unint64_t)numTriggersFired;
- (unint64_t)numWriteFirstPartyApp;
- (unint64_t)numWriteSiri;
- (unint64_t)numWriteThirdPartyApp;
- (unint64_t)requestCount;
- (void)setActiveDay:(BOOL)a3;
- (void)setActiveDaysBitField:(unint64_t)a3;
- (void)setActiveDaysPerMonthCount:(int64_t)a3;
- (void)setActiveDeviceCount:(unint64_t)a3;
- (void)setCameraStreamStartFailureCount:(unint64_t)a3;
- (void)setCameraStreamStartSuccessCount:(unint64_t)a3;
- (void)setCountOfDaysSinceLastActive:(int64_t)a3;
- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3;
- (void)setNumAccessoriesAdded:(unint64_t)a3;
- (void)setNumReadFirstPartyApp:(unint64_t)a3;
- (void)setNumReadSiri:(unint64_t)a3;
- (void)setNumReadThirdPartyApp:(unint64_t)a3;
- (void)setNumScenesAdded:(unint64_t)a3;
- (void)setNumScenesUserRun:(unint64_t)a3;
- (void)setNumShortcutsAdded:(unint64_t)a3;
- (void)setNumShortcutsRun:(unint64_t)a3;
- (void)setNumTriggersAdded:(unint64_t)a3;
- (void)setNumTriggersFired:(unint64_t)a3;
- (void)setNumWriteFirstPartyApp:(unint64_t)a3;
- (void)setNumWriteSiri:(unint64_t)a3;
- (void)setNumWriteThirdPartyApp:(unint64_t)a3;
- (void)setRequestCount:(unint64_t)a3;
@end

@implementation HMDHouseholdActivityLogEvent

- (void).cxx_destruct
{
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (void)setActiveDaysPerMonthCount:(int64_t)a3
{
  self->_activeDaysPerMonthCount = a3;
}

- (int64_t)activeDaysPerMonthCount
{
  return self->_activeDaysPerMonthCount;
}

- (void)setCountOfDaysSinceLastActive:(int64_t)a3
{
  self->_countOfDaysSinceLastActive = a3;
}

- (int64_t)countOfDaysSinceLastActive
{
  return self->_countOfDaysSinceLastActive;
}

- (void)setActiveDay:(BOOL)a3
{
  self->_activeDay = a3;
}

- (BOOL)isActiveDay
{
  return self->_activeDay;
}

- (void)setActiveDaysBitField:(unint64_t)a3
{
  self->_activeDaysBitField = a3;
}

- (unint64_t)activeDaysBitField
{
  return self->_activeDaysBitField;
}

- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3
{
  self->_fetchCameraClipVideoSegmentAssetCount = a3;
}

- (unint64_t)fetchCameraClipVideoSegmentAssetCount
{
  return self->_fetchCameraClipVideoSegmentAssetCount;
}

- (void)setCameraStreamStartFailureCount:(unint64_t)a3
{
  self->_cameraStreamStartFailureCount = a3;
}

- (unint64_t)cameraStreamStartFailureCount
{
  return self->_cameraStreamStartFailureCount;
}

- (void)setCameraStreamStartSuccessCount:(unint64_t)a3
{
  self->_cameraStreamStartSuccessCount = a3;
}

- (unint64_t)cameraStreamStartSuccessCount
{
  return self->_cameraStreamStartSuccessCount;
}

- (void)setNumTriggersFired:(unint64_t)a3
{
  self->_numTriggersFired = a3;
}

- (unint64_t)numTriggersFired
{
  return self->_numTriggersFired;
}

- (void)setNumShortcutsRun:(unint64_t)a3
{
  self->_numShortcutsRun = a3;
}

- (unint64_t)numShortcutsRun
{
  return self->_numShortcutsRun;
}

- (void)setNumScenesUserRun:(unint64_t)a3
{
  self->_numScenesUserRun = a3;
}

- (unint64_t)numScenesUserRun
{
  return self->_numScenesUserRun;
}

- (void)setNumShortcutsAdded:(unint64_t)a3
{
  self->_numShortcutsAdded = a3;
}

- (unint64_t)numShortcutsAdded
{
  return self->_numShortcutsAdded;
}

- (void)setNumTriggersAdded:(unint64_t)a3
{
  self->_numTriggersAdded = a3;
}

- (unint64_t)numTriggersAdded
{
  return self->_numTriggersAdded;
}

- (void)setNumScenesAdded:(unint64_t)a3
{
  self->_numScenesAdded = a3;
}

- (unint64_t)numScenesAdded
{
  return self->_numScenesAdded;
}

- (void)setNumAccessoriesAdded:(unint64_t)a3
{
  self->_numAccessoriesAdded = a3;
}

- (unint64_t)numAccessoriesAdded
{
  return self->_numAccessoriesAdded;
}

- (void)setNumWriteThirdPartyApp:(unint64_t)a3
{
  self->_numWriteThirdPartyApp = a3;
}

- (unint64_t)numWriteThirdPartyApp
{
  return self->_numWriteThirdPartyApp;
}

- (void)setNumReadThirdPartyApp:(unint64_t)a3
{
  self->_numReadThirdPartyApp = a3;
}

- (unint64_t)numReadThirdPartyApp
{
  return self->_numReadThirdPartyApp;
}

- (void)setNumWriteFirstPartyApp:(unint64_t)a3
{
  self->_numWriteFirstPartyApp = a3;
}

- (unint64_t)numWriteFirstPartyApp
{
  return self->_numWriteFirstPartyApp;
}

- (void)setNumReadFirstPartyApp:(unint64_t)a3
{
  self->_numReadFirstPartyApp = a3;
}

- (unint64_t)numReadFirstPartyApp
{
  return self->_numReadFirstPartyApp;
}

- (void)setNumWriteSiri:(unint64_t)a3
{
  self->_numWriteSiri = a3;
}

- (unint64_t)numWriteSiri
{
  return self->_numWriteSiri;
}

- (void)setNumReadSiri:(unint64_t)a3
{
  self->_numReadSiri = a3;
}

- (unint64_t)numReadSiri
{
  return self->_numReadSiri;
}

- (void)setActiveDeviceCount:(unint64_t)a3
{
  self->_activeDeviceCount = a3;
}

- (unint64_t)activeDeviceCount
{
  return self->_activeDeviceCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(HMDHouseholdActivityLogEvent *)self contributors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) contributeLogEvent:self toCoreAnalyticsEvent:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v9 = (void *)[v3 copy];
  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HouseholdData";
}

- (id)serializedMetric
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMMHomeLogEvent *)self homeUUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"homeUUID"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(HMDHouseholdActivityLogEvent *)self contributors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) contributeLogEvent:self toSerializedMetric:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (HMDHouseholdActivityLogEvent)initWithDictionary:(id)a3 contributors:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"homeUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
    long long v12 = [(HMDHouseholdActivityLogEvent *)self initWithHomeUUID:v11 contributors:v7];
    if (v12)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v17++), "deserializeLogEvent:fromSerializedMetric:", v12, v6, (void)v24);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }
    }
    v18 = v12;

    v19 = v18;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Household activity is missing home UUID. Assuming from original SkyG seed and ignoring.", buf, 0xCu);
    }
    v19 = 0;
  }

  return v19;
}

- (id)initPopulatedFromDate:(id)a3 homeUUID:(id)a4 contributors:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(HMDHouseholdActivityLogEvent *)self initWithHomeUUID:v9 contributors:v10];
  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16++), "populateLogEvent:forHomeWithUUID:associatedToDate:", v11, v9, v8, (void)v18);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  return v11;
}

- (HMDHouseholdActivityLogEvent)initWithHomeUUID:(id)a3 contributors:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHouseholdActivityLogEvent;
  id v7 = [(HMMHomeLogEvent *)&v11 initWithHomeUUID:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    contributors = v7->_contributors;
    v7->_contributors = (NSArray *)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_56538 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_56538, &__block_literal_global_56539);
  }
  v2 = (void *)logCategory__hmf_once_v6_56540;
  return v2;
}

uint64_t __43__HMDHouseholdActivityLogEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_56540;
  logCategory__hmf_once_v6_56540 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)coalescedEventFromHouseholdActivityLogEvents:(id)a3 homeUUID:(id)a4 contributors:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v43 = v8;
  id v10 = [[HMDHouseholdActivityLogEvent alloc] initWithHomeUUID:v8 contributors:v9];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) startCoalescingLogEvent:v10];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v13);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v7;
  uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v42 = *(void *)v53;
    *(void *)&long long v17 = 138543874;
    long long v39 = v17;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        long long v21 = objc_msgSend(v20, "homeUUID", v39);
        char v22 = [v21 isEqual:v43];

        if ((v22 & 1) == 0)
        {
          uint64_t v23 = (void *)MEMORY[0x1D9452090]();
          id v24 = a1;
          long long v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v26 = HMFGetLogIdentifier();
            long long v27 = [v20 homeUUID];
            *(_DWORD *)buf = v39;
            v63 = v26;
            __int16 v64 = 2112;
            v65 = v27;
            __int16 v66 = 2112;
            v67 = v43;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Source household data log event home UUID doesn't match new event's home UUID: %@, %@", buf, 0x20u);
          }
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v28 = v11;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v48 + 1) + 8 * k) coalesceLogEvent:v10 fromSourceEvent:v20];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v61 count:16];
          }
          while (v30);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v18);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v33 = v11;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * m) finishCoalescingLogEvent:v10];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v35);
  }

  return v10;
}

@end