@interface GCDefaultPhysicalDevice
@end

@implementation GCDefaultPhysicalDevice

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_3;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3FE8 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 23, a2);
    }
    else if (gc_isInternalBuild())
    {
      v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412802;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Game Intent Service' on connection %@: %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  int8x16_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3EC8 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v6)
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_8;
      }
      uint64_t v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v13;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        id v22 = v7;
        uint64_t v11 = v12;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Light Service' on connection %@: %@", buf, 0x20u);
      }
      else
      {
        uint64_t v11 = v12;
      }
      goto LABEL_6;
    }
    v10 = WeakRetained + 20;
    objc_storeStrong((id *)WeakRetained + 20, a2);
    if (v9[5] && *v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_248;
      block[3] = &unk_26D22A8C0;
      uint64_t v16 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      uint64_t v11 = v16;
LABEL_6:
    }
  }
LABEL_8:
}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_249(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_251;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3F28 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_251(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v6)
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_8;
      }
      uint64_t v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v13;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        id v22 = v7;
        uint64_t v11 = v12;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Adaptive Triggers Service' on connection %@: %@", buf, 0x20u);
      }
      else
      {
        uint64_t v11 = v12;
      }
      goto LABEL_6;
    }
    v10 = WeakRetained + 19;
    objc_storeStrong((id *)WeakRetained + 19, a2);
    if (v9[6] && *v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_252;
      block[3] = &unk_26D22A8C0;
      uint64_t v16 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      uint64_t v11 = v16;
LABEL_6:
    }
  }
LABEL_8:
}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_253(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_255;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3F88 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_255(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 21, a2);
    }
    else if (gc_isInternalBuild())
    {
      v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412802;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Motion Service' on connection %@: %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_256(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_258;
  v6[3] = &unk_26D22B6E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectToDeviceService:&unk_26D2B3E08 withClient:v3 reply:v6];

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_258(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v10 = WeakRetained + 22;
      objc_storeStrong((id *)WeakRetained + 22, a2);
      if (v9[11] && *v10)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_259;
        block[3] = &unk_26D22A8C0;
        __int16 v15 = v9;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      [v9 createPowerSource];
    }
    else if (gc_isInternalBuild())
    {
      uint64_t v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Battery Service' on connection %@: %@", buf, 0x20u);
      }
    }
  }
}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 88) + 16))();
}

void __75___GCDefaultPhysicalDevice_Motion__setDeviceMotionServiceConnectedHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[8] + 16))();
    WeakRetained = v2;
  }
}

intptr_t __49___GCDefaultPhysicalDevice_Motion__sensorsActive__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73___GCDefaultPhysicalDevice_Light__setDeviceLightServiceConnectedHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[5] + 16))();
    WeakRetained = v2;
  }
}

void __40___GCDefaultPhysicalDevice_Light__light__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __95___GCDefaultPhysicalDevice_AdaptiveTriggers__setDeviceAdaptiveTriggersServiceConnectedHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[6] + 16))();
    WeakRetained = v2;
  }
}

void __61___GCDefaultPhysicalDevice_AdaptiveTriggers__triggerStatuses__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __158___GCDefaultPhysicalDevice_AdaptiveTriggersClient__updateAdaptiveTriggerStatusWithLeftMode_leftStatus_leftArmPosition_rightMode_rightStatus_rightArmPosition___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = [[GCDeviceAdaptiveTriggersStatusPayload alloc] initFeedbackWithStatus:*(unsigned __int8 *)(a1 + 40) armPosition:*(unsigned __int8 *)(a1 + 41) mode:*(unsigned __int8 *)(a1 + 42)];
    v9[0] = v3;
    id v4 = [[GCDeviceAdaptiveTriggersStatusPayload alloc] initFeedbackWithStatus:*(unsigned __int8 *)(a1 + 43) armPosition:*(unsigned __int8 *)(a1 + 44) mode:*(unsigned __int8 *)(a1 + 45)];
    v9[1] = v4;
    int8x16_t v5 = +[NSArray arrayWithObjects:v9 count:2];

    if (gc_isInternalBuild())
    {
      id v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v5;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "Updating adaptive trigger status from plugin... %@", (uint8_t *)&v7, 0xCu);
      }
    }
    (*(void (**)(void))(WeakRetained[7] + 16))();
  }
}

void __77___GCDefaultPhysicalDevice_Battery__setDeviceBatteryServiceConnectedHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[11] + 16))();
    WeakRetained = v2;
  }
}

void __44___GCDefaultPhysicalDevice_Battery__battery__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  WeakRetained = (CFMutableDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    CFDictionarySetValue(WeakRetained[10], @"Is Charging", +[NSNumber numberWithBool:a3]);
    CFDictionarySetValue(v6[10], @"Max Capacity", &unk_26D286840);
    CFDictionarySetValue(v6[10], @"Current Capacity", +[NSNumber numberWithUnsignedChar:a2]);
    if (IOPSSetPowerSourceDetails())
    {
      if (gc_isInternalBuild())
      {
        int v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke_cold_1();
        }
      }
    }
  }
}

void __68___GCDefaultPhysicalDevice_BatteryClient__updateBattery_isCharging___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = [[GCDeviceBattery alloc] initWithLevel:*(unsigned __int8 *)(a1 + 40) isCharging:*(unsigned __int8 *)(a1 + 41)];
    if (gc_isInternalBuild())
    {
      id v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = 138412290;
        id v6 = v3;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Updating battery from plugin... %@", (uint8_t *)&v5, 0xCu);
      }
    }
    (*(void (**)(void))(WeakRetained[12] + 16))();
  }
}

void __73___GCDefaultPhysicalDevice_GameIntentClient__triggerGameIntentWithEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      id v3 = getGCLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        int v5 = 134217984;
        uint64_t v6 = v4;
        _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "triggerGameIntentWithEvent %ld", (uint8_t *)&v5, 0xCu);
      }
    }
    (*(void (**)(void))(WeakRetained[14] + 16))();
  }
}

void __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_16(&dword_220998000, v0, v1, "Failed to set game controller power source details: %{mach.errno}d", v2, v3, v4, v5, v6);
}

@end