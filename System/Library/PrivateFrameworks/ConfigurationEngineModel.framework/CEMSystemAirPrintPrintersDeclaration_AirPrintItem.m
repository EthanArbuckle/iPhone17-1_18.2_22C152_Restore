@interface CEMSystemAirPrintPrintersDeclaration_AirPrintItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithIPAddress:(id)a3 withResourcePath:(id)a4;
+ (id)buildWithIPAddress:(id)a3 withResourcePath:(id)a4 withPort:(id)a5 withForceTLS:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadForceTLS;
- (NSNumber)payloadPort;
- (NSString)payloadIPAddress;
- (NSString)payloadResourcePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadForceTLS:(id)a3;
- (void)setPayloadIPAddress:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadResourcePath:(id)a3;
@end

@implementation CEMSystemAirPrintPrintersDeclaration_AirPrintItem

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"IPAddress";
  v6[1] = @"ResourcePath";
  v6[2] = @"Port";
  v6[3] = @"ForceTLS";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIPAddress:(id)a3 withResourcePath:(id)a4 withPort:(id)a5 withForceTLS:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadIPAddress:v12];

  [v13 setPayloadResourcePath:v11];
  [v13 setPayloadPort:v10];

  if (v9) {
    id v14 = v9;
  }
  else {
    id v14 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadForceTLS:v14];

  return v13;
}

+ (id)buildRequiredOnlyWithIPAddress:(id)a3 withResourcePath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadIPAddress:v6];

  [v7 setPayloadResourcePath:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSystemAirPrintPrintersDeclaration_AirPrintItem allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IPAddress" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadIPAddress = self->_payloadIPAddress;
  self->_payloadIPAddress = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ResourcePath" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadResourcePath = self->_payloadResourcePath;
    self->_payloadResourcePath = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Port" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadPort = self->_payloadPort;
      self->_payloadPort = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ForceTLS" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v23];
        id v14 = v23;
        payloadForceTLS = self->_payloadForceTLS;
        self->_payloadForceTLS = v20;
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"IPAddress" withValue:self->_payloadIPAddress isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ResourcePath" withValue:self->_payloadResourcePath isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Port" withValue:self->_payloadPort isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ForceTLS" withValue:self->_payloadForceTLS isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSystemAirPrintPrintersDeclaration_AirPrintItem;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadIPAddress copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadResourcePath copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadPort copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadForceTLS copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadIPAddress
{
  return self->_payloadIPAddress;
}

- (void)setPayloadIPAddress:(id)a3
{
}

- (NSString)payloadResourcePath
{
  return self->_payloadResourcePath;
}

- (void)setPayloadResourcePath:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (NSNumber)payloadForceTLS
{
  return self->_payloadForceTLS;
}

- (void)setPayloadForceTLS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceTLS, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadResourcePath, 0);

  objc_storeStrong((id *)&self->_payloadIPAddress, 0);
}

@end