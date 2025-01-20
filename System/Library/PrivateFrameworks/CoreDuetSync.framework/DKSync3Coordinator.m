@interface DKSync3Coordinator
@end

@implementation DKSync3Coordinator

uint64_t __39___DKSync3Coordinator_initWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleContextChangedNotification:a2];
}

void __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F35140];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = &__141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke_2;
  v10[3] = &unk_2647DBB98;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v9 = v5;
  id v14 = v9;
  [v7 performAsyncBlock:v10];

  objc_destroyWeak(&v15);
}

void __128___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0;
  [v2 subscribeToContextValueChangeNotificationsWithRegistration:v3 deviceIDs:v4 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[7];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void __132___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0;
  [v2 unsubscribeFromContextValueChangeNotificationsWithRegistration:v3 deviceIDs:v4 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[7];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void __116___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToDeviceStatusChangeNotificationsForDeviceTypes_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  id v6 = 0;
  [v2 subscribeToDeviceStatusChangeNotificationsForDeviceTypes:v3 error:&v6];
  id v4 = v6;
  uint64_t v5 = a1[5];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

void __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F34FB8] syncChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(a1, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_1(a1, v5);
    }

    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
  }
}

void __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F34FB8] syncChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(a1, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_1(a1, v5);
  }
}

void __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_2;
  v3[3] = &unk_2647DBCA8;
  id v4 = *(id *)(a1 + 48);
  [v1 _fetchPropertiesOfRemoteKeyPaths:v2 handler:v3];
}

uint64_t __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke_2;
  v2[3] = &unk_2647DBCA8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _requestActivateDevicesWithHandler:v2];
}

uint64_t __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F34FB8] syncChannel];
  id v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_1();
  }
}

