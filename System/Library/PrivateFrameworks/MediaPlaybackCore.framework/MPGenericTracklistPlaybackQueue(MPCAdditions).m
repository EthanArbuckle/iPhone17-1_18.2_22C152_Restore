@interface MPGenericTracklistPlaybackQueue(MPCAdditions)
- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:;
@end

@implementation MPGenericTracklistPlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v5 = a4;
  v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  v7 = [a1 trackIdentifiers];
  v8 = [a1 collectionIdentifierSet];

  v52 = a1;
  v53 = v7;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F120D8]);
    v10 = [a1 collectionIdentifierSet];
    v11 = [v10 universalStore];
    v12 = [v11 globalPlaylistID];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263F11F98]);
      v14 = [a1 collectionIdentifierSet];
      v15 = &__block_literal_global_154;
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x263F11E80]);
      v14 = [a1 collectionIdentifierSet];
      v15 = &__block_literal_global_157;
    }
    uint64_t v22 = [v13 initWithIdentifiers:v14 block:v15];

    v51 = (void *)v22;
    [v9 appendSection:v22];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v7;
    uint64_t v23 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          id v28 = objc_alloc(MEMORY[0x263F11DB0]);
          v29 = [MEMORY[0x263F12030] identityKind];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3;
          v60[3] = &unk_2643C49D8;
          v60[4] = v27;
          v30 = (void *)[v28 initWithSource:@"MRQueue-GenericTracklist" modelKind:v29 block:v60];

          v31 = (void *)[objc_alloc(MEMORY[0x263F12028]) initWithIdentifiers:v30 block:&__block_literal_global_165];
          [v9 appendItem:v31];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v24);
    }

    [(MPCModelStorePlaybackItemsRequest *)v6 setSectionedModelObjects:v9];
  }
  else
  {
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [NSString stringWithFormat:@"%@", *(void *)(*((void *)&v56 + 1) + 8 * j)];
          [v9 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v18);
    }

    [(MPCModelStorePlaybackItemsRequest *)v6 setStoreIDs:v9];
  }

  v32 = objc_alloc_init(MPCModelPlaybackContext);
  v33 = [v52 siriReferenceIdentifier];
  [(MPCModelPlaybackContext *)v32 setSiriReferenceIdentifier:v33];

  v34 = [v52 userIdentity];
  [(MPCModelPlaybackContext *)v32 setUserIdentity:v34];

  v35 = [v52 privateListeningOverride];
  [(MPCModelPlaybackContext *)v32 setPrivateListeningOverride:v35];

  [(MPCModelPlaybackContext *)v32 setRequest:v6];
  v36 = [v52 firstTrackIdentifier];
  if ([v36 length])
  {
    uint64_t v37 = [v36 longLongValue];
    if (v37)
    {
      uint64_t v38 = v37;
      id v39 = objc_alloc(MEMORY[0x263F11DB0]);
      v40 = [MEMORY[0x263F12030] identityKind];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6;
      v55[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v55[4] = v38;
      v41 = (void *)[v39 initWithSource:@"MRQueue-GenericTracklist" modelKind:v40 block:v55];

      [(MPCModelPlaybackContext *)v32 setStartItemIdentifiers:v41];
    }
  }
  if ([v52 isRequestingImmediatePlayback]) {
    uint64_t v42 = 20;
  }
  else {
    uint64_t v42 = 0;
  }
  [(MPCModelPlaybackContext *)v32 setActionAfterQueueLoad:v42];
  -[MPCModelPlaybackContext setShuffleType:](v32, "setShuffleType:", [v52 shuffleType]);
  -[MPCModelPlaybackContext setRepeatType:](v32, "setRepeatType:", [v52 repeatType]);
  v43 = [v52 mediaRemoteOptions];
  v44 = [v43 objectForKeyedSubscript:*MEMORY[0x263F54D48]];

  if (v44) {
    -[MPCModelPlaybackContext setQueueEndAction:](v32, "setQueueEndAction:", [v44 integerValue]);
  }
  v45 = [v52 siriRecommendationIdentifier];
  v46 = [v45 dataUsingEncoding:4];
  [(MPCModelPlaybackContext *)v32 setPlayActivityRecommendationData:v46];

  v47 = [v52 siriAssetInfo];
  [(MPCModelPlaybackContext *)v32 setSiriAssetInfo:v47];

  v48 = [v52 featureName];
  [(MPCModelPlaybackContext *)v32 setPlayActivityFeatureName:v48];

  v49 = [v52 queueGroupingID];
  [(MPCModelPlaybackContext *)v32 setPlayActivityQueueGroupingID:v49];

  v50 = [v52 siriWHAMetricsInfo];
  [(MPCModelPlaybackContext *)v32 setSiriWHAMetricsInfo:v50];

  v5[2](v5, v32, 0);
}

@end