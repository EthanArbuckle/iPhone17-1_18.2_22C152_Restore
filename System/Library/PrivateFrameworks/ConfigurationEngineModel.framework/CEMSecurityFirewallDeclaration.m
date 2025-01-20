@interface CEMSecurityFirewallDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnableFirewall:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withEnableFirewall:(id)a4 withBlockAllIncoming:(id)a5 withEnableStealthMode:(id)a6 withApplications:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadApplications;
- (NSNumber)payloadBlockAllIncoming;
- (NSNumber)payloadEnableFirewall;
- (NSNumber)payloadEnableStealthMode;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadApplications:(id)a3;
- (void)setPayloadBlockAllIncoming:(id)a3;
- (void)setPayloadEnableFirewall:(id)a3;
- (void)setPayloadEnableStealthMode:(id)a3;
@end

@implementation CEMSecurityFirewallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.firewall";
}

+ (id)profileType
{
  return @"com.apple.security.firewall";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EnableFirewall";
  v6[1] = @"BlockAllIncoming";
  v6[2] = @"EnableStealthMode";
  v6[3] = @"Applications";
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withEnableFirewall:(id)a4 withBlockAllIncoming:(id)a5 withEnableStealthMode:(id)a6 withApplications:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.security.firewall"];
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
  [v16 setPayloadEnableFirewall:v15];

  v19 = (void *)MEMORY[0x263EFFA80];
  if (v14) {
    id v20 = v14;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setPayloadBlockAllIncoming:v20];

  if (v13) {
    id v21 = v13;
  }
  else {
    id v21 = v19;
  }
  [v16 setPayloadEnableStealthMode:v21];

  [v16 setPayloadApplications:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnableFirewall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.security.firewall"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadEnableFirewall:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityFirewallDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableFirewall" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadEnableFirewall = self->_payloadEnableFirewall;
  self->_payloadEnableFirewall = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"BlockAllIncoming" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v25];
    id v14 = v25;
    payloadBlockAllIncoming = self->_payloadBlockAllIncoming;
    self->_payloadBlockAllIncoming = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableStealthMode" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v24];
      id v14 = v24;
      payloadEnableStealthMode = self->_payloadEnableStealthMode;
      self->_payloadEnableStealthMode = v18;

      if (!v14)
      {
        id v23 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Applications" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadApplications = self->_payloadApplications;
        self->_payloadApplications = v20;
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
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"EnableFirewall" withValue:self->_payloadEnableFirewall isRequired:1 defaultValue:0];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"BlockAllIncoming" withValue:self->_payloadBlockAllIncoming isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"EnableStealthMode" withValue:self->_payloadEnableStealthMode isRequired:0 defaultValue:v6];
  payloadApplications = self->_payloadApplications;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__CEMSecurityFirewallDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v11[3] = &unk_2642C9690;
  id v12 = v4;
  id v8 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Applications" withValue:payloadApplications itemSerializer:v11 isRequired:0 defaultValue:0];
  v9 = (void *)[v5 copy];

  return v9;
}

uint64_t __69__CEMSecurityFirewallDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSecurityFirewallDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnableFirewall copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadBlockAllIncoming copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadEnableStealthMode copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadApplications copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadEnableFirewall
{
  return self->_payloadEnableFirewall;
}

- (void)setPayloadEnableFirewall:(id)a3
{
}

- (NSNumber)payloadBlockAllIncoming
{
  return self->_payloadBlockAllIncoming;
}

- (void)setPayloadBlockAllIncoming:(id)a3
{
}

- (NSNumber)payloadEnableStealthMode
{
  return self->_payloadEnableStealthMode;
}

- (void)setPayloadEnableStealthMode:(id)a3
{
}

- (NSArray)payloadApplications
{
  return self->_payloadApplications;
}

- (void)setPayloadApplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadApplications, 0);
  objc_storeStrong((id *)&self->_payloadEnableStealthMode, 0);
  objc_storeStrong((id *)&self->_payloadBlockAllIncoming, 0);

  objc_storeStrong((id *)&self->_payloadEnableFirewall, 0);
}

@end