@interface CEMPasscodeScreensaverDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAskForPassword:(id)a4 withAskForPasswordDelay:(id)a5 withLoginWindowIdleTime:(id)a6 withLoginWindowModulePath:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAskForPassword;
- (NSNumber)payloadAskForPasswordDelay;
- (NSNumber)payloadLoginWindowIdleTime;
- (NSString)payloadLoginWindowModulePath;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAskForPassword:(id)a3;
- (void)setPayloadAskForPasswordDelay:(id)a3;
- (void)setPayloadLoginWindowIdleTime:(id)a3;
- (void)setPayloadLoginWindowModulePath:(id)a3;
@end

@implementation CEMPasscodeScreensaverDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.passcode.screensaver";
}

+ (id)profileType
{
  return @"com.apple.screensaver";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"askForPassword";
  v6[1] = @"askForPasswordDelay";
  v6[2] = @"loginWindowIdleTime";
  v6[3] = @"loginWindowModulePath";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
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

+ (id)buildWithIdentifier:(id)a3 withAskForPassword:(id)a4 withAskForPasswordDelay:(id)a5 withLoginWindowIdleTime:(id)a6 withLoginWindowModulePath:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.passcode.screensaver"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  if (v15) {
    id v19 = v15;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setPayloadAskForPassword:v19];

  [v16 setPayloadAskForPasswordDelay:v14];
  [v16 setPayloadLoginWindowIdleTime:v13];

  [v16 setPayloadLoginWindowModulePath:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.passcode.screensaver"];
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
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPasscodeScreensaverDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"askForPassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v26];
  id v14 = v26;
  payloadAskForPassword = self->_payloadAskForPassword;
  self->_payloadAskForPassword = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"askForPasswordDelay" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadAskForPasswordDelay = self->_payloadAskForPasswordDelay;
    self->_payloadAskForPasswordDelay = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"loginWindowIdleTime" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadLoginWindowIdleTime = self->_payloadLoginWindowIdleTime;
      self->_payloadLoginWindowIdleTime = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"loginWindowModulePath" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadLoginWindowModulePath = self->_payloadLoginWindowModulePath;
        self->_payloadLoginWindowModulePath = v20;
      }
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"askForPassword" withValue:self->_payloadAskForPassword isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"askForPasswordDelay" withValue:self->_payloadAskForPasswordDelay isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"loginWindowIdleTime" withValue:self->_payloadLoginWindowIdleTime isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"loginWindowModulePath" withValue:self->_payloadLoginWindowModulePath isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMPasscodeScreensaverDeclaration;
  v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAskForPassword copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAskForPasswordDelay copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadLoginWindowIdleTime copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadLoginWindowModulePath copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAskForPassword
{
  return self->_payloadAskForPassword;
}

- (void)setPayloadAskForPassword:(id)a3
{
}

- (NSNumber)payloadAskForPasswordDelay
{
  return self->_payloadAskForPasswordDelay;
}

- (void)setPayloadAskForPasswordDelay:(id)a3
{
}

- (NSNumber)payloadLoginWindowIdleTime
{
  return self->_payloadLoginWindowIdleTime;
}

- (void)setPayloadLoginWindowIdleTime:(id)a3
{
}

- (NSString)payloadLoginWindowModulePath
{
  return self->_payloadLoginWindowModulePath;
}

- (void)setPayloadLoginWindowModulePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLoginWindowModulePath, 0);
  objc_storeStrong((id *)&self->_payloadLoginWindowIdleTime, 0);
  objc_storeStrong((id *)&self->_payloadAskForPasswordDelay, 0);

  objc_storeStrong((id *)&self->_payloadAskForPassword, 0);
}

@end