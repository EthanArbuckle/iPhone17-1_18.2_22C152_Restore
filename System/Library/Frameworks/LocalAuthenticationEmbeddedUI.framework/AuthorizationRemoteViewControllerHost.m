@interface AuthorizationRemoteViewControllerHost
@end

@implementation AuthorizationRemoteViewControllerHost

LARemoteViewControllerParameters *__85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke()
{
  v0 = objc_alloc_init(LARemoteViewControllerParameters);
  [(LARemoteViewControllerParameters *)v0 setServiceBundleIdentifier:@"com.apple.CoreAuthUI"];
  [(LARemoteViewControllerParameters *)v0 setServiceViewControllerClassName:@"AuthorizationRemoteViewController"];

  return v0;
}

void __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 timeIntervalSinceNow];
  double v9 = v8;
  v10 = LA_LOG_0();
  if (v9 >= -1.0) {
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v11 = LALogTypeForInternalError();
  }
  if (os_log_type_enabled(v10, v11))
  {
    int v12 = 134217984;
    double v13 = -v9;
    _os_log_impl(&dword_23F450000, v10, v11, "RemoteUI call took %.2f secs", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __59___AuthorizationRemoteViewControllerHost_exportedInterface__block_invoke()
{
  exportedInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F339A40];

  return MEMORY[0x270F9A758]();
}

uint64_t __72___AuthorizationRemoteViewControllerHost_serviceViewControllerInterface__block_invoke()
{
  serviceViewControllerInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F339AD0];

  return MEMORY[0x270F9A758]();
}

void __71___AuthorizationRemoteViewControllerHost_startWithConfiguration_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LA_LOG_0();
  os_log_type_t v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_23F450000, v4, v5, "Could not obtain service proxy for starting (%{public}@).", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___AuthorizationRemoteViewControllerHost_stopWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LA_LOG_0();
  os_log_type_t v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_23F450000, v4, v5, "Could not obtain service proxy for stoping (%{public}@).", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end