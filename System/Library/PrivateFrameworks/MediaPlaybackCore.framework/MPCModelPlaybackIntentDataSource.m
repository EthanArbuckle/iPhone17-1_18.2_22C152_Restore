@interface MPCModelPlaybackIntentDataSource
- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4;
@end

@implementation MPCModelPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  id v22 = a3;
  v5 = (void (**)(id, MPCModelPlaybackContext *, void))a4;
  v6 = objc_alloc_init(MPCModelPlaybackContext);
  v7 = [v22 tracklistToken];
  v8 = [v7 request];
  [(MPCModelPlaybackContext *)v6 setRequest:v8];

  v9 = [v7 startItemIdentifiers];
  [(MPCModelPlaybackContext *)v6 setStartItemIdentifiers:v9];

  v10 = [v22 startTimeModifications];
  [(MPCModelPlaybackContext *)v6 setStartTimeModifications:v10];

  v11 = [v22 endTimeModifications];
  [(MPCModelPlaybackContext *)v6 setEndTimeModifications:v11];

  unint64_t v12 = [v22 shuffleMode];
  if (v12 >= 3) {
    uint64_t v13 = 1000;
  }
  else {
    uint64_t v13 = v12;
  }
  [(MPCModelPlaybackContext *)v6 setShuffleType:v13];
  unint64_t v14 = [v22 repeatMode];
  if (v14 > 2) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = qword_21BEF1910[v14];
  }
  [(MPCModelPlaybackContext *)v6 setRepeatType:v15];
  v16 = [v22 playActivityRecommendationData];
  [(MPCModelPlaybackContext *)v6 setPlayActivityRecommendationData:v16];

  v17 = [v22 playActivityFeatureName];
  [(MPCModelPlaybackContext *)v6 setPlayActivityFeatureName:v17];

  v18 = [v22 queueGroupingID];
  [(MPCModelPlaybackContext *)v6 setPlayActivityQueueGroupingID:v18];

  -[MPCModelPlaybackContext setActionAfterQueueLoad:](v6, "setActionAfterQueueLoad:", [v22 actionAfterQueueLoad]);
  v19 = [v22 siriAssetInfo];
  [(MPCModelPlaybackContext *)v6 setSiriAssetInfo:v19];

  v20 = [v22 siriReferenceIdentifier];
  [(MPCModelPlaybackContext *)v6 setSiriReferenceIdentifier:v20];

  v21 = [v22 delegateTokenB];
  [(MPCModelPlaybackContext *)v6 setDelegateTokenB:v21];

  v5[2](v5, v6, 0);
}

@end