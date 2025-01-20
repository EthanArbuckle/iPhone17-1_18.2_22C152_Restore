@interface MapsPushDaemonIPCInterface
- (void)_configureIncomingConnection:(id)a3;
- (void)establishConnection;
- (void)handleTrafficeReroute:(id)a3 completion:(id)a4;
@end

@implementation MapsPushDaemonIPCInterface

- (void)_configureIncomingConnection:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  v5 = +[NSXPCInterface _maps_mapsPushDaemonXPCClientInterface];
  [v4 setExportedInterface:v5];

  id v6 = +[NSXPCInterface _maps_mapsPushDaemonXPCInterface];
  [v4 setRemoteObjectInterface:v6];
}

- (void)handleTrafficeReroute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C3B8;
  block[3] = &unk_100038B80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(messagingQueue, block);
}

- (void)establishConnection
{
  sub_100014240(OS_LOG_TYPE_INFO, @"MapsIPCInterface Received establish connection message.", v2, v3, v4, v5, v6, v7, v8);
}

@end