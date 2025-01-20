@interface CEMNetworkGlobalHTTPProxyDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProxyServer:(id)a4 withProxyServerPort:(id)a5 withProxyPACURL:(id)a6;
+ (id)buildWithIdentifier:(id)a3 withProxyType:(id)a4 withProxyServer:(id)a5 withProxyServerPort:(id)a6 withProxyUsername:(id)a7 withProxyPassword:(id)a8 withProxyPACURL:(id)a9 withProxyPACFallbackAllowed:(id)a10 withProxyCaptiveLoginAllowed:(id)a11;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadProxyCaptiveLoginAllowed;
- (NSNumber)payloadProxyPACFallbackAllowed;
- (NSNumber)payloadProxyServerPort;
- (NSString)payloadProxyPACURL;
- (NSString)payloadProxyPassword;
- (NSString)payloadProxyServer;
- (NSString)payloadProxyType;
- (NSString)payloadProxyUsername;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadProxyCaptiveLoginAllowed:(id)a3;
- (void)setPayloadProxyPACFallbackAllowed:(id)a3;
- (void)setPayloadProxyPACURL:(id)a3;
- (void)setPayloadProxyPassword:(id)a3;
- (void)setPayloadProxyServer:(id)a3;
- (void)setPayloadProxyServerPort:(id)a3;
- (void)setPayloadProxyType:(id)a3;
- (void)setPayloadProxyUsername:(id)a3;
@end

@implementation CEMNetworkGlobalHTTPProxyDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.proxy.http.global";
}

+ (id)profileType
{
  return @"com.apple.proxy.http.global";
}

