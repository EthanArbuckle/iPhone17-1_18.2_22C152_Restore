@interface CEMNSExtensionsMappingsNSExtensionsCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
@end

@implementation CEMNSExtensionsMappingsNSExtensionsCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.application.extensions.mappings";
}

+ (NSSet)allowedPayloadKeys
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.application.extensions.mappings"];
  if (v3)
  {
    [v4 setCommandIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setCommandIdentifier:v6];
  }

  return v4;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.application.extensions.mappings"];
  if (v3)
  {
    [v4 setCommandIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setCommandIdentifier:v6];
  }

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [a3 allKeys];
  v7 = [v5 setWithArray:v6];

  v8 = +[CEMNSExtensionsMappingsNSExtensionsCommand allowedPayloadKeys];
  [v7 minusSet:v8];

  v9 = (NSSet *)[v7 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v9;

  return 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEMNSExtensionsMappingsNSExtensionsCommand;
  return [(CEMCommandBase *)&v4 copyWithZone:a3];
}

uint64_t __69__CEMNSExtensionsMappingsNSExtensionsCommand_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end