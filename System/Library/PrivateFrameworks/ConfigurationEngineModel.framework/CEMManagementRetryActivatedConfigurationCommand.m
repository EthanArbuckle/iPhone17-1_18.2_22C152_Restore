@interface CEMManagementRetryActivatedConfigurationCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSString)payloadActivationIdentifier;
- (NSString)payloadConfigurationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadActivationIdentifier:(id)a3;
- (void)setPayloadConfigurationIdentifier:(id)a3;
@end

@implementation CEMManagementRetryActivatedConfigurationCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.management.retry";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ActivationIdentifier";
  v6[1] = @"ConfigurationIdentifier";
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

+ (id)buildWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.management.retry"];
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
  [v10 setPayloadActivationIdentifier:v9];

  [v10 setPayloadConfigurationIdentifier:v8];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.management.retry"];
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
  [v10 setPayloadActivationIdentifier:v9];

  [v10 setPayloadConfigurationIdentifier:v8];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMManagementRetryActivatedConfigurationCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ActivationIdentifier" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadActivationIdentifier = self->_payloadActivationIdentifier;
  self->_payloadActivationIdentifier = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ConfigurationIdentifier" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadConfigurationIdentifier = self->_payloadConfigurationIdentifier;
    self->_payloadConfigurationIdentifier = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ActivationIdentifier" withValue:self->_payloadActivationIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ConfigurationIdentifier" withValue:self->_payloadConfigurationIdentifier isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMManagementRetryActivatedConfigurationCommand;
  v4 = [(CEMCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadActivationIdentifier copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_payloadConfigurationIdentifier copy];
  id v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadActivationIdentifier
{
  return self->_payloadActivationIdentifier;
}

- (void)setPayloadActivationIdentifier:(id)a3
{
}

- (NSString)payloadConfigurationIdentifier
{
  return self->_payloadConfigurationIdentifier;
}

- (void)setPayloadConfigurationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadConfigurationIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadActivationIdentifier, 0);
}

@end