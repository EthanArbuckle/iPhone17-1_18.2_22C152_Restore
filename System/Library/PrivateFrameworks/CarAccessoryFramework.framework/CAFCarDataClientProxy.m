@interface CAFCarDataClientProxy
@end

@implementation CAFCarDataClientProxy

void __34___CAFCarDataClientProxy_activate__block_invoke(uint64_t a1)
{
  v2 = CAFDataClientLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __34___CAFCarDataClientProxy_activate__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained carManager];
    [v5 _closeConnectionWithReason:@"XPC Interrupted"];

    v6 = [v4 carManager];
    [v6 _setupCafdConnectionIfAvailable];
  }
}

void __34___CAFCarDataClientProxy_activate__block_invoke_235(uint64_t a1)
{
  v2 = CAFDataClientLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __34___CAFCarDataClientProxy_activate__block_invoke_235_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained carManager];
  [v4 invalidate];
}

void __34___CAFCarDataClientProxy_activate__block_invoke_236(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = CAFDataClientLogging();
  BOOL v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __34___CAFCarDataClientProxy_activate__block_invoke_236_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34___CAFCarDataClientProxy_activate__block_invoke_237;
    v7[3] = &unk_265263280;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
  else if (v5)
  {
    __34___CAFCarDataClientProxy_activate__block_invoke_236_cold_1();
  }
}

void __34___CAFCarDataClientProxy_activate__block_invoke_237(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentCarConfig:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) carManager];
  [v2 _updateCar];
}

void __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke(uint64_t a1)
{
  id v2 = CAFDataClientLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setCurrentCarConfig:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) carManager];
  [v3 _updateCar];
}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) currentCarConfig];

  v4 = CAFDataClientLogging();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_2(v2, a1, v5);
    }

    BOOL v5 = [*(id *)(a1 + 32) currentCarConfig];
    [v5 updateConfiguration:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_1();
  }
}

void __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) carManager];
  id v3 = [v2 currentCar];

  if (v3)
  {
    [v3 didUpdatePluginID:*(void *)(a1 + 40) values:*(void *)(a1 + 48)];
  }
  else
  {
    v4 = CAFDataClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke_cold_1();
    }
  }
}

void __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) carManager];
  id v3 = [v2 currentCar];

  if (v3)
  {
    [v3 didNotifyPluginID:*(void *)(a1 + 40) instanceID:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];
  }
  else
  {
    v4 = CAFDataClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke_cold_1();
    }
  }
}

void __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) carManager];
  id v3 = [v2 currentCar];

  if (v3)
  {
    [v3 didRequestPluginID:*(void *)(a1 + 40) instanceID:*(void *)(a1 + 48) value:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64)];
  }
  else
  {
    v4 = CAFDataClientLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 64);
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __34___CAFCarDataClientProxy_activate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "connection interupted.", v2, v3, v4, v5, v6);
}

void __34___CAFCarDataClientProxy_activate__block_invoke_235_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "connection invalidated.", v2, v3, v4, v5, v6);
}

void __34___CAFCarDataClientProxy_activate__block_invoke_236_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_249710000, v0, v1, "No carConfig available", v2, v3, v4, v5, v6);
}

void __34___CAFCarDataClientProxy_activate__block_invoke_236_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "fetched carConfig %@", v2, v3, v4, v5, v6);
}

void __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(v1 + 32) currentCarConfig];
  OUTLINED_FUNCTION_9();
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_8_1(&dword_249710000, v0, v4, "didUpdateCurrentCarConfig from %@ to %@", v5);
}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Received configuration update, but current car does not exist.", v2, v3, v4, v5, v6);
}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 currentCarConfig];
  uint64_t v6 = [*(id *)(a2 + 40) count];
  int v8 = 138412546;
  v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_8_1(&dword_249710000, a3, v7, "didUpdateCarConfig %@ with plugins.count=%lu", (uint8_t *)&v8);
}

void __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Update characteristic values, but current car does not exist.", v2, v3, v4, v5, v6);
}

void __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Notification, but current car does not exist.", v2, v3, v4, v5, v6);
}

void __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Request, but current car does not exist.", v2, v3, v4, v5, v6);
}

@end