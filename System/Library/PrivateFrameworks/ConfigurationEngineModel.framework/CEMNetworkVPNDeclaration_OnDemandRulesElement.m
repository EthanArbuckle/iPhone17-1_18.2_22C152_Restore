@interface CEMNetworkVPNDeclaration_OnDemandRulesElement
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithAction:(id)a3;
+ (id)buildWithDNSDomainMatch:(id)a3 withDNSServerAddressMatch:(id)a4 withURLStringProbe:(id)a5 withAction:(id)a6 withActionParameters:(id)a7 withInterfaceTypeMatch:(id)a8 withSSIDMatch:(id)a9;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters)payloadActionParameters;
- (NSArray)payloadDNSDomainMatch;
- (NSArray)payloadDNSServerAddressMatch;
- (NSArray)payloadSSIDMatch;
- (NSString)payloadAction;
- (NSString)payloadInterfaceTypeMatch;
- (NSString)payloadURLStringProbe;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAction:(id)a3;
- (void)setPayloadActionParameters:(id)a3;
- (void)setPayloadDNSDomainMatch:(id)a3;
- (void)setPayloadDNSServerAddressMatch:(id)a3;
- (void)setPayloadInterfaceTypeMatch:(id)a3;
- (void)setPayloadSSIDMatch:(id)a3;
- (void)setPayloadURLStringProbe:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_OnDemandRulesElement

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DNSDomainMatch";
  v6[1] = @"DNSServerAddressMatch";
  v6[2] = @"URLStringProbe";
  v6[3] = @"Action";
  v6[4] = @"ActionParameters";
  v6[5] = @"InterfaceTypeMatch";
  v6[6] = @"SSIDMatch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDNSDomainMatch:(id)a3 withDNSServerAddressMatch:(id)a4 withURLStringProbe:(id)a5 withAction:(id)a6 withActionParameters:(id)a7 withInterfaceTypeMatch:(id)a8 withSSIDMatch:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setPayloadDNSDomainMatch:v21];

  [v22 setPayloadDNSServerAddressMatch:v20];
  [v22 setPayloadURLStringProbe:v19];

  [v22 setPayloadAction:v18];
  [v22 setPayloadActionParameters:v17];

  [v22 setPayloadInterfaceTypeMatch:v16];
  [v22 setPayloadSSIDMatch:v15];

  return v22;
}

+ (id)buildRequiredOnlyWithAction:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadAction:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_OnDemandRulesElement allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v35 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"DNSDomainMatch" validator:&__block_literal_global_432 isRequired:0 defaultValue:0 error:&v35];
  id v14 = v35;
  payloadDNSDomainMatch = self->_payloadDNSDomainMatch;
  self->_payloadDNSDomainMatch = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"DNSServerAddressMatch" validator:&__block_literal_global_434 isRequired:0 defaultValue:0 error:&v34];
    id v14 = v34;
    payloadDNSServerAddressMatch = self->_payloadDNSServerAddressMatch;
    self->_payloadDNSServerAddressMatch = v16;

    if (!v14)
    {
      id v33 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"URLStringProbe" isRequired:0 defaultValue:0 error:&v33];
      id v14 = v33;
      payloadURLStringProbe = self->_payloadURLStringProbe;
      self->_payloadURLStringProbe = v18;

      if (!v14)
      {
        id v32 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Action" isRequired:1 defaultValue:0 error:&v32];
        id v14 = v32;
        payloadAction = self->_payloadAction;
        self->_payloadAction = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ActionParameters" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v31];
          id v14 = v31;
          payloadActionParameters = self->_payloadActionParameters;
          self->_payloadActionParameters = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"InterfaceTypeMatch" isRequired:0 defaultValue:0 error:&v30];
            id v14 = v30;
            payloadInterfaceTypeMatch = self->_payloadInterfaceTypeMatch;
            self->_payloadInterfaceTypeMatch = v24;

            if (!v14)
            {
              id v29 = 0;
              v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SSIDMatch" validator:&__block_literal_global_437 isRequired:0 defaultValue:0 error:&v29];
              id v14 = v29;
              payloadSSIDMatch = self->_payloadSSIDMatch;
              self->_payloadSSIDMatch = v26;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"DNSDomainMatch" withValue:self->_payloadDNSDomainMatch itemSerializer:&__block_literal_global_439 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"DNSServerAddressMatch" withValue:self->_payloadDNSServerAddressMatch itemSerializer:&__block_literal_global_441 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"URLStringProbe" withValue:self->_payloadURLStringProbe isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Action" withValue:self->_payloadAction isRequired:1 defaultValue:0];
  payloadActionParameters = self->_payloadActionParameters;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_3;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"ActionParameters" withValue:payloadActionParameters dictSerializer:v10 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"InterfaceTypeMatch" withValue:self->_payloadInterfaceTypeMatch isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"SSIDMatch" withValue:self->_payloadSSIDMatch itemSerializer:&__block_literal_global_443 isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMNetworkVPNDeclaration_OnDemandRulesElement;
  id v4 = [(CEMPayloadBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadDNSDomainMatch copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadDNSServerAddressMatch copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadURLStringProbe copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAction copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters *)self->_payloadActionParameters copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadInterfaceTypeMatch copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadSSIDMatch copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSArray)payloadDNSDomainMatch
{
  return self->_payloadDNSDomainMatch;
}

- (void)setPayloadDNSDomainMatch:(id)a3
{
}

- (NSArray)payloadDNSServerAddressMatch
{
  return self->_payloadDNSServerAddressMatch;
}

- (void)setPayloadDNSServerAddressMatch:(id)a3
{
}

- (NSString)payloadURLStringProbe
{
  return self->_payloadURLStringProbe;
}

- (void)setPayloadURLStringProbe:(id)a3
{
}

- (NSString)payloadAction
{
  return self->_payloadAction;
}

- (void)setPayloadAction:(id)a3
{
}

- (CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters)payloadActionParameters
{
  return self->_payloadActionParameters;
}

- (void)setPayloadActionParameters:(id)a3
{
}

- (NSString)payloadInterfaceTypeMatch
{
  return self->_payloadInterfaceTypeMatch;
}

- (void)setPayloadInterfaceTypeMatch:(id)a3
{
}

- (NSArray)payloadSSIDMatch
{
  return self->_payloadSSIDMatch;
}

- (void)setPayloadSSIDMatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSSIDMatch, 0);
  objc_storeStrong((id *)&self->_payloadInterfaceTypeMatch, 0);
  objc_storeStrong((id *)&self->_payloadActionParameters, 0);
  objc_storeStrong((id *)&self->_payloadAction, 0);
  objc_storeStrong((id *)&self->_payloadURLStringProbe, 0);
  objc_storeStrong((id *)&self->_payloadDNSServerAddressMatch, 0);

  objc_storeStrong((id *)&self->_payloadDNSDomainMatch, 0);
}

@end