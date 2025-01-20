@interface MapsConnectionBrokerServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MapsConnectionBrokerServer)init;
- (void)dealloc;
- (void)listenerEndpointDidChange:(id)a3 forIdentifier:(id)a4;
- (void)listenerEndpointForIdentifer:(id)a3 reply:(id)a4;
@end

@implementation MapsConnectionBrokerServer

- (MapsConnectionBrokerServer)init
{
  v20.receiver = self;
  v20.super_class = (Class)MapsConnectionBrokerServer;
  v2 = [(MapsConnectionBrokerServer *)&v20 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.MapsConnectionBrokerServer.connections", v3);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Maps.MapsConnectionBrokerServer.endpoints", v6);
    endpointQueue = v2->_endpointQueue;
    v2->_endpointQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    endpointSourceConnections = v2->_endpointSourceConnections;
    v2->_endpointSourceConnections = v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    endpointConsumerConnections = v2->_endpointConsumerConnections;
    v2->_endpointConsumerConnections = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpoints = v2->_endpoints;
    v2->_endpoints = v13;

    uint64_t v15 = +[NSXPCListener _maps_mapsConnectionBrokerEndpointSourceListener];
    endpointSourceListener = v2->_endpointSourceListener;
    v2->_endpointSourceListener = (NSXPCListener *)v15;

    [(NSXPCListener *)v2->_endpointSourceListener setDelegate:v2];
    [(NSXPCListener *)v2->_endpointSourceListener resume];
    uint64_t v17 = +[NSXPCListener _maps_mapsConnectionBrokerEndpointConsumerListener];
    endpointConsumerListener = v2->_endpointConsumerListener;
    v2->_endpointConsumerListener = (NSXPCListener *)v17;

    [(NSXPCListener *)v2->_endpointConsumerListener setDelegate:v2];
    [(NSXPCListener *)v2->_endpointConsumerListener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_endpointSourceListener invalidate];
  [(NSXPCListener *)self->_endpointConsumerListener invalidate];
  [(NSXPCListener *)self->_endpointSourceListener setDelegate:0];
  [(NSXPCListener *)self->_endpointConsumerListener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsConnectionBrokerServer;
  [(MapsConnectionBrokerServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  sub_100014240(OS_LOG_TYPE_INFO, @"MapsConnectionBrokerServer %s %@ %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[MapsConnectionBrokerServer listener:shouldAcceptNewConnection:]");
  if (self->_endpointSourceListener == v6)
  {
    sub_100014240(OS_LOG_TYPE_INFO, @"MapsConnectionBrokerServer Received new endpoint source connection: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
    [v7 setExportedObject:self];
    v21 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointRecorderInterface];
    [v7 setExportedInterface:v21];

    v22 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointSourceInterface];
    [v7 setRemoteObjectInterface:v22];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000CB1C;
    v45[3] = &unk_100038CD0;
    v23 = &v46;
    objc_copyWeak(&v46, &from);
    v24 = &v47;
    objc_copyWeak(&v47, &location);
    [v7 setInvalidationHandler:v45];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000CC10;
    v43[3] = &unk_100038CF8;
    v25 = &v44;
    objc_copyWeak(&v44, &from);
    [v7 setInterruptionHandler:v43];
    connectionQueue = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CC5C;
    block[3] = &unk_100038A18;
    block[4] = self;
    id v27 = v7;
    id v42 = v27;
    dispatch_async(connectionQueue, block);
    [v27 resume];
    v28 = v42;
LABEL_6:

    objc_destroyWeak(v25);
    objc_destroyWeak(v24);
    objc_destroyWeak(v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    BOOL v20 = 1;
    goto LABEL_7;
  }
  if (self->_endpointConsumerListener == v6)
  {
    sub_100014240(OS_LOG_TYPE_INFO, @"MapsConnectionBrokerServer Received new endpoint consumer connection: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
    [v7 setExportedObject:self];
    v29 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointProviderInterface];
    [v7 setExportedInterface:v29];

    v30 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointConsumerInterface];
    [v7 setRemoteObjectInterface:v30];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000CC68;
    v38[3] = &unk_100038CD0;
    v23 = &v39;
    objc_copyWeak(&v39, &from);
    v24 = &v40;
    objc_copyWeak(&v40, &location);
    [v7 setInvalidationHandler:v38];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000CD5C;
    v36[3] = &unk_100038CF8;
    v25 = &v37;
    objc_copyWeak(&v37, &from);
    [v7 setInterruptionHandler:v36];
    v31 = self->_connectionQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000CDA8;
    v34[3] = &unk_100038A18;
    v34[4] = self;
    id v32 = v7;
    id v35 = v32;
    dispatch_async(v31, v34);
    [v32 resume];
    v28 = v35;
    goto LABEL_6;
  }
  BOOL v20 = 0;
LABEL_7:

  return v20;
}

- (void)listenerEndpointForIdentifer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  endpointQueue = self->_endpointQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE78;
  block[3] = &unk_100038B80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(endpointQueue, block);
}

- (void)listenerEndpointDidChange:(id)a3 forIdentifier:(id)a4
{
  id v15 = a3;
  id v16 = a4;
  sub_100014240(OS_LOG_TYPE_INFO, @"MapsConnectionBrokerServer %s %@ %@", v6, v7, v8, v9, v10, v11, (uint64_t)"-[MapsConnectionBrokerServer listenerEndpointDidChange:forIdentifier:]");
  endpointQueue = self->_endpointQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CFC4;
  block[3] = &unk_100038AB8;
  block[4] = self;
  id v18 = v16;
  id v19 = v15;
  id v13 = v15;
  id v14 = v16;
  dispatch_async(endpointQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_endpointQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_endpointConsumerConnections, 0);
  objc_storeStrong((id *)&self->_endpointConsumerListener, 0);
  objc_storeStrong((id *)&self->_endpointSourceConnections, 0);

  objc_storeStrong((id *)&self->_endpointSourceListener, 0);
}

@end