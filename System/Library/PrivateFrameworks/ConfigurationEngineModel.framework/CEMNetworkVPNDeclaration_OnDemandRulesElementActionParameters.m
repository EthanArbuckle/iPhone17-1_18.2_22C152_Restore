@interface CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDomains:(id)a3 withDomainAction:(id)a4;
+ (id)buildWithDomains:(id)a3 withDomainAction:(id)a4 withRequiredDNSServers:(id)a5 withRequiredURLStringProbe:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadDomains;
- (NSArray)payloadRequiredDNSServers;
- (NSString)payloadDomainAction;
- (NSString)payloadRequiredURLStringProbe;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDomainAction:(id)a3;
- (void)setPayloadDomains:(id)a3;
- (void)setPayloadRequiredDNSServers:(id)a3;
- (void)setPayloadRequiredURLStringProbe:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Domains";
  v6[1] = @"DomainAction";
  v6[2] = @"RequiredDNSServers";
  v6[3] = @"RequiredURLStringProbe";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDomains:(id)a3 withDomainAction:(id)a4 withRequiredDNSServers:(id)a5 withRequiredURLStringProbe:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadDomains:v12];

  [v13 setPayloadDomainAction:v11];
  [v13 setPayloadRequiredDNSServers:v10];

  [v13 setPayloadRequiredURLStringProbe:v9];

  return v13;
}

+ (id)buildRequiredOnlyWithDomains:(id)a3 withDomainAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadDomains:v6];

  [v7 setPayloadDomainAction:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Domains" validator:&__block_literal_global_508 isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadDomains = self->_payloadDomains;
  self->_payloadDomains = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DomainAction" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadDomainAction = self->_payloadDomainAction;
    self->_payloadDomainAction = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"RequiredDNSServers" validator:&__block_literal_global_510 isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadRequiredDNSServers = self->_payloadRequiredDNSServers;
      self->_payloadRequiredDNSServers = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RequiredURLStringProbe" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadRequiredURLStringProbe = self->_payloadRequiredURLStringProbe;
        self->_payloadRequiredURLStringProbe = v20;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"Domains" withValue:self->_payloadDomains itemSerializer:&__block_literal_global_512 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DomainAction" withValue:self->_payloadDomainAction isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"RequiredDNSServers" withValue:self->_payloadRequiredDNSServers itemSerializer:&__block_literal_global_514 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"RequiredURLStringProbe" withValue:self->_payloadRequiredURLStringProbe isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadDomains copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDomainAction copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadRequiredDNSServers copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadRequiredURLStringProbe copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)payloadDomains
{
  return self->_payloadDomains;
}

- (void)setPayloadDomains:(id)a3
{
}

- (NSString)payloadDomainAction
{
  return self->_payloadDomainAction;
}

- (void)setPayloadDomainAction:(id)a3
{
}

- (NSArray)payloadRequiredDNSServers
{
  return self->_payloadRequiredDNSServers;
}

- (void)setPayloadRequiredDNSServers:(id)a3
{
}

- (NSString)payloadRequiredURLStringProbe
{
  return self->_payloadRequiredURLStringProbe;
}

- (void)setPayloadRequiredURLStringProbe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRequiredURLStringProbe, 0);
  objc_storeStrong((id *)&self->_payloadRequiredDNSServers, 0);
  objc_storeStrong((id *)&self->_payloadDomainAction, 0);

  objc_storeStrong((id *)&self->_payloadDomains, 0);
}

@end