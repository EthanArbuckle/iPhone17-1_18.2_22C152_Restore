@interface SRDebugInfoClient
+ (id)clientInterface;
+ (id)connectionToDaemon;
+ (id)remoteInterface;
+ (void)initialize;
- (BOOL)connectionDidInterrupt;
- (NSXPCConnection)connection;
- (SRDebugInfoClient)init;
- (SRDebugInfoClient)initWithConnection:(id)a3;
- (void)datastoreListingWithReply:(id)a3;
- (void)dealloc;
- (void)dumpClientsWithReply:(id)a3;
- (void)dumpConfigurationsWithReply:(id)a3;
- (void)dumpDefaultsWithReply:(id)a3;
- (void)dumpStateCacheWithReply:(id)a3;
- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setConnectionDidInterrupt:(BOOL)a3;
- (void)setupConnection;
@end

@implementation SRDebugInfoClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100017050 = (uint64_t)os_log_create("com.apple.SensorKit", "SRDebugInfoClient");
  }
}

- (SRDebugInfoClient)init
{
  id v3 = [(id)objc_opt_class() connectionToDaemon];

  return [(SRDebugInfoClient *)self initWithConnection:v3];
}

- (SRDebugInfoClient)initWithConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRDebugInfoClient;
  v4 = [(SRDebugInfoClient *)&v6 init];
  if (v4)
  {
    v4->_connection = (NSXPCConnection *)a3;
    [(SRDebugInfoClient *)v4 setupConnection];
  }
  return v4;
}

- (void)invalidate
{
  [(NSXPCConnection *)[(SRDebugInfoClient *)self connection] setExportedObject:0];
  id v3 = [(SRDebugInfoClient *)self connection];

  [(NSXPCConnection *)v3 invalidate];
}

- (void)dealloc
{
  [(SRDebugInfoClient *)self setConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDebugInfoClient;
  [(SRDebugInfoClient *)&v3 dealloc];
}

+ (id)clientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceClientDebugging];
}

+ (id)remoteInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SRSensorKitServiceServerDebugging];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  [(NSXPCInterface *)v2 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0) forSelector:"dumpClientsWithReply:" argumentIndex:0 ofReply:1];
  return v2;
}

+ (id)connectionToDaemon
{
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.SensorKit.debugging" options:4096];

  return v2;
}

- (void)setupConnection
{
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  connection = self->_connection;

  [(NSXPCConnection *)connection resume];
}

- (void)dumpClientsWithReply:(id)a3
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000840C;
  v5[3] = &unk_100010598;
  v5[4] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000084EC;
  v4[3] = &unk_1000105C0;
  v4[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "dumpClientsWithReply:", v4);
}

- (void)dumpStateCacheWithReply:(id)a3
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000085C8;
  v5[3] = &unk_100010598;
  v5[4] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000086A4;
  v4[3] = &unk_1000105C0;
  v4[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "dumpStateCacheWithReply:", v4);
}

- (void)datastoreListingWithReply:(id)a3
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008780;
  v5[3] = &unk_100010598;
  v5[4] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000885C;
  v4[3] = &unk_1000105E8;
  v4[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "listDatastoreWithReply:", v4);
}

- (void)dumpConfigurationsWithReply:(id)a3
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008984;
  v5[3] = &unk_100010598;
  v5[4] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008A64;
  v4[3] = &unk_1000105C0;
  v4[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "dumpConfigurationsWithReply:", v4);
}

- (void)dumpDefaultsWithReply:(id)a3
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008B40;
  v5[3] = &unk_100010598;
  v5[4] = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008C20;
  v4[3] = &unk_1000105C0;
  v4[4] = a3;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "dumpDefaultsWithReply:", v4);
}

- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5
{
  connection = self->_connection;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008CCC;
  v6[3] = &unk_100010598;
  v6[4] = a5;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v6), "fetchEligibilityStatusForBundleIdentifier:sensor:reply:", a3, a4, a5);
}

- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008E34;
  v5[3] = &unk_100010598;
  v5[4] = a4;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "fetchDeviceInformationForDeviceIdentifiers:reply:", a3, a4);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)connectionDidInterrupt
{
  return self->_connectionDidInterrupt;
}

- (void)setConnectionDidInterrupt:(BOOL)a3
{
  self->_connectionDidInterrupt = a3;
}

@end