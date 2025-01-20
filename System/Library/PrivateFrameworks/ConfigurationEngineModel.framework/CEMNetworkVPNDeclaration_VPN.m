@interface CEMNetworkVPNDeclaration_VPN
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withAuthenticationMethod:(id)a5 withPayloadCertificateUUID:(id)a6 withOnDemandEnabled:(id)a7 withOnDemandMatchDomainsAlways:(id)a8 withOnDemandMatchDomainsNever:(id)a9 withOnDemandMatchDomainsOnRetry:(id)a10 withOnDemandRules:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13 withRemoteAddress:(id)a14 withPassword:(id)a15 withProviderBundleIdentifier:(id)a16;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadOnDemandMatchDomainsAlways;
- (NSArray)payloadOnDemandMatchDomainsNever;
- (NSArray)payloadOnDemandMatchDomainsOnRetry;
- (NSArray)payloadOnDemandRules;
- (NSNumber)payloadDisconnectOnIdle;
- (NSNumber)payloadDisconnectOnIdleTimer;
- (NSNumber)payloadOnDemandEnabled;
- (NSString)payloadAuthName;
- (NSString)payloadAuthPassword;
- (NSString)payloadAuthenticationMethod;
- (NSString)payloadPassword;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadProviderBundleIdentifier;
- (NSString)payloadRemoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthName:(id)a3;
- (void)setPayloadAuthPassword:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadDisconnectOnIdle:(id)a3;
- (void)setPayloadDisconnectOnIdleTimer:(id)a3;
- (void)setPayloadOnDemandEnabled:(id)a3;
- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3;
- (void)setPayloadOnDemandMatchDomainsNever:(id)a3;
- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3;
- (void)setPayloadOnDemandRules:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadProviderBundleIdentifier:(id)a3;
- (void)setPayloadRemoteAddress:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_VPN

