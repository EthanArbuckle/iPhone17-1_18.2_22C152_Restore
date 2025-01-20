@interface CEMNetworkDomainsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withEmailDomains:(id)a4 withWebDomains:(id)a5 withSafariPasswordAutoFillDomains:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadEmailDomains;
- (NSArray)payloadSafariPasswordAutoFillDomains;
- (NSArray)payloadWebDomains;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadEmailDomains:(id)a3;
- (void)setPayloadSafariPasswordAutoFillDomains:(id)a3;
- (void)setPayloadWebDomains:(id)a3;
@end

@implementation CEMNetworkDomainsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.domains";
}

+ (id)profileType
{
  return @"com.apple.domains";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EmailDomains";
  v6[1] = @"WebDomains";
  v6[2] = @"SafariPasswordAutoFillDomains";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withEmailDomains:(id)a4 withWebDomains:(id)a5 withSafariPasswordAutoFillDomains:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.network.domains"];
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
  [v13 setPayloadEmailDomains:v12];

  [v13 setPayloadWebDomains:v11];
  [v13 setPayloadSafariPasswordAutoFillDomains:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.domains"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkDomainsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"EmailDomains" validator:&__block_literal_global_21 isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadEmailDomains = self->_payloadEmailDomains;
  self->_payloadEmailDomains = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"WebDomains" validator:&__block_literal_global_23_0 isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadWebDomains = self->_payloadWebDomains;
    self->_payloadWebDomains = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SafariPasswordAutoFillDomains" validator:&__block_literal_global_25_0 isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadSafariPasswordAutoFillDomains = self->_payloadSafariPasswordAutoFillDomains;
      self->_payloadSafariPasswordAutoFillDomains = v18;
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"EmailDomains" withValue:self->_payloadEmailDomains itemSerializer:&__block_literal_global_29_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"WebDomains" withValue:self->_payloadWebDomains itemSerializer:&__block_literal_global_31_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SafariPasswordAutoFillDomains" withValue:self->_payloadSafariPasswordAutoFillDomains itemSerializer:&__block_literal_global_33_0 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkDomainsDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadEmailDomains copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadWebDomains copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadSafariPasswordAutoFillDomains copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSArray)payloadEmailDomains
{
  return self->_payloadEmailDomains;
}

- (void)setPayloadEmailDomains:(id)a3
{
}

- (NSArray)payloadWebDomains
{
  return self->_payloadWebDomains;
}

- (void)setPayloadWebDomains:(id)a3
{
}

- (NSArray)payloadSafariPasswordAutoFillDomains
{
  return self->_payloadSafariPasswordAutoFillDomains;
}

- (void)setPayloadSafariPasswordAutoFillDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSafariPasswordAutoFillDomains, 0);
  objc_storeStrong((id *)&self->_payloadWebDomains, 0);

  objc_storeStrong((id *)&self->_payloadEmailDomains, 0);
}

@end