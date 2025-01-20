@interface HMHome(TestingMatterExtensions)
- (id)hdm_createMatterController;
@end

@implementation HMHome(TestingMatterExtensions)

- (id)hdm_createMatterController
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [a1 matterControllerID];
  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
  {
    v3 = matterLogCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2519F3000, v3, OS_LOG_TYPE_DEFAULT, "hdm_createMatterController: Using new Matter XPC path", buf, 2u);
    }

    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];
    id v5 = objc_alloc(MEMORY[0x263F11008]);
    v6 = [a1 matterStartupParametersXPCConnectBlock];
    v7 = (void *)[v5 initWithXPConnectionBlock:v6 uniqueIdentifier:v4];

    id v14 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x263F10DB0]) initWithParameters:v7 error:&v14];
    id v9 = v14;
  }
  else
  {
    v12 = matterLogCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2519F3000, v12, OS_LOG_TYPE_DEFAULT, "hdm_createMatterController: Using old Matter XPC path", buf, 2u);
    }

    v13 = (void *)MEMORY[0x263F10DB0];
    v4 = [a1 matterControllerXPCConnectBlock];
    v8 = [v13 sharedControllerWithID:v2 xpcConnectBlock:v4];
    id v9 = 0;
  }

  if (!v8)
  {
    v10 = matterLogCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v16 = a1;
      __int16 v17 = 2112;
      v18 = v2;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl(&dword_2519F3000, v10, OS_LOG_TYPE_ERROR, "hdm_createMatterController: Failed to create MTRDeviceController for home (%@) matterControllerID: (%@): %@", buf, 0x20u);
    }
  }
  return v8;
}

@end