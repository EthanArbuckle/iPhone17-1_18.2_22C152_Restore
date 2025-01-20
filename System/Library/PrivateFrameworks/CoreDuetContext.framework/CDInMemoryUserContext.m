@interface CDInMemoryUserContext
@end

@implementation CDInMemoryUserContext

uint64_t __55___CDInMemoryUserContext_contextForDeviceWithDeviceID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "unsafe_contextForDeviceWithDeviceID:", *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

void __72___CDInMemoryUserContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v25;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v5 = 0;
      uint64_t v18 = v3;
      do
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v24 + 1) + 8 * v5);
        if ([v6 evaluatePredicate:*(void *)(a1 + 40)])
        {
          v7 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v8 = *(id *)(a1 + 48);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
                v14 = [v6 objectForKeyedSubscript:v13];
                if (v14) {
                  [v7 setObject:v14 forKeyedSubscript:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }

          v15 = *(void **)(a1 + 56);
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
          [v15 addObject:v16];

          uint64_t v4 = v17;
          uint64_t v3 = v18;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v3);
  }
}

void __36___CDInMemoryUserContext_allDevices__block_invoke(uint64_t a1)
{
  id v3 = +[_CDDevice localDevice];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDevices");
  if ([v2 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v2];
  }
}

void __38___CDInMemoryUserContext_allDeviceIDs__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(a1 + 40) + 40)];
  objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDeviceIDs");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 count]) {
    [*(id *)(a1 + 32) unionSet:v2];
  }
}

uint64_t __41___CDInMemoryUserContext_remoteDeviceIDs__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "unsafe_remoteDeviceIDs");
  return MEMORY[0x1F41817F8]();
}

void __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1(a1, v2);
  }

  id v3 = objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDevicesByDeviceIDForRemoteUserContextProxySourceDeviceUUID:", *(void *)(a1 + 48));
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v5 = [v3 allKeys];
  v6 = [v4 setWithArray:v5];

  v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = [v3 allValues];
  uint64_t v9 = [v7 setWithArray:v8];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v51)
  {
    uint64_t v11 = *(void *)v61;
    *(void *)&long long v10 = 138412290;
    long long v44 = v10;
    uint64_t v48 = a1;
    v49 = v3;
    v46 = v9;
    v47 = v6;
    uint64_t v45 = *(void *)v61;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v60 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "deviceID", v44);
        [v6 addObject:v14];
        [v9 addObject:v13];
        v15 = [v3 objectForKeyedSubscript:v14];
        v55 = (void *)v14;
        v16 = objc_msgSend(*(id *)(a1 + 40), "unsafe_contextForDeviceWithDeviceID:", v14);
        v52 = v15;
        uint64_t v53 = v12;
        if (!v15)
        {
          log = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (!os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)v65 = v55;
          long long v20 = log;
          long long v21 = "Activating new device %{public}@ in memory";
          goto LABEL_41;
        }
        int v17 = [v15 isCompanion];
        int v18 = [v13 isCompanion];
        log = [MEMORY[0x1E4F5B418] mdcsChannel];
        BOOL v19 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
        if (v17 != v18)
        {
          if (!v19)
          {
LABEL_13:

            [v16 setDevice:v13];
            long long v22 = objc_msgSend(*(id *)(a1 + 40), "unsafe_multiDeviceRegistrations");
            long long v23 = [v22 mutableCopy];

            [v23 addObjectsFromArray:*(void *)(*(void *)(a1 + 40) + 24)];
            log = v23;
            uint64_t v24 = [v23 count];
            long long v25 = [MEMORY[0x1E4F5B418] mdcsChannel];
            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v26)
              {
                int v36 = [log count];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v65 = v36;
                *(_WORD *)&v65[4] = 2112;
                *(void *)&v65[6] = v55;
                _os_log_debug_impl(&dword_18EC9B000, v25, OS_LOG_TYPE_DEBUG, "Possibly registering %d existing multi-device registrations with device %@ in memory", buf, 0x12u);
              }

              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v25 = log;
              uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v66 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v57;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v57 != v29) {
                      objc_enumerationMutation(v25);
                    }
                    v31 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                    int v32 = objc_msgSend(v13, "matchesDeviceTypes:", objc_msgSend(v31, "deviceTypes"));
                    v33 = [MEMORY[0x1E4F5B418] mdcsChannel];
                    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
                    if (v32)
                    {
                      if (v34)
                      {
                        *(_DWORD *)buf = 138543618;
                        *(void *)v65 = v55;
                        *(_WORD *)&v65[8] = 2112;
                        *(void *)&v65[10] = v31;
                        _os_log_debug_impl(&dword_18EC9B000, v33, OS_LOG_TYPE_DEBUG, "Registering existing multi-device registration with device %{public}@ in memory: %@", buf, 0x16u);
                      }

                      [v16 registerCallback:v31];
                    }
                    else
                    {
                      if (v34)
                      {
                        *(_DWORD *)buf = 138543618;
                        *(void *)v65 = v55;
                        *(_WORD *)&v65[8] = 2112;
                        *(void *)&v65[10] = v31;
                        _os_log_debug_impl(&dword_18EC9B000, v33, OS_LOG_TYPE_DEBUG, "Skipping existing multi-device registration because device type does not match for device %{public}@ in memory: %@", buf, 0x16u);
                      }
                    }
                  }
                  uint64_t v28 = [v25 countByEnumeratingWithState:&v56 objects:v66 count:16];
                }
                while (v28);
                a1 = v48;
                id v3 = v49;
                uint64_t v9 = v46;
                v6 = v47;
                uint64_t v11 = v45;
              }
              uint64_t v35 = v53;
            }
            else
            {
              uint64_t v35 = v53;
              if (v26)
              {
                *(_DWORD *)buf = v44;
                *(void *)v65 = v55;
                _os_log_debug_impl(&dword_18EC9B000, v25, OS_LOG_TYPE_DEBUG, "No existing multi-device registrations to register with device %@ in memory", buf, 0xCu);
              }
            }

            goto LABEL_38;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)v65 = v55;
          long long v20 = log;
          long long v21 = "Activating existing device %{public}@ in memory";
