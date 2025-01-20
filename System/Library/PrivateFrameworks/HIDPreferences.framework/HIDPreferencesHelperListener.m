@interface HIDPreferencesHelperListener
- (BOOL)setupListener;
- (HIDPreferencesHelperListener)init;
- (void)acceptConnection:(id)a3 onQueue:(id)a4;
- (void)init;
- (void)removeClient:(id)a3;
@end

@implementation HIDPreferencesHelperListener

- (HIDPreferencesHelperListener)init
{
  v15.receiver = self;
  v15.super_class = (Class)HIDPreferencesHelperListener;
  v2 = [(HIDPreferencesHelperListener *)&v15 init];
  if (!v2)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  clients = v2->_clients;
  v2->_clients = v3;

  if (![(HIDPreferencesHelperListener *)v2 setupListener])
  {
    v6 = _IOHIDLogCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(HIDPreferencesHelperListener *)v6 init];
    }

    goto LABEL_7;
  }
  v5 = v2;
LABEL_8:

  return v5;
}

- (void)acceptConnection:(id)a3 onQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[HIDPreferencesHelperClient alloc] initWithConnection:v7 listener:self onQueue:v6];

  if (v8)
  {
    [(NSMutableArray *)self->_clients addObject:v8];
  }
  else
  {
    uint64_t v9 = _IOHIDLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperListener acceptConnection:onQueue:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  clients = self->_clients;
  if (clients)
  {
    if ([(NSMutableArray *)clients containsObject:v4])
    {
      [(NSMutableArray *)self->_clients removeObject:v4];
    }
    else
    {
      id v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[HIDPreferencesHelperListener removeClient:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (BOOL)setupListener
{
  v3 = dispatch_queue_create("com.apple.hidpreferenceshelperlistener", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.hidpreferenceshelper", v3, 1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  id v6 = self->_listener;
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v7 = self->_listener;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__HIDPreferencesHelperListener_setupListener__block_invoke;
    handler[3] = &unk_264807B88;
    objc_copyWeak(&v11, &location);
    uint64_t v10 = v3;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_activate(self->_listener);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6 != 0;
}

void __45__HIDPreferencesHelperListener_setupListener__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x22A678CC0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4 == MEMORY[0x263EF86F0])
  {
    id v6 = _IOHIDLogCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __45__HIDPreferencesHelperListener_setupListener__block_invoke_cold_1((uint64_t)v3, v6);
    }

    [WeakRetained acceptConnection:v3 onQueue:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)init
{
}

- (void)acceptConnection:(uint64_t)a3 onQueue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__HIDPreferencesHelperListener_setupListener__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_227443000, a2, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper new connection %@\n", (uint8_t *)&v2, 0xCu);
}

@end