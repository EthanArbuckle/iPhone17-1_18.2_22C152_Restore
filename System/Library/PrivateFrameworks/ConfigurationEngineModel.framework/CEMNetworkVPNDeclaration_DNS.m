@interface CEMNetworkVPNDeclaration_DNS
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithServerAddresses:(id)a3;
+ (id)buildWithServerAddresses:(id)a3 withSearchDomains:(id)a4 withDomainName:(id)a5 withSupplementalMatchDomains:(id)a6 withSupplementalMatchDomainsNoSearch:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadSearchDomains;
- (NSArray)payloadServerAddresses;
- (NSArray)payloadSupplementalMatchDomains;
- (NSNumber)payloadSupplementalMatchDomainsNoSearch;
- (NSString)payloadDomainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDomainName:(id)a3;
- (void)setPayloadSearchDomains:(id)a3;
- (void)setPayloadServerAddresses:(id)a3;
- (void)setPayloadSupplementalMatchDomains:(id)a3;
- (void)setPayloadSupplementalMatchDomainsNoSearch:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_DNS

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ServerAddresses";
  v6[1] = @"SearchDomains";
  v6[2] = @"DomainName";
  v6[3] = @"SupplementalMatchDomains";
  v6[4] = @"SupplementalMatchDomainsNoSearch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithServerAddresses:(id)a3 withSearchDomains:(id)a4 withDomainName:(id)a5 withSupplementalMatchDomains:(id)a6 withSupplementalMatchDomainsNoSearch:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadServerAddresses:v15];

  [v16 setPayloadSearchDomains:v14];
  [v16 setPayloadDomainName:v13];

  [v16 setPayloadSupplementalMatchDomains:v12];
  if (v11) {
    v17 = v11;
  }
  else {
    v17 = &unk_26C894850;
  }
  [v16 setPayloadSupplementalMatchDomainsNoSearch:v17];

  return v16;
}

+ (id)buildRequiredOnlyWithServerAddresses:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadServerAddresses:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_DNS allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ServerAddresses" validator:&__block_literal_global_1247 isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadServerAddresses = self->_payloadServerAddresses;
  self->_payloadServerAddresses = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SearchDomains" validator:&__block_literal_global_1249 isRequired:0 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadSearchDomains = self->_payloadSearchDomains;
    self->_payloadSearchDomains = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DomainName" isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadDomainName = self->_payloadDomainName;
      self->_payloadDomainName = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SupplementalMatchDomains" validator:&__block_literal_global_1251 isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadSupplementalMatchDomains = self->_payloadSupplementalMatchDomains;
        self->_payloadSupplementalMatchDomains = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"SupplementalMatchDomainsNoSearch" isRequired:0 defaultValue:&unk_26C894850 error:&v25];
          id v14 = v25;
          payloadSupplementalMatchDomainsNoSearch = self->_payloadSupplementalMatchDomainsNoSearch;
          self->_payloadSupplementalMatchDomainsNoSearch = v22;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"ServerAddresses" withValue:self->_payloadServerAddresses itemSerializer:&__block_literal_global_1253 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SearchDomains" withValue:self->_payloadSearchDomains itemSerializer:&__block_literal_global_1255 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DomainName" withValue:self->_payloadDomainName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SupplementalMatchDomains" withValue:self->_payloadSupplementalMatchDomains itemSerializer:&__block_literal_global_1257 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"SupplementalMatchDomainsNoSearch" withValue:self->_payloadSupplementalMatchDomainsNoSearch isRequired:0 defaultValue:&unk_26C894850];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMNetworkVPNDeclaration_DNS;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadServerAddresses copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadSearchDomains copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDomainName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadSupplementalMatchDomains copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadSupplementalMatchDomainsNoSearch copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSArray)payloadServerAddresses
{
  return self->_payloadServerAddresses;
}

- (void)setPayloadServerAddresses:(id)a3
{
}

- (NSArray)payloadSearchDomains
{
  return self->_payloadSearchDomains;
}

- (void)setPayloadSearchDomains:(id)a3
{
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
}

- (NSArray)payloadSupplementalMatchDomains
{
  return self->_payloadSupplementalMatchDomains;
}

- (void)setPayloadSupplementalMatchDomains:(id)a3
{
}

- (NSNumber)payloadSupplementalMatchDomainsNoSearch
{
  return self->_payloadSupplementalMatchDomainsNoSearch;
}

- (void)setPayloadSupplementalMatchDomainsNoSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomainsNoSearch, 0);
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadSearchDomains, 0);

  objc_storeStrong((id *)&self->_payloadServerAddresses, 0);
}

@end