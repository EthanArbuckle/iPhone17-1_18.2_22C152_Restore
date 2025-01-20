@interface CARLayerPropertyMarshal
- (CARLayerPropertyMarshal)init;
- (NSXPCConnection)connection;
- (void)_handleConnectionReset;
- (void)_setupConnection;
- (void)invalidate;
- (void)sendLayerProperties:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation CARLayerPropertyMarshal

- (CARLayerPropertyMarshal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CARLayerPropertyMarshal;
  v2 = [(CARLayerPropertyMarshal *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CARLayerPropertyMarshal *)v2 _setupConnection];
  }
  return v3;
}

- (void)sendLayerProperties:(id)a3
{
  id v4 = a3;
  id v6 = [(CARLayerPropertyMarshal *)self connection];
  objc_super v5 = [v6 remoteObjectProxy];
  [v5 sendLayerProperties:v4];
}

- (void)invalidate
{
  v3 = [(CARLayerPropertyMarshal *)self connection];
  [v3 invalidate];

  [(CARLayerPropertyMarshal *)self setConnection:0];
}

- (void)_setupConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.layer-metadata" options:4096];
  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03272A0];
  [v3 setRemoteObjectInterface:v4];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CARLayerPropertyMarshal__setupConnection__block_invoke;
  v7[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v8, &location);
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CARLayerPropertyMarshal__setupConnection__block_invoke_2;
  v5[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v6, &location);
  [v3 setInvalidationHandler:v5];
  [v3 resume];
  [(CARLayerPropertyMarshal *)self setConnection:v3];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__CARLayerPropertyMarshal__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionReset];
}

void __43__CARLayerPropertyMarshal__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)_handleConnectionReset
{
  [(CARLayerPropertyMarshal *)self setConnection:0];
  [(CARLayerPropertyMarshal *)self _setupConnection];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end