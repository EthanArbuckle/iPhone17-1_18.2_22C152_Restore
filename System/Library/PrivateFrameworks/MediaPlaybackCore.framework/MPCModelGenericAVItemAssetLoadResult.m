@interface MPCModelGenericAVItemAssetLoadResult
+ (id)assetLoadResultWithStoreAssetPlaybackResponse:(id)a3 assetLoadProperties:(id)a4 source:(int64_t)a5 error:(id *)a6;
- (BOOL)allowsAssetCaching;
- (BOOL)allowsAssetInfoCaching;
- (BOOL)hasValidAsset;
- (BOOL)isCloudStreamingAsset;
- (BOOL)isDownloadedAsset;
- (BOOL)isHLSAsset;
- (BOOL)isHomeSharingAsset;
- (BOOL)isiTunesStoreStream;
- (BOOL)onlineSubscriptionKeysRequired;
- (NSDictionary)purchaseBundleDictionary;
- (NSNumber)streamingKeyAdamID;
- (NSString)assetPathExtension;
- (NSString)keyServerProtocolType;
- (NSURL)alternateHLSKeyCertificateURL;
- (NSURL)alternateHLSKeyServerURL;
- (NSURL)alternateHLSPlaylistURL;
- (NSURL)assetURL;
- (NSURL)protectedContentSupportStorageFileURL;
- (NSURL)streamingKeyCertificateURL;
- (NSURL)streamingKeyServerURL;
- (id)description;
- (id)descriptionDictionary;
- (id)suzeLeaseID;
- (id)willBecomeActivePlayerItemHandler;
- (int64_t)assetProtectionType;
- (int64_t)assetQualityType;
- (int64_t)audioAssetType;
- (int64_t)source;
- (void)setAllowsAssetCaching:(BOOL)a3;
- (void)setAllowsAssetInfoCaching:(BOOL)a3;
- (void)setAlternateHLSKeyCertificateURL:(id)a3;
- (void)setAlternateHLSKeyServerURL:(id)a3;
- (void)setAlternateHLSPlaylistURL:(id)a3;
- (void)setAssetPathExtension:(id)a3;
- (void)setAssetProtectionType:(int64_t)a3;
- (void)setAssetQualityType:(int64_t)a3;
- (void)setAssetURL:(id)a3;
- (void)setAudioAssetType:(int64_t)a3;
- (void)setDownloadedAsset:(BOOL)a3;
- (void)setITunesStoreStream:(BOOL)a3;
- (void)setIsCloudStreamingAsset:(BOOL)a3;
- (void)setIsHLSAsset:(BOOL)a3;
- (void)setIsHomeSharingAsset:(BOOL)a3;
- (void)setKeyServerProtocolType:(id)a3;
- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3;
- (void)setProtectedContentSupportStorageFileURL:(id)a3;
- (void)setPurchaseBundleDictionary:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setStreamingKeyAdamID:(id)a3;
- (void)setStreamingKeyCertificateURL:(id)a3;
- (void)setStreamingKeyServerURL:(id)a3;
- (void)setSuzeLeaseID:(id)a3;
- (void)setWillBecomeActivePlayerItemHandler:(id)a3;
@end

@implementation MPCModelGenericAVItemAssetLoadResult

