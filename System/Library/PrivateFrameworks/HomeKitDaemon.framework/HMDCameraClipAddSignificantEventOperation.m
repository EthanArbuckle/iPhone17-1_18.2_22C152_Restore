@interface HMDCameraClipAddSignificantEventOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5;
- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 dataSource:(id)a6;
- (HMDCameraRecordingSessionSignificantEvent)significantEvent;
- (id)attributeDescriptions;
- (id)modelsToAdd;
- (void)updateMirrorOutputModel:(id)a3;
@end

@implementation HMDCameraClipAddSignificantEventOperation

- (void).cxx_destruct
{
}

- (HMDCameraRecordingSessionSignificantEvent)significantEvent
{
  return (HMDCameraRecordingSessionSignificantEvent *)objc_getProperty(self, a2, 376, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v3 = [(HMDCameraClipOperation *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v6 = (void *)[v4 initWithName:@"Significant Event" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (void)updateMirrorOutputModel:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 hmbModelID];
  v8 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v9 = [v8 UUID];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding assets to significant event model for mirror output: %@", (uint8_t *)&v21, 0x16u);
    }
    v15 = [(HMDCameraClipAddSignificantEventOperation *)v12 significantEvent];
    v16 = [v15 heroFrameData];

    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithAssetContent:v16 itemTypeHint:@"jpg"];
      [v6 setHeroFrameAsset:v17];
    }
    v18 = [(HMDCameraClipAddSignificantEventOperation *)v12 significantEvent];
    v19 = [v18 faceCropData];

    if (v19)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithAssetContent:v19 itemTypeHint:@"jpg"];
      [v6 setFaceCropAsset:v20];
    }
  }
}

- (id)modelsToAdd
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [HMDCameraSignificantEventNotificationModel alloc];
  v5 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  id v6 = [v5 UUID];
  v7 = [(HMDCameraClipOperation *)self clipModelID];
  v8 = [(HMBModel *)v4 initWithModelID:v6 parentModelID:v7];

  v9 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  int v10 = [v9 dateOfOccurrence];
  [(HMDCameraSignificantEventNotificationModel *)v8 setDateOfOccurrence:v10];

  v11 = NSNumber;
  v12 = [(HMDCameraClipAddSignificantEventOperation *)self significantEvent];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "reason"));
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

  id v20 = objc_alloc(MEMORY[0x263F492A8]);
  int v21 = [(HMDCameraClipOperation *)self clipModelID];
  v22 = (void *)[v20 initWithModelID:v21 action:1];
  [(HMDCameraSignificantEventNotificationModel *)v8 setAssociatedClip:v22];

  v52 = v3;
  v53 = v8;
  __int16 v23 = (void *)MEMORY[0x230FBD990]([v3 addObject:v8]);
  id v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = HMFGetLogIdentifier();
    v27 = [(HMBModel *)v8 debugDescription];
    *(_DWORD *)buf = 138543618;
    v61 = v26;
    __int16 v62 = 2112;
    v63 = v27;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating significant event model: %@", buf, 0x16u);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v28 = [(HMDCameraClipAddSignificantEventOperation *)v24 significantEvent];
  v29 = [v28 faceClassifications];

  id obj = v29;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v35 = [HMDCameraSignificantEventFaceClassificationModel alloc];
        v36 = [v34 UUID];
        v37 = [(HMBModel *)v53 hmbModelID];
        v38 = [(HMBModel *)v35 initWithModelID:v36 parentModelID:v37];

        v39 = [v34 personManagerUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v38 setPersonManagerUUID:v39];

        v40 = [v34 personUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v38 setPersonUUID:v40];

        v41 = [v34 personName];
        [(HMDCameraSignificantEventFaceClassificationModel *)v38 setPersonName:v41];

        v42 = [v34 unassociatedFaceCropUUID];
        [(HMDCameraSignificantEventFaceClassificationModel *)v38 setUnassociatedFaceCropUUID:v42];

        v43 = (void *)MEMORY[0x230FBD990]([v52 addObject:v38]);
        v44 = v24;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          v47 = [(HMBModel *)v38 debugDescription];
          *(_DWORD *)buf = 138543618;
          v61 = v46;
          __int16 v62 = 2112;
          v63 = v47;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating face classification model: %@", buf, 0x16u);
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v31);
  }

  v54.receiver = v24;
  v54.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v48 = [(HMDCameraClipAddModelsOperation *)&v54 modelsToAdd];
  v49 = [v48 setByAddingObjectsFromSet:v52];

  return v49;
}

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
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
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v19 = (HMDCameraClipAddSignificantEventOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipAddSignificantEventOperation *)v19 initWithClipModelID:v21 localZone:v22 significantEvent:v23];
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v15 = [(HMDCameraClipOperation *)&v24 initWithClipModelID:v10 localZone:v11 dataSource:v13];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    significantEvent = v15->_significantEvent;
    v15->_significantEvent = (HMDCameraRecordingSessionSignificantEvent *)v16;
  }
  return v15;
}

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v12 = [(HMDCameraClipAddSignificantEventOperation *)self initWithClipModelID:v10 localZone:v9 significantEvent:v8 dataSource:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_135186 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_135186, &__block_literal_global_135187);
  }
  v2 = (void *)logCategory__hmf_once_v5_135188;
  return v2;
}

void __56__HMDCameraClipAddSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_135188;
  logCategory__hmf_once_v5_135188 = v0;
}

+ (unint64_t)cameraClipOperationType
{
  return 3;
}

@end