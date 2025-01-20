@interface NAVDaemonPeer
- (BOOL)checkDebugEntitlement;
- (BOOL)checkRegularEntitlement;
- (NAVDaemonPeer)initWithNavdManager:(id)a3 forXPCConnection:(id)a4;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5;
- (void)forceCacheRefresh;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
- (void)statusWithCallback:(id)a3;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
@end

@implementation NAVDaemonPeer

- (NAVDaemonPeer)initWithNavdManager:(id)a3 forXPCConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NAVDaemonPeer;
  v9 = [(NAVDaemonPeer *)&v24 init];
  v10 = v9;
  if (v9)
  {
    v9->_monitoringSuggestions = 0;
    objc_storeStrong((id *)&v9->_navdManager, a3);
    objc_storeStrong((id *)&v10->_connection, a4);
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEONavdProxyObserver];
    [v8 setRemoteObjectInterface:v11];

    uint64_t v12 = [v8 remoteObjectProxy];
    proxyObserver = v10->_proxyObserver;
    v10->_proxyObserver = (GEONavdProxyObserver *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    suggestionClients = v10->_suggestionClients;
    v10->_suggestionClients = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("Clients Lists Queue", v16);
    clientsQueue = v10->_clientsQueue;
    v10->_clientsQueue = (OS_dispatch_queue *)v17;

    v19 = [v8 valueForEntitlement:@"com.apple.geoservices.navd.routehypothesis"];
    v10->_hasRegularEntitlement = [v19 BOOLValue];
    v20 = [v8 valueForEntitlement:@"com.apple.geoservices.navd.supersekret.debug"];

    v10->_hasDebugEntitlement = [v20 BOOLValue];
    uint64_t v21 = [v8 valueForEntitlement:@"com.apple.geoservices.navd.clientIdentifier"];
    clientIdentifierEntitlement = v10->_clientIdentifierEntitlement;
    v10->_clientIdentifierEntitlement = (NSString *)v21;
  }
  return v10;
}

- (BOOL)checkRegularEntitlement
{
  if (self->_hasRegularEntitlement)
  {
    if (self->_clientIdentifierEntitlement) {
      return 1;
    }
    CFStringRef v3 = @"com.apple.geoservices.navd.clientIdentifier";
  }
  else
  {
    CFStringRef v3 = @"com.apple.geoservices.navd.routehypothesis";
  }
  NSLog(@"Client is missing %@ entitlement, ignoring call.", a2, v3);
  return 0;
}

- (BOOL)checkDebugEntitlement
{
  if (self->_hasDebugEntitlement)
  {
    if (self->_clientIdentifierEntitlement) {
      return 1;
    }
    CFStringRef v3 = @"com.apple.geoservices.navd.clientIdentifier";
  }
  else
  {
    CFStringRef v3 = @"com.apple.geoservices.navd.supersekret.debug";
  }
  NSLog(@"Client is missing %@ entitlement, ignoring call.", a2, v3);
  return 0;
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NAVDaemonPeer *)self checkRegularEntitlement])
  {
    navdManager = self->_navdManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000431E0;
    v12[3] = &unk_100088F58;
    v12[4] = self;
    id v13 = v9;
    [(GEONavdManager *)navdManager startMonitoringDestination:v8 forClient:v13 uuid:v10 handler:v12];
  }
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(NAVDaemonPeer *)self checkRegularEntitlement]) {
    [(GEONavdManager *)self->_navdManager stopMonitoringDestination:v10 forClient:v8 uuid:v9];
  }
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NAVDaemonPeer *)self checkRegularEntitlement]) {
    [(GEONavdManager *)self->_navdManager requestRefreshForPlannedDestination:v7 client:v6];
  }
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NAVDaemonPeer *)self checkRegularEntitlement]) {
    [(GEONavdManager *)self->_navdManager onlyPerformLocalUpdatesForPlannedDestination:v7 client:v6];
  }
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if ([(NAVDaemonPeer *)self checkRegularEntitlement]) {
    [(GEONavdManager *)self->_navdManager didPostUINotification:a3 forDestination:v9 fromClient:v8];
  }
}

- (void)statusWithCallback:(id)a3
{
  id v4 = a3;
  if ([(NAVDaemonPeer *)self checkDebugEntitlement]) {
    [(GEONavdManager *)self->_navdManager statusWithCallback:v4];
  }
}

- (void)forceCacheRefresh
{
  if ([(NAVDaemonPeer *)self checkDebugEntitlement])
  {
    navdManager = self->_navdManager;
    [(GEONavdManager *)navdManager forceCacheRefresh];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsQueue, 0);
  objc_storeStrong((id *)&self->_suggestionClients, 0);
  objc_storeStrong((id *)&self->_clientIdentifierEntitlement, 0);
  objc_storeStrong((id *)&self->_proxyObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_navdManager, 0);
}

@end