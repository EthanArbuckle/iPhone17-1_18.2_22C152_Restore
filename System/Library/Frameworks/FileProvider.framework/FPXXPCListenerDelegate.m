@interface FPXXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FPXExtensionContext)context;
- (NSString)serviceName;
- (NSXPCInterface)interface;
- (id)exportedObject;
- (void)setContext:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterface:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation FPXXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FPXXPCListenerDelegate *)self context];
  [(FPXXPCListenerDelegate *)self setContext:0];
  v9 = [(FPXXPCListenerDelegate *)self exportedObject];
  [(FPXXPCListenerDelegate *)self setExportedObject:0];
  if (v8)
  {
    v10 = [(FPXXPCListenerDelegate *)self interface];
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:v9];
    id location = 0;
    objc_initWeak(&location, v7);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke;
    v15[3] = &unk_1E5AF0FF0;
    id v16 = v6;
    [v7 setInvalidationHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1;
    v13[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v14, &location);
    [v7 setInterruptionHandler:v13];
    [v8 removeListenerDelegate:self];
    [v7 resume];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  else
  {
    v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FPXXPCListenerDelegate listener:shouldAcceptNewConnection:]((uint64_t)self, v11);
    }
  }
  return v8 != 0;
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (FPXExtensionContext)context
{
  return self->_context;
}

- (void)setExportedObject:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)setInterface:(id)a3
{
}

uint64_t __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_interface, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ not accepting connection because the context is nil", (uint8_t *)&v2, 0xCu);
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] connection invalidated", v1, 2u);
}

void __61__FPXXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_1_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] connection interrupted", v1, 2u);
}

@end