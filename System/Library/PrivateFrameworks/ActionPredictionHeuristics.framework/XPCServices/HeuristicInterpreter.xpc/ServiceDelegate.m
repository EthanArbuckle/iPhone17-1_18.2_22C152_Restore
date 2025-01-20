@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___HeuristicInterpreterProtocol];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v5 setClasses:v8 forSelector:"actionsAndExpirersForHeuristicsExcept:bundlePath:now:dataSourcesEndpoint:reply:" argumentIndex:0 ofReply:1];

  [v4 setExportedInterface:v5];
  v9 = objc_opt_new();
  [v4 setExportedObject:v9];
  [v4 resume];

  return 1;
}

@end