+ (id)assetLoadResultWithStoreAssetPlaybackResponse:(id)a3 assetLoadProperties:(id)a4 source:(int64_t)a5 error:(id *)a6
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  int64_t v83 = a5;
  if ([v9 isLiveRadioStream])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = v10;
    if ([v10 prefersHighQualityContent]) {
      [v11 addObject:&unk_26CC18CC0];
    }
    [v11 addObject:&unk_26CC18CD8];
    v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"flavor IN %@ AND streamURL != nil", v11];
    v14 = [v9 radioStreamAssetInfoList];
    v15 = [v14 filteredArrayUsingPredicate:v13];
    v16 = (void *)[v15 mutableCopy];

    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke;
    v98[3] = &unk_2643BF410;
    id v99 = v11;
    id v17 = v11;
    [v16 sortUsingComparator:v98];
    v18 = [v16 firstObject];
    if (v18
      || ([v9 radioStreamAssetInfoList],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v19 firstObject],
          v18 = objc_claimAutoreleasedReturnValue(),
          v19,
          v18))
    {
      id v20 = objc_alloc_init((Class)a1);
      v21 = [v18 streamURL];
      [v20 setAssetURL:v21];

      v22 = [v18 keyServerURL];
      [v20 setStreamingKeyServerURL:v22];

      v23 = [v18 keyCertificateURL];
      [v20 setStreamingKeyCertificateURL:v23];

      objc_msgSend(v20, "setITunesStoreStream:", objc_msgSend(v18, "isiTunesStoreStream"));
      [v20 setAllowsAssetInfoCaching:1];
      [v20 setIsCloudStreamingAsset:1];
      objc_msgSend(v20, "setIsHLSAsset:", objc_msgSend(v18, "streamProtocol") == 1);
      if ([v20 isHLSAsset])
      {
        v24 = [v9 hlsAssetInfo];
        v25 = [v24 keyServerAdamID];
        [v20 setStreamingKeyAdamID:v25];

        v26 = [v24 keyServerProtocolType];
        [v20 setKeyServerProtocolType:v26];
      }
    }
    else
    {
      id v20 = 0;
    }

    id v10 = v12;
    a5 = v83;
    if (v20) {
      goto LABEL_22;
    }
  }
  if (([v10 allowsHLSContent] & 1) == 0 && objc_msgSend(v10, "preferredAudioAssetType") < 2) {
    goto LABEL_23;
  }
  uint64_t v27 = [v9 hlsAssetInfo];
  if (!v27) {
    goto LABEL_23;
  }
  v28 = (void *)v27;
  id v20 = objc_alloc_init((Class)a1);
  v29 = [v28 playlistURL];
  [v20 setAssetURL:v29];

  v30 = [v28 keyServerURL];
  [v20 setStreamingKeyServerURL:v30];

  v31 = [v28 keyCertificateURL];
  [v20 setStreamingKeyCertificateURL:v31];

  v32 = [v28 keyServerProtocolType];
  [v20 setKeyServerProtocolType:v32];

  objc_msgSend(v20, "setITunesStoreStream:", objc_msgSend(v28, "isiTunesStoreStream"));
  v33 = [v28 alternatePlaylistURL];
  [v20 setAlternateHLSPlaylistURL:v33];

  v34 = [v28 alternateKeyServerURL];
  [v20 setAlternateHLSKeyServerURL:v34];

  v35 = [v28 alternateKeyCertificateURL];
  [v20 setAlternateHLSKeyCertificateURL:v35];

  [v20 setIsHLSAsset:1];
  [v20 setAllowsAssetInfoCaching:1];
  [v20 setIsCloudStreamingAsset:1];
  [v20 setAssetPathExtension:*MEMORY[0x263F88F08]];
  [v20 setAssetQualityType:2];
  v36 = [v28 keyServerAdamID];
  [v20 setStreamingKeyAdamID:v36];

  objc_msgSend(v20, "setAllowsAssetCaching:", objc_msgSend(v10, "prefersVideoContent") ^ 1);
  v37 = [v10 storeAsset];
  uint64_t v38 = [v37 endpointType];

  if ((unint64_t)(v38 - 1) >= 2)
  {
    uint64_t v40 = v38 == 3 ? 2 : 0;
  }
  else
  {
    v39 = [v28 keyServerProtocolType];
    uint64_t v40 = [v39 isEqualToString:*MEMORY[0x263F11C90]] ? 2 : 1;
  }
  [v20 setAssetProtectionType:v40];

  if (v20)
  {
LABEL_22:
    v41 = 0;
  }
  else
  {
LABEL_23:
    id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v43 = [v10 prefersHighQualityContent];
    if ([v10 prefersVideoContent])
    {
      if (v43)
      {
        [v42 addObject:&unk_26CC18CF0];
        [v42 addObject:&unk_26CC18D08];
      }
      [v42 addObject:&unk_26CC18D20];
    }
    id v81 = v10;
    if (v43)
    {
      [v42 addObject:&unk_26CC18D38];
      [v42 addObject:&unk_26CC18D50];
    }
    [v42 addObject:&unk_26CC18D68];
    [v42 addObject:&unk_26CC18D80];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v82 = v9;
    v44 = [v9 fileAssetInfoList];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v103 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      id v47 = 0;
      uint64_t v48 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v95 != v48) {
            objc_enumerationMutation(v44);
          }
          v50 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          v51 = [v50 assetURL];

          if (v51)
          {
            if (!v47) {
              id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            [v47 addObject:v50];
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v46);
    }
    else
    {
      id v47 = 0;
    }

    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_21;
    v92[3] = &unk_2643BF438;
    id v52 = v42;
    id v93 = v52;
    [v47 sortUsingComparator:v92];
    v53 = [v47 firstObject];
    if (v53)
    {
      id v80 = v52;
      id v20 = objc_alloc_init((Class)a1);
      v54 = [v53 assetURL];
      [v20 setAssetURL:v54];

      uint64_t v55 = [v53 flavorType];
      uint64_t v56 = [v47 count];
      if (v55 == 101 || v55 == 102 || v55 == 202 || v55 == 203 || v56 == 1) {
        uint64_t v61 = 2;
      }
      else {
        uint64_t v61 = 1;
      }
      [v20 setAssetQualityType:v61];
      v62 = [v53 fileExtension];
      [v20 setAssetPathExtension:v62];

      [v20 setIsCloudStreamingAsset:1];
      objc_msgSend(v20, "setOnlineSubscriptionKeysRequired:", objc_msgSend(v82, "onlineSubscriptionKeysRequired"));
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v63 = [v53 fairPlayInfoList];
      uint64_t v64 = [v63 countByEnumeratingWithState:&v88 objects:v102 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        id v66 = 0;
        uint64_t v67 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v65; ++j)
          {
            if (*(void *)v89 != v67) {
              objc_enumerationMutation(v63);
            }
            v69 = [*(id *)(*((void *)&v88 + 1) + 8 * j) purchaseBundleSinfDictionary];
            if ([v69 count])
            {
              if (!v66) {
                id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              [v66 addObject:v69];
            }
          }
          uint64_t v65 = [v63 countByEnumeratingWithState:&v88 objects:v102 count:16];
        }
        while (v65);
      }
      else
      {
        id v66 = 0;
      }

      id v10 = v81;
      if ([v66 count])
      {
        v100 = @"sinfs";
        id v101 = v66;
        v71 = [NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        [v20 setPurchaseBundleDictionary:v71];
      }
      uint64_t v72 = [v53 protectionType];
      if (v72 == 3) {
        uint64_t v73 = 2;
      }
      else {
        uint64_t v73 = v72 == 2;
      }
      [v20 setAssetProtectionType:v73];
      id v9 = v82;
      v74 = [v82 suzeLeaseID];
      [v20 setSuzeLeaseID:v74];
      [v20 setAllowsAssetInfoCaching:v74 == 0];
      uint64_t v75 = [v53 protectionType];
      if (!v74 && v75 != 4) {
        [v20 setAllowsAssetCaching:1];
      }
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_2;
      v85[3] = &unk_2643C5EE8;
      id v86 = v53;
      id v87 = v82;
      [v20 setWillBecomeActivePlayerItemHandler:v85];

      v41 = 0;
      id v52 = v80;
    }
    else
    {
      v70 = (void *)MEMORY[0x263F087E8];
      id v9 = v82;
      id v66 = [v82 fileAssetInfoList];
      v41 = objc_msgSend(v70, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 15, @"Playback response has no valid file asset: %@", v66);
      id v20 = 0;
      id v10 = v81;
    }

    a5 = v83;
  }
  int v76 = [v20 isHLSAsset];
  uint64_t v77 = [v10 preferredAudioAssetType];
  if (v76)
  {
    if (v77 < 2) {
      uint64_t v78 = 2;
    }
    else {
      uint64_t v78 = [v10 preferredAudioAssetType];
    }
  }
  else
  {
    uint64_t v78 = v77 != 0;
  }
  [v20 setAudioAssetType:v78];
  [v20 setSource:a5];
  if (a6) {
    *a6 = v41;
  }

  return v20;
}

