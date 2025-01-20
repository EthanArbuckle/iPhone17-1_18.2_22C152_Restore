@interface HMDRemovedUserAccessCodeModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5;
+ (id)properties;
- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5;
- (HMRemovedUserInfo)removedUserInfo;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)unarchiveRemovedUserInfo:(id)a3;
@end

@implementation HMDRemovedUserAccessCodeModel

- (id)unarchiveRemovedUserInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v13 = 0;
  v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqualToString:@"dateRemoved"] & 1) != 0
    || ([v9 isEqualToString:@"userID"] & 1) != 0
    || ([v9 isEqualToString:@"userModelID"] & 1) != 0
    || [v9 isEqualToString:@"userName"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"removedUserInfoData"])
    {
      id v14 = (id)*MEMORY[0x263EFFD08];
LABEL_9:
      v15 = v14;
      goto LABEL_17;
    }
    v11 = [(HMDBackingStoreModelObject *)self valueForKey:@"removedUserInfoData"];
    v12 = [(HMDRemovedUserAccessCodeModel *)self unarchiveRemovedUserInfo:v11];
    if ([v9 isEqualToString:@"dateRemoved"])
    {
      uint64_t v13 = [v12 dateRemoved];
LABEL_16:
      v15 = (void *)v13;

      goto LABEL_17;
    }
    if ([v9 isEqualToString:@"userID"])
    {
      uint64_t v13 = [v12 userID];
      goto LABEL_16;
    }
    if ([v9 isEqualToString:@"userModelID"])
    {
      uint64_t v13 = [v12 userUUID];
      goto LABEL_16;
    }
    if ([v9 isEqualToString:@"userName"])
    {
      uint64_t v13 = [v12 name];
      goto LABEL_16;
    }
  }
  if (![v9 isEqualToString:@"home"])
  {
    if ([v9 isEqualToString:@"modelID"])
    {
      id v14 = [(HMDBackingStoreModelObject *)self uuid];
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)HMDRemovedUserAccessCodeModel;
      id v14 = [(HMDBackingStoreModelObject *)&v18 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
    }
    goto LABEL_9;
  }
  id v17 = [(HMDBackingStoreModelObject *)self parentUUID];
  v15 = +[HMDHomeModel cd_getHomeFromUUID:v17];

LABEL_17:
  return v15;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"removedUserInfoData"])
  {
    id v11 = objc_alloc(MEMORY[0x263F0E6A8]);
    v12 = [v8 userName];
    uint64_t v13 = [v8 userModelID];
    id v14 = [v8 userID];
    v15 = [v8 dateRemoved];
    __int16 v16 = (void *)[v11 initWithName:v12 userUUID:v13 userID:v14 dateRemoved:v15];

    id v17 = encodeRootObject();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDRemovedUserAccessCodeModel;
    id v17 = [(HMDBackingStoreModelObject *)&v19 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v17;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

- (HMRemovedUserInfo)removedUserInfo
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(HMDRemovedUserAccessCodeModel *)self removedUserInfoData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    uint64_t v5 = objc_opt_class();
    id v6 = [(HMDRemovedUserAccessCodeModel *)self removedUserInfoData];
    id v20 = 0;
    id v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v20];
    id v8 = v20;

    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        objc_super v18 = [(HMDRemovedUserAccessCodeModel *)v15 removedUserInfoData];
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@removedUserInfoData was nil, this should never happen", buf, 0xCu);
    }
    id v7 = 0;
  }
  return (HMRemovedUserInfo *)v7;
}

- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:v10 removedUserInfo:v8 accessCode:v9];
  v12 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v11 parentUUID:v10];

  if (v12)
  {
    uint64_t v13 = encodeRootObject();
    [(HMDRemovedUserAccessCodeModel *)v12 setRemovedUserInfoData:v13];

    id v14 = (void *)[v9 copy];
    [(HMDRemovedUserAccessCodeModel *)v12 setAccessCode:v14];

    v15 = [MEMORY[0x263F08C38] UUID];
    [(HMDRemovedUserAccessCodeModel *)v12 setHh2ModelID:v15];
  }
  return v12;
}

+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5
{
  id v7 = (void *)MEMORY[0x263F08C38];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 userUUID];
  id v11 = objc_msgSend(v10, "hm_convertToData");
  v12 = objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v9, v11);

  uint64_t v13 = (void *)MEMORY[0x263F08C38];
  id v14 = [v8 dataUsingEncoding:4];

  v15 = objc_msgSend(v13, "hmf_UUIDWithNamespace:data:", v12, v14);

  return v15;
}

+ (id)properties
{
  if (properties_onceToken_270739 != -1) {
    dispatch_once(&properties_onceToken_270739, &__block_literal_global_270740);
  }
  v2 = (void *)properties__properties_270741;
  return v2;
}

void __43__HMDRemovedUserAccessCodeModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"removedUserInfoData";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"accessCode";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v6[1] = v1;
  v5[2] = @"hh2ModelID";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)properties__properties_270741;
  properties__properties_270741 = v3;
}

@end