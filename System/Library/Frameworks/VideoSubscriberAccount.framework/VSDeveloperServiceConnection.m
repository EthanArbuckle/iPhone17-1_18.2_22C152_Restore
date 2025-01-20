@interface VSDeveloperServiceConnection
- (NSXPCConnection)connection;
- (VSDeveloperServiceConnection)init;
- (id)serviceWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation VSDeveloperServiceConnection

- (VSDeveloperServiceConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSDeveloperServiceConnection;
  v2 = [(VSDeveloperServiceConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.VideoSubscriberAccount.DeveloperService"];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = VSDeveloperServiceInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSDeveloperServiceConnection;
  [(VSDeveloperServiceConnection *)&v3 dealloc];
}

- (id)serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VSDeveloperServiceConnection *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
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