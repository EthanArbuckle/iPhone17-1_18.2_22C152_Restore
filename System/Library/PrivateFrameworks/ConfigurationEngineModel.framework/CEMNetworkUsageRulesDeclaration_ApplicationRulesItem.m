@interface CEMNetworkUsageRulesDeclaration_ApplicationRulesItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAppIdentifierMatches:(id)a3 withAllowRoamingCellularData:(id)a4 withAllowCellularData:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadAppIdentifierMatches;
- (NSNumber)payloadAllowCellularData;
- (NSNumber)payloadAllowRoamingCellularData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowCellularData:(id)a3;
- (void)setPayloadAllowRoamingCellularData:(id)a3;
- (void)setPayloadAppIdentifierMatches:(id)a3;
@end

@implementation CEMNetworkUsageRulesDeclaration_ApplicationRulesItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AppIdentifierMatches";
  v6[1] = @"AllowRoamingCellularData";
  v6[2] = @"AllowCellularData";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAppIdentifierMatches:(id)a3 withAllowRoamingCellularData:(id)a4 withAllowCellularData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadAppIdentifierMatches:v9];

  v11 = (void *)MEMORY[0x263EFFA88];
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAllowRoamingCellularData:v12];

  if (v7) {
    id v13 = v7;
  }
  else {
    id v13 = v11;
  }
  [v10 setPayloadAllowCellularData:v13];

  return v10;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkUsageRulesDeclaration_ApplicationRulesItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AppIdentifierMatches" validator:&__block_literal_global_22 isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadAppIdentifierMatches = self->_payloadAppIdentifierMatches;
  self->_payloadAppIdentifierMatches = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowRoamingCellularData" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v22];
    id v14 = v22;
    payloadAllowRoamingCellularData = self->_payloadAllowRoamingCellularData;
    self->_payloadAllowRoamingCellularData = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowCellularData" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v21];
      id v14 = v21;
      payloadAllowCellularData = self->_payloadAllowCellularData;
      self->_payloadAllowCellularData = v18;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AppIdentifierMatches" withValue:self->_payloadAppIdentifierMatches itemSerializer:&__block_literal_global_104 isRequired:0 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AllowRoamingCellularData" withValue:self->_payloadAllowRoamingCellularData isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AllowCellularData" withValue:self->_payloadAllowCellularData isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkUsageRulesDeclaration_ApplicationRulesItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadAppIdentifierMatches copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowRoamingCellularData copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowCellularData copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)payloadAppIdentifierMatches
{
  return self->_payloadAppIdentifierMatches;
}

- (void)setPayloadAppIdentifierMatches:(id)a3
{
}

- (NSNumber)payloadAllowRoamingCellularData
{
  return self->_payloadAllowRoamingCellularData;
}

- (void)setPayloadAllowRoamingCellularData:(id)a3
{
}

- (NSNumber)payloadAllowCellularData
{
  return self->_payloadAllowCellularData;
}

- (void)setPayloadAllowCellularData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowCellularData, 0);
  objc_storeStrong((id *)&self->_payloadAllowRoamingCellularData, 0);

  objc_storeStrong((id *)&self->_payloadAppIdentifierMatches, 0);
}

@end