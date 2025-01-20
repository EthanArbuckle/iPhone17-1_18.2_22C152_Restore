@interface CEMApplicationStoreDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11;
+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketPlaceAppInstallation:(id)a12;
+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketplaceAppInstallation:(id)a12 withAllowWebDistributionAppInstallation:(id)a13;
+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowUIAppInstallation:(id)a5 withAllowAutomaticAppDownloads:(id)a6 withAllowSystemAppRemoval:(id)a7 withAllowAppRemoval:(id)a8 withAllowInAppPurchases:(id)a9 withForceITunesStorePasswordEntry:(id)a10;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAppClips;
- (NSNumber)payloadAllowAppInstallation;
- (NSNumber)payloadAllowAppRemoval;
- (NSNumber)payloadAllowAutomaticAppDownloads;
- (NSNumber)payloadAllowInAppPurchases;
- (NSNumber)payloadAllowMarketplaceAppInstallation;
- (NSNumber)payloadAllowSystemAppRemoval;
- (NSNumber)payloadAllowUIAppInstallation;
- (NSNumber)payloadAllowWebDistributionAppInstallation;
- (NSNumber)payloadForceITunesStorePasswordEntry;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAppClips:(id)a3;
- (void)setPayloadAllowAppInstallation:(id)a3;
- (void)setPayloadAllowAppRemoval:(id)a3;
- (void)setPayloadAllowAutomaticAppDownloads:(id)a3;
- (void)setPayloadAllowInAppPurchases:(id)a3;
- (void)setPayloadAllowMarketplaceAppInstallation:(id)a3;
- (void)setPayloadAllowSystemAppRemoval:(id)a3;
- (void)setPayloadAllowUIAppInstallation:(id)a3;
- (void)setPayloadAllowWebDistributionAppInstallation:(id)a3;
- (void)setPayloadForceITunesStorePasswordEntry:(id)a3;
@end

