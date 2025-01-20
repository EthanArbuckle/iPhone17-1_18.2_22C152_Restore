@interface HMDResidentDeviceModel
+ (id)properties;
@end

@implementation HMDResidentDeviceModel

+ (id)properties
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"deviceUUID";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v2;
  v9[1] = @"enabled";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = v3;
  v9[2] = @"confirmed";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[2] = v4;
  v9[3] = @"device";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[3] = v5;
  v9[4] = @"changeToken";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

@end