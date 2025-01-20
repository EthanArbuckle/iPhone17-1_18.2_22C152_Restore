@interface CEMAccountGoogleDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAddress:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withAccountDescription:(id)a4 withAccountName:(id)a5 withEmailAddress:(id)a6 withCommunicationServiceRules:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAccountGoogleDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules;
- (NSString)payloadAccountDescription;
- (NSString)payloadAccountName;
- (NSString)payloadEmailAddress;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAccountDescription:(id)a3;
- (void)setPayloadAccountName:(id)a3;
- (void)setPayloadCommunicationServiceRules:(id)a3;
- (void)setPayloadEmailAddress:(id)a3;
@end

@implementation CEMAccountGoogleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.google-oauth";
}

+ (id)profileType
{
  return @"com.apple.google-oauth";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AccountDescription";
  v6[1] = @"AccountName";
  v6[2] = @"EmailAddress";
  v6[3] = @"CommunicationServiceRules";
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAccountDescription:(id)a4 withAccountName:(id)a5 withEmailAddress:(id)a6 withCommunicationServiceRules:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.account.google-oauth"];
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
  [v16 setPayloadAccountDescription:v15];

  [v16 setPayloadAccountName:v14];
  [v16 setPayloadEmailAddress:v13];

  [v16 setPayloadCommunicationServiceRules:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAddress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.google-oauth"];
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
  [v7 setPayloadEmailAddress:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountGoogleDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AccountDescription" isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadAccountDescription = self->_payloadAccountDescription;
  self->_payloadAccountDescription = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AccountName" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadAccountName = self->_payloadAccountName;
    self->_payloadAccountName = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EmailAddress" isRequired:1 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadEmailAddress = self->_payloadEmailAddress;
      self->_payloadEmailAddress = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"CommunicationServiceRules" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
        self->_payloadCommunicationServiceRules = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AccountDescription" withValue:self->_payloadAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AccountName" withValue:self->_payloadAccountName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EmailAddress" withValue:self->_payloadEmailAddress isRequired:1 defaultValue:0];
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CEMAccountGoogleDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"CommunicationServiceRules" withValue:payloadCommunicationServiceRules dictSerializer:v10 isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __66__CEMAccountGoogleDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMAccountGoogleDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAccountDescription copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAccountName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadEmailAddress copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(CEMAccountGoogleDeclaration_CommunicationServiceRules *)self->_payloadCommunicationServiceRules copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadAccountDescription
{
  return self->_payloadAccountDescription;
}

- (void)setPayloadAccountDescription:(id)a3
{
}

- (NSString)payloadAccountName
{
  return self->_payloadAccountName;
}

- (void)setPayloadAccountName:(id)a3
{
}

- (NSString)payloadEmailAddress
{
  return self->_payloadEmailAddress;
}

- (void)setPayloadEmailAddress:(id)a3
{
}

- (CEMAccountGoogleDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadEmailAddress, 0);
  objc_storeStrong((id *)&self->_payloadAccountName, 0);

  objc_storeStrong((id *)&self->_payloadAccountDescription, 0);
}

uint64_t __92__CEMAccountGoogleDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

@end