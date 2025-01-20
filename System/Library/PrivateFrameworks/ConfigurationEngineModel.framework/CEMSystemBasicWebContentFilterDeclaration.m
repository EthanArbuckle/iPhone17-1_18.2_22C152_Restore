@interface CEMSystemBasicWebContentFilterDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRestrictWeb:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withRestrictWeb:(id)a4 withUseContentFilter:(id)a5 withWhiteListEnabled:(id)a6 withSiteWhiteList:(id)a7 withFilterWhiteList:(id)a8 withFilterBlackList:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadFilterBlackList;
- (NSArray)payloadFilterWhiteList;
- (NSArray)payloadSiteWhiteList;
- (NSNumber)payloadRestrictWeb;
- (NSNumber)payloadUseContentFilter;
- (NSNumber)payloadWhiteListEnabled;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5;
- (int)activationLevel;
- (void)setPayloadFilterBlackList:(id)a3;
- (void)setPayloadFilterWhiteList:(id)a3;
- (void)setPayloadRestrictWeb:(id)a3;
- (void)setPayloadSiteWhiteList:(id)a3;
- (void)setPayloadUseContentFilter:(id)a3;
- (void)setPayloadWhiteListEnabled:(id)a3;
@end

@implementation CEMSystemBasicWebContentFilterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.web.contentfilter.basic";
}

+ (id)profileType
{
  return @"com.apple.familycontrols.contentfilter";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"restrictWeb";
  v6[1] = @"useContentFilter";
  v6[2] = @"whiteListEnabled";
  v6[3] = @"siteWhiteList";
  v6[4] = @"filterWhiteList";
  v6[5] = @"filterBlackList";
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

+ (id)buildWithIdentifier:(id)a3 withRestrictWeb:(id)a4 withUseContentFilter:(id)a5 withWhiteListEnabled:(id)a6 withSiteWhiteList:(id)a7 withFilterWhiteList:(id)a8 withFilterBlackList:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.system.web.contentfilter.basic"];
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
  [v21 setPayloadRestrictWeb:v20];

  v24 = (void *)MEMORY[0x263EFFA80];
  if (v19) {
    id v25 = v19;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA80];
  }
  [v21 setPayloadUseContentFilter:v25];

  if (v18) {
    id v26 = v18;
  }
  else {
    id v26 = v24;
  }
  [v21 setPayloadWhiteListEnabled:v26];

  [v21 setPayloadSiteWhiteList:v17];
  [v21 setPayloadFilterWhiteList:v16];

  [v21 setPayloadFilterBlackList:v15];
  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRestrictWeb:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.system.web.contentfilter.basic"];
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
  [v7 setPayloadRestrictWeb:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemBasicWebContentFilterDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"restrictWeb" isRequired:1 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadRestrictWeb = self->_payloadRestrictWeb;
  self->_payloadRestrictWeb = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"useContentFilter" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v31];
    id v14 = v31;
    payloadUseContentFilter = self->_payloadUseContentFilter;
    self->_payloadUseContentFilter = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"whiteListEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v30];
      id v14 = v30;
      payloadWhiteListEnabled = self->_payloadWhiteListEnabled;
      self->_payloadWhiteListEnabled = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"siteWhiteList" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v29];
        id v14 = v29;
        payloadSiteWhiteList = self->_payloadSiteWhiteList;
        self->_payloadSiteWhiteList = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"filterWhiteList" validator:&__block_literal_global_38 isRequired:0 defaultValue:0 error:&v28];
          id v14 = v28;
          payloadFilterWhiteList = self->_payloadFilterWhiteList;
          self->_payloadFilterWhiteList = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"filterBlackList" validator:&__block_literal_global_33_1 isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadFilterBlackList = self->_payloadFilterBlackList;
            self->_payloadFilterBlackList = v24;
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

uint64_t __63__CEMSystemBasicWebContentFilterDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemBasicWebContentFilterDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"restrictWeb" withValue:self->_payloadRestrictWeb isRequired:1 defaultValue:0];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"useContentFilter" withValue:self->_payloadUseContentFilter isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"whiteListEnabled" withValue:self->_payloadWhiteListEnabled isRequired:0 defaultValue:v6];
  payloadSiteWhiteList = self->_payloadSiteWhiteList;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v11[3] = &unk_2642C9778;
  id v12 = v4;
  id v8 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"siteWhiteList" withValue:payloadSiteWhiteList itemSerializer:v11 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"filterWhiteList" withValue:self->_payloadFilterWhiteList itemSerializer:&__block_literal_global_38_1 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"filterBlackList" withValue:self->_payloadFilterBlackList itemSerializer:&__block_literal_global_40_0 isRequired:0 defaultValue:0];
  v9 = (void *)[v5 copy];

  return v9;
}