uint64_t __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = NSNumber;
  id v7 = a3;
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "flavor"));
  unint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = NSNumber;
  uint64_t v12 = [v7 flavor];

  v13 = [v11 numberWithInteger:v12];
  unint64_t v14 = [v10 indexOfObject:v13];

  uint64_t v15 = -1;
  if (v9 >= v14) {
    uint64_t v15 = 1;
  }
  if (v9 == v14) {
    return 0;
  }
  else {
    return v15;
  }
}

uint64_t __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = NSNumber;
  id v7 = a3;
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "flavorType"));
  unint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = NSNumber;
  uint64_t v12 = [v7 flavorType];

  v13 = [v11 numberWithInteger:v12];
  unint64_t v14 = [v10 indexOfObject:v13];

  uint64_t v15 = -1;
  if (v9 >= v14) {
    uint64_t v15 = 1;
  }
  if (v9 == v14) {
    return 0;
  }
  else {
    return v15;
  }
}

void __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F12260] sharedCache];
  [v2 updateForPlaybackOfFileAsset:*(void *)(a1 + 32) fromResponse:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willBecomeActivePlayerItemHandler, 0);
  objc_storeStrong(&self->_suzeLeaseID, 0);
  objc_storeStrong((id *)&self->_alternateHLSKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_alternateHLSKeyServerURL, 0);
  objc_storeStrong((id *)&self->_alternateHLSPlaylistURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_streamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_purchaseBundleDictionary, 0);
  objc_storeStrong((id *)&self->_protectedContentSupportStorageFileURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);

  objc_storeStrong((id *)&self->_assetPathExtension, 0);
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setDownloadedAsset:(BOOL)a3
{
  self->_downloadedAsset = a3;
}

