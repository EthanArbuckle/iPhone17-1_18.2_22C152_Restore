@interface CEMNetworkVPNDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNType:(id)a4 withUserDefinedName:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withVPNType:(id)a4 withVPNSubType:(id)a5 withUserDefinedName:(id)a6 withVendorConfig:(id)a7 withVPN:(id)a8 withIPv4:(id)a9 withPPP:(id)a10 withIPSec:(id)a11 withIKEv2:(id)a12 withProxies:(id)a13 withAlwaysOn:(id)a14 withDisconnectOnIdle:(id)a15 withDisconnectOnIdleTimer:(id)a16 withDNS:(id)a17;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMNetworkVPNDeclaration_AlwaysOn)payloadAlwaysOn;
- (CEMNetworkVPNDeclaration_DNS)payloadDNS;
- (CEMNetworkVPNDeclaration_IKEv2)payloadIKEv2;
- (CEMNetworkVPNDeclaration_IPSec)payloadIPSec;
- (CEMNetworkVPNDeclaration_IPv4)payloadIPv4;
- (CEMNetworkVPNDeclaration_PPP)payloadPPP;
- (CEMNetworkVPNDeclaration_Proxies)payloadProxies;
- (CEMNetworkVPNDeclaration_VPN)payloadVPN;
- (CEMNetworkVPNDeclaration_VendorConfig)payloadVendorConfig;
- (NSNumber)payloadDisconnectOnIdle;
- (NSNumber)payloadDisconnectOnIdleTimer;
- (NSString)payloadUserDefinedName;
- (NSString)payloadVPNSubType;
- (NSString)payloadVPNType;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAlwaysOn:(id)a3;
- (void)setPayloadDNS:(id)a3;
- (void)setPayloadDisconnectOnIdle:(id)a3;
- (void)setPayloadDisconnectOnIdleTimer:(id)a3;
- (void)setPayloadIKEv2:(id)a3;
- (void)setPayloadIPSec:(id)a3;
- (void)setPayloadIPv4:(id)a3;
- (void)setPayloadPPP:(id)a3;
- (void)setPayloadProxies:(id)a3;
- (void)setPayloadUserDefinedName:(id)a3;
- (void)setPayloadVPN:(id)a3;
- (void)setPayloadVPNSubType:(id)a3;
- (void)setPayloadVPNType:(id)a3;
- (void)setPayloadVendorConfig:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.vpn";
}

