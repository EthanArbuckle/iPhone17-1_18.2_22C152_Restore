@interface HMDDeviceController
+ (id)deviceControllerForCurrentDevice;
+ (id)deviceControllerForDevice:(id)a3;
+ (id)deviceControllerForDevice:(id)a3 accountRegistry:(id)a4;
+ (id)logCategory;
+ (id)placeholderDeviceControllerWithIdentifier:(id)a3;
- (HMDDevice)device;
- (HMDDeviceController)initWithDevice:(id)a3 identifier:(id)a4;
- (HMDDeviceControllerDelegate)delegate;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateWithDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDDeviceController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDDeviceControllerDelegate *)WeakRetained;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  return [(NSUUID *)self->_identifier UUIDString];
}

- (HMDDevice)device
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_device;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDDeviceController *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDDeviceController *)self device];
  v8 = (void *)[v6 initWithName:@"Device" value:v7 options:1 formatter:0];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDDeviceController;
  [(HMDDeviceController *)&v4 dealloc];
}

- (HMDDeviceController)initWithDevice:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDeviceController;
  v9 = [(HMDDeviceController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_device, a3);
  }

  return v10;
}

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  uint64_t v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_142211 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_142211, &__block_literal_global_142212);
  }
  v2 = (void *)logCategory__hmf_once_v5_142213;
  return v2;
}

void __34__HMDDeviceController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_142213;
  logCategory__hmf_once_v5_142213 = v0;
}

+ (id)deviceControllerForDevice:(id)a3 accountRegistry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[__HMDDeviceController alloc] initWithDevice:v6 accountRegistry:v5];

  return v7;
}

uint64_t __46____HMDDeviceController___handleAddedAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  objc_super v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

+ (id)deviceControllerForDevice:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[HMDAccountRegistry sharedRegistry];
  uint64_t v5 = +[HMDDeviceController deviceControllerForDevice:v3 accountRegistry:v4];

  return v5;
}

+ (id)placeholderDeviceControllerWithIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_super v4 = [HMDDevice alloc];
    uint64_t v5 = [(HMDDevice *)v4 initWithIdentifier:v3 handles:MEMORY[0x263EFFA68] name:0 productInfo:0 version:0 capabilities:0];

    id v6 = +[HMDDeviceController deviceControllerForDevice:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)deviceControllerForCurrentDevice
{
  v2 = objc_alloc_init(__HMDCurrentDeviceController);
  return v2;
}

@end