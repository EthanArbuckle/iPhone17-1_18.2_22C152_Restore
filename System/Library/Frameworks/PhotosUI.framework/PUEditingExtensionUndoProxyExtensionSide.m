@interface PUEditingExtensionUndoProxyExtensionSide
- (NSXPCConnection)connection;
- (PUEditingExtensionUndoProxyExtensionSide)initWithEndpoint:(id)a3;
- (PUEditingExtensionUndoTarget)target;
- (id)remoteObject;
- (void)performRedo;
- (void)performUndo;
- (void)setShowUndoRedo:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4;
@end

@implementation PUEditingExtensionUndoProxyExtensionSide

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_target);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (PUEditingExtensionUndoTarget)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (PUEditingExtensionUndoTarget *)WeakRetained;
}

- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PUEditingExtensionUndoProxyExtensionSide *)self remoteObject];
  [v6 setUndoEnabled:v5 redoEnabled:v4];
}

- (void)setShowUndoRedo:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUEditingExtensionUndoProxyExtensionSide *)self remoteObject];
  [v4 setShowUndoRedo:v3];
}

- (id)remoteObject
{
  v2 = [(PUEditingExtensionUndoProxyExtensionSide *)self connection];
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_107_322];

  return v3;
}

void __56__PUEditingExtensionUndoProxyExtensionSide_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)performRedo
{
  id v2 = [(PUEditingExtensionUndoProxyExtensionSide *)self target];
  [v2 performRedo];
}

- (void)performUndo
{
  id v2 = [(PUEditingExtensionUndoProxyExtensionSide *)self target];
  [v2 performUndo];
}

- (void)setTarget:(id)a3
{
}

- (PUEditingExtensionUndoProxyExtensionSide)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUEditingExtensionUndoProxyExtensionSide;
  BOOL v5 = [(PUEditingExtensionUndoProxyExtensionSide *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v4];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C850068];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v8];

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C84FFE8];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v5->_connection setInterruptionHandler:&__block_literal_global_97];
    [(NSXPCConnection *)v5->_connection setInvalidationHandler:&__block_literal_global_102];
    [(NSXPCConnection *)v5->_connection setExportedObject:v5];
    [(NSXPCConnection *)v5->_connection resume];
  }

  return v5;
}

void __61__PUEditingExtensionUndoProxyExtensionSide_initWithEndpoint___block_invoke_2()
{
}

void __61__PUEditingExtensionUndoProxyExtensionSide_initWithEndpoint___block_invoke()
{
}

@end