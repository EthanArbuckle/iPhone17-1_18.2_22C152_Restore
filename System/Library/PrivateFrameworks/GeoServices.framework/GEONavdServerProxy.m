@interface GEONavdServerProxy
- (GEONavdServerProxy)init;
- (void)close;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5;
- (void)forceCacheRefresh;
- (void)getDirectionsForClient:(id)a3 withRouteHypothesisRequest:(id)a4 andCallback:(id)a5;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4;
- (void)open;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4;
- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6;
- (void)statusWithCallback:(id)a3;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
@end

@implementation GEONavdServerProxy

- (GEONavdServerProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEONavdServerProxy;
  return [(GEONavdServerProxy *)&v3 init];
}

- (void)open
{
}

- (void)close
{
}

- (void)statusWithCallback:(id)a3
{
}

- (void)getDirectionsForClient:(id)a3 withRouteHypothesisRequest:(id)a4 andCallback:(id)a5
{
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
}

- (void)forceCacheRefresh
{
}

@end