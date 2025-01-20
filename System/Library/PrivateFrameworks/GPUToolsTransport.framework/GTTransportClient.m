@interface GTTransportClient
- (GTTransportClient)initWithConnection:(id)a3;
- (id)allServices;
- (id)capture;
- (id)launcher;
- (id)loopback;
- (id)replayer;
- (id)serviceProvider;
@end

@implementation GTTransportClient

- (GTTransportClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTransportClient;
  v6 = [(GTTransportClient *)&v10 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.gputools.transport", "GTTransportClient");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v6;
}

- (id)allServices
{
  return allServices(self->_connection);
}

- (id)capture
{
  v3 = allServices(self->_connection);
  v4 = filteredArrayByService(v3, (Protocol *)&unk_26EFBC368);
  id v5 = [v4 firstObject];

  v6 = [GTMTLCaptureServiceXPCProxy alloc];
  connection = self->_connection;
  v8 = [v5 serviceProperties];
  v9 = [(GTMTLCaptureServiceXPCProxy *)v6 initWithConnection:connection remoteProperties:v8];

  return v9;
}

- (id)launcher
{
  v3 = allServices(self->_connection);
  v4 = filteredArrayByService(v3, (Protocol *)&unk_26EFBE210);
  id v5 = [v4 firstObject];

  v6 = [GTLaunchServiceXPCProxy alloc];
  connection = self->_connection;
  v8 = [v5 serviceProperties];
  v9 = [(GTLaunchServiceXPCProxy *)v6 initWithConnection:connection remoteProperties:v8];

  return v9;
}

- (id)replayer
{
  v3 = allServices(self->_connection);
  v4 = filteredArrayByService(v3, (Protocol *)&unk_26EFBE8E8);
  id v5 = [v4 firstObject];

  v6 = [[GTMTLReplayServiceXPCProxy alloc] initWithConnection:self->_connection serviceInfo:v5];
  return v6;
}

- (id)serviceProvider
{
  v3 = allServices(self->_connection);
  v4 = filteredArrayByService(v3, (Protocol *)&unk_26EFBED88);
  id v5 = [v4 firstObject];

  v6 = [GTServiceProviderXPCProxy alloc];
  connection = self->_connection;
  v8 = [v5 serviceProperties];
  v9 = [(GTServiceProviderXPCProxy *)v6 initWithConnection:connection remoteProperties:v8];

  return v9;
}

- (id)loopback
{
  v3 = allServices(self->_connection);
  v4 = filteredArrayByService(v3, (Protocol *)&unk_26EFBE580);
  id v5 = [v4 firstObject];

  v6 = [GTLoopbackServiceXPCProxy alloc];
  connection = self->_connection;
  v8 = [v5 serviceProperties];
  v9 = [(GTLoopbackServiceXPCProxy *)v6 initWithConnection:connection remoteProperties:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end