+ (NSSet)allowedPayloadKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AuthName";
  v6[1] = @"AuthPassword";
  v6[2] = @"AuthenticationMethod";
  v6[3] = @"PayloadCertificateUUID";
  v6[4] = @"OnDemandEnabled";
  v6[5] = @"OnDemandMatchDomainsAlways";
  v6[6] = @"OnDemandMatchDomainsNever";
  v6[7] = @"OnDemandMatchDomainsOnRetry";
  v6[8] = @"OnDemandRules";
  v6[9] = @"DisconnectOnIdle";
  v6[10] = @"DisconnectOnIdleTimer";
  v6[11] = @"RemoteAddress";
  v6[12] = @"Password";
  v6[13] = @"ProviderBundleIdentifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withAuthenticationMethod:(id)a5 withPayloadCertificateUUID:(id)a6 withOnDemandEnabled:(id)a7 withOnDemandMatchDomainsAlways:(id)a8 withOnDemandMatchDomainsNever:(id)a9 withOnDemandMatchDomainsOnRetry:(id)a10 withOnDemandRules:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13 withRemoteAddress:(id)a14 withPassword:(id)a15 withProviderBundleIdentifier:(id)a16
{
  id v40 = a16;
  id v39 = a15;
  id v38 = a14;
  id v37 = a13;
  id v19 = a12;
  id v36 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  v25 = (__CFString *)a5;
  id v26 = a4;
  id v27 = a3;
  v28 = objc_opt_new();
  [v28 setPayloadAuthName:v27];

  [v28 setPayloadAuthPassword:v26];
  if (v25) {
    v29 = v25;
  }
  else {
    v29 = @"Password";
  }
  [v28 setPayloadAuthenticationMethod:v29];

  [v28 setPayloadPayloadCertificateUUID:v24];
  if (v23) {
    v30 = v23;
  }
  else {
    v30 = &unk_26C894850;
  }
  [v28 setPayloadOnDemandEnabled:v30];

  [v28 setPayloadOnDemandMatchDomainsAlways:v22];
  [v28 setPayloadOnDemandMatchDomainsNever:v21];

  [v28 setPayloadOnDemandMatchDomainsOnRetry:v20];
  [v28 setPayloadOnDemandRules:v36];

  if (v19) {
    v31 = v19;
  }
  else {
    v31 = &unk_26C894850;
  }
  [v28 setPayloadDisconnectOnIdle:v31];

  [v28 setPayloadDisconnectOnIdleTimer:v37];
  [v28 setPayloadRemoteAddress:v38];

  [v28 setPayloadPassword:v39];
  [v28 setPayloadProviderBundleIdentifier:v40];

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

  v10 = +[CEMNetworkVPNDeclaration_VPN allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v56 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthName" isRequired:0 defaultValue:0 error:&v56];
  id v14 = v56;
  payloadAuthName = self->_payloadAuthName;
  self->_payloadAuthName = v13;

  if (!v14)
  {
    id v55 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthPassword" isRequired:0 defaultValue:0 error:&v55];
    id v14 = v55;
    payloadAuthPassword = self->_payloadAuthPassword;
    self->_payloadAuthPassword = v16;

    if (!v14)
    {
      id v54 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationMethod" isRequired:0 defaultValue:@"Password" error:&v54];
      id v14 = v54;
      payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
      self->_payloadAuthenticationMethod = v18;

      if (!v14)
      {
        id v53 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v53];
        id v14 = v53;
        payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
        self->_payloadPayloadCertificateUUID = v20;

        if (!v14)
        {
          id v52 = 0;
          id v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"OnDemandEnabled" isRequired:0 defaultValue:&unk_26C894850 error:&v52];
          id v14 = v52;
          payloadOnDemandEnabled = self->_payloadOnDemandEnabled;
          self->_payloadOnDemandEnabled = v22;

          if (!v14)
          {
            id v51 = 0;
            id v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsAlways" validator:&__block_literal_global_23 isRequired:0 defaultValue:0 error:&v51];
            id v14 = v51;
            payloadOnDemandMatchDomainsAlways = self->_payloadOnDemandMatchDomainsAlways;
            self->_payloadOnDemandMatchDomainsAlways = v24;

            if (!v14)
            {
              id v50 = 0;
              id v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsNever" validator:&__block_literal_global_305 isRequired:0 defaultValue:0 error:&v50];
              id v14 = v50;
              payloadOnDemandMatchDomainsNever = self->_payloadOnDemandMatchDomainsNever;
              self->_payloadOnDemandMatchDomainsNever = v26;

              if (!v14)
              {
                id v49 = 0;
                v28 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsOnRetry" validator:&__block_literal_global_307 isRequired:0 defaultValue:0 error:&v49];
                id v14 = v49;
                payloadOnDemandMatchDomainsOnRetry = self->_payloadOnDemandMatchDomainsOnRetry;
                self->_payloadOnDemandMatchDomainsOnRetry = v28;

                if (!v14)
                {
                  id v48 = 0;
                  v30 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandRules" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v48];
                  id v14 = v48;
                  payloadOnDemandRules = self->_payloadOnDemandRules;
                  self->_payloadOnDemandRules = v30;

                  if (!v14)
                  {
                    id v47 = 0;
                    v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdle" isRequired:0 defaultValue:&unk_26C894850 error:&v47];
                    id v14 = v47;
                    payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                    self->_payloadDisconnectOnIdle = v32;

                    if (!v14)
                    {
                      id v46 = 0;
                      v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdleTimer" isRequired:0 defaultValue:0 error:&v46];
                      id v14 = v46;
                      payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                      self->_payloadDisconnectOnIdleTimer = v34;

                      if (!v14)
                      {
                        id v45 = 0;
                        id v36 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteAddress" isRequired:0 defaultValue:0 error:&v45];
                        id v14 = v45;
                        payloadRemoteAddress = self->_payloadRemoteAddress;
                        self->_payloadRemoteAddress = v36;

                        if (!v14)
                        {
                          id v44 = 0;
                          id v38 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v44];
                          id v14 = v44;
                          payloadPassword = self->_payloadPassword;
                          self->_payloadPassword = v38;

                          if (!v14)
                          {
                            id v43 = 0;
                            id v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProviderBundleIdentifier" isRequired:0 defaultValue:0 error:&v43];
                            id v14 = v43;
                            payloadProviderBundleIdentifier = self->_payloadProviderBundleIdentifier;
                            self->_payloadProviderBundleIdentifier = v40;
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
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthName" withValue:self->_payloadAuthName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthPassword" withValue:self->_payloadAuthPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthenticationMethod" withValue:self->_payloadAuthenticationMethod isRequired:0 defaultValue:@"Password"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"PayloadCertificateUUID" withValue:self->_payloadPayloadCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"OnDemandEnabled" withValue:self->_payloadOnDemandEnabled isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsAlways" withValue:self->_payloadOnDemandMatchDomainsAlways itemSerializer:&__block_literal_global_311 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsNever" withValue:self->_payloadOnDemandMatchDomainsNever itemSerializer:&__block_literal_global_313 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsOnRetry" withValue:self->_payloadOnDemandMatchDomainsOnRetry itemSerializer:&__block_literal_global_315 isRequired:0 defaultValue:0];
  payloadOnDemandRules = self->_payloadOnDemandRules;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_2642C9048;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandRules" withValue:payloadOnDemandRules itemSerializer:v10 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdle" withValue:self->_payloadDisconnectOnIdle isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdleTimer" withValue:self->_payloadDisconnectOnIdleTimer isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"RemoteAddress" withValue:self->_payloadRemoteAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProviderBundleIdentifier" withValue:self->_payloadProviderBundleIdentifier isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CEMNetworkVPNDeclaration_VPN;
  id v4 = [(CEMPayloadBase *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAuthName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAuthPassword copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadAuthenticationMethod copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadPayloadCertificateUUID copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadOnDemandEnabled copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadOnDemandMatchDomainsAlways copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadOnDemandMatchDomainsNever copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSArray *)self->_payloadOnDemandMatchDomainsOnRetry copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSArray *)self->_payloadOnDemandRules copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadDisconnectOnIdle copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadDisconnectOnIdleTimer copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSString *)self->_payloadRemoteAddress copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSString *)self->_payloadPassword copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSString *)self->_payloadProviderBundleIdentifier copy];
  v32 = (void *)v4[15];
  v4[15] = v31;

  return v4;
}

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
{
}

- (NSString)payloadAuthPassword
{
  return self->_payloadAuthPassword;
}

- (void)setPayloadAuthPassword:(id)a3
{
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
}

- (NSNumber)payloadOnDemandEnabled
{
  return self->_payloadOnDemandEnabled;
}

- (void)setPayloadOnDemandEnabled:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsAlways
{
  return self->_payloadOnDemandMatchDomainsAlways;
}

- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsNever
{
  return self->_payloadOnDemandMatchDomainsNever;
}

- (void)setPayloadOnDemandMatchDomainsNever:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsOnRetry
{
  return self->_payloadOnDemandMatchDomainsOnRetry;
}

- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3
{
}

- (NSArray)payloadOnDemandRules
{
  return self->_payloadOnDemandRules;
}

- (void)setPayloadOnDemandRules:(id)a3
{
}

- (NSNumber)payloadDisconnectOnIdle
{
  return self->_payloadDisconnectOnIdle;
}

- (void)setPayloadDisconnectOnIdle:(id)a3
{
}

- (NSNumber)payloadDisconnectOnIdleTimer
{
  return self->_payloadDisconnectOnIdleTimer;
}

- (void)setPayloadDisconnectOnIdleTimer:(id)a3
{
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSString)payloadProviderBundleIdentifier
{
  return self->_payloadProviderBundleIdentifier;
}

- (void)setPayloadProviderBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandRules, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsOnRetry, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsNever, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsAlways, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);

  objc_storeStrong((id *)&self->_payloadAuthName, 0);
}

@end