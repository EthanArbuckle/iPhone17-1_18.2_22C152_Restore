@interface MPCPlaybackIntent
+ (id)continueListeningRadioPlaybackIntent;
+ (id)intentFromModelRequest:(id)a3;
+ (id)radioPlaybackIntentFromAlbum:(id)a3;
+ (id)radioPlaybackIntentFromArtist:(id)a3;
+ (id)radioPlaybackIntentFromReference:(id)a3;
+ (id)radioPlaybackIntentFromSong:(id)a3;
+ (id)radioPlaybackIntentWithStation:(id)a3;
+ (id)radioPlaybackIntentWithStationStringID:(id)a3;
+ (id)radioPlaybackIntentWithStationURL:(id)a3;
+ (id)sharedSessionIntentWithProperties:(id)a3 identity:(id)a4;
+ (id)tracklistDataSourceForSource:(int64_t)a3;
+ (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 extendedStatusCompletion:(id)a5;
- (BOOL)prefersEnqueuingUsingAirPlay;
- (MPCPlaybackIntent)init;
- (MPCPlaybackIntentDataSource)tracklistDataSource;
- (MPCPlaybackSharedListeningProperties)sharedListeningProperties;
- (NSData)delegateTokenB;
- (NSData)playActivityRecommendationData;
- (NSDictionary)endTimeModifications;
- (NSDictionary)startTimeModifications;
- (NSNumber)privateListeningOverride;
- (NSSecureCoding)tracklistToken;
- (NSString)playActivityFeatureName;
- (NSString)queueGroupingID;
- (NSString)siriAssetInfo;
- (NSString)siriReferenceIdentifier;
- (id)description;
- (int64_t)actionAfterQueueLoad;
- (int64_t)repeatMode;
- (int64_t)shuffleMode;
- (int64_t)tracklistSource;
- (void)getArchiveWithConfiguration:(id)a3 completion:(id)a4;
- (void)getRemotePlaybackQueueDataWithCompletion:(id)a3;
- (void)getRemotePlaybackQueueWithDestination:(int64_t)a3 completion:(id)a4;
- (void)getRepresentativeObjectWithProperties:(id)a3 completion:(id)a4;
- (void)setActionAfterQueueLoad:(int64_t)a3;
- (void)setDelegateTokenB:(id)a3;
- (void)setEndTimeModifications:(id)a3;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setPrefersEnqueuingUsingAirPlay:(BOOL)a3;
- (void)setPrivateListeningOverride:(id)a3;
- (void)setQueueGroupingID:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleMode:(int64_t)a3;
- (void)setSiriAssetInfo:(id)a3;
- (void)setSiriReferenceIdentifier:(id)a3;
- (void)setStartTimeModifications:(id)a3;
- (void)setTracklistSource:(int64_t)a3;
- (void)setTracklistToken:(id)a3;
@end

@implementation MPCPlaybackIntent

- (BOOL)prefersEnqueuingUsingAirPlay
{
  return self->_prefersEnqueuingUsingAirPlay;
}

- (NSSecureCoding)tracklistToken
{
  return self->_tracklistToken;
}

- (int64_t)tracklistSource
{
  return self->_tracklistSource;
}

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (void)setActionAfterQueueLoad:(int64_t)a3
{
  self->_actionAfterQueueLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracklistToken, 0);
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);

  objc_storeStrong((id *)&self->_resolvedTracklistDataSource, 0);
}

- (void)setTracklistSource:(int64_t)a3
{
  self->_tracklistSource = a3;
}

