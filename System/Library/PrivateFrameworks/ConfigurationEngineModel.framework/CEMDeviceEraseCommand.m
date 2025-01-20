@interface CEMDeviceEraseCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withPIN:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withPreserveDataPlan:(id)a4 withDisallowProximitySetup:(id)a5 withPIN:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadDisallowProximitySetup;
- (NSNumber)payloadPreserveDataPlan;
- (NSString)payloadPIN;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadDisallowProximitySetup:(id)a3;
- (void)setPayloadPIN:(id)a3;
- (void)setPayloadPreserveDataPlan:(id)a3;
@end

@implementation CEMDeviceEraseCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.device.erase";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"PreserveDataPlan";
  v6[1] = @"DisallowProximitySetup";
  v6[2] = @"PIN";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withPreserveDataPlan:(id)a4 withDisallowProximitySetup:(id)a5 withPIN:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setCommandType:@"com.apple.command.device.erase"];
  if (v9)
  {
    [v13 setCommandIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setCommandIdentifier:v15];
  }
  v16 = (void *)MEMORY[0x263EFFA80];
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadPreserveDataPlan:v17];

  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = v16;
  }
  [v13 setPayloadDisallowProximitySetup:v18];

  [v13 setPayloadPIN:v10];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withPIN:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.device.erase"];
  if (v5)
  {
    [v7 setCommandIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setCommandIdentifier:v9];
  }
  [v7 setPayloadPIN:v6];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMDeviceEraseCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PreserveDataPlan" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v23];
  id v14 = v23;
  payloadPreserveDataPlan = self->_payloadPreserveDataPlan;
  self->_payloadPreserveDataPlan = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisallowProximitySetup" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v22];
    id v14 = v22;
    payloadDisallowProximitySetup = self->_payloadDisallowProximitySetup;
    self->_payloadDisallowProximitySetup = v16;

    if (!v14)
    {
      id v21 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PIN" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadPIN = self->_payloadPIN;
      self->_payloadPIN = v18;
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"PreserveDataPlan" withValue:self->_payloadPreserveDataPlan isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisallowProximitySetup" withValue:self->_payloadDisallowProximitySetup isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"PIN" withValue:self->_payloadPIN isRequired:1 defaultValue:0];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMDeviceEraseCommand;
  v4 = [(CEMCommandBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadPreserveDataPlan copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadDisallowProximitySetup copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSString *)self->_payloadPIN copy];
  id v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (NSNumber)payloadPreserveDataPlan
{
  return self->_payloadPreserveDataPlan;
}

- (void)setPayloadPreserveDataPlan:(id)a3
{
}

- (NSNumber)payloadDisallowProximitySetup
{
  return self->_payloadDisallowProximitySetup;
}

- (void)setPayloadDisallowProximitySetup:(id)a3
{
}

- (NSString)payloadPIN
{
  return self->_payloadPIN;
}

- (void)setPayloadPIN:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPIN, 0);
  objc_storeStrong((id *)&self->_payloadDisallowProximitySetup, 0);

  objc_storeStrong((id *)&self->_payloadPreserveDataPlan, 0);
}

@end