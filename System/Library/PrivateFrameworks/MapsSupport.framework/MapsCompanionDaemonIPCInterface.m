@interface MapsCompanionDaemonIPCInterface
+ (id)sharedInterface;
- (void)_configureIncomingConnection:(id)a3;
- (void)establishConnection;
@end

@implementation MapsCompanionDaemonIPCInterface

+ (id)sharedInterface
{
  if (qword_10009B858 != -1) {
    dispatch_once(&qword_10009B858, &stru_100082840);
  }
  v2 = (void *)qword_10009B850;

  return v2;
}

- (void)_configureIncomingConnection:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  v5 = +[NSXPCInterface _maps_mapsCompanionDaemonXPCClientInterface];
  [v4 setExportedInterface:v5];

  id v6 = +[NSXPCInterface _maps_mapsCompanionDaemonXPCInterface];
  [v4 setRemoteObjectInterface:v6];
}

- (void)establishConnection
{
  sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface Received establish connection message.", v2, v3, v4, v5, v6, v7, v8);
}

@end