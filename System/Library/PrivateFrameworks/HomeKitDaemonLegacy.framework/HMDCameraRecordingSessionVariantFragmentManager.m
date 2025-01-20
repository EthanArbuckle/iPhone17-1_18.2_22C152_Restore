@interface HMDCameraRecordingSessionVariantFragmentManager
+ (id)logCategory;
- (BOOL)expectsVariantFragment;
- (HMDCameraRecordingSessionVariantFragmentManager)initWithLogIdentifier:(id)a3;
- (HMDCameraRecordingSessionVariantFragmentManagerDelegate)delegate;
- (NSMutableArray)fullFragmentTimeRanges;
- (NSMutableArray)variantFragments;
- (NSString)logIdentifier;
- (void)_drainVariantFragmentQueue;
- (void)handleFullFragment:(id)a3;
- (void)handleVariantFragment:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCameraRecordingSessionVariantFragmentManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_variantFragments, 0);
  objc_storeStrong((id *)&self->_fullFragmentTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)variantFragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)fullFragmentTimeRanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingSessionVariantFragmentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingSessionVariantFragmentManagerDelegate *)WeakRetained;
}

- (void)_drainVariantFragmentQueue
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraRecordingSessionVariantFragmentManager *)self fullFragmentTimeRanges];
  v4 = [v3 lastObject];

  if (v4)
  {
    memset(&v35, 0, sizeof(v35));
    v25 = v4;
    [v4 CMTimeRangeValue];
    v5 = [(HMDCameraRecordingSessionVariantFragmentManager *)self variantFragments];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      while (1)
      {
        v7 = [(HMDCameraRecordingSessionVariantFragmentManager *)self variantFragments];
        v8 = [v7 firstObject];

        if (v8)
        {
          [v8 timeRange];
        }
        else
        {
          long long v33 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
        }
        *(_OWORD *)&time1.value = v31;
        time1.epoch = v32;
        CMTimeRange range = v35;
        CMTimeRangeGetEnd(&time2, &range);
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
          break;
        }
        v9 = [(HMDCameraRecordingSessionVariantFragmentManager *)self fullFragmentTimeRanges];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke;
        v28[3] = &unk_1E6A0FAD0;
        id v10 = v8;
        id v29 = v10;
        uint64_t v11 = objc_msgSend(v9, "na_any:", v28);

        v12 = (void *)MEMORY[0x1D9452090]();
        v13 = self;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = HMFGetLogIdentifier();
          v16 = HMFBooleanToString();
          LODWORD(range.start.value) = 138543874;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v15;
          LOWORD(range.start.flags) = 2112;
          *(void *)((char *)&range.start.flags + 2) = v10;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v16;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Selecting variant fragment: %@, overlapsFullFragment: %@", (uint8_t *)&range, 0x20u);
        }
        v17 = [(HMDCameraRecordingSessionVariantFragmentManager *)v13 delegate];
        [v17 variantFragmentManager:v13 didSelectVariantFragment:v10 overlapsFullFragment:v11];

        v18 = [(HMDCameraRecordingSessionVariantFragmentManager *)v13 variantFragments];
        objc_msgSend(v18, "hmf_removeFirstObject");

        v19 = [(HMDCameraRecordingSessionVariantFragmentManager *)v13 fullFragmentTimeRanges];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke_6;
        v26[3] = &unk_1E6A0FAF8;
        id v27 = v10;
        id v20 = v10;
        v21 = [v19 indexesOfObjectsPassingTest:v26];

        v22 = [(HMDCameraRecordingSessionVariantFragmentManager *)v13 fullFragmentTimeRanges];
        [v22 removeObjectsAtIndexes:v21];

        v23 = [(HMDCameraRecordingSessionVariantFragmentManager *)v13 variantFragments];
        uint64_t v24 = [v23 count];

        if (!v24) {
          goto LABEL_12;
        }
      }
    }
LABEL_12:
    v4 = v25;
  }
}

