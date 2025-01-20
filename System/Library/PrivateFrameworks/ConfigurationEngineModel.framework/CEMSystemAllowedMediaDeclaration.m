@interface CEMSystemAllowedMediaDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withLogoutEject:(id)a4 withMountControls:(id)a5 withUnmountControls:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadLogoutEject;
- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadMountControls;
- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadUnmountControls;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadLogoutEject:(id)a3;
- (void)setPayloadMountControls:(id)a3;
- (void)setPayloadUnmountControls:(id)a3;
@end

@implementation CEMSystemAllowedMediaDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.disk.allowed";
}

+ (id)profileType
{
  return @"com.apple.systemuiserver";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"logout-eject";
  v6[1] = @"mount-controls";
  v6[2] = @"unmount-controls";
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

+ (id)buildWithIdentifier:(id)a3 withLogoutEject:(id)a4 withMountControls:(id)a5 withUnmountControls:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.system.disk.allowed"];
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
  [v13 setPayloadLogoutEject:v12];

  [v13 setPayloadMountControls:v11];
  [v13 setPayloadUnmountControls:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.disk.allowed"];
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

  id v10 = +[CEMSystemAllowedMediaDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"logout-eject" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadLogoutEject = self->_payloadLogoutEject;
  self->_payloadLogoutEject = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"mount-controls" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadMountControls = self->_payloadMountControls;
    self->_payloadMountControls = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"unmount-controls" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadUnmountControls = self->_payloadUnmountControls;
      self->_payloadUnmountControls = v18;
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
  payloadLogoutEject = self->_payloadLogoutEject;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_2642C87E8;
  id v7 = v4;
  id v19 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"logout-eject" withValue:payloadLogoutEject dictSerializer:v18 isRequired:0 defaultValue:0];
  payloadMountControls = self->_payloadMountControls;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v16[3] = &unk_2642C87E8;
  id v9 = v7;
  id v17 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"mount-controls" withValue:payloadMountControls dictSerializer:v16 isRequired:0 defaultValue:0];
  payloadUnmountControls = self->_payloadUnmountControls;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v14[3] = &unk_2642C87E8;
  id v15 = v9;
  id v11 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"unmount-controls" withValue:payloadUnmountControls dictSerializer:v14 isRequired:0 defaultValue:0];
  id v12 = (void *)[v5 copy];

  return v12;
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __71__CEMSystemAllowedMediaDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemAllowedMediaDeclaration;
  id v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(CEMSystemAllowedMediaDeclaration_MediaItems *)self->_payloadLogoutEject copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMSystemAllowedMediaDeclaration_MediaItems *)self->_payloadMountControls copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMSystemAllowedMediaDeclaration_MediaItems *)self->_payloadUnmountControls copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadLogoutEject
{
  return self->_payloadLogoutEject;
}

- (void)setPayloadLogoutEject:(id)a3
{
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadMountControls
{
  return self->_payloadMountControls;
}

- (void)setPayloadMountControls:(id)a3
{
}

- (CEMSystemAllowedMediaDeclaration_MediaItems)payloadUnmountControls
{
  return self->_payloadUnmountControls;
}

- (void)setPayloadUnmountControls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUnmountControls, 0);
  objc_storeStrong((id *)&self->_payloadMountControls, 0);

  objc_storeStrong((id *)&self->_payloadLogoutEject, 0);
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __65__CEMSystemAllowedMediaDeclaration_MediaItems_loadPayload_error___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __82__CEMSystemAllowedMediaDeclaration_MediaItems_serializePayloadWithAssetProviders___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end