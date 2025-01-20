@interface CEMAccountmacOSServerDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withHostName:(id)a4 withConfiguredAccounts:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withHostName:(id)a4 withAccountDescription:(id)a5 withConfiguredAccounts:(id)a6 withCredentials:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadConfiguredAccounts;
- (NSString)payloadAccountDescription;
- (NSString)payloadCredentials;
- (NSString)payloadHostName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAccountDescription:(id)a3;
- (void)setPayloadConfiguredAccounts:(id)a3;
- (void)setPayloadCredentials:(id)a3;
- (void)setPayloadHostName:(id)a3;
@end

@implementation CEMAccountmacOSServerDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.osxserver";
}

+ (id)profileType
{
  return @"com.apple.osxserver.account";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HostName";
  v6[1] = @"AccountDescription";
  v6[2] = @"ConfiguredAccounts";
  v6[3] = @"Credentials";
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
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  v4 = [(CEMAccountmacOSServerDeclaration *)self payloadCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withHostName:(id)a4 withAccountDescription:(id)a5 withConfiguredAccounts:(id)a6 withCredentials:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.account.osxserver"];
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
  [v16 setPayloadHostName:v15];

  [v16 setPayloadAccountDescription:v14];
  [v16 setPayloadConfiguredAccounts:v13];

  [v16 setPayloadCredentials:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withHostName:(id)a4 withConfiguredAccounts:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.account.osxserver"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadHostName:v9];

  [v10 setPayloadConfiguredAccounts:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountmacOSServerDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HostName" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadHostName = self->_payloadHostName;
  self->_payloadHostName = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AccountDescription" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadAccountDescription = self->_payloadAccountDescription;
    self->_payloadAccountDescription = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ConfiguredAccounts" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadConfiguredAccounts = self->_payloadConfiguredAccounts;
      self->_payloadConfiguredAccounts = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Credentials" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadCredentials = self->_payloadCredentials;
        self->_payloadCredentials = v20;
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
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"HostName" withValue:self->_payloadHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AccountDescription" withValue:self->_payloadAccountDescription isRequired:0 defaultValue:0];
  payloadConfiguredAccounts = self->_payloadConfiguredAccounts;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __71__CEMAccountmacOSServerDeclaration_serializePayloadWithAssetProviders___block_invoke;
  id v15 = &unk_2642C8850;
  id v7 = v4;
  id v16 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"ConfiguredAccounts" withValue:payloadConfiguredAccounts itemSerializer:&v12 isRequired:1 defaultValue:0];
  payloadCredentials = self->_payloadCredentials;
  if (payloadCredentials)
  {
    id v9 = [v7 objectForKeyedSubscript:self->_payloadCredentials];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"Credentials", payloadCredentials, v9, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"Credentials", 0, 0, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __71__CEMAccountmacOSServerDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMAccountmacOSServerDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadHostName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAccountDescription copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadConfiguredAccounts copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadCredentials copy];
  uint64_t v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
}

- (NSString)payloadAccountDescription
{
  return self->_payloadAccountDescription;
}

- (void)setPayloadAccountDescription:(id)a3
{
}

- (NSArray)payloadConfiguredAccounts
{
  return self->_payloadConfiguredAccounts;
}

- (void)setPayloadConfiguredAccounts:(id)a3
{
}

- (NSString)payloadCredentials
{
  return self->_payloadCredentials;
}

- (void)setPayloadCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCredentials, 0);
  objc_storeStrong((id *)&self->_payloadConfiguredAccounts, 0);
  objc_storeStrong((id *)&self->_payloadAccountDescription, 0);

  objc_storeStrong((id *)&self->_payloadHostName, 0);
}

@end