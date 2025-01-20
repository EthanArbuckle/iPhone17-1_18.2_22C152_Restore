@interface VSServiceConnectionHandler
- (NSXPCConnection)connection;
- (VSServiceConnectionHandlerDelegate)delegate;
- (void)_didFinish;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VSServiceConnectionHandler

- (void)_didFinish
{
  id v3 = [(VSServiceConnectionHandler *)self delegate];
  [v3 connectionHandlerDidFinish:self];
}

- (void)setConnection:(id)a3
{
  v5 = (NSXPCConnection *)a3;
  if (self->_connection != v5)
  {
    objc_storeStrong((id *)&self->_connection, a3);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__VSServiceConnectionHandler_setConnection___block_invoke;
    v8[3] = &unk_1E6BD35C8;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)v5 setInterruptionHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__VSServiceConnectionHandler_setConnection___block_invoke_2;
    v6[3] = &unk_1E6BD35C8;
    objc_copyWeak(&v7, &location);
    [(NSXPCConnection *)v5 setInvalidationHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __44__VSServiceConnectionHandler_setConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinish];
}

void __44__VSServiceConnectionHandler_setConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinish];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (VSServiceConnectionHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSServiceConnectionHandlerDelegate *)WeakRetained;
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