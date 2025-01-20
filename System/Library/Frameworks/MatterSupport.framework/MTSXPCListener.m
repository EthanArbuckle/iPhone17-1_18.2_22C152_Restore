@interface MTSXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MTSXPCListener)initWithXPCListener:(id)a3;
- (MTSXPCListenerDelegate)delegate;
- (NSXPCListener)xpcListener;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation MTSXPCListener

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

- (MTSXPCListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTSXPCListenerDelegate *)WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[MTSXPCConnection alloc] initWithXPCConnection:v5];

  v7 = [(MTSXPCListener *)self delegate];
  LOBYTE(self) = [v7 listener:self shouldAcceptNewConnection:v6];

  return (char)self;
}

- (void)start
{
  v3 = [(MTSXPCListener *)self xpcListener];
  [v3 setDelegate:self];

  id v4 = [(MTSXPCListener *)self xpcListener];
  [v4 resume];
}

- (MTSXPCListener)initWithXPCListener:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSXPCListener;
    v7 = [(MTSXPCListener *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_xpcListener, a3);
    }

    return v8;
  }
  else
  {
    v10 = (MTSThreadScanResult *)_HMFPreconditionFailure();
    [(MTSThreadScanResult *)v10 .cxx_destruct];
  }
  return result;
}

@end