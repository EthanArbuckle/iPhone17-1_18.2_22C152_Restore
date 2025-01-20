@interface EXHostViewControllerSession
@end

@implementation EXHostViewControllerSession

void __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke_2;
  v3[3] = &unk_2642583F0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 resumeWithReadyNotification:v3];
}

uint64_t __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __41___EXHostViewControllerSession_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_prepareToHost");
}

void __53___EXHostViewControllerSession_processDidInvalidate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) extensionProcess];
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    id v5 = [*(id *)(a1 + 32) extensionProcess];
    v6 = [v5 launchConfiguration];
    v7 = [v6 extensionIdentity];
    v8 = [v7 localizedName];
    v9 = [*(id *)(a1 + 32) extensionProcess];
    v10 = objc_msgSend(v4, "_EX_processExitedErrorWithName:pid:", v8, objc_msgSend(v9, "pid"));
    [*(id *)(a1 + 32) setError:v10];

    v11 = *(void **)(a1 + 32);
    [v11 setState:5];
  }
}

uint64_t __53___EXHostViewControllerSession_processDidInvalidate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50___EXHostViewControllerSession__invalidateSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_cold_1();
  }

  [v3 _invalidateSession];
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_139(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _EXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_139_cold_1();
  }
}

id __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_143(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_2(uint64_t a1, void *a2)
{
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  v9 = *v6;
  void *v6 = v8;
}

uint64_t __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_148(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sceneEndpoint];
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 40);

      if (v3)
      {
        [*(id *)(a1 + 48) setSceneSessionConnection:*(void *)(a1 + 40)];
        [*(id *)(a1 + 48) setExtensionProcess:*(void *)(a1 + 32)];
        id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sceneEndpoint];
        [*(id *)(a1 + 48) setRemoteViewControllerEndpoint:v4];

LABEL_8:
        id v5 = *(void **)(a1 + 48);
        return [v5 setState:2];
      }
    }
    if (*(void *)(a1 + 32) && [*(id *)(a1 + 48) requiresFBSceneHosting])
    {
      [*(id *)(a1 + 48) setExtensionProcess:*(void *)(a1 + 32)];
      goto LABEL_8;
    }
  }
  v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_148_cold_1();
  }

  [*(id *)(a1 + 48) setError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  return [*(id *)(a1 + 48) setState:5];
}

uint64_t __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke()
{
  return 0;
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v7 = _EXDefaultLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_156_cold_2();
    }

    id v10 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    [v10 setRemoteViewController:v5];
    uint64_t v11 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_156_cold_1();
    }

    v12 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    [v12 setError:v6];
    uint64_t v11 = 5;
  }
  [*v9 setState:v11];
}

uint64_t __67___EXHostViewControllerSession_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldAcceptXPCConnection:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "Internal connection '%@' invalidated.", v2, v3, v4, v5, v6);
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_139_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "Internal connection '%@' interupted.", v2, v3, v4, v5, v6);
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2156DD000, v0, v1, "Failed to get extension process and XPC endpoints with error: %{public}@", v2, v3, v4, v5, v6);
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_156_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2156DD000, v0, v1, "Remote viewcontroller request failed: %{public}@", v2, v3, v4, v5, v6);
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_156_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_2156DD000, v0, v1, "Received remote viewcontroller: %{public}@", v2, v3, v4, v5, v6);
}

@end