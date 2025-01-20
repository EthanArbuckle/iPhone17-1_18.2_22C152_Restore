@interface CEMActivationSimpleDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withStandardConfigurations:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withStandardConfigurations:(id)a4 withPredicate:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMPredicateBase)payloadPredicate;
- (NSArray)payloadStandardConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadPredicate:(id)a3;
- (void)setPayloadStandardConfigurations:(id)a3;
@end

@implementation CEMActivationSimpleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.activation.simple";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"StandardConfigurations";
  v6[1] = @"Predicate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withStandardConfigurations:(id)a4 withPredicate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.activation.simple"];
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
  [v10 setPayloadStandardConfigurations:v9];

  [v10 setPayloadPredicate:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withStandardConfigurations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.activation.simple"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadStandardConfigurations:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMActivationSimpleDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v22 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"StandardConfigurations" validator:&__block_literal_global_1 isRequired:1 defaultValue:0 error:&v22];
  id v14 = v22;
  payloadStandardConfigurations = self->_payloadStandardConfigurations;
  self->_payloadStandardConfigurations = v13;

  if (!v14)
  {
    id v14 = [v6 objectForKeyedSubscript:@"Predicate"];

    if (!v14)
    {
      BOOL v19 = 1;
      goto LABEL_8;
    }
    v16 = [v6 objectForKeyedSubscript:@"Predicate"];
    id v21 = 0;
    v17 = +[CEMPredicateBase predicateForPayload:v16 error:&v21];
    id v14 = v21;
    payloadPredicate = self->_payloadPredicate;
    self->_payloadPredicate = v17;
  }
  BOOL v19 = v14 == 0;
  if (a4 && v14)
  {
    id v14 = v14;
    BOOL v19 = 0;
    *a4 = v14;
  }
LABEL_8:

  return v19;
}

uint64_t __52__CEMActivationSimpleDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"StandardConfigurations" withValue:self->_payloadStandardConfigurations itemSerializer:&__block_literal_global_20 isRequired:1 defaultValue:0];
  payloadPredicate = self->_payloadPredicate;
  if (payloadPredicate)
  {
    id v6 = [(CEMPayloadBase *)payloadPredicate serializePayload];
    [v4 setObject:v6 forKeyedSubscript:@"Predicate"];
  }
  id v7 = (void *)[v4 copy];

  return v7;
}

id __69__CEMActivationSimpleDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMActivationSimpleDeclaration;
  v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadStandardConfigurations copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMPredicateBase *)self->_payloadPredicate copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadStandardConfigurations
{
  return self->_payloadStandardConfigurations;
}

- (void)setPayloadStandardConfigurations:(id)a3
{
}

- (CEMPredicateBase)payloadPredicate
{
  return self->_payloadPredicate;
}

- (void)setPayloadPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPredicate, 0);

  objc_storeStrong((id *)&self->_payloadStandardConfigurations, 0);
}

uint64_t __57__CEMActivationSimpleDeclaration_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end