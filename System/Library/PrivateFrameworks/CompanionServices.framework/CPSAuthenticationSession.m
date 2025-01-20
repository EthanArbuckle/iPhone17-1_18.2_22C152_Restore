@interface CPSAuthenticationSession
- (CPSAuthenticationRequest)request;
- (CPSAuthenticationSession)initWithRequest:(id)a3;
- (id)deviceAcceptedNotificationHandler;
- (id)deviceStartedAuthenticationHandler;
- (id)sessionCompletionHandler;
- (id)sessionFailedHandler;
- (id)sessionFinishedHandler;
- (void)_activated;
- (void)_deviceStartedAuthentication:(uint64_t)a1;
- (void)_deviceTappedNotification:(uint64_t)a1;
- (void)_invalidated;
- (void)_sessionFailedWithError:(uint64_t)a1;
- (void)_sessionFinishedWithResponse:(uint64_t)a1;
- (void)authenticationSessionDeviceStartedAuthentication:(id)a3;
- (void)authenticationSessionDeviceTappedNotification:(id)a3;
- (void)authenticationSessionDidFailWithError:(id)a3;
- (void)authenticationSessionDidFinishWithResponse:(id)a3;
- (void)cancel;
- (void)setDeviceAcceptedNotificationHandler:(id)a3;
- (void)setDeviceStartedAuthenticationHandler:(id)a3;
- (void)setSessionCompletionHandler:(id)a3;
- (void)setSessionFailedHandler:(id)a3;
- (void)setSessionFinishedHandler:(id)a3;
- (void)start;
@end

@implementation CPSAuthenticationSession

- (CPSAuthenticationSession)initWithRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v13.receiver = self;
    v13.super_class = (Class)CPSAuthenticationSession;
    v8 = [(CPSAuthenticationSession *)&v13 init];
    if (v8)
    {
      uint64_t Serial = BSDispatchQueueCreateSerial();
      dispatchQueue = v8->_dispatchQueue;
      v8->_dispatchQueue = (OS_dispatch_queue *)Serial;

      objc_storeStrong((id *)&v8->_request, a3);
    }

    return v8;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"request != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(CPSAuthenticationSession *)a2 initWithRequest:(uint64_t)v12];
    }
    [v12 UTF8String];
    result = (CPSAuthenticationSession *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CPSAuthenticationSession_start__block_invoke;
  block[3] = &unk_26528A118;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __33__CPSAuthenticationSession_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    v2 = ClientSessionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __33__CPSAuthenticationSession_start__block_invoke_cold_2();
    }
LABEL_7:

    return;
  }
  if (*(unsigned char *)(v1 + 25))
  {
    v2 = ClientSessionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __33__CPSAuthenticationSession_start__block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  -[CPSAuthenticationSession _activated](v1);
}

- (void)_activated
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = ClientSessionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24A684000, v2, OS_LOG_TYPE_INFO, "Activated", buf, 2u);
    }

    *(unsigned char *)(a1 + 24) = 1;
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.companiond.xpc" options:0];
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    v5 = *(void **)(a1 + 16);
    id v6 = +[CPSAuthenticationServiceInterface clientInterface];
    [v5 setExportedInterface:v6];

    v7 = *(void **)(a1 + 16);
    v8 = +[CPSAuthenticationServiceInterface daemonInterface];
    [v7 setRemoteObjectInterface:v8];

    [*(id *)(a1 + 16) setExportedObject:a1];
    [*(id *)(a1 + 16) _setQueue:*(void *)(a1 + 8)];
    v9 = *(void **)(a1 + 16);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __38__CPSAuthenticationSession__activated__block_invoke;
    v17[3] = &unk_26528A118;
    v17[4] = a1;
    [v9 setInterruptionHandler:v17];
    v10 = *(void **)(a1 + 16);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__CPSAuthenticationSession__activated__block_invoke_17;
    v16[3] = &unk_26528A118;
    v16[4] = a1;
    [v10 setInvalidationHandler:v16];
    [*(id *)(a1 + 16) resume];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __38__CPSAuthenticationSession__activated__block_invoke_18;
    v15[3] = &unk_26528A140;
    v15[4] = a1;
    v11 = (void *)MEMORY[0x24C5CAA40](v15);
    v12 = ClientSessionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl(&dword_24A684000, v12, OS_LOG_TYPE_DEFAULT, "Starting authentication session: %@", buf, 0xCu);
    }

    v14 = [*(id *)(a1 + 16) remoteObjectProxyWithErrorHandler:v11];
    [v14 startAuthenticationSessionWithRequest:*(void *)(a1 + 32) completionHandler:v11];
  }
}

- (void)cancel
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CPSAuthenticationSession_cancel__block_invoke;
  block[3] = &unk_26528A118;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__CPSAuthenticationSession_cancel__block_invoke(uint64_t a1)
{
}

