@interface MPCustomDataPlaybackQueue
@end

@implementation MPCustomDataPlaybackQueue

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v9 = [v7 userIdentity];
    v10 = [v9 accountDSID];

    v11 = [v7 delegationProperties];
    uint64_t v12 = [v11 storeAccountID];

    if (v12)
    {
      v13 = (char *)&v58 + 1;
      uint64_t quot = v12;
      do
      {
        lldiv_t v15 = lldiv(quot, 10);
        uint64_t quot = v15.quot;
        if (v15.rem >= 0) {
          LOBYTE(v16) = v15.rem;
        }
        else {
          uint64_t v16 = -v15.rem;
        }
        *(v13 - 2) = v16 + 48;
        v17 = (const UInt8 *)(v13 - 2);
        --v13;
      }
      while (v15.quot);
      if (v12 < 0)
      {
        *(v13 - 2) = 45;
        v17 = (const UInt8 *)(v13 - 2);
      }
      CFStringRef v18 = CFStringCreateWithBytes(0, v17, (char *)&v58 - (char *)v17, 0x8000100u, 0);

      v10 = (void *)v18;
    }
    v19 = *(void **)(a1 + 32);
    if (v19) {
      v19 = (void *)v19[2];
    }
    v20 = v19;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2;
    v51[3] = &unk_2643C3EE8;
    id v52 = *(id *)(a1 + 32);
    id v21 = v10;
    id v53 = v21;
    id v54 = *(id *)(a1 + 40);
    long long v56 = *(_OWORD *)(a1 + 72);
    uint64_t v57 = *(void *)(a1 + 88);
    id v55 = *(id *)(a1 + 48);
    [v20 enumerateObjectsUsingBlock:v51];

    v22 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    v23 = [*(id *)(a1 + 40) lazyMapWithSections:&__block_literal_global_24373 items:&__block_literal_global_27];
    v24 = (void *)[v23 mutableCopy];
    v25 = (void *)[v24 copy];
    [(MPCModelStorePlaybackItemsRequest *)v22 setSectionedModelObjects:v25];

    v26 = objc_alloc_init(MPCModelPlaybackContext);
    id v27 = *(id *)(a1 + 56);
    v28 = v26;
    v29 = [v27 featureName];

    if (v29)
    {
      v30 = [v27 featureName];
      [(MPCModelPlaybackContext *)v28 setPlayActivityFeatureName:v30];
    }
    v31 = [v27 queueGroupingID];

    if (v31)
    {
      v32 = [v27 queueGroupingID];
      [(MPCModelPlaybackContext *)v28 setPlayActivityQueueGroupingID:v32];
    }
    v33 = [v27 siriRecommendationIdentifier];
    v34 = [v33 dataUsingEncoding:4];

    if (v34)
    {
      v35 = [v27 siriRecommendationIdentifier];
      v36 = [v35 dataUsingEncoding:4];
      [(MPCModelPlaybackContext *)v28 setPlayActivityRecommendationData:v36];
    }
    v37 = [v27 siriAssetInfo];

    if (v37)
    {
      v38 = [v27 siriAssetInfo];
      [(MPCModelPlaybackContext *)v28 setSiriAssetInfo:v38];
    }
    v39 = [v27 siriReferenceIdentifier];

    if (v39)
    {
      v40 = [v27 siriReferenceIdentifier];
      [(MPCModelPlaybackContext *)v28 setSiriReferenceIdentifier:v40];
    }
    v41 = [v27 siriWHAMetricsInfo];

    if (v41)
    {
      v42 = [v27 siriWHAMetricsInfo];
      [(MPCModelPlaybackContext *)v28 setSiriWHAMetricsInfo:v42];
    }
    v43 = [v27 privateListeningOverride];

    if (v43)
    {
      v44 = [v27 privateListeningOverride];
      [(MPCModelPlaybackContext *)v28 setPrivateListeningOverride:v44];
    }
    v45 = [v27 userIdentity];

    if (v45)
    {
      v46 = [v27 userIdentity];
      [(MPCModelPlaybackContext *)v28 setUserIdentity:v46];
    }
    if ([v27 isRequestingImmediatePlayback]) {
      uint64_t v47 = 20;
    }
    else {
      uint64_t v47 = 0;
    }
    [(MPCModelPlaybackContext *)v28 setActionAfterQueueLoad:v47];

    [(MPCModelPlaybackContext *)v28 setPlaybackRequestEnvironment:v7];
    if (v8) {
      [(MPCModelPlaybackContext *)v28 setPrivateListeningOverride:v8];
    }
    [(MPCModelPlaybackContext *)v28 setRequest:v22];
    [(MPCModelPlaybackContext *)v28 setStartItemIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    uint64_t v48 = *(void *)(a1 + 32);
    if (v48 && (*(unsigned char *)(v48 + 40) & 1) != 0 && *(_DWORD *)(v48 + 24) == 1) {
      [(MPCModelPlaybackContext *)v28 setShuffleType:1];
    }
    v49 = [*(id *)(a1 + 56) mediaRemoteOptions];
    v50 = [v49 objectForKeyedSubscript:*MEMORY[0x263F54D48]];

    if (v50) {
      -[MPCModelPlaybackContext setQueueEndAction:](v28, "setQueueEndAction:", [v50 integerValue]);
    }
    [(MPCModelPlaybackContext *)v28 setPlayActivityFeatureName:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [(MPCModelPlaybackContext *)v28 setPlayActivityQueueGroupingID:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = objc_alloc_init(MPCModelRadioPlaybackContext);
    id v10 = *(id *)(a1 + 32);
    v11 = v9;
    uint64_t v12 = [v10 featureName];

    if (v12)
    {
      v13 = [v10 featureName];
      [(MPCModelRadioPlaybackContext *)v11 setPlayActivityFeatureName:v13];
    }
    v14 = [v10 queueGroupingID];

    if (v14)
    {
      lldiv_t v15 = [v10 queueGroupingID];
      [(MPCModelRadioPlaybackContext *)v11 setPlayActivityQueueGroupingID:v15];
    }
    uint64_t v16 = [v10 siriRecommendationIdentifier];
    v17 = [v16 dataUsingEncoding:4];

    if (v17)
    {
      CFStringRef v18 = [v10 siriRecommendationIdentifier];
      v19 = [v18 dataUsingEncoding:4];
      [(MPCModelRadioPlaybackContext *)v11 setPlayActivityRecommendationData:v19];
    }
    v20 = [v10 siriAssetInfo];

    if (v20)
    {
      id v21 = [v10 siriAssetInfo];
      [(MPCModelRadioPlaybackContext *)v11 setSiriAssetInfo:v21];
    }
    v22 = [v10 siriReferenceIdentifier];

    if (v22)
    {
      v23 = [v10 siriReferenceIdentifier];
      [(MPCModelRadioPlaybackContext *)v11 setSiriReferenceIdentifier:v23];
    }
    v24 = [v10 siriWHAMetricsInfo];

    if (v24)
    {
      v25 = [v10 siriWHAMetricsInfo];
      [(MPCModelRadioPlaybackContext *)v11 setSiriWHAMetricsInfo:v25];
    }
    v26 = [v10 privateListeningOverride];

    if (v26)
    {
      id v27 = [v10 privateListeningOverride];
      [(MPCModelRadioPlaybackContext *)v11 setPrivateListeningOverride:v27];
    }
    v28 = [v10 userIdentity];

    if (v28)
    {
      v29 = [v10 userIdentity];
      [(MPCModelRadioPlaybackContext *)v11 setUserIdentity:v29];
    }
    if ([v10 isRequestingImmediatePlayback]) {
      uint64_t v30 = 20;
    }
    else {
      uint64_t v30 = 0;
    }
    [(MPCModelRadioPlaybackContext *)v11 setActionAfterQueueLoad:v30];

    [(MPCModelRadioPlaybackContext *)v11 setPlaybackRequestEnvironment:v7];
    if (v8) {
      [(MPCModelRadioPlaybackContext *)v11 setPrivateListeningOverride:v8];
    }
    v31 = *(void **)(a1 + 40);
    if (v31)
    {
      v32 = (void *)v31[3];
      if (!v32
        || (id v33 = v32,
            [(MPCModelRadioPlaybackContext *)v11 setPlayActivityFeatureName:v33],
            v33,
            (v31 = *(void **)(a1 + 40)) != 0))
      {
        v34 = (void *)v31[4];
        if (!v34
          || (id v35 = v34,
              [(MPCModelRadioPlaybackContext *)v11 setPlayActivityQueueGroupingID:v35], v35, (v31 = *(void **)(a1 + 40)) != 0))
        {
          if (!v31[5]) {
            goto LABEL_31;
          }
          id v36 = objc_alloc(MEMORY[0x263F11FD8]);
          id v37 = objc_alloc(MEMORY[0x263F11DB0]);
          v38 = [MEMORY[0x263F11FE0] identityKind];
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7;
          v53[3] = &unk_2643C49D8;
          id v54 = *(id *)(a1 + 40);
          v39 = (void *)[v37 initWithSource:@"RSQ-Proto" modelKind:v38 block:v53];
          v40 = (void *)[v36 initWithIdentifiers:v39 block:&__block_literal_global_45_24332];
          [(MPCModelRadioPlaybackContext *)v11 setRadioStation:v40];

          v31 = *(void **)(a1 + 40);
          if (v31)
          {
LABEL_31:
            v41 = (void *)v31[6];
            if (!v41) {
              goto LABEL_35;
            }
            id v42 = v41;
            v43 = [NSURL URLWithString:v42];
            if (v43) {
              [(MPCModelRadioPlaybackContext *)v11 setStationURL:v43];
            }

            v31 = *(void **)(a1 + 40);
            if (v31)
            {
LABEL_35:
              v44 = (void *)v31[7];
              if (v44)
              {
                id v45 = v44;
                v46 = _MPCProtoRadioContentReferenceToICRadioContentReference(v45);

                if (v46)
                {
                  uint64_t v47 = [[MPCModelRadioContentReference alloc] initWithICRadioContentReference:v46];
                  [(MPCModelRadioPlaybackContext *)v11 setSeedContentReference:v47];

                  uint64_t v48 = *(void *)(a1 + 40);
                  if (v48)
                  {
                    v49 = *(void **)(v48 + 16);
                    if (v49)
                    {
                      id v50 = v49;
                      v51 = _MPCProtoRadioContentReferenceToICRadioContentReference(v50);

                      if (v51)
                      {
                        id v52 = [[MPCModelRadioContentReference alloc] initWithICRadioContentReference:v51];
                        [(MPCModelRadioPlaybackContext *)v11 setNowPlayingContentReference:v52];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_8;
  v3[3] = &unk_2643C49B0;
  id v4 = *(id *)(a1 + 32);
  [a2 setRadioIdentifiersWithBlock:v3];
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2) {
    id v4 = *(void **)(v2 + 40);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  [v3 setStationStringID:v5];
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = objc_opt_class();

  id v13 = v12;
  id v14 = objc_alloc(MEMORY[0x263F11DB0]);
  lldiv_t v15 = [MEMORY[0x263F11F10] kindWithModelClass:v13];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke;
  v33[3] = &unk_2643C4108;
  id v34 = v11;
  id v35 = v9;
  id v36 = v10;
  id v16 = v10;
  id v17 = v9;
  CFStringRef v18 = v11;
  v19 = (void *)[v14 initWithSource:@"RSQ-Proto" modelKind:v15 block:v33];

  [*(id *)(a1 + 48) appendSection:v19];
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (v11) {
      v20 = (void *)v18[4];
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v20);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (v11) {
      id v21 = (void *)v18[5];
    }
    else {
      id v21 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v21);
  }
  if (v11) {
    v22 = (void *)v18[3];
  }
  else {
    v22 = 0;
  }
  id v23 = v22;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3;
  v26[3] = &unk_2643C3EC0;
  id v27 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 80);
  id v28 = v24;
  uint64_t v31 = v25;
  id v29 = *(id *)(a1 + 56);
  uint64_t v32 = a3;
  id v30 = *(id *)(a1 + 48);
  [v23 enumerateObjectsUsingBlock:v26];
}

id __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 modelKind];
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "modelClass")), "initWithIdentifiers:", v2);

  id v5 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v4];

  return v5;
}

id __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 modelKind];
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "modelClass")), "initWithIdentifiers:", v2);

  id v5 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v4];

  return v5;
}

void __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = objc_opt_class();

  id v13 = v12;
  id v14 = objc_alloc(MEMORY[0x263F11DB0]);
  lldiv_t v15 = [MEMORY[0x263F11F10] kindWithModelClass:v13];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke;
  v24[3] = &unk_2643C4108;
  id v25 = v11;
  id v26 = v9;
  id v27 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v11;
  v19 = (void *)[v14 initWithSource:@"RSQ-Proto" modelKind:v15 block:v24];

  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v22 = *(void *)(v20 + 40);
  id v21 = (id *)(v20 + 40);
  if (!v22)
  {
    uint64_t v23 = *(void *)(a1 + 48);
    if (v23)
    {
      if (*(void *)(v23 + 16) == a3 && *(void *)(v23 + 8) == *(void *)(a1 + 72)) {
        objc_storeStrong(v21, v19);
      }
    }
  }
  [*(id *)(a1 + 56) appendItem:v19];
}

@end