- (BOOL)isDownloadedAsset
{
  return self->_downloadedAsset;
}

- (void)setAudioAssetType:(int64_t)a3
{
  self->_audioAssetType = a3;
}

- (int64_t)audioAssetType
{
  return self->_audioAssetType;
}

- (void)setWillBecomeActivePlayerItemHandler:(id)a3
{
}

- (id)willBecomeActivePlayerItemHandler
{
  return self->_willBecomeActivePlayerItemHandler;
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_iTunesStoreStream = a3;
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (void)setSuzeLeaseID:(id)a3
{
}

- (id)suzeLeaseID
{
  return self->_suzeLeaseID;
}

- (void)setAlternateHLSKeyCertificateURL:(id)a3
{
}

- (NSURL)alternateHLSKeyCertificateURL
{
  return self->_alternateHLSKeyCertificateURL;
}

- (void)setAlternateHLSKeyServerURL:(id)a3
{
}

- (NSURL)alternateHLSKeyServerURL
{
  return self->_alternateHLSKeyServerURL;
}

- (void)setAlternateHLSPlaylistURL:(id)a3
{
}

- (NSURL)alternateHLSPlaylistURL
{
  return self->_alternateHLSPlaylistURL;
}

- (void)setStreamingKeyAdamID:(id)a3
{
}

- (NSNumber)streamingKeyAdamID
{
  return self->_streamingKeyAdamID;
}

- (void)setKeyServerProtocolType:(id)a3
{
}

- (NSString)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setStreamingKeyServerURL:(id)a3
{
}

- (NSURL)streamingKeyServerURL
{
  return self->_streamingKeyServerURL;
}

- (void)setStreamingKeyCertificateURL:(id)a3
{
}

- (NSURL)streamingKeyCertificateURL
{
  return self->_streamingKeyCertificateURL;
}

- (void)setPurchaseBundleDictionary:(id)a3
{
}

- (NSDictionary)purchaseBundleDictionary
{
  return self->_purchaseBundleDictionary;
}

- (void)setProtectedContentSupportStorageFileURL:(id)a3
{
}

- (NSURL)protectedContentSupportStorageFileURL
{
  return self->_protectedContentSupportStorageFileURL;
}

- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3
{
  self->_onlineSubscriptionKeysRequired = a3;
}

- (BOOL)onlineSubscriptionKeysRequired
{
  return self->_onlineSubscriptionKeysRequired;
}

- (void)setIsCloudStreamingAsset:(BOOL)a3
{
  self->_isCloudStreamingAsset = a3;
}

- (BOOL)isCloudStreamingAsset
{
  return self->_isCloudStreamingAsset;
}

- (void)setIsHLSAsset:(BOOL)a3
{
  self->_isHLSAsset = a3;
}

- (BOOL)isHLSAsset
{
  return self->_isHLSAsset;
}

- (void)setIsHomeSharingAsset:(BOOL)a3
{
  self->_isHomeSharingAsset = a3;
}

- (BOOL)isHomeSharingAsset
{
  return self->_isHomeSharingAsset;
}

- (void)setAssetURL:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetQualityType:(int64_t)a3
{
  self->_assetQualityType = a3;
}

- (int64_t)assetQualityType
{
  return self->_assetQualityType;
}

- (void)setAssetProtectionType:(int64_t)a3
{
  self->_assetProtectionType = a3;
}

- (int64_t)assetProtectionType
{
  return self->_assetProtectionType;
}

- (void)setAssetPathExtension:(id)a3
{
}

- (NSString)assetPathExtension
{
  return self->_assetPathExtension;
}

- (void)setAllowsAssetInfoCaching:(BOOL)a3
{
  self->_allowsAssetInfoCaching = a3;
}

- (BOOL)allowsAssetInfoCaching
{
  return self->_allowsAssetInfoCaching;
}

- (void)setAllowsAssetCaching:(BOOL)a3
{
  self->_allowsAssetCaching = a3;
}

- (BOOL)allowsAssetCaching
{
  return self->_allowsAssetCaching;
}

- (id)descriptionDictionary
{
  v55[7] = *MEMORY[0x263EF8340];
  v54 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v3 = NSString;
  if ([(MPCModelGenericAVItemAssetLoadResult *)self allowsAssetCaching]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v53 = [v3 stringWithFormat:@"allows caching: %@", v4];
  v55[0] = v53;
  v5 = NSString;
  if ([(MPCModelGenericAVItemAssetLoadResult *)self isHLSAsset]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  id v52 = [v5 stringWithFormat:@"HLS: %@", v6];
  v55[1] = v52;
  id v7 = NSString;
  if ([(MPCModelGenericAVItemAssetLoadResult *)self isCloudStreamingAsset]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  unint64_t v9 = [v7 stringWithFormat:@"cloud streaming: %@", v8];
  v55[2] = v9;
  id v10 = NSString;
  if ([(MPCModelGenericAVItemAssetLoadResult *)self onlineSubscriptionKeysRequired]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  uint64_t v12 = [v10 stringWithFormat:@"online keys required: %@", v11];
  v55[3] = v12;
  v13 = NSString;
  uint64_t v14 = [(MPCModelGenericAVItemAssetLoadResult *)self assetPathExtension];
  uint64_t v15 = (void *)v14;
  v16 = @"N/A";
  if (v14) {
    v16 = (__CFString *)v14;
  }
  id v17 = [v13 stringWithFormat:@"path extension: %@", v16];
  v55[4] = v17;
  v18 = NSString;
  int64_t v19 = [(MPCModelGenericAVItemAssetLoadResult *)self audioAssetType];
  if ((unint64_t)(v19 - 1) > 4) {
    id v20 = @"Unspecified";
  }
  else {
    id v20 = off_2643BF458[v19 - 1];
  }
  v21 = [v18 stringWithFormat:@"audio asset type: %@", v20];
  v55[5] = v21;
  v22 = NSString;
  if ([(MPCModelGenericAVItemAssetLoadResult *)self isDownloadedAsset]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  v24 = [v22 stringWithFormat:@"downloaded: %@", v23];
  v55[6] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:7];

  v26 = [v25 componentsJoinedByString:@" - "];
  [v54 setObject:v26 forKeyedSubscript:@"Overview"];

  uint64_t v27 = [(MPCModelGenericAVItemAssetLoadResult *)self purchaseBundleDictionary];

  if (v27)
  {
    v28 = [(MPCModelGenericAVItemAssetLoadResult *)self purchaseBundleDictionary];
    [v54 setObject:v28 forKeyedSubscript:@"Purchase bundle dictionary"];
  }
  v29 = [(MPCModelGenericAVItemAssetLoadResult *)self assetURL];
  if (v29
    || ([(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSPlaylistURL],
        (v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v50 = [(MPCModelGenericAVItemAssetLoadResult *)self protectedContentSupportStorageFileURL];

    if (!v50) {
      goto LABEL_27;
    }
  }
  v30 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v31 = [(MPCModelGenericAVItemAssetLoadResult *)self assetURL];
  [v30 setObject:v31 forKeyedSubscript:@"assetURL"];

  v32 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSPlaylistURL];
  [v30 setObject:v32 forKeyedSubscript:@"alt. HLS playlist URL"];

  v33 = [(MPCModelGenericAVItemAssetLoadResult *)self protectedContentSupportStorageFileURL];
  [v30 setObject:v33 forKeyedSubscript:@"protected content support storage URL"];

  [v54 setObject:v30 forKeyedSubscript:@"URLs"];
LABEL_27:
  v34 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyCertificateURL];
  if (v34
    || ([(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyCertificateURL],
        (v34 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyServerURL],
        (v34 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v51 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyServerURL];

    if (!v51) {
      goto LABEL_44;
    }
  }
  v35 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  v36 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyCertificateURL];

  if (v36)
  {
    v37 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyCertificateURL];
    [v35 setObject:v37 forKeyedSubscript:@"key certificate URL"];
  }
  uint64_t v38 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyServerURL];

  if (v38)
  {
    v39 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyServerURL];
    [v35 setObject:v39 forKeyedSubscript:@"key server URL"];
  }
  uint64_t v40 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyCertificateURL];

  if (v40)
  {
    v41 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyCertificateURL];
    [v35 setObject:v41 forKeyedSubscript:@"alt. HLS key certificate URL"];
  }
  id v42 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyServerURL];

  if (v42)
  {
    int v43 = [(MPCModelGenericAVItemAssetLoadResult *)self alternateHLSKeyServerURL];
    [v35 setObject:v43 forKeyedSubscript:@"alt. HLS key server URL"];
  }
  v44 = [(MPCModelGenericAVItemAssetLoadResult *)self keyServerProtocolType];

  if (v44)
  {
    uint64_t v45 = [(MPCModelGenericAVItemAssetLoadResult *)self keyServerProtocolType];
    [v35 setObject:v45 forKeyedSubscript:@"key server protocol type"];
  }
  uint64_t v46 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyAdamID];

  if (v46)
  {
    id v47 = [(MPCModelGenericAVItemAssetLoadResult *)self streamingKeyAdamID];
    [v35 setObject:v47 forKeyedSubscript:@"streaming key adam ID"];
  }
  [v54 setObject:v35 forKeyedSubscript:@"SKD"];

LABEL_44:
  uint64_t v48 = (void *)[v54 copy];

  return v48;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCModelGenericAVItemAssetLoadResult *)self descriptionDictionary];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (BOOL)hasValidAsset
{
  id v2 = [(MPCModelGenericAVItemAssetLoadResult *)self assetURL];
  BOOL v3 = v2 != 0;

  return v3;
}

@end