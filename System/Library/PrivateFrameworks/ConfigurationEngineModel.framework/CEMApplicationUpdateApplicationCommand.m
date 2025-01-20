@interface CEMApplicationUpdateApplicationCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withBundleIdentifier:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withBundleIdentifier:(id)a4 withImmediate:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadImmediate;
- (NSString)payloadBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadImmediate:(id)a3;
@end

@implementation CEMApplicationUpdateApplicationCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.application.update";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"BundleIdentifier";
  v6[1] = @"Immediate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 2;
}

+ (id)buildWithIdentifier:(id)a3 withBundleIdentifier:(id)a4 withImmediate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.application.update"];
  if (v7)
  {
    [v10 setCommandIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setCommandIdentifier:v12];
  }
  [v10 setPayloadBundleIdentifier:v9];

  if (v8) {
    id v13 = v8;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setPayloadImmediate:v13];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.application.update"];
  if (v5)
  {
    [v7 setCommandIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setCommandIdentifier:v9];
  }
  [v7 setPayloadBundleIdentifier:v6];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationUpdateApplicationCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  self->_payloadBundleIdentifier = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Immediate" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v19];
    id v14 = v19;
    payloadImmediate = self->_payloadImmediate;
    self->_payloadImmediate = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"BundleIdentifier" withValue:self->_payloadBundleIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"Immediate" withValue:self->_payloadImmediate isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMApplicationUpdateApplicationCommand;
  v4 = [(CEMCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadBundleIdentifier copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadImmediate copy];
  id v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
}

- (NSNumber)payloadImmediate
{
  return self->_payloadImmediate;
}

- (void)setPayloadImmediate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadImmediate, 0);

  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
}

@end