LABEL_41:
          _os_log_debug_impl(&dword_18EC9B000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
          goto LABEL_13;
        }
        if (v19)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v65 = v55;
          _os_log_debug_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEBUG, "No need to activate already-active device %{public}@ in memory", buf, 0xCu);
        }
        uint64_t v35 = v53;
LABEL_38:

        uint64_t v12 = v35 + 1;
      }
      while (v12 != v51);
      uint64_t v37 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
      uint64_t v51 = v37;
    }
    while (v37);
  }

  uint64_t v38 = [v3 count];
  if (v38 != [v6 count])
  {
    v39 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 40) + 40)];
    v40 = +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:*(void *)(a1 + 48)];
    v41 = (void *)[v6 copy];
    [v39 setObject:v41 forKeyedSubscript:v40];

    v42 = +[_CDContextQueries keyPathForMDCSDevicesWithProxySourceDeviceUUID:*(void *)(a1 + 48)];
    v43 = (void *)[v9 copy];
    [v39 setObject:v43 forKeyedSubscript:v42];
  }
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_2(a1);
  }

  if (!*(void *)(a1 + 40))
  {
    id v3 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_1(a1, v3);
    }

    [*(id *)(*(void *)(a1 + 56) + 24) addObject:*(void *)(a1 + 48)];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138543618;
    long long v22 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        uint64_t v11 = *(void **)(a1 + 40);
        if (!v11 || [v11 containsObject:*(void *)(*((void *)&v23 + 1) + 8 * v9)])
        {
          uint64_t v12 = objc_msgSend(*(id *)(a1 + 56), "deviceWithDeviceID:fromDevices:", v10, *(void *)(a1 + 64), v22, (void)v23);
          if (objc_msgSend(v12, "matchesDeviceTypes:", objc_msgSend(*(id *)(a1 + 48), "deviceTypes")))
          {
            uint64_t v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v19 = *(void *)(a1 + 48);
              *(_DWORD *)buf = v22;
              uint64_t v28 = v10;
              __int16 v29 = 2112;
              uint64_t v30 = v19;
              _os_log_debug_impl(&dword_18EC9B000, v13, OS_LOG_TYPE_DEBUG, "Registering multi-device registration callback with device %{public}@: %@", buf, 0x16u);
            }

            uint64_t v14 = objc_msgSend(*(id *)(a1 + 56), "unsafe_contextForDeviceWithDeviceID:", v10);
            [v14 registerCallback:*(void *)(a1 + 48)];
            goto LABEL_22;
          }
          uint64_t v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v15)
            {
              uint64_t v16 = *(void *)(a1 + 48);
              *(_DWORD *)buf = v22;
              uint64_t v28 = v10;
              __int16 v29 = 2112;
              uint64_t v30 = v16;
              int v17 = v14;
              int v18 = "Not registering non-matching multi-device registration callback with device %{public}@: %@";
              goto LABEL_26;
            }
          }
          else if (v15)
          {
            uint64_t v20 = *(void *)(a1 + 48);
            *(_DWORD *)buf = v22;
            uint64_t v28 = v10;
            __int16 v29 = 2112;
            uint64_t v30 = v20;
            int v17 = v14;
            int v18 = "Not registering multi-device registration callback with unknown device %{public}@: %@";
LABEL_26:
            _os_log_debug_impl(&dword_18EC9B000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);
          }
