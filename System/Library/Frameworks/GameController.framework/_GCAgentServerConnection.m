@interface _GCAgentServerConnection
- (_GCAgentClientInterface)client;
- (_GCAgentServerConnection)init;
- (_GCAgentServerConnection)initWithMachServiceName:(id)a3;
- (void)setClient:(id)a3;
@end

@implementation _GCAgentServerConnection

- (_GCAgentServerConnection)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)&off_26D2B7A00) initWithMachServiceName:v4 options:4096];

  v6 = GCAgentClientInterface();
  [v5 setExportedInterface:v6];

  v7 = GCAgentServerInterface();
  [v5 setRemoteObjectInterface:v7];

  v10.receiver = self;
  v10.super_class = (Class)_GCAgentServerConnection;
  v8 = [(GCIPCRemoteOutgoingConnection *)&v10 initWithConnection:v5];

  return v8;
}

- (_GCAgentServerConnection)init
{
  return [(_GCAgentServerConnection *)self initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.app"];
}

- (_GCAgentClientInterface)client
{
  v2 = [(GCIPCRemoteConnection *)self connection];
  v3 = [v2 exportedObject];

  return (_GCAgentClientInterface *)v3;
}

- (void)setClient:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  [v5 setExportedObject:v4];
}

@end