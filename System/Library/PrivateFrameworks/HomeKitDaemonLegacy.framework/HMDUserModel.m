@interface HMDUserModel
+ (id)properties;
@end

@implementation HMDUserModel

+ (id)properties
{
  if (properties_onceToken_1253 != -1) {
    dispatch_once(&properties_onceToken_1253, &__block_literal_global_1256);
  }
  v2 = (void *)properties__properties_1254;
  return v2;
}

void __26__HMDUserModel_properties__block_invoke()
{
  v16[13] = *MEMORY[0x1E4F143B8];
  v15[0] = @"accountHandle";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[0] = v14;
  v15[1] = @"accountIdentifier";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[1] = v13;
  v15[2] = @"pairingIdentity";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[2] = v12;
  v15[3] = @"privilege";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[3] = v11;
  v15[4] = @"remoteAccessAllowed";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[4] = v0;
  v15[5] = @"presenceAuthorizationStatus";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[5] = v1;
  v15[6] = @"changeTag";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[6] = v2;
  v15[7] = @"userID";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:0];
  v16[7] = v3;
  v15[8] = @"camerasAccessLevel";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[8] = v4;
  v15[9] = @"announceAccessAllowed";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[9] = v5;
  v15[10] = @"announceAccessLevel";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[10] = v6;
  v15[11] = @"analysisAccessSelection";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[11] = v7;
  v15[12] = @"matterCASEAuthenticatedTagID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16[12] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:13];
  v10 = (void *)properties__properties_1254;
  properties__properties_1254 = v9;
}

@end