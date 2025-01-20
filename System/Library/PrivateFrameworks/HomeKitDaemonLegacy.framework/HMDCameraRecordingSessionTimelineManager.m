@interface HMDCameraRecordingSessionTimelineManager
+ (id)logCategory;
- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3;
- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4;
- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3;
- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4;
- (HMDCameraRecordingSessionTimelineManager)initWithWorkQueue:(id)a3 fragmentDuration:(double)a4 fragmentCreationReferenceDate:(id)a5 logIdentifier:(id)a6;
- (NSDate)fragmentCreationReferenceDate;
- (NSMutableArray)doorbellActiveDateIntervals;
- (NSMutableArray)motionActiveDateIntervals;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (double)fragmentDuration;
- (id)attributeDescriptions;
- (id)creationDateForFragmentAtTimeOffset:(double)a3;
- (void)handleDoorbellDidActivateAtDate:(id)a3;
- (void)handleMotionActive:(BOOL)a3 didChangeAtDate:(id)a4;
@end

@implementation HMDCameraRecordingSessionTimelineManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_doorbellActiveDateIntervals, 0);
  objc_storeStrong((id *)&self->_motionActiveDateIntervals, 0);
  objc_storeStrong((id *)&self->_fragmentCreationReferenceDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)doorbellActiveDateIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)motionActiveDateIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)fragmentCreationReferenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (double)fragmentDuration
{
  return self->_fragmentDuration;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCameraRecordingSessionTimelineManager *)self logIdentifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = NSNumber;
  [(HMDCameraRecordingSessionTimelineManager *)self fragmentDuration];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)[v6 initWithName:@"Fragment Duration" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDCameraRecordingSessionTimelineManager *)self fragmentCreationReferenceDate];
  v12 = (void *)[v10 initWithName:@"Fragment Creation Reference Date" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3
{
  v5 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSessionTimelineManager *)self fragmentCreationReferenceDate];
  v7 = [v6 dateByAddingTimeInterval:a3];

  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v9 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
  id v10 = [v9 lastObject];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  char v12 = [v10 intersectsDateInterval:v11];

  return v12;
}

- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3
{
  v5 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSessionTimelineManager *)self fragmentCreationReferenceDate];
  v7 = [v6 dateByAddingTimeInterval:a3];

  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v9 = [(HMDCameraRecordingSessionTimelineManager *)self doorbellActiveDateIntervals];
  id v10 = [v9 lastObject];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  char v12 = [v10 intersectsDateInterval:v11];

  return v12;
}

- (void)handleDoorbellDidActivateAtDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSessionTimelineManager *)self doorbellActiveDateIntervals];
  v7 = [v6 lastObject];

  id v8 = v4;
  [(HMDCameraRecordingSessionTimelineManager *)self fragmentDuration];
  id v10 = [v8 dateByAddingTimeInterval:v9 + v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v10];
  char v12 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v11 startDate];
    v17 = [(HMDCameraRecordingSessionTimelineManager *)v13 fragmentCreationReferenceDate];
    [v16 timeIntervalSinceDate:v17];
    int v27 = 138543618;
    v28 = v15;
    __int16 v29 = 2048;
    uint64_t v30 = v18;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Doorbell trigger activated at time offset: %f", (uint8_t *)&v27, 0x16u);
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  v20 = v13;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = [v11 endDate];
    v24 = [(HMDCameraRecordingSessionTimelineManager *)v20 fragmentCreationReferenceDate];
    [v23 timeIntervalSinceDate:v24];
    int v27 = 138543618;
    v28 = v22;
    __int16 v29 = 2048;
    uint64_t v30 = v25;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Doorbell trigger will be deactivated at time offset: %f", (uint8_t *)&v27, 0x16u);
  }
  v26 = [(HMDCameraRecordingSessionTimelineManager *)v20 doorbellActiveDateIntervals];
  [v26 addObject:v11];
}

