@interface CEMNetworkDNSProxyDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withAppBundleIdentifier:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withAppBundleIdentifier:(id)a4 withProviderBundleIdentifier:(id)a5 withProviderConfiguration:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAnyPayload)payloadProviderConfiguration;
- (NSString)payloadAppBundleIdentifier;
- (NSString)payloadProviderBundleIdentifier;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAppBundleIdentifier:(id)a3;
- (void)setPayloadProviderBundleIdentifier:(id)a3;
- (void)setPayloadProviderConfiguration:(id)a3;
@end

@implementation CEMNetworkDNSProxyDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.dnsproxy";
}

+ (id)profileType
{
  return @"com.apple.dnsProxy.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AppBundleIdentifier";
  v6[1] = @"ProviderBundleIdentifier";
  v6[2] = @"ProviderConfiguration";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
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
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  v4 = [(CEMNetworkDNSProxyDeclaration *)self payloadAppBundleIdentifier];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"applicationID"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withAppBundleIdentifier:(id)a4 withProviderBundleIdentifier:(id)a5 withProviderConfiguration:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.network.dnsproxy"];
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
  [v13 setPayloadAppBundleIdentifier:v12];

  [v13 setPayloadProviderBundleIdentifier:v11];
  [v13 setPayloadProviderConfiguration:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withAppBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.dnsproxy"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadAppBundleIdentifier:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkDNSProxyDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AppBundleIdentifier" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadAppBundleIdentifier = self->_payloadAppBundleIdentifier;
  self->_payloadAppBundleIdentifier = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProviderBundleIdentifier" isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadProviderBundleIdentifier = self->_payloadProviderBundleIdentifier;
    self->_payloadProviderBundleIdentifier = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ProviderConfiguration" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadProviderConfiguration = self->_payloadProviderConfiguration;
      self->_payloadProviderConfiguration = v18;
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
  payloadAppBundleIdentifier = self->_payloadAppBundleIdentifier;
  if (payloadAppBundleIdentifier)
  {
    v7 = [v4 objectForKeyedSubscript:self->_payloadAppBundleIdentifier];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"AppBundleIdentifier", payloadAppBundleIdentifier, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"AppBundleIdentifier", 0, 0, &stru_26C838878);
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ProviderBundleIdentifier" withValue:self->_payloadProviderBundleIdentifier isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"ProviderConfiguration" withValue:self->_payloadProviderConfiguration dictSerializer:&__block_literal_global_20 isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __68__CEMNetworkDNSProxyDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkDNSProxyDeclaration;
  id v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAppBundleIdentifier copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadProviderBundleIdentifier copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(CEMAnyPayload *)self->_payloadProviderConfiguration copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSString)payloadAppBundleIdentifier
{
  return self->_payloadAppBundleIdentifier;
}

- (void)setPayloadAppBundleIdentifier:(id)a3
{
}

- (NSString)payloadProviderBundleIdentifier
{
  return self->_payloadProviderBundleIdentifier;
}

- (void)setPayloadProviderBundleIdentifier:(id)a3
{
}

- (CEMAnyPayload)payloadProviderConfiguration
{
  return self->_payloadProviderConfiguration;
}

- (void)setPayloadProviderConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadProviderBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadAppBundleIdentifier, 0);
}

@end