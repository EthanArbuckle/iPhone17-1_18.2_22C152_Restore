@interface CEMSystemCameraDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowCamera:(id)a4 withAllowScreenShot:(id)a5 withAllowScreenRecording:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowCamera;
- (NSNumber)payloadAllowScreenRecording;
- (NSNumber)payloadAllowScreenShot;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowCamera:(id)a3;
- (void)setPayloadAllowScreenRecording:(id)a3;
- (void)setPayloadAllowScreenShot:(id)a3;
@end

@implementation CEMSystemCameraDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.camera";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowCamera";
  v6[1] = @"allowScreenShot";
  v6[2] = @"allowScreenRecording";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowCamera";
  v6[1] = @"allowScreenShot";
  v6[2] = @"allowScreenRecording";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return v4;
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowCamera:(id)a4 withAllowScreenShot:(id)a5 withAllowScreenRecording:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.system.camera"];
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
  v16 = (void *)MEMORY[0x263EFFA88];
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = (id)MEMORY[0x263EFFA88];
  }
  [v13 setPayloadAllowCamera:v17];

  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = v16;
  }
  [v13 setPayloadAllowScreenShot:v18];

  if (v10) {
    id v19 = v10;
  }
  else {
    id v19 = v16;
  }
  [v13 setPayloadAllowScreenRecording:v19];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.camera"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSystemCameraDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowCamera" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v23];
  id v14 = v23;
  payloadAllowCamera = self->_payloadAllowCamera;
  self->_payloadAllowCamera = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowScreenShot" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v22];
    id v14 = v22;
    payloadAllowScreenShot = self->_payloadAllowScreenShot;
    self->_payloadAllowScreenShot = v16;

    if (!v14)
    {
      id v21 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowScreenRecording" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v21];
      id v14 = v21;
      payloadAllowScreenRecording = self->_payloadAllowScreenRecording;
      self->_payloadAllowScreenRecording = v18;
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
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowCamera" withValue:self->_payloadAllowCamera isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowScreenShot" withValue:self->_payloadAllowScreenShot isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowScreenRecording" withValue:self->_payloadAllowScreenRecording isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemCameraDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowCamera copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowScreenShot copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowScreenRecording copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSNumber)payloadAllowCamera
{
  return self->_payloadAllowCamera;
}

- (void)setPayloadAllowCamera:(id)a3
{
}

- (NSNumber)payloadAllowScreenShot
{
  return self->_payloadAllowScreenShot;
}

- (void)setPayloadAllowScreenShot:(id)a3
{
}

- (NSNumber)payloadAllowScreenRecording
{
  return self->_payloadAllowScreenRecording;
}

- (void)setPayloadAllowScreenRecording:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowScreenRecording, 0);
  objc_storeStrong((id *)&self->_payloadAllowScreenShot, 0);

  objc_storeStrong((id *)&self->_payloadAllowCamera, 0);
}

@end