@interface NSXPCInterface
+ (id)_maps_mapsConnectionBrokerEndpointConsumerInterface;
+ (id)_maps_mapsConnectionBrokerEndpointProviderInterface;
+ (id)_maps_mapsConnectionBrokerEndpointRecorderInterface;
+ (id)_maps_mapsConnectionBrokerEndpointSourceInterface;
+ (id)_maps_mapsSiriXPCClientInterface;
+ (id)_maps_mapsSiriXPCInterface;
@end

@implementation NSXPCInterface

+ (id)_maps_mapsSiriXPCInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSiriXPCInterface];
  uint64_t v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"handleTrafficeReroute:reply:" argumentIndex:0 ofReply:0];

  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:"handleTrafficeReroute:reply:" argumentIndex:0 ofReply:1];

  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:"endNavigationWithReply:" argumentIndex:0 ofReply:1];

  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:"getGuidanceState:reply:" argumentIndex:0 ofReply:0];

  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:"getGuidanceState:reply:" argumentIndex:0 ofReply:1];

  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:"repeatLastReroutePromptWithReply:" argumentIndex:0 ofReply:1];

  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:"repeatLastGuidanceInstructionWithReply:" argumentIndex:0 ofReply:1];

  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:"loadDirections:reply:" argumentIndex:0 ofReply:0];

  uint64_t v19 = objc_opt_class();
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:"loadDirections:reply:" argumentIndex:0 ofReply:1];

  uint64_t v21 = objc_opt_class();
  v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(), 0);
  [v2 setClasses:v22 forSelector:"startPreparedNavigation:reply:" argumentIndex:0 ofReply:0];

  uint64_t v23 = objc_opt_class();
  v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(), 0);
  [v2 setClasses:v24 forSelector:"startPreparedNavigation:reply:" argumentIndex:0 ofReply:1];

  uint64_t v25 = objc_opt_class();
  v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:"setNavigationMuted:" argumentIndex:0 ofReply:0];

  uint64_t v27 = objc_opt_class();
  v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, objc_opt_class(), 0);
  [v2 setClasses:v28 forSelector:"setNavigationVoiceVolume:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_maps_mapsSiriXPCClientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSiriXPCClientInterface];
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