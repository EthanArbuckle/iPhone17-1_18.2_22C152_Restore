@interface ATLockdownListener
- (ATLockdownListener)initWithServiceName:(id)a3;
- (BOOL)start;
- (NSString)serviceName;
- (void)_handleNewConnection:(id)a3;
- (void)stop;
@end

@implementation ATLockdownListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)_handleNewConnection:(id)a3
{
  v5 = (_xpc_connection_s *)a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3432;
  v7[4] = __Block_byref_object_dispose__3433;
  v8 = self;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__ATLockdownListener__handleNewConnection___block_invoke;
  handler[3] = &unk_1E6B88288;
  handler[5] = v7;
  handler[6] = a2;
  handler[4] = v8;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_resume(v5);
  _Block_object_dispose(v7, 8);
}

void __43__ATLockdownListener__handleNewConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1E016BC50]() == MEMORY[0x1E4F14590])
  {
    if (lockdown_copy_checkin_info())
    {
      _ATLogCategoryFramework();
      v4 = (ATLockdownSocket *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v5;
        __int16 v19 = 2114;
        id v20 = v3;
        _os_log_impl(&dword_1D9A2D000, &v4->super.super, OS_LOG_TYPE_INFO, "%{public}@ received unexpected connection event %{public}@", buf, 0x16u);
      }
LABEL_14:

      goto LABEL_15;
    }
    v4 = [[ATLockdownSocket alloc] initWithLockdownInfo:0];
    v6 = [*(id *)(a1 + 32) serviceName];
    int v7 = [v6 isEqualToString:@"com.apple.atc"];

    if (v7)
    {
      v8 = ATLegacyMessageLink;
    }
    else
    {
      v9 = [*(id *)(a1 + 32) serviceName];
      int v10 = [v9 isEqualToString:@"com.apple.atc2"];

      if (!v10)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v13 = *(void *)(a1 + 48);
        v14 = *(void **)(a1 + 32);
        v15 = [v14 serviceName];
        [v12 handleFailureInMethod:v13, v14, @"ATLockdownListener.m", 78, @"Unknown service name %@", v15 object file lineNumber description];

        v11 = 0;
        goto LABEL_11;
      }
      v8 = ATLockdownMessageLink;
    }
    v11 = (void *)[[v8 alloc] initWithSocket:v4];
LABEL_11:
    v16 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v16 listener:*(void *)(a1 + 32) didReceiveMessageLinkRequest:v11];
    }
    CFRelease(0);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)stop
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;
  }
}

- (BOOL)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = serviceName;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting lockdown listener with service %{public}@", buf, 0x16u);
  }

  uint64_t v5 = [(NSString *)self->_serviceName UTF8String];
  mach_service = xpc_connection_create_mach_service(v5, MEMORY[0x1E4F14428], 1uLL);
  connection = self->_connection;
  self->_connection = mach_service;

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v12 = __Block_byref_object_copy__3432;
  uint64_t v13 = __Block_byref_object_dispose__3433;
  v14 = self;
  v8 = self->_connection;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __27__ATLockdownListener_start__block_invoke;
  handler[3] = &unk_1E6B88260;
  handler[4] = buf;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_resume(self->_connection);
  _Block_object_dispose(buf, 8);

  return 1;
}

void __27__ATLockdownListener_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1E016BC50]() == MEMORY[0x1E4F14578])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleNewConnection:v3];
  }
  else
  {
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_INFO, "%{public}@ received unhandled service event %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (ATLockdownListener)initWithServiceName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATLockdownListener;
  int v6 = [(ATLockdownListener *)&v9 init];
  if (v6)
  {
    if (([&unk_1F33DCD28 containsObject:v5] & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unknown service name" userInfo:0];
      objc_exception_throw(v8);
    }
    objc_storeStrong((id *)&v6->_serviceName, a3);
  }

  return v6;
}

@end