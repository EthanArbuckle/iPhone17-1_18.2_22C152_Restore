@interface CEMActivationAdvancedDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5 withActivationPredicate:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAnyPayload)payloadActivationPredicate;
- (NSArray)payloadRequiredConfigurations;
- (NSArray)payloadStandardConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadActivationPredicate:(id)a3;
- (void)setPayloadRequiredConfigurations:(id)a3;
- (void)setPayloadStandardConfigurations:(id)a3;
@end

@implementation CEMActivationAdvancedDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.activation.advanced";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RequiredConfigurations";
  v6[1] = @"StandardConfigurations";
  v6[2] = @"ActivationPredicate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5 withActivationPredicate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.activation.advanced"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadRequiredConfigurations:v12];

  [v13 setPayloadStandardConfigurations:v11];
  [v13 setPayloadActivationPredicate:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.activation.advanced"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadRequiredConfigurations:v9];

  [v10 setPayloadStandardConfigurations:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMActivationAdvancedDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"RequiredConfigurations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadRequiredConfigurations = self->_payloadRequiredConfigurations;
  self->_payloadRequiredConfigurations = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"StandardConfigurations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadStandardConfigurations = self->_payloadStandardConfigurations;
    self->_payloadStandardConfigurations = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ActivationPredicate" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadActivationPredicate = self->_payloadActivationPredicate;
      self->_payloadActivationPredicate = v18;
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
  payloadRequiredConfigurations = self->_payloadRequiredConfigurations;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C88E0;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"RequiredConfigurations" withValue:payloadRequiredConfigurations itemSerializer:v17 isRequired:1 defaultValue:0];
  payloadStandardConfigurations = self->_payloadStandardConfigurations;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C88E0;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"StandardConfigurations" withValue:payloadStandardConfigurations itemSerializer:&v12 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5, @"ActivationPredicate", self->_payloadActivationPredicate, &__block_literal_global, 0, 0, v12, v13, v14, v15 withKey withValue dictSerializer isRequired defaultValue];
  id v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMActivationAdvancedDeclaration;
  id v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadRequiredConfigurations copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadStandardConfigurations copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMAnyPayload *)self->_payloadActivationPredicate copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSArray)payloadRequiredConfigurations
{
  return self->_payloadRequiredConfigurations;
}

- (void)setPayloadRequiredConfigurations:(id)a3
{
}

- (NSArray)payloadStandardConfigurations
{
  return self->_payloadStandardConfigurations;
}

- (void)setPayloadStandardConfigurations:(id)a3
{
}

- (CEMAnyPayload)payloadActivationPredicate
{
  return self->_payloadActivationPredicate;
}

- (void)setPayloadActivationPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadActivationPredicate, 0);
  objc_storeStrong((id *)&self->_payloadStandardConfigurations, 0);

  objc_storeStrong((id *)&self->_payloadRequiredConfigurations, 0);
}

uint64_t __90__CEMActivationAdvancedDeclaration_ConfigurationsItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __59__CEMActivationAdvancedDeclaration_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end