@interface HMDResidentDeviceManagerFactory
+ (id)createManagerForHomeUUID:(id)a3;
@end

@implementation HMDResidentDeviceManagerFactory

+ (id)createManagerForHomeUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D9452090]();
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Using legacy HMDResidentDeviceManager", (uint8_t *)&v9, 0xCu);
  }
  v7 = objc_alloc_init(HMDResidentDeviceManagerLegacy);

  return v7;
}

@end