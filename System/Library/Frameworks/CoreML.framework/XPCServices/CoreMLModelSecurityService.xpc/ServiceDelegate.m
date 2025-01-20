@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreMLModelSecurityProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.CoreMLModelSecurity.%lu", [v4 hash]);
  id v7 = objc_claimAutoreleasedReturnValue();
  [v7 UTF8String];
  v8 = (void *)os_transaction_create();
  [v6 setTxn:v8];

  [v4 setExportedObject:v6];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreMLModelSecurityServiceToClientProtocol];
  [v4 setRemoteObjectInterface:v9];

  v10 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_100010328];
  [v6 setClientProxy:v10];
  [v4 resume];

  return 1;
}

@end