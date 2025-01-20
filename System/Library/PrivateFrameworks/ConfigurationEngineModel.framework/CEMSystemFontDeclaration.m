@interface CEMSystemFontDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFont:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withName:(id)a4 withFont:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSString)payloadFont;
- (NSString)payloadName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadFont:(id)a3;
- (void)setPayloadName:(id)a3;
@end

@implementation CEMSystemFontDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.font";
}

+ (id)profileType
{
  return @"com.apple.font";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Name";
  v6[1] = @"Font";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
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
  v4 = [(CEMSystemFontDeclaration *)self payloadFont];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"font"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withName:(id)a4 withFont:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (__CFString *)a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.system.font"];
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
  if (v9) {
    v13 = v9;
  }
  else {
    v13 = &stru_26C838878;
  }
  [v10 setPayloadName:v13];

  [v10 setPayloadFont:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFont:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.system.font"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadFont:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemFontDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:0 defaultValue:&stru_26C838878 error:&v20];
  id v14 = v20;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Font" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadFont = self->_payloadFont;
    self->_payloadFont = v16;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Name" withValue:self->_payloadName isRequired:0 defaultValue:&stru_26C838878];
  payloadFont = self->_payloadFont;
  if (payloadFont)
  {
    id v7 = [v4 objectForKeyedSubscript:self->_payloadFont];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"Font" withValue:payloadFont assetProvider:v7 transformType:@"<data>" isRequired:1 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"Font" withValue:0 assetProvider:0 transformType:@"<data>" isRequired:1 defaultValue:&stru_26C838878];
  }
  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemFontDeclaration;
  id v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadFont copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSString)payloadFont
{
  return self->_payloadFont;
}

- (void)setPayloadFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFont, 0);

  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end