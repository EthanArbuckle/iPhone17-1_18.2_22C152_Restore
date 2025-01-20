@interface CEMNetworkCellularDeclaration_AttachAPN
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithName:(id)a3;
+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withAllowedProtocolMask:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAllowedProtocolMask;
- (NSString)payloadAuthenticationType;
- (NSString)payloadName;
- (NSString)payloadPassword;
- (NSString)payloadUsername;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowedProtocolMask:(id)a3;
- (void)setPayloadAuthenticationType:(id)a3;
- (void)setPayloadName:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadUsername:(id)a3;
@end

@implementation CEMNetworkCellularDeclaration_AttachAPN

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Name";
  v6[1] = @"AuthenticationType";
  v6[2] = @"Username";
  v6[3] = @"Password";
  v6[4] = @"AllowedProtocolMask";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withAllowedProtocolMask:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = (__CFString *)a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadName:v15];

  if (v14) {
    v17 = v14;
  }
  else {
    v17 = @"PAP";
  }
  [v16 setPayloadAuthenticationType:v17];

  [v16 setPayloadUsername:v13];
  [v16 setPayloadPassword:v12];

  [v16 setPayloadAllowedProtocolMask:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadName:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkCellularDeclaration_AttachAPN allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationType" isRequired:0 defaultValue:@"PAP" error:&v28];
    id v14 = v28;
    payloadAuthenticationType = self->_payloadAuthenticationType;
    self->_payloadAuthenticationType = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Username" isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadUsername = self->_payloadUsername;
      self->_payloadUsername = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AllowedProtocolMask" isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadAllowedProtocolMask = self->_payloadAllowedProtocolMask;
          self->_payloadAllowedProtocolMask = v22;
        }
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Name" withValue:self->_payloadName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"AuthenticationType" withValue:self->_payloadAuthenticationType isRequired:0 defaultValue:@"PAP"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Username" withValue:self->_payloadUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"AllowedProtocolMask" withValue:self->_payloadAllowedProtocolMask isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMNetworkCellularDeclaration_AttachAPN;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAuthenticationType copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUsername copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadPassword copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowedProtocolMask copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSString)payloadAuthenticationType
{
  return self->_payloadAuthenticationType;
}

- (void)setPayloadAuthenticationType:(id)a3
{
}

- (NSString)payloadUsername
{
  return self->_payloadUsername;
}

- (void)setPayloadUsername:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSNumber)payloadAllowedProtocolMask
{
  return self->_payloadAllowedProtocolMask;
}

- (void)setPayloadAllowedProtocolMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationType, 0);

  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end