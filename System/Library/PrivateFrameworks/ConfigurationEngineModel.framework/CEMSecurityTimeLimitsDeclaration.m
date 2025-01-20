@interface CEMSecurityTimeLimitsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4 withTimeLimits:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMSecurityTimeLimitsDeclaration_TimeLimits)payloadTimeLimits;
- (NSNumber)payloadFamilyControlsEnabled;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadFamilyControlsEnabled:(id)a3;
- (void)setPayloadTimeLimits:(id)a3;
@end

@implementation CEMSecurityTimeLimitsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.timelimits";
}

+ (id)profileType
{
  return @"com.apple.familycontrols.timelimits.v2";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"familyControlsEnabled";
  v6[1] = @"time-limits";
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

+ (id)buildWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4 withTimeLimits:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.security.timelimits"];
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
  [v10 setPayloadFamilyControlsEnabled:v9];

  [v10 setPayloadTimeLimits:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.security.timelimits"];
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
  [v7 setPayloadFamilyControlsEnabled:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityTimeLimitsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"familyControlsEnabled" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadFamilyControlsEnabled = self->_payloadFamilyControlsEnabled;
  self->_payloadFamilyControlsEnabled = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"time-limits" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadTimeLimits = self->_payloadTimeLimits;
    self->_payloadTimeLimits = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"familyControlsEnabled" withValue:self->_payloadFamilyControlsEnabled isRequired:1 defaultValue:0];
  payloadTimeLimits = self->_payloadTimeLimits;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__CEMSecurityTimeLimitsDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"time-limits" withValue:payloadTimeLimits dictSerializer:v10 isRequired:0 defaultValue:0];
  id v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __71__CEMSecurityTimeLimitsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSecurityTimeLimitsDeclaration;
  id v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadFamilyControlsEnabled copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMSecurityTimeLimitsDeclaration_TimeLimits *)self->_payloadTimeLimits copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSNumber)payloadFamilyControlsEnabled
{
  return self->_payloadFamilyControlsEnabled;
}

- (void)setPayloadFamilyControlsEnabled:(id)a3
{
}

- (CEMSecurityTimeLimitsDeclaration_TimeLimits)payloadTimeLimits
{
  return self->_payloadTimeLimits;
}

- (void)setPayloadTimeLimits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTimeLimits, 0);

  objc_storeStrong((id *)&self->_payloadFamilyControlsEnabled, 0);
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

@end