BOOL __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3) {
    [v3 CMTimeRangeValue];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(&otherRange, 0, sizeof(otherRange));
  }
  CMTimeRangeGetIntersection(&v26, &range, &otherRange);
  if ((v26.start.flags & 1) == 0) {
    goto LABEL_22;
  }
  if (v4) {
    [v4 CMTimeRangeValue];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 timeRange];
  }
  else {
    memset(&v24, 0, sizeof(v24));
  }
  CMTimeRangeGetIntersection(&v23, &v25, &v24);
  if ((v23.duration.flags & 1) == 0) {
    goto LABEL_22;
  }
  if (v4) {
    [v4 CMTimeRangeValue];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }
  v7 = *(void **)(a1 + 32);
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CMTimeRangeGetIntersection(&v20, &v22, &v21);
  if (v20.duration.epoch) {
    goto LABEL_22;
  }
  if (v4) {
    [v4 CMTimeRangeValue];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    [v10 timeRange];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  CMTimeRangeGetIntersection(&v17, &v19, &v18);
  if (v17.duration.value < 0)
  {
LABEL_22:
    BOOL v8 = 1;
  }
  else
  {
    if (v4) {
      [v4 CMTimeRangeValue];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    uint64_t v11 = *(void **)(a1 + 32);
    if (v11) {
      [v11 timeRange];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }
    CMTimeRangeGetIntersection(&v13, &v15, &v14);
    CMTime time1 = v13.duration;
    CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    BOOL v8 = CMTimeCompare(&time1, &v12) != 0;
  }

  return v8;
}

uint64_t __77__HMDCameraRecordingSessionVariantFragmentManager__drainVariantFragmentQueue__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3) {
    [v3 CMTimeRangeValue];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&time1, &range);
  v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CMTimeRangeGetEnd(&time2, &v8);
  unsigned int v6 = CMTimeCompare(&time1, &time2);

  return v6 >> 31;
}

- (void)handleVariantFragment:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  unsigned int v6 = [(HMDCameraRecordingSessionVariantFragmentManager *)self variantFragments];
  unint64_t v7 = [v6 count];

  if (v7 >= 4)
  {
    CMTimeRange v8 = [(HMDCameraRecordingSessionVariantFragmentManager *)self variantFragments];
    v9 = [v8 firstObject];

    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    CMTime v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CMTimeRange v13 = HMFGetLogIdentifier();
      int v23 = 138543618;
      CMTimeRange v24 = v13;
      __int16 v25 = 2112;
      CMTimeRange v26 = v5;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Selecting non-overlapping variant fragment: %@", (uint8_t *)&v23, 0x16u);
    }
    CMTimeRange v14 = [(HMDCameraRecordingSessionVariantFragmentManager *)v11 delegate];
    [v14 variantFragmentManager:v11 didSelectVariantFragment:v9 overlapsFullFragment:0];

    CMTimeRange v15 = [(HMDCameraRecordingSessionVariantFragmentManager *)v11 variantFragments];
    objc_msgSend(v15, "hmf_removeFirstObject");
  }
  v16 = (void *)MEMORY[0x1D9452090]();
  CMTimeRange v17 = self;
  CMTimeRange v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    CMTimeRange v19 = HMFGetLogIdentifier();
    CMTimeRange v20 = [(HMDCameraRecordingSessionVariantFragmentManager *)v17 variantFragments];
    uint64_t v21 = [v20 count];
    int v23 = 138543874;
    CMTimeRange v24 = v19;
    __int16 v25 = 2112;
    CMTimeRange v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = v21 + 1;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Buffering variant fragment: %@, count: %lu", (uint8_t *)&v23, 0x20u);
  }
  CMTimeRange v22 = [(HMDCameraRecordingSessionVariantFragmentManager *)v17 variantFragments];
  [v22 addObject:v5];

  [(HMDCameraRecordingSessionVariantFragmentManager *)v17 _drainVariantFragmentQueue];
}

- (void)handleFullFragment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    unsigned int v6 = [(HMDCameraRecordingSessionVariantFragmentManager *)self fullFragmentTimeRanges];
    unint64_t v7 = (void *)MEMORY[0x1E4F29238];
    [v5 timeRange];
    CMTimeRange v8 = [v7 valueWithCMTimeRange:&v11];
    [v6 addObject:v8];

    [(HMDCameraRecordingSessionVariantFragmentManager *)self _drainVariantFragmentQueue];
  }
  else
  {
    v9 = (HMDCameraRecordingSessionVariantFragmentManager *)_HMFPreconditionFailure();
    [(HMDCameraRecordingSessionVariantFragmentManager *)v9 expectsVariantFragment];
  }
}

- (BOOL)expectsVariantFragment
{
  v2 = [(HMDCameraRecordingSessionVariantFragmentManager *)self fullFragmentTimeRanges];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (HMDCameraRecordingSessionVariantFragmentManager)initWithLogIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingSessionVariantFragmentManager;
  unsigned int v6 = [(HMDCameraRecordingSessionVariantFragmentManager *)&v13 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIdentifier, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    fullFragmentTimeRanges = v7->_fullFragmentTimeRanges;
    v7->_fullFragmentTimeRanges = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    variantFragments = v7->_variantFragments;
    v7->_variantFragments = (NSMutableArray *)v10;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_113112 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_113112, &__block_literal_global_113113);
  }
  v2 = (void *)logCategory__hmf_once_v4_113114;
  return v2;
}

uint64_t __62__HMDCameraRecordingSessionVariantFragmentManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_113114;
  logCategory__hmf_once_v4_113114 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end