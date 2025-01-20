@interface DESRecordStoreServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation DESRecordStoreServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [[DESRecordStoreServiceProxy alloc] initWithXPCConnection:v4];
  v6 = DESServiceGetXPCInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  [v4 resume];

  return 1;
}

@end