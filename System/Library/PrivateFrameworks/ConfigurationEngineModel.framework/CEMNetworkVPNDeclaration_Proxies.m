@interface CEMNetworkVPNDeclaration_Proxies
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithHTTPEnable:(id)a3 withHTTPPort:(id)a4 withHTTPProxy:(id)a5 withHTTPProxyPassword:(id)a6 withHTTPProxyUsername:(id)a7 withHTTPSEnable:(id)a8 withHTTPSPort:(id)a9 withHTTPSProxy:(id)a10 withProxyAutoConfigEnable:(id)a11 withProxyAutoDiscoveryEnable:(id)a12 withProxyAutoConfigURLString:(id)a13 withSupplementalMatchDomains:(id)a14;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadSupplementalMatchDomains;
- (NSNumber)payloadHTTPEnable;
- (NSNumber)payloadHTTPPort;
- (NSNumber)payloadHTTPSEnable;
- (NSNumber)payloadHTTPSPort;
- (NSNumber)payloadProxyAutoConfigEnable;
- (NSNumber)payloadProxyAutoDiscoveryEnable;
- (NSString)payloadHTTPProxy;
- (NSString)payloadHTTPProxyPassword;
- (NSString)payloadHTTPProxyUsername;
- (NSString)payloadHTTPSProxy;
- (NSString)payloadProxyAutoConfigURLString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadHTTPEnable:(id)a3;
- (void)setPayloadHTTPPort:(id)a3;
- (void)setPayloadHTTPProxy:(id)a3;
- (void)setPayloadHTTPProxyPassword:(id)a3;
- (void)setPayloadHTTPProxyUsername:(id)a3;
- (void)setPayloadHTTPSEnable:(id)a3;
- (void)setPayloadHTTPSPort:(id)a3;
- (void)setPayloadHTTPSProxy:(id)a3;
- (void)setPayloadProxyAutoConfigEnable:(id)a3;
- (void)setPayloadProxyAutoConfigURLString:(id)a3;
- (void)setPayloadProxyAutoDiscoveryEnable:(id)a3;
- (void)setPayloadSupplementalMatchDomains:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_Proxies

