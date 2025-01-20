@interface GCGenericDeviceManager
@end

@implementation GCGenericDeviceManager

uint64_t __45___GCGenericDeviceManager_setDeviceRegistry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onioqueue_setupHIDMatching");
}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  v2 = [[_GCGenericPhysicalDevicePending alloc] initWithHIDService:*(void *)(a1 + 32) manager:*(void *)(a1 + 40)];
  v3 = _gc_log_generic_device();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    v16 = v2;
    _os_log_impl(&dword_20AD04000, v3, OS_LOG_TYPE_INFO, "%@: Adding %@", buf, 0x16u);
  }

  v5 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKey:*(void *)(a1 + 32)];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  [*(id *)(*(void *)(a1 + 40) + 48) setObject:v2 forKey:*(void *)(a1 + 32)];
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v7 = [(_GCGenericPhysicalDevicePending *)v2 device];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __43___GCGenericDeviceManager_claimHIDService___block_invoke_28;
  v10[3] = &unk_26BEC3CF8;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = *(id *)(a1 + 32);
  [v7 observeSuccessOnQueue:v8 withBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = _gc_log_generic_device();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      _os_log_impl(&dword_20AD04000, v5, OS_LOG_TYPE_INFO, "%@: Prepared %@", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    id v19 = 0;
    id v6 = WeakRetained[7];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = __43___GCGenericDeviceManager_claimHIDService___block_invoke_29;
    v13 = &unk_26BEC3CD0;
    id v7 = v3;
    id v14 = v7;
    __int16 v15 = buf;
    [v6 enumerateKeysAndObjectsWithOptions:0 usingBlock:&v10];
    uint64_t v8 = *(void **)(*(void *)&buf[8] + 40);
    if (v8) {
      -[_GCGenericDeviceManager _onqueue_relinquishHIDService:]((uint64_t)WeakRetained, v8);
    }

    _Block_object_dispose(buf, 8);
    objc_msgSend(WeakRetained[7], "setObject:forKey:", v7, *(void *)(a1 + 32), v10, v11, v12, v13);
    [WeakRetained[6] removeObjectForKey:*(void *)(a1 + 32)];
    objc_msgSend(WeakRetained, "_onqueue_registerDefaultConfigurationForDevice:", v7);
    v9 = [WeakRetained deviceRegistry];
    [v9 deviceManager:WeakRetained deviceDidConnect:v7];
  }
}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke_29(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  v10 = [v8 identifier];
  uint64_t v11 = [v9 identifier];

  LODWORD(v9) = [v10 isEqual:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __48___GCGenericDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = _gc_log_generic_device();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(v2);
    }

    [v3 setDriverConnection:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(v2, v2 + 1, v5);
    }

    [*(id *)(a1 + 48) invalidate];
  }
}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (v3)
  {
    char v4 = objc_opt_respondsToSelector();
    v5 = _gc_log_generic_device();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(a1);
      }

      [v3 setFilterConnection:*(void *)(a1 + 48)];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        id v14 = v3;
        _os_log_impl(&dword_20AD04000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", buf, 0x16u);
      }

      [*(id *)(a1 + 48) invalidate];
    }
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  if (v8)
  {
    id v9 = _gc_log_generic_device();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(v2);
    }

    [v8 setFilterConnection:*(void *)(a1 + 48)];
  }
  else if (!v3)
  {
    v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"_GCGenericDeviceManager.m", 304, @"No device for %@", *(void *)(a1 + 40) object file lineNumber description];

    [*(id *)(a1 + 48) invalidate];
  }
}

void __54___GCGenericDeviceManager__onioqueue_setupHIDMatching__block_invoke(uint64_t a1)
{
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "%@: No device for %@", (uint8_t *)&v5, 0x16u);
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Passing driver connection to device %@.", (void)v3, DWORD2(v3));
}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Passing filter connection to device %@.", (void)v3, DWORD2(v3));
}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 48);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "Passing filter connection %@ to device %@.", (void)v3, DWORD2(v3));
}

@end