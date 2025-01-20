@interface CEMManagementTestDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEcho:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withEcho:(id)a4 withReturnStatus:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSString)payloadEcho;
- (NSString)payloadReturnStatus;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadEcho:(id)a3;
- (void)setPayloadReturnStatus:(id)a3;
@end

@implementation CEMManagementTestDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.management.test";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Echo";
  v6[1] = @"ReturnStatus";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withEcho:(id)a4 withReturnStatus:(id)a5
{
  id v7 = a3;
  v8 = (__CFString *)a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.management.test"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadEcho:v9];

  if (v8) {
    v13 = v8;
  }
  else {
    v13 = @"Installed";
  }
  [v10 setPayloadReturnStatus:v13];

  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEcho:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.management.test"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadEcho:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMManagementTestDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Echo" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadEcho = self->_payloadEcho;
  self->_payloadEcho = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ReturnStatus" isRequired:0 defaultValue:@"Installed" error:&v19];
    id v14 = v19;
    payloadReturnStatus = self->_payloadReturnStatus;
    self->_payloadReturnStatus = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Echo" withValue:self->_payloadEcho isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ReturnStatus" withValue:self->_payloadReturnStatus isRequired:0 defaultValue:@"Installed"];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMManagementTestDeclaration;
  v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEcho copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadReturnStatus copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSString)payloadEcho
{
  return self->_payloadEcho;
}

- (void)setPayloadEcho:(id)a3
{
}

- (NSString)payloadReturnStatus
{
  return self->_payloadReturnStatus;
}

- (void)setPayloadReturnStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadReturnStatus, 0);

  objc_storeStrong((id *)&self->_payloadEcho, 0);
}

@end