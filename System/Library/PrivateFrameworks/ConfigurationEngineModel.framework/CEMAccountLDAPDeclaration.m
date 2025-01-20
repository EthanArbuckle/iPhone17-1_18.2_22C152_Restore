@interface CEMAccountLDAPDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withLDAPAccountHostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withLDAPAccountDescription:(id)a4 withLDAPAccountHostName:(id)a5 withLDAPAccountUseSSL:(id)a6 withLDAPSearchSettings:(id)a7 withCommunicationServiceRules:(id)a8 withLDAPCredentials:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAccountLDAPDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules;
- (NSArray)payloadLDAPSearchSettings;
- (NSNumber)payloadLDAPAccountUseSSL;
- (NSString)payloadLDAPAccountDescription;
- (NSString)payloadLDAPAccountHostName;
- (NSString)payloadLDAPCredentials;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCommunicationServiceRules:(id)a3;
- (void)setPayloadLDAPAccountDescription:(id)a3;
- (void)setPayloadLDAPAccountHostName:(id)a3;
- (void)setPayloadLDAPAccountUseSSL:(id)a3;
- (void)setPayloadLDAPCredentials:(id)a3;
- (void)setPayloadLDAPSearchSettings:(id)a3;
@end

@implementation CEMAccountLDAPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.ldap";
}

+ (id)profileType
{
  return @"com.apple.ldap.account";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"LDAPAccountDescription";
  v6[1] = @"LDAPAccountHostName";
  v6[2] = @"LDAPAccountUseSSL";
  v6[3] = @"LDAPSearchSettings";
  v6[4] = @"CommunicationServiceRules";
  v6[5] = @"LDAPCredentials";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
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
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  v4 = [(CEMAccountLDAPDeclaration *)self payloadLDAPCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withLDAPAccountDescription:(id)a4 withLDAPAccountHostName:(id)a5 withLDAPAccountUseSSL:(id)a6 withLDAPSearchSettings:(id)a7 withCommunicationServiceRules:(id)a8 withLDAPCredentials:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.account.ldap"];
  if (v14)
  {
    [v21 setDeclarationIdentifier:v14];
  }
  else
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v22 UUIDString];
    [v21 setDeclarationIdentifier:v23];
  }
  [v21 setPayloadLDAPAccountDescription:v20];

  [v21 setPayloadLDAPAccountHostName:v19];
  if (v18) {
    id v24 = v18;
  }
  else {
    id v24 = (id)MEMORY[0x263EFFA88];
  }
  [v21 setPayloadLDAPAccountUseSSL:v24];

  [v21 setPayloadLDAPSearchSettings:v17];
  [v21 setPayloadCommunicationServiceRules:v16];

  [v21 setPayloadLDAPCredentials:v15];
  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withLDAPAccountHostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.ldap"];
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
  [v7 setPayloadLDAPAccountHostName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountLDAPDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPAccountDescription" isRequired:0 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadLDAPAccountDescription = self->_payloadLDAPAccountDescription;
  self->_payloadLDAPAccountDescription = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPAccountHostName" isRequired:1 defaultValue:0 error:&v31];
    id v14 = v31;
    payloadLDAPAccountHostName = self->_payloadLDAPAccountHostName;
    self->_payloadLDAPAccountHostName = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"LDAPAccountUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v30];
      id v14 = v30;
      payloadLDAPAccountUseSSL = self->_payloadLDAPAccountUseSSL;
      self->_payloadLDAPAccountUseSSL = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"LDAPSearchSettings" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v29];
        id v14 = v29;
        payloadLDAPSearchSettings = self->_payloadLDAPSearchSettings;
        self->_payloadLDAPSearchSettings = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"CommunicationServiceRules" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v28];
          id v14 = v28;
          payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
          self->_payloadCommunicationServiceRules = v22;

          if (!v14)
          {
            id v27 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPCredentials" isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadLDAPCredentials = self->_payloadLDAPCredentials;
            self->_payloadLDAPCredentials = v24;
          }
        }
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"LDAPAccountDescription" withValue:self->_payloadLDAPAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"LDAPAccountHostName" withValue:self->_payloadLDAPAccountHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"LDAPAccountUseSSL" withValue:self->_payloadLDAPAccountUseSSL isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  payloadLDAPSearchSettings = self->_payloadLDAPSearchSettings;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v16[3] = &unk_2642C8810;
  id v7 = v4;
  id v17 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"LDAPSearchSettings" withValue:payloadLDAPSearchSettings itemSerializer:v16 isRequired:0 defaultValue:0];
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v14[3] = &unk_2642C87E8;
  id v9 = v7;
  id v15 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"CommunicationServiceRules" withValue:payloadCommunicationServiceRules dictSerializer:v14 isRequired:0 defaultValue:0];
  payloadLDAPCredentials = self->_payloadLDAPCredentials;
  if (payloadLDAPCredentials)
  {
    v11 = [v9 objectForKeyedSubscript:self->_payloadLDAPCredentials];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"LDAPCredentials", payloadLDAPCredentials, v11, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"LDAPCredentials", 0, 0, &stru_26C838878);
  }
  v12 = (void *)[v5 copy];

  return v12;
}

uint64_t __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMAccountLDAPDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadLDAPAccountDescription copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadLDAPAccountHostName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadLDAPAccountUseSSL copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadLDAPSearchSettings copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(CEMAccountLDAPDeclaration_CommunicationServiceRules *)self->_payloadCommunicationServiceRules copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadLDAPCredentials copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadLDAPAccountDescription
{
  return self->_payloadLDAPAccountDescription;
}

- (void)setPayloadLDAPAccountDescription:(id)a3
{
}

- (NSString)payloadLDAPAccountHostName
{
  return self->_payloadLDAPAccountHostName;
}

- (void)setPayloadLDAPAccountHostName:(id)a3
{
}

- (NSNumber)payloadLDAPAccountUseSSL
{
  return self->_payloadLDAPAccountUseSSL;
}

- (void)setPayloadLDAPAccountUseSSL:(id)a3
{
}

- (NSArray)payloadLDAPSearchSettings
{
  return self->_payloadLDAPSearchSettings;
}

- (void)setPayloadLDAPSearchSettings:(id)a3
{
}

- (CEMAccountLDAPDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
}

- (NSString)payloadLDAPCredentials
{
  return self->_payloadLDAPCredentials;
}

- (void)setPayloadLDAPCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLDAPCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettings, 0);
  objc_storeStrong((id *)&self->_payloadLDAPAccountUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadLDAPAccountHostName, 0);

  objc_storeStrong((id *)&self->_payloadLDAPAccountDescription, 0);
}

uint64_t __90__CEMAccountLDAPDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

@end