- (MPCPlaybackIntent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackIntent;
  v2 = [(MPCPlaybackIntent *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_shuffleMode = -1;
    v2->_repeatMode = -1;
    v2->_actionAfterQueueLoad = 20;
    startTimeModifications = v2->_startTimeModifications;
    v5 = (NSDictionary *)MEMORY[0x263EFFA78];
    v2->_startTimeModifications = (NSDictionary *)MEMORY[0x263EFFA78];

    endTimeModifications = v3->_endTimeModifications;
    v3->_endTimeModifications = v5;
  }
  return v3;
}

- (void)setTracklistToken:(id)a3
{
}

- (void)setPrefersEnqueuingUsingAirPlay:(BOOL)a3
{
  self->_prefersEnqueuingUsingAirPlay = a3;
}

- (void)setDelegateTokenB:(id)a3
{
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (void)setSiriReferenceIdentifier:(id)a3
{
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (void)setSiriAssetInfo:(id)a3
{
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setPlayActivityRecommendationData:(id)a3
{
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (void)setPlayActivityFeatureName:(id)a3
{
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (void)setQueueGroupingID:(id)a3
{
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setPrivateListeningOverride:(id)a3
{
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (int64_t)actionAfterQueueLoad
{
  return self->_actionAfterQueueLoad;
}

- (void)setEndTimeModifications:(id)a3
{
}

- (NSDictionary)endTimeModifications
{
  return self->_endTimeModifications;
}

- (void)setStartTimeModifications:(id)a3
{
}

- (NSDictionary)startTimeModifications
{
  return self->_startTimeModifications;
}

- (MPCPlaybackSharedListeningProperties)sharedListeningProperties
{
  if ([(MPCPlaybackIntent *)self tracklistSource] == 100)
  {
    v3 = [(MPCPlaybackIntent *)self tracklistToken];
    v4 = [v3 sharedListeningProperties];
  }
  else
  {
    v4 = 0;
  }

  return (MPCPlaybackSharedListeningProperties *)v4;
}

- (void)getArchiveWithConfiguration:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPCPlaybackIntent.m", 134, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  objc_super v8 = [(MPCPlaybackIntent *)self tracklistDataSource];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v8 getArchiveFromIntent:self configuration:v11 completion:v7];
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:1 userInfo:0];
    v7[2](v7, 0, v9);
  }
}

- (void)getRepresentativeObjectWithProperties:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MPCPlaybackIntent.m", 120, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v9 = [(MPCPlaybackIntent *)self tracklistDataSource];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__MPCPlaybackIntent_getRepresentativeObjectWithProperties_completion___block_invoke;
    v12[3] = &unk_2643C0378;
    id v13 = v8;
    [v9 getRepresentativeObjectFromIntent:self properties:v7 completion:v12];
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
  }
}

uint64_t __70__MPCPlaybackIntent_getRepresentativeObjectWithProperties_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRemotePlaybackQueueWithDestination:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPCPlaybackIntent.m", 98, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v8 = [(MPCPlaybackIntent *)self tracklistDataSource];
  if (v8)
  {
    v9 = [MEMORY[0x263F12178] standardUserDefaults];
    v10 = [v9 forcedIntentDestination];

    if (v10)
    {
      int v11 = [v10 intValue];
      if (v11 && v11 <= 3)
      {
        int v13 = v11;
        a3 = v11;
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v18 = v13;
          _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "Using overridden playback destination from defaults: %d", buf, 8u);
        }
      }
    }
    [v8 getRemotePlaybackQueueFromIntent:self destination:a3 completion:v7];
  }
  else
  {
    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:1 userInfo:0];
    v7[2](v7, 0, v15);
  }
}

- (void)getRemotePlaybackQueueDataWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__MPCPlaybackIntent_getRemotePlaybackQueueDataWithCompletion___block_invoke;
  v6[3] = &unk_2643C0350;
  id v7 = v4;
  id v5 = v4;
  [(MPCPlaybackIntent *)self getRemotePlaybackQueueWithDestination:3 completion:v6];
}

void __62__MPCPlaybackIntent_getRemotePlaybackQueueDataWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F89100]) initWithName:@"com.apple.amp.MPCPlaybackIntent.MediaSuggestion"];
    v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
    [v5 setExpirationDate:v6];

    id v7 = [MEMORY[0x263F890F8] sharedService];
    [v7 addAssertion:v5];

    [v9 _mediaRemotePlaybackQueue];
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (MPCPlaybackIntentDataSource)tracklistDataSource
{
  resolvedTracklistDataSource = self->_resolvedTracklistDataSource;
  if (!resolvedTracklistDataSource)
  {
    id v4 = [(id)objc_opt_class() tracklistDataSourceForSource:self->_tracklistSource];
    id v5 = self->_resolvedTracklistDataSource;
    self->_resolvedTracklistDataSource = v4;

    resolvedTracklistDataSource = self->_resolvedTracklistDataSource;
  }

  return resolvedTracklistDataSource;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)MPCPlaybackIntent;
  v3 = [(MPCPlaybackIntent *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = NSString;
  v6 = [NSNumber numberWithInteger:self->_tracklistSource];
  id v7 = [v5 stringWithFormat:@" source=%@", v6];
  objc_msgSend(v4, "insertString:atIndex:", v7, objc_msgSend(v4, "length") - 1);

  return v4;
}

+ (id)tracklistDataSourceForSource:(int64_t)a3
{
  id v4 = 0;
  id v5 = off_2643BCDA8;
  switch(a3)
  {
    case 1:
      goto LABEL_9;
    case 2:
    case 5:
      goto LABEL_10;
    case 3:
      id v5 = off_2643BCC58;
      goto LABEL_9;
    case 4:
      id v5 = off_2643BCDA0;
      goto LABEL_9;
    case 6:
      id v5 = off_2643BD638;
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        id v5 = off_2643BCE00;
      }
      else
      {
        if (a3 != 500) {
          goto LABEL_10;
        }
        id v5 = off_2643BCD70;
      }
LABEL_9:
      id v4 = objc_alloc_init(*v5);
LABEL_10:
      return v4;
  }
}

