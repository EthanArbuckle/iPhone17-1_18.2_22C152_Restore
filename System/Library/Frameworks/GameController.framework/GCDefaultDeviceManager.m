@interface GCDefaultDeviceManager
@end

@implementation GCDefaultDeviceManager

void __62___GCDefaultDeviceManager_refreshPhysicalDeviceConfiguration___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v3 = [a1[4] object];
    v4 = [v13[5] allValues];
    int v5 = [v4 containsObject:v3];

    if (v5)
    {
      v6 = [a1[5] configurationIdentifierForDevice:v3];
      v7 = [a1[5] deviceRegistry];
      v8 = [v7 deviceConfigurationRegistry];
      [v8 removeConfigurationWithIdentifier:v6];

      v9 = [a1[5] deviceRegistry];
      v10 = [v9 deviceConfigurationRegistry];
      [v10 refreshActiveConfigurations];

      objc_msgSend(a1[5], "_onqueue_registerDefaultConfigurationForDevice:replaceExisting:", v3, 1);
      v11 = [a1[5] deviceRegistry];
      v12 = [v11 deviceConfigurationRegistry];
      [v12 refreshActiveConfigurations];
    }
    WeakRetained = v13;
  }
}

void __43___GCDefaultDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = [v2 deviceManager:*(void *)(a1 + 32) physicalDeviceForHIDDevice:*(void *)(a1 + 40)];
    v3 = [(_GCDefaultPhysicalDevice *)v7 manager];
    v4 = *(void **)(a1 + 32);

    if (v3 != v4)
    {
      v6 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32));
    }
    int v5 = v7;
  }
  else
  {
    int v5 = [[_GCDefaultPhysicalDevice alloc] initWithHIDDevice:*(void *)(a1 + 40) manager:*(void *)(a1 + 32)];
  }
  v8 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerPhysicalDevice:serviceInfo:checkForDuplicateDevice:", v5, *(void *)(a1 + 40), 1);
}

void __56___GCDefaultDeviceManager__onqueue_relinquishHIDDevice___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v8 = a3;
  v9 = [*(id *)(a1 + 32) identifier];
  v10 = [v8 identifier];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
}

uint64_t __48___GCDefaultDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_relinquishHIDDevice:", *(void *)(a1 + 40));
}

void __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  char v3 = objc_opt_respondsToSelector();
  int isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      int v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1();
      }
    }
    [v2 setDriverConnection:*(void *)(a1 + 48)];
  }
  else
  {
    if (isInternalBuild)
    {
      v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = 138412546;
        uint64_t v9 = v7;
        __int16 v10 = 2112;
        int v11 = v2;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", (uint8_t *)&v8, 0x16u);
      }
    }
    [*(id *)(a1 + 48) invalidate];
  }
}

void __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  char v3 = objc_opt_respondsToSelector();
  int isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      int v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1();
      }
    }
    [v2 setFilterConnection:*(void *)(a1 + 48)];
  }
  else
  {
    if (isInternalBuild)
    {
      v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = 138412546;
        uint64_t v9 = v7;
        __int16 v10 = 2112;
        int v11 = v2;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", (uint8_t *)&v8, 0x16u);
      }
    }
    [*(id *)(a1 + 48) invalidate];
  }
}

void __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "Passing driver connection %@ to device %@.");
}

void __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "Passing filter connection %@ to device %@.");
}

@end