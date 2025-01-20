@interface CEMNetworkCellularDeclaration_APNsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithName:(id)a3;
+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withProxyServer:(id)a7 withProxyPort:(id)a8 withDefaultProtocolMask:(id)a9 withAllowedProtocolMask:(id)a10 withAllowedProtocolMaskInRoaming:(id)a11;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAllowedProtocolMask;
- (NSNumber)payloadAllowedProtocolMaskInRoaming;
- (NSNumber)payloadDefaultProtocolMask;
- (NSNumber)payloadProxyPort;
- (NSString)payloadAuthenticationType;
- (NSString)payloadName;
- (NSString)payloadPassword;
- (NSString)payloadProxyServer;
- (NSString)payloadUsername;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowedProtocolMask:(id)a3;
- (void)setPayloadAllowedProtocolMaskInRoaming:(id)a3;
- (void)setPayloadAuthenticationType:(id)a3;
- (void)setPayloadDefaultProtocolMask:(id)a3;
- (void)setPayloadName:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadProxyPort:(id)a3;
- (void)setPayloadProxyServer:(id)a3;
- (void)setPayloadUsername:(id)a3;
@end

@implementation CEMNetworkCellularDeclaration_APNsItem

+ (NSSet)allowedPayloadKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Name";
  v6[1] = @"AuthenticationType";
  v6[2] = @"Username";
  v6[3] = @"Password";
  v6[4] = @"ProxyServer";
  v6[5] = @"ProxyPort";
  v6[6] = @"DefaultProtocolMask";
  v6[7] = @"AllowedProtocolMask";
  v6[8] = @"AllowedProtocolMaskInRoaming";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withProxyServer:(id)a7 withProxyPort:(id)a8 withDefaultProtocolMask:(id)a9 withAllowedProtocolMask:(id)a10 withAllowedProtocolMaskInRoaming:(id)a11
{
  id v28 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  v23 = (__CFString *)a4;
  id v24 = a3;
  v25 = objc_opt_new();
  [v25 setPayloadName:v24];

  if (v23) {
    v26 = v23;
  }
  else {
    v26 = @"PAP";
  }
  [v25 setPayloadAuthenticationType:v26];

  [v25 setPayloadUsername:v22];
  [v25 setPayloadPassword:v21];

  [v25 setPayloadProxyServer:v20];
  [v25 setPayloadProxyPort:v19];

  [v25 setPayloadDefaultProtocolMask:v18];
  [v25 setPayloadAllowedProtocolMask:v17];

  [v25 setPayloadAllowedProtocolMaskInRoaming:v28];

  return v25;
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

  v10 = +[CEMNetworkCellularDeclaration_APNsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v41 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:1 defaultValue:0 error:&v41];
  id v14 = v41;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    id v40 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationType" isRequired:0 defaultValue:@"PAP" error:&v40];
    id v14 = v40;
    payloadAuthenticationType = self->_payloadAuthenticationType;
    self->_payloadAuthenticationType = v16;

    if (!v14)
    {
      id v39 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Username" isRequired:0 defaultValue:0 error:&v39];
      id v14 = v39;
      payloadUsername = self->_payloadUsername;
      self->_payloadUsername = v18;

      if (!v14)
      {
        id v38 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v38];
        id v14 = v38;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;

        if (!v14)
        {
          id v37 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyServer" isRequired:0 defaultValue:0 error:&v37];
          id v14 = v37;
          payloadProxyServer = self->_payloadProxyServer;
          self->_payloadProxyServer = v22;

          if (!v14)
          {
            id v36 = 0;
            id v24 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ProxyPort" isRequired:0 defaultValue:0 error:&v36];
            id v14 = v36;
            payloadProxyPort = self->_payloadProxyPort;
            self->_payloadProxyPort = v24;

            if (!v14)
            {
              id v35 = 0;
              v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DefaultProtocolMask" isRequired:0 defaultValue:0 error:&v35];
              id v14 = v35;
              payloadDefaultProtocolMask = self->_payloadDefaultProtocolMask;
              self->_payloadDefaultProtocolMask = v26;

              if (!v14)
              {
                id v34 = 0;
                id v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AllowedProtocolMask" isRequired:0 defaultValue:0 error:&v34];
                id v14 = v34;
                payloadAllowedProtocolMask = self->_payloadAllowedProtocolMask;
                self->_payloadAllowedProtocolMask = v28;

                if (!v14)
                {
                  id v33 = 0;
                  v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AllowedProtocolMaskInRoaming" isRequired:0 defaultValue:0 error:&v33];
                  id v14 = v33;
                  payloadAllowedProtocolMaskInRoaming = self->_payloadAllowedProtocolMaskInRoaming;
                  self->_payloadAllowedProtocolMaskInRoaming = v30;
                }
              }
            }
          }
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyServer" withValue:self->_payloadProxyServer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ProxyPort" withValue:self->_payloadProxyPort isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"DefaultProtocolMask" withValue:self->_payloadDefaultProtocolMask isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"AllowedProtocolMask" withValue:self->_payloadAllowedProtocolMask isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"AllowedProtocolMaskInRoaming" withValue:self->_payloadAllowedProtocolMaskInRoaming isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CEMNetworkCellularDeclaration_APNsItem;
  v4 = [(CEMPayloadBase *)&v24 copyWithZone:a3];
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
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadProxyServer copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadProxyPort copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadDefaultProtocolMask copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowedProtocolMask copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowedProtocolMaskInRoaming copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

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

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
}

- (NSNumber)payloadProxyPort
{
  return self->_payloadProxyPort;
}

- (void)setPayloadProxyPort:(id)a3
{
}

- (NSNumber)payloadDefaultProtocolMask
{
  return self->_payloadDefaultProtocolMask;
}

- (void)setPayloadDefaultProtocolMask:(id)a3
{
}

- (NSNumber)payloadAllowedProtocolMask
{
  return self->_payloadAllowedProtocolMask;
}

- (void)setPayloadAllowedProtocolMask:(id)a3
{
}

- (NSNumber)payloadAllowedProtocolMaskInRoaming
{
  return self->_payloadAllowedProtocolMaskInRoaming;
}

- (void)setPayloadAllowedProtocolMaskInRoaming:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMaskInRoaming, 0);
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadDefaultProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadProxyPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationType, 0);

  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end