@interface HMDCameraClipCreateClipOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (HMCameraClipEncryptionManager)encryptionManager;
- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8;
- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8 dataSource:(id)a9;
- (NSDate)clipStartDate;
- (double)targetFragmentDuration;
- (id)attributeDescriptions;
- (id)modelsToAdd;
- (int64_t)quality;
@end

@implementation HMDCameraClipCreateClipOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_clipStartDate, 0);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 400, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (NSDate)clipStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 384, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (id)attributeDescriptions
{
  v18[3] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraClipCreateClipOperation;
  v3 = [(HMDCameraClipOperation *)&v17 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = NSNumber;
  [(HMDCameraClipCreateClipOperation *)self targetFragmentDuration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)[v4 initWithName:@"Target Fragment Duration" value:v6];
  v18[0] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDCameraClipCreateClipOperation *)self clipStartDate];
  v10 = (void *)[v8 initWithName:@"Clip Start Date" value:v9];
  v18[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCameraClipCreateClipOperation *)self quality];
  v12 = HMStringFromCameraClipQuality();
  v13 = (void *)[v11 initWithName:@"Quality" value:v12];
  v18[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v15 = [v3 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (id)modelsToAdd
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [HMDCameraClipModel alloc];
  id v4 = [(HMDCameraClipOperation *)self clipModelID];
  v5 = +[HMDCameraClipModel sentinelParentUUID];
  v6 = [(HMBModel *)v3 initWithModelID:v4 parentModelID:v5];

  v7 = [(HMDCameraClipCreateClipOperation *)self clipStartDate];
  [(HMDCameraClipModel *)v6 setStartDate:v7];

  [(HMDCameraClipModel *)v6 setIsComplete:MEMORY[0x263EFFA80]];
  [(HMDCameraClipModel *)v6 setDuration:&unk_26E472178];
  id v8 = NSNumber;
  [(HMDCameraClipCreateClipOperation *)self targetFragmentDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [(HMDCameraClipModel *)v6 setTargetFragmentDuration:v9];

  v10 = NSNumber;
  +[HMDCameraClipManager maximumClipDuration];
  id v11 = objc_msgSend(v10, "numberWithDouble:");
  [(HMDCameraClipModel *)v6 setMaximumClipDuration:v11];

  [(HMDCameraClipModel *)v6 setRecordedLocally:MEMORY[0x263EFFA88]];
  [(HMDCameraClipModel *)v6 setStreamingAssetVersion:@"1"];
  id v12 = objc_alloc_init(MEMORY[0x263F49340]);
  [(HMDCameraClipModel *)v6 setVideoStreamingAsset:v12];

  [(HMDCameraClipModel *)v6 setVideoMetadataArray:MEMORY[0x263EFFA68]];
  v13 = [(HMDCameraClipCreateClipOperation *)self encryptionManager];
  v14 = [v13 key];
  [(HMDCameraClipModel *)v6 setEncryptionKey:v14];

  [(HMDCameraClipModel *)v6 setEncryptionScheme:&unk_26E472190];
  [(HMDCameraClipModel *)v6 setQuality:[(HMDCameraClipCreateClipOperation *)self quality]];
  if ([(HMDCameraClipCreateClipOperation *)self quality])
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"8.0"];
    [(HMBModel *)v6 setHmbMinimumSupportedVersion:v15];
  }
  v16 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating clip: %@", buf, 0x16u);
  }
  v24.receiver = v17;
  v24.super_class = (Class)HMDCameraClipCreateClipOperation;
  v21 = [(HMDCameraClipAddModelsOperation *)&v24 modelsToAdd];
  v22 = [v21 setByAddingObject:v6];

  return v22;
}

- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8 dataSource:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (a5 <= 0.0)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    __int16 v27 = (HMDCameraClipCreateClipOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipCreateClipOperation *)v27 initWithClipModelID:v29 localZone:v30 targetFragmentDuration:v34 clipStartDate:v31 quality:v32 encryptionManager:v33];
  }
  v21 = v20;
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraClipCreateClipOperation;
  v22 = [(HMDCameraClipOperation *)&v35 initWithClipModelID:v16 localZone:v17 dataSource:v20];
  v23 = v22;
  if (v22)
  {
    v22->_targetFragmentDuration = a5;
    uint64_t v24 = [v18 copy];
    clipStartDate = v23->_clipStartDate;
    v23->_clipStartDate = (NSDate *)v24;

    v23->_quality = a7;
    objc_storeStrong((id *)&v23->_encryptionManager, a8);
  }

  return v23;
}

- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v19 = [(HMDCameraClipCreateClipOperation *)self initWithClipModelID:v17 localZone:v16 targetFragmentDuration:v15 clipStartDate:a7 quality:v14 encryptionManager:v18 dataSource:a5];

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_148187 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_148187, &__block_literal_global_148188);
  }
  v2 = (void *)logCategory__hmf_once_v2_148189;
  return v2;
}

void __47__HMDCameraClipCreateClipOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_148189;
  logCategory__hmf_once_v2_148189 = v0;
}

+ (unint64_t)cameraClipOperationType
{
  return 1;
}

@end