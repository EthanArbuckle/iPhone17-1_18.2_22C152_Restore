@interface GCControllerManagerServer
@end

@implementation GCControllerManagerServer

uint64_t __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupHIDMonitor:1];
}

uint64_t __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_signalGameControllerFocusModeEvent");
}

uint64_t __61___GCControllerManagerServer_deviceManager_deviceDidConnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerPhysicalDevice:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onqueue_refreshLogicalDevices");
}

uint64_t __64___GCControllerManagerServer_deviceManager_deviceDidDisconnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_unregisterPhysicalDevice:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onqueue_refreshLogicalDevices");
}

uint64_t __72___GCControllerManagerServer_refreshActiveConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __57___GCControllerManagerServer_refreshActiveConfigurations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
}

void __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 48), "DriverConnectionInvalidationRegistrationKey", 0, (void *)1);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke_2;
  block[3] = &unk_26D22A910;
  block[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
}

void __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 272) objectForKey:a1[5]];
  [v2 removeObject:a1[6]];
  if (![v2 count]) {
    [*(id *)(a1[4] + 272) removeObjectForKey:a1[5]];
  }
}

void __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 48), "FilterConnectionInvalidationRegistrationKey", 0, (void *)1);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke_2;
  block[3] = &unk_26D22A910;
  block[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
}

void __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 280) objectForKey:a1[5]];
  [v2 removeObject:a1[6]];
  if (![v2 count]) {
    [*(id *)(a1[4] + 280) removeObjectForKey:a1[5]];
  }
}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(NSObject **)(v7 + 16);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363;
    v11[3] = &unk_26D22A960;
    v11[4] = v7;
    id v12 = v5;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = a3;
    dispatch_async(v8, v11);
  }
  else
  {
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v10;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "#WARNING Connection %@ did not return a device registry ID.  Dropping.", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) invalidate];
  }
}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  v3 = [*(id *)(*(void *)(a1 + 32) + 256) member:*(void *)(a1 + 40)];
  id v4 = [*((id *)*(v2 - 1) + 33) objectForKey:v3];
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_12;
    }
    if (gc_isInternalBuild())
    {
      v17 = getGCLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363_cold_2(a1, (uint64_t)v4, v17);
      }
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 56) == 1)
    {
      if ([v4 acceptFilterConnection:v5 forHIDService:v3]) {
        goto LABEL_14;
      }
LABEL_12:
      if (!gc_isInternalBuild()) {
        goto LABEL_13;
      }
      uint64_t v7 = getGCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)v19 = 138412546;
        *(void *)&v19[4] = v16;
        *(_WORD *)&v19[12] = 2112;
        *(void *)&v19[14] = v4;
        uint64_t v10 = "Dropping incoming driver connection %@ because %@ rejected it.";
        v11 = v7;
        os_log_type_t v12 = OS_LOG_TYPE_INFO;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    if (([v4 acceptDriverConnection:v5 forHIDService:v3] & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    int isInternalBuild = gc_isInternalBuild();
    if (v3)
    {
      if (!isInternalBuild)
      {
LABEL_13:
        objc_msgSend(*(id *)(a1 + 48), "invalidate", *(_OWORD *)v19, *(void *)&v19[16]);
        goto LABEL_14;
      }
      uint64_t v7 = getGCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        *(_DWORD *)v19 = 138412546;
        *(void *)&v19[4] = v8;
        *(_WORD *)&v19[12] = 2112;
        *(void *)&v19[14] = v9;
        uint64_t v10 = "#WARNING Dropping incoming driver connection %@ because it is for an unclaimed HID service with registryID '%@'";
        v11 = v7;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_21:
        _os_log_impl(&dword_220998000, v11, v12, v10, v19, 0x16u);
      }
LABEL_22:

      goto LABEL_13;
    }
    if (isInternalBuild)
    {
      v18 = getGCLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363_cold_1(a1, v2, v18);
      }
    }
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 56) == 1) {
      objc_msgSend(v14, "_hidqueue_pushPendingFilterConnection:forRegistryID:", v13, v15);
    }
    else {
      objc_msgSend(v14, "_hidqueue_pushPendingDriverConnection:forRegistryID:", v13, v15);
    }
  }
LABEL_14:
}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*a2 unsignedLongLongValue];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_220998000, a3, OS_LOG_TYPE_DEBUG, "Stashing incoming driver connection %@ for unknown HID service with registryID '%#010llx'.", (uint8_t *)&v6, 0x16u);
}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_363_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_220998000, a2, a3, "Sending incoming driver connection %@ to %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

@end