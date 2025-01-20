@interface DKBluetoothMonitor
@end

@implementation DKBluetoothMonitor

uint64_t __28___DKBluetoothMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCurrentBatteryLevels];
}

void __28___DKBluetoothMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = [v3 object];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v7 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28___DKBluetoothMonitor_start__block_invoke_3;
  v9[3] = &unk_2647147D8;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v6, v7, v9);
}

void __28___DKBluetoothMonitor_start__block_invoke_3(uint64_t a1)
{
  v45[1] = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 224) lock];
  v2 = *(void **)(*(void *)(a1 + 32) + 168);
  id v3 = [*(id *)(a1 + 40) address];
  v4 = [v2 valueForKey:v3];

  if (v4)
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 224);
    [v5 unlock];
  }
  else
  {
    if ([*(id *)(a1 + 40) isAppleAudioDevice])
    {
      [*(id *)(a1 + 32) updateCurrentBatteryLevels];
      uint64_t v6 = [*(id *)(a1 + 32) batteryLevels];
      v7 = *(NSObject **)(*(void *)(a1 + 32) + 208);
      dispatch_time_t v8 = dispatch_walltime(0, 300000000000);
      dispatch_source_set_timer(v7, v8, 0x45D964B800uLL, 0x64uLL);
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v9 = [*(id *)(a1 + 32) _inEarStatusForDevice:*(void *)(a1 + 40)];
    uint64_t v10 = [*(id *)(a1 + 40) connected];
    v11 = [*(id *)(a1 + 40) name];
    v12 = [*(id *)(a1 + 40) address];
    uint64_t v13 = [*(id *)(a1 + 40) type];
    uint64_t v14 = [*(id *)(a1 + 40) isAppleAudioDevice];
    v44 = (void *)v6;
    LODWORD(v41) = [*(id *)(a1 + 40) productId];
    unsigned int v43 = v9;
    v15 = +[_DKBluetoothMonitor _eventWithState:v10 name:v11 address:v12 type:v13 isAppleAudioDevice:v14 isUserWearing:v9 productID:v41 accessoryBatteryLevels:v6];

    v16 = *(void **)(*(void *)(a1 + 32) + 176);
    v17 = [*(id *)(a1 + 40) address];
    v18 = [v16 objectForKeyedSubscript:v17];

    if (v18)
    {
      v19 = [*(id *)(a1 + 32) historicalHandler];

      if (v19)
      {
        v20 = [v15 startDate];
        [v18 setEndDate:v20];

        v21 = [*(id *)(a1 + 32) historicalHandler];
        v45[0] = v18;
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
        ((void (**)(void, void *))v21)[2](v21, v22);

        v23 = *(void **)(*(void *)(a1 + 32) + 176);
        v24 = [*(id *)(a1 + 40) address];
        [v23 removeObjectForKey:v24];
      }
    }
    v25 = *(void **)(*(void *)(a1 + 32) + 168);
    v26 = [*(id *)(a1 + 40) address];
    [v25 setObject:v15 forKey:v26];

    v27 = *(void **)(*(void *)(a1 + 32) + 184);
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "vendorId"));
    v29 = [*(id *)(a1 + 40) address];
    [v27 setObject:v28 forKey:v29];

    v30 = objc_opt_class();
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "vendorId"));
    v32 = [v30 _BMEventFromDKEvent:v15 starting:1 vendorID:v31];

    [*(id *)(*(void *)(a1 + 32) + 144) sendEvent:v32];
    [*(id *)(a1 + 32) saveState];
    [*(id *)(*(void *)(a1 + 32) + 224) unlock];
    uint64_t v33 = [*(id *)(a1 + 40) connected];
    v34 = [*(id *)(a1 + 40) name];
    v35 = [*(id *)(a1 + 40) address];
    uint64_t v36 = [*(id *)(a1 + 40) type];
    uint64_t v37 = [*(id *)(a1 + 40) isAppleAudioDevice];
    LODWORD(v42) = [*(id *)(a1 + 40) productId];
    v38 = +[_DKBluetoothMonitor contextValueForBluetoothConnectionStatus:v33 name:v34 address:v35 deviceType:v36 isAppleAudioDevice:v37 isUserWearing:v43 productID:v42];

    v39 = [MEMORY[0x263F351B8] userContext];
    v40 = [MEMORY[0x263F351D0] keyPathForBluetoothDataDictionary];
    [v39 setObject:v38 forKeyedSubscript:v40];
  }
}

