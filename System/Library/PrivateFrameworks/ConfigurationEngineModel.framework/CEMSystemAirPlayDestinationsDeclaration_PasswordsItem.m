@interface CEMSystemAirPlayDestinationsDeclaration_PasswordsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDeviceName:(id)a3 withPassword:(id)a4 withDeviceID:(id)a5;
+ (id)buildWithDeviceName:(id)a3 withPassword:(id)a4 withDeviceID:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadDeviceID;
- (NSString)payloadDeviceName;
- (NSString)payloadPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDeviceID:(id)a3;
- (void)setPayloadDeviceName:(id)a3;
- (void)setPayloadPassword:(id)a3;
@end

@implementation CEMSystemAirPlayDestinationsDeclaration_PasswordsItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DeviceName";
  v6[1] = @"Password";
  v6[2] = @"DeviceID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDeviceName:(id)a3 withPassword:(id)a4 withDeviceID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadDeviceName:v9];

  [v10 setPayloadPassword:v8];
  [v10 setPayloadDeviceID:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithDeviceName:(id)a3 withPassword:(id)a4 withDeviceID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadDeviceName:v9];

  [v10 setPayloadPassword:v8];
  [v10 setPayloadDeviceID:v7];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemAirPlayDestinationsDeclaration_PasswordsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeviceName" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadDeviceName = self->_payloadDeviceName;
  self->_payloadDeviceName = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadPassword = self->_payloadPassword;
    self->_payloadPassword = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeviceID" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadDeviceID = self->_payloadDeviceID;
      self->_payloadDeviceID = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DeviceName" withValue:self->_payloadDeviceName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Password" withValue:self->_payloadPassword isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DeviceID" withValue:self->_payloadDeviceID isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemAirPlayDestinationsDeclaration_PasswordsItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDeviceName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPassword copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDeviceID copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadDeviceName
{
  return self->_payloadDeviceName;
}

- (void)setPayloadDeviceName:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSString)payloadDeviceID
{
  return self->_payloadDeviceID;
}

- (void)setPayloadDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDeviceID, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);

  objc_storeStrong((id *)&self->_payloadDeviceName, 0);
}

@end