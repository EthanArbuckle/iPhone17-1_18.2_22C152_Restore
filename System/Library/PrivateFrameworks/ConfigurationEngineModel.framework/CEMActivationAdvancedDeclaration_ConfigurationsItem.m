@interface CEMActivationAdvancedDeclaration_ConfigurationsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withOverrides:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAnyPayload)payloadOverrides;
- (NSString)payloadIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadOverrides:(id)a3;
@end

@implementation CEMActivationAdvancedDeclaration_ConfigurationsItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"Overrides";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withOverrides:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadIdentifier:v6];

  [v7 setPayloadOverrides:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadIdentifier:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMActivationAdvancedDeclaration_ConfigurationsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Overrides" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadOverrides = self->_payloadOverrides;
    self->_payloadOverrides = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Identifier" withValue:self->_payloadIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v4 withKey:@"Overrides" withValue:self->_payloadOverrides dictSerializer:&__block_literal_global_108 isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMActivationAdvancedDeclaration_ConfigurationsItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMAnyPayload *)self->_payloadOverrides copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
}

- (CEMAnyPayload)payloadOverrides
{
  return self->_payloadOverrides;
}

- (void)setPayloadOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadOverrides, 0);

  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
}

@end