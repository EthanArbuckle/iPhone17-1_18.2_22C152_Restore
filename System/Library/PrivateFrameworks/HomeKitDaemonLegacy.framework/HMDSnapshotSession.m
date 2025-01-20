@interface HMDSnapshotSession
+ (id)logCategory;
- (HMDCameraGetSnapshotProtocol)snapshotGetter;
- (HMDCameraSnapshotMetrics)snapshotMetrics;
- (HMDCameraSnapshotSessionID)sessionID;
- (HMDSnapshotCompletionTimer)snapshotCompletionTimer;
- (HMDSnapshotSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10;
- (NSMutableArray)sessionMessages;
- (NSString)description;
- (id)logIdentifier;
- (unint64_t)streamingTierType;
- (void)dealloc;
- (void)respond:(id)a3 payload:(id)a4;
@end

@implementation HMDSnapshotSession

- (id)logIdentifier
{
  v2 = [(HMDSnapshotSession *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)respond:(id)a3 payload:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  v7 = [(HMDSnapshotSession *)self sessionMessages];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(HMDSnapshotSession *)self sessionID];
    [v9 markMilestoneFor:@"SentSnapshotResponse"];

    v10 = [(HMDSnapshotSession *)self snapshotMetrics];
    [v10 setError:v6];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(HMDSnapshotSession *)self sessionMessages];
    uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0;
        uint64_t v27 = v12;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1D9452090]();
          v17 = self;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v19 = v13;
            v20 = self;
            v22 = id v21 = v6;
            v23 = [v15 stringForKey:@"kCameraSessionID"];
            *(_DWORD *)buf = 138544130;
            v35 = v22;
            __int16 v36 = 2112;
            v37 = v23;
            __int16 v38 = 2112;
            id v39 = v21;
            __int16 v40 = 2112;
            id v41 = v29;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with error %@ payload %@", buf, 0x2Au);

            id v6 = v21;
            self = v20;
            uint64_t v13 = v19;
            uint64_t v12 = v27;
          }

          v24 = [v15 responseHandler];

          if (v24)
          {
            v25 = [v15 responseHandler];
            ((void (**)(void, id, id))v25)[2](v25, v6, v29);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v12);
    }

    v26 = [(HMDSnapshotSession *)self sessionMessages];
    [v26 removeAllObjects];
  }
}

- (NSMutableArray)sessionMessages
{
  return self->_sessionMessages;
}

- (HMDCameraSnapshotMetrics)snapshotMetrics
{
  return self->_snapshotMetrics;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1039];
  [(HMDSnapshotSession *)self respond:v3 payload:0];

  v4.receiver = self;
  v4.super_class = (Class)HMDSnapshotSession;
  [(HMDSnapshotSession *)&v4 dealloc];
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDSnapshotCompletionTimer)snapshotCompletionTimer
{
  return self->_snapshotCompletionTimer;
}

- (unint64_t)streamingTierType
{
  return self->_streamingTierType;
}

- (HMDCameraGetSnapshotProtocol)snapshotGetter
{
  return self->_snapshotGetter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotMetrics, 0);
  objc_storeStrong((id *)&self->_sessionMessages, 0);
  objc_storeStrong((id *)&self->_snapshotCompletionTimer, 0);
  objc_storeStrong((id *)&self->_snapshotGetter, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDSnapshotSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  BOOL v10 = a9;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v32.receiver = self;
  v32.super_class = (Class)HMDSnapshotSession;
  v22 = [(HMDSnapshotSession *)&v32 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionID, a3);
    objc_storeStrong((id *)&v23->_snapshotGetter, a5);
    v33[0] = v21;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    uint64_t v25 = [v24 mutableCopy];
    sessionMessages = v23->_sessionMessages;
    v23->_sessionMessages = (NSMutableArray *)v25;

    uint64_t v27 = [[HMDSnapshotCompletionTimer alloc] initWithSnapshotSession:v23 timer:a7];
    snapshotCompletionTimer = v23->_snapshotCompletionTimer;
    v23->_snapshotCompletionTimer = v27;

    v23->_streamingTierType = a8;
    id v29 = [[HMDCameraSnapshotMetrics alloc] initWithSessionID:v18 cameraAccessory:v19 isLocal:v10 snapshotForNotification:a10];
    snapshotMetrics = v23->_snapshotMetrics;
    v23->_snapshotMetrics = v29;
  }
  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_116767 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_116767, &__block_literal_global_116768);
  }
  v2 = (void *)logCategory__hmf_once_v1_116769;
  return v2;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HMDSnapshotSession *)self sessionID];
  objc_super v4 = [v2 stringWithFormat:@"ID %@", v3];

  return (NSString *)v4;
}

uint64_t __33__HMDSnapshotSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_116769;
  logCategory__hmf_once_v1_116769 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end