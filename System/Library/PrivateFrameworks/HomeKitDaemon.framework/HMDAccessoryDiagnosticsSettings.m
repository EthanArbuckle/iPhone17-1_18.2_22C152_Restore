@interface HMDAccessoryDiagnosticsSettings
- (HAPSupportedDiagnosticsSnapshot)currentSnapshot;
- (HMDAccessoryDiagnosticsSettings)initWithService:(id)a3;
- (HMDService)diagnosticsService;
- (NSString)transport;
- (id)attributeDescriptions;
- (void)setCurrentSnapshot:(id)a3;
@end

@implementation HMDAccessoryDiagnosticsSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diagnosticsService, 0);
}

- (NSString)transport
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (HAPSupportedDiagnosticsSnapshot)currentSnapshot
{
  return (HAPSupportedDiagnosticsSnapshot *)objc_getProperty(self, a2, 16, 1);
}

- (HMDService)diagnosticsService
{
  return (HMDService *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryDiagnosticsSettings *)self transport];
  v5 = (void *)[v3 initWithName:@"transport" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDAccessoryDiagnosticsSettings)initWithService:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryDiagnosticsSettings;
  v6 = [(HMDAccessoryDiagnosticsSettings *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diagnosticsService, a3);
    transport = v7->_transport;
    v7->_transport = (NSString *)@"DataStream";
  }
  return v7;
}

@end