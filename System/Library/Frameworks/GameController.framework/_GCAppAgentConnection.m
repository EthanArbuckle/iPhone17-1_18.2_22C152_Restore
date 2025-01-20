@interface _GCAppAgentConnection
- (_GCAppAgentConnection)init;
- (_GCAppAgentConnection)initWithMachServiceName:(id)a3;
@end

@implementation _GCAppAgentConnection

- (_GCAppAgentConnection)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)&off_26D2B7A00) initWithMachServiceName:v4 options:0];

  v6 = +[NSXPCInterface interfaceWithProtocol:&unk_26D2B3BC8];
  [v5 setRemoteObjectInterface:v6];

  v9.receiver = self;
  v9.super_class = (Class)_GCAppAgentConnection;
  v7 = [(GCIPCRemoteOutgoingConnection *)&v9 initWithConnection:v5];

  return v7;
}

- (_GCAppAgentConnection)init
{
  return [(_GCAppAgentConnection *)self initWithMachServiceName:@"com.apple.GameController.gamecontrolleragentd"];
}

@end