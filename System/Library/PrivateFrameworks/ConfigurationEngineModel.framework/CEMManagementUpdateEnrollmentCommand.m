@interface CEMManagementUpdateEnrollmentCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProfile:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withProfile:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSData)payloadProfile;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadProfile:(id)a3;
@end

@implementation CEMManagementUpdateEnrollmentCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.management.enrollment";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Profile";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.management.enrollment"];
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
  [v7 setPayloadProfile:v6];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setCommandType:@"com.apple.command.management.enrollment"];
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
  [v7 setPayloadProfile:v6];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMManagementUpdateEnrollmentCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadDataFromDictionary:v7 withKey:@"Profile" isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadProfile = self->_payloadProfile;
  self->_payloadProfile = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeDataIntoDictionary:v4 withKey:@"Profile" withValue:self->_payloadProfile isRequired:1 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMManagementUpdateEnrollmentCommand;
  v4 = [(CEMCommandBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSData *)self->_payloadProfile copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (NSData)payloadProfile
{
  return self->_payloadProfile;
}

- (void)setPayloadProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end