@interface CEMLegacyRestrictionsAppsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowCopresence:(id)a11;
+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowGroupActivity:(id)a11;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadBlacklistedAppBundleIDs;
- (NSNumber)payloadAllowChat;
- (NSNumber)payloadAllowGroupActivity;
- (NSNumber)payloadAllowNews;
- (NSNumber)payloadAllowPodcasts;
- (NSNumber)payloadAllowSafari;
- (NSNumber)payloadAllowVideoConferencing;
- (NSNumber)payloadAllowiTunes;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowChat:(id)a3;
- (void)setPayloadAllowGroupActivity:(id)a3;
- (void)setPayloadAllowNews:(id)a3;
- (void)setPayloadAllowPodcasts:(id)a3;
- (void)setPayloadAllowSafari:(id)a3;
- (void)setPayloadAllowVideoConferencing:(id)a3;
- (void)setPayloadAllowiTunes:(id)a3;
- (void)setPayloadBlacklistedAppBundleIDs:(id)a3;
@end

@implementation CEMLegacyRestrictionsAppsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.legacy.restrictions.apps";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowChat";
  v6[1] = @"allowiTunes";
  v6[2] = @"allowNews";
  v6[3] = @"allowPodcasts";
  v6[4] = @"allowSafari";
  v6[5] = @"allowVideoConferencing";
  v6[6] = @"blacklistedAppBundleIDs";
  v6[7] = @"allowGroupActivity";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowChat";
  v6[1] = @"allowiTunes";
  v6[2] = @"allowNews";
  v6[3] = @"allowPodcasts";
  v6[4] = @"allowSafari";
  v6[5] = @"allowVideoConferencing";
  v6[6] = @"blacklistedAppBundleIDs";
  v6[7] = @"allowGroupActivity";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return v4;
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
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowGroupActivity:(id)a11
{
  id v16 = a3;
  id v38 = a11;
  id v17 = a10;
  v18 = v16;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.legacy.restrictions.apps"];
  if (v18)
  {
    [v25 setDeclarationIdentifier:v18];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    v18 = 0;
  }
  v28 = (void *)MEMORY[0x263EFFA88];
  if (v24) {
    id v29 = v24;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA88];
  }
  [v25 setPayloadAllowChat:v29];

  if (v23) {
    id v30 = v23;
  }
  else {
    id v30 = v28;
  }
  [v25 setPayloadAllowiTunes:v30];

  if (v22) {
    id v31 = v22;
  }
  else {
    id v31 = v28;
  }
  [v25 setPayloadAllowNews:v31];

  if (v21) {
    id v32 = v21;
  }
  else {
    id v32 = v28;
  }
  [v25 setPayloadAllowPodcasts:v32];

  if (v20) {
    id v33 = v20;
  }
  else {
    id v33 = v28;
  }
  [v25 setPayloadAllowSafari:v33];

  if (v19) {
    id v34 = v19;
  }
  else {
    id v34 = v28;
  }
  [v25 setPayloadAllowVideoConferencing:v34];

  if (v17) {
    id v35 = v17;
  }
  else {
    id v35 = (id)MEMORY[0x263EFFA68];
  }
  [v25 setPayloadBlacklistedAppBundleIDs:v35];

  if (v38) {
    id v36 = v38;
  }
  else {
    id v36 = v28;
  }
  [v25 setPayloadAllowGroupActivity:v36];

  [v25 updateServerHash];

  return v25;
}

