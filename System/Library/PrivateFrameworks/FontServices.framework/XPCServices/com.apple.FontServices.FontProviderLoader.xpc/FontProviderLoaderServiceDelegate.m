@interface FontProviderLoaderServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation FontProviderLoaderServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontProviderProtocol];
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  [v5 setClasses:v13 forSelector:"registerFonts:enabled:sceneID:appInfo:completionHandler:" argumentIndex:0 ofReply:0];
  [v5 setClasses:v7 forSelector:"registerFonts:enabled:sceneID:appInfo:completionHandler:" argumentIndex:0 ofReply:1];
  [v5 setClasses:v13 forSelector:"registerFonts:enabled:sceneID:appInfo:completionHandler:" argumentIndex:1 ofReply:1];
  [v5 setClasses:v13 forSelector:"unregisterFonts:appInfo:completionHandler:" argumentIndex:0 ofReply:0];
  [v5 setClasses:v7 forSelector:"unregisterFonts:appInfo:completionHandler:" argumentIndex:0 ofReply:1];
  [v5 setClasses:v13 forSelector:"unregisterFonts:appInfo:completionHandler:" argumentIndex:1 ofReply:1];
  [v5 setClasses:v13 forSelector:"registeredFontsInfo:appInfo:completionHandler:" argumentIndex:0 ofReply:1];
  [v4 setExportedInterface:v5];
  v14 = objc_alloc_init(FontProviderLoader);
  [v4 setExportedObject:v14];

  [v4 resume];
  return 1;
}

@end