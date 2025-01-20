@interface CEMSystemWebContentFilterDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withFilterType:(id)a4 withAutoFilterEnabled:(id)a5 withPermittedURLs:(id)a6 withBlacklistedURLs:(id)a7 withWhitelistedBookmarks:(id)a8 withUserDefinedName:(id)a9 withPluginBundleID:(id)a10 withServerAddress:(id)a11 withUserName:(id)a12 withPassword:(id)a13 withCertificate:(id)a14 withOrganization:(id)a15 withVendorConfig:(id)a16 withFilterBrowsers:(id)a17 withFilterSockets:(id)a18;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAnyPayload)payloadVendorConfig;
- (NSArray)payloadBlacklistedURLs;
- (NSArray)payloadPermittedURLs;
- (NSArray)payloadWhitelistedBookmarks;
- (NSNumber)payloadAutoFilterEnabled;
- (NSNumber)payloadFilterBrowsers;
- (NSNumber)payloadFilterSockets;
- (NSString)payloadCertificate;
- (NSString)payloadFilterType;
- (NSString)payloadOrganization;
- (NSString)payloadPassword;
- (NSString)payloadPluginBundleID;
- (NSString)payloadServerAddress;
- (NSString)payloadUserDefinedName;
- (NSString)payloadUserName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAutoFilterEnabled:(id)a3;
- (void)setPayloadBlacklistedURLs:(id)a3;
- (void)setPayloadCertificate:(id)a3;
- (void)setPayloadFilterBrowsers:(id)a3;
- (void)setPayloadFilterSockets:(id)a3;
- (void)setPayloadFilterType:(id)a3;
- (void)setPayloadOrganization:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadPermittedURLs:(id)a3;
- (void)setPayloadPluginBundleID:(id)a3;
- (void)setPayloadServerAddress:(id)a3;
- (void)setPayloadUserDefinedName:(id)a3;
- (void)setPayloadUserName:(id)a3;
- (void)setPayloadVendorConfig:(id)a3;
- (void)setPayloadWhitelistedBookmarks:(id)a3;
@end

@implementation CEMSystemWebContentFilterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.web.contentfilter";
}

+ (id)profileType
{
  return @"com.apple.webcontent-filter";
}