@implementation CEMApplicationStoreDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.store";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAppInstallation";
  v6[1] = @"allowAppClips";
  v6[2] = @"allowUIAppInstallation";
  v6[3] = @"allowAutomaticAppDownloads";
  v6[4] = @"allowSystemAppRemoval";
  v6[5] = @"allowAppRemoval";
  v6[6] = @"allowInAppPurchases";
  v6[7] = @"forceITunesStorePasswordEntry";
  v6[8] = @"allowMarketplaceAppInstallation";
  v6[9] = @"allowWebDistributionAppInstallation";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAppInstallation";
  v6[1] = @"allowAppClips";
  v6[2] = @"allowUIAppInstallation";
  v6[3] = @"allowAutomaticAppDownloads";
  v6[4] = @"allowSystemAppRemoval";
  v6[5] = @"allowAppRemoval";
  v6[6] = @"allowInAppPurchases";
  v6[7] = @"forceITunesStorePasswordEntry";
  v6[8] = @"allowMarketplaceAppInstallation";
  v6[9] = @"allowWebDistributionAppInstallation";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return v4;
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketplaceAppInstallation:(id)a12 withAllowWebDistributionAppInstallation:(id)a13
{
  id v16 = a3;
  id v43 = a13;
  id v42 = a12;
  id v41 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.application.store"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  v27 = (void *)MEMORY[0x263EFFA88];
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadAllowAppInstallation:v28];

  if (v22) {
    id v29 = v22;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadAllowAppClips:v29];

  if (v21) {
    id v30 = v21;
  }
  else {
    id v30 = v27;
  }
  [v24 setPayloadAllowUIAppInstallation:v30];

  if (v20) {
    id v31 = v20;
  }
  else {
    id v31 = v27;
  }
  [v24 setPayloadAllowAutomaticAppDownloads:v31];

  if (v19) {
    id v32 = v19;
  }
  else {
    id v32 = v27;
  }
  [v24 setPayloadAllowSystemAppRemoval:v32];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v27;
  }
  [v24 setPayloadAllowAppRemoval:v33];

  if (v17) {
    id v34 = v17;
  }
  else {
    id v34 = v27;
  }
  [v24 setPayloadAllowInAppPurchases:v34];

  if (v41) {
    id v35 = v41;
  }
  else {
    id v35 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setPayloadForceITunesStorePasswordEntry:v35];

  if (v42) {
    id v36 = v42;
  }
  else {
    id v36 = v27;
  }
  [v24 setPayloadAllowMarketplaceAppInstallation:v36];

  if (v43) {
    id v37 = v43;
  }
  else {
    id v37 = v27;
  }
  [v24 setPayloadAllowWebDistributionAppInstallation:v37];

  [v24 updateServerHash];

  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketPlaceAppInstallation:(id)a12
{
  return (id)[a1 buildWithIdentifier:a3 withAllowAppInstallation:a4 withAllowAppClips:a5 withAllowUIAppInstallation:a6 withAllowAutomaticAppDownloads:a7 withAllowSystemAppRemoval:a8 withAllowAppRemoval:a9 withAllowInAppPurchases:a10 withForceITunesStorePasswordEntry:a11 withAllowMarketplaceAppInstallation:a12 withAllowWebDistributionAppInstallation:0];
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11
{
  return (id)[a1 buildWithIdentifier:a3 withAllowAppInstallation:a4 withAllowAppClips:a5 withAllowUIAppInstallation:a6 withAllowAutomaticAppDownloads:a7 withAllowSystemAppRemoval:a8 withAllowAppRemoval:a9 withAllowInAppPurchases:a10 withForceITunesStorePasswordEntry:a11 withAllowMarketPlaceAppInstallation:0];
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowUIAppInstallation:(id)a5 withAllowAutomaticAppDownloads:(id)a6 withAllowSystemAppRemoval:(id)a7 withAllowAppRemoval:(id)a8 withAllowInAppPurchases:(id)a9 withForceITunesStorePasswordEntry:(id)a10
{
  return (id)[a1 buildWithIdentifier:a3 withAllowAppInstallation:a4 withAllowAppClips:0 withAllowUIAppInstallation:a5 withAllowAutomaticAppDownloads:a6 withAllowSystemAppRemoval:a7 withAllowAppRemoval:a8 withAllowInAppPurchases:a9 withForceITunesStorePasswordEntry:a10];
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.store"];
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

  v10 = +[CEMApplicationStoreDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v44 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAppInstallation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v44];
  id v14 = v44;
  payloadAllowAppInstallation = self->_payloadAllowAppInstallation;
  self->_payloadAllowAppInstallation = v13;

  if (!v14)
  {
    id v43 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAppClips" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v43];
    id v14 = v43;
    payloadAllowAppClips = self->_payloadAllowAppClips;
    self->_payloadAllowAppClips = v16;

    if (!v14)
    {
      id v42 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowUIAppInstallation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v42];
      id v14 = v42;
      payloadAllowUIAppInstallation = self->_payloadAllowUIAppInstallation;
      self->_payloadAllowUIAppInstallation = v18;

      if (!v14)
      {
        id v41 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAutomaticAppDownloads" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v41];
        id v14 = v41;
        payloadAllowAutomaticAppDownloads = self->_payloadAllowAutomaticAppDownloads;
        self->_payloadAllowAutomaticAppDownloads = v20;

        if (!v14)
        {
          id v40 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSystemAppRemoval" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v40];
          id v14 = v40;
          payloadAllowSystemAppRemoval = self->_payloadAllowSystemAppRemoval;
          self->_payloadAllowSystemAppRemoval = v22;

          if (!v14)
          {
            id v39 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAppRemoval" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v39];
            id v14 = v39;
            payloadAllowAppRemoval = self->_payloadAllowAppRemoval;
            self->_payloadAllowAppRemoval = v24;

            if (!v14)
            {
              id v38 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowInAppPurchases" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v38];
              id v14 = v38;
              payloadAllowInAppPurchases = self->_payloadAllowInAppPurchases;
              self->_payloadAllowInAppPurchases = v26;

              if (!v14)
              {
                id v37 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceITunesStorePasswordEntry" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v37];
                id v14 = v37;
                payloadForceITunesStorePasswordEntry = self->_payloadForceITunesStorePasswordEntry;
                self->_payloadForceITunesStorePasswordEntry = v28;

                if (!v14)
                {
                  id v36 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMarketplaceAppInstallation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v36];
                  id v14 = v36;
                  payloadAllowMarketplaceAppInstallation = self->_payloadAllowMarketplaceAppInstallation;
                  self->_payloadAllowMarketplaceAppInstallation = v30;

                  if (!v14)
                  {
                    id v35 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowWebDistributionAppInstallation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v35];
                    id v14 = v35;
                    payloadAllowWebDistributionAppInstallation = self->_payloadAllowWebDistributionAppInstallation;
                    self->_payloadAllowWebDistributionAppInstallation = v32;
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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAppInstallation" withValue:self->_payloadAllowAppInstallation isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAppClips" withValue:self->_payloadAllowAppClips isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowUIAppInstallation" withValue:self->_payloadAllowUIAppInstallation isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAutomaticAppDownloads" withValue:self->_payloadAllowAutomaticAppDownloads isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSystemAppRemoval" withValue:self->_payloadAllowSystemAppRemoval isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAppRemoval" withValue:self->_payloadAllowAppRemoval isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowInAppPurchases" withValue:self->_payloadAllowInAppPurchases isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceITunesStorePasswordEntry" withValue:self->_payloadForceITunesStorePasswordEntry isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMarketplaceAppInstallation" withValue:self->_payloadAllowMarketplaceAppInstallation isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowWebDistributionAppInstallation" withValue:self->_payloadAllowWebDistributionAppInstallation isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CEMApplicationStoreDeclaration;
  v4 = [(CEMDeclarationBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowAppInstallation copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowAppClips copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowUIAppInstallation copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowAutomaticAppDownloads copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowSystemAppRemoval copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowAppRemoval copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowInAppPurchases copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadForceITunesStorePasswordEntry copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowMarketplaceAppInstallation copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadAllowWebDistributionAppInstallation copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  return v4;
}

- (NSNumber)payloadAllowAppInstallation
{
  return self->_payloadAllowAppInstallation;
}

- (void)setPayloadAllowAppInstallation:(id)a3
{
}

- (NSNumber)payloadAllowAppClips
{
  return self->_payloadAllowAppClips;
}

- (void)setPayloadAllowAppClips:(id)a3
{
}

- (NSNumber)payloadAllowUIAppInstallation
{
  return self->_payloadAllowUIAppInstallation;
}

- (void)setPayloadAllowUIAppInstallation:(id)a3
{
}

- (NSNumber)payloadAllowAutomaticAppDownloads
{
  return self->_payloadAllowAutomaticAppDownloads;
}

- (void)setPayloadAllowAutomaticAppDownloads:(id)a3
{
}

- (NSNumber)payloadAllowSystemAppRemoval
{
  return self->_payloadAllowSystemAppRemoval;
}

- (void)setPayloadAllowSystemAppRemoval:(id)a3
{
}

- (NSNumber)payloadAllowAppRemoval
{
  return self->_payloadAllowAppRemoval;
}

- (void)setPayloadAllowAppRemoval:(id)a3
{
}

- (NSNumber)payloadAllowInAppPurchases
{
  return self->_payloadAllowInAppPurchases;
}

- (void)setPayloadAllowInAppPurchases:(id)a3
{
}

- (NSNumber)payloadForceITunesStorePasswordEntry
{
  return self->_payloadForceITunesStorePasswordEntry;
}

- (void)setPayloadForceITunesStorePasswordEntry:(id)a3
{
}

- (NSNumber)payloadAllowMarketplaceAppInstallation
{
  return self->_payloadAllowMarketplaceAppInstallation;
}

- (void)setPayloadAllowMarketplaceAppInstallation:(id)a3
{
}

- (NSNumber)payloadAllowWebDistributionAppInstallation
{
  return self->_payloadAllowWebDistributionAppInstallation;
}

- (void)setPayloadAllowWebDistributionAppInstallation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowWebDistributionAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadAllowMarketplaceAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadForceITunesStorePasswordEntry, 0);
  objc_storeStrong((id *)&self->_payloadAllowInAppPurchases, 0);
  objc_storeStrong((id *)&self->_payloadAllowAppRemoval, 0);
  objc_storeStrong((id *)&self->_payloadAllowSystemAppRemoval, 0);
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppDownloads, 0);
  objc_storeStrong((id *)&self->_payloadAllowUIAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadAllowAppClips, 0);

  objc_storeStrong((id *)&self->_payloadAllowAppInstallation, 0);
}

@end