- (void)_invalidated
{
  if (a1 && !*(unsigned char *)(a1 + 25))
  {
    v2 = ClientSessionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_24A684000, v2, OS_LOG_TYPE_INFO, "Invalidated", v11, 2u);
    }

    uint64_t v3 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    v4 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v6 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      v8 = NSErrorF();
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

      v9 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    [*(id *)(a1 + 16) setInterruptionHandler:0];
    [*(id *)(a1 + 16) setInvalidationHandler:0];
    [*(id *)(a1 + 16) invalidate];
    v10 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    *(unsigned char *)(a1 + 25) = 1;
  }
}

void __38__CPSAuthenticationSession__activated__block_invoke(uint64_t a1)
{
  v2 = ClientSessionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__CPSAuthenticationSession__activated__block_invoke_cold_1();
  }

  uint64_t v3 = NSErrorF();
  -[CPSAuthenticationSession _sessionFailedWithError:](*(void *)(a1 + 32), v3);
}

- (void)_sessionFailedWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = ClientSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CPSAuthenticationSession _sessionFailedWithError:]((uint64_t)v3, v4);
    }

    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
      id v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v3);
      v8 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    -[CPSAuthenticationSession _invalidated](a1);
  }
}

void __38__CPSAuthenticationSession__activated__block_invoke_17(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  v4 = ClientSessionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__CPSAuthenticationSession__activated__block_invoke_17_cold_1();
  }

  uint64_t v5 = NSErrorF();
  -[CPSAuthenticationSession _sessionFailedWithError:](*(void *)(a1 + 32), v5);
}

void __38__CPSAuthenticationSession__activated__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = ClientSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__CPSAuthenticationSession__activated__block_invoke_18_cold_1((uint64_t)v3, v4);
    }

    -[CPSAuthenticationSession _sessionFailedWithError:](*(void *)(a1 + 32), v3);
  }
}

- (void)_deviceTappedNotification:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v4 = ClientSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_24A684000, v4, OS_LOG_TYPE_DEFAULT, "Device tapped notification: %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
}

- (void)_deviceStartedAuthentication:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v4 = ClientSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_24A684000, v4, OS_LOG_TYPE_DEFAULT, "Device started authentication: %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 72);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
}

- (void)_sessionFinishedWithResponse:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v4 = ClientSessionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_24A684000, v4, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
      int v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v3, 0);
      uint64_t v8 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    -[CPSAuthenticationSession _invalidated](a1);
  }
}

- (void)authenticationSessionDeviceTappedNotification:(id)a3
{
}

- (void)authenticationSessionDeviceStartedAuthentication:(id)a3
{
}

- (void)authenticationSessionDidFinishWithResponse:(id)a3
{
}

- (void)authenticationSessionDidFailWithError:(id)a3
{
}

- (CPSAuthenticationRequest)request
{
  return self->_request;
}

- (id)sessionCompletionHandler
{
  return self->_sessionCompletionHandler;
}

- (void)setSessionCompletionHandler:(id)a3
{
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
}

- (id)deviceAcceptedNotificationHandler
{
  return self->_deviceAcceptedNotificationHandler;
}

- (void)setDeviceAcceptedNotificationHandler:(id)a3
{
}

- (id)deviceStartedAuthenticationHandler
{
  return self->_deviceStartedAuthenticationHandler;
}

- (void)setDeviceStartedAuthenticationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStartedAuthenticationHandler, 0);
  objc_storeStrong(&self->_deviceAcceptedNotificationHandler, 0);
  objc_storeStrong(&self->_sessionFailedHandler, 0);
  objc_storeStrong(&self->_sessionFinishedHandler, 0);
  objc_storeStrong(&self->_sessionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)initWithRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  int v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"CPSAuthenticationSession.m";
  __int16 v16 = 1024;
  int v17 = 37;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __33__CPSAuthenticationSession_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A684000, v0, v1, "Session already invalidated", v2, v3, v4, v5, v6);
}

void __33__CPSAuthenticationSession_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A684000, v0, v1, "Session already activated", v2, v3, v4, v5, v6);
}

void __38__CPSAuthenticationSession__activated__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A684000, v0, v1, "Connection interrupted", v2, v3, v4, v5, v6);
}

- (void)_sessionFailedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24A684000, a2, OS_LOG_TYPE_ERROR, "Session failed: %@", (uint8_t *)&v2, 0xCu);
}

void __38__CPSAuthenticationSession__activated__block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24A684000, v0, v1, "Connection invalidated", v2, v3, v4, v5, v6);
}

void __38__CPSAuthenticationSession__activated__block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24A684000, a2, OS_LOG_TYPE_ERROR, "Failed to start session: %@", (uint8_t *)&v2, 0xCu);
}

@end