void __28___DKBluetoothMonitor_start__block_invoke_4(uint64_t a1, void *a2)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v47 = (void *)os_transaction_create();
  v4 = [v3 object];

  v46 = v4;
  v5 = [v4 objectForKeyedSubscript:@"device"];
  [*(id *)(a1 + 32) updateCurrentBatteryLevels];
  uint64_t v6 = [*(id *)(a1 + 32) batteryLevels];
  uint64_t v7 = [*(id *)(a1 + 32) _inEarStatusForDevice:v5];
  uint64_t v8 = [v5 connected];
  uint64_t v9 = [v5 name];
  uint64_t v10 = [v5 address];
  uint64_t v11 = [v5 type];
  uint64_t v12 = [v5 isAppleAudioDevice];
  v45 = (void *)v6;
  LODWORD(v43) = [v5 productId];
  v44 = +[_DKBluetoothMonitor _eventWithState:v8 name:v9 address:v10 type:v11 isAppleAudioDevice:v12 isUserWearing:v7 productID:v43 accessoryBatteryLevels:v6];

  [*(id *)(*(void *)(a1 + 32) + 224) lock];
  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v14 = [v5 address];
  v15 = [v13 objectForKeyedSubscript:v14];

  v16 = [v15 metadata];
  v17 = [MEMORY[0x263F35048] isUserWearing];
  uint64_t v18 = [v16 valueForKey:v17];
  v48 = v15;
  if (!v18)
  {

    goto LABEL_8;
  }
  v19 = (void *)v18;
  v20 = [v15 metadata];
  v21 = [MEMORY[0x263F35048] isUserWearing];
  v22 = [v20 valueForKey:v21];
  v23 = [NSNumber numberWithBool:v7];
  int v24 = [v22 isEqual:v23];

  if (v24)
  {
LABEL_8:
    [*(id *)(*(void *)(a1 + 32) + 224) unlock];
    v25 = v44;
    goto LABEL_9;
  }
  v25 = v44;
  if (v48)
  {
    v26 = [*(id *)(a1 + 32) historicalHandler];

    if (v26)
    {
      v27 = [v44 startDate];
      [v48 setEndDate:v27];

      v28 = objc_opt_class();
      v29 = *(void **)(*(void *)(a1 + 32) + 184);
      v30 = [v5 address];
      v31 = [v29 objectForKeyedSubscript:v30];
      v32 = [v28 _BMEventFromDKEvent:v48 starting:0 vendorID:v31];

      [*(id *)(*(void *)(a1 + 32) + 144) sendEvent:v32];
      uint64_t v33 = [*(id *)(a1 + 32) historicalHandler];
      v49[0] = v48;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
      ((void (**)(void, void *))v33)[2](v33, v34);
    }
  }
  v35 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v36 = [v5 address];
  [v35 setObject:v44 forKey:v36];

  uint64_t v37 = *(void **)(*(void *)(a1 + 32) + 184);
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "vendorId"));
  v39 = [v5 address];
  [v37 setObject:v38 forKey:v39];

  v40 = objc_opt_class();
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "vendorId"));
  uint64_t v42 = [v40 _BMEventFromDKEvent:v44 starting:1 vendorID:v41];

  [*(id *)(*(void *)(a1 + 32) + 144) sendEvent:v42];
  [*(id *)(a1 + 32) saveState];
  [*(id *)(*(void *)(a1 + 32) + 224) unlock];

LABEL_9:
}

