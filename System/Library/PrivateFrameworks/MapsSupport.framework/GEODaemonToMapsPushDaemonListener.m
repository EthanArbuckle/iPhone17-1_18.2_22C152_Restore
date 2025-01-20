@interface GEODaemonToMapsPushDaemonListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GEODaemonToMapsPushDaemonListener)init;
- (GEODaemonToMapsPushDaemonListener)initWithMapsPushDaemon:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation GEODaemonToMapsPushDaemonListener

- (GEODaemonToMapsPushDaemonListener)init
{
  result = (GEODaemonToMapsPushDaemonListener *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEODaemonToMapsPushDaemonListener)initWithMapsPushDaemon:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEODaemonToMapsPushDaemonListener;
    v5 = [(GEODaemonToMapsPushDaemonListener *)&v11 init];
    p_isa = (id *)&v5->super.isa;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_mapsPushDaemon, v4);
      id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.Maps.mapspushd.geoservices"];
      id v8 = p_isa[2];
      p_isa[2] = v7;

      [p_isa[2] setDelegate:p_isa];
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)resume
{
}

- (void)suspend
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_mapsPushDaemon = &self->_mapsPushDaemon;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapsPushDaemon);
  if (!WeakRetained)
  {
    [v6 invalidate];
    goto LABEL_5;
  }
  v10 = [v7 valueForEntitlement:@"com.apple.Maps.mapspushd.geod"];

  if (!v10)
  {
LABEL_5:
    [v7 invalidate];
    goto LABEL_6;
  }
  objc_super v11 = +[NSXPCInterface geo_MapsNotificationDaemonFromGeodInterface];
  [v7 setExportedInterface:v11];

  id v12 = objc_loadWeakRetained((id *)p_mapsPushDaemon);
  [v7 setExportedObject:v12];

LABEL_6:
  [v7 resume];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingListener, 0);

  objc_destroyWeak((id *)&self->_mapsPushDaemon);
}

@end