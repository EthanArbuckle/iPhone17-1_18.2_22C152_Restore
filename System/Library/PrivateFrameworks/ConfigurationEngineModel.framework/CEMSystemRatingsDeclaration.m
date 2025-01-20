@interface CEMSystemRatingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withRatingRegion:(id)a4 withRatingApps:(id)a5 withRatingMovies:(id)a6 withRatingTVShows:(id)a7 withAllowExplicitContent:(id)a8 withAllowShowingUndownloadedTV:(id)a9 withAllowShowingUndownloadedMovies:(id)a10;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowExplicitContent;
- (NSNumber)payloadAllowShowingUndownloadedMovies;
- (NSNumber)payloadAllowShowingUndownloadedTV;
- (NSNumber)payloadRatingApps;
- (NSNumber)payloadRatingMovies;
- (NSNumber)payloadRatingTVShows;
- (NSString)payloadRatingRegion;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowExplicitContent:(id)a3;
- (void)setPayloadAllowShowingUndownloadedMovies:(id)a3;
- (void)setPayloadAllowShowingUndownloadedTV:(id)a3;
- (void)setPayloadRatingApps:(id)a3;
- (void)setPayloadRatingMovies:(id)a3;
- (void)setPayloadRatingRegion:(id)a3;
- (void)setPayloadRatingTVShows:(id)a3;
@end

@implementation CEMSystemRatingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.ratings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ratingRegion";
  v6[1] = @"ratingApps";
  v6[2] = @"ratingMovies";
  v6[3] = @"ratingTVShows";
  v6[4] = @"allowExplicitContent";
  v6[5] = @"allowShowingUndownloadedTV";
  v6[6] = @"allowShowingUndownloadedMovies";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ratingRegion";
  v6[1] = @"ratingApps";
  v6[2] = @"ratingMovies";
  v6[3] = @"ratingTVShows";
  v6[4] = @"allowExplicitContent";
  v6[5] = @"allowShowingUndownloadedTV";
  v6[6] = @"allowShowingUndownloadedMovies";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
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

