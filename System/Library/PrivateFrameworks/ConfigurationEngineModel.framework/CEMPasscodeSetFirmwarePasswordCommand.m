@interface CEMPasscodeSetFirmwarePasswordCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withNewPassword:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withCurrentPassword:(id)a4 withNewPassword:(id)a5 withAllowOroms:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowOroms;
- (NSString)payloadCurrentPassword;
- (NSString)payloadNewPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadAllowOroms:(id)a3;
- (void)setPayloadCurrentPassword:(id)a3;
- (void)setPayloadNewPassword:(id)a3;
@end

@implementation CEMPasscodeSetFirmwarePasswordCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.passcode.firmware.set";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CurrentPassword";
  v6[1] = @"NewPassword";
  v6[2] = @"AllowOroms";
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

+ (id)buildWithIdentifier:(id)a3 withCurrentPassword:(id)a4 withNewPassword:(id)a5 withAllowOroms:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setCommandType:@"com.apple.command.passcode.firmware.set"];
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
  [v13 setPayloadCurrentPassword:v12];

  [v13 setPayloadNewPassword:v11];
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadAllowOroms:v16];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withNewPassword:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.passcode.firmware.set"];
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
  [v7 setPayloadNewPassword:v6];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMPasscodeSetFirmwarePasswordCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CurrentPassword" isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadCurrentPassword = self->_payloadCurrentPassword;
  self->_payloadCurrentPassword = v13;

  if (!v14)
  {
    id v22 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"NewPassword" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadNewPassword = self->_payloadNewPassword;
    self->_payloadNewPassword = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowOroms" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v21];
      id v14 = v21;
      payloadAllowOroms = self->_payloadAllowOroms;
      self->_payloadAllowOroms = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CurrentPassword" withValue:self->_payloadCurrentPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"NewPassword" withValue:self->_payloadNewPassword isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AllowOroms" withValue:self->_payloadAllowOroms isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMPasscodeSetFirmwarePasswordCommand;
  v4 = [(CEMCommandBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadCurrentPassword copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_payloadNewPassword copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowOroms copy];
  id v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (NSString)payloadCurrentPassword
{
  return self->_payloadCurrentPassword;
}

- (void)setPayloadCurrentPassword:(id)a3
{
}

- (NSString)payloadNewPassword
{
  return self->_payloadNewPassword;
}

- (void)setPayloadNewPassword:(id)a3
{
}

- (NSNumber)payloadAllowOroms
{
  return self->_payloadAllowOroms;
}

- (void)setPayloadAllowOroms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowOroms, 0);
  objc_storeStrong((id *)&self->_payloadNewPassword, 0);

  objc_storeStrong((id *)&self->_payloadCurrentPassword, 0);
}

@end