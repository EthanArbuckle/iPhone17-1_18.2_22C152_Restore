@interface GCConfigXPCServiceClientConnection
- (GCConfigXPCServiceClientConnection)initWithConnection:(id)a3;
- (GCConfigXPCServiceInterface)server;
- (void)setServer:(id)a3;
@end

@implementation GCConfigXPCServiceClientConnection

- (GCConfigXPCServiceClientConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCConfigXPCServiceClientConnection;
  v5 = [(GCIPCRemoteIncomingConnection *)&v9 initWithConnection:v4];
  if (v5)
  {
    v6 = GCConfigXPCServiceInterface();
    [v4 setExportedInterface:v6];

    v7 = GCConfigXPCServiceClientInterface();
    [v4 setRemoteObjectInterface:v7];
  }
  return v5;
}

- (GCConfigXPCServiceInterface)server
{
  v2 = [(GCIPCRemoteConnection *)self connection];
  v3 = [v2 exportedObject];

  return (GCConfigXPCServiceInterface *)v3;
}

- (void)setServer:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  [v5 setExportedObject:v4];
}

@end