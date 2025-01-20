@interface HMDResidentDeviceManagerFactory
+ (id)createManagerForHomeUUID:(id)a3;
@end

@implementation HMDResidentDeviceManagerFactory

+ (id)createManagerForHomeUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[HMDFeaturesDataSource defaultDataSource];
  int v5 = [v4 isResidentSelectionEnabledForHomeUUID:v3];

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using ROAR V3 HMDResidentDeviceManager", (uint8_t *)&v14, 0xCu);
    }
    v10 = off_264A12578;
  }
  else
  {
    if (v8)
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using ROAR HMDResidentDeviceManager", (uint8_t *)&v14, 0xCu);
    }
    v10 = off_264A12570;
  }

  id v12 = objc_alloc_init(*v10);

  return v12;
}

@end