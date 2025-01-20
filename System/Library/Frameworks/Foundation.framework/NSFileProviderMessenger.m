@interface NSFileProviderMessenger
- (NSFileProviderMessenger)initWithInterface:(id)a3 protocol:(id)a4;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NSFileProviderMessenger

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMessenger;
  [(NSFileProviderMessenger *)&v3 dealloc];
}

- (NSFileProviderMessenger)initWithInterface:(id)a3 protocol:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderMessenger;
  v6 = [(NSFileProviderMessenger *)&v8 init];
  if (v6)
  {
    v6->_interface = (NSFileProviderMessageInterface *)a3;
    v6->_protocol = (Protocol *)a4;
    v6->_lock = (NSLock *)objc_opt_new();
  }
  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECEB8)
  {
    [(NSLock *)self->_lock lock];
    if (!self->_triedConnection)
    {
      self->_triedConnection = 1;
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x3052000000;
      v24 = __Block_byref_object_copy__3;
      v25 = __Block_byref_object_dispose__3;
      uint64_t v26 = 0;
      v5 = dispatch_semaphore_create(0);
      interface = self->_interface;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke;
      v20[3] = &unk_1E51F7FD0;
      v20[4] = v5;
      v20[5] = &v21;
      off_1EB1ECEB8(interface, v20);
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v5, v7);
      dispatch_release(v5);
      if (v22[5])
      {
        objc_super v8 = [NSXPCConnection alloc];
        self->_conn = [(NSXPCConnection *)v8 initWithListenerEndpoint:v22[5]];
        uint64_t v9 = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAF9D08];
        [(NSXPCInterface *)v9 setInterface:+[NSXPCInterface interfaceWithProtocol:self->_protocol] forSelector:sel_fetchProxyForItemIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
        [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v9];
        [(NSXPCConnection *)self->_conn resume];
      }
      _Block_object_dispose(&v21, 8);
    }
    [(NSLock *)self->_lock unlock];
  }
  if (!self->_conn) {
    goto LABEL_11;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  uint64_t v26 = 0;
  v10 = dispatch_semaphore_create(0);
  conn = self->_conn;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_613;
  v19[3] = &unk_1E51F7FF8;
  v19[4] = v10;
  id v12 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v19];
  v13 = [(NSFileProviderMessageInterface *)self->_interface itemIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_614;
  v18[3] = &unk_1E51F8020;
  v18[4] = v10;
  v18[5] = &v21;
  [v12 fetchProxyForItemIdentifier:v13 completionHandler:v18];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  id v14 = (id)[(id)v22[5] remoteObjectProxyWithErrorHandler:a3];
  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
LABEL_11:
    v15 = +[NSXPCListener anonymousListener];
    [(NSXPCListener *)v15 resume];
    v16 = [[NSXPCConnection alloc] initWithListenerEndpoint:[(NSXPCListener *)v15 endpoint]];
    [(NSXPCConnection *)v16 setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:self->_protocol]];
    [(NSXPCConnection *)v16 resume];
    id v14 = [(NSXPCConnection *)v16 remoteObjectProxyWithErrorHandler:a3];
    [(NSXPCListener *)v15 invalidate];
  }
  return v14;
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    uint64_t v9 = a4;
    _os_log_error_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger failed to get proxy factory: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_613(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    uint64_t v6 = a2;
    _os_log_error_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger's proxy factory encountered a connection failure: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_614(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_error_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger's proxy factory returned an error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)invalidate
{
}

@end