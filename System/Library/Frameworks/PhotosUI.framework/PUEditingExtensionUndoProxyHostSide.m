@interface PUEditingExtensionUndoProxyHostSide
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (PUEditingExtensionUndoButtonHost)target;
- (PUEditingExtensionUndoProxyHostSide)init;
- (id)remoteObject;
- (void)performRedo;
- (void)performUndo;
- (void)setConnection:(id)a3;
- (void)setShowUndoRedo:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4;
@end

@implementation PUEditingExtensionUndoProxyHostSide

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_target);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setTarget:(id)a3
{
}

- (PUEditingExtensionUndoButtonHost)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (PUEditingExtensionUndoButtonHost *)WeakRetained;
}

- (void)performRedo
{
  id v2 = [(PUEditingExtensionUndoProxyHostSide *)self remoteObject];
  [v2 performRedo];
}

- (void)performUndo
{
  id v2 = [(PUEditingExtensionUndoProxyHostSide *)self remoteObject];
  [v2 performUndo];
}

- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PUEditingExtensionUndoProxyHostSide *)self target];
  [v6 setUndoEnabled:v5 redoEnabled:v4];
}

- (void)setShowUndoRedo:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUEditingExtensionUndoProxyHostSide *)self target];
  [v4 setShowUndoRedo:v3];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [(PUEditingExtensionUndoProxyHostSide *)self connection];

  if (!v6)
  {
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C84FFE8];
    [v5 setExportedInterface:v7];

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C850068];
    [v5 setRemoteObjectInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_54];
    [v5 setInvalidationHandler:&__block_literal_global_59];
    [(PUEditingExtensionUndoProxyHostSide *)self setConnection:v5];
    [v5 resume];
  }

  return v6 == 0;
}

void __74__PUEditingExtensionUndoProxyHostSide_listener_shouldAcceptNewConnection___block_invoke_2()
{
}

void __74__PUEditingExtensionUndoProxyHostSide_listener_shouldAcceptNewConnection___block_invoke()
{
}

- (id)remoteObject
{
  id v2 = [(PUEditingExtensionUndoProxyHostSide *)self connection];
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_310];

  return v3;
}

void __51__PUEditingExtensionUndoProxyHostSide_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  id v2 = [(PUEditingExtensionUndoProxyHostSide *)self listener];
  BOOL v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (PUEditingExtensionUndoProxyHostSide)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUEditingExtensionUndoProxyHostSide;
  id v2 = [(PUEditingExtensionUndoProxyHostSide *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D88] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

@end