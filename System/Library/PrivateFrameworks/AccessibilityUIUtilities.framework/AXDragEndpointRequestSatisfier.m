@interface AXDragEndpointRequestSatisfier
- (AXDragEndpointRequestSatisfier)initWithConnection:(id)a3;
- (AXDragEndpointRequestSatisfierDelegate)delegate;
- (void)requestDragEndpoint:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXDragEndpointRequestSatisfier

- (AXDragEndpointRequestSatisfier)initWithConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXDragEndpointRequestSatisfier;
  v6 = [(AXDragEndpointRequestSatisfier *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1F59CC8];
    [(NSXPCConnection *)v7->_connection setExportedInterface:v8];

    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    objc_initWeak(&location, v7);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __53__AXDragEndpointRequestSatisfier_initWithConnection___block_invoke;
    v13 = &unk_1E649BDA8;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v7->_connection setInvalidationHandler:&v10];
    [(NSXPCConnection *)v7->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__AXDragEndpointRequestSatisfier_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 endpointRequestSatisfierDidDisconnect:WeakRetained];
}

- (void)requestDragEndpoint:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    id v5 = [(AXDragEndpointRequestSatisfier *)self delegate];
    v6 = [v5 endpointForConnection:self->_connection forEndpointRequestSatisfier:self];

    v4[2](v4, v6);
  }
  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (AXDragEndpointRequestSatisfierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXDragEndpointRequestSatisfierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end