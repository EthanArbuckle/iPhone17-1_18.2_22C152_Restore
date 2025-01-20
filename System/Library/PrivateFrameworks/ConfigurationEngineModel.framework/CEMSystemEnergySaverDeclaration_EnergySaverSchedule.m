@interface CEMSystemEnergySaverDeclaration_EnergySaverSchedule
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRepeatingPowerOn:(id)a3 withRepeatingPowerOff:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOff;
- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadRepeatingPowerOff:(id)a3;
- (void)setPayloadRepeatingPowerOn:(id)a3;
@end

@implementation CEMSystemEnergySaverDeclaration_EnergySaverSchedule

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RepeatingPowerOn";
  v6[1] = @"RepeatingPowerOff";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRepeatingPowerOn:(id)a3 withRepeatingPowerOff:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadRepeatingPowerOn:v6];

  [v7 setPayloadRepeatingPowerOff:v5];

  return v7;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemEnergySaverDeclaration_EnergySaverSchedule allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"RepeatingPowerOn" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadRepeatingPowerOn = self->_payloadRepeatingPowerOn;
  self->_payloadRepeatingPowerOn = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"RepeatingPowerOff" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadRepeatingPowerOff = self->_payloadRepeatingPowerOff;
    self->_payloadRepeatingPowerOff = v16;
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
  payloadRepeatingPowerOn = self->_payloadRepeatingPowerOn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"RepeatingPowerOn" withValue:payloadRepeatingPowerOn dictSerializer:v17 isRequired:0 defaultValue:0];
  payloadRepeatingPowerOff = self->_payloadRepeatingPowerOff;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C87E8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"RepeatingPowerOff" withValue:payloadRepeatingPowerOff dictSerializer:&v12 isRequired:0 defaultValue:0];
  v10 = objc_msgSend(v5, "copy", v12, v13, v14, v15);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemEnergySaverDeclaration_EnergySaverSchedule;
  id v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(CEMSystemEnergySaverDeclaration_RepeatingPowerItem *)self->_payloadRepeatingPowerOn copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMSystemEnergySaverDeclaration_RepeatingPowerItem *)self->_payloadRepeatingPowerOff copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOn
{
  return self->_payloadRepeatingPowerOn;
}

- (void)setPayloadRepeatingPowerOn:(id)a3
{
}

- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOff
{
  return self->_payloadRepeatingPowerOff;
}

- (void)setPayloadRepeatingPowerOff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRepeatingPowerOff, 0);

  objc_storeStrong((id *)&self->_payloadRepeatingPowerOn, 0);
}

@end