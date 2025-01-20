@interface HMDFaceprintModel
+ (BOOL)hmbExcludeFromCloudStorage;
+ (id)hmbProperties;
- (HMDFaceprintModel)initWithFaceprint:(id)a3;
- (id)createFaceprint;
@end

@implementation HMDFaceprintModel

- (id)createFaceprint
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(HMDFaceprintModel *)self data];
  uint64_t v4 = [(HMDFaceprintModel *)self modelUUID];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc(MEMORY[0x263F0E360]);
    v7 = [(HMBModel *)self hmbModelID];
    v8 = [(HMBModel *)self hmbParentModelID];
    v9 = (void *)[v6 initWithUUID:v7 data:v3 modelUUID:v5 faceCropUUID:v8];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMBModel *)v11 debugDescription];
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot create faceprint from model: %@", (uint8_t *)&v16, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (HMDFaceprintModel)initWithFaceprint:(id)a3
{
  id v4 = a3;
  v5 = [HMDFaceprintModel alloc];
  id v6 = [v4 UUID];
  v7 = [v4 faceCropUUID];
  v8 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v7];

  v9 = [v4 data];
  [(HMDFaceprintModel *)v8 setData:v9];

  v10 = [v4 modelUUID];
  [(HMDFaceprintModel *)v8 setModelUUID:v10];

  id v11 = objc_alloc(MEMORY[0x263F492E0]);
  v12 = [v4 faceCropUUID];

  v13 = (void *)[v11 initWithModelID:v12];
  [(HMDFaceprintModel *)v8 setFaceCrop:v13];

  return v8;
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_199985 != -1) {
    dispatch_once(&hmbProperties_onceToken_199985, &__block_literal_global_199986);
  }
  v2 = (void *)hmbProperties_properties_199987;
  return v2;
}

void __34__HMDFaceprintModel_hmbProperties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"data";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"modelUUID";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"faceCrop";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)hmbProperties_properties_199987;
  hmbProperties_properties_199987 = v3;
}

@end