+ (NSSet)allowedPayloadKeys
{
  v6[15] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"FilterType";
  v6[1] = @"AutoFilterEnabled";
  v6[2] = @"PermittedURLs";
  v6[3] = @"BlacklistedURLs";
  v6[4] = @"WhitelistedBookmarks";
  v6[5] = @"UserDefinedName";
  v6[6] = @"PluginBundleID";
  v6[7] = @"ServerAddress";
  v6[8] = @"UserName";
  v6[9] = @"Password";
  v6[10] = @"Certificate";
  v6[11] = @"Organization";
  v6[12] = @"VendorConfig";
  v6[13] = @"FilterBrowsers";
  v6[14] = @"FilterSockets";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:15];
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
  v4 = [(CEMSystemWebContentFilterDeclaration *)self payloadCertificate];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withFilterType:(id)a4 withAutoFilterEnabled:(id)a5 withPermittedURLs:(id)a6 withBlacklistedURLs:(id)a7 withWhitelistedBookmarks:(id)a8 withUserDefinedName:(id)a9 withPluginBundleID:(id)a10 withServerAddress:(id)a11 withUserName:(id)a12 withPassword:(id)a13 withCertificate:(id)a14 withOrganization:(id)a15 withVendorConfig:(id)a16 withFilterBrowsers:(id)a17 withFilterSockets:(id)a18
{
  id v18 = a3;
  id v47 = a18;
  id v46 = a17;
  id v45 = a16;
  id v44 = a15;
  id v43 = a14;
  id v42 = a13;
  id v41 = a12;
  id v40 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  v25 = (__CFString *)a4;
  v26 = objc_opt_new();
  [v26 setDeclarationType:@"com.apple.configuration.system.web.contentfilter"];
  if (v18)
  {
    [v26 setDeclarationIdentifier:v18];
  }
  else
  {
    v27 = [MEMORY[0x263F08C38] UUID];
    v28 = [v27 UUIDString];
    [v26 setDeclarationIdentifier:v28];

    id v18 = 0;
  }
  if (v25) {
    v29 = v25;
  }
  else {
    v29 = @"BuiltIn";
  }
  objc_msgSend(v26, "setPayloadFilterType:", v29, a9);

  v30 = (void *)MEMORY[0x263EFFA88];
  if (v24) {
    id v31 = v24;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA88];
  }
  [v26 setPayloadAutoFilterEnabled:v31];

  [v26 setPayloadPermittedURLs:v23];
  [v26 setPayloadBlacklistedURLs:v22];

  [v26 setPayloadWhitelistedBookmarks:v21];
  [v26 setPayloadUserDefinedName:v20];

  [v26 setPayloadPluginBundleID:v19];
  [v26 setPayloadServerAddress:v40];

  [v26 setPayloadUserName:v41];
  [v26 setPayloadPassword:v42];

  [v26 setPayloadCertificate:v43];
  [v26 setPayloadOrganization:v44];

  [v26 setPayloadVendorConfig:v45];
  if (v46) {
    id v32 = v46;
  }
  else {
    id v32 = v30;
  }
  [v26 setPayloadFilterBrowsers:v32];

  if (v47) {
    id v33 = v47;
  }
  else {
    id v33 = v30;
  }
  [v26 setPayloadFilterSockets:v33];

  [v26 updateServerHash];

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.web.contentfilter"];
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
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemWebContentFilterDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v59 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"FilterType" isRequired:0 defaultValue:@"BuiltIn" error:&v59];
  id v14 = v59;
  payloadFilterType = self->_payloadFilterType;
  self->_payloadFilterType = v13;

  if (!v14)
  {
    id v58 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutoFilterEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v58];
    id v14 = v58;
    payloadAutoFilterEnabled = self->_payloadAutoFilterEnabled;
    self->_payloadAutoFilterEnabled = v16;

    if (!v14)
    {
      id v57 = 0;
      id v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"PermittedURLs" validator:&__block_literal_global_39 isRequired:0 defaultValue:0 error:&v57];
      id v14 = v57;
      payloadPermittedURLs = self->_payloadPermittedURLs;
      self->_payloadPermittedURLs = v18;

      if (!v14)
      {
        id v56 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"BlacklistedURLs" validator:&__block_literal_global_70 isRequired:0 defaultValue:0 error:&v56];
        id v14 = v56;
        payloadBlacklistedURLs = self->_payloadBlacklistedURLs;
        self->_payloadBlacklistedURLs = v20;

        if (!v14)
        {
          id v55 = 0;
          id v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"WhitelistedBookmarks" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v55];
          id v14 = v55;
          payloadWhitelistedBookmarks = self->_payloadWhitelistedBookmarks;
          self->_payloadWhitelistedBookmarks = v22;

          if (!v14)
          {
            id v54 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserDefinedName" isRequired:0 defaultValue:0 error:&v54];
            id v14 = v54;
            payloadUserDefinedName = self->_payloadUserDefinedName;
            self->_payloadUserDefinedName = v24;

            if (!v14)
            {
              id v53 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PluginBundleID" isRequired:0 defaultValue:0 error:&v53];
              id v14 = v53;
              payloadPluginBundleID = self->_payloadPluginBundleID;
              self->_payloadPluginBundleID = v26;

              if (!v14)
              {
                id v52 = 0;
                v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerAddress" isRequired:0 defaultValue:0 error:&v52];
                id v14 = v52;
                payloadServerAddress = self->_payloadServerAddress;
                self->_payloadServerAddress = v28;

                if (!v14)
                {
                  id v51 = 0;
                  v30 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserName" isRequired:0 defaultValue:0 error:&v51];
                  id v14 = v51;
                  payloadUserName = self->_payloadUserName;
                  self->_payloadUserName = v30;

                  if (!v14)
                  {
                    id v50 = 0;
                    id v32 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v50];
                    id v14 = v50;
                    payloadPassword = self->_payloadPassword;
                    self->_payloadPassword = v32;

                    if (!v14)
                    {
                      id v49 = 0;
                      v34 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Certificate" isRequired:0 defaultValue:0 error:&v49];
                      id v14 = v49;
                      payloadCertificate = self->_payloadCertificate;
                      self->_payloadCertificate = v34;

                      if (!v14)
                      {
                        id v48 = 0;
                        v36 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Organization" isRequired:0 defaultValue:0 error:&v48];
                        id v14 = v48;
                        payloadOrganization = self->_payloadOrganization;
                        self->_payloadOrganization = v36;

                        if (!v14)
                        {
                          id v47 = 0;
                          v38 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"VendorConfig" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v47];
                          id v14 = v47;
                          payloadVendorConfig = self->_payloadVendorConfig;
                          self->_payloadVendorConfig = v38;

                          if (!v14)
                          {
                            id v46 = 0;
                            id v40 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"FilterBrowsers" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v46];
                            id v14 = v46;
                            payloadFilterBrowsers = self->_payloadFilterBrowsers;
                            self->_payloadFilterBrowsers = v40;

                            if (!v14)
                            {
                              id v45 = 0;
                              id v42 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"FilterSockets" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v45];
                              id v14 = v45;
                              payloadFilterSockets = self->_payloadFilterSockets;
                              self->_payloadFilterSockets = v42;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
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

uint64_t __58__CEMSystemWebContentFilterDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMSystemWebContentFilterDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"FilterType" withValue:self->_payloadFilterType isRequired:0 defaultValue:@"BuiltIn"];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AutoFilterEnabled" withValue:self->_payloadAutoFilterEnabled isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"PermittedURLs" withValue:self->_payloadPermittedURLs itemSerializer:&__block_literal_global_76 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"BlacklistedURLs" withValue:self->_payloadBlacklistedURLs itemSerializer:&__block_literal_global_78_0 isRequired:0 defaultValue:0];
  payloadWhitelistedBookmarks = self->_payloadWhitelistedBookmarks;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v16 = &unk_2642C9D40;
  id v7 = v4;
  id v17 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"WhitelistedBookmarks" withValue:payloadWhitelistedBookmarks itemSerializer:&v13 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"UserDefinedName" withValue:self->_payloadUserDefinedName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"PluginBundleID" withValue:self->_payloadPluginBundleID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ServerAddress" withValue:self->_payloadServerAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"UserName" withValue:self->_payloadUserName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  payloadCertificate = self->_payloadCertificate;
  if (payloadCertificate)
  {
    v9 = [v7 objectForKeyedSubscript:self->_payloadCertificate];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"Certificate", payloadCertificate, v9, &stru_26C838878, v13, v14, v15, v16 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"Certificate", 0, 0, &stru_26C838878, v13, v14, v15, v16 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Organization" withValue:self->_payloadOrganization isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"VendorConfig" withValue:self->_payloadVendorConfig dictSerializer:&__block_literal_global_85 isRequired:0 defaultValue:0];
  uint64_t v10 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"FilterBrowsers" withValue:self->_payloadFilterBrowsers isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"FilterSockets" withValue:self->_payloadFilterSockets isRequired:0 defaultValue:v10];
  v11 = (void *)[v5 copy];

  return v11;
}

id __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v36.receiver = self;
  v36.super_class = (Class)CEMSystemWebContentFilterDeclaration;
  id v4 = [(CEMDeclarationBase *)&v36 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadFilterType copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAutoFilterEnabled copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadPermittedURLs copy];
  uint64_t v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadBlacklistedURLs copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadWhitelistedBookmarks copy];
  uint64_t v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadUserDefinedName copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadPluginBundleID copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSString *)self->_payloadServerAddress copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSString *)self->_payloadUserName copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSString *)self->_payloadPassword copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSString *)self->_payloadCertificate copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSString *)self->_payloadOrganization copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(CEMAnyPayload *)self->_payloadVendorConfig copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadFilterBrowsers copy];
  id v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadFilterSockets copy];
  v34 = (void *)v4[23];
  v4[23] = v33;

  return v4;
}