- (void)handleMotionActive:(BOOL)a3 didChangeAtDate:(id)a4
{
  BOOL v4 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
  double v9 = [v8 lastObject];

  id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v11 = [v9 startDate];
  char v12 = [v9 endDate];
  char v13 = [v12 isEqual:v10];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [v9 endDate];

    v11 = (void *)v14;
  }
  if (v4)
  {
    if (!v9
      || ([v9 endDate],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqualToDate:v10],
          v15,
          (v16 & 1) == 0))
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v10];
      uint64_t v18 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
      [v18 addObject:v17];

      v19 = (void *)MEMORY[0x1D9452090]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [(HMDCameraRecordingSessionTimelineManager *)v20 fragmentCreationReferenceDate];
        [v6 timeIntervalSinceDate:v23];
        int v34 = 138543618;
        v35 = v22;
        __int16 v36 = 2048;
        uint64_t v37 = v24;
        uint64_t v25 = "%{public}@Motion trigger activated at time offset: %f";
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v34, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (v9)
  {
    v26 = [v9 endDate];
    int v27 = [v26 isEqualToDate:v10];

    if (v27)
    {
      v28 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
      [v28 removeLastObject];

      id v29 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v30 = [v9 startDate];
      v17 = (void *)[v29 initWithStartDate:v30 endDate:v6];

      uint64_t v31 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
      [v31 addObject:v17];

      v19 = (void *)MEMORY[0x1D9452090]();
      v32 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [(HMDCameraRecordingSessionTimelineManager *)v32 fragmentCreationReferenceDate];
        [v6 timeIntervalSinceDate:v23];
        int v34 = 138543618;
        v35 = v22;
        __int16 v36 = 2048;
        uint64_t v37 = v33;
        uint64_t v25 = "%{public}@Motion trigger deactivated at time offset: %f";
        goto LABEL_12;
      }
LABEL_13:
    }
  }
}

- (BOOL)isDoorbellTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDCameraRecordingSessionTimelineManager *)self creationDateForFragmentAtTimeOffset:a3];
  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v10 = [v8 dateByAddingTimeInterval:a4];
  v11 = (void *)[v9 initWithStartDate:v8 endDate:v10];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v12 = [(HMDCameraRecordingSessionTimelineManager *)self doorbellActiveDateIntervals];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * i) intersectsDateInterval:v11])
        {
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (BOOL)isMotionTriggerActiveAtAnyTimeAfterOffset:(double)a3 forDuration:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDCameraRecordingSessionTimelineManager *)self creationDateForFragmentAtTimeOffset:a3];
  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v10 = [v8 dateByAddingTimeInterval:a4];
  v11 = (void *)[v9 initWithStartDate:v8 endDate:v10];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v12 = [(HMDCameraRecordingSessionTimelineManager *)self motionActiveDateIntervals];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * i) intersectsDateInterval:v11])
        {
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)creationDateForFragmentAtTimeOffset:(double)a3
{
  v5 = [(HMDCameraRecordingSessionTimelineManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingSessionTimelineManager *)self fragmentCreationReferenceDate];
  v7 = [v6 dateByAddingTimeInterval:a3];

  return v7;
}

- (HMDCameraRecordingSessionTimelineManager)initWithWorkQueue:(id)a3 fragmentDuration:(double)a4 fragmentCreationReferenceDate:(id)a5 logIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v14 = v13;
  if (!v13)
  {
LABEL_11:
    uint64_t v24 = (void *)_HMFPreconditionFailure();
    return (HMDCameraRecordingSessionTimelineManager *)+[HMDCameraRecordingSessionTimelineManager logCategory];
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDCameraRecordingSessionTimelineManager;
  v15 = [(HMDCameraRecordingSessionTimelineManager *)&v26 init];
  char v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    v16->_fragmentDuration = a4;
    uint64_t v17 = [v12 copy];
    fragmentCreationReferenceDate = v16->_fragmentCreationReferenceDate;
    v16->_fragmentCreationReferenceDate = (NSDate *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    motionActiveDateIntervals = v16->_motionActiveDateIntervals;
    v16->_motionActiveDateIntervals = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    doorbellActiveDateIntervals = v16->_doorbellActiveDateIntervals;
    v16->_doorbellActiveDateIntervals = (NSMutableArray *)v21;

    objc_storeStrong((id *)&v16->_logIdentifier, a6);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_62785 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_62785, &__block_literal_global_62786);
  }
  v2 = (void *)logCategory__hmf_once_v5_62787;
  return v2;
}

uint64_t __55__HMDCameraRecordingSessionTimelineManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_62787;
  logCategory__hmf_once_v5_62787 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end