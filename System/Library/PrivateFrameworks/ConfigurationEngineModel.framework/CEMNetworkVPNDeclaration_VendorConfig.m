@interface CEMNetworkVPNDeclaration_VendorConfig
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRealm:(id)a3 withRole:(id)a4 withGroup:(id)a5 withLoginGroupOrDomain:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadGroup;
- (NSString)payloadLoginGroupOrDomain;
- (NSString)payloadRealm;
- (NSString)payloadRole;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadGroup:(id)a3;
- (void)setPayloadLoginGroupOrDomain:(id)a3;
- (void)setPayloadRealm:(id)a3;
- (void)setPayloadRole:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_VendorConfig

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Realm";
  v6[1] = @"Role";
  v6[2] = @"Group";
  v6[3] = @"LoginGroupOrDomain";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRealm:(id)a3 withRole:(id)a4 withGroup:(id)a5 withLoginGroupOrDomain:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadRealm:v12];

  [v13 setPayloadRole:v11];
  [v13 setPayloadGroup:v10];

  [v13 setPayloadLoginGroupOrDomain:v9];

  return v13;
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
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkVPNDeclaration_VendorConfig allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Realm" isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadRealm = self->_payloadRealm;
  self->_payloadRealm = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Role" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadRole = self->_payloadRole;
    self->_payloadRole = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Group" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadGroup = self->_payloadGroup;
      self->_payloadGroup = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LoginGroupOrDomain" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadLoginGroupOrDomain = self->_payloadLoginGroupOrDomain;
        self->_payloadLoginGroupOrDomain = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Realm" withValue:self->_payloadRealm isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Role" withValue:self->_payloadRole isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Group" withValue:self->_payloadGroup isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LoginGroupOrDomain" withValue:self->_payloadLoginGroupOrDomain isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMNetworkVPNDeclaration_VendorConfig;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRealm copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadRole copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadGroup copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadLoginGroupOrDomain copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadRealm
{
  return self->_payloadRealm;
}

- (void)setPayloadRealm:(id)a3
{
}

- (NSString)payloadRole
{
  return self->_payloadRole;
}

- (void)setPayloadRole:(id)a3
{
}

- (NSString)payloadGroup
{
  return self->_payloadGroup;
}

- (void)setPayloadGroup:(id)a3
{
}

- (NSString)payloadLoginGroupOrDomain
{
  return self->_payloadLoginGroupOrDomain;
}

- (void)setPayloadLoginGroupOrDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLoginGroupOrDomain, 0);
  objc_storeStrong((id *)&self->_payloadGroup, 0);
  objc_storeStrong((id *)&self->_payloadRole, 0);

  objc_storeStrong((id *)&self->_payloadRealm, 0);
}

@end