- (NSString)payloadFilterType
{
  return self->_payloadFilterType;
}

- (void)setPayloadFilterType:(id)a3
{
}

- (NSNumber)payloadAutoFilterEnabled
{
  return self->_payloadAutoFilterEnabled;
}

- (void)setPayloadAutoFilterEnabled:(id)a3
{
}

- (NSArray)payloadPermittedURLs
{
  return self->_payloadPermittedURLs;
}

- (void)setPayloadPermittedURLs:(id)a3
{
}

- (NSArray)payloadBlacklistedURLs
{
  return self->_payloadBlacklistedURLs;
}

- (void)setPayloadBlacklistedURLs:(id)a3
{
}

- (NSArray)payloadWhitelistedBookmarks
{
  return self->_payloadWhitelistedBookmarks;
}

- (void)setPayloadWhitelistedBookmarks:(id)a3
{
}

- (NSString)payloadUserDefinedName
{
  return self->_payloadUserDefinedName;
}

- (void)setPayloadUserDefinedName:(id)a3
{
}

- (NSString)payloadPluginBundleID
{
  return self->_payloadPluginBundleID;
}

- (void)setPayloadPluginBundleID:(id)a3
{
}

- (NSString)payloadServerAddress
{
  return self->_payloadServerAddress;
}

- (void)setPayloadServerAddress:(id)a3
{
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSString)payloadCertificate
{
  return self->_payloadCertificate;
}

- (void)setPayloadCertificate:(id)a3
{
}

- (NSString)payloadOrganization
{
  return self->_payloadOrganization;
}

- (void)setPayloadOrganization:(id)a3
{
}

- (CEMAnyPayload)payloadVendorConfig
{
  return self->_payloadVendorConfig;
}

- (void)setPayloadVendorConfig:(id)a3
{
}

- (NSNumber)payloadFilterBrowsers
{
  return self->_payloadFilterBrowsers;
}

- (void)setPayloadFilterBrowsers:(id)a3
{
}

- (NSNumber)payloadFilterSockets
{
  return self->_payloadFilterSockets;
}

- (void)setPayloadFilterSockets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFilterSockets, 0);
  objc_storeStrong((id *)&self->_payloadFilterBrowsers, 0);
  objc_storeStrong((id *)&self->_payloadVendorConfig, 0);
  objc_storeStrong((id *)&self->_payloadOrganization, 0);
  objc_storeStrong((id *)&self->_payloadCertificate, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);
  objc_storeStrong((id *)&self->_payloadServerAddress, 0);
  objc_storeStrong((id *)&self->_payloadPluginBundleID, 0);
  objc_storeStrong((id *)&self->_payloadUserDefinedName, 0);
  objc_storeStrong((id *)&self->_payloadWhitelistedBookmarks, 0);
  objc_storeStrong((id *)&self->_payloadBlacklistedURLs, 0);
  objc_storeStrong((id *)&self->_payloadPermittedURLs, 0);
  objc_storeStrong((id *)&self->_payloadAutoFilterEnabled, 0);

  objc_storeStrong((id *)&self->_payloadFilterType, 0);
}

@end