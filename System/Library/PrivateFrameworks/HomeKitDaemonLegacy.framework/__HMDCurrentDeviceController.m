@interface __HMDCurrentDeviceController
- (__HMDCurrentDeviceController)init;
- (void)__handleDeviceUpdated:(id)a3;
- (void)updateWithDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation __HMDCurrentDeviceController

- (void)__handleDeviceUpdated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v8 shortDescription];
    int v14 = 138543618;
    v15 = v12;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device updated: %@", (uint8_t *)&v14, 0x16u);
  }
  __HMDDeviceControllerUpdateDevice(v10, v8);
}

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    int v14 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating the current device is not supported", (uint8_t *)&v13, 0xCu);
  }
  if (v7)
  {
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:0 reason:@"Updating the current device is not supported" suggestion:0];
    v7[2](v7, v12);
  }
}

- (__HMDCurrentDeviceController)init
{
  v3 = +[HMDAppleAccountManager sharedManager];
  id v4 = [v3 device];

  v9.receiver = self;
  v9.super_class = (Class)__HMDCurrentDeviceController;
  v5 = [(HMDDeviceController *)&v9 initWithDevice:v4 identifier:0];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7 = +[HMDAppleAccountManager sharedManager];
    [v6 addObserver:v5 selector:sel___handleDeviceUpdated_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v7];
  }
  return v5;
}

@end