@interface CEMClassroomDeleteUserCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withUserName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withUserName:(id)a4 withForceDeletion:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadForceDeletion;
- (NSString)payloadUserName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadForceDeletion:(id)a3;
- (void)setPayloadUserName:(id)a3;
@end

@implementation CEMClassroomDeleteUserCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.classroom.user.delete";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"UserName";
  v6[1] = @"ForceDeletion";
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

+ (id)buildWithIdentifier:(id)a3 withUserName:(id)a4 withForceDeletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.classroom.user.delete"];
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
  [v10 setPayloadUserName:v9];

  if (v8) {
    id v13 = v8;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setPayloadForceDeletion:v13];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withUserName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.classroom.user.delete"];
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
  [v7 setPayloadUserName:v6];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMClassroomDeleteUserCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserName" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadUserName = self->_payloadUserName;
  self->_payloadUserName = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ForceDeletion" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v19];
    id v14 = v19;
    payloadForceDeletion = self->_payloadForceDeletion;
    self->_payloadForceDeletion = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"UserName" withValue:self->_payloadUserName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ForceDeletion" withValue:self->_payloadForceDeletion isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMClassroomDeleteUserCommand;
  v4 = [(CEMCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadUserName copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadForceDeletion copy];
  id v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSNumber)payloadForceDeletion
{
  return self->_payloadForceDeletion;
}

- (void)setPayloadForceDeletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceDeletion, 0);

  objc_storeStrong((id *)&self->_payloadUserName, 0);
}

@end