+ (id)buildWithIdentifier:(id)a3 withRatingRegion:(id)a4 withRatingApps:(id)a5 withRatingMovies:(id)a6 withRatingTVShows:(id)a7 withAllowExplicitContent:(id)a8 withAllowShowingUndownloadedTV:(id)a9 withAllowShowingUndownloadedMovies:(id)a10
{
  id v15 = a3;
  id v33 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  [v22 setDeclarationType:@"com.apple.configuration.system.ratings"];
  if (v15)
  {
    [v22 setDeclarationIdentifier:v15];
  }
  else
  {
    v23 = [MEMORY[0x263F08C38] UUID];
    v24 = [v23 UUIDString];
    [v22 setDeclarationIdentifier:v24];
  }
  [v22 setPayloadRatingRegion:v21];

  if (v20) {
    v25 = v20;
  }
  else {
    v25 = &unk_26C8949A0;
  }
  [v22 setPayloadRatingApps:v25];

  if (v19) {
    v26 = v19;
  }
  else {
    v26 = &unk_26C8949A0;
  }
  [v22 setPayloadRatingMovies:v26];

  if (v18) {
    v27 = v18;
  }
  else {
    v27 = &unk_26C8949A0;
  }
  [v22 setPayloadRatingTVShows:v27];

  v28 = (void *)MEMORY[0x263EFFA88];
  if (v17) {
    id v29 = v17;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA88];
  }
  [v22 setPayloadAllowExplicitContent:v29];

  if (v16) {
    id v30 = v16;
  }
  else {
    id v30 = v28;
  }
  [v22 setPayloadAllowShowingUndownloadedTV:v30];

  if (v33) {
    id v31 = v33;
  }
  else {
    id v31 = v28;
  }
  [v22 setPayloadAllowShowingUndownloadedMovies:v31];

  [v22 updateServerHash];

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.ratings"];
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

  v10 = +[CEMSystemRatingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v35 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ratingRegion" isRequired:0 defaultValue:0 error:&v35];
  id v14 = v35;
  payloadRatingRegion = self->_payloadRatingRegion;
  self->_payloadRatingRegion = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ratingApps" isRequired:0 defaultValue:&unk_26C8949A0 error:&v34];
    id v14 = v34;
    payloadRatingApps = self->_payloadRatingApps;
    self->_payloadRatingApps = v16;

    if (!v14)
    {
      id v33 = 0;
      id v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ratingMovies" isRequired:0 defaultValue:&unk_26C8949A0 error:&v33];
      id v14 = v33;
      payloadRatingMovies = self->_payloadRatingMovies;
      self->_payloadRatingMovies = v18;

      if (!v14)
      {
        id v32 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ratingTVShows" isRequired:0 defaultValue:&unk_26C8949A0 error:&v32];
        id v14 = v32;
        payloadRatingTVShows = self->_payloadRatingTVShows;
        self->_payloadRatingTVShows = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowExplicitContent" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
          id v14 = v31;
          payloadAllowExplicitContent = self->_payloadAllowExplicitContent;
          self->_payloadAllowExplicitContent = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowShowingUndownloadedTV" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v30];
            id v14 = v30;
            payloadAllowShowingUndownloadedTV = self->_payloadAllowShowingUndownloadedTV;
            self->_payloadAllowShowingUndownloadedTV = v24;

            if (!v14)
            {
              id v29 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowShowingUndownloadedMovies" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
              id v14 = v29;
              payloadAllowShowingUndownloadedMovies = self->_payloadAllowShowingUndownloadedMovies;
              self->_payloadAllowShowingUndownloadedMovies = v26;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ratingRegion" withValue:self->_payloadRatingRegion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ratingApps" withValue:self->_payloadRatingApps isRequired:0 defaultValue:&unk_26C8949A0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ratingMovies" withValue:self->_payloadRatingMovies isRequired:0 defaultValue:&unk_26C8949A0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ratingTVShows" withValue:self->_payloadRatingTVShows isRequired:0 defaultValue:&unk_26C8949A0];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowExplicitContent" withValue:self->_payloadAllowExplicitContent isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowShowingUndownloadedTV" withValue:self->_payloadAllowShowingUndownloadedTV isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowShowingUndownloadedMovies" withValue:self->_payloadAllowShowingUndownloadedMovies isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMSystemRatingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRatingRegion copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadRatingApps copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadRatingMovies copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadRatingTVShows copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowExplicitContent copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowShowingUndownloadedTV copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowShowingUndownloadedMovies copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSString)payloadRatingRegion
{
  return self->_payloadRatingRegion;
}

- (void)setPayloadRatingRegion:(id)a3
{
}

- (NSNumber)payloadRatingApps
{
  return self->_payloadRatingApps;
}

- (void)setPayloadRatingApps:(id)a3
{
}

- (NSNumber)payloadRatingMovies
{
  return self->_payloadRatingMovies;
}

- (void)setPayloadRatingMovies:(id)a3
{
}

- (NSNumber)payloadRatingTVShows
{
  return self->_payloadRatingTVShows;
}

- (void)setPayloadRatingTVShows:(id)a3
{
}

- (NSNumber)payloadAllowExplicitContent
{
  return self->_payloadAllowExplicitContent;
}

- (void)setPayloadAllowExplicitContent:(id)a3
{
}

- (NSNumber)payloadAllowShowingUndownloadedTV
{
  return self->_payloadAllowShowingUndownloadedTV;
}

- (void)setPayloadAllowShowingUndownloadedTV:(id)a3
{
}

- (NSNumber)payloadAllowShowingUndownloadedMovies
{
  return self->_payloadAllowShowingUndownloadedMovies;
}

- (void)setPayloadAllowShowingUndownloadedMovies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowShowingUndownloadedMovies, 0);
  objc_storeStrong((id *)&self->_payloadAllowShowingUndownloadedTV, 0);
  objc_storeStrong((id *)&self->_payloadAllowExplicitContent, 0);
  objc_storeStrong((id *)&self->_payloadRatingTVShows, 0);
  objc_storeStrong((id *)&self->_payloadRatingMovies, 0);
  objc_storeStrong((id *)&self->_payloadRatingApps, 0);

  objc_storeStrong((id *)&self->_payloadRatingRegion, 0);
}

@end