+ (NSSet)allowedPayloadKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProxyType";
  v6[1] = @"ProxyServer";
  v6[2] = @"ProxyServerPort";
  v6[3] = @"ProxyUsername";
  v6[4] = @"ProxyPassword";
  v6[5] = @"ProxyPACURL";
  v6[6] = @"ProxyPACFallbackAllowed";
  v6[7] = @"ProxyCaptiveLoginAllowed";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withProxyType:(id)a4 withProxyServer:(id)a5 withProxyServerPort:(id)a6 withProxyUsername:(id)a7 withProxyPassword:(id)a8 withProxyPACURL:(id)a9 withProxyPACFallbackAllowed:(id)a10 withProxyCaptiveLoginAllowed:(id)a11
{
  id v16 = a3;
  id v17 = a11;
  id v18 = a10;
  v19 = v16;
  id v33 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  v24 = (__CFString *)a4;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.network.proxy.http.global"];
  if (v19)
  {
    [v25 setDeclarationIdentifier:v19];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    v19 = 0;
  }
  if (v24) {
    v28 = v24;
  }
  else {
    v28 = @"Manual";
  }
  [v25 setPayloadProxyType:v28];

  [v25 setPayloadProxyServer:v23];
  [v25 setPayloadProxyServerPort:v22];

  [v25 setPayloadProxyUsername:v21];
  [v25 setPayloadProxyPassword:v20];

  [v25 setPayloadProxyPACURL:v33];
  v29 = (void *)MEMORY[0x263EFFA80];
  if (v18) {
    id v30 = v18;
  }
  else {
    id v30 = (id)MEMORY[0x263EFFA80];
  }
  [v25 setPayloadProxyPACFallbackAllowed:v30];

  if (v17) {
    id v31 = v17;
  }
  else {
    id v31 = v29;
  }
  [v25 setPayloadProxyCaptiveLoginAllowed:v31];

  [v25 updateServerHash];

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProxyServer:(id)a4 withProxyServerPort:(id)a5 withProxyPACURL:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.network.proxy.http.global"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadProxyServer:v12];

  [v13 setPayloadProxyServerPort:v11];
  [v13 setPayloadProxyPACURL:v10];

  [v13 updateServerHash];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkGlobalHTTPProxyDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v38 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyType" isRequired:0 defaultValue:@"Manual" error:&v38];
  id v14 = v38;
  payloadProxyType = self->_payloadProxyType;
  self->_payloadProxyType = v13;

  if (!v14)
  {
    id v37 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyServer" isRequired:1 defaultValue:0 error:&v37];
    id v14 = v37;
    payloadProxyServer = self->_payloadProxyServer;
    self->_payloadProxyServer = v16;

    if (!v14)
    {
      id v36 = 0;
      id v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ProxyServerPort" isRequired:1 defaultValue:0 error:&v36];
      id v14 = v36;
      payloadProxyServerPort = self->_payloadProxyServerPort;
      self->_payloadProxyServerPort = v18;

      if (!v14)
      {
        id v35 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyUsername" isRequired:0 defaultValue:0 error:&v35];
        id v14 = v35;
        payloadProxyUsername = self->_payloadProxyUsername;
        self->_payloadProxyUsername = v20;

        if (!v14)
        {
          id v34 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyPassword" isRequired:0 defaultValue:0 error:&v34];
          id v14 = v34;
          payloadProxyPassword = self->_payloadProxyPassword;
          self->_payloadProxyPassword = v22;

          if (!v14)
          {
            id v33 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyPACURL" isRequired:1 defaultValue:0 error:&v33];
            id v14 = v33;
            payloadProxyPACURL = self->_payloadProxyPACURL;
            self->_payloadProxyPACURL = v24;

            if (!v14)
            {
              id v32 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ProxyPACFallbackAllowed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v32];
              id v14 = v32;
              payloadProxyPACFallbackAllowed = self->_payloadProxyPACFallbackAllowed;
              self->_payloadProxyPACFallbackAllowed = v26;

              if (!v14)
              {
                id v31 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ProxyCaptiveLoginAllowed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v31];
                id v14 = v31;
                payloadProxyCaptiveLoginAllowed = self->_payloadProxyCaptiveLoginAllowed;
                self->_payloadProxyCaptiveLoginAllowed = v28;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyType" withValue:self->_payloadProxyType isRequired:0 defaultValue:@"Manual"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyServer" withValue:self->_payloadProxyServer isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ProxyServerPort" withValue:self->_payloadProxyServerPort isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyUsername" withValue:self->_payloadProxyUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyPassword" withValue:self->_payloadProxyPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyPACURL" withValue:self->_payloadProxyPACURL isRequired:1 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ProxyPACFallbackAllowed" withValue:self->_payloadProxyPACFallbackAllowed isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ProxyCaptiveLoginAllowed" withValue:self->_payloadProxyCaptiveLoginAllowed isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CEMNetworkGlobalHTTPProxyDeclaration;
  v4 = [(CEMDeclarationBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadProxyType copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadProxyServer copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadProxyServerPort copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadProxyUsername copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadProxyPassword copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadProxyPACURL copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadProxyPACFallbackAllowed copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadProxyCaptiveLoginAllowed copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (NSString)payloadProxyType
{
  return self->_payloadProxyType;
}

- (void)setPayloadProxyType:(id)a3
{
}

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
}

- (NSNumber)payloadProxyServerPort
{
  return self->_payloadProxyServerPort;
}

- (void)setPayloadProxyServerPort:(id)a3
{
}

- (NSString)payloadProxyUsername
{
  return self->_payloadProxyUsername;
}

- (void)setPayloadProxyUsername:(id)a3
{
}

- (NSString)payloadProxyPassword
{
  return self->_payloadProxyPassword;
}

- (void)setPayloadProxyPassword:(id)a3
{
}

- (NSString)payloadProxyPACURL
{
  return self->_payloadProxyPACURL;
}

- (void)setPayloadProxyPACURL:(id)a3
{
}

- (NSNumber)payloadProxyPACFallbackAllowed
{
  return self->_payloadProxyPACFallbackAllowed;
}

- (void)setPayloadProxyPACFallbackAllowed:(id)a3
{
}

- (NSNumber)payloadProxyCaptiveLoginAllowed
{
  return self->_payloadProxyCaptiveLoginAllowed;
}

- (void)setPayloadProxyCaptiveLoginAllowed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProxyCaptiveLoginAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadProxyServerPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);

  objc_storeStrong((id *)&self->_payloadProxyType, 0);
}

@end