@interface FPXConnectionHandler
- (BOOL)shouldAcceptConnection:(id)a3;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (Class)delegateClass;
- (FPXConnectionHandler)init;
- (id)makeNewContext;
- (void)invalidateCurrentContext:(void *)a3;
- (void)makeNewContext;
@end

@implementation FPXConnectionHandler

- (BOOL)shouldAcceptConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] [helena] accepting connection %@", buf, 0xCu);
  }

  v6 = FPXVendorXPCInterface();
  [v4 setExportedInterface:v6];

  v7 = [(FPXConnectionHandler *)self makeNewContext];
  [v4 setExportedObject:v7];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke;
  v14[3] = &unk_1E5AF43E0;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v4;
  [v4 setInvalidationHandler:v14];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke_2;
  v12 = &unk_1E5AF43E0;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = v4;
  [v4 setInterruptionHandler:&v9];
  objc_msgSend(v4, "activate", v9, v10, v11, v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (id)makeNewContext
{
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_activeConnections;
  if (v2->_currentContext)
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      [(FPXConnectionHandler *)(uint64_t)v2 makeNewContext];
    }
  }
  else
  {
    id v4 = objc_alloc_init(FPXExtensionContext);
    currentContext = v2->_currentContext;
    v2->_currentContext = v4;
  }
  v6 = v2->_currentContext;
  objc_sync_exit(v2);

  return v6;
}

- (FPXConnectionHandler)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FPXConnectionHandler;
  v2 = [(FPXConnectionHandler *)&v6 init];
  if (v2 && +[FPDaemonConnection runningInSyncBubble])
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uid_t v4 = geteuid();
      *(_DWORD *)buf = 67109120;
      uid_t v8 = v4;
      _os_log_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] shared iPad: extension is running in the sync bubble for euid %u", buf, 8u);
    }
  }
  return v2;
}

- (Class)delegateClass
{
  return 0;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)invalidateCurrentContext:(void *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uid_t v4 = self;
  objc_sync_enter(v4);
  int v5 = v4->_activeConnections - 1;
  v4->_int activeConnections = v5;
  if (v5)
  {
    objc_super v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int activeConnections = v4->_activeConnections;
      int v12 = 134218240;
      v13 = a3;
      __int16 v14 = 1024;
      int v15 = activeConnections;
      uid_t v8 = "[INFO] [helena] connection %p was invalidated, %d left";
      uint64_t v9 = v6;
      uint32_t v10 = 18;
LABEL_6:
      _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    [(FPXExtensionContext *)v4->_currentContext invalidate];
    currentContext = v4->_currentContext;
    v4->_currentContext = 0;

    objc_super v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      v13 = a3;
      uid_t v8 = "[INFO] [helena] last connection %p was invalidated, tearing down";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_6;
    }
  }

  objc_sync_exit(v4);
}

void __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateCurrentContext:*(void *)(a1 + 40)];
}

void __47__FPXConnectionHandler_shouldAcceptConnection___block_invoke_2(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateCurrentContext:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

- (void)makeNewContext
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[CRIT] [helena] %@ has existing context, so we have gotten two calls to create a connection (connection count is %d)", (uint8_t *)&v4, 0x12u);
}

@end