void __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke_2_cold_1(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, int a12, long long a13, __CFString *a14, long long a15, long long a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_18();
  a29 = v33;
  a30 = v34;
  OUTLINED_FUNCTION_19();
  a18 = *MEMORY[0x263EF8340];
  v35 = [(id)objc_opt_class() description];
  uint64_t v36 = *(void *)(v32 + 40);
  v37 = &stru_26DACFC30;
  if ([*(id *)(v32 + 48) me]) {
    v38 = @"pseudo ";
  }
  else {
    v38 = &stru_26DACFC30;
  }
  v39 = [*(id *)(v32 + 48) identifier];
  v40 = [*(id *)(v32 + 48) model];
  if (v40)
  {
    v41 = NSString;
    [*(id *)(v32 + 48) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_15();
    v37 = [v41 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_5();
  v42 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_20();
  *(void *)((char *)&a13 + 6) = v36;
  HIWORD(a13) = 2114;
  a14 = v38;
  LOWORD(a15) = 2114;
  *(void *)((char *)&a15 + 2) = v39;
  WORD5(a15) = 2114;
  *(void *)((char *)&a15 + 12) = v37;
  WORD2(a16) = v43;
  *(void *)((char *)&a16 + 6) = v44;
  _os_log_debug_impl(&dword_226CA5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: Callack sending context values for registration %@ to %{public}@peer %{public}@%{public}@ with key paths: %@", &buf, 0x3Eu);
  if (v40)
  {
  }
  OUTLINED_FUNCTION_16();
}

void __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v5 = [(id)objc_opt_class() description];
  id v6 = &stru_26DACFC30;
  [*(id *)(a1 + 40) me];
  id v7 = [*(id *)(a1 + 40) identifier];
  v8 = [*(id *)(a1 + 40) model];
  if (v8)
  {
    id v9 = NSString;
    [*(id *)(a1 + 40) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_12();
    id v6 = [v9 stringWithFormat:@" (%@)"];
  }
  v10 = [*(id *)(a1 + 48) identifier];
  id v11 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_226CA5000, v12, v13, "%{public}@: Failed to subscribe %{public}@peer %{public}@%{public}@ to context value change notifications with registration %{public}@: %{public}@:%lld (%@)", v14, v15, v16, v17, v18, v19, v20);

  if (v8)
  {
  }
}

void __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v5 = [(id)objc_opt_class() description];
  id v6 = &stru_26DACFC30;
  [*(id *)(a1 + 40) me];
  id v7 = [*(id *)(a1 + 40) identifier];
  v8 = [*(id *)(a1 + 40) model];
  if (v8)
  {
    id v9 = NSString;
    [*(id *)(a1 + 40) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_12();
    id v6 = [v9 stringWithFormat:@" (%@)"];
  }
  v10 = [*(id *)(a1 + 48) identifier];
  id v11 = [a2 domain];
  [a2 code];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_226CA5000, v12, v13, "%{public}@: Failed to unsubscribe %{public}@peer %{public}@%{public}@ from context value change notifications with registration %{public}@: %{public}@:%lld (%@)", v14, v15, v16, v17, v18, v19, v20);

  if (v8)
  {
  }
}

void __92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15, long long a16, long long a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_18();
  a30 = v31;
  a31 = v32;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  v38 = v37;
  a19 = *MEMORY[0x263EF8340];
  v39 = [(id)objc_opt_class() description];
  v40 = &stru_26DACFC30;
  if ([v38[6] me]) {
    v41 = @"pseudo ";
  }
  else {
    v41 = &stru_26DACFC30;
  }
  v42 = [v38[6] identifier];
  __int16 v43 = [v38[6] model];
  if (v43)
  {
    uint64_t v44 = NSString;
    [v38[6] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_12();
    v40 = [v44 stringWithFormat:@" (%@)"];
  }
  v45 = [v36 domain];
  uint64_t v46 = [v36 code];
  LODWORD(buf) = 138544898;
  *(void *)((char *)&buf + 4) = v39;
  WORD6(buf) = 2114;
  *(void *)((char *)&buf + 14) = v41;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(void *)((char *)&a16 + 2) = v40;
  WORD5(a16) = 2114;
  *(void *)((char *)&a16 + 12) = v45;
  WORD2(a17) = 2048;
  *(void *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v36;
  _os_log_error_impl(&dword_226CA5000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch properties of key paths from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", (uint8_t *)&buf, 0x48u);

  if (v43)
  {
  }
  OUTLINED_FUNCTION_16();
}

void __92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_cold_2(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, int a12, long long a13, void *a14, long long a15, long long a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_18();
  a29 = v32;
  a30 = v33;
  v35 = v34;
  OUTLINED_FUNCTION_19();
  a18 = *MEMORY[0x263EF8340];
  uint64_t v36 = [(id)objc_opt_class() description];
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31[5], "count"));
  v39 = &stru_26DACFC30;
  if ([v31[6] me]) {
    v40 = @"pseudo ";
  }
  else {
    v40 = &stru_26DACFC30;
  }
  v41 = [v31[6] identifier];
  v42 = [v31[6] model];
  if (v42)
  {
    __int16 v43 = NSString;
    [v31[6] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_12();
    v39 = [v43 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_20();
  *(void *)((char *)&a13 + 6) = v37;
  HIWORD(a13) = v44;
  a14 = v38;
  LOWORD(a15) = 2114;
  *(void *)((char *)&a15 + 2) = v40;
  WORD5(a15) = 2114;
  *(void *)((char *)&a15 + 12) = v41;
  WORD2(a16) = 2114;
  *(void *)((char *)&a16 + 6) = v39;
  _os_log_debug_impl(&dword_226CA5000, v35, OS_LOG_TYPE_DEBUG, "%{public}@: Successfullly fetched %@ of %@ properties of key paths from %{public}@peer %{public}@%{public}@", &buf, 0x3Eu);
  if (v42)
  {
  }
  OUTLINED_FUNCTION_16();
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_22() description];
  id v3 = &stru_26DACFC30;
  [*(id *)(v1 + 40) me];
  id v4 = [*(id *)(v1 + 40) identifier];
  uint64_t v5 = [*(id *)(v1 + 40) model];
  if (v5)
  {
    id v6 = NSString;
    [*(id *)(v1 + 40) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_15();
    id v3 = [v6 stringWithFormat:@" (%@)"];
  }
  id v7 = [*(id *)(v1 + 48) valueForKey:@"key"];
  OUTLINED_FUNCTION_5();
  v8 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11(&dword_226CA5000, v9, v10, "%{public}@: Successfully sent context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", v11, v12, v13, v14, v15, v16, 2u);

  if (v5)
  {
  }
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_19();
  id v3 = [(id)OUTLINED_FUNCTION_22() description];
  id v4 = &stru_26DACFC30;
  if ([*(id *)(v2 + 40) me]) {
    uint64_t v5 = @"pseudo ";
  }
  else {
    uint64_t v5 = &stru_26DACFC30;
  }
  id v6 = [*(id *)(v2 + 40) identifier];
  id v7 = [*(id *)(v2 + 40) model];
  if (v7)
  {
    v8 = NSString;
    [*(id *)(v2 + 40) model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_15();
    id v4 = [v8 stringWithFormat:@" (%@)"];
  }
  int v9 = [*(id *)(v2 + 48) valueForKey:@"key"];
  OUTLINED_FUNCTION_5();
  int v10 = _CDPrettyPrintCollection();
  *(_DWORD *)buf = 138544386;
  int v12 = v3;
  __int16 v13 = 2114;
  int v14 = v5;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_226CA5000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x34u);

  if (v7)
  {
  }
}

@end