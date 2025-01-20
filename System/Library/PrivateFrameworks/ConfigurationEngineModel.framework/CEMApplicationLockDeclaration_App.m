@interface CEMApplicationLockDeclaration_App
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withOptions:(id)a4 withUserEnabledOptions:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMApplicationLockDeclaration_AppOptions)payloadOptions;
- (CEMApplicationLockDeclaration_AppUserEnabledOptions)payloadUserEnabledOptions;
- (NSString)payloadIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadOptions:(id)a3;
- (void)setPayloadUserEnabledOptions:(id)a3;
@end

@implementation CEMApplicationLockDeclaration_App

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"Options";
  v6[2] = @"UserEnabledOptions";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withOptions:(id)a4 withUserEnabledOptions:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadIdentifier:v9];

  [v10 setPayloadOptions:v8];
  [v10 setPayloadUserEnabledOptions:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadIdentifier:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationLockDeclaration_App allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Options" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadOptions = self->_payloadOptions;
    self->_payloadOptions = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"UserEnabledOptions" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadUserEnabledOptions = self->_payloadUserEnabledOptions;
      self->_payloadUserEnabledOptions = v18;
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
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier)
  {
    id v7 = [v4 objectForKeyedSubscript:self->_payloadIdentifier];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Identifier", payloadIdentifier, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Identifier", 0, 0, &stru_26C838878);
  }
  payloadOptions = self->_payloadOptions;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__CEMApplicationLockDeclaration_App_serializePayloadWithAssetProviders___block_invoke;
  v16[3] = &unk_2642C87E8;
  id v9 = v4;
  id v17 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Options" withValue:payloadOptions dictSerializer:v16 isRequired:0 defaultValue:0];
  payloadUserEnabledOptions = self->_payloadUserEnabledOptions;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__CEMApplicationLockDeclaration_App_serializePayloadWithAssetProviders___block_invoke_2;
  v14[3] = &unk_2642C87E8;
  id v15 = v9;
  id v11 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"UserEnabledOptions" withValue:payloadUserEnabledOptions dictSerializer:v14 isRequired:0 defaultValue:0];
  v12 = (void *)[v5 copy];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMApplicationLockDeclaration_App;
  id v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMApplicationLockDeclaration_AppOptions *)self->_payloadOptions copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(CEMApplicationLockDeclaration_AppUserEnabledOptions *)self->_payloadUserEnabledOptions copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
}

- (CEMApplicationLockDeclaration_AppOptions)payloadOptions
{
  return self->_payloadOptions;
}

- (void)setPayloadOptions:(id)a3
{
}

- (CEMApplicationLockDeclaration_AppUserEnabledOptions)payloadUserEnabledOptions
{
  return self->_payloadUserEnabledOptions;
}

- (void)setPayloadUserEnabledOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUserEnabledOptions, 0);
  objc_storeStrong((id *)&self->_payloadOptions, 0);

  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
}

@end