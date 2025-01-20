@interface CEMDeviceLockCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withMessage:(id)a4 withPhoneNumber:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSString)payloadMessage;
- (NSString)payloadPhoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadMessage:(id)a3;
- (void)setPayloadPhoneNumber:(id)a3;
@end

@implementation CEMDeviceLockCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.device.lock";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Message";
  v6[1] = @"PhoneNumber";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
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

+ (id)buildWithIdentifier:(id)a3 withMessage:(id)a4 withPhoneNumber:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.device.lock"];
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
  [v10 setPayloadMessage:v9];

  [v10 setPayloadPhoneNumber:v8];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.device.lock"];
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
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceLockCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Message" isRequired:0 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadMessage = self->_payloadMessage;
  self->_payloadMessage = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PhoneNumber" isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadPhoneNumber = self->_payloadPhoneNumber;
    self->_payloadPhoneNumber = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Message" withValue:self->_payloadMessage isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"PhoneNumber" withValue:self->_payloadPhoneNumber isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMDeviceLockCommand;
  v4 = [(CEMCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadMessage copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPhoneNumber copy];
  id v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadMessage
{
  return self->_payloadMessage;
}

- (void)setPayloadMessage:(id)a3
{
}

- (NSString)payloadPhoneNumber
{
  return self->_payloadPhoneNumber;
}

- (void)setPayloadPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPhoneNumber, 0);

  objc_storeStrong((id *)&self->_payloadMessage, 0);
}

@end