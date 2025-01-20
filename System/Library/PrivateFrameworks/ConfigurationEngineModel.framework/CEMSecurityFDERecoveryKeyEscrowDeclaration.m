@interface CEMSecurityFDERecoveryKeyEscrowDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withLocation:(id)a4 withEncryptCertPayloadUUID:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withLocation:(id)a4 withEncryptCertPayloadUUID:(id)a5 withDeviceKey:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSString)payloadDeviceKey;
- (NSString)payloadEncryptCertPayloadUUID;
- (NSString)payloadLocation;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadDeviceKey:(id)a3;
- (void)setPayloadEncryptCertPayloadUUID:(id)a3;
- (void)setPayloadLocation:(id)a3;
@end

@implementation CEMSecurityFDERecoveryKeyEscrowDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.fde.recoverykeyescrow";
}

+ (id)profileType
{
  return @"com.apple.security.FDERecoveryKeyEscrow";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Location";
  v6[1] = @"EncryptCertPayloadUUID";
  v6[2] = @"DeviceKey";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withLocation:(id)a4 withEncryptCertPayloadUUID:(id)a5 withDeviceKey:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.security.fde.recoverykeyescrow"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadLocation:v12];

  [v13 setPayloadEncryptCertPayloadUUID:v11];
  [v13 setPayloadDeviceKey:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withLocation:(id)a4 withEncryptCertPayloadUUID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.security.fde.recoverykeyescrow"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadLocation:v9];

  [v10 setPayloadEncryptCertPayloadUUID:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSecurityFDERecoveryKeyEscrowDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Location" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadLocation = self->_payloadLocation;
  self->_payloadLocation = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EncryptCertPayloadUUID" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadEncryptCertPayloadUUID = self->_payloadEncryptCertPayloadUUID;
    self->_payloadEncryptCertPayloadUUID = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeviceKey" isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadDeviceKey = self->_payloadDeviceKey;
      self->_payloadDeviceKey = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Location" withValue:self->_payloadLocation isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"EncryptCertPayloadUUID" withValue:self->_payloadEncryptCertPayloadUUID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DeviceKey" withValue:self->_payloadDeviceKey isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSecurityFDERecoveryKeyEscrowDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadLocation copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadEncryptCertPayloadUUID copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDeviceKey copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSString)payloadLocation
{
  return self->_payloadLocation;
}

- (void)setPayloadLocation:(id)a3
{
}

- (NSString)payloadEncryptCertPayloadUUID
{
  return self->_payloadEncryptCertPayloadUUID;
}

- (void)setPayloadEncryptCertPayloadUUID:(id)a3
{
}

- (NSString)payloadDeviceKey
{
  return self->_payloadDeviceKey;
}

- (void)setPayloadDeviceKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDeviceKey, 0);
  objc_storeStrong((id *)&self->_payloadEncryptCertPayloadUUID, 0);

  objc_storeStrong((id *)&self->_payloadLocation, 0);
}

@end