void __28___DKBluetoothMonitor_start__block_invoke_5(uint64_t a1, void *a2)
{
  v44[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = [v3 object];

  [*(id *)(*(void *)(a1 + 32) + 224) lock];
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 176);
  uint64_t v7 = [v5 address];
  uint64_t v8 = [v6 valueForKey:v7];

  uint64_t v9 = *(id **)(a1 + 32);
  if (v8)
  {
    [v9[28] unlock];
  }
  else
  {
    uint64_t v43 = v4;
    uint64_t v10 = [v9 batteryLevels];
    uint64_t v11 = [v5 name];
    uint64_t v12 = [v5 address];
    uint64_t v13 = [v5 type];
    uint64_t v14 = [v5 isAppleAudioDevice];
    LODWORD(v41) = [v5 productId];
    v15 = +[_DKBluetoothMonitor _eventWithState:0 name:v11 address:v12 type:v13 isAppleAudioDevice:v14 isUserWearing:0 productID:v41 accessoryBatteryLevels:v10];

    v16 = *(void **)(*(void *)(a1 + 32) + 168);
    v17 = [v5 address];
    uint64_t v18 = [v16 objectForKeyedSubscript:v17];

    if (v18)
    {
      v19 = [*(id *)(a1 + 32) historicalHandler];

      if (v19)
      {
        v20 = [v15 startDate];
        [v18 setEndDate:v20];

        v21 = objc_opt_class();
        v22 = *(void **)(*(void *)(a1 + 32) + 184);
        v23 = [v5 address];
        int v24 = [v22 objectForKeyedSubscript:v23];
        v25 = [v21 _BMEventFromDKEvent:v18 starting:0 vendorID:v24];

        [*(id *)(*(void *)(a1 + 32) + 144) sendEvent:v25];
        v26 = [*(id *)(a1 + 32) historicalHandler];
        v44[0] = v18;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
        ((void (**)(void, void *))v26)[2](v26, v27);

        v28 = *(void **)(*(void *)(a1 + 32) + 168);
        v29 = [v5 address];
        [v28 removeObjectForKey:v29];

        v30 = *(void **)(*(void *)(a1 + 32) + 184);
        v31 = [v5 address];
        [v30 removeObjectForKey:v31];
      }
    }
    v32 = *(void **)(*(void *)(a1 + 32) + 176);
    uint64_t v33 = [v5 address];
    [v32 setObject:v15 forKey:v33];

    if ([v5 isAppleAudioDevice]
      && ![*(id *)(*(void *)(a1 + 32) + 168) count])
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 208), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      [*(id *)(a1 + 32) setBatteryLevels:MEMORY[0x263EFFA78]];
    }
    [*(id *)(a1 + 32) saveState];
    [*(id *)(*(void *)(a1 + 32) + 224) unlock];
    v34 = [v5 name];
    v35 = [v5 address];
    uint64_t v36 = [v5 type];
    uint64_t v37 = [v5 isAppleAudioDevice];
    LODWORD(v42) = [v5 productId];
    v38 = +[_DKBluetoothMonitor contextValueForBluetoothConnectionStatus:0 name:v34 address:v35 deviceType:v36 isAppleAudioDevice:v37 isUserWearing:0 productID:v42];

    v39 = [MEMORY[0x263F351B8] userContext];
    v40 = [MEMORY[0x263F351D0] keyPathForBluetoothDataDictionary];
    [v39 setObject:v38 forKeyedSubscript:v40];

    v4 = v43;
  }
}

uint64_t __26___DKBluetoothMonitor_log__block_invoke()
{
  log_log_2 = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKBluetoothMonitor");
  return MEMORY[0x270F9A758]();
}

void __32___DKBluetoothMonitor_saveState__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F34FD0] sharedInstance];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v17 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v17];
  id v5 = v17;
  if (v5)
  {
    uint64_t v6 = +[_DKBluetoothMonitor log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32___DKBluetoothMonitor_saveState__block_invoke_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = a1 + 32;
  uint64_t v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v2 setData:v4 forKey:v15];

  v16 = +[_DKBluetoothMonitor log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __32___DKBluetoothMonitor_saveState__block_invoke_cold_1(v13, v16);
  }
}

