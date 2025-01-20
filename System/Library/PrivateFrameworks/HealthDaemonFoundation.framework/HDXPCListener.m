@interface HDXPCListener
+ (id)serviceListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HDXPCListener)init;
- (HDXPCListener)initWithLabel:(id)a3;
- (HDXPCListener)initWithMachServiceName:(id)a3;
- (HDXPCListener)initWithUnderlyingListener:(id)a3 label:(id)a4;
- (HDXPCListenerClientProvider)clientProvider;
- (HDXPCListenerDelegate)delegate;
- (NSArray)allClients;
- (NSString)label;
- (NSXPCListenerEndpoint)endpoint;
- (void)_handleConnectionInvalidationForClient:(id)a3 exportedObject:(id)a4;
- (void)_handleInterruptionWithClient:(id)a3 exportedObject:(id)a4;
- (void)_handleInvalidationWithClient:(id)a3 exportedObject:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setClientProvider:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HDXPCListener

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_underlyingListener endpoint];
}

- (void)setQueue:(id)a3
{
}

- (void)resume
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setConnectionQueue:(id)a3
{
}

- (void)setClientProvider:(id)a3
{
}

uint64_t __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInvalidationWithClient:*(void *)(a1 + 40) exportedObject:*(void *)(a1 + 48)];
}

- (void)dealloc
{
  [(HDXPCListener *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDXPCListener;
  [(HDXPCListener *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSXPCListener *)self->_underlyingListener invalidate];
  underlyingListener = self->_underlyingListener;

  [(NSXPCListener *)underlyingListener setDelegate:0];
}

- (HDXPCListener)initWithLabel:(id)a3
{
  v4 = (void *)MEMORY[0x263F08D88];
  id v5 = a3;
  v6 = [v4 anonymousListener];
  v7 = [(HDXPCListener *)self initWithUnderlyingListener:v6 label:v5];

  return v7;
}

- (HDXPCListener)initWithUnderlyingListener:(id)a3 label:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDXPCListener.m", 46, @"Invalid parameter not satisfying: %@", @"listener != nil" object file lineNumber description];
  }
  v10 = [v8 delegate];

  if (v10)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDXPCListener.m", 47, @"Invalid parameter not satisfying: %@", @"[listener delegate] == nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDXPCListener;
  v11 = [(HDXPCListener *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_underlyingListener, a3);
    [(NSXPCListener *)v12->_underlyingListener setDelegate:v12];
    uint64_t v13 = [v9 copy];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)_handleConnectionInvalidationForClient:(id)a3 exportedObject:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(HDXPCListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 connectionInvalidatedForListener:self client:v8 exportedObject:v6];
  }
}

- (void)_handleInvalidationWithClient:(id)a3 exportedObject:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_INFO))
  {
    label = self->_label;
    v10 = v8;
    v11 = [v6 process];
    v12 = [v11 bundleIdentifier];
    uint64_t v13 = [v6 process];
    int v14 = 138543874;
    v15 = label;
    __int16 v16 = 2114;
    v17 = v12;
    __int16 v18 = 1024;
    int v19 = [v13 processIdentifier];
    _os_log_impl(&dword_21BFB4000, v10, OS_LOG_TYPE_INFO, "%{public}@: Connection to %{public}@ (%d) invalidated", (uint8_t *)&v14, 0x1Cu);
  }
  [v7 connectionInvalidated];
  [(HDXPCListener *)self _handleConnectionInvalidationForClient:v6 exportedObject:v7];

  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_exportedObjectsByClient removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 processIdentifier];
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x263F098F8];
  id v8 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEBUG)) {
    -[HDXPCListener listener:shouldAcceptNewConnection:]((uint64_t)self, v6, v8);
  }
  id v9 = [(HDXPCListener *)self delegate];
  if (v9)
  {
    v10 = [(HDXPCListener *)self clientProvider];
    v11 = v10;
    if (v10)
    {
      uint64_t v50 = 0;
      v12 = (id *)&v50;
      uint64_t v13 = [v10 clientForListener:self connection:v5 error:&v50];
    }
    else
    {
      uint64_t v49 = 0;
      v12 = (id *)&v49;
      uint64_t v13 = +[HDXPCClient clientWithConnection:v5 error:&v49];
    }
    __int16 v16 = (void *)v13;
    id v17 = *v12;
    if (v16)
    {
      v40 = v11;
      __int16 v18 = NSString;
      int v19 = [v16 process];
      uint64_t v20 = [v19 bundleIdentifier];
      uint64_t v39 = [v18 stringWithFormat:@"%@ (%d)", v20, v6];

      id v48 = v17;
      v21 = [v9 exportObjectForListener:self client:v16 error:&v48];
      id v38 = v48;

      BOOL v15 = v21 != 0;
      if (v21)
      {
        if (self->_connectionQueue) {
          objc_msgSend(v5, "_setQueue:");
        }
        v22 = [v21 remoteInterface];
        [v5 setRemoteObjectInterface:v22];

        v23 = [v21 exportedInterface];
        [v5 setExportedInterface:v23];

        [v5 setExportedObject:v21];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke;
        block[3] = &unk_2643D4500;
        block[4] = self;
        if (listener_shouldAcceptNewConnection__onceToken != -1) {
          dispatch_once(&listener_shouldAcceptNewConnection__onceToken, block);
        }
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_2;
        v44[3] = &unk_2643D4680;
        v44[4] = self;
        id v24 = v16;
        id v45 = v24;
        id v25 = v21;
        id v46 = v25;
        [v5 setInvalidationHandler:v44];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_4;
        v41[3] = &unk_2643D4680;
        v41[4] = self;
        id v26 = v24;
        id v42 = v26;
        id v27 = v25;
        id v43 = v27;
        [v5 setInterruptionHandler:v41];
        os_unfair_lock_lock(&self->_lock);
        exportedObjectsByClient = self->_exportedObjectsByClient;
        if (!exportedObjectsByClient)
        {
          v29 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
          v30 = self->_exportedObjectsByClient;
          self->_exportedObjectsByClient = v29;

          exportedObjectsByClient = self->_exportedObjectsByClient;
        }
        [(NSMapTable *)exportedObjectsByClient setObject:v27 forKey:v26];
        os_unfair_lock_unlock(&self->_lock);
        v31 = (void *)v39;
        if (objc_opt_respondsToSelector()) {
          [v27 connectionConfigured];
        }
        v11 = v40;
        if (objc_opt_respondsToSelector()) {
          [v9 connectionConfiguredForListener:self client:v26 exportedObject:v27];
        }
        [v5 resume];

        id v17 = v38;
      }
      else
      {
        _HKInitializeLogging();
        v34 = *v7;
        BOOL v35 = os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR);
        v31 = (void *)v39;
        v11 = v40;
        id v17 = v38;
        if (v35)
        {
          label = self->_label;
          *(_DWORD *)buf = 138543874;
          v52 = label;
          __int16 v53 = 2114;
          uint64_t v54 = v39;
          __int16 v55 = 2114;
          id v56 = v38;
          _os_log_error_impl(&dword_21BFB4000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting connection from %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v32 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_label;
        *(_DWORD *)buf = 138543874;
        v52 = v33;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v5;
        __int16 v55 = 2114;
        id v56 = v17;
        _os_log_impl(&dword_21BFB4000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create client for connection %{public}@: %{public}@", buf, 0x20u);
      }
      BOOL v15 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    int v14 = *v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HDXPCListener listener:shouldAcceptNewConnection:]((uint64_t)self, (uint64_t)v5, v14);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (HDXPCListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDXPCListenerDelegate *)WeakRetained;
}

- (HDXPCListenerClientProvider)clientProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientProvider);

  return (HDXPCListenerClientProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_clientProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exportedObjectsByClient, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_underlyingListener, 0);
}

