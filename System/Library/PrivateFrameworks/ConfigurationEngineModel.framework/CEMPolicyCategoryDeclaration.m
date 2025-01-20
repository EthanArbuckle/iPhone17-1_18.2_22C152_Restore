@interface CEMPolicyCategoryDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withMode:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withMode:(id)a4 withCategories:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withMode:(id)a4 withCategories:(id)a5 withCategoriesVersion2:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadCategories;
- (NSArray)payloadCategoriesVersion2;
- (NSString)payloadMode;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCategories:(id)a3;
- (void)setPayloadCategoriesVersion2:(id)a3;
- (void)setPayloadMode:(id)a3;
@end

@implementation CEMPolicyCategoryDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.policy.category";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Mode";
  v6[1] = @"Categories";
  v6[2] = @"CategoriesVersion2";
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

+ (id)buildWithIdentifier:(id)a3 withMode:(id)a4 withCategories:(id)a5 withCategoriesVersion2:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.policy.category"];
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
  [v13 setPayloadMode:v12];

  [v13 setPayloadCategories:v11];
  [v13 setPayloadCategoriesVersion2:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildWithIdentifier:(id)a3 withMode:(id)a4 withCategories:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.policy.category"];
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
  [v10 setPayloadMode:v9];

  [v10 setPayloadCategories:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withMode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.policy.category"];
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
  [v7 setPayloadMode:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMPolicyCategoryDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Mode" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadMode = self->_payloadMode;
  self->_payloadMode = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Categories" validator:&__block_literal_global_29 isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadCategories = self->_payloadCategories;
    self->_payloadCategories = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"CategoriesVersion2" validator:&__block_literal_global_38_0 isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadCategoriesVersion2 = self->_payloadCategoriesVersion2;
      self->_payloadCategoriesVersion2 = v18;
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __50__CEMPolicyCategoryDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMPolicyCategoryDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Mode" withValue:self->_payloadMode isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"Categories" withValue:self->_payloadCategories itemSerializer:&__block_literal_global_42_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"CategoriesVersion2" withValue:self->_payloadCategoriesVersion2 itemSerializer:&__block_literal_global_44_0 isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

id __67__CEMPolicyCategoryDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __67__CEMPolicyCategoryDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMPolicyCategoryDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadMode copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadCategories copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadCategoriesVersion2 copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSString)payloadMode
{
  return self->_payloadMode;
}

- (void)setPayloadMode:(id)a3
{
}

- (NSArray)payloadCategories
{
  return self->_payloadCategories;
}

- (void)setPayloadCategories:(id)a3
{
}

- (NSArray)payloadCategoriesVersion2
{
  return self->_payloadCategoriesVersion2;
}

- (void)setPayloadCategoriesVersion2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCategoriesVersion2, 0);
  objc_storeStrong((id *)&self->_payloadCategories, 0);

  objc_storeStrong((id *)&self->_payloadMode, 0);
}

@end