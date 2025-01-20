@interface MDMRequestEraseDeviceCommand_ReturnToService
+ (NSSet)allowedCommandKeys;
+ (id)buildRequiredOnlyWithEnabled:(id)a3;
+ (id)buildWithEnabled:(id)a3 wiFiProfileData:(id)a4 mdmProfileData:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSData)commandMDMProfileData;
- (NSData)commandWiFiProfileData;
- (NSNumber)commandEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setCommandEnabled:(id)a3;
- (void)setCommandMDMProfileData:(id)a3;
- (void)setCommandWiFiProfileData:(id)a3;
@end

@implementation MDMRequestEraseDeviceCommand_ReturnToService

+ (NSSet)allowedCommandKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enabled";
  v6[1] = @"WiFiProfileData";
  v6[2] = @"MDMProfileData";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 wiFiProfileData:(id)a4 mdmProfileData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setCommandEnabled:v9];

  [v10 setCommandWiFiProfileData:v8];
  [v10 setCommandMDMProfileData:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandEnabled:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[MDMRequestEraseDeviceCommand_ReturnToService allowedCommandKeys];
  [v11 minusSet:v12];

  if ([v11 count])
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      v14 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v11, *MEMORY[0x263F08320]];
      v19[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];
    }
    goto LABEL_7;
  }
  if (![(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"Enabled" forKeyPath:@"commandEnabled" isRequired:1 defaultValue:0 error:a5])
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  BOOL v16 = 0;
  if ([(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"WiFiProfileData" forKeyPath:@"commandWiFiProfileData" isRequired:0 defaultValue:0 serializationType:v6 error:a5])
  {
    BOOL v16 = [(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"MDMProfileData" forKeyPath:@"commandMDMProfileData" isRequired:0 defaultValue:0 serializationType:v6 error:a5];
  }
LABEL_8:

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(MDMRequestEraseDeviceCommand_ReturnToService *)self commandEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"Enabled" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(MDMRequestEraseDeviceCommand_ReturnToService *)self commandWiFiProfileData];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"WiFiProfileData" value:v7 isRequired:0 defaultValue:0 serializationType:v3];

  id v8 = [(MDMRequestEraseDeviceCommand_ReturnToService *)self commandMDMProfileData];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"MDMProfileData" value:v8 isRequired:0 defaultValue:0 serializationType:v3];

  id v9 = (void *)[v5 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MDMRequestEraseDeviceCommand_ReturnToService;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_commandEnabled copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSData *)self->_commandWiFiProfileData copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSData *)self->_commandMDMProfileData copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)commandEnabled
{
  return self->_commandEnabled;
}

- (void)setCommandEnabled:(id)a3
{
}

- (NSData)commandWiFiProfileData
{
  return self->_commandWiFiProfileData;
}

- (void)setCommandWiFiProfileData:(id)a3
{
}

- (NSData)commandMDMProfileData
{
  return self->_commandMDMProfileData;
}

- (void)setCommandMDMProfileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandMDMProfileData, 0);
  objc_storeStrong((id *)&self->_commandWiFiProfileData, 0);
  objc_storeStrong((id *)&self->_commandEnabled, 0);
}

@end