@interface CEMSystemSearchDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowSpotlightInternetResults:(id)a4 withAllowDefinitionLookup:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowDefinitionLookup;
- (NSNumber)payloadAllowSpotlightInternetResults;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowDefinitionLookup:(id)a3;
- (void)setPayloadAllowSpotlightInternetResults:(id)a3;
@end

@implementation CEMSystemSearchDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.search";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowSpotlightInternetResults";
  v6[1] = @"allowDefinitionLookup";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowSpotlightInternetResults";
  v6[1] = @"allowDefinitionLookup";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowSpotlightInternetResults:(id)a4 withAllowDefinitionLookup:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.system.search"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  v13 = (void *)MEMORY[0x263EFFA88];
  if (v9) {
    id v14 = v9;
  }
  else {
    id v14 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAllowSpotlightInternetResults:v14];

  if (v8) {
    id v15 = v8;
  }
  else {
    id v15 = v13;
  }
  [v10 setPayloadAllowDefinitionLookup:v15];

  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.search"];
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
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemSearchDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSpotlightInternetResults" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v20];
  id v14 = v20;
  payloadAllowSpotlightInternetResults = self->_payloadAllowSpotlightInternetResults;
  self->_payloadAllowSpotlightInternetResults = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowDefinitionLookup" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v19];
    id v14 = v19;
    payloadAllowDefinitionLookup = self->_payloadAllowDefinitionLookup;
    self->_payloadAllowDefinitionLookup = v16;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSpotlightInternetResults" withValue:self->_payloadAllowSpotlightInternetResults isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowDefinitionLookup" withValue:self->_payloadAllowDefinitionLookup isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemSearchDeclaration;
  v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowSpotlightInternetResults copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowDefinitionLookup copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSNumber)payloadAllowSpotlightInternetResults
{
  return self->_payloadAllowSpotlightInternetResults;
}

- (void)setPayloadAllowSpotlightInternetResults:(id)a3
{
}

- (NSNumber)payloadAllowDefinitionLookup
{
  return self->_payloadAllowDefinitionLookup;
}

- (void)setPayloadAllowDefinitionLookup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowDefinitionLookup, 0);

  objc_storeStrong((id *)&self->_payloadAllowSpotlightInternetResults, 0);
}

@end