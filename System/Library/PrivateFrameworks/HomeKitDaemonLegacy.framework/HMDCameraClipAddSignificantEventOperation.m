@interface HMDCameraClipAddSignificantEventOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6;
- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 dataSource:(id)a7;
- (HMDCameraRecordingSessionSignificantEvent)significantEvent;
- (NSDictionary)homePresenceByPairingIdentity;
- (id)attributeDescriptions;
- (id)modelsToAdd;
- (void)updateMirrorOutputModel:(id)a3;
@end

@implementation HMDCameraClipAddSignificantEventOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

- (NSDictionary)homePresenceByPairingIdentity
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (HMDCameraRecordingSessionSignificantEvent)significantEvent
{
  return (HMDCameraRecordingSessionSignificantEvent *)objc_getProperty(self, a2, 376, 1);
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v3 = [(HMDCameraClipOperation *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v6 = (void *)[v4 initWithName:@"Significant Event" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDCameraClipAddSignificantEventOperation *)self homePresenceByPairingIdentity];
  v9 = (void *)[v7 initWithName:@"Home Presence By Pairing Identity" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (void)updateMirrorOutputModel:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 hmbModelID];
  v8 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v9 = [v8 UUID];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    objc_super v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding assets to significant event model for mirror output: %@", (uint8_t *)&v21, 0x16u);
    }
    v15 = [(HMDCameraClipAddSignificantEventOperation *)v12 significantEvent];
    v16 = [v15 heroFrameData];

    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithAssetContent:v16 itemTypeHint:@"jpg"];
      [v6 setHeroFrameAsset:v17];
    }
    v18 = [(HMDCameraClipAddSignificantEventOperation *)v12 significantEvent];
    v19 = [v18 faceCropData];

    if (v19)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithAssetContent:v19 itemTypeHint:@"jpg"];
      [v6 setFaceCropAsset:v20];
    }
  }
}

- (id)modelsToAdd
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [HMDCameraSignificantEventNotificationModel alloc];
  v5 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  id v6 = [v5 UUID];
  id v7 = [(HMDCameraClipOperation *)self clipModelID];
  v8 = [(HMBModel *)v4 initWithModelID:v6 parentModelID:v7];

  v9 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  int v10 = [v9 dateOfOccurrence];
  [(HMDCameraSignificantEventNotificationModel *)v8 setDateOfOccurrence:v10];

  v11 = NSNumber;
  v12 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  objc_super v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "reason"));
  [(HMDCameraSignificantEventNotificationModel *)v8 setSignificantEvent:v13];

  v14 = NSNumber;
  v15 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "confidenceLevel"));
  [(HMDCameraSignificantEventNotificationModel *)v8 setConfidenceLevel:v16];

  v17 = NSNumber;
  v18 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  [v18 timeOffsetWithinClip];
  v19 = objc_msgSend(v17, "numberWithDouble:");
  [(HMDCameraSignificantEventNotificationModel *)v8 setTimeOffsetWithinClip:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F69E80]);
  int v21 = [(HMDCameraClipOperation *)self clipModelID];
  v22 = (void *)[v20 initWithModelID:v21 action:1];
  [(HMDCameraSignificantEventNotificationModel *)v8 setAssociatedClip:v22];

  __int16 v23 = [(HMDCameraClipAddSignificantEventOperation *)self homePresenceByPairingIdentity];
  [(HMDCameraSignificantEventNotificationModel *)v8 setHomePresenceByPairingIdentity:v23];

  v53 = v3;
  v54 = v8;
  id v24 = (void *)MEMORY[0x1D9452090]([v3 addObject:v8]);
  uint64_t v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    v28 = [(HMBModel *)v8 debugDescription];
    *(_DWORD *)buf = 138543618;
    v62 = v27;
    __int16 v63 = 2112;
    v64 = v28;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating significant event model: %@", buf, 0x16u);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v29 = [(HMDCameraClipAddSignificantEventOperation *)v25 significantEvent];
  v30 = [v29 faceClassifications];

  id obj = v30;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v36 = [HMDCameraSignificantEventFaceClassificationModel alloc];
        v37 = [v35 UUID];
        v38 = [(HMBModel *)v54 hmbModelID];
        v39 = [(HMBModel *)v36 initWithModelID:v37 parentModelID:v38];

        v40 = [v35 personManagerUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v39 setPersonManagerUUID:v40];

        v41 = [v35 personUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v39 setPersonUUID:v41];

        v42 = [v35 personName];
        [(HMDCameraSignificantEventFaceClassificationModel *)v39 setPersonName:v42];

        v43 = [v35 unassociatedFaceCropUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v39 setUnassociatedFaceCropUUID:v43];

        v44 = (void *)MEMORY[0x1D9452090]([v53 addObject:v39]);
        v45 = v25;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = HMFGetLogIdentifier();
          v48 = [(HMBModel *)v39 debugDescription];
          *(_DWORD *)buf = 138543618;
          v62 = v47;
          __int16 v63 = 2112;
          v64 = v48;
          _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Updating face classification model: %@", buf, 0x16u);
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v32);
  }

  v55.receiver = v25;
  v55.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v49 = [(HMDCameraClipAddModelsOperation *)&v55 modelsToAdd];
  v50 = [v49 setByAddingObjectsFromSet:v53];

  return v50;
}

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 dataSource:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_13:
    v22 = (HMDCameraClipAddSignificantEventOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipAddSignificantEventOperation *)v22 initWithClipModelID:v24 localZone:v25 significantEvent:v26 homePresenceByPairingIdentity:v27];
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v18 = [(HMDCameraClipOperation *)&v28 initWithClipModelID:v12 localZone:v13 dataSource:v16];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    significantEvent = v18->_significantEvent;
    v18->_significantEvent = (HMDCameraRecordingSessionSignificantEvent *)v19;

    objc_storeStrong((id *)&v18->_homePresenceByPairingIdentity, a6);
  }

  return v18;
}

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v15 = [(HMDCameraClipAddSignificantEventOperation *)self initWithClipModelID:v13 localZone:v12 significantEvent:v11 homePresenceByPairingIdentity:v10 dataSource:v14];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_92094 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_92094, &__block_literal_global_92095);
  }
  v2 = (void *)logCategory__hmf_once_v5_92096;
  return v2;
}

uint64_t __56__HMDCameraClipAddSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_92096;
  logCategory__hmf_once_v5_92096 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (unint64_t)cameraClipOperationType
{
  return 3;
}

@end