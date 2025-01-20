@interface NavdRecentLocationsServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NavdRecentLocationsServer)init;
- (void)beginServicingConnection:(id)a3;
- (void)endServicingConnection:(id)a3;
- (void)requestRecentLocationsWithResponse:(id)a3;
@end

@implementation NavdRecentLocationsServer

- (NavdRecentLocationsServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)NavdRecentLocationsServer;
  v2 = [(NavdRecentLocationsServer *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v2->_peers;
    v2->_peers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.navd.recentLocationsServicePeersQueue", v5);
    peersQueue = v2->_peersQueue;
    v2->_peersQueue = (OS_dispatch_queue *)v6;

    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.navd.recentLocationsService"];
    listener = v2->_listener;
    v2->_listener = v8;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)requestRecentLocationsWithResponse:(id)a3
{
  v3 = (void (**)(id, id))a3;
  v4 = +[NavdLocationLeecher sharedLeecher];
  v5 = [v4 leechedLocations];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)GEOLocation);
        id v14 = objc_msgSend(v13, "initWithCLLocation:", v12, (void)v16);
        [v6 addObject:v14];

        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v15 = [v6 copy];
  v3[2](v3, v15);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"com.apple.geoservices.navd.recentLocations"];
  unsigned int v9 = [v8 isEqual:&__kCFBooleanTrue];

  if (v9)
  {
    [(NavdRecentLocationsServer *)self beginServicingConnection:v7];
    uint64_t v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEORecentLocationsXPCInterface];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    [v10 setClasses:v12 forSelector:"requestRecentLocationsWithResponse:" argumentIndex:0 ofReply:1];
    [v7 setExportedInterface:v10];
    [v7 setExportedObject:self];
    objc_initWeak(&location, v7);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A650;
    v14[3] = &unk_100088FF8;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    [v7 setInvalidationHandler:v14];
    [v7 resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)beginServicingConnection:(id)a3
{
  id v4 = a3;
  peersQueue = self->_peersQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A744;
  v7[3] = &unk_1000891A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(peersQueue, v7);
}

- (void)endServicingConnection:(id)a3
{
  id v4 = a3;
  peersQueue = self->_peersQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A7E8;
  v7[3] = &unk_1000891A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(peersQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_peers, 0);
}

@end