@interface CEMNetworkVPNDeclaration_IPv4
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithOverridePrimary:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadOverridePrimary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadOverridePrimary:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_IPv4

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"OverridePrimary";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithOverridePrimary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = v4;
  if (v3) {
    v6 = v3;
  }
  else {
    v6 = &unk_26C894850;
  }
  [v4 setPayloadOverridePrimary:v6];

  return v5;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_IPv4 allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v7 withKey:@"OverridePrimary" isRequired:0 defaultValue:&unk_26C894850 error:&v17];

  id v14 = v17;
  payloadOverridePrimary = self->_payloadOverridePrimary;
  self->_payloadOverridePrimary = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"OverridePrimary" withValue:self->_payloadOverridePrimary isRequired:0 defaultValue:&unk_26C894850];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMNetworkVPNDeclaration_IPv4;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadOverridePrimary copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSNumber)payloadOverridePrimary
{
  return self->_payloadOverridePrimary;
}

- (void)setPayloadOverridePrimary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end