uint64_t __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMSystemBasicWebContentFilterDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadRestrictWeb copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadUseContentFilter copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadWhiteListEnabled copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadSiteWhiteList copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadFilterWhiteList copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadFilterBlackList copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)CEMSystemBasicWebContentFilterDeclaration;
  uint64_t v6 = [(CEMConfigurationBase *)&v26 synthesizeProfileOutUUIDs:a3 withOldUUIDs:a4 assetProviders:a5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  id v8 = [v7 objectForKeyedSubscript:@"PayloadContent"];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  v10 = (void *)[v9 mutableCopy];

  [v10 setObject:@"com.apple.applicationaccess" forKeyedSubscript:@"PayloadType"];
  [v10 setObject:0 forKeyedSubscript:@"restrictWeb"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"siteWhiteList"];

  if (v11)
  {
    id v12 = [(CEMSystemBasicWebContentFilterDeclaration *)self payloadRestrictWeb];
    if ([v12 BOOLValue])
    {
      uint64_t v13 = [(CEMSystemBasicWebContentFilterDeclaration *)self payloadWhiteListEnabled];
      int v14 = [v13 BOOLValue];

      if (!v14) {
        goto LABEL_6;
      }
      id v12 = [v10 objectForKeyedSubscript:@"siteWhiteList"];
      uint64_t v15 = [v12 valueForKey:@"address"];
      [v10 setObject:v15 forKeyedSubscript:@"webContentFilterWhitelistedURLs"];

      id v16 = [v12 valueForKey:@"pageTitle"];
      [v10 setObject:v16 forKeyedSubscript:@"webContentFilterWhitelistedBookmarks"];
    }
  }
LABEL_6:
  [v10 setObject:0 forKeyedSubscript:@"whiteListEnabled"];
  [v10 setObject:0 forKeyedSubscript:@"siteWhiteList"];
  id v17 = [(CEMSystemBasicWebContentFilterDeclaration *)self payloadRestrictWeb];
  if ([v17 BOOLValue])
  {
    objc_super v18 = [(CEMSystemBasicWebContentFilterDeclaration *)self payloadUseContentFilter];
    int v19 = [v18 BOOLValue];

    if (!v19) {
      goto LABEL_10;
    }
    id v20 = [v10 objectForKeyedSubscript:@"useContentFilter"];
    [v10 setObject:v20 forKeyedSubscript:@"forceWebContentFilterAuto"];

    v21 = [v10 objectForKeyedSubscript:@"filterWhiteList"];
    [v10 setObject:v21 forKeyedSubscript:@"webContentFilterAutoPermittedURLs"];

    id v17 = [v10 objectForKeyedSubscript:@"filterBlackList"];
    [v10 setObject:v17 forKeyedSubscript:@"webContentFilterBlacklistedURLs"];
  }

LABEL_10:
  [v10 setObject:0 forKeyedSubscript:@"useContentFilter"];
  [v10 setObject:0 forKeyedSubscript:@"filterWhiteList"];
  [v10 setObject:0 forKeyedSubscript:@"filterBlackList"];
  v22 = (void *)[v10 copy];
  v27[0] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v7 setObject:v23 forKeyedSubscript:@"PayloadContent"];

  v24 = (void *)[v7 copy];

  return v24;
}

- (NSNumber)payloadRestrictWeb
{
  return self->_payloadRestrictWeb;
}

- (void)setPayloadRestrictWeb:(id)a3
{
}

- (NSNumber)payloadUseContentFilter
{
  return self->_payloadUseContentFilter;
}

- (void)setPayloadUseContentFilter:(id)a3
{
}

- (NSNumber)payloadWhiteListEnabled
{
  return self->_payloadWhiteListEnabled;
}

- (void)setPayloadWhiteListEnabled:(id)a3
{
}

- (NSArray)payloadSiteWhiteList
{
  return self->_payloadSiteWhiteList;
}

- (void)setPayloadSiteWhiteList:(id)a3
{
}

- (NSArray)payloadFilterWhiteList
{
  return self->_payloadFilterWhiteList;
}

- (void)setPayloadFilterWhiteList:(id)a3
{
}

- (NSArray)payloadFilterBlackList
{
  return self->_payloadFilterBlackList;
}

- (void)setPayloadFilterBlackList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFilterBlackList, 0);
  objc_storeStrong((id *)&self->_payloadFilterWhiteList, 0);
  objc_storeStrong((id *)&self->_payloadSiteWhiteList, 0);
  objc_storeStrong((id *)&self->_payloadWhiteListEnabled, 0);
  objc_storeStrong((id *)&self->_payloadUseContentFilter, 0);

  objc_storeStrong((id *)&self->_payloadRestrictWeb, 0);
}

@end