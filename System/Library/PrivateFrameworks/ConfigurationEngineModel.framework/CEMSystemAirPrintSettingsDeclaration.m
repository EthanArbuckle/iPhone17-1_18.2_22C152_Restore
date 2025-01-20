@interface CEMSystemAirPrintSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowAirPrint:(id)a4 withForceAirPrintTrustedTLSRequirement:(id)a5 withAllowAirPrintiBeaconDiscovery:(id)a6 withAllowAirPrintCredentialsStorage:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAirPrint;
- (NSNumber)payloadAllowAirPrintCredentialsStorage;
- (NSNumber)payloadAllowAirPrintiBeaconDiscovery;
- (NSNumber)payloadForceAirPrintTrustedTLSRequirement;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAirPrint:(id)a3;
- (void)setPayloadAllowAirPrintCredentialsStorage:(id)a3;
- (void)setPayloadAllowAirPrintiBeaconDiscovery:(id)a3;
- (void)setPayloadForceAirPrintTrustedTLSRequirement:(id)a3;
@end

@implementation CEMSystemAirPrintSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.airprint.settings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAirPrint";
  v6[1] = @"forceAirPrintTrustedTLSRequirement";
  v6[2] = @"allowAirPrintiBeaconDiscovery";
  v6[3] = @"allowAirPrintCredentialsStorage";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAirPrint";
  v6[1] = @"forceAirPrintTrustedTLSRequirement";
  v6[2] = @"allowAirPrintiBeaconDiscovery";
  v6[3] = @"allowAirPrintCredentialsStorage";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
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

+ (id)buildWithIdentifier:(id)a3 withAllowAirPrint:(id)a4 withForceAirPrintTrustedTLSRequirement:(id)a5 withAllowAirPrintiBeaconDiscovery:(id)a6 withAllowAirPrintCredentialsStorage:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.system.airprint.settings"];
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
  v19 = (void *)MEMORY[0x263EFFA88];
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA88];
  }
  [v16 setPayloadAllowAirPrint:v20];

  if (v14) {
    id v21 = v14;
  }
  else {
    id v21 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setPayloadForceAirPrintTrustedTLSRequirement:v21];

  if (v13) {
    id v22 = v13;
  }
  else {
    id v22 = v19;
  }
  [v16 setPayloadAllowAirPrintiBeaconDiscovery:v22];

  if (v12) {
    id v23 = v12;
  }
  else {
    id v23 = v19;
  }
  [v16 setPayloadAllowAirPrintCredentialsStorage:v23];

  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.airprint.settings"];
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

  v10 = +[CEMSystemAirPrintSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAirPrint" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v26];
  id v14 = v26;
  payloadAllowAirPrint = self->_payloadAllowAirPrint;
  self->_payloadAllowAirPrint = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAirPrintTrustedTLSRequirement" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v25];
    id v14 = v25;
    payloadForceAirPrintTrustedTLSRequirement = self->_payloadForceAirPrintTrustedTLSRequirement;
    self->_payloadForceAirPrintTrustedTLSRequirement = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAirPrintiBeaconDiscovery" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v24];
      id v14 = v24;
      payloadAllowAirPrintiBeaconDiscovery = self->_payloadAllowAirPrintiBeaconDiscovery;
      self->_payloadAllowAirPrintiBeaconDiscovery = v18;

      if (!v14)
      {
        id v23 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAirPrintCredentialsStorage" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v23];
        id v14 = v23;
        payloadAllowAirPrintCredentialsStorage = self->_payloadAllowAirPrintCredentialsStorage;
        self->_payloadAllowAirPrintCredentialsStorage = v20;
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
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAirPrint" withValue:self->_payloadAllowAirPrint isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAirPrintTrustedTLSRequirement" withValue:self->_payloadForceAirPrintTrustedTLSRequirement isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAirPrintiBeaconDiscovery" withValue:self->_payloadAllowAirPrintiBeaconDiscovery isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAirPrintCredentialsStorage" withValue:self->_payloadAllowAirPrintCredentialsStorage isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSystemAirPrintSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowAirPrint copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadForceAirPrintTrustedTLSRequirement copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowAirPrintiBeaconDiscovery copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowAirPrintCredentialsStorage copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAllowAirPrint
{
  return self->_payloadAllowAirPrint;
}

- (void)setPayloadAllowAirPrint:(id)a3
{
}

- (NSNumber)payloadForceAirPrintTrustedTLSRequirement
{
  return self->_payloadForceAirPrintTrustedTLSRequirement;
}

- (void)setPayloadForceAirPrintTrustedTLSRequirement:(id)a3
{
}

- (NSNumber)payloadAllowAirPrintiBeaconDiscovery
{
  return self->_payloadAllowAirPrintiBeaconDiscovery;
}

- (void)setPayloadAllowAirPrintiBeaconDiscovery:(id)a3
{
}

- (NSNumber)payloadAllowAirPrintCredentialsStorage
{
  return self->_payloadAllowAirPrintCredentialsStorage;
}

- (void)setPayloadAllowAirPrintCredentialsStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAirPrintCredentialsStorage, 0);
  objc_storeStrong((id *)&self->_payloadAllowAirPrintiBeaconDiscovery, 0);
  objc_storeStrong((id *)&self->_payloadForceAirPrintTrustedTLSRequirement, 0);

  objc_storeStrong((id *)&self->_payloadAllowAirPrint, 0);
}

@end