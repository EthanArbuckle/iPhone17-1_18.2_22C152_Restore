@interface MPCRadioPlaybackIntentDataSource
- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4;
@end

@implementation MPCRadioPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, MPCModelRadioPlaybackContext *, void))a4;
  id v6 = a3;
  id v18 = [v6 tracklistToken];
  v7 = objc_alloc_init(MPCModelRadioPlaybackContext);
  -[MPCModelRadioPlaybackContext setContinueListeningStation:](v7, "setContinueListeningStation:", [v18 continueListeningStation]);
  v8 = [v18 nowPlayingContentReference];
  [(MPCModelRadioPlaybackContext *)v7 setNowPlayingContentReference:v8];

  v9 = [v18 seedContentReference];
  [(MPCModelRadioPlaybackContext *)v7 setSeedContentReference:v9];

  v10 = [v18 radioStationURL];
  [(MPCModelRadioPlaybackContext *)v7 setStationURL:v10];

  v11 = [v18 radioStation];
  [(MPCModelRadioPlaybackContext *)v7 setRadioStation:v11];

  v12 = [v6 playActivityRecommendationData];
  [(MPCModelRadioPlaybackContext *)v7 setPlayActivityRecommendationData:v12];

  v13 = [v6 playActivityFeatureName];
  [(MPCModelRadioPlaybackContext *)v7 setPlayActivityFeatureName:v13];

  v14 = [v6 queueGroupingID];
  [(MPCModelRadioPlaybackContext *)v7 setPlayActivityQueueGroupingID:v14];

  -[MPCModelRadioPlaybackContext setActionAfterQueueLoad:](v7, "setActionAfterQueueLoad:", [v6 actionAfterQueueLoad]);
  v15 = [v6 siriAssetInfo];
  [(MPCModelRadioPlaybackContext *)v7 setSiriAssetInfo:v15];

  v16 = [v6 siriReferenceIdentifier];
  [(MPCModelRadioPlaybackContext *)v7 setSiriReferenceIdentifier:v16];

  v17 = [v6 delegateTokenB];

  [(MPCModelRadioPlaybackContext *)v7 setDelegateTokenB:v17];
  v5[2](v5, v7, 0);
}

@end