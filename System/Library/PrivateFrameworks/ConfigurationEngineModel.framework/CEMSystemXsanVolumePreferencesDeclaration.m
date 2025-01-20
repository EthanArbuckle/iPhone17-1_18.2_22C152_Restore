@interface CEMSystemXsanVolumePreferencesDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withOnlyMount:(id)a4 withDenyMount:(id)a5 withDenyDLC:(id)a6 withPreferDLC:(id)a7 withUseDLC:(id)a8;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadDenyDLC;
- (NSArray)payloadDenyMount;
- (NSArray)payloadOnlyMount;
- (NSArray)payloadPreferDLC;
- (NSNumber)payloadUseDLC;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadDenyDLC:(id)a3;
- (void)setPayloadDenyMount:(id)a3;
- (void)setPayloadOnlyMount:(id)a3;
- (void)setPayloadPreferDLC:(id)a3;
- (void)setPayloadUseDLC:(id)a3;
@end

@implementation CEMSystemXsanVolumePreferencesDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.xsan.volumes";
}

+ (id)profileType
{
  return @"com.apple.xsan.preferences";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"onlyMount";
  v6[1] = @"denyMount";
  v6[2] = @"denyDLC";
  v6[3] = @"preferDLC";
  v6[4] = @"useDLC";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
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
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withOnlyMount:(id)a4 withDenyMount:(id)a5 withDenyDLC:(id)a6 withPreferDLC:(id)a7 withUseDLC:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.system.xsan.volumes"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  [v19 setPayloadOnlyMount:v18];

  [v19 setPayloadDenyMount:v17];
  [v19 setPayloadDenyDLC:v16];

  [v19 setPayloadPreferDLC:v15];
  if (v14) {
    id v22 = v14;
  }
  else {
    id v22 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setPayloadUseDLC:v22];

  [v19 updateServerHash];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.xsan.volumes"];
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
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemXsanVolumePreferencesDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"onlyMount" validator:&__block_literal_global_41 isRequired:0 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadOnlyMount = self->_payloadOnlyMount;
  self->_payloadOnlyMount = v13;

  if (!v14)
  {
    id v28 = 0;
    id v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"denyMount" validator:&__block_literal_global_29_1 isRequired:0 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadDenyMount = self->_payloadDenyMount;
    self->_payloadDenyMount = v16;

    if (!v14)
    {
      id v27 = 0;
      id v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"denyDLC" validator:&__block_literal_global_31_1 isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadDenyDLC = self->_payloadDenyDLC;
      self->_payloadDenyDLC = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"preferDLC" validator:&__block_literal_global_33_2 isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadPreferDLC = self->_payloadPreferDLC;
        self->_payloadPreferDLC = v20;

        if (!v14)
        {
          id v25 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"useDLC" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v25];
          id v14 = v25;
          payloadUseDLC = self->_payloadUseDLC;
          self->_payloadUseDLC = v22;
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemXsanVolumePreferencesDeclaration_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"onlyMount" withValue:self->_payloadOnlyMount itemSerializer:&__block_literal_global_37_1 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"denyMount" withValue:self->_payloadDenyMount itemSerializer:&__block_literal_global_39 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"denyDLC" withValue:self->_payloadDenyDLC itemSerializer:&__block_literal_global_41 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"preferDLC" withValue:self->_payloadPreferDLC itemSerializer:&__block_literal_global_43_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"useDLC" withValue:self->_payloadUseDLC isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  v5 = (void *)[v4 copy];

  return v5;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __80__CEMSystemXsanVolumePreferencesDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMSystemXsanVolumePreferencesDeclaration;
  v4 = [(CEMDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadOnlyMount copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadDenyMount copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadDenyDLC copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadPreferDLC copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadUseDLC copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSArray)payloadOnlyMount
{
  return self->_payloadOnlyMount;
}

- (void)setPayloadOnlyMount:(id)a3
{
}

- (NSArray)payloadDenyMount
{
  return self->_payloadDenyMount;
}

- (void)setPayloadDenyMount:(id)a3
{
}

- (NSArray)payloadDenyDLC
{
  return self->_payloadDenyDLC;
}

- (void)setPayloadDenyDLC:(id)a3
{
}

- (NSArray)payloadPreferDLC
{
  return self->_payloadPreferDLC;
}

- (void)setPayloadPreferDLC:(id)a3
{
}

- (NSNumber)payloadUseDLC
{
  return self->_payloadUseDLC;
}

- (void)setPayloadUseDLC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUseDLC, 0);
  objc_storeStrong((id *)&self->_payloadPreferDLC, 0);
  objc_storeStrong((id *)&self->_payloadDenyDLC, 0);
  objc_storeStrong((id *)&self->_payloadDenyMount, 0);

  objc_storeStrong((id *)&self->_payloadOnlyMount, 0);
}

@end