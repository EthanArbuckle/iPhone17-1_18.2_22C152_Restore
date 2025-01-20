@interface CDUserContextService
@end

@implementation CDUserContextService

void __55___CDUserContextService_sharedInstanceWithPersistence___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.coreduetd.context"];
  v2 = [[_CDUserContextService alloc] initWithListener:v4 withPersistence:*(void *)(a1 + 32) withStorage:0 withStore:0];
  v3 = (void *)sharedInstanceWithPersistence__service;
  sharedInstanceWithPersistence__service = (uint64_t)v2;
}

void __61___CDUserContextService_sharedInstanceWithSharedMemoryStore___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.coreduetd.context"];
  v2 = [[_CDUserContextService alloc] initWithListener:v4 withPersistence:0 withStorage:0 withStore:*(void *)(a1 + 32)];
  v3 = (void *)sharedInstanceWithSharedMemoryStore__service;
  sharedInstanceWithSharedMemoryStore__service = (uint64_t)v2;
}

void __45___CDUserContextService_addOpenRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = *(id *)(*(void *)(a1 + 32) + 56);
    objc_sync_enter(v7);
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:WeakRetained];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKeyedSubscript:v9];
    objc_sync_exit(v7);

    id v8 = *(id *)(*(void *)(a1 + 32) + 48);
    objc_sync_enter(v8);
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:WeakRetained];
    objc_sync_exit(v8);

    [*(id *)(a1 + 32) informClientOfFiredRegistration:WeakRetained info:v5];
  }
}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F5B418] contextChannel];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_1(a1);
  }
}

uint64_t __40___CDUserContextService_regenerateState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setContextValue:a3 forContextualKeyPath:a2];
}

void __40___CDUserContextService_regenerateState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v8 = *(id *)(*(void *)(a1 + 32) + 56);
    objc_sync_enter(v8);
    id v9 = *(void **)(*(void *)(a1 + 32) + 56);
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v9 addObject:v10];

    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKeyedSubscript:v16];
    objc_sync_exit(v8);

    id v11 = *(id *)(*(void *)(a1 + 32) + 48);
    objc_sync_enter(v11);
    v12 = *(void **)(*(void *)(a1 + 32) + 48);
    id v13 = objc_loadWeakRetained((id *)(a1 + 40));
    [v12 removeObject:v13];

    objc_sync_exit(v11);
    v14 = *(void **)(a1 + 32);
    id v15 = objc_loadWeakRetained(v6);
    [v14 informClientOfFiredRegistration:v15 info:v5];
  }
}

uint64_t __60___CDUserContextService_listener_shouldAcceptNewConnection___block_invoke()
{
  NSSelectorFromString(&cfstr_Doesimplementu.isa);
  uint64_t result = objc_opt_respondsToSelector();
  listener_shouldAcceptNewConnection__isUnitTests = result & 1;
  return result;
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F5B418] contextChannel];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_2();
    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_1();
  }

  uint64_t v9 = +[_CDXPCCodecs parseProxySourceDeviceUUIDEvent:v5 error:0];
  if (v9)
  {
    id v8 = (void *)v9;
    id v10 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v8 UUIDString];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_INFO, "CDUserContext: received proxy source device uuid: %@", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setProxySourceDeviceUUID:forUserID:", v8, objc_msgSend(*(id *)(a1 + 40), "uid"));
    goto LABEL_10;
  }
LABEL_11:
}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v2 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)(a1 + 6), v2);
    }

    uint64_t v3 = a1[4];
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_38(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:a1[4]];
  if (++*(void *)(*(void *)(a1[8] + 8) + 24) == a1[10])
  {
    uint64_t v2 = a1[5];
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
    uint64_t v3 = *(void *)(a1[7] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1[9] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  id v7 = (os_unfair_lock_s *)(*(void *)(a1[6] + 8) + 32);
  os_unfair_lock_unlock(v7);
}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F5B418] contextChannel];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v2, v3, "CDUserContext: sent event for registration %@.", v4, v5, v6, v7, v8);
}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "CDUserContext: failed to send event: %@", v2, v3, v4, v5, v6);
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_DEBUG, "CDUserContext: handling fetch proxy source device uuid reply", v1, 2u);
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "CDUserContext: failed to send event to fetch proxy source device uuid: %@", v2, v3, v4, v5, v6);
}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 64) - objc_msgSend(*(id *)(*(void *)(*(void *)a2 + 8) + 40), "count"));
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18EC9B000, a3, OS_LOG_TYPE_ERROR, "CDUserContext: Failed to get %@ proxy source device UUIDs", v5, 0xCu);
}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_DEBUG, "CDUserContext: handling request activate devices reply", v1, 2u);
}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "CDUserContext: failed to send event to request activate devices: %@", v2, v3, v4, v5, v6);
}

@end