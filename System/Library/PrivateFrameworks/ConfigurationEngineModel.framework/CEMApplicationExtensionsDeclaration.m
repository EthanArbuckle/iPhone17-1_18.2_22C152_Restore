@interface CEMApplicationExtensionsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowedExtensions:(id)a4 withDeniedExtensions:(id)a5 withDeniedExtensionPoints:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadAllowedExtensions;
- (NSArray)payloadDeniedExtensionPoints;
- (NSArray)payloadDeniedExtensions;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowedExtensions:(id)a3;
- (void)setPayloadDeniedExtensionPoints:(id)a3;
- (void)setPayloadDeniedExtensions:(id)a3;
@end

@implementation CEMApplicationExtensionsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.extension";
}

+ (id)profileType
{
  return @"com.apple.NSExtension";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AllowedExtensions";
  v6[1] = @"DeniedExtensions";
  v6[2] = @"DeniedExtensionPoints";
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withAllowedExtensions:(id)a4 withDeniedExtensions:(id)a5 withDeniedExtensionPoints:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.application.extension"];
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
  [v13 setPayloadAllowedExtensions:v12];

  [v13 setPayloadDeniedExtensions:v11];
  [v13 setPayloadDeniedExtensionPoints:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.extension"];
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

  id v10 = +[CEMApplicationExtensionsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AllowedExtensions" validator:&__block_literal_global_3 isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadAllowedExtensions = self->_payloadAllowedExtensions;
  self->_payloadAllowedExtensions = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"DeniedExtensions" validator:&__block_literal_global_23 isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadDeniedExtensions = self->_payloadDeniedExtensions;
    self->_payloadDeniedExtensions = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"DeniedExtensionPoints" validator:&__block_literal_global_25 isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadDeniedExtensionPoints = self->_payloadDeniedExtensionPoints;
      self->_payloadDeniedExtensionPoints = v18;
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __57__CEMApplicationExtensionsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__CEMApplicationExtensionsDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__CEMApplicationExtensionsDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AllowedExtensions" withValue:self->_payloadAllowedExtensions itemSerializer:&__block_literal_global_29 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"DeniedExtensions" withValue:self->_payloadDeniedExtensions itemSerializer:&__block_literal_global_31 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"DeniedExtensionPoints" withValue:self->_payloadDeniedExtensionPoints itemSerializer:&__block_literal_global_33 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

id __74__CEMApplicationExtensionsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __74__CEMApplicationExtensionsDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __74__CEMApplicationExtensionsDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMApplicationExtensionsDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadAllowedExtensions copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadDeniedExtensions copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadDeniedExtensionPoints copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSArray)payloadAllowedExtensions
{
  return self->_payloadAllowedExtensions;
}

- (void)setPayloadAllowedExtensions:(id)a3
{
}

- (NSArray)payloadDeniedExtensions
{
  return self->_payloadDeniedExtensions;
}

- (void)setPayloadDeniedExtensions:(id)a3
{
}

- (NSArray)payloadDeniedExtensionPoints
{
  return self->_payloadDeniedExtensionPoints;
}

- (void)setPayloadDeniedExtensionPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDeniedExtensionPoints, 0);
  objc_storeStrong((id *)&self->_payloadDeniedExtensions, 0);

  objc_storeStrong((id *)&self->_payloadAllowedExtensions, 0);
}

@end