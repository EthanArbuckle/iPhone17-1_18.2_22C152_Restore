@interface GEOOfflinePeriodicTelemetryProvider
- (GEOOfflinePeriodicTelemetryProvider)init;
- (void)reportTelemetryForType:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation GEOOfflinePeriodicTelemetryProvider

- (GEOOfflinePeriodicTelemetryProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOOfflinePeriodicTelemetryProvider;
  v2 = [(GEOOfflinePeriodicTelemetryProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)reportTelemetryForType:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = +[GEOMapDataSubscriptionManager sharedManager];
  global_queue = (void *)geo_get_global_queue();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003AC94;
  v9[3] = &unk_100072E18;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 fetchAllSubscriptionsWithCallbackQueue:global_queue completionHandler:v9];
}

- (void).cxx_destruct
{
}

@end