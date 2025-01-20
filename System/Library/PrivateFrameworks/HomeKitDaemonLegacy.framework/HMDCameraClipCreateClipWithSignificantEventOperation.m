@interface HMDCameraClipCreateClipWithSignificantEventOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (HMCameraClipEncryptionManager)encryptionManager;
- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10;
- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10 dataSource:(id)a11;
- (NSDate)clipStartDate;
- (double)targetFragmentDuration;
- (id)attributeDescriptions;
- (id)modelsToAdd;
- (int64_t)quality;
@end

@implementation HMDCameraClipCreateClipWithSignificantEventOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_clipStartDate, 0);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 416, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (NSDate)clipStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 400, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (id)attributeDescriptions
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v3 = [(HMDCameraClipAddSignificantEventOperation *)&v17 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = NSNumber;
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self targetFragmentDuration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)[v4 initWithName:@"Target Fragment Duration" value:v6];
  v18[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self clipStartDate];
  v10 = (void *)[v8 initWithName:@"Clip Start Date" value:v9];
  v18[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality];
  v12 = HMStringFromCameraClipQuality();
  v13 = (void *)[v11 initWithName:@"Quality" value:v12];
  v18[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v15 = [v3 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (id)modelsToAdd
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [HMDCameraClipModel alloc];
  id v4 = [(HMDCameraClipOperation *)self clipModelID];
  v5 = +[HMDCameraClipModel sentinelParentUUID];
  v6 = [(HMBModel *)v3 initWithModelID:v4 parentModelID:v5];

  v7 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self clipStartDate];
  [(HMDCameraClipModel *)v6 setStartDate:v7];

  [(HMDCameraClipModel *)v6 setIsComplete:MEMORY[0x1E4F1CC28]];
  [(HMDCameraClipModel *)v6 setDuration:&unk_1F2DC9D00];
  id v8 = NSNumber;
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self targetFragmentDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [(HMDCameraClipModel *)v6 setTargetFragmentDuration:v9];

  v10 = NSNumber;
  +[HMDCameraClipManager maximumClipDuration];
  id v11 = objc_msgSend(v10, "numberWithDouble:");
  [(HMDCameraClipModel *)v6 setMaximumClipDuration:v11];

  [(HMDCameraClipModel *)v6 setRecordedLocally:MEMORY[0x1E4F1CC38]];
  [(HMDCameraClipModel *)v6 setStreamingAssetVersion:@"1"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F69F10]);
  [(HMDCameraClipModel *)v6 setVideoStreamingAsset:v12];

  [(HMDCameraClipModel *)v6 setVideoMetadataArray:MEMORY[0x1E4F1CBF0]];
  v13 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self encryptionManager];
  v14 = [v13 key];
  [(HMDCameraClipModel *)v6 setEncryptionKey:v14];

  [(HMDCameraClipModel *)v6 setEncryptionScheme:&unk_1F2DC9D18];
  [(HMDCameraClipModel *)v6 setQuality:[(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality]];
  if ([(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality])
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"8.0"];
    [(HMBModel *)v6 setHmbMinimumSupportedVersion:v15];
  }
  v16 = (void *)MEMORY[0x1D9452090]();
  objc_super v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = [(HMBModel *)v6 debugDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    __int16 v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating clip: %@", buf, 0x16u);
  }
  v24.receiver = v17;
  v24.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v21 = [(HMDCameraClipAddSignificantEventOperation *)&v24 modelsToAdd];
  v22 = [v21 setByAddingObject:v6];

  return v22;
}

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10 dataSource:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (a7 <= 0.0)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v22)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v23)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v25 = v24;
  if (!v24)
  {
LABEL_19:
    v31 = (HMDCameraClipCreateClipWithSignificantEventOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipCreateClipWithSignificantEventOperation *)v31 initWithClipModelID:v33 localZone:v34 significantEvent:v35 homePresenceByPairingIdentity:v36 targetFragmentDuration:v39 clipStartDate:v37 quality:v38 encryptionManager:a10];
  }
  v40.receiver = self;
  v40.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v26 = [(HMDCameraClipAddSignificantEventOperation *)&v40 initWithClipModelID:v18 localZone:v19 significantEvent:v20 homePresenceByPairingIdentity:v21 dataSource:v24];
  __int16 v27 = v26;
  if (v26)
  {
    v26->_targetFragmentDuration = a7;
    uint64_t v28 = [v22 copy];
    clipStartDate = v27->_clipStartDate;
    v27->_clipStartDate = (NSDate *)v28;

    v27->_quality = a9;
    objc_storeStrong((id *)&v27->_encryptionManager, a10);
  }

  return v27;
}

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10
{
  id v18 = a10;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v25 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self initWithClipModelID:v23 localZone:v22 significantEvent:v21 homePresenceByPairingIdentity:v20 targetFragmentDuration:v19 clipStartDate:a9 quality:a7 encryptionManager:v18 dataSource:v24];

  return v25;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_171687 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_171687, &__block_literal_global_171688);
  }
  v2 = (void *)logCategory__hmf_once_v2_171689;
  return v2;
}

uint64_t __67__HMDCameraClipCreateClipWithSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_171689;
  logCategory__hmf_once_v2_171689 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (unint64_t)cameraClipOperationType
{
  return 2;
}

@end