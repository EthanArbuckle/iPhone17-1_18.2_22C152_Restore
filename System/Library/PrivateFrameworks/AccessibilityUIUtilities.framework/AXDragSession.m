@interface AXDragSession
- (AXDragSession)initWithDruidConnection:(id)a3;
- (AXDragSessionDelegate)delegate;
- (id)_serverSession;
- (id)manager;
- (void)abort;
- (void)cancel;
- (void)dragDidEndWithOperation:(unint64_t)a3;
- (void)dragStatusDidChange:(id)a3;
- (void)dragWillBeginWithReply:(id)a3;
- (void)drop;
- (void)moveToPoint:(CGPoint)a3 forRequestor:(id)a4 completion:(id)a5;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation AXDragSession

- (AXDragSession)initWithDruidConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXDragSession;
  v6 = [(AXDragSession *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = _DUINewServerSessionAccessibilityInterface();
    [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v8];

    v9 = _DUINewClientSessionAccessibilityInterface();
    [(NSXPCConnection *)v7->_connection setExportedInterface:v9];

    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__AXDragSession_initWithDruidConnection___block_invoke;
    v11[3] = &unk_1E649BDA8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v7->_connection setInvalidationHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __41__AXDragSession_initWithDruidConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 dragSessionWasTerminated:WeakRetained];

  v2 = [WeakRetained manager];
  [v2 sessionWasTerminated:WeakRetained];
}

- (id)_serverSession
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void)dragWillBeginWithReply:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)dragStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(AXDragSession *)self delegate];
  [v5 dragSessionChanged:self toStatus:v4];
}

- (void)dragDidEndWithOperation:(unint64_t)a3
{
  id v5 = [(AXDragSession *)self delegate];
  [v5 dragSessionEnded:self withOperation:a3];

  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (void)resume
{
  self->_resumed = 1;
}

- (void)abort
{
  self->_aborted = 1;
  v3 = [(AXDragSession *)self delegate];
  [v3 dragSessionWasTerminated:self];

  id v4 = [(AXDragSession *)self manager];
  [v4 sessionWasTerminated:self];
}

- (void)drop
{
  id v2 = [(AXDragSession *)self _serverSession];
  [v2 accessibilityDrop];
}

- (void)cancel
{
  v3 = [(AXDragSession *)self _serverSession];
  [v3 accessibilityCancel];

  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (void)moveToPoint:(CGPoint)a3 forRequestor:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v14 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = [(AXDragSession *)self _serverSession];
  objc_msgSend(v10, "accessibilityMoveToPoint:", x, y);

  v9[2](v9, 1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "dragSession:movedToPoint:byRequestor:", self, v14, x, y);
  }
}

- (id)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (AXDragSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXDragSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end