+ (id)sharedSessionIntentWithProperties:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MPCSharedListeningPlaybackIntentTracklistToken);
  [(MPCSharedListeningPlaybackIntentTracklistToken *)v7 setSharedListeningProperties:v6];

  [(MPCSharedListeningPlaybackIntentTracklistToken *)v7 setIdentity:v5];
  id v8 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v8 setTracklistSource:100];
  [(MPCPlaybackIntent *)v8 setTracklistToken:v7];

  return v8;
}

+ (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 extendedStatusCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(MPCSharedListeningPlaybackIntentDataSource);
  [(MPCSharedListeningPlaybackIntentDataSource *)v10 buildSharedSessionIntentWithIntent:v9 identity:v8 completion:v7];
}

+ (id)radioPlaybackIntentWithStationURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  [(MPCRadioPlaybackIntentTracklistToken *)v4 setRadioStationURL:v3];

  id v5 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v5 setTracklistSource:1];
  [(MPCPlaybackIntent *)v5 setTracklistToken:v4];

  return v5;
}

+ (id)radioPlaybackIntentWithStationStringID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  id v5 = objc_alloc(MEMORY[0x263F11FD8]);
  id v6 = objc_alloc(MEMORY[0x263F11DB0]);
  id v7 = [MEMORY[0x263F11FE0] identityKind];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke;
  v13[3] = &unk_2643C49D8;
  id v14 = v3;
  id v8 = v3;
  id v9 = (void *)[v6 initWithSource:@"MPCPlaybackIntent" modelKind:v7 block:v13];
  v10 = (void *)[v5 initWithIdentifiers:v9 block:&__block_literal_global_5711];
  [(MPCRadioPlaybackIntentTracklistToken *)v4 setRadioStation:v10];

  int v11 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v11 setTracklistSource:1];
  [(MPCPlaybackIntent *)v11 setTracklistToken:v4];

  return v11;
}

void __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke_2;
  v3[3] = &unk_2643C49B0;
  id v4 = *(id *)(a1 + 32);
  [a2 setRadioIdentifiersWithBlock:v3];
}

uint64_t __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStationStringID:*(void *)(a1 + 32)];
}

+ (id)radioPlaybackIntentWithStation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  [(MPCRadioPlaybackIntentTracklistToken *)v4 setRadioStation:v3];

  id v5 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v5 setTracklistSource:1];
  [(MPCPlaybackIntent *)v5 setTracklistToken:v4];

  return v5;
}

+ (id)radioPlaybackIntentFromSong:(id)a3
{
  id v4 = +[MPCModelRadioContentReference referenceWithMPModelObject:a3];
  if (v4)
  {
    id v5 = [a1 radioPlaybackIntentFromReference:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentFromArtist:(id)a3
{
  id v4 = +[MPCModelRadioContentReference referenceWithMPModelObject:a3];
  if (v4)
  {
    id v5 = [a1 radioPlaybackIntentFromReference:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentFromAlbum:(id)a3
{
  id v4 = +[MPCModelRadioContentReference referenceWithMPModelObject:a3];
  if (v4)
  {
    id v5 = [a1 radioPlaybackIntentFromReference:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentFromReference:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  [(MPCRadioPlaybackIntentTracklistToken *)v4 setSeedContentReference:v3];

  id v5 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v5 setTracklistSource:1];
  [(MPCPlaybackIntent *)v5 setTracklistToken:v4];

  return v5;
}

+ (id)continueListeningRadioPlaybackIntent
{
  v2 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  [(MPCRadioPlaybackIntentTracklistToken *)v2 setContinueListeningStation:1];
  id v3 = objc_alloc_init(MPCPlaybackIntent);
  [(MPCPlaybackIntent *)v3 setTracklistSource:1];
  [(MPCPlaybackIntent *)v3 setTracklistToken:v2];
  [(MPCPlaybackIntent *)v3 setPlayActivityFeatureName:@"now_playing"];

  return v3;
}

+ (id)intentFromModelRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPCPlaybackIntent);
  id v5 = objc_alloc_init(MPCModelPlaybackIntentTracklistToken);
  [(MPCModelPlaybackIntentTracklistToken *)v5 setRequest:v3];

  [(MPCPlaybackIntent *)v4 setTracklistToken:v5];
  [(MPCPlaybackIntent *)v4 setTracklistSource:3];

  return v4;
}

@end