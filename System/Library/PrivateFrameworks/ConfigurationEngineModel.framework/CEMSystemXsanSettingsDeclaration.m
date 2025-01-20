@interface CEMSystemXsanSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSharedSecret:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSanAuthMethod:(id)a7 withSharedSecret:(id)a8;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadFsnameservers;
- (NSArray)payloadSanConfigURLs;
- (NSString)payloadSanAuthMethod;
- (NSString)payloadSanName;
- (NSString)payloadSharedSecret;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadFsnameservers:(id)a3;
- (void)setPayloadSanAuthMethod:(id)a3;
- (void)setPayloadSanConfigURLs:(id)a3;
- (void)setPayloadSanName:(id)a3;
- (void)setPayloadSharedSecret:(id)a3;
@end

@implementation CEMSystemXsanSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.xsan.settings";
}

+ (id)profileType
{
  return @"com.apple.xsan";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"sanName";
  v6[1] = @"sanConfigURLs";
  v6[2] = @"fsnameservers";
  v6[3] = @"sanAuthMethod";
  v6[4] = @"sharedSecret";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
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

+ (id)buildWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSanAuthMethod:(id)a7 withSharedSecret:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.system.xsan.settings"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  [v19 setPayloadSanName:v18];

  [v19 setPayloadSanConfigURLs:v17];
  [v19 setPayloadFsnameservers:v16];

  [v19 setPayloadSanAuthMethod:v15];
  [v19 setPayloadSharedSecret:v14];

  [v19 updateServerHash];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSharedSecret:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.system.xsan.settings"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    id v17 = [MEMORY[0x263F08C38] UUID];
    id v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadSanName:v15];

  [v16 setPayloadSanConfigURLs:v14];
  [v16 setPayloadFsnameservers:v13];

  [v16 setPayloadSharedSecret:v12];
  [v16 updateServerHash];

  return v16;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemXsanSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"sanName" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadSanName = self->_payloadSanName;
  self->_payloadSanName = v13;

  if (!v14)
  {
    id v28 = 0;
    id v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"sanConfigURLs" validator:&__block_literal_global_40 isRequired:1 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadSanConfigURLs = self->_payloadSanConfigURLs;
    self->_payloadSanConfigURLs = v16;

    if (!v14)
    {
      id v27 = 0;
      id v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"fsnameservers" validator:&__block_literal_global_32 isRequired:1 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadFsnameservers = self->_payloadFsnameservers;
      self->_payloadFsnameservers = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"sanAuthMethod" isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadSanAuthMethod = self->_payloadSanAuthMethod;
        self->_payloadSanAuthMethod = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"sharedSecret" isRequired:1 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadSharedSecret = self->_payloadSharedSecret;
          self->_payloadSharedSecret = v22;
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __54__CEMSystemXsanSettingsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CEMSystemXsanSettingsDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"sanName" withValue:self->_payloadSanName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"sanConfigURLs" withValue:self->_payloadSanConfigURLs itemSerializer:&__block_literal_global_36 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"fsnameservers" withValue:self->_payloadFsnameservers itemSerializer:&__block_literal_global_38_2 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"sanAuthMethod" withValue:self->_payloadSanAuthMethod isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"sharedSecret" withValue:self->_payloadSharedSecret isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

id __71__CEMSystemXsanSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __71__CEMSystemXsanSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMSystemXsanSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadSanName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadSanConfigURLs copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadFsnameservers copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadSanAuthMethod copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadSharedSecret copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSString)payloadSanName
{
  return self->_payloadSanName;
}

- (void)setPayloadSanName:(id)a3
{
}

- (NSArray)payloadSanConfigURLs
{
  return self->_payloadSanConfigURLs;
}

- (void)setPayloadSanConfigURLs:(id)a3
{
}

- (NSArray)payloadFsnameservers
{
  return self->_payloadFsnameservers;
}

- (void)setPayloadFsnameservers:(id)a3
{
}

- (NSString)payloadSanAuthMethod
{
  return self->_payloadSanAuthMethod;
}

- (void)setPayloadSanAuthMethod:(id)a3
{
}

- (NSString)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadSanAuthMethod, 0);
  objc_storeStrong((id *)&self->_payloadFsnameservers, 0);
  objc_storeStrong((id *)&self->_payloadSanConfigURLs, 0);

  objc_storeStrong((id *)&self->_payloadSanName, 0);
}

@end