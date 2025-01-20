@interface CEMDeviceListRestrictionsCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withProfileRestrictions:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadProfileRestrictions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadProfileRestrictions:(id)a3;
@end

@implementation CEMDeviceListRestrictionsCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.device.restrictions.list";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProfileRestrictions";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 2;
}

+ (id)buildWithIdentifier:(id)a3 withProfileRestrictions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.device.restrictions.list"];
  if (v5)
  {
    [v7 setCommandIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setCommandIdentifier:v9];
  }
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA80];
  }
  [v7 setPayloadProfileRestrictions:v10];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.device.restrictions.list"];
  if (v3)
  {
    [v4 setCommandIdentifier:v3];
  }
  else
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];
    [v4 setCommandIdentifier:v6];
  }

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  id v10 = +[CEMDeviceListRestrictionsCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v7 withKey:@"ProfileRestrictions" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v17];

  id v14 = v17;
  payloadProfileRestrictions = self->_payloadProfileRestrictions;
  self->_payloadProfileRestrictions = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ProfileRestrictions" withValue:self->_payloadProfileRestrictions isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMDeviceListRestrictionsCommand;
  v4 = [(CEMCommandBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadProfileRestrictions copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (NSNumber)payloadProfileRestrictions
{
  return self->_payloadProfileRestrictions;
}

- (void)setPayloadProfileRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __59__CEMDeviceListRestrictionsCommand_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __59__CEMDeviceListRestrictionsCommand_Status_serializePayload__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __81__CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __81__CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary_serializePayload__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __81__CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary_serializePayload__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __81__CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary_serializePayload__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __76__CEMDeviceListRestrictionsCommand_StatusBooleanDictionary_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __74__CEMDeviceListRestrictionsCommand_StatusValueDictionary_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __81__CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

uint64_t __101__CEMDeviceListRestrictionsCommand_StatusIntersectionDictionaryANYrestrictionname_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __99__CEMDeviceListRestrictionsCommand_StatusIntersectionDictionaryANYrestrictionname_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __78__CEMDeviceListRestrictionsCommand_StatusProfileRestrictions_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end