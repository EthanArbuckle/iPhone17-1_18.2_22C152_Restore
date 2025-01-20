@interface CEMDeviceNameDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withName:(id)a4 withAllowDeviceNameModification:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowDeviceNameModification;
- (NSString)payloadName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowDeviceNameModification:(id)a3;
- (void)setPayloadName:(id)a3;
@end

@implementation CEMDeviceNameDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.device.name";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Name";
  v6[1] = @"allowDeviceNameModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowDeviceNameModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withName:(id)a4 withAllowDeviceNameModification:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.device.name"];
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
  [v10 setPayloadName:v9];

  if (v8) {
    id v13 = v8;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAllowDeviceNameModification:v13];

  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.device.name"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceNameDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowDeviceNameModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v19];
    id v14 = v19;
    payloadAllowDeviceNameModification = self->_payloadAllowDeviceNameModification;
    self->_payloadAllowDeviceNameModification = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Name" withValue:self->_payloadName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowDeviceNameModification" withValue:self->_payloadAllowDeviceNameModification isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMDeviceNameDeclaration;
  v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowDeviceNameModification copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSNumber)payloadAllowDeviceNameModification
{
  return self->_payloadAllowDeviceNameModification;
}

- (void)setPayloadAllowDeviceNameModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowDeviceNameModification, 0);

  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end