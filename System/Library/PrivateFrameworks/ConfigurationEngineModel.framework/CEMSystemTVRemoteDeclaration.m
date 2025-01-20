@interface CEMSystemTVRemoteDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowedRemotes:(id)a4 withAllowedTVs:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadAllowedRemotes;
- (NSArray)payloadAllowedTVs;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowedRemotes:(id)a3;
- (void)setPayloadAllowedTVs:(id)a3;
@end

@implementation CEMSystemTVRemoteDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.tvremote";
}

+ (id)profileType
{
  return @"com.apple.tvremote";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AllowedRemotes";
  v6[1] = @"AllowedTVs";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
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
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowedRemotes:(id)a4 withAllowedTVs:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.system.tvremote"];
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
  [v10 setPayloadAllowedRemotes:v9];

  [v10 setPayloadAllowedTVs:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.tvremote"];
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
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemTVRemoteDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AllowedRemotes" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadAllowedRemotes = self->_payloadAllowedRemotes;
  self->_payloadAllowedRemotes = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AllowedTVs" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadAllowedTVs = self->_payloadAllowedTVs;
    self->_payloadAllowedTVs = v16;
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
  payloadAllowedRemotes = self->_payloadAllowedRemotes;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__CEMSystemTVRemoteDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C9CE0;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"AllowedRemotes" withValue:payloadAllowedRemotes itemSerializer:v17 isRequired:0 defaultValue:0];
  payloadAllowedTVs = self->_payloadAllowedTVs;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __67__CEMSystemTVRemoteDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C9D08;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"AllowedTVs" withValue:payloadAllowedTVs itemSerializer:&v12 isRequired:0 defaultValue:0];
  v10 = objc_msgSend(v5, "copy", v12, v13, v14, v15);

  return v10;
}

uint64_t __67__CEMSystemTVRemoteDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __67__CEMSystemTVRemoteDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemTVRemoteDeclaration;
  id v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadAllowedRemotes copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadAllowedTVs copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadAllowedRemotes
{
  return self->_payloadAllowedRemotes;
}

- (void)setPayloadAllowedRemotes:(id)a3
{
}

- (NSArray)payloadAllowedTVs
{
  return self->_payloadAllowedTVs;
}

- (void)setPayloadAllowedTVs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedTVs, 0);

  objc_storeStrong((id *)&self->_payloadAllowedRemotes, 0);
}

@end