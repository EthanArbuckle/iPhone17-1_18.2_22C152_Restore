@interface CEMSystemEnergySaverDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withComappleEnergySaverdesktopACPower:(id)a4 withComappleEnergySaverportableACPower:(id)a5 withComappleEnergySaverportableBatteryPower:(id)a6 withComappleEnergySaverdesktopSchedule:(id)a7 withSleepDisabled:(id)a8 withDestroyFVKeyOnStandby:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMSystemEnergySaverDeclaration_EnergySaverSchedule)payloadComappleEnergySaverdesktopSchedule;
- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverdesktopACPower;
- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableACPower;
- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableBatteryPower;
- (NSNumber)payloadDestroyFVKeyOnStandby;
- (NSNumber)payloadSleepDisabled;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadComappleEnergySaverdesktopACPower:(id)a3;
- (void)setPayloadComappleEnergySaverdesktopSchedule:(id)a3;
- (void)setPayloadComappleEnergySaverportableACPower:(id)a3;
- (void)setPayloadComappleEnergySaverportableBatteryPower:(id)a3;
- (void)setPayloadDestroyFVKeyOnStandby:(id)a3;
- (void)setPayloadSleepDisabled:(id)a3;
@end

@implementation CEMSystemEnergySaverDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.energysaver";
}

+ (id)profileType
{
  return @"com.apple.MCX";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"com.apple.EnergySaver.desktop.ACPower";
  v6[1] = @"com.apple.EnergySaver.portable.ACPower";
  v6[2] = @"com.apple.EnergySaver.portable.BatteryPower";
  v6[3] = @"com.apple.EnergySaver.desktop.Schedule";
  v6[4] = @"SleepDisabled";
  v6[5] = @"DestroyFVKeyOnStandby";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
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

+ (id)buildWithIdentifier:(id)a3 withComappleEnergySaverdesktopACPower:(id)a4 withComappleEnergySaverportableACPower:(id)a5 withComappleEnergySaverportableBatteryPower:(id)a6 withComappleEnergySaverdesktopSchedule:(id)a7 withSleepDisabled:(id)a8 withDestroyFVKeyOnStandby:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.system.energysaver"];
  if (v14)
  {
    [v21 setDeclarationIdentifier:v14];
  }
  else
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v22 UUIDString];
    [v21 setDeclarationIdentifier:v23];
  }
  [v21 setPayloadComappleEnergySaverdesktopACPower:v20];

  [v21 setPayloadComappleEnergySaverportableACPower:v19];
  [v21 setPayloadComappleEnergySaverportableBatteryPower:v18];

  [v21 setPayloadComappleEnergySaverdesktopSchedule:v17];
  v24 = (void *)MEMORY[0x263EFFA80];
  if (v16) {
    id v25 = v16;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA80];
  }
  [v21 setPayloadSleepDisabled:v25];

  if (v15) {
    id v26 = v15;
  }
  else {
    id v26 = v24;
  }
  [v21 setPayloadDestroyFVKeyOnStandby:v26];

  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.energysaver"];
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

  v10 = +[CEMSystemEnergySaverDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"com.apple.EnergySaver.desktop.ACPower" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadComappleEnergySaverdesktopACPower = self->_payloadComappleEnergySaverdesktopACPower;
  self->_payloadComappleEnergySaverdesktopACPower = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"com.apple.EnergySaver.portable.ACPower" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v31];
    id v14 = v31;
    payloadComappleEnergySaverportableACPower = self->_payloadComappleEnergySaverportableACPower;
    self->_payloadComappleEnergySaverportableACPower = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"com.apple.EnergySaver.portable.BatteryPower" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadComappleEnergySaverportableBatteryPower = self->_payloadComappleEnergySaverportableBatteryPower;
      self->_payloadComappleEnergySaverportableBatteryPower = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"com.apple.EnergySaver.desktop.Schedule" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v29];
        id v14 = v29;
        payloadComappleEnergySaverdesktopSchedule = self->_payloadComappleEnergySaverdesktopSchedule;
        self->_payloadComappleEnergySaverdesktopSchedule = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SleepDisabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v28];
          id v14 = v28;
          payloadSleepDisabled = self->_payloadSleepDisabled;
          self->_payloadSleepDisabled = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DestroyFVKeyOnStandby" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v27];
            id v14 = v27;
            payloadDestroyFVKeyOnStandby = self->_payloadDestroyFVKeyOnStandby;
            self->_payloadDestroyFVKeyOnStandby = v24;
          }
        }
      }
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
  payloadComappleEnergySaverdesktopACPower = self->_payloadComappleEnergySaverdesktopACPower;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v26[3] = &unk_2642C87E8;
  id v7 = v4;
  id v27 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"com.apple.EnergySaver.desktop.ACPower" withValue:payloadComappleEnergySaverdesktopACPower dictSerializer:v26 isRequired:0 defaultValue:0];
  payloadComappleEnergySaverportableACPower = self->_payloadComappleEnergySaverportableACPower;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v24[3] = &unk_2642C87E8;
  id v9 = v7;
  id v25 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"com.apple.EnergySaver.portable.ACPower" withValue:payloadComappleEnergySaverportableACPower dictSerializer:v24 isRequired:0 defaultValue:0];
  payloadComappleEnergySaverportableBatteryPower = self->_payloadComappleEnergySaverportableBatteryPower;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v22[3] = &unk_2642C87E8;
  id v11 = v9;
  id v23 = v11;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"com.apple.EnergySaver.portable.BatteryPower" withValue:payloadComappleEnergySaverportableBatteryPower dictSerializer:v22 isRequired:0 defaultValue:0];
  payloadComappleEnergySaverdesktopSchedule = self->_payloadComappleEnergySaverdesktopSchedule;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  id v20 = &unk_2642C87E8;
  id v21 = v11;
  id v13 = v11;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"com.apple.EnergySaver.desktop.Schedule" withValue:payloadComappleEnergySaverdesktopSchedule dictSerializer:&v17 isRequired:0 defaultValue:0];
  uint64_t v14 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5, @"SleepDisabled", self->_payloadSleepDisabled, 0, MEMORY[0x263EFFA80], v17, v18, v19, v20 withKey withValue isRequired defaultValue];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"DestroyFVKeyOnStandby" withValue:self->_payloadDestroyFVKeyOnStandby isRequired:0 defaultValue:v14];
  id v15 = (void *)[v5 copy];

  return v15;
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMSystemEnergySaverDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(CEMSystemEnergySaverDeclaration_PowerSettings *)self->_payloadComappleEnergySaverdesktopACPower copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMSystemEnergySaverDeclaration_PowerSettings *)self->_payloadComappleEnergySaverportableACPower copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMSystemEnergySaverDeclaration_PowerSettings *)self->_payloadComappleEnergySaverportableBatteryPower copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(CEMSystemEnergySaverDeclaration_EnergySaverSchedule *)self->_payloadComappleEnergySaverdesktopSchedule copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadSleepDisabled copy];
  uint64_t v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadDestroyFVKeyOnStandby copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverdesktopACPower
{
  return self->_payloadComappleEnergySaverdesktopACPower;
}