+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowCopresence:(id)a11
{
  return (id)objc_msgSend(a1, "buildWithIdentifier:withAllowChat:withAllowiTunes:withAllowNews:withAllowPodcasts:withAllowSafari:withAllowVideoConferencing:withBlacklistedAppBundleIDs:withAllowGroupActivity:", a3, a4, a5, a6, a7, a8);
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.legacy.restrictions.apps"];
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

  v10 = +[CEMLegacyRestrictionsAppsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v38 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowChat" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v38];
  id v14 = v38;
  payloadAllowChat = self->_payloadAllowChat;
  self->_payloadAllowChat = v13;

  if (!v14)
  {
    id v37 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowiTunes" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v37];
    id v14 = v37;
    payloadAllowiTunes = self->_payloadAllowiTunes;
    self->_payloadAllowiTunes = v16;

    if (!v14)
    {
      id v36 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowNews" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v36];
      id v14 = v36;
      payloadAllowNews = self->_payloadAllowNews;
      self->_payloadAllowNews = v18;

      if (!v14)
      {
        id v35 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowPodcasts" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v35];
        id v14 = v35;
        payloadAllowPodcasts = self->_payloadAllowPodcasts;
        self->_payloadAllowPodcasts = v20;

        if (!v14)
        {
          id v34 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSafari" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v34];
          id v14 = v34;
          payloadAllowSafari = self->_payloadAllowSafari;
          self->_payloadAllowSafari = v22;

          if (!v14)
          {
            id v33 = 0;
            id v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowVideoConferencing" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v33];
            id v14 = v33;
            payloadAllowVideoConferencing = self->_payloadAllowVideoConferencing;
            self->_payloadAllowVideoConferencing = v24;

            if (!v14)
            {
              id v32 = 0;
              v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"blacklistedAppBundleIDs" validator:&__block_literal_global_15 isRequired:0 defaultValue:0 error:&v32];
              id v14 = v32;
              payloadBlacklistedAppBundleIDs = self->_payloadBlacklistedAppBundleIDs;
              self->_payloadBlacklistedAppBundleIDs = v26;

              if (!v14)
              {
                id v31 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGroupActivity" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
                id v14 = v31;
                payloadAllowGroupActivity = self->_payloadAllowGroupActivity;
                self->_payloadAllowGroupActivity = v28;
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

uint64_t __58__CEMLegacyRestrictionsAppsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowChat" withValue:self->_payloadAllowChat isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowiTunes" withValue:self->_payloadAllowiTunes isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowNews" withValue:self->_payloadAllowNews isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowPodcasts" withValue:self->_payloadAllowPodcasts isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSafari" withValue:self->_payloadAllowSafari isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowVideoConferencing" withValue:self->_payloadAllowVideoConferencing isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"blacklistedAppBundleIDs" withValue:self->_payloadBlacklistedAppBundleIDs itemSerializer:&__block_literal_global_40 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGroupActivity" withValue:self->_payloadAllowGroupActivity isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

id __75__CEMLegacyRestrictionsAppsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CEMLegacyRestrictionsAppsDeclaration;
  v4 = [(CEMDeclarationBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowChat copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowiTunes copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowNews copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowPodcasts copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowSafari copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowVideoConferencing copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadBlacklistedAppBundleIDs copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowGroupActivity copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (NSNumber)payloadAllowChat
{
  return self->_payloadAllowChat;
}

- (void)setPayloadAllowChat:(id)a3
{
}

- (NSNumber)payloadAllowiTunes
{
  return self->_payloadAllowiTunes;
}

- (void)setPayloadAllowiTunes:(id)a3
{
}

- (NSNumber)payloadAllowNews
{
  return self->_payloadAllowNews;
}

- (void)setPayloadAllowNews:(id)a3
{
}

- (NSNumber)payloadAllowPodcasts
{
  return self->_payloadAllowPodcasts;
}

- (void)setPayloadAllowPodcasts:(id)a3
{
}

- (NSNumber)payloadAllowSafari
{
  return self->_payloadAllowSafari;
}

- (void)setPayloadAllowSafari:(id)a3
{
}

- (NSNumber)payloadAllowVideoConferencing
{
  return self->_payloadAllowVideoConferencing;
}

- (void)setPayloadAllowVideoConferencing:(id)a3
{
}

- (NSArray)payloadBlacklistedAppBundleIDs
{
  return self->_payloadBlacklistedAppBundleIDs;
}

- (void)setPayloadBlacklistedAppBundleIDs:(id)a3
{
}

- (NSNumber)payloadAllowGroupActivity
{
  return self->_payloadAllowGroupActivity;
}

- (void)setPayloadAllowGroupActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowGroupActivity, 0);
  objc_storeStrong((id *)&self->_payloadBlacklistedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_payloadAllowVideoConferencing, 0);
  objc_storeStrong((id *)&self->_payloadAllowSafari, 0);
  objc_storeStrong((id *)&self->_payloadAllowPodcasts, 0);
  objc_storeStrong((id *)&self->_payloadAllowNews, 0);
  objc_storeStrong((id *)&self->_payloadAllowiTunes, 0);

  objc_storeStrong((id *)&self->_payloadAllowChat, 0);
}

@end