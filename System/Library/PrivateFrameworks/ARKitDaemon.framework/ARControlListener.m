@interface ARControlListener
- (ARControlListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4;
- (ARControlListenerDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ARControlListener

- (ARControlListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ARControlListener;
  v8 = [(ARControlListener *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_controlClass = (Class)[v7 controlClass];
    uint64_t v10 = ARCreateNonFixedPriorityConcurrentDispatchQueue();
    concurrentConnectionTargetQueue = v9->_concurrentConnectionTargetQueue;
    v9->_concurrentConnectionTargetQueue = (OS_dispatch_queue *)v10;

    v12 = [(objc_class *)v9->_controlClass performSelector:sel_serviceName];
    if ([v7 isInProcess])
    {
      uint64_t v13 = [MEMORY[0x263F08D88] anonymousListener];
    }
    else
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v12];
    }
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v13;

    uint64_t v15 = ARCreateNonFixedPriorityDispatchQueue();
    listenerQueue = v9->_listenerQueue;
    v9->_listenerQueue = (OS_dispatch_queue *)v15;

    [(NSXPCListener *)v9->_listener _setQueue:v9->_listenerQueue];
    [(NSXPCListener *)v9->_listener setDelegate:v9];
    [(NSXPCListener *)v9->_listener resume];
  }
  return v9;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ARControlListener;
  [(ARControlListener *)&v3 dealloc];
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ARLogDaemon_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    __int16 v27 = 2048;
    v28 = self;
    _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Listener received request for control", buf, 0x16u);
  }
  v9 = NSString;
  uint64_t v10 = [v5 serviceName];
  v11 = [v9 stringWithFormat:@"com.apple.arkit.daemonControlConnectionQueue.%@", v10];

  id v12 = v11;
  uint64_t v13 = (const char *)[v12 UTF8String];
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create_with_target_V2(v13, v14, (dispatch_queue_t)self->_concurrentConnectionTargetQueue);

  [v5 _setQueue:v15];
  v16 = (void *)[objc_alloc(self->_controlClass) initWithConnection:v5];
  v17 = _ARLogDaemon_3();
  objc_super v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_24719A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Accepted connection for control.", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didDiscoverControl:v16];

    [v5 resume];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v26 = v23;
      __int16 v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_24719A000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create control.", buf, 0x16u);
    }
  }

  return v16 != 0;
}

- (ARControlListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARControlListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_concurrentConnectionTargetQueue, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end