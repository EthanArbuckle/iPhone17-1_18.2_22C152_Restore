@interface MPCReportingPlaybackObserver
+ (MPCReportingPlaybackObserver)sharedReportingPlaybackObserver;
- (id)_init;
- (id)_newReportingPlaybackActivityEventForPlayActivityEvent:(id)a3 eventSource:(id)a4;
- (id)newPlayActivityEvent;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)recordPlayActivityEvents:(id)a3 forEventSource:(id)a4;
@end

@implementation MPCReportingPlaybackObserver

- (void).cxx_destruct
{
}

- (id)_newReportingPlaybackActivityEventForPlayActivityEvent:(id)a3 eventSource:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a4;
    v7 = objc_alloc_init(MPCReportingPlaybackActivityEvent);
    [(MPCReportingPlaybackActivityEvent *)v7 setPlayActivityEvent:v5];
    char v8 = [v6 shouldReportPlayEventsToStore];

    BOOL v9 = (v8 & 1) != 0 || [v5 eventType] != 0;
    [(MPCReportingPlaybackActivityEvent *)v7 setShouldReportToStore:v9];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)recordPlayActivityEvents:(id)a3 forEventSource:(id)a4
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7 || ![v6 count]) {
    goto LABEL_71;
  }
  v89 = [v7 identityPropertiesLoader];
  [v7 eventDuration];
  double v9 = v8;
  v10 = [v7 itemGenericObject];
  uint64_t v98 = [v7 overrideItemType];
  v108 = [v7 trackInfo];
  v11 = [v7 modelPlayEvent];
  v107 = [v7 featureName];
  v106 = [v7 recommendationData];
  v12 = [v10 flattenedGenericObject];
  v13 = [v12 anyObject];
  v14 = [v13 identifiers];

  uint64_t v15 = [v12 type];
  v96 = v7;
  v90 = v12;
  v91 = self;
  switch(v15)
  {
    case 9:
      int obj = 0;
      int v18 = 0;
      char v102 = 1;
LABEL_9:
      unsigned int v17 = 1;
      break;
    case 6:
      char v102 = 0;
      int v18 = 0;
      int obj = 1;
      goto LABEL_9;
    case 1:
      v16 = [v12 song];
      unsigned int v17 = [v16 hasVideo];
      int v18 = [v16 isArtistUploadedContent];

      char v102 = 0;
      int obj = 0;
      break;
    default:
      char v102 = 0;
      int obj = 0;
      int v18 = 0;
      unsigned int v17 = 0;
      break;
  }
  v92 = v11;
  v95 = v14;
  switch([v11 itemType])
  {
    case 1:
      int v19 = v18;
      id v20 = objc_alloc_init(MEMORY[0x263F89240]);
      v21 = [v11 album];
      v22 = [v21 identifiers];
      v23 = [v22 universalStore];
      uint64_t v24 = [v23 subscriptionAdamID];
      if (v24)
      {
        [v20 setAdamID:v24];
      }
      else
      {
        v52 = [v22 universalStore];
        objc_msgSend(v20, "setAdamID:", objc_msgSend(v52, "adamID"));
      }
      v53 = [v14 personalizedStore];
      v54 = [v53 cloudAlbumID];
      [v20 setCloudAlbumID:v54];

      int v42 = 0;
      uint64_t v101 = 4;
      goto LABEL_32;
    case 2:
      id v20 = objc_alloc_init(MEMORY[0x263F89240]);
      v25 = [v11 artist];
      v26 = [v25 identifiers];
      v27 = [v26 universalStore];
      uint64_t v28 = [v27 subscriptionAdamID];
      if (v28)
      {
        [v20 setAdamID:v28];
      }
      else
      {
        [v26 universalStore];
        v56 = int v55 = v18;
        objc_msgSend(v20, "setAdamID:", objc_msgSend(v56, "adamID"));

        int v18 = v55;
      }

      int v42 = 0;
      uint64_t v101 = 3;
      break;
    case 3:
      int v19 = v18;
      v29 = v10;
      id v30 = objc_alloc_init(MEMORY[0x263F89240]);
      v31 = [v11 playlist];
      v32 = [v31 identifiers];
      v33 = [v32 universalStore];
      v34 = [v33 globalPlaylistID];

      if ([v34 length]) {
        [v30 setGlobalPlaylistID:v34];
      }
      v35 = [v32 personalizedStore];
      uint64_t v36 = [v35 cloudID];

      if (v36) {
        [v30 setCloudPlaylistID:v36];
      }
      v37 = [v32 universalStore];
      v38 = [v37 universalCloudLibraryID];

      if ([v38 length] && (objc_opt_respondsToSelector() & 1) != 0) {
        [v30 setCloudUniversalLibraryID:v38];
      }
      v39 = (void *)MEMORY[0x263F11F78];
      v118[0] = MEMORY[0x263EF8330];
      v118[1] = 3221225472;
      v118[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke;
      v118[3] = &unk_2643C5EE8;
      id v40 = v30;
      id v119 = v40;
      id v120 = v31;
      id v41 = v31;
      [v39 performWithoutEnforcement:v118];

      id v20 = v40;
      int v42 = 0;
      uint64_t v101 = 2;
      v10 = v29;
      v14 = v95;
LABEL_32:
      int v18 = v19;
      break;
    case 4:
      int v104 = v18;
      unsigned int v43 = v17;
      id v44 = objc_alloc_init(MEMORY[0x263F89240]);
      v45 = [v11 radioStation];
      v46 = [v45 identifiers];
      v47 = [v46 radio];
      v48 = [v47 stationStringID];

      if ([v48 length]) {
        [v44 setStationStringID:v48];
      }
      v49 = [v46 radio];
      v50 = [v49 stationHash];

      if ([v50 length]) {
        [v44 setStationHash:v50];
      }
      v51 = [v46 radio];
      objc_msgSend(v44, "setStationID:", objc_msgSend(v51, "stationID"));

      int v42 = 1;
      uint64_t v101 = 1;
      id v20 = v44;
      unsigned int v17 = v43;
      int v18 = v104;
      break;
    default:
      int v42 = 0;
      uint64_t v101 = 0;
      id v20 = 0;
      break;
  }
  v93 = v10;
  v105 = v20;
  if (v10)
  {
    id v57 = objc_alloc_init(MEMORY[0x263F89248]);
    if (v18)
    {
      uint64_t v58 = v98;
      if (!v98) {
        uint64_t v58 = 6;
      }
      uint64_t v98 = v58;
      v59 = [v14 universalStore];
      uint64_t v60 = [v59 subscriptionAdamID];
      if (v60)
      {
        [v57 setSubscriptionAdamID:v60];
      }
      else
      {
        v71 = [v14 universalStore];
        objc_msgSend(v57, "setSubscriptionAdamID:", objc_msgSend(v71, "adamID"));
      }
      v62 = v96;
LABEL_57:

LABEL_58:
      uint64_t v61 = v17;
      v72 = [v62 lyricsID];
      [v57 setLyricsID:v72];

      objc_msgSend(v57, "setEquivalencySourceAdamID:", objc_msgSend(v62, "equivalencySourceAdamID"));
      v73 = [v14 universalStore];
      objc_msgSend(v57, "setReportingAdamID:", objc_msgSend(v73, "reportingAdamID"));

      goto LABEL_59;
    }
    v63 = [v14 universalStore];
    v64 = v63;
    if (v42)
    {
      uint64_t v65 = [v63 adamID];
      if (!v65)
      {
        v66 = [v14 universalStore];
        uint64_t v65 = [v66 subscriptionAdamID];
      }
      [v57 setRadioAdamID:v65];
      uint64_t v67 = v98;
      if (v98) {
        BOOL v68 = 1;
      }
      else {
        BOOL v68 = v65 == 0;
      }
      if (!v68) {
        uint64_t v67 = 1;
      }
      uint64_t v98 = v67;
      v62 = v96;
      goto LABEL_58;
    }
    objc_msgSend(v57, "setSubscriptionAdamID:", objc_msgSend(v63, "subscriptionAdamID"));

    v69 = [v14 universalStore];
    objc_msgSend(v57, "setPurchasedAdamID:", objc_msgSend(v69, "purchasedAdamID"));

    uint64_t v70 = 8;
    if (obj) {
      uint64_t v70 = 9;
    }
    if ((v102 | obj))
    {
      uint64_t v98 = v70;
      v62 = v96;
LABEL_77:
      v87 = [v14 personalizedStore];
      objc_msgSend(v57, "setCloudID:", objc_msgSend(v87, "cloudID"));

      v88 = [v14 universalStore];
      v59 = [v88 universalCloudLibraryID];

      if ([v59 length] && (objc_opt_respondsToSelector() & 1) != 0) {
        [v57 setCloudUniversalLibraryID:v59];
      }
      goto LABEL_57;
    }
    if ([v57 subscriptionAdamID])
    {
      v62 = v96;
    }
    else
    {
      v62 = v96;
      if (![v57 purchasedAdamID]) {
        goto LABEL_77;
      }
    }
    if (!v98) {
      uint64_t v98 = 1;
    }
    goto LABEL_77;
  }
  uint64_t v61 = 0;
  id v57 = 0;
  v62 = v96;
LABEL_59:
  v103 = [v62 requestingBundleIdentifier];
  v74 = [v62 requestingBundleVersion];
  v97 = [v62 jingleTimedMetadata];
  v75 = [v62 isSiriInitiated];
  v76 = [v62 isPrivateListeningEnabled];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v94 = v6;
  id obja = v6;
  uint64_t v77 = [obja countByEnumeratingWithState:&v114 objects:v121 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v115 != v79) {
          objc_enumerationMutation(obja);
        }
        v81 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        [v81 setTrackInfo:v108];
        [v81 setRequestingBundleIdentifier:v103];
        [v81 setRequestingBundleVersion:v74];
        [v81 setMediaType:v61];
        [v81 setContainerType:v101];
        [v81 setContainerIDs:v105];
        [v81 setFeatureName:v107];
        [v81 setRecommendationData:v106];
        [v81 setItemDuration:v9];
        id v82 = v57;
        [v81 setItemIDs:v57];
        [v81 setSiriInitiated:v75];
        [v81 setPrivateListeningEnabled:v76];
        [v81 setRepeatPlayMode:0];
        [v81 setShufflePlayMode:0];
        [v81 setAutoPlayMode:0];
        v83 = [v81 timedMetadata];

        if (!v83) {
          [v81 setTimedMetadata:v97];
        }
        if (![v81 itemType]) {
          [v81 setItemType:v98];
        }
        id v57 = v82;
      }
      uint64_t v78 = [obja countByEnumeratingWithState:&v114 objects:v121 count:16];
    }
    while (v78);
  }

  id v84 = objc_alloc(MEMORY[0x263F11D48]);
  v109[0] = MEMORY[0x263EF8330];
  v109[1] = 3221225472;
  v109[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_2;
  v109[3] = &unk_2643C3170;
  id v110 = v89;
  id v111 = obja;
  v112 = v91;
  id v7 = v96;
  id v113 = v96;
  id v85 = v89;
  v86 = (void *)[v84 initWithStartHandler:v109];
  [(NSOperationQueue *)v91->_recordEventOperationQueue addOperation:v86];

  id v6 = v94;
LABEL_71:
}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) cloudVersionHash];
  [v1 setPlaylistVersionHash:v2];
}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_3;
  v9[3] = &unk_2643C3148;
  v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = v3;
  id v8 = v3;
  [v4 loadReportingIdentityPropertiesWithCompletionHandler:v9];
}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_4;
  block[3] = &unk_2643C3120;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 40) storeFrontID];
        [v8 setStoreFrontID:v9];

        objc_msgSend(v8, "setStoreAccountID:", objc_msgSend(*(id *)(a1 + 40), "storeAccountID"));
        id v10 = [*(id *)(a1 + 40) enqueuerProperties];
        [v8 setEnqueuerProperties:v10];

        objc_msgSend(v8, "setSBEnabled:", objc_msgSend(*(id *)(a1 + 40), "hasSubscriptionPlaybackCapability"));
        id v11 = [*(id *)(a1 + 40) householdID];
        [v8 setHouseholdID:v11];

        id v12 = (void *)[*(id *)(a1 + 48) _newReportingPlaybackActivityEventForPlayActivityEvent:v8 eventSource:*(void *)(a1 + 56)];
        if (v12) {
          [v2 addObject:v12];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    id v13 = [MEMORY[0x263F89258] shared];
    v14 = objc_msgSend(v2, "msv_map:", &__block_literal_global_37);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_6;
    v15[3] = &unk_2643C30F8;
    id v16 = *(id *)(a1 + 64);
    [v13 recordPlayActivityEvents:v14 shouldFlush:1 withCompletionHandler:v15];
  }
}

