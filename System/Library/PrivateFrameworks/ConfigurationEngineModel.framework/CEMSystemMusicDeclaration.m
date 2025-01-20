@interface CEMSystemMusicDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7 withAllowSharedLibraries:(id)a8;
+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7 withAllowSharedLibraries:(id)a8 withAllowSpeakerVolumeLimitModification:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowMusicArtistActivity;
- (NSNumber)payloadAllowMusicService;
- (NSNumber)payloadAllowMusicVideos;
- (NSNumber)payloadAllowRadioService;
- (NSNumber)payloadAllowSharedLibraries;
- (NSNumber)payloadAllowSpeakerVolumeLimitModification;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowMusicArtistActivity:(id)a3;
- (void)setPayloadAllowMusicService:(id)a3;
- (void)setPayloadAllowMusicVideos:(id)a3;
- (void)setPayloadAllowRadioService:(id)a3;
- (void)setPayloadAllowSharedLibraries:(id)a3;
- (void)setPayloadAllowSpeakerVolumeLimitModification:(id)a3;
@end

@implementation CEMSystemMusicDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.music";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowMusicService";
  v6[1] = @"allowRadioService";
  v6[2] = @"allowMusicArtistActivity";
  v6[3] = @"allowMusicVideos";
  v6[4] = @"allowSharedMediaLibraries";
  v6[5] = @"allowSpeakerVolumeLimitModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowMusicService";
  v6[1] = @"allowRadioService";
  v6[2] = @"allowMusicArtistActivity";
  v6[3] = @"allowMusicVideos";
  v6[4] = @"allowSharedMediaLibraries";
  v6[5] = @"allowSpeakerVolumeLimitModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
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

+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7 withAllowSharedLibraries:(id)a8 withAllowSpeakerVolumeLimitModification:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.system.music"];
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
  v24 = (void *)MEMORY[0x263EFFA88];
  if (v20) {
    id v25 = v20;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA88];
  }
  [v21 setPayloadAllowMusicService:v25];

  if (v19) {
    id v26 = v19;
  }
  else {
    id v26 = v24;
  }
  [v21 setPayloadAllowRadioService:v26];

  if (v18) {
    id v27 = v18;
  }
  else {
    id v27 = v24;
  }
  [v21 setPayloadAllowMusicArtistActivity:v27];

  if (v17) {
    id v28 = v17;
  }
  else {
    id v28 = v24;
  }
  [v21 setPayloadAllowMusicVideos:v28];

  if (v16) {
    id v29 = v16;
  }
  else {
    id v29 = v24;
  }
  [v21 setPayloadAllowSharedLibraries:v29];

  if (v15) {
    id v30 = v15;
  }
  else {
    id v30 = v24;
  }
  [v21 setPayloadAllowSpeakerVolumeLimitModification:v30];

  [v21 updateServerHash];

  return v21;
}

+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7 withAllowSharedLibraries:(id)a8
{
  return (id)[a1 buildWithIdentifier:a3 withAllowMusicService:a4 withAllowRadioService:a5 withAllowMusicArtistActivity:a6 withAllowMusicVideos:a7 withAllowSharedLibraries:a8 withAllowSpeakerVolumeLimitModification:0];
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.music"];
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

+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7
{
  return +[CEMSystemMusicDeclaration buildWithIdentifier:a3 withAllowMusicService:a4 withAllowRadioService:a5 withAllowMusicArtistActivity:a6 withAllowMusicVideos:a7 withAllowSharedLibraries:MEMORY[0x263EFFA88]];
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemMusicDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMusicService" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v32];
  id v14 = v32;
  payloadAllowMusicService = self->_payloadAllowMusicService;
  self->_payloadAllowMusicService = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowRadioService" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
    id v14 = v31;
    payloadAllowRadioService = self->_payloadAllowRadioService;
    self->_payloadAllowRadioService = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMusicArtistActivity" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v30];
      id v14 = v30;
      payloadAllowMusicArtistActivity = self->_payloadAllowMusicArtistActivity;
      self->_payloadAllowMusicArtistActivity = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMusicVideos" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
        id v14 = v29;
        payloadAllowMusicVideos = self->_payloadAllowMusicVideos;
        self->_payloadAllowMusicVideos = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSharedMediaLibraries" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v28];
          id v14 = v28;
          payloadAllowSharedLibraries = self->_payloadAllowSharedLibraries;
          self->_payloadAllowSharedLibraries = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSpeakerVolumeLimitModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v27];
            id v14 = v27;
            payloadAllowSpeakerVolumeLimitModification = self->_payloadAllowSpeakerVolumeLimitModification;
            self->_payloadAllowSpeakerVolumeLimitModification = v24;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMusicService" withValue:self->_payloadAllowMusicService isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowRadioService" withValue:self->_payloadAllowRadioService isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMusicArtistActivity" withValue:self->_payloadAllowMusicArtistActivity isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMusicVideos" withValue:self->_payloadAllowMusicVideos isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSharedMediaLibraries" withValue:self->_payloadAllowSharedLibraries isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSpeakerVolumeLimitModification" withValue:self->_payloadAllowSpeakerVolumeLimitModification isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMSystemMusicDeclaration;
  v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowMusicService copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowRadioService copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowMusicArtistActivity copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowMusicVideos copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowSharedLibraries copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowSpeakerVolumeLimitModification copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadAllowMusicService
{
  return self->_payloadAllowMusicService;
}

- (void)setPayloadAllowMusicService:(id)a3
{
}

- (NSNumber)payloadAllowRadioService
{
  return self->_payloadAllowRadioService;
}

- (void)setPayloadAllowRadioService:(id)a3
{
}

- (NSNumber)payloadAllowMusicArtistActivity
{
  return self->_payloadAllowMusicArtistActivity;
}

- (void)setPayloadAllowMusicArtistActivity:(id)a3
{
}

- (NSNumber)payloadAllowMusicVideos
{
  return self->_payloadAllowMusicVideos;
}

- (void)setPayloadAllowMusicVideos:(id)a3
{
}

- (NSNumber)payloadAllowSharedLibraries
{
  return self->_payloadAllowSharedLibraries;
}

- (void)setPayloadAllowSharedLibraries:(id)a3
{
}

- (NSNumber)payloadAllowSpeakerVolumeLimitModification
{
  return self->_payloadAllowSpeakerVolumeLimitModification;
}

- (void)setPayloadAllowSpeakerVolumeLimitModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowSpeakerVolumeLimitModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowSharedLibraries, 0);
  objc_storeStrong((id *)&self->_payloadAllowMusicVideos, 0);
  objc_storeStrong((id *)&self->_payloadAllowMusicArtistActivity, 0);
  objc_storeStrong((id *)&self->_payloadAllowRadioService, 0);

  objc_storeStrong((id *)&self->_payloadAllowMusicService, 0);
}

@end