@interface CloudSettingsServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CloudSettingsService)service;
- (CloudSettingsServiceDelegate)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4;
- (void)setService:(id)a3;
@end

@implementation CloudSettingsServiceDelegate

- (CloudSettingsServiceDelegate)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CloudSettingsServiceDelegate;
  v8 = [(CloudSettingsServiceDelegate *)&v11 init];
  if (v8)
  {
    v9 = [[CloudSettingsService alloc] initWithStoreIdentifier:v6 settingsMediator:v7];
    [(CloudSettingsServiceDelegate *)v8 setService:v9];
  }
  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  id v7 = [v5 interfaceWithProtocol:&unk_26CA06BE8];
  [v6 setExportedInterface:v7];

  v8 = [(CloudSettingsServiceDelegate *)self service];
  [v6 setExportedObject:v8];

  [v6 resume];
  return 1;
}

- (CloudSettingsService)service
{
  return (CloudSettingsService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end