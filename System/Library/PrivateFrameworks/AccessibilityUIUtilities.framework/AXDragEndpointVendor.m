@interface AXDragEndpointVendor
- (AXDragEndpointVendor)initWithXPCListener:(id)a3;
- (AXDragEndpointVendorDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)endpointForConnection:(id)a3 forEndpointRequestSatisfier:(id)a4;
- (void)endpointRequestSatisfierDidDisconnect:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation AXDragEndpointVendor

- (AXDragEndpointVendor)initWithXPCListener:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXDragEndpointVendor;
  v6 = [(AXDragEndpointVendor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    [(NSXPCListener *)v7->_listener setDelegate:v7];
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    activeConnections = v7->_activeConnections;
    v7->_activeConnections = (NSMutableSet *)v8;
  }
  return v7;
}

- (void)resume
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[AXDragEndpointRequestSatisfier alloc] initWithConnection:v5];

  [(AXDragEndpointRequestSatisfier *)v6 setDelegate:self];
  [(NSMutableSet *)self->_activeConnections addObject:v6];

  return 1;
}

- (id)endpointForConnection:(id)a3 forEndpointRequestSatisfier:(id)a4
{
  id v5 = a3;
  v6 = [(AXDragEndpointVendor *)self delegate];
  v7 = [v6 endpointForRequestingConnection:v5 fromEndpointVendor:self];

  return v7;
}

- (void)endpointRequestSatisfierDidDisconnect:(id)a3
{
}

- (AXDragEndpointVendorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXDragEndpointVendorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end