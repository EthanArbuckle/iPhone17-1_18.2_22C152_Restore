@interface GCControllerManager
@end

@implementation GCControllerManager

void __38___GCControllerManager_sharedInstance__block_invoke()
{
  currentProcessIsGameControllerDaemon();
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = v0;
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __IOHIDServiceClient *a4)
{
  v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18.opaque[0] = 0;
    v18.opaque[1] = 0;
    v8 = _os_activity_create(&dword_220998000, "HID Service Removed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v18);
    v9 = objc_loadWeakRetained(v6);
    v10 = v9;
    if (v9 && *(void *)(a1 + 40) == v9[5])
    {
      v11 = IOHIDServiceClientGetRegistryID(a4);
      if (gc_isInternalBuild())
      {
        v15 = getGCLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = objc_msgSend(v11, "unsignedLongLongValue", v18.opaque[0], v18.opaque[1]);
          *(_DWORD *)buf = 134217984;
          uint64_t v20 = v16;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "HID Service Removed: registryID='%#010llx'", buf, 0xCu);
        }
      }
      v12 = (void *)[objc_alloc((Class)&off_26D2AD0D0) initWithService:a4 queue:v10[2]];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 registryID];

        if (v14)
        {
          [v10 onHIDServiceRemoved:v13];
          objc_msgSend(v10, "_legacy_removeControllerWithServiceInfo:", v13);

          os_activity_scope_leave(&v18);
LABEL_11:

          goto LABEL_12;
        }
      }
      if (gc_isInternalBuild())
      {
        v17 = getGCLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = (uint64_t)a4;
          _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "#WARNING Ignoring removed IOHIDService because it returned an invalid registryID:\n%@", buf, 0xCu);
        }
      }
    }

    goto LABEL_11;
  }
LABEL_12:
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, __IOHIDServiceClient *a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 48) == WeakRetained[5])
  {
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    v8 = _os_activity_create(&dword_220998000, "HID Service Added", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v16);
    v9 = IOHIDServiceClientGetRegistryID(a4);
    if (gc_isInternalBuild())
    {
      v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend(v9, "unsignedLongLongValue", v16.opaque[0], v16.opaque[1]);
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = v14;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "HID Service Added: registryID='%#010llx'", buf, 0xCu);
      }
    }
    v10 = (void *)[objc_alloc((Class)&off_26D2AD0D0) initWithService:a4 queue:v7[2]];
    v11 = v10;
    if (v10
      && ([v10 registryID], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      IOHIDServiceClientRegisterRemovalBlock();
      [v7 onHIDServiceAdded:v11];
      objc_msgSend(v7, "_legacy_addControllerWithServiceInfo:", v11);

      os_activity_scope_leave(&v16);
    }
    else
    {
      if (gc_isInternalBuild())
      {
        v15 = getGCLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = (uint64_t)a4;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "#WARNING Ignoring added IOHIDService because it returned an invalid registryID:\n%@", buf, 0xCu);
        }
      }
    }
  }
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_128(uint64_t a1)
{
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_2(uint64_t a1)
{
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFArrayRef v3 = v2;
  uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __43___GCControllerManager_teardownHIDMonitor___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  __dmb(0xBu);
}

uint64_t __60___GCControllerManager_Legacy___legacy_startHIDEventMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_legacy_updateControllerWithEvent:", a2);
}

void __58___GCControllerManager_Legacy___legacy_publishController___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = +[GCAnalytics instance];
  [v2 publishController:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setCurrentController:*(void *)(a1 + 32)];
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) productCategory];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      long long v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "posting GCControllerDidConnectNotification for %@ controller: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  CFArrayRef v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCControllerDidConnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __60___GCControllerManager_Legacy___legacy_unpublishController___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = +[GCAnalytics instance];
  [v2 unpublishController:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) updateCurrentControllerAndProfileForUnpublishedController:*(void *)(a1 + 32)];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCControllerDidDisconnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __46___GCControllerManager_Legacy__addController___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [v2 deviceHash]);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 96) objectForKey:v3];
  uint64_t v5 = v4;
  if (!v4)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v14 = getGCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 96);
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "existing controller does not exist: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if ([v2 isATVRemote]) {
      uint64_t v6 = [v2 isForwarded];
    }
    else {
      uint64_t v6 = 1;
    }
    long long v8 = [v2 physicalInputProfile];
    if ([v8 conformsToProtocol:&unk_26D294150])
    {
      __int16 v9 = [v2 physicalInputProfile];
      uint64_t v10 = [v9 deviceType];

      if (v10 != 5)
      {
LABEL_17:
        [*(id *)(a1 + 40) storeController:v2];
        int v7 = v2;
        goto LABEL_18;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = v2;
      long long v8 = *(void **)(v11 + 136);
      *(void *)(v11 + 136) = v12;
      uint64_t v6 = 1;
    }

    goto LABEL_17;
  }
  if ([v4 isATVRemote] && objc_msgSend(v2, "isATVRemote"))
  {
    uint64_t v6 = [*(id *)(a1 + 40) combineSiriRemoteHIDDevicesWithNewController:v2 existingController:v5];
  }
  else if ([v2 isForwarded])
  {
    uint64_t v6 = 0;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 96) setObject:v2 forKey:v3];
    uint64_t v6 = 1;
  }
  int v7 = v5;
LABEL_18:
  id v13 = v7;

  [v13 setAllHIDDevicesConnected:v6];
  objc_msgSend(*(id *)(a1 + 40), "_legacy_publishController:", v13);
}

uint64_t __60___GCControllerManager_Legacy__removeController_registryID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeController:registryID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __51___GCControllerManager_Legacy___legacy_controllers__block_invoke(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 areAllHIDDevicesConnected]) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v2;
}

void __53___GCControllerManager_Legacy__isExistingController___block_invoke(uint64_t a1)
{
  +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) deviceHash]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "objectForKey:");
  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

@end