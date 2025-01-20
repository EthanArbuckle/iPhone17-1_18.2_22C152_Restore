@interface BMXPCListener
+ (id)anonymousListenerWithQueue:(id)a3;
+ (id)serviceListener;
- (BMXPCListener)initWithMachServiceName:(id)a3 queue:(id)a4;
- (BMXPCListenerDelegate)delegate;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (id)_eventHandler;
- (id)_initWithType:(unint64_t)a3 connection:(id)a4 queue:(id)a5;
- (void)_handleConnection:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BMXPCListener

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)serviceListener
{
  if (serviceListener_onceToken != -1) {
    dispatch_once(&serviceListener_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)serviceListener_serviceListener;
  return v2;
}

void __30__BMXPCListener__eventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1B3EB6010]() == MEMORY[0x1E4F14578]) {
    [*(id *)(a1 + 32) _handleConnection:v3];
  }
}

- (void)_handleConnection:(id)a3
{
  id v3 = self;
  +[NSXPCConnection bm_connectionWithPeer:queue:](MEMORY[0x1E4F29268], a3, self->_queue);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(BMXPCListener *)v3 delegate];
  LOBYTE(v3) = [v4 listener:v3 shouldAcceptNewConnection:v5];

  if ((v3 & 1) == 0) {
    [v5 invalidate];
  }
}

- (BMXPCListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BMXPCListenerDelegate *)WeakRetained;
}

- (NSXPCListenerEndpoint)endpoint
{
  if (self->_type)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    xpc_endpoint_t v4 = xpc_endpoint_create(self->_listener);
    [v3 _setEndpoint:v4];
  }
  else
  {
    id v3 = 0;
  }
  return (NSXPCListenerEndpoint *)v3;
}

+ (id)anonymousListenerWithQueue:(id)a3
{
  id v3 = a3;
  xpc_connection_t v4 = xpc_connection_create(0, v3);
  id v5 = [[BMXPCListener alloc] _initWithType:1 connection:v4 queue:v3];

  return v5;
}

uint64_t __32__BMXPCListener_serviceListener__block_invoke()
{
  v0 = [BMXPCListener alloc];
  serviceListener_serviceListener = [(BMXPCListener *)v0 _initWithType:0 connection:0 queue:MEMORY[0x1E4F14428]];
  return MEMORY[0x1F41817F8]();
}

- (BMXPCListener)initWithMachServiceName:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v6 UTF8String], v7, 1uLL);
  v9 = [[BMXPCListener alloc] _initWithType:2 connection:mach_service queue:v7];

  return v9;
}

- (id)_initWithType:(unint64_t)a3 connection:(id)a4 queue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMXPCListener;
  v11 = [(BMXPCListener *)&v16 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_queue, a5);
    if (v9)
    {
      objc_storeStrong(p_isa + 2, a4);
      v13 = (_xpc_connection_s *)p_isa[2];
      v14 = [p_isa _eventHandler];
      xpc_connection_set_event_handler(v13, v14);
    }
  }

  return p_isa;
}

- (id)_eventHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__BMXPCListener__eventHandler__block_invoke;
  v4[3] = &unk_1E6022F10;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1B3EB5AC0](v4, a2);
  return v2;
}

- (void)setQueue:(id)a3
{
  targetq = a3;
  objc_storeStrong((id *)&self->_queue, a3);
  if (self->_type) {
    xpc_connection_set_target_queue(self->_listener, targetq);
  }
}

- (void)activate
{
  if (!self->_type) {
    xpc_main((xpc_connection_handler_t)bm_service_connection_handler);
  }
  listener = self->_listener;
  xpc_connection_activate(listener);
}

- (void)invalidate
{
  if (self->_type) {
    xpc_connection_cancel(self->_listener);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end