- (void)setPayloadComappleEnergySaverdesktopACPower:(id)a3
{
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableACPower
{
  return self->_payloadComappleEnergySaverportableACPower;
}

- (void)setPayloadComappleEnergySaverportableACPower:(id)a3
{
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableBatteryPower
{
  return self->_payloadComappleEnergySaverportableBatteryPower;
}

- (void)setPayloadComappleEnergySaverportableBatteryPower:(id)a3
{
}

- (CEMSystemEnergySaverDeclaration_EnergySaverSchedule)payloadComappleEnergySaverdesktopSchedule
{
  return self->_payloadComappleEnergySaverdesktopSchedule;
}

- (void)setPayloadComappleEnergySaverdesktopSchedule:(id)a3
{
}

- (NSNumber)payloadSleepDisabled
{
  return self->_payloadSleepDisabled;
}

- (void)setPayloadSleepDisabled:(id)a3
{
}

- (NSNumber)payloadDestroyFVKeyOnStandby
{
  return self->_payloadDestroyFVKeyOnStandby;
}

- (void)setPayloadDestroyFVKeyOnStandby:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDestroyFVKeyOnStandby, 0);
  objc_storeStrong((id *)&self->_payloadSleepDisabled, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverdesktopSchedule, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverportableBatteryPower, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverportableACPower, 0);

  objc_storeStrong((id *)&self->_payloadComappleEnergySaverdesktopACPower, 0);
}

uint64_t __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

@end