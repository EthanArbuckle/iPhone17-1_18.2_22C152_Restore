@interface HMDCameraClipCreateClipWithSignificantEventOperation
+ (id)logCategory;
+ (unint64_t)cameraClipOperationType;
- (HMCameraClipEncryptionManager)encryptionManager;
- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 targetFragmentDuration:(double)a6 clipStartDate:(id)a7 quality:(int64_t)a8 encryptionManager:(id)a9;
- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 targetFragmentDuration:(double)a6 clipStartDate:(id)a7 quality:(int64_t)a8 encryptionManager:(id)a9 dataSource:(id)a10;
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
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 408, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (NSDate)clipStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 392, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (id)attributeDescriptions
{
  v18[3] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v3 = [(HMDCameraClipAddSignificantEventOperation *)&v17 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = NSNumber;
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self targetFragmentDuration];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)[v4 initWithName:@"Target Fragment Duration" value:v6];
  v18[0] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self clipStartDate];
  v10 = (void *)[v8 initWithName:@"Clip Start Date" value:v9];
  v18[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality];
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

  v7 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self clipStartDate];
  [(HMDCameraClipModel *)v6 setStartDate:v7];

  [(HMDCameraClipModel *)v6 setIsComplete:MEMORY[0x263EFFA80]];
  [(HMDCameraClipModel *)v6 setDuration:&unk_26E4737F8];
  id v8 = NSNumber;
  [(HMDCameraClipCreateClipWithSignificantEventOperation *)self targetFragmentDuration];
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
  v13 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self encryptionManager];
  v14 = [v13 key];
  [(HMDCameraClipModel *)v6 setEncryptionKey:v14];

  [(HMDCameraClipModel *)v6 setEncryptionScheme:&unk_26E473810];
  [(HMDCameraClipModel *)v6 setQuality:[(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality]];
  if ([(HMDCameraClipCreateClipWithSignificantEventOperation *)self quality])
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
  v24.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v21 = [(HMDCameraClipAddSignificantEventOperation *)&v24 modelsToAdd];
  v22 = [v21 setByAddingObject:v6];

  return v22;
}

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 targetFragmentDuration:(double)a6 clipStartDate:(id)a7 quality:(int64_t)a8 encryptionManager:(id)a9 dataSource:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if (!v17)
  {
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
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (a6 <= 0.0)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    uint64_t v29 = (HMDCameraClipCreateClipWithSignificantEventOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipCreateClipWithSignificantEventOperation *)v29 initWithClipModelID:v31 localZone:v32 significantEvent:v33 targetFragmentDuration:v37 clipStartDate:v34 quality:v35 encryptionManager:v36];
  }
  v38.receiver = self;
  v38.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  objc_super v24 = [(HMDCameraClipAddSignificantEventOperation *)&v38 initWithClipModelID:v17 localZone:v18 significantEvent:v19 dataSource:v22];
  v25 = v24;
  if (v24)
  {
    v24->_targetFragmentDuration = a6;
    uint64_t v26 = [v20 copy];
    clipStartDate = v25->_clipStartDate;
    v25->_clipStartDate = (NSDate *)v26;

    v25->_quality = a8;
    objc_storeStrong((id *)&v25->_encryptionManager, a9);
  }

  return v25;
}

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 targetFragmentDuration:(double)a6 clipStartDate:(id)a7 quality:(int64_t)a8 encryptionManager:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v22 = [(HMDCameraClipCreateClipWithSignificantEventOperation *)self initWithClipModelID:v20 localZone:v19 significantEvent:v18 targetFragmentDuration:v17 clipStartDate:a8 quality:v16 encryptionManager:a6 dataSource:v21];

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_244242 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_244242, &__block_literal_global_244243);
  }
  v2 = (void *)logCategory__hmf_once_v2_244244;
  return v2;
}

void __67__HMDCameraClipCreateClipWithSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_244244;
  logCategory__hmf_once_v2_244244 = v0;
}

+ (unint64_t)cameraClipOperationType
{
  return 2;
}

@end