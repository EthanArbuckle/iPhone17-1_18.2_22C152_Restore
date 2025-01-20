@interface CEMDeviceActivationLockBypassCodeCommand
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

@implementation CEMDeviceActivationLockBypassCodeCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.device.activationlock.bypasscode";
}

+ (NSSet)allowedPayloadKeys
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.device.activationlock.bypasscode"];
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
  [v4 setCommandType:@"com.apple.command.device.activationlock.bypasscode"];
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

  v8 = +[CEMDeviceActivationLockBypassCodeCommand allowedPayloadKeys];
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
  v4.super_class = (Class)CEMDeviceActivationLockBypassCodeCommand;
  return [(CEMCommandBase *)&v4 copyWithZone:a3];
}

@end