LABEL_22:
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v21 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      uint64_t v7 = v21;
    }
    while (v21);
  }
}

void __45___CDInMemoryUserContext_deregisterCallback___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45___CDInMemoryUserContext_deregisterCallback___block_invoke_cold_1(a1);
  }

  [*(id *)(*(void *)(a1 + 56) + 24) removeObject:*(void *)(a1 + 48)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v22;
    *(void *)&long long v5 = 138543618;
    long long v20 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 56), "deviceWithDeviceID:fromDevices:", v9, *(void *)(a1 + 64), v20, (void)v21);
        if (objc_msgSend(v10, "matchesDeviceTypes:", objc_msgSend(*(id *)(a1 + 48), "deviceTypes")))
        {
          uint64_t v11 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = *(void *)(a1 + 48);
            *(_DWORD *)buf = v20;
            uint64_t v26 = v9;
            __int16 v27 = 2112;
            uint64_t v28 = v17;
            _os_log_debug_impl(&dword_18EC9B000, v11, OS_LOG_TYPE_DEBUG, "Deregistering multi-device registration callback with device %{public}@: %@", buf, 0x16u);
          }

          uint64_t v12 = objc_msgSend(*(id *)(a1 + 56), "unsafe_contextForDeviceWithDeviceID:", v9);
          [v12 deregisterCallback:*(void *)(a1 + 48)];
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F5B418] mdcsChannel];
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
          if (v10)
          {
            if (!v13) {
              goto LABEL_16;
            }
            uint64_t v14 = *(void *)(a1 + 48);
            *(_DWORD *)buf = v20;
            uint64_t v26 = v9;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            BOOL v15 = v12;
            uint64_t v16 = "Not de-registering non-matching multi-device registration callback with device %{public}@: %@";
          }
          else
          {
            if (!v13) {
              goto LABEL_16;
            }
            uint64_t v18 = *(void *)(a1 + 48);
            *(_DWORD *)buf = v20;
            uint64_t v26 = v9;
            __int16 v27 = 2112;
            uint64_t v28 = v18;
            BOOL v15 = v12;
            uint64_t v16 = "Not de-registering multi-device registration callback with unknown device %{public}@: %@";
          }
          _os_log_debug_impl(&dword_18EC9B000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x16u);
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }
}

uint64_t __53___CDInMemoryUserContext_hasMultiDeviceRegistrations__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "unsafe_hasMultiDeviceRegistrations");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __37___CDInMemoryUserContext_description__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendFormat:@"User Context: %@", *(void *)(*(void *)(a1 + 40) + 32)];
  id v2 = *(void **)(*(void *)(a1 + 40) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37___CDInMemoryUserContext_description__block_invoke_2;
  v3[3] = &unk_1E5609668;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __37___CDInMemoryUserContext_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\nDevice %@ context: %@", a2, a3];
}

void __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = [*(id *)(a1 + 32) count];
  id v4 = _CDPrettyPrintCollection();
  v5[0] = 67109378;
  v5[1] = v3;
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_DEBUG, "Activating %d devices in memory: %{public}@", (uint8_t *)v5, 0x12u);
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_DEBUG, "Pending all device multi-device registration callback: %@", (uint8_t *)&v3, 0xCu);
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_2(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_18EC9B000, v2, v3, "Registering with up to %d devices (%d named) multi-device registration callback: %@", v4, v5, v6, v7, v8);
}

void __45___CDInMemoryUserContext_deregisterCallback___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  [*(id *)(a1 + 40) count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_18EC9B000, v2, v3, "Possibly deregistering multi-device registration callback with %d (%d named) devices: %@", v4, v5, v6, v7, v8);
}

@end