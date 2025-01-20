@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.siri.sync_deep_verification"];

  if (v5)
  {
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DeepSyncVerificationServiceProtocol];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v7 = +[NSArray arrayWithObjects:v11 count:2];
    v8 = +[NSSet setWithArray:v7];
    [v6 setClasses:v8 forSelector:"getVerificationResultsWithHandler:" argumentIndex:0 ofReply:1];

    [v4 setExportedInterface:v6];
    v9 = objc_opt_new();
    [v4 setExportedObject:v9];
    [v4 resume];
  }
  return v5 != 0;
}

@end