void __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v2 = listener_shouldAcceptNewConnection__sharedQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_3;
  block[3] = &unk_2643D4680;
  objc_super v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

- (HDXPCListener)init
{
  objc_super v3 = [MEMORY[0x263F08D88] anonymousListener];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HDXPCListener *)self initWithUnderlyingListener:v3 label:v5];

  return v6;
}

- (HDXPCListener)initWithMachServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D88];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithMachServiceName:v5];
  id v7 = [(HDXPCListener *)self initWithUnderlyingListener:v6 label:v5];

  return v7;
}

+ (id)serviceListener
{
  if (serviceListener_onceToken != -1) {
    dispatch_once(&serviceListener_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)serviceListener_serviceListener;

  return v2;
}

void __32__HDXPCListener_serviceListener__block_invoke()
{
  id v2 = [MEMORY[0x263F08D88] serviceListener];
  v0 = [[HDXPCListener alloc] initWithUnderlyingListener:v2 label:@"ServiceListener"];
  v1 = (void *)serviceListener_serviceListener;
  serviceListener_serviceListener = (uint64_t)v0;
}

- (NSArray)allClients
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMapTable *)self->_exportedObjectsByClient keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

uint64_t __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke()
{
  objc_opt_class();
  listener_shouldAcceptNewConnection__sharedQueue = HKCreateSerialDispatchQueue();

  return MEMORY[0x270F9A758]();
}

void __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  id v2 = listener_shouldAcceptNewConnection__sharedQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_5;
  block[3] = &unk_2643D4680;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __52__HDXPCListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruptionWithClient:*(void *)(a1 + 40) exportedObject:*(void *)(a1 + 48)];
}

- (void)_handleInterruptionWithClient:(id)a3 exportedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = (void *)*MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
    -[HDXPCListener _handleInterruptionWithClient:exportedObject:]((uint64_t)self, v8, v6);
  }
  if (objc_opt_respondsToSelector()) {
    [v7 connectionInterrupted];
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_exportedObjectsByClient removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting connection %{public}@: delegate is nil", (uint8_t *)&v4, 0x16u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_debug_impl(&dword_21BFB4000, log, OS_LOG_TYPE_DEBUG, "%{public}@: New connection from pid %d", (uint8_t *)&v4, 0x12u);
}

- (void)_handleInterruptionWithClient:(void *)a3 exportedObject:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = a2;
  __int16 v6 = [a3 process];
  int v7 = [v6 bundleIdentifier];
  uint64_t v8 = [a3 process];
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  long long v12 = v7;
  __int16 v13 = 1024;
  int v14 = [v8 processIdentifier];
  _os_log_error_impl(&dword_21BFB4000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected interruption on connection to %{public}@ (%d)", (uint8_t *)&v9, 0x1Cu);
}

@end