@interface CEMAccountCardDAVDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCardDAVHostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withCardDAVAccountDescription:(id)a4 withCardDAVHostName:(id)a5 withCardDAVPrincipalURL:(id)a6 withCardDAVUseSSL:(id)a7 withCardDAVPort:(id)a8 withCommunicationServiceRules:(id)a9 withCardDAVCredentials:(id)a10;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAccountCardDAVDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules;
- (NSNumber)payloadCardDAVPort;
- (NSNumber)payloadCardDAVUseSSL;
- (NSString)payloadCardDAVAccountDescription;
- (NSString)payloadCardDAVCredentials;
- (NSString)payloadCardDAVHostName;
- (NSString)payloadCardDAVPrincipalURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCardDAVAccountDescription:(id)a3;
- (void)setPayloadCardDAVCredentials:(id)a3;
- (void)setPayloadCardDAVHostName:(id)a3;
- (void)setPayloadCardDAVPort:(id)a3;
- (void)setPayloadCardDAVPrincipalURL:(id)a3;
- (void)setPayloadCardDAVUseSSL:(id)a3;
- (void)setPayloadCommunicationServiceRules:(id)a3;
@end

@implementation CEMAccountCardDAVDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.carddav";
}

+ (id)profileType
{
  return @"com.apple.carddav.account";
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CardDAVAccountDescription";
  v6[1] = @"CardDAVHostName";
  v6[2] = @"CardDAVPrincipalURL";
  v6[3] = @"CardDAVUseSSL";
  v6[4] = @"CardDAVPort";
  v6[5] = @"CommunicationServiceRules";
  v6[6] = @"CardDAVCredentials";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
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
  v4 = [(CEMAccountCardDAVDeclaration *)self payloadCardDAVCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withCardDAVAccountDescription:(id)a4 withCardDAVHostName:(id)a5 withCardDAVPrincipalURL:(id)a6 withCardDAVUseSSL:(id)a7 withCardDAVPort:(id)a8 withCommunicationServiceRules:(id)a9 withCardDAVCredentials:(id)a10
{
  id v15 = a3;
  id v28 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  [v22 setDeclarationType:@"com.apple.configuration.account.carddav"];
  if (v15)
  {
    [v22 setDeclarationIdentifier:v15];
  }
  else
  {
    v23 = [MEMORY[0x263F08C38] UUID];
    v24 = [v23 UUIDString];
    [v22 setDeclarationIdentifier:v24];
  }
  [v22 setPayloadCardDAVAccountDescription:v21];

  [v22 setPayloadCardDAVHostName:v20];
  [v22 setPayloadCardDAVPrincipalURL:v19];

  if (v18) {
    id v25 = v18;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA88];
  }
  [v22 setPayloadCardDAVUseSSL:v25];

  if (v17) {
    v26 = v17;
  }
  else {
    v26 = &unk_26C894718;
  }
  [v22 setPayloadCardDAVPort:v26];

  [v22 setPayloadCommunicationServiceRules:v16];
  [v22 setPayloadCardDAVCredentials:v28];

  [v22 updateServerHash];

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCardDAVHostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.carddav"];
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
  [v7 setPayloadCardDAVHostName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountCardDAVDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v35 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CardDAVAccountDescription" isRequired:0 defaultValue:0 error:&v35];
  id v14 = v35;
  payloadCardDAVAccountDescription = self->_payloadCardDAVAccountDescription;
  self->_payloadCardDAVAccountDescription = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CardDAVHostName" isRequired:1 defaultValue:0 error:&v34];
    id v14 = v34;
    payloadCardDAVHostName = self->_payloadCardDAVHostName;
    self->_payloadCardDAVHostName = v16;

    if (!v14)
    {
      id v33 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CardDAVPrincipalURL" isRequired:0 defaultValue:0 error:&v33];
      id v14 = v33;
      payloadCardDAVPrincipalURL = self->_payloadCardDAVPrincipalURL;
      self->_payloadCardDAVPrincipalURL = v18;

      if (!v14)
      {
        id v32 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"CardDAVUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v32];
        id v14 = v32;
        payloadCardDAVUseSSL = self->_payloadCardDAVUseSSL;
        self->_payloadCardDAVUseSSL = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CardDAVPort" isRequired:0 defaultValue:&unk_26C894718 error:&v31];
          id v14 = v31;
          payloadCardDAVPort = self->_payloadCardDAVPort;
          self->_payloadCardDAVPort = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"CommunicationServiceRules" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v30];
            id v14 = v30;
            payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
            self->_payloadCommunicationServiceRules = v24;

            if (!v14)
            {
              id v29 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CardDAVCredentials" isRequired:0 defaultValue:0 error:&v29];
              id v14 = v29;
              payloadCardDAVCredentials = self->_payloadCardDAVCredentials;
              self->_payloadCardDAVCredentials = v26;
            }
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CardDAVAccountDescription" withValue:self->_payloadCardDAVAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CardDAVHostName" withValue:self->_payloadCardDAVHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CardDAVPrincipalURL" withValue:self->_payloadCardDAVPrincipalURL isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"CardDAVUseSSL" withValue:self->_payloadCardDAVUseSSL isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"CardDAVPort" withValue:self->_payloadCardDAVPort isRequired:0 defaultValue:&unk_26C894718];
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __67__CEMAccountCardDAVDeclaration_serializePayloadWithAssetProviders___block_invoke;
  id v15 = &unk_2642C87E8;
  id v7 = v4;
  id v16 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"CommunicationServiceRules" withValue:payloadCommunicationServiceRules dictSerializer:&v12 isRequired:0 defaultValue:0];
  payloadCardDAVCredentials = self->_payloadCardDAVCredentials;
  if (payloadCardDAVCredentials)
  {
    v9 = [v7 objectForKeyedSubscript:self->_payloadCardDAVCredentials];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"CardDAVCredentials", payloadCardDAVCredentials, v9, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"CardDAVCredentials", 0, 0, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __67__CEMAccountCardDAVDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMAccountCardDAVDeclaration;
  id v4 = [(CEMDeclarationBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadCardDAVAccountDescription copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCardDAVHostName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadCardDAVPrincipalURL copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadCardDAVUseSSL copy];
  uint64_t v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadCardDAVPort copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(CEMAccountCardDAVDeclaration_CommunicationServiceRules *)self->_payloadCommunicationServiceRules copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadCardDAVCredentials copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSString)payloadCardDAVAccountDescription
{
  return self->_payloadCardDAVAccountDescription;
}

- (void)setPayloadCardDAVAccountDescription:(id)a3
{
}

- (NSString)payloadCardDAVHostName
{
  return self->_payloadCardDAVHostName;
}

- (void)setPayloadCardDAVHostName:(id)a3
{
}

- (NSString)payloadCardDAVPrincipalURL
{
  return self->_payloadCardDAVPrincipalURL;
}

- (void)setPayloadCardDAVPrincipalURL:(id)a3
{
}

- (NSNumber)payloadCardDAVUseSSL
{
  return self->_payloadCardDAVUseSSL;
}

- (void)setPayloadCardDAVUseSSL:(id)a3
{
}

- (NSNumber)payloadCardDAVPort
{
  return self->_payloadCardDAVPort;
}

- (void)setPayloadCardDAVPort:(id)a3
{
}

- (CEMAccountCardDAVDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
}

- (NSString)payloadCardDAVCredentials
{
  return self->_payloadCardDAVCredentials;
}

- (void)setPayloadCardDAVCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCardDAVCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVPort, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVPrincipalURL, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVHostName, 0);

  objc_storeStrong((id *)&self->_payloadCardDAVAccountDescription, 0);
}

uint64_t __93__CEMAccountCardDAVDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

@end