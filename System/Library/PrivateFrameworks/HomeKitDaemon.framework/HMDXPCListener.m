@interface HMDXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HMDXPCListener)initWithXPCListener:(id)a3;
- (HMDXPCListenerDelegate)delegate;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDXPCListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDXPCListenerDelegate *)WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[HMDXPCConnection alloc] initWithXPCConnection:v5];

  v7 = [(HMDXPCListener *)self delegate];
  LOBYTE(self) = [v7 listener:self shouldAcceptNewConnection:v6];

  return (char)self;
}

- (void)stop
{
  id v2 = [(HMDXPCListener *)self xpcListener];
  [v2 suspend];
}

- (void)start
{
  v3 = [(HMDXPCListener *)self xpcListener];
  [v3 setDelegate:self];

  id v4 = [(HMDXPCListener *)self xpcListener];
  [v4 resume];
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCListener *)self xpcListener];
  [v5 _setQueue:v4];
}

- (OS_dispatch_queue)queue
{
  id v2 = [(HMDXPCListener *)self xpcListener];
  v3 = [v2 _queue];

  return (OS_dispatch_queue *)v3;
}

- (HMDXPCListener)initWithXPCListener:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)HMDXPCListener;
    v7 = [(HMDXPCListener *)&v15 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_xpcListener, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMDBackgroundOperationManagerCurrentDeviceStateDataSource *)_HMFPreconditionFailure();
    return (HMDXPCListener *)[(HMDBackgroundOperationManagerCurrentDeviceStateDataSource *)v10 timerWithTimeInterval:v14 options:v12 label:v13];
  }
}

@end