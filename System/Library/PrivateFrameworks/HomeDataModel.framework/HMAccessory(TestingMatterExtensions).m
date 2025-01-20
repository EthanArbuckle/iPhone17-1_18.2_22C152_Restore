@interface HMAccessory(TestingMatterExtensions)
- (id)hdm_createDeviceWithController:()TestingMatterExtensions;
@end

@implementation HMAccessory(TestingMatterExtensions)

- (id)hdm_createDeviceWithController:()TestingMatterExtensions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 matterNodeID];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F10DA8];
    v7 = [a1 matterNodeID];
    v8 = [v6 deviceWithNodeID:v7 controller:v4];
  }
  else
  {
    v9 = matterLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      v12 = a1;
      _os_log_error_impl(&dword_2519F3000, v9, OS_LOG_TYPE_ERROR, "hdm_createDeviceWithController: Can't create MTRDevice for accessory (%@) because it doesn't have a node ID!", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

@end