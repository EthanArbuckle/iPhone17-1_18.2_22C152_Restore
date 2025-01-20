@interface CEMSystemAirPlaySettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withForceAirPlayOutgoingRequestsPairingPassword:(id)a4 withForceAirPlayIncomingRequestsPairingPassword:(id)a5 withAllowAirPlayIncomingRequests:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAirPlayIncomingRequests;
- (NSNumber)payloadForceAirPlayIncomingRequestsPairingPassword;
- (NSNumber)payloadForceAirPlayOutgoingRequestsPairingPassword;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAirPlayIncomingRequests:(id)a3;
- (void)setPayloadForceAirPlayIncomingRequestsPairingPassword:(id)a3;
- (void)setPayloadForceAirPlayOutgoingRequestsPairingPassword:(id)a3;
@end

@implementation CEMSystemAirPlaySettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.airplay.settings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceAirPlayOutgoingRequestsPairingPassword";
  v6[1] = @"forceAirPlayIncomingRequestsPairingPassword";
  v6[2] = @"allowAirPlayIncomingRequests";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceAirPlayOutgoingRequestsPairingPassword";
  v6[1] = @"forceAirPlayIncomingRequestsPairingPassword";
  v6[2] = @"allowAirPlayIncomingRequests";
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
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withForceAirPlayOutgoingRequestsPairingPassword:(id)a4 withForceAirPlayIncomingRequestsPairingPassword:(id)a5 withAllowAirPlayIncomingRequests:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.system.airplay.settings"];
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
  v16 = (void *)MEMORY[0x263EFFA80];
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadForceAirPlayOutgoingRequestsPairingPassword:v17];

  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = v16;
  }
  [v13 setPayloadForceAirPlayIncomingRequestsPairingPassword:v18];

  if (v10) {
    id v19 = v10;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA88];
  }
  [v13 setPayloadAllowAirPlayIncomingRequests:v19];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.airplay.settings"];
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

  id v10 = +[CEMSystemAirPlaySettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAirPlayOutgoingRequestsPairingPassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v23];
  id v14 = v23;
  payloadForceAirPlayOutgoingRequestsPairingPassword = self->_payloadForceAirPlayOutgoingRequestsPairingPassword;
  self->_payloadForceAirPlayOutgoingRequestsPairingPassword = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAirPlayIncomingRequestsPairingPassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v22];
    id v14 = v22;
    payloadForceAirPlayIncomingRequestsPairingPassword = self->_payloadForceAirPlayIncomingRequestsPairingPassword;
    self->_payloadForceAirPlayIncomingRequestsPairingPassword = v16;

    if (!v14)
    {
      id v21 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAirPlayIncomingRequests" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v21];
      id v14 = v21;
      payloadAllowAirPlayIncomingRequests = self->_payloadAllowAirPlayIncomingRequests;
      self->_payloadAllowAirPlayIncomingRequests = v18;
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
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAirPlayOutgoingRequestsPairingPassword" withValue:self->_payloadForceAirPlayOutgoingRequestsPairingPassword isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAirPlayIncomingRequestsPairingPassword" withValue:self->_payloadForceAirPlayIncomingRequestsPairingPassword isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAirPlayIncomingRequests" withValue:self->_payloadAllowAirPlayIncomingRequests isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemAirPlaySettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadForceAirPlayOutgoingRequestsPairingPassword copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadForceAirPlayIncomingRequestsPairingPassword copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowAirPlayIncomingRequests copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSNumber)payloadForceAirPlayOutgoingRequestsPairingPassword
{
  return self->_payloadForceAirPlayOutgoingRequestsPairingPassword;
}

- (void)setPayloadForceAirPlayOutgoingRequestsPairingPassword:(id)a3
{
}

- (NSNumber)payloadForceAirPlayIncomingRequestsPairingPassword
{
  return self->_payloadForceAirPlayIncomingRequestsPairingPassword;
}

- (void)setPayloadForceAirPlayIncomingRequestsPairingPassword:(id)a3
{
}

- (NSNumber)payloadAllowAirPlayIncomingRequests
{
  return self->_payloadAllowAirPlayIncomingRequests;
}

- (void)setPayloadAllowAirPlayIncomingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAirPlayIncomingRequests, 0);
  objc_storeStrong((id *)&self->_payloadForceAirPlayIncomingRequestsPairingPassword, 0);

  objc_storeStrong((id *)&self->_payloadForceAirPlayOutgoingRequestsPairingPassword, 0);
}

@end