uint64_t __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __72__MPCReportingPlaybackObserver_recordPlayActivityEvents_forEventSource___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 playActivityEvent];
}

- (id)newPlayActivityEvent
{
  id v3 = objc_alloc_init(MEMORY[0x263F89238]);
  if (newPlayActivityEvent_sOnceToken != -1) {
    dispatch_once(&newPlayActivityEvent_sOnceToken, &__block_literal_global_9);
  }
  uint64_t v4 = [MEMORY[0x263F89108] currentDeviceInfo];
  uint64_t v5 = [v4 deviceName];
  [v3 setDeviceName:v5];

  [v3 setSystemReleaseType:newPlayActivityEvent_systemReleaseType];
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  [v3 setEventDate:v6];

  uint64_t v7 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v3 setEventTimeZone:v7];

  id v8 = objc_alloc(MEMORY[0x263F89360]);
  uint64_t v9 = [MEMORY[0x263F893C0] activeAccount];
  id v10 = (void *)[v8 initWithIdentity:v9];

  id v11 = [v10 userAgent];
  [v3 setBuildVersion:v11];

  [v3 setSourceType:0];
  [v3 setOffline:self->_offline];

  return v3;
}

void __52__MPCReportingPlaybackObserver_newPlayActivityEvent__block_invoke()
{
  id v3 = (void *)MGCopyAnswer();
  if ([v3 isEqualToString:@"Beta"])
  {
    uint64_t v0 = 3;
LABEL_5:
    v1 = v3;
LABEL_6:
    newPlayActivityEvent_systemReleaseType = v0;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Internal"])
  {
    uint64_t v0 = 4;
    goto LABEL_5;
  }
  int v2 = [v3 isEqualToString:@"Carrier"];
  v1 = v3;
  if (v2)
  {
    uint64_t v0 = 2;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__MPCReportingPlaybackObserver_environmentMonitorDidChangeNetworkType___block_invoke;
  v6[3] = &unk_2643C5EE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __71__MPCReportingPlaybackObserver_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) networkType];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = result == 0;
  return result;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)MPCReportingPlaybackObserver;
  int v2 = [(MPCReportingPlaybackObserver *)&v7 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    recordEventOperationQueue = v2->_recordEventOperationQueue;
    v2->_recordEventOperationQueue = v3;

    [(NSOperationQueue *)v2->_recordEventOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_recordEventOperationQueue setName:@"com.apple.MediaPlaybackCore.MPCReportingPlaybackObserver.recordEventOperationQueue"];
    id v5 = [MEMORY[0x263F89110] sharedMonitor];
    [v5 registerObserver:v2];
    v2->_offline = [v5 networkType] == 0;
    [(NSOperationQueue *)v2->_recordEventOperationQueue setQualityOfService:17];
  }
  return v2;
}

+ (MPCReportingPlaybackObserver)sharedReportingPlaybackObserver
{
  if (sharedReportingPlaybackObserver_sSharedReportingPlaybackObserverOnceToken != -1) {
    dispatch_once(&sharedReportingPlaybackObserver_sSharedReportingPlaybackObserverOnceToken, &__block_literal_global_20988);
  }
  int v2 = (void *)sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver;

  return (MPCReportingPlaybackObserver *)v2;
}

void __63__MPCReportingPlaybackObserver_sharedReportingPlaybackObserver__block_invoke()
{
  id v0 = [[MPCReportingPlaybackObserver alloc] _init];
  v1 = (void *)sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver;
  sharedReportingPlaybackObserver_sSharedReportingPlaybackObserver = (uint64_t)v0;
}

@end