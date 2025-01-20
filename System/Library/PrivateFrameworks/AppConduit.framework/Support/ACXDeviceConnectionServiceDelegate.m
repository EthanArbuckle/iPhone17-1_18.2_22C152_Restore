@interface ACXDeviceConnectionServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ACXDeviceConnectionServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[ACXDeviceConnectionProtocolInterface interface];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  v7 = +[ACXDeviceConnectionDelegateProtocolInterface interface];
  [v4 setRemoteObjectInterface:v7];

  [v6 setXpcConnection:v4];
  [v4 setInterruptionHandler:&stru_10008E0F0];
  [v4 setInvalidationHandler:&stru_10008E110];
  [v4 resume];

  return 1;
}

@end