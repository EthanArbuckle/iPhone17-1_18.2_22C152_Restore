@interface NSXPCInterface
+ (id)_maps_mapsCompanionDaemonXPCClientInterface;
+ (id)_maps_mapsCompanionDaemonXPCInterface;
+ (id)_maps_mapsConnectionBrokerEndpointConsumerInterface;
+ (id)_maps_mapsConnectionBrokerEndpointProviderInterface;
+ (id)_maps_mapsConnectionBrokerEndpointRecorderInterface;
+ (id)_maps_mapsConnectionBrokerEndpointSourceInterface;
@end

@implementation NSXPCInterface

+ (id)_maps_mapsCompanionDaemonXPCInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsCompanionDaemonXPCInterface];
  uint64_t v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"loadDirections:reply:" argumentIndex:0 ofReply:0];

  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:"loadDirections:reply:" argumentIndex:0 ofReply:1];

  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:"startPreparedNavigation:reply:" argumentIndex:0 ofReply:0];

  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:"startPreparedNavigation:reply:" argumentIndex:0 ofReply:1];

  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:"endNavigationWithReply:" argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)_maps_mapsCompanionDaemonXPCClientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsCompanionDaemonXPCClientInterface];
}

+ (id)_maps_mapsConnectionBrokerEndpointSourceInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsConnectionBrokerEndpointSource];
}

+ (id)_maps_mapsConnectionBrokerEndpointConsumerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsConnectionBrokerEndpointConsumer];
}

+ (id)_maps_mapsConnectionBrokerEndpointRecorderInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsConnectionBrokerEndpointRecorder];
}

+ (id)_maps_mapsConnectionBrokerEndpointProviderInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsConnectionBrokerEndpointProvider];
}

@end