+ (id)profileType
{
  return @"com.apple.vpn.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VPNType";
  v6[1] = @"VPNSubType";
  v6[2] = @"UserDefinedName";
  v6[3] = @"VendorConfig";
  v6[4] = @"VPN";
  v6[5] = @"IPv4";
  v6[6] = @"PPP";
  v6[7] = @"IPSec";
  v6[8] = @"IKEv2";
  v6[9] = @"Proxies";
  v6[10] = @"AlwaysOn";
  v6[11] = @"DisconnectOnIdle";
  v6[12] = @"DisconnectOnIdleTimer";
  v6[13] = @"DNS";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withVPNType:(id)a4 withVPNSubType:(id)a5 withUserDefinedName:(id)a6 withVendorConfig:(id)a7 withVPN:(id)a8 withIPv4:(id)a9 withPPP:(id)a10 withIPSec:(id)a11 withIKEv2:(id)a12 withProxies:(id)a13 withAlwaysOn:(id)a14 withDisconnectOnIdle:(id)a15 withDisconnectOnIdleTimer:(id)a16 withDNS:(id)a17
{
  id v17 = a3;
  id v43 = a17;
  id v42 = a16;
  id v41 = a15;
  id v40 = a14;
  id v39 = a13;
  id v18 = a12;
  id v19 = a11;
  id v38 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  v26 = objc_opt_new();
  [v26 setDeclarationType:@"com.apple.configuration.network.vpn"];
  if (v17)
  {
    [v26 setDeclarationIdentifier:v17];
  }
  else
  {
    [MEMORY[0x263F08C38] UUID];
    v27 = id v37 = v18;
    [v27 UUIDString];
    v29 = id v28 = v19;
    [v26 setDeclarationIdentifier:v29];

    id v19 = v28;
    id v17 = 0;
    id v18 = v37;
  }
  [v26 setPayloadVPNType:v25];

  [v26 setPayloadVPNSubType:v24];
  [v26 setPayloadUserDefinedName:v23];

  [v26 setPayloadVendorConfig:v22];
  [v26 setPayloadVPN:v21];

  [v26 setPayloadIPv4:v20];
  [v26 setPayloadPPP:v38];

  [v26 setPayloadIPSec:v19];
  [v26 setPayloadIKEv2:v18];

  [v26 setPayloadProxies:v39];
  [v26 setPayloadAlwaysOn:v40];

  if (v41) {
    v30 = v41;
  }
  else {
    v30 = &unk_26C894850;
  }
  [v26 setPayloadDisconnectOnIdle:v30];

  [v26 setPayloadDisconnectOnIdleTimer:v42];
  [v26 setPayloadDNS:v43];

  [v26 updateServerHash];

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNType:(id)a4 withUserDefinedName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.network.vpn"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadVPNType:v9];

  [v10 setPayloadUserDefinedName:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v56 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"VPNType" isRequired:1 defaultValue:0 error:&v56];
  id v14 = v56;
  payloadVPNType = self->_payloadVPNType;
  self->_payloadVPNType = v13;

  if (!v14)
  {
    id v55 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"VPNSubType" isRequired:0 defaultValue:0 error:&v55];
    id v14 = v55;
    payloadVPNSubType = self->_payloadVPNSubType;
    self->_payloadVPNSubType = v16;

    if (!v14)
    {
      id v54 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserDefinedName" isRequired:1 defaultValue:0 error:&v54];
      id v14 = v54;
      payloadUserDefinedName = self->_payloadUserDefinedName;
      self->_payloadUserDefinedName = v18;

      if (!v14)
      {
        id v53 = 0;
        id v20 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"VendorConfig" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v53];
        id v14 = v53;
        payloadVendorConfig = self->_payloadVendorConfig;
        self->_payloadVendorConfig = v20;

        if (!v14)
        {
          id v52 = 0;
          id v22 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"VPN" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v52];
          id v14 = v52;
          payloadVPN = self->_payloadVPN;
          self->_payloadVPN = v22;

          if (!v14)
          {
            id v51 = 0;
            id v24 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"IPv4" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v51];
            id v14 = v51;
            payloadIPv4 = self->_payloadIPv4;
            self->_payloadIPv4 = v24;

            if (!v14)
            {
              id v50 = 0;
              v26 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"PPP" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v50];
              id v14 = v50;
              payloadPPP = self->_payloadPPP;
              self->_payloadPPP = v26;

              if (!v14)
              {
                id v49 = 0;
                id v28 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"IPSec" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v49];
                id v14 = v49;
                payloadIPSec = self->_payloadIPSec;
                self->_payloadIPSec = v28;

                if (!v14)
                {
                  id v48 = 0;
                  v30 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"IKEv2" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v48];
                  id v14 = v48;
                  payloadIKEv2 = self->_payloadIKEv2;
                  self->_payloadIKEv2 = v30;

                  if (!v14)
                  {
                    id v47 = 0;
                    v32 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Proxies" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v47];
                    id v14 = v47;
                    payloadProxies = self->_payloadProxies;
                    self->_payloadProxies = v32;

                    if (!v14)
                    {
                      id v46 = 0;
                      v34 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"AlwaysOn" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v46];
                      id v14 = v46;
                      payloadAlwaysOn = self->_payloadAlwaysOn;
                      self->_payloadAlwaysOn = v34;

                      if (!v14)
                      {
                        id v45 = 0;
                        v36 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdle" isRequired:0 defaultValue:&unk_26C894850 error:&v45];
                        id v14 = v45;
                        payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                        self->_payloadDisconnectOnIdle = v36;

                        if (!v14)
                        {
                          id v44 = 0;
                          id v38 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdleTimer" isRequired:0 defaultValue:0 error:&v44];
                          id v14 = v44;
                          payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                          self->_payloadDisconnectOnIdleTimer = v38;

                          if (!v14)
                          {
                            id v43 = 0;
                            id v40 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"DNS" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v43];
                            id v14 = v43;
                            payloadDNS = self->_payloadDNS;
                            self->_payloadDNS = v40;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"VPNType" withValue:self->_payloadVPNType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"VPNSubType" withValue:self->_payloadVPNSubType isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"UserDefinedName" withValue:self->_payloadUserDefinedName isRequired:1 defaultValue:0];
  payloadVendorConfig = self->_payloadVendorConfig;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v42[3] = &unk_2642C87E8;
  id v7 = v4;
  id v43 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"VendorConfig" withValue:payloadVendorConfig dictSerializer:v42 isRequired:0 defaultValue:0];
  payloadVPN = self->_payloadVPN;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v40[3] = &unk_2642C87E8;
  id v9 = v7;
  id v41 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"VPN" withValue:payloadVPN dictSerializer:v40 isRequired:0 defaultValue:0];
  payloadIPid v4 = self->_payloadIPv4;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v38[3] = &unk_2642C87E8;
  id v11 = v9;
  id v39 = v11;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"IPv4" withValue:payloadIPv4 dictSerializer:v38 isRequired:0 defaultValue:0];
  payloadPPP = self->_payloadPPP;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  v36[3] = &unk_2642C87E8;
  id v13 = v11;
  id v37 = v13;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"PPP" withValue:payloadPPP dictSerializer:v36 isRequired:0 defaultValue:0];
  payloadIPSec = self->_payloadIPSec;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v34[3] = &unk_2642C87E8;
  id v15 = v13;
  id v35 = v15;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"IPSec" withValue:payloadIPSec dictSerializer:v34 isRequired:0 defaultValue:0];
  payloadIKEv2 = self->_payloadIKEv2;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_6;
  v32[3] = &unk_2642C87E8;
  id v17 = v15;
  id v33 = v17;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"IKEv2" withValue:payloadIKEv2 dictSerializer:v32 isRequired:0 defaultValue:0];
  payloadProxies = self->_payloadProxies;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_7;
  v30[3] = &unk_2642C87E8;
  id v19 = v17;
  id v31 = v19;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Proxies" withValue:payloadProxies dictSerializer:v30 isRequired:0 defaultValue:0];
  payloadAlwaysOn = self->_payloadAlwaysOn;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_8;
  v28[3] = &unk_2642C87E8;
  id v21 = v19;
  id v29 = v21;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"AlwaysOn" withValue:payloadAlwaysOn dictSerializer:v28 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdle" withValue:self->_payloadDisconnectOnIdle isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdleTimer" withValue:self->_payloadDisconnectOnIdleTimer isRequired:0 defaultValue:0];
  payloadDNS = self->_payloadDNS;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_9;
  v26[3] = &unk_2642C87E8;
  id v27 = v21;
  id v23 = v21;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"DNS" withValue:payloadDNS dictSerializer:v26 isRequired:0 defaultValue:0];
  id v24 = (void *)[v5 copy];

  return v24;
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMNetworkVPNDeclaration_serializePayloadWithAssetProviders___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CEMNetworkVPNDeclaration;
  id v4 = [(CEMDeclarationBase *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVPNType copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadVPNSubType copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUserDefinedName copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(CEMNetworkVPNDeclaration_VendorConfig *)self->_payloadVendorConfig copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(CEMNetworkVPNDeclaration_VPN *)self->_payloadVPN copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(CEMNetworkVPNDeclaration_IPv4 *)self->_payloadIPv4 copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(CEMNetworkVPNDeclaration_PPP *)self->_payloadPPP copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(CEMNetworkVPNDeclaration_IPSec *)self->_payloadIPSec copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(CEMNetworkVPNDeclaration_IKEv2 *)self->_payloadIKEv2 copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(CEMNetworkVPNDeclaration_Proxies *)self->_payloadProxies copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(CEMNetworkVPNDeclaration_AlwaysOn *)self->_payloadAlwaysOn copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadDisconnectOnIdle copy];
  id v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadDisconnectOnIdleTimer copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(CEMNetworkVPNDeclaration_DNS *)self->_payloadDNS copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (NSString)payloadVPNType
{
  return self->_payloadVPNType;
}

- (void)setPayloadVPNType:(id)a3
{
}

- (NSString)payloadVPNSubType
{
  return self->_payloadVPNSubType;
}

- (void)setPayloadVPNSubType:(id)a3
{
}

- (NSString)payloadUserDefinedName
{
  return self->_payloadUserDefinedName;
}

- (void)setPayloadUserDefinedName:(id)a3
{
}

- (CEMNetworkVPNDeclaration_VendorConfig)payloadVendorConfig
{
  return self->_payloadVendorConfig;
}

- (void)setPayloadVendorConfig:(id)a3
{
}

- (CEMNetworkVPNDeclaration_VPN)payloadVPN
{
  return self->_payloadVPN;
}

- (void)setPayloadVPN:(id)a3
{
}

- (CEMNetworkVPNDeclaration_IPv4)payloadIPv4
{
  return self->_payloadIPv4;
}

- (void)setPayloadIPv4:(id)a3
{
}

- (CEMNetworkVPNDeclaration_PPP)payloadPPP
{
  return self->_payloadPPP;
}

- (void)setPayloadPPP:(id)a3
{
}

- (CEMNetworkVPNDeclaration_IPSec)payloadIPSec
{
  return self->_payloadIPSec;
}

- (void)setPayloadIPSec:(id)a3
{
}

- (CEMNetworkVPNDeclaration_IKEv2)payloadIKEv2
{
  return self->_payloadIKEv2;
}

- (void)setPayloadIKEv2:(id)a3
{
}

- (CEMNetworkVPNDeclaration_Proxies)payloadProxies
{
  return self->_payloadProxies;
}

- (void)setPayloadProxies:(id)a3
{
}

- (CEMNetworkVPNDeclaration_AlwaysOn)payloadAlwaysOn
{
  return self->_payloadAlwaysOn;
}

- (void)setPayloadAlwaysOn:(id)a3
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

- (CEMNetworkVPNDeclaration_DNS)payloadDNS
{
  return self->_payloadDNS;
}

- (void)setPayloadDNS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDNS, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadAlwaysOn, 0);
  objc_storeStrong((id *)&self->_payloadProxies, 0);
  objc_storeStrong((id *)&self->_payloadIKEv2, 0);
  objc_storeStrong((id *)&self->_payloadIPSec, 0);
  objc_storeStrong((id *)&self->_payloadPPP, 0);
  objc_storeStrong((id *)&self->_payloadIPv4, 0);
  objc_storeStrong((id *)&self->_payloadVPN, 0);
  objc_storeStrong((id *)&self->_payloadVendorConfig, 0);
  objc_storeStrong((id *)&self->_payloadUserDefinedName, 0);
  objc_storeStrong((id *)&self->_payloadVPNSubType, 0);

  objc_storeStrong((id *)&self->_payloadVPNType, 0);
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_VPN_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __67__CEMNetworkVPNDeclaration_OnDemandRulesElement_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __83__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __83__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __100__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __100__CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __50__CEMNetworkVPNDeclaration_PPP_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_PPP_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_PPP_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkVPNDeclaration_PPP_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__CEMNetworkVPNDeclaration_IPSec_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __69__CEMNetworkVPNDeclaration_IKEv2_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __54__CEMNetworkVPNDeclaration_Proxies_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __71__CEMNetworkVPNDeclaration_Proxies_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __74__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __91__CEMNetworkVPNDeclaration_AlwaysOnTunnelConfiguration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkVPNDeclaration_DNS_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkVPNDeclaration_DNS_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end