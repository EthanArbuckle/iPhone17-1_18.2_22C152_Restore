@interface CEMNetworkVPNDeclaration_PPP
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withTokenCard:(id)a5 withCommRemoteAddress:(id)a6 withAuthEAPPlugins:(id)a7 withAuthProtocol:(id)a8 withCCPMPPE40Enabled:(id)a9 withCCPMPPE128Enabled:(id)a10 withCCPEnabled:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadAuthEAPPlugins;
- (NSArray)payloadAuthProtocol;
- (NSNumber)payloadCCPEnabled;
- (NSNumber)payloadCCPMPPE128Enabled;
- (NSNumber)payloadCCPMPPE40Enabled;
- (NSNumber)payloadDisconnectOnIdle;
- (NSNumber)payloadDisconnectOnIdleTimer;
- (NSNumber)payloadTokenCard;
- (NSString)payloadAuthName;
- (NSString)payloadAuthPassword;
- (NSString)payloadCommRemoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthEAPPlugins:(id)a3;
- (void)setPayloadAuthName:(id)a3;
- (void)setPayloadAuthPassword:(id)a3;
- (void)setPayloadAuthProtocol:(id)a3;
- (void)setPayloadCCPEnabled:(id)a3;
- (void)setPayloadCCPMPPE128Enabled:(id)a3;
- (void)setPayloadCCPMPPE40Enabled:(id)a3;
- (void)setPayloadCommRemoteAddress:(id)a3;
- (void)setPayloadDisconnectOnIdle:(id)a3;
- (void)setPayloadDisconnectOnIdleTimer:(id)a3;
- (void)setPayloadTokenCard:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_PPP

