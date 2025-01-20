@interface MSXPCService
+ (id)remoteProxyForXPCInterface:(id)a3 connectionErrorHandler:(id)a4;
+ (id)remoteProxyForXPCInterface:(id)a3 shouldLaunchMobileMail:(BOOL)a4 connectionErrorHandler:(id)a5;
- (BOOL)shouldLaunchMobileMail;
- (MSXPCService)init;
- (MSXPCService)initWithRemoteObjectInterface:(id)a3;
- (id)connection;
- (id)newConnectionForInterface:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)setShouldLaunchMobileMail:(BOOL)a3;
@end

@implementation MSXPCService

- (MSXPCService)initWithRemoteObjectInterface:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSXPCService;
  v6 = [(MSXPCService *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_shouldLaunchMobileMail = 1;
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v7->_lock;
    v7->_lock = v8;

    objc_storeStrong((id *)&v7->_remoteObjectInterface, a3);
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSXPCService;
  [(MSXPCService *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  objc_super v12 = __50__MSXPCService_remoteObjectProxyWithErrorHandler___block_invoke;
  v13 = &unk_264243688;
  id v5 = v4;
  v14 = self;
  id v15 = v5;
  v6 = (void *)MEMORY[0x2166BBCE0](&v10);
  v7 = [(MSXPCService *)self connection];
  v8 = [v7 remoteObjectProxyWithErrorHandler:v6];

  return v8;
}

- (id)newConnectionForInterface:(id)a3
{
  id v4 = a3;
  id v5 = [MSXPCConnection alloc];
  v6 = [v4 protocol];
  v7 = [(MSXPCConnection *)v5 initWithProtocol:v6];

  [(MSXPCConnection *)v7 setShouldLaunchMobileMail:[(MSXPCService *)self shouldLaunchMobileMail]];
  [(MSXPCConnection *)v7 setRemoteObjectInterface:v4];

  return v7;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunchMobileMail;
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    [(NSLock *)self->_lock lock];
    if (!self->_connection)
    {
      id v4 = [(MSXPCService *)self newConnectionForInterface:self->_remoteObjectInterface];
      id v5 = self->_connection;
      self->_connection = v4;

      [(NSXPCConnection *)self->_connection resume];
    }
    [(NSLock *)self->_lock unlock];
    connection = self->_connection;
  }

  return connection;
}

- (MSXPCService)init
{
  return [(MSXPCService *)self initWithRemoteObjectInterface:0];
}

+ (id)remoteProxyForXPCInterface:(id)a3 connectionErrorHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() remoteProxyForXPCInterface:v5 shouldLaunchMobileMail:1 connectionErrorHandler:v6];

  return v7;
}

+ (id)remoteProxyForXPCInterface:(id)a3 shouldLaunchMobileMail:(BOOL)a4 connectionErrorHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRemoteObjectInterface:v7];
  [v9 setShouldLaunchMobileMail:v6];
  uint64_t v10 = [v9 remoteObjectProxyWithErrorHandler:v8];

  return v10;
}

- (id)remoteObjectProxy
{
  return [(MSXPCService *)self remoteObjectProxyWithErrorHandler:0];
}

void __50__MSXPCService_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  id v4 = self;
}

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunchMobileMail = a3;
}

@end