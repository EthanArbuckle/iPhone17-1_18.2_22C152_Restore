@interface RTHelperServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RTHelperServiceListenerDelegate)init;
- (RTHelperServiceListenerProtocol)delegate;
- (void)_configureXpcInterface:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RTHelperServiceListenerDelegate

- (RTHelperServiceListenerDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)RTHelperServiceListenerDelegate;
  v2 = [(RTHelperServiceListenerDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RTHelperServiceProtocol];
    xpcInterface = v2->_xpcInterface;
    v2->_xpcInterface = (NSXPCInterface *)v3;

    [(RTHelperServiceListenerDelegate *)v2 _configureXpcInterface:v2->_xpcInterface];
    uint64_t v5 = objc_opt_new();
    helperService = v2->_helperService;
    v2->_helperService = (RTHelperService *)v5;
  }
  return v2;
}

- (void)_configureXpcInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  [v3 setClasses:v5 forSelector:"fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:" argumentIndex:0 ofReply:0];

  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:"fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:" argumentIndex:1 ofReply:0];

  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  [v3 setClasses:v9 forSelector:"fetchMapItemsFromIdentifiers:options:source:handler:" argumentIndex:0 ofReply:0];

  v10 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v10 forSelector:"fetchPostalAddressForMapItem:options:handler:" argumentIndex:0 ofReply:0];

  v11 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v11 forSelector:"fetchAppClipURLsForMapItem:options:handler:" argumentIndex:0 ofReply:0];

  v12 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v12 forSelector:"fetchPostalAddressForMapItem:options:handler:" argumentIndex:1 ofReply:0];

  v13 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v13 forSelector:"fetchAppClipURLsForMapItem:options:handler:" argumentIndex:1 ofReply:0];

  v14 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v14 forSelector:"fetchBuildingPolygonsFromLocation:radius:handler:" argumentIndex:0 ofReply:0];

  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
  [v3 setClasses:v16 forSelector:"fetchBuildingPolygonsFromLocation:radius:handler:" argumentIndex:0 ofReply:1];

  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v3 setClasses:v17 forSelector:"fetchPointOfInterestAttributesWithIdentifier:options:handler:" argumentIndex:0 ofReply:1];

  uint64_t v18 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v19 forSelector:"fetchPointOfInterestsAroundCoordinate:radius:options:handler:" argumentIndex:0 ofReply:1];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedInterface:self->_xpcInterface];
  [v5 setExportedObject:self->_helperService];
  [v5 resume];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained serviceListener:self didAcceptConnection:v5];
  }

  return 1;
}

- (RTHelperServiceListenerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTHelperServiceListenerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_helperService, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
}

@end