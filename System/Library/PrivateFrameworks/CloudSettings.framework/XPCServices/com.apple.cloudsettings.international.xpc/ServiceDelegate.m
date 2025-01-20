@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CloudSettingsServiceProtocol];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  id v7 = [objc_alloc((Class)CloudSettingsService) initWithStoreIdentifier:@"com.apple.cloudsettings.international" settingsMediator:v6];
  [v4 setExportedObject:v7];
  [v4 resume];

  return 1;
}

@end