@interface CEMNetworkUsageRulesDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withApplicationRules:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withApplicationRules:(id)a4;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadApplicationRules;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadApplicationRules:(id)a3;
@end

@implementation CEMNetworkUsageRulesDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.usagerules";
}

+ (id)profileType
{
  return @"com.apple.networkusagerules";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ApplicationRules";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
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

+ (id)buildWithIdentifier:(id)a3 withApplicationRules:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.usagerules"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadApplicationRules:v6];

  [v7 updateServerHash];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withApplicationRules:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.usagerules"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadApplicationRules:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMNetworkUsageRulesDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v7 withKey:@"ApplicationRules" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadApplicationRules = self->_payloadApplicationRules;
  self->_payloadApplicationRules = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadApplicationRules = self->_payloadApplicationRules;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CEMNetworkUsageRulesDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C8FD8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"ApplicationRules" withValue:payloadApplicationRules itemSerializer:v10 isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __70__CEMNetworkUsageRulesDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMNetworkUsageRulesDeclaration;
  id v4 = [(CEMDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadApplicationRules copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (NSArray)payloadApplicationRules
{
  return self->_payloadApplicationRules;
}

- (void)setPayloadApplicationRules:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __74__CEMNetworkUsageRulesDeclaration_ApplicationRulesItem_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __91__CEMNetworkUsageRulesDeclaration_ApplicationRulesItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end