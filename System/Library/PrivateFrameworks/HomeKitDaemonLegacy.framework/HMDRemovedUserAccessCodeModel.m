@interface HMDRemovedUserAccessCodeModel
+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5;
+ (id)properties;
- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5;
- (HMRemovedUserInfo)removedUserInfo;
@end

@implementation HMDRemovedUserAccessCodeModel

- (HMRemovedUserInfo)removedUserInfo
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDRemovedUserAccessCodeModel *)self removedUserInfoData];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    v6 = [(HMDRemovedUserAccessCodeModel *)self removedUserInfoData];
    id v20 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v20];
    id v8 = v20;

    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        v18 = [(HMDRemovedUserAccessCodeModel *)v15 removedUserInfoData];
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@removedUserInfoData was nil, this should never happen", buf, 0xCu);
    }
    v7 = 0;
  }
  return (HMRemovedUserInfo *)v7;
}

- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:v10 removedUserInfo:v8 accessCode:v9];
  v12 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v11 parentUUID:v10];

  if (v12)
  {
    v13 = encodeRootObject();
    [(HMDRemovedUserAccessCodeModel *)v12 setRemovedUserInfoData:v13];

    v14 = (void *)[v9 copy];
    [(HMDRemovedUserAccessCodeModel *)v12 setAccessCode:v14];
  }
  return v12;
}

+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 userUUID];
  v11 = objc_msgSend(v10, "hm_convertToData");
  v12 = objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v9, v11);

  v13 = (void *)MEMORY[0x1E4F29128];
  v14 = [v8 dataUsingEncoding:4];

  v15 = objc_msgSend(v13, "hmf_UUIDWithNamespace:data:", v12, v14);

  return v15;
}

+ (id)properties
{
  if (properties_onceToken_189550 != -1) {
    dispatch_once(&properties_onceToken_189550, &__block_literal_global_189551);
  }
  v2 = (void *)properties__properties_189552;
  return v2;
}

void __43__HMDRemovedUserAccessCodeModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"removedUserInfoData";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"accessCode";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_189552;
  properties__properties_189552 = v2;
}

@end