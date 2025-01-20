@interface CEMNetwork8021XThirdActiveEthernetDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSDictionary)payloadANY;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadANY:(id)a3;
@end

@implementation CEMNetwork8021XThirdActiveEthernetDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.802.1X.thirdactiveethernet";
}

+ (id)profileType
{
  return @"com.apple.thirdactiveethernet.managed";
}

+ (NSSet)allowedPayloadKeys
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
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

+ (id)buildWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.802.1X.thirdactiveethernet"];
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

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.802.1X.thirdactiveethernet"];
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
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void *)MEMORY[0x263EFF9C0];
  v7 = [v5 allKeys];
  v8 = [v6 setWithArray:v7];

  v9 = +[CEMNetwork8021XThirdActiveEthernetDeclaration allowedPayloadKeys];
  [v8 minusSet:v9];

  v10 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v16, (void)v21))
        {
          v17 = [v11 objectForKeyedSubscript:v16];
          [v10 setObject:v17 forKeyedSubscript:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    v18 = (NSDictionary *)[v10 copy];
    payloadANY = self->_payloadANY;
    self->_payloadANY = v18;
  }
  return 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_payloadANY;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = -[NSDictionary objectForKeyedSubscript:](self->_payloadANY, "objectForKeyedSubscript:", v10, (void)v14);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMNetwork8021XThirdActiveEthernetDeclaration;
  v4 = [(CEMDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_payloadANY copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (NSDictionary)payloadANY
{
  return self->_payloadANY;
}

- (void)setPayloadANY:(id)a3
{
}

- (void).cxx_destruct
{
}

@end