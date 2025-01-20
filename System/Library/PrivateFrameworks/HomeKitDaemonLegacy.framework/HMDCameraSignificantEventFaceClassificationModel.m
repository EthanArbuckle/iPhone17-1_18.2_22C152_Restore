@interface HMDCameraSignificantEventFaceClassificationModel
+ (id)hmbExternalRecordType;
+ (id)hmbProperties;
- (id)createFaceClassification;
@end

@implementation HMDCameraSignificantEventFaceClassificationModel

+ (id)hmbExternalRecordType
{
  return @"CameraClip";
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_98883 != -1) {
    dispatch_once(&hmbProperties_onceToken_98883, &__block_literal_global_98884);
  }
  v2 = (void *)hmbProperties__properties_98885;
  return v2;
}

void __65__HMDCameraSignificantEventFaceClassificationModel_hmbProperties__block_invoke()
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F69EE8] fieldWithClass:objc_opt_class()];
  v1 = (void *)[v0 mutableCopy];

  [v1 setLoggingVisibility:1];
  v8[0] = @"personManagerUUID";
  v2 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v9[0] = v2;
  v8[1] = @"personUUID";
  v3 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v9[1] = v3;
  v8[2] = @"personName";
  v4 = (void *)[v1 copy];
  v9[2] = v4;
  v8[3] = @"unassociatedFaceCropUUID";
  v5 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
  v7 = (void *)hmbProperties__properties_98885;
  hmbProperties__properties_98885 = v6;
}

- (id)createFaceClassification
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraSignificantEventFaceClassificationModel *)self personManagerUUID];
  if (v3)
  {
    v4 = [HMDMutableCameraSignificantEventFaceClassification alloc];
    v5 = [(HMBModel *)self hmbModelID];
    uint64_t v6 = [(HMDCameraSignificantEventFaceClassification *)v4 initWithUUID:v5 personManagerUUID:v3];

    v7 = [(HMDCameraSignificantEventFaceClassificationModel *)self personUUID];
    [(HMDCameraSignificantEventFaceClassification *)v6 setPersonUUID:v7];

    v8 = [(HMDCameraSignificantEventFaceClassificationModel *)self personName];
    [(HMDCameraSignificantEventFaceClassification *)v6 setPersonName:v8];

    v9 = [(HMDCameraSignificantEventFaceClassificationModel *)self unassociatedFaceCropUUID];
    [(HMDCameraSignificantEventFaceClassification *)v6 setUnassociatedFaceCropUUID:v9];

    v10 = (void *)[(HMDMutableCameraSignificantEventFaceClassification *)v6 copy];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [(HMBModel *)v12 debugDescription];
      int v17 = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot create face classification from model: %@", (uint8_t *)&v17, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

@end