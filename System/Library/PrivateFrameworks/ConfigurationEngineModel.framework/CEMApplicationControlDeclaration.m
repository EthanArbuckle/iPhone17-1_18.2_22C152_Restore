@interface CEMApplicationControlDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withInstallSchedule:(id)a4 withUpdatePolicy:(id)a5 withUpdateSchedule:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMApplicationControlDeclaration_InstallSchedule)payloadInstallSchedule;
- (CEMApplicationControlDeclaration_UpdateSchedule)payloadUpdateSchedule;
- (NSString)payloadUpdatePolicy;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadInstallSchedule:(id)a3;
- (void)setPayloadUpdatePolicy:(id)a3;
- (void)setPayloadUpdateSchedule:(id)a3;
@end

@implementation CEMApplicationControlDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.control";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"InstallSchedule";
  v6[1] = @"UpdatePolicy";
  v6[2] = @"UpdateSchedule";
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
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withInstallSchedule:(id)a4 withUpdatePolicy:(id)a5 withUpdateSchedule:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = (__CFString *)a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.application.control"];
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
  [v13 setPayloadInstallSchedule:v12];

  if (v11) {
    v16 = v11;
  }
  else {
    v16 = @"Default";
  }
  [v13 setPayloadUpdatePolicy:v16];

  [v13 setPayloadUpdateSchedule:v10];
  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.control"];
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

  id v10 = +[CEMApplicationControlDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"InstallSchedule" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadInstallSchedule = self->_payloadInstallSchedule;
  self->_payloadInstallSchedule = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UpdatePolicy" isRequired:0 defaultValue:@"Default" error:&v22];
    id v14 = v22;
    payloadUpdatePolicy = self->_payloadUpdatePolicy;
    self->_payloadUpdatePolicy = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"UpdateSchedule" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadUpdateSchedule = self->_payloadUpdateSchedule;
      self->_payloadUpdateSchedule = v18;
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
  payloadInstallSchedule = self->_payloadInstallSchedule;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"InstallSchedule" withValue:payloadInstallSchedule dictSerializer:v17 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"UpdatePolicy" withValue:self->_payloadUpdatePolicy isRequired:0 defaultValue:@"Default"];
  payloadUpdateSchedule = self->_payloadUpdateSchedule;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C87E8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"UpdateSchedule" withValue:payloadUpdateSchedule dictSerializer:&v12 isRequired:0 defaultValue:0];
  id v10 = objc_msgSend(v5, "copy", v12, v13, v14, v15);

  return v10;
}

uint64_t __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMApplicationControlDeclaration;
  id v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(CEMApplicationControlDeclaration_InstallSchedule *)self->_payloadInstallSchedule copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUpdatePolicy copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMApplicationControlDeclaration_UpdateSchedule *)self->_payloadUpdateSchedule copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (CEMApplicationControlDeclaration_InstallSchedule)payloadInstallSchedule
{
  return self->_payloadInstallSchedule;
}

- (void)setPayloadInstallSchedule:(id)a3
{
}

- (NSString)payloadUpdatePolicy
{
  return self->_payloadUpdatePolicy;
}

- (void)setPayloadUpdatePolicy:(id)a3
{
}

- (CEMApplicationControlDeclaration_UpdateSchedule)payloadUpdateSchedule
{
  return self->_payloadUpdateSchedule;
}

- (void)setPayloadUpdateSchedule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUpdateSchedule, 0);
  objc_storeStrong((id *)&self->_payloadUpdatePolicy, 0);

  objc_storeStrong((id *)&self->_payloadInstallSchedule, 0);
}

@end