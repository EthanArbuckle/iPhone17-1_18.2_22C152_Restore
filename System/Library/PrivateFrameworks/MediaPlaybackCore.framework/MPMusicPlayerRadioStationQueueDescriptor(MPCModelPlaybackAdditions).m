@interface MPMusicPlayerRadioStationQueueDescriptor(MPCModelPlaybackAdditions)
- (id)playbackContexts;
@end

@implementation MPMusicPlayerRadioStationQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  v17[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(MPCModelRadioPlaybackContext);
  id v3 = objc_alloc(MEMORY[0x263F11FD8]);
  id v4 = objc_alloc(MEMORY[0x263F11DB0]);
  v5 = [MEMORY[0x263F11FE0] identityKind];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__MPMusicPlayerRadioStationQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
  v16[3] = &unk_2643C49D8;
  v16[4] = a1;
  v6 = (void *)[v4 initWithSource:@"MPMusicPlayerQueueDescriptor" modelKind:v5 block:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__MPMusicPlayerRadioStationQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke_3;
  v15[3] = &unk_2643C1680;
  v15[4] = a1;
  v7 = (void *)[v3 initWithIdentifiers:v6 block:v15];
  [(MPCModelRadioPlaybackContext *)v2 setRadioStation:v7];

  v8 = [(MPCModelRadioPlaybackContext *)v2 playbackRequestEnvironment];
  v9 = (void *)[v8 mutableCopy];

  if ([a1 isPrivate]) {
    [(MPCModelRadioPlaybackContext *)v2 setPrivateListeningOverride:MEMORY[0x263EFFA88]];
  }
  [a1 _addRequestingBundleIdentifierToPlaybackRequestEnvironment:v9];
  v10 = [a1 playActivityFeatureName];
  [(MPCModelRadioPlaybackContext *)v2 setPlayActivityFeatureName:v10];

  v11 = [a1 playActivityRecommendationData];
  [(MPCModelRadioPlaybackContext *)v2 setPlayActivityRecommendationData:v11];

  v12 = [a1 playActivityQueueGroupingID];
  [(MPCModelRadioPlaybackContext *)v2 setPlayActivityQueueGroupingID:v12];

  [(MPCModelRadioPlaybackContext *)v2 setPlaybackRequestEnvironment:v9];
  [(MPCModelRadioPlaybackContext *)v2 setQueueDescriptor:a1];
  v17[0] = v2;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];

  return v13;
}

@end