+ (NSSet)allowedPayloadKeys
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HTTPEnable";
  v6[1] = @"HTTPPort";
  v6[2] = @"HTTPProxy";
  v6[3] = @"HTTPProxyPassword";
  v6[4] = @"HTTPProxyUsername";
  v6[5] = @"HTTPSEnable";
  v6[6] = @"HTTPSPort";
  v6[7] = @"HTTPSProxy";
  v6[8] = @"ProxyAutoConfigEnable";
  v6[9] = @"ProxyAutoDiscoveryEnable";
  v6[10] = @"ProxyAutoConfigURLString";
  v6[11] = @"SupplementalMatchDomains";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithHTTPEnable:(id)a3 withHTTPPort:(id)a4 withHTTPProxy:(id)a5 withHTTPProxyPassword:(id)a6 withHTTPProxyUsername:(id)a7 withHTTPSEnable:(id)a8 withHTTPSPort:(id)a9 withHTTPSProxy:(id)a10 withProxyAutoConfigEnable:(id)a11 withProxyAutoDiscoveryEnable:(id)a12 withProxyAutoConfigURLString:(id)a13 withSupplementalMatchDomains:(id)a14
{
  id v37 = a14;
  id v36 = a13;
  id v19 = a12;
  id v35 = a11;
  id v34 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = objc_opt_new();
  v28 = v27;
  if (v26) {
    v29 = v26;
  }
  else {
    v29 = &unk_26C894850;
  }
  objc_msgSend(v27, "setPayloadHTTPEnable:", v29, CEMNetworkVPNDeclaration_Proxies);

  [v28 setPayloadHTTPPort:v25];
  [v28 setPayloadHTTPProxy:v24];

  [v28 setPayloadHTTPProxyPassword:v23];
  [v28 setPayloadHTTPProxyUsername:v22];

  if (v21) {
    v30 = v21;
  }
  else {
    v30 = &unk_26C894850;
  }
  [v28 setPayloadHTTPSEnable:v30];

  [v28 setPayloadHTTPSPort:v20];
  [v28 setPayloadHTTPSProxy:v34];

  [v28 setPayloadProxyAutoConfigEnable:v35];
  if (v19) {
    v31 = v19;
  }
  else {
    v31 = &unk_26C894868;
  }
  [v28 setPayloadProxyAutoDiscoveryEnable:v31];

  [v28 setPayloadProxyAutoConfigURLString:v36];
  [v28 setPayloadSupplementalMatchDomains:v37];

  return v28;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_Proxies allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v50 = 0;
  v13 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"HTTPEnable" isRequired:0 defaultValue:&unk_26C894850 error:&v50];
  id v14 = v50;
  payloadHTTPEnable = self->_payloadHTTPEnable;
  self->_payloadHTTPEnable = v13;

  if (!v14)
  {
    id v49 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"HTTPPort" isRequired:0 defaultValue:0 error:&v49];
    id v14 = v49;
    payloadHTTPPort = self->_payloadHTTPPort;
    self->_payloadHTTPPort = v16;

    if (!v14)
    {
      id v48 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HTTPProxy" isRequired:0 defaultValue:0 error:&v48];
      id v14 = v48;
      payloadHTTPProxy = self->_payloadHTTPProxy;
      self->_payloadHTTPProxy = v18;

      if (!v14)
      {
        id v47 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HTTPProxyPassword" isRequired:0 defaultValue:0 error:&v47];
        id v14 = v47;
        payloadHTTPProxyPassword = self->_payloadHTTPProxyPassword;
        self->_payloadHTTPProxyPassword = v20;

        if (!v14)
        {
          id v46 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HTTPProxyUsername" isRequired:0 defaultValue:0 error:&v46];
          id v14 = v46;
          payloadHTTPProxyUsername = self->_payloadHTTPProxyUsername;
          self->_payloadHTTPProxyUsername = v22;

          if (!v14)
          {
            id v45 = 0;
            id v24 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"HTTPSEnable" isRequired:0 defaultValue:&unk_26C894850 error:&v45];
            id v14 = v45;
            payloadHTTPSEnable = self->_payloadHTTPSEnable;
            self->_payloadHTTPSEnable = v24;

            if (!v14)
            {
              id v44 = 0;
              id v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"HTTPSPort" isRequired:0 defaultValue:0 error:&v44];
              id v14 = v44;
              payloadHTTPSPort = self->_payloadHTTPSPort;
              self->_payloadHTTPSPort = v26;

              if (!v14)
              {
                id v43 = 0;
                v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HTTPSProxy" isRequired:0 defaultValue:0 error:&v43];
                id v14 = v43;
                payloadHTTPSProxy = self->_payloadHTTPSProxy;
                self->_payloadHTTPSProxy = v28;

                if (!v14)
                {
                  id v42 = 0;
                  v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ProxyAutoConfigEnable" isRequired:0 defaultValue:0 error:&v42];
                  id v14 = v42;
                  payloadProxyAutoConfigEnable = self->_payloadProxyAutoConfigEnable;
                  self->_payloadProxyAutoConfigEnable = v30;

                  if (!v14)
                  {
                    id v41 = 0;
                    v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ProxyAutoDiscoveryEnable" isRequired:0 defaultValue:&unk_26C894868 error:&v41];
                    id v14 = v41;
                    payloadProxyAutoDiscoveryEnable = self->_payloadProxyAutoDiscoveryEnable;
                    self->_payloadProxyAutoDiscoveryEnable = v32;

                    if (!v14)
                    {
                      id v40 = 0;
                      id v34 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProxyAutoConfigURLString" isRequired:0 defaultValue:0 error:&v40];
                      id v14 = v40;
                      payloadProxyAutoConfigURLString = self->_payloadProxyAutoConfigURLString;
                      self->_payloadProxyAutoConfigURLString = v34;

                      if (!v14)
                      {
                        id v39 = 0;
                        id v36 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SupplementalMatchDomains" validator:&__block_literal_global_1026 isRequired:0 defaultValue:0 error:&v39];
                        id v14 = v39;
                        payloadSupplementalMatchDomains = self->_payloadSupplementalMatchDomains;
                        self->_payloadSupplementalMatchDomains = v36;
                      }
                    }
                  }
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
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"HTTPEnable" withValue:self->_payloadHTTPEnable isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"HTTPPort" withValue:self->_payloadHTTPPort isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HTTPProxy" withValue:self->_payloadHTTPProxy isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HTTPProxyPassword" withValue:self->_payloadHTTPProxyPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HTTPProxyUsername" withValue:self->_payloadHTTPProxyUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"HTTPSEnable" withValue:self->_payloadHTTPSEnable isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"HTTPSPort" withValue:self->_payloadHTTPSPort isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HTTPSProxy" withValue:self->_payloadHTTPSProxy isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ProxyAutoConfigEnable" withValue:self->_payloadProxyAutoConfigEnable isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ProxyAutoDiscoveryEnable" withValue:self->_payloadProxyAutoDiscoveryEnable isRequired:0 defaultValue:&unk_26C894868];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProxyAutoConfigURLString" withValue:self->_payloadProxyAutoConfigURLString isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SupplementalMatchDomains" withValue:self->_payloadSupplementalMatchDomains itemSerializer:&__block_literal_global_1028 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CEMNetworkVPNDeclaration_Proxies;
  v4 = [(CEMPayloadBase *)&v30 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadHTTPEnable copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadHTTPPort copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadHTTPProxy copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadHTTPProxyPassword copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadHTTPProxyUsername copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadHTTPSEnable copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadHTTPSPort copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_payloadHTTPSProxy copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadProxyAutoConfigEnable copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadProxyAutoDiscoveryEnable copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSString *)self->_payloadProxyAutoConfigURLString copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSArray *)self->_payloadSupplementalMatchDomains copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSNumber)payloadHTTPEnable
{
  return self->_payloadHTTPEnable;
}

- (void)setPayloadHTTPEnable:(id)a3
{
}

- (NSNumber)payloadHTTPPort
{
  return self->_payloadHTTPPort;
}

- (void)setPayloadHTTPPort:(id)a3
{
}

- (NSString)payloadHTTPProxy
{
  return self->_payloadHTTPProxy;
}

- (void)setPayloadHTTPProxy:(id)a3
{
}

- (NSString)payloadHTTPProxyPassword
{
  return self->_payloadHTTPProxyPassword;
}

- (void)setPayloadHTTPProxyPassword:(id)a3
{
}

- (NSString)payloadHTTPProxyUsername
{
  return self->_payloadHTTPProxyUsername;
}

- (void)setPayloadHTTPProxyUsername:(id)a3
{
}

- (NSNumber)payloadHTTPSEnable
{
  return self->_payloadHTTPSEnable;
}

- (void)setPayloadHTTPSEnable:(id)a3
{
}

- (NSNumber)payloadHTTPSPort
{
  return self->_payloadHTTPSPort;
}

- (void)setPayloadHTTPSPort:(id)a3
{
}

- (NSString)payloadHTTPSProxy
{
  return self->_payloadHTTPSProxy;
}

- (void)setPayloadHTTPSProxy:(id)a3
{
}

- (NSNumber)payloadProxyAutoConfigEnable
{
  return self->_payloadProxyAutoConfigEnable;
}

- (void)setPayloadProxyAutoConfigEnable:(id)a3
{
}

- (NSNumber)payloadProxyAutoDiscoveryEnable
{
  return self->_payloadProxyAutoDiscoveryEnable;
}

- (void)setPayloadProxyAutoDiscoveryEnable:(id)a3
{
}

- (NSString)payloadProxyAutoConfigURLString
{
  return self->_payloadProxyAutoConfigURLString;
}

- (void)setPayloadProxyAutoConfigURLString:(id)a3
{
}

- (NSArray)payloadSupplementalMatchDomains
{
  return self->_payloadSupplementalMatchDomains;
}

- (void)setPayloadSupplementalMatchDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoConfigURLString, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoDiscoveryEnable, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoConfigEnable, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSProxy, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSPort, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSEnable, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxy, 0);
  objc_storeStrong((id *)&self->_payloadHTTPPort, 0);

  objc_storeStrong((id *)&self->_payloadHTTPEnable, 0);
}

@end