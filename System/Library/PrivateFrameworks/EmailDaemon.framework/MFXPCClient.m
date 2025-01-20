@interface MFXPCClient
- (BOOL)hasEntitlement:(id)a3;
- (MFXPCClient)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation MFXPCClient

- (MFXPCClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFXPCClient;
  v5 = [(MFXPCClient *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(MFXPCClient *)self connection];
  v6 = [v5 valueForEntitlement:v4];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (id)description
{
  v3 = [(MFXPCClient *)self connection];
  uint64_t v4 = objc_opt_class();
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> / <%@: %p> connection from pid %d", v4, self, objc_opt_class(), v3, [v3 processIdentifier]);

  return v5;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end