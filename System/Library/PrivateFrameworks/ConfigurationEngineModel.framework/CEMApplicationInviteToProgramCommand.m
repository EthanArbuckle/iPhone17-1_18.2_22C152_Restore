@interface CEMApplicationInviteToProgramCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProgramID:(id)a4 withInvitationURL:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withProgramID:(id)a4 withInvitationURL:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSString)payloadInvitationURL;
- (NSString)payloadProgramID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadInvitationURL:(id)a3;
- (void)setPayloadProgramID:(id)a3;
@end

@implementation CEMApplicationInviteToProgramCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.application.program.invite";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProgramID";
  v6[1] = @"InvitationURL";
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

+ (id)buildWithIdentifier:(id)a3 withProgramID:(id)a4 withInvitationURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.application.program.invite"];
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
  [v10 setPayloadProgramID:v9];

  [v10 setPayloadInvitationURL:v8];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProgramID:(id)a4 withInvitationURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setCommandType:@"com.apple.command.application.program.invite"];
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
  [v10 setPayloadProgramID:v9];

  [v10 setPayloadInvitationURL:v8];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationInviteToProgramCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProgramID" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadProgramID = self->_payloadProgramID;
  self->_payloadProgramID = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"InvitationURL" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadInvitationURL = self->_payloadInvitationURL;
    self->_payloadInvitationURL = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProgramID" withValue:self->_payloadProgramID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"InvitationURL" withValue:self->_payloadInvitationURL isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMApplicationInviteToProgramCommand;
  v4 = [(CEMCommandBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadProgramID copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_payloadInvitationURL copy];
  id v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadProgramID
{
  return self->_payloadProgramID;
}

- (void)setPayloadProgramID:(id)a3
{
}

- (NSString)payloadInvitationURL
{
  return self->_payloadInvitationURL;
}

- (void)setPayloadInvitationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInvitationURL, 0);

  objc_storeStrong((id *)&self->_payloadProgramID, 0);
}

@end