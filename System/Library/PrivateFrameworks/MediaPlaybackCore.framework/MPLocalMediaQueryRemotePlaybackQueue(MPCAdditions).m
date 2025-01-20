@interface MPLocalMediaQueryRemotePlaybackQueue(MPCAdditions)
- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:;
@end

@implementation MPLocalMediaQueryRemotePlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  v5 = a4;
  v6 = [a1 mediaQuery];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 mediaLibrary];
    v9 = [v8 userIdentity];

    v10 = [a1 userIdentity];
    v11 = [MEMORY[0x263F893C8] defaultIdentityStore];
    char v12 = [v9 isEqualToIdentity:v10 inStore:v11];

    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F11F48]);
      [v13 setLegacyMediaQuery:v7];
      v14 = NSString;
      v15 = [a1 featureName];
      v16 = [v14 stringWithFormat:@"RemotePlaybackQueue-%@", v15];
      [v13 setLabel:v16];

      v17 = objc_alloc_init(MPCModelPlaybackContext);
      v18 = [a1 privateListeningOverride];
      [(MPCModelPlaybackContext *)v17 setPrivateListeningOverride:v18];

      v19 = [a1 siriReferenceIdentifier];
      [(MPCModelPlaybackContext *)v17 setSiriReferenceIdentifier:v19];

      [(MPCModelPlaybackContext *)v17 setUserIdentity:v10];
      [(MPCModelPlaybackContext *)v17 setRequest:v13];
      v38 = [a1 firstItem];
      if (v38)
      {
        id v37 = v13;
        v20 = [v7 mediaLibrary];
        v21 = [v20 uniqueIdentifier];

        uint64_t v22 = [v38 persistentID];
        if ([v7 isPlaylistItemsQuery]) {
          uint64_t v22 = [v7 _playlistItemPersistentIDForItemPersistentID:v22];
        }
        id v23 = objc_alloc(MEMORY[0x263F11DB0]);
        v24 = [MEMORY[0x263F12030] identityKind];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __100__MPLocalMediaQueryRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke;
        v39[3] = &unk_2643C3FE0;
        id v40 = v21;
        uint64_t v41 = v22;
        id v25 = v21;
        v26 = (void *)[v23 initWithSource:@"MRQueue-MediaQuery" modelKind:v24 block:v39];
        [(MPCModelPlaybackContext *)v17 setStartItemIdentifiers:v26];

        id v13 = v37;
      }
      if ([a1 isRequestingImmediatePlayback]) {
        uint64_t v27 = 20;
      }
      else {
        uint64_t v27 = 0;
      }
      [(MPCModelPlaybackContext *)v17 setActionAfterQueueLoad:v27];
      -[MPCModelPlaybackContext setShuffleType:](v17, "setShuffleType:", [a1 shuffleType]);
      -[MPCModelPlaybackContext setRepeatType:](v17, "setRepeatType:", [a1 repeatType]);
      v28 = [a1 mediaRemoteOptions];
      v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F54D48]];

      if (v29) {
        -[MPCModelPlaybackContext setQueueEndAction:](v17, "setQueueEndAction:", [v29 integerValue]);
      }
      v30 = [a1 siriRecommendationIdentifier];
      v31 = [v30 dataUsingEncoding:4];
      [(MPCModelPlaybackContext *)v17 setPlayActivityRecommendationData:v31];

      v32 = [a1 siriAssetInfo];
      [(MPCModelPlaybackContext *)v17 setSiriAssetInfo:v32];

      v33 = [a1 featureName];
      [(MPCModelPlaybackContext *)v17 setPlayActivityFeatureName:v33];

      v34 = [a1 queueGroupingID];
      [(MPCModelPlaybackContext *)v17 setPlayActivityQueueGroupingID:v34];

      v35 = [a1 siriWHAMetricsInfo];
      [(MPCModelPlaybackContext *)v17 setSiriWHAMetricsInfo:v35];

      v5[2](v5, v17, 0);
    }
    else
    {
      v36 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 68, @"MPMediaQuery's userIdentity does not match MPRemotePlaybackQueue's userIdentity. queryIdentity=%@ playbackQueueIdentity=%@", v9, v10);
      ((void (**)(id, MPCModelPlaybackContext *, void *))v5)[2](v5, 0, v36);
    }
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 3000, @"MPLocalMediaQueryRemotePlaybackQueue has nil mediaQuery");
    ((void (**)(id, MPCModelPlaybackContext *, void *))v5)[2](v5, 0, v9);
  }
}

@end