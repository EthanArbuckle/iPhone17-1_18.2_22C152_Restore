@interface HMDResidentDeviceModel
+ (id)properties;
@end

@implementation HMDResidentDeviceModel

+ (id)properties
{
  v11[6] = *MEMORY[0x263EF8340];
  v10[0] = @"deviceUUID";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v2;
  v10[1] = @"enabled";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v3;
  v10[2] = @"confirmed";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[2] = v4;
  v10[3] = @"device";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[3] = v5;
  v10[4] = @"residentCapabilities";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[4] = v6;
  v10[5] = @"changeToken";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[5] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

@end