+ (NSSet)allowedPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AuthName";
  v6[1] = @"AuthPassword";
  v6[2] = @"TokenCard";
  v6[3] = @"CommRemoteAddress";
  v6[4] = @"AuthEAPPlugins";
  v6[5] = @"AuthProtocol";
  v6[6] = @"CCPMPPE40Enabled";
  v6[7] = @"CCPMPPE128Enabled";
  v6[8] = @"CCPEnabled";
  v6[9] = @"DisconnectOnIdle";
  v6[10] = @"DisconnectOnIdleTimer";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withTokenCard:(id)a5 withCommRemoteAddress:(id)a6 withAuthEAPPlugins:(id)a7 withAuthProtocol:(id)a8 withCCPMPPE40Enabled:(id)a9 withCCPMPPE128Enabled:(id)a10 withCCPEnabled:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13
{
  id v33 = a13;
  id v18 = a12;
  id v32 = a11;
  id v31 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  [v26 setPayloadAuthName:v25];

  [v26 setPayloadAuthPassword:v24];
  if (v23) {
    v27 = v23;
  }
  else {
    v27 = &unk_26C894850;
  }
  objc_msgSend(v26, "setPayloadTokenCard:", v27, a3);

  [v26 setPayloadCommRemoteAddress:v22];
  [v26 setPayloadAuthEAPPlugins:v21];

  [v26 setPayloadAuthProtocol:v20];
  [v26 setPayloadCCPMPPE40Enabled:v19];

  [v26 setPayloadCCPMPPE128Enabled:v31];
  [v26 setPayloadCCPEnabled:v32];

  if (v18) {
    v28 = v18;
  }
  else {
    v28 = &unk_26C894850;
  }
  [v26 setPayloadDisconnectOnIdle:v28];

  [v26 setPayloadDisconnectOnIdleTimer:v33];

  return v26;
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

  v10 = +[CEMNetworkVPNDeclaration_PPP allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v47 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthName" isRequired:0 defaultValue:0 error:&v47];
  id v14 = v47;
  payloadAuthName = self->_payloadAuthName;
  self->_payloadAuthName = v13;

  if (!v14)
  {
    id v46 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthPassword" isRequired:0 defaultValue:0 error:&v46];
    id v14 = v46;
    payloadAuthPassword = self->_payloadAuthPassword;
    self->_payloadAuthPassword = v16;

    if (!v14)
    {
      id v45 = 0;
      id v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"TokenCard" isRequired:0 defaultValue:&unk_26C894850 error:&v45];
      id v14 = v45;
      payloadTokenCard = self->_payloadTokenCard;
      self->_payloadTokenCard = v18;

      if (!v14)
      {
        id v44 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CommRemoteAddress" isRequired:0 defaultValue:0 error:&v44];
        id v14 = v44;
        payloadCommRemoteAddress = self->_payloadCommRemoteAddress;
        self->_payloadCommRemoteAddress = v20;

        if (!v14)
        {
          id v43 = 0;
          id v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AuthEAPPlugins" validator:&__block_literal_global_581 isRequired:0 defaultValue:0 error:&v43];
          id v14 = v43;
          payloadAuthEAPPlugins = self->_payloadAuthEAPPlugins;
          self->_payloadAuthEAPPlugins = v22;

          if (!v14)
          {
            id v42 = 0;
            id v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AuthProtocol" validator:&__block_literal_global_583 isRequired:0 defaultValue:0 error:&v42];
            id v14 = v42;
            payloadAuthProtocol = self->_payloadAuthProtocol;
            self->_payloadAuthProtocol = v24;

            if (!v14)
            {
              id v41 = 0;
              v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CCPMPPE40Enabled" isRequired:0 defaultValue:0 error:&v41];
              id v14 = v41;
              payloadCCPMPPE40Enabled = self->_payloadCCPMPPE40Enabled;
              self->_payloadCCPMPPE40Enabled = v26;

              if (!v14)
              {
                id v40 = 0;
                v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CCPMPPE128Enabled" isRequired:0 defaultValue:0 error:&v40];
                id v14 = v40;
                payloadCCPMPPE128Enabled = self->_payloadCCPMPPE128Enabled;
                self->_payloadCCPMPPE128Enabled = v28;

                if (!v14)
                {
                  id v39 = 0;
                  v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CCPEnabled" isRequired:0 defaultValue:0 error:&v39];
                  id v14 = v39;
                  payloadCCPEnabled = self->_payloadCCPEnabled;
                  self->_payloadCCPEnabled = v30;

                  if (!v14)
                  {
                    id v38 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdle" isRequired:0 defaultValue:&unk_26C894850 error:&v38];
                    id v14 = v38;
                    payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                    self->_payloadDisconnectOnIdle = v32;

                    if (!v14)
                    {
                      id v37 = 0;
                      v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdleTimer" isRequired:0 defaultValue:0 error:&v37];
                      id v14 = v37;
                      payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                      self->_payloadDisconnectOnIdleTimer = v34;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"AuthName" withValue:self->_payloadAuthName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"AuthPassword" withValue:self->_payloadAuthPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"TokenCard" withValue:self->_payloadTokenCard isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CommRemoteAddress" withValue:self->_payloadCommRemoteAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AuthEAPPlugins" withValue:self->_payloadAuthEAPPlugins itemSerializer:&__block_literal_global_585 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AuthProtocol" withValue:self->_payloadAuthProtocol itemSerializer:&__block_literal_global_587 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"CCPMPPE40Enabled" withValue:self->_payloadCCPMPPE40Enabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"CCPMPPE128Enabled" withValue:self->_payloadCCPMPPE128Enabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"CCPEnabled" withValue:self->_payloadCCPEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"DisconnectOnIdle" withValue:self->_payloadDisconnectOnIdle isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"DisconnectOnIdleTimer" withValue:self->_payloadDisconnectOnIdleTimer isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CEMNetworkVPNDeclaration_PPP;
  v4 = [(CEMPayloadBase *)&v28 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAuthName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAuthPassword copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadTokenCard copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadCommRemoteAddress copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadAuthEAPPlugins copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadAuthProtocol copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadCCPMPPE40Enabled copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadCCPMPPE128Enabled copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadCCPEnabled copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadDisconnectOnIdle copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadDisconnectOnIdleTimer copy];
  v26 = (void *)v4[12];
  v4[12] = v25;

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

- (NSNumber)payloadTokenCard
{
  return self->_payloadTokenCard;
}

- (void)setPayloadTokenCard:(id)a3
{
}

- (NSString)payloadCommRemoteAddress
{
  return self->_payloadCommRemoteAddress;
}

- (void)setPayloadCommRemoteAddress:(id)a3
{
}

- (NSArray)payloadAuthEAPPlugins
{
  return self->_payloadAuthEAPPlugins;
}

- (void)setPayloadAuthEAPPlugins:(id)a3
{
}

- (NSArray)payloadAuthProtocol
{
  return self->_payloadAuthProtocol;
}

- (void)setPayloadAuthProtocol:(id)a3
{
}

- (NSNumber)payloadCCPMPPE40Enabled
{
  return self->_payloadCCPMPPE40Enabled;
}

- (void)setPayloadCCPMPPE40Enabled:(id)a3
{
}

- (NSNumber)payloadCCPMPPE128Enabled
{
  return self->_payloadCCPMPPE128Enabled;
}

- (void)setPayloadCCPMPPE128Enabled:(id)a3
{
}

- (NSNumber)payloadCCPEnabled
{
  return self->_payloadCCPEnabled;
}

- (void)setPayloadCCPEnabled:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadCCPEnabled, 0);
  objc_storeStrong((id *)&self->_payloadCCPMPPE128Enabled, 0);
  objc_storeStrong((id *)&self->_payloadCCPMPPE40Enabled, 0);
  objc_storeStrong((id *)&self->_payloadAuthProtocol, 0);
  objc_storeStrong((id *)&self->_payloadAuthEAPPlugins, 0);
  objc_storeStrong((id *)&self->_payloadCommRemoteAddress, 0);
  objc_storeStrong((id *)&self->_payloadTokenCard, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);

  objc_storeStrong((id *)&self->_payloadAuthName, 0);
}

@end