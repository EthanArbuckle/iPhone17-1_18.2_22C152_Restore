@interface GCNintendoJoyConDeviceManager
@end

@implementation GCNintendoJoyConDeviceManager

void __61___GCNintendoJoyConDeviceManager_device_fusionGestureActive___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v3 = [*(id *)(a1 + 32) fusionDevice];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 leftDevice];
      v6 = *(void **)(a1 + 32);
      if (v5 == v6)
      {
        v24 = *(void **)(*(void *)(a1 + 40) + 56);
        v1 = [v4 rightDevice];
        v25 = [v24 member:v1];
        if (v25)
        {

LABEL_29:
          if (gc_isInternalBuild())
          {
            v36 = getGCLogger();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              int v38 = 138412290;
              id v39 = v4;
              _os_log_impl(&dword_220998000, v36, OS_LOG_TYPE_INFO, "Unfusing (via gesture): %@", (uint8_t *)&v38, 0xCu);
            }
          }
          v5 = [v4 configuration];
          if ([v5 isTransient])
          {
            v29 = [*(id *)(a1 + 40) deviceRegistry];
            v30 = [v29 deviceConfigurationRegistry];
            v31 = [v5 identifier];
            [v30 removeConfigurationWithIdentifier:v31];
          }
          else
          {
            v29 = (void *)[v5 mutableCopy];
            [v29 setPriority:0];
            v30 = [*(id *)(a1 + 40) deviceRegistry];
            v31 = [v30 deviceConfigurationRegistry];
            [v31 updateConfiguration:v29];
          }

          v32 = [*(id *)(a1 + 40) deviceRegistry];
          v33 = [v32 deviceConfigurationRegistry];
          [v33 refreshActiveConfigurationsWithCompletion:0];

LABEL_36:
          goto LABEL_37;
        }
      }
      v7 = [v4 rightDevice];
      v8 = v7;
      if (v7 == *(void **)(a1 + 32))
      {
        v26 = *(void **)(*(void *)(a1 + 40) + 56);
        v27 = [v4 leftDevice];
        v28 = [v26 member:v27];

        if (v5 == v6) {
        if (v28)
        }
          goto LABEL_29;
LABEL_23:
        [*(id *)(*(void *)(a1 + 40) + 56) addObject:*(void *)(a1 + 32)];
LABEL_37:

        return;
      }

      if (v5 == v6) {
    }
      }
    else
    {
      v5 = [*(id *)(*(void *)(a1 + 40) + 56) anyObject];
      if (v5
        && ([*(id *)(a1 + 32) type] == 1 && objc_msgSend(v5, "type") == 2
         || [*(id *)(a1 + 32) type] == 2 && objc_msgSend(v5, "type") == 1))
      {
        int v11 = [*(id *)(a1 + 32) type];
        v12 = v5;
        if (v11 == 1) {
          v12 = *(void **)(a1 + 32);
        }
        id v13 = v12;
        int v14 = [*(id *)(a1 + 32) type];
        v15 = v5;
        if (v14 == 2) {
          v15 = *(void **)(a1 + 32);
        }
        id v16 = v15;
        if (gc_isInternalBuild())
        {
          v37 = getGCLogger();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            int v38 = 138412546;
            id v39 = v13;
            __int16 v40 = 2112;
            id v41 = v16;
            _os_log_impl(&dword_220998000, v37, OS_LOG_TYPE_INFO, "Fusing (via gesture).  Left: %@.  Right: %@", (uint8_t *)&v38, 0x16u);
          }
        }
        v17 = +[_GCNintendoFusedJoyConDevice identifierForFusedJoyConDeviceWithLeftDevice:v13 rightDevice:v16];
        v18 = [*(id *)(a1 + 40) deviceRegistry];
        v19 = [v18 deviceConfigurationRegistry];
        v20 = [v19 configurationWithIdentifier:v17];

        if (v20)
        {
          v21 = (void *)[v20 mutableCopy];
          [v21 setPriority:20];
          v22 = [*(id *)(a1 + 40) deviceRegistry];
          v23 = [v22 deviceConfigurationRegistry];
          [v23 updateConfiguration:v21];
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "_onqueue_registerFusionConfigurationWithLeftDevice:rightDevice:", v13, v16);
        }
        v34 = [*(id *)(a1 + 40) deviceRegistry];
        v35 = [v34 deviceConfigurationRegistry];
        [v35 refreshActiveConfigurationsWithCompletion:0];

        goto LABEL_36;
      }
    }

    goto LABEL_23;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(*(void *)(a1 + 40) + 56);

  [v10 removeObject:v9];
}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  v2 = [[_GCNintendoJoyConDevicePending alloc] initWithHIDService:*(void *)(a1 + 32) manager:*(void *)(a1 + 40)];
  if (gc_isInternalBuild())
  {
    v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v8;
      __int16 v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "%@: Adding %@", location, 0x16u);
    }
  }
  v3 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:*(void *)(a1 + 32)];
  BOOL v4 = v3 == 0;

  if (!v4)
  {
    uint64_t v9 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  [*(id *)(*(void *)(a1 + 40) + 32) setObject:v2 forKey:*(void *)(a1 + 32)];
  objc_initWeak((id *)location, *(id *)(a1 + 40));
  v5 = [(_GCNintendoJoyConDevicePending *)v2 device];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_155;
  v10[3] = &unk_26D22B5C8;
  objc_copyWeak(&v12, (id *)location);
  id v11 = *(id *)(a1 + 32);
  [v5 observeSuccessOnQueue:v6 withBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "%@: Prepared %@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    id v5 = WeakRetained[5];
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_156;
    id v12 = &unk_26D22B5A0;
    id v6 = v3;
    id v13 = v6;
    __int16 v14 = buf;
    [v5 enumerateKeysAndObjectsWithOptions:0 usingBlock:&v9];
    if (*(void *)(*(void *)&buf[8] + 40)) {
      objc_msgSend(WeakRetained, "_onqueue_relinquishHIDService:", v9, v10, v11, v12);
    }

    _Block_object_dispose(buf, 8);
    [WeakRetained[5] setObject:v6 forKey:*(void *)(a1 + 32)];
    [WeakRetained[4] removeObjectForKey:*(void *)(a1 + 32)];
    objc_msgSend(WeakRetained, "_onqueue_registerDefaultConfigurationsForDevice:", v6);
    v7 = [WeakRetained deviceRegistry];
    [v7 deviceManager:WeakRetained deviceDidConnect:v6];
  }
}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_156(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  uint64_t v10 = [v8 identifier];
  id v11 = [v9 identifier];

  LODWORD(v9) = [v10 isEqual:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __55___GCNintendoJoyConDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_relinquishHIDService:", *(void *)(a1 + 40));
}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  int isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      id v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(v2);
      }
    }
    [v3 setDriverConnection:*(void *)(a1 + 48)];
  }
  else
  {
    if (isInternalBuild)
    {
      id v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(v2, v2 + 1, v5);
      }
    }
    [*(id *)(a1 + 48) invalidate];
  }
}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  if (v3)
  {
    char v4 = objc_opt_respondsToSelector();
    int isInternalBuild = gc_isInternalBuild();
    if (v4)
    {
      if (isInternalBuild)
      {
        id v9 = getGCLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(a1);
        }
      }
      [v3 setFilterConnection:*(void *)(a1 + 48)];
    }
    else
    {
      if (isInternalBuild)
      {
        uint64_t v10 = getGCLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          uint64_t v13 = v11;
          __int16 v14 = 2112;
          v15 = v3;
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 48) invalidate];
    }
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(v2);
      }
    }
    [v6 setFilterConnection:*(void *)(a1 + 48)];
  }
  else if (!v3)
  {
    v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"_GCNintendoJoyConDeviceManager.m", 456, @"No device for %@", *(void *)(a1 + 40) object file lineNumber description];

    [*(id *)(a1 + 48) invalidate];
  }
}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "%@: No device for %@", (uint8_t *)&v5, 0x16u);
}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v1, v2, "%@: Passing driver connection to device %@.", (void)v3, DWORD2(v3));
}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v1, v2, "%@: Passing filter connection to device %@.", (void)v3, DWORD2(v3));
}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 48);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v1, v2, "Passing filter connection %@ to device %@.", (void)v3, DWORD2(v3));
}

@end