void __32___DKBluetoothMonitor_loadState__block_invoke(uint64_t a1)
{
  v87[2] = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A629AA0]();
  v63 = [MEMORY[0x263F34FD0] sharedInstance];
  v1 = (objc_class *)objc_opt_class();
  v2 = NSStringFromClass(v1);
  v64 = [v63 dataForKey:v2];

  if (v64)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [*(id *)(a1 + 32) classesForSecureStateDecoding];
    uint64_t v11 = [v9 setByAddingObjectsFromSet:v10];

    id v78 = 0;
    uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v11 fromData:v64 error:&v78];
    id v13 = v78;
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v12;

    if (v13)
    {
      v16 = +[_DKBluetoothMonitor log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __32___DKBluetoothMonitor_loadState__block_invoke_cold_1((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  uint64_t v23 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(v23 + 8) + 40))
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    int v24 = [*(id *)(*(void *)(v23 + 8) + 40) allKeys];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v74 objects:v85 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v75 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v74 + 1) + 8 * i);
          v29 = +[_DKBluetoothMonitor log];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v28];
            *(_DWORD *)buf = 138412546;
            uint64_t v82 = v28;
            __int16 v83 = 2112;
            v84 = v30;
            _os_log_impl(&dword_225002000, v29, OS_LOG_TYPE_INFO, "savedState key: %@ value: %@", buf, 0x16u);
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v74 objects:v85 count:16];
      }
      while (v25);
    }

    v31 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"_DKBluetoothMonitor-activeConnections"];

    if (v31)
    {
      uint64_t v32 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"_DKBluetoothMonitor-activeConnections"];
      uint64_t v33 = *(void *)(a1 + 32);
      v34 = *(void **)(v33 + 168);
      *(void *)(v33 + 168) = v32;

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v35 = [*(id *)(*(void *)(a1 + 32) + 168) allKeys];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v71 != v37) {
              objc_enumerationMutation(v35);
            }
            uint64_t v39 = *(void *)(*((void *)&v70 + 1) + 8 * j);
            v40 = +[_DKBluetoothMonitor log];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              uint64_t v41 = [*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:v39];
              *(_DWORD *)buf = 138412546;
              uint64_t v82 = v39;
              __int16 v83 = 2112;
              v84 = v41;
              _os_log_impl(&dword_225002000, v40, OS_LOG_TYPE_INFO, "load key: %@ value: %@", buf, 0x16u);
            }
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v70 objects:v80 count:16];
        }
        while (v36);
      }
    }
    else
    {
      v35 = +[_DKBluetoothMonitor log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225002000, v35, OS_LOG_TYPE_INFO, "No active connections to load", buf, 2u);
      }
    }

    v52 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"_DKBluetoothMonitor-inactiveConnections"];

    if (v52)
    {
      uint64_t v53 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"_DKBluetoothMonitor-inactiveConnections"];
      uint64_t v54 = *(void *)(a1 + 32);
      v55 = *(void **)(v54 + 176);
      *(void *)(v54 + 176) = v53;

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v51 = [*(id *)(*(void *)(a1 + 32) + 176) allKeys];
      uint64_t v56 = [v51 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v67 != v57) {
              objc_enumerationMutation(v51);
            }
            uint64_t v59 = *(void *)(*((void *)&v66 + 1) + 8 * k);
            v60 = +[_DKBluetoothMonitor log];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              v61 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:v59];
              *(_DWORD *)buf = 138412546;
              uint64_t v82 = v59;
              __int16 v83 = 2112;
              v84 = v61;
              _os_log_impl(&dword_225002000, v60, OS_LOG_TYPE_INFO, "load key: %@ value: %@", buf, 0x16u);
            }
          }
          uint64_t v56 = [v51 countByEnumeratingWithState:&v66 objects:v79 count:16];
        }
        while (v56);
      }
    }
    else
    {
      v51 = +[_DKBluetoothMonitor log];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225002000, v51, OS_LOG_TYPE_INFO, "No inactive connections to load", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v42 = +[_DKBluetoothMonitor log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v42, OS_LOG_TYPE_INFO, "saved state is nil", buf, 2u);
    }

    uint64_t v43 = NSDictionary;
    uint64_t v44 = [MEMORY[0x263EFF9A0] dictionary];
    v87[0] = v44;
    v45 = [MEMORY[0x263EFF9A0] dictionary];
    v87[1] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    v86[0] = @"_DKBluetoothMonitor-activeConnections";
    v86[1] = @"_DKBluetoothMonitor-inactiveConnections";
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    uint64_t v48 = [v43 dictionaryWithObjects:v46 forKeys:v47];
    uint64_t v49 = *(void *)(*(void *)(a1 + 40) + 8);
    v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;

    v51 = v44;
  }
}

uint64_t __48___DKBluetoothMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleUnpairingEvent:*(void *)(a1 + 40)];
}

BOOL __44___DKBluetoothMonitor_handleUnpairingEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 address];
  if ([v4 isEqualToString:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v3 address];
    BOOL v6 = v7 == 0;
  }
  return v6;
}

void __32___DKBluetoothMonitor_saveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 136446466;
  uint64_t v5 = "-[_DKBluetoothMonitor saveState]_block_invoke";
  __int16 v6 = 2114;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "%{public}s did _CDSharedMemoryKeyValueStore for %{public}@.", (uint8_t *)&v4, 0x16u);
}

void __32___DKBluetoothMonitor_saveState__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __32___DKBluetoothMonitor_loadState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end