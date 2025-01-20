@interface CEMSystemWatchDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withForceWatchWristDetection:(id)a4 withAllowPairedWatch:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowPairedWatch;
- (NSNumber)payloadForceWatchWristDetection;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowPairedWatch:(id)a3;
- (void)setPayloadForceWatchWristDetection:(id)a3;
@end

@implementation CEMSystemWatchDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.watch";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceWatchWristDetection";
  v6[1] = @"allowPairedWatch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceWatchWristDetection";
  v6[1] = @"allowPairedWatch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
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

+ (id)buildWithIdentifier:(id)a3 withForceWatchWristDetection:(id)a4 withAllowPairedWatch:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.system.watch"];
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
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setPayloadForceWatchWristDetection:v13];

  if (v8) {
    id v14 = v8;
  }
  else {
    id v14 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAllowPairedWatch:v14];

  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.watch"];
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
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemWatchDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceWatchWristDetection" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v20];
  id v14 = v20;
  payloadForceWatchWristDetection = self->_payloadForceWatchWristDetection;
  self->_payloadForceWatchWristDetection = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowPairedWatch" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v19];
    id v14 = v19;
    payloadAllowPairedWatch = self->_payloadAllowPairedWatch;
    self->_payloadAllowPairedWatch = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceWatchWristDetection" withValue:self->_payloadForceWatchWristDetection isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowPairedWatch" withValue:self->_payloadAllowPairedWatch isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemWatchDeclaration;
  v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadForceWatchWristDetection copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowPairedWatch copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSNumber)payloadForceWatchWristDetection
{
  return self->_payloadForceWatchWristDetection;
}

- (void)setPayloadForceWatchWristDetection:(id)a3
{
}

- (NSNumber)payloadAllowPairedWatch
{
  return self->_payloadAllowPairedWatch;
}

- (void)setPayloadAllowPairedWatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowPairedWatch, 0);

  objc_storeStrong((id *)&self->_payloadForceWatchWristDetection, 0);
}

@end