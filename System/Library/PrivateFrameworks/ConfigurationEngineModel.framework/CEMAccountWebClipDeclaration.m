@interface CEMAccountWebClipDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withURL:(id)a4 withLabel:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withPrecomposed:(id)a4 withFullScreen:(id)a5 withURL:(id)a6 withIsRemovable:(id)a7 withLabel:(id)a8 withIcon:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadFullScreen;
- (NSNumber)payloadIsRemovable;
- (NSNumber)payloadPrecomposed;
- (NSString)payloadIcon;
- (NSString)payloadLabel;
- (NSString)payloadURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadFullScreen:(id)a3;
- (void)setPayloadIcon:(id)a3;
- (void)setPayloadIsRemovable:(id)a3;
- (void)setPayloadLabel:(id)a3;
- (void)setPayloadPrecomposed:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation CEMAccountWebClipDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.webclip";
}

+ (id)profileType
{
  return @"com.apple.webClip.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Precomposed";
  v6[1] = @"FullScreen";
  v6[2] = @"URL";
  v6[3] = @"IsRemovable";
  v6[4] = @"Label";
  v6[5] = @"Icon";
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
  v4 = [(CEMAccountWebClipDeclaration *)self payloadIcon];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"image"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withPrecomposed:(id)a4 withFullScreen:(id)a5 withURL:(id)a6 withIsRemovable:(id)a7 withLabel:(id)a8 withIcon:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.account.webclip"];
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
  v24 = (void *)MEMORY[0x263EFFA80];
  if (v20) {
    id v25 = v20;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA80];
  }
  [v21 setPayloadPrecomposed:v25];

  if (v19) {
    id v26 = v19;
  }
  else {
    id v26 = v24;
  }
  [v21 setPayloadFullScreen:v26];

  [v21 setPayloadURL:v18];
  if (v17) {
    id v27 = v17;
  }
  else {
    id v27 = (id)MEMORY[0x263EFFA88];
  }
  [v21 setPayloadIsRemovable:v27];

  [v21 setPayloadLabel:v16];
  [v21 setPayloadIcon:v15];

  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withURL:(id)a4 withLabel:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.account.webclip"];
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
  [v10 setPayloadURL:v9];

  [v10 setPayloadLabel:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountWebClipDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Precomposed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v32];
  id v14 = v32;
  payloadPrecomposed = self->_payloadPrecomposed;
  self->_payloadPrecomposed = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"FullScreen" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v31];
    id v14 = v31;
    payloadFullScreen = self->_payloadFullScreen;
    self->_payloadFullScreen = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"URL" isRequired:1 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadURL = self->_payloadURL;
      self->_payloadURL = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsRemovable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
        id v14 = v29;
        payloadIsRemovable = self->_payloadIsRemovable;
        self->_payloadIsRemovable = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Label" isRequired:1 defaultValue:0 error:&v28];
          id v14 = v28;
          payloadLabel = self->_payloadLabel;
          self->_payloadLabel = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Icon" isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadIcon = self->_payloadIcon;
            self->_payloadIcon = v24;
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
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"Precomposed" withValue:self->_payloadPrecomposed isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"FullScreen" withValue:self->_payloadFullScreen isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"URL" withValue:self->_payloadURL isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"IsRemovable" withValue:self->_payloadIsRemovable isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Label" withValue:self->_payloadLabel isRequired:1 defaultValue:0];
  payloadIcon = self->_payloadIcon;
  if (payloadIcon)
  {
    id v8 = [v4 objectForKeyedSubscript:self->_payloadIcon];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"Icon" withValue:payloadIcon assetProvider:v8 transformType:@"<data>" isRequired:0 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"Icon" withValue:0 assetProvider:0 transformType:@"<data>" isRequired:0 defaultValue:&stru_26C838878];
  }
  id v9 = (void *)[v5 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMAccountWebClipDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadPrecomposed copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadFullScreen copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadURL copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadIsRemovable copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadLabel copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadIcon copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadPrecomposed
{
  return self->_payloadPrecomposed;
}

- (void)setPayloadPrecomposed:(id)a3
{
}

- (NSNumber)payloadFullScreen
{
  return self->_payloadFullScreen;
}

- (void)setPayloadFullScreen:(id)a3
{
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (NSNumber)payloadIsRemovable
{
  return self->_payloadIsRemovable;
}

- (void)setPayloadIsRemovable:(id)a3
{
}

- (NSString)payloadLabel
{
  return self->_payloadLabel;
}

- (void)setPayloadLabel:(id)a3
{
}

- (NSString)payloadIcon
{
  return self->_payloadIcon;
}

- (void)setPayloadIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIcon, 0);
  objc_storeStrong((id *)&self->_payloadLabel, 0);
  objc_storeStrong((id *)&self->_payloadIsRemovable, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_payloadFullScreen, 0);

  objc_storeStrong((id *)&self->_payloadPrecomposed, 0);
}

@end