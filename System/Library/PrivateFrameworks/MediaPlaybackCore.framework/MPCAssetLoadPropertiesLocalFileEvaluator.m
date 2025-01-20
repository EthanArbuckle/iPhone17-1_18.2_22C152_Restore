@interface MPCAssetLoadPropertiesLocalFileEvaluator
- (BOOL)_shouldUpgradeCacheOnPlay:(id)a3 assetCachingIsAllowed:(BOOL)a4;
- (BOOL)_shouldUpgradeDownloadOnPlay:(id)a3 defaults:(id)a4;
- (BOOL)isHLSFileAsset:(id)a3;
- (MPCAssetLoadPropertiesLocalFileEvaluator)initWithPlaybackEngine:(id)a3;
- (MPCPlaybackEngine)playbackEngine;
- (id)evaluateAssetLoadProperties:(id)a3 allowingCachedAssets:(BOOL)a4 defaults:(id)a5;
- (int64_t)_loadedAudioAssetTypeForFileAsset:(id)a3;
- (int64_t)_recommendationForEvaluation:(id)a3 assetCachingIsAllowed:(BOOL)a4 userDefaults:(id)a5;
@end

@implementation MPCAssetLoadPropertiesLocalFileEvaluator

- (void).cxx_destruct
{
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (BOOL)_shouldUpgradeCacheOnPlay:(id)a3 assetCachingIsAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 fileIsDownloaded])
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v8 = [v6 status] == 3 || objc_msgSend(v6, "status") == 2;
    if ([v6 fileIsCached]) {
      int v9 = [v6 fileShouldBeUpdated];
    }
    else {
      int v9 = 0;
    }
    BOOL v7 = v4 & (v8 | v9);
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138544386;
      v13 = self;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      __int16 v16 = 1024;
      BOOL v17 = v8;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = v4 & (v8 | v9);
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Caching decision process - assetCachingIsAllowed: %{BOOL}u - localFileDoesNotExist: %{BOOL}u - localFileIsCachedAndNeedsUpdating: %{BOOL}u => shouldUpgradeCacheOnPlay:%{BOOL}u.", (uint8_t *)&v12, 0x24u);
    }
  }
  return v7;
}

- (BOOL)_shouldUpgradeDownloadOnPlay:(id)a3 defaults:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 fileIsDownloaded]) {
    int v8 = [v6 fileShouldBeUpdated];
  }
  else {
    int v8 = 0;
  }
  int v9 = [v7 prefersSpatialDownloads];
  uint64_t v10 = [v7 preferredMusicDownloadResolution];

  int v11 = _os_feature_enabled_impl();
  if (v10 > 47999) {
    int v12 = 1;
  }
  else {
    int v12 = v9;
  }
  int v13 = v8 & v12;
  if (v11) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }
  BOOL v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138544898;
    __int16 v18 = self;
    __int16 v19 = 1024;
    int v20 = _os_feature_enabled_impl();
    __int16 v21 = 1024;
    int v22 = [v6 fileIsDownloaded];
    __int16 v23 = 1024;
    int v24 = [v6 fileShouldBeUpdated];
    __int16 v25 = 1024;
    int v26 = v9;
    __int16 v27 = 1024;
    BOOL v28 = v10 > 47999;
    __int16 v29 = 1024;
    BOOL v30 = v14;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Upgrade on play decision process - upgradeOnPlay enabled: %{BOOL}u - localFileIsDownloaded: %{BOOL}u - localFileShouldBeUpdated: %{BOOL}u - userExpectsSpatialDownload: %{BOOL}u - userExpectsLosslessDownload: %{BOOL}u => shouldUpgradeDownloadOnPlay: %{BOOL}u.", (uint8_t *)&v17, 0x30u);
  }

  return v14;
}

- (int64_t)_recommendationForEvaluation:(id)a3 assetCachingIsAllowed:(BOOL)a4 userDefaults:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(MPCAssetLoadPropertiesLocalFileEvaluator *)self _shouldUpgradeCacheOnPlay:v8 assetCachingIsAllowed:v6])
  {
    int64_t v10 = 1;
  }
  else
  {
    BOOL v11 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)self _shouldUpgradeDownloadOnPlay:v8 defaults:v9];
    uint64_t v12 = 3;
    if (!v6) {
      uint64_t v12 = 0;
    }
    if (v11) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = v12;
    }
  }

  return v10;
}

- (BOOL)isHLSFileAsset:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 filePath];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    BOOL v6 = [v3 filePath];
    id v7 = [v6 pathExtension];

    if (v7)
    {
      id v8 = MSVOfflineHLSFileExtensions();
      LOBYTE(v5) = [v8 containsObject:v7];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int64_t)_loadedAudioAssetTypeForFileAsset:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 isNonPurgeable];
  if ([(MPCAssetLoadPropertiesLocalFileEvaluator *)self isHLSFileAsset:v4])
  {
    char v6 = [v4 traits];
    os_log_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_28:

      uint64_t v20 = 4;
      uint64_t v21 = 5;
      if ((v6 & 4) == 0) {
        uint64_t v21 = 2;
      }
      if ((v6 & 2) == 0) {
        uint64_t v20 = v21;
      }
      if ((v6 & 0x38) != 0) {
        int64_t v14 = 3;
      }
      else {
        int64_t v14 = v20;
      }
      goto LABEL_35;
    }
    if (v5) {
      id v8 = @"Downloaded";
    }
    else {
      id v8 = @"Cached";
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
    if (v6)
    {
      BOOL v15 = [NSString stringWithFormat:@"adm"];
      [v9 addObject:v15];

      if ((v6 & 2) == 0)
      {
LABEL_8:
        if ((v6 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_22;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_8;
    }
    __int16 v16 = [NSString stringWithFormat:@"lossless"];
    [v9 addObject:v16];

    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
LABEL_22:
    int v17 = [NSString stringWithFormat:@"high-res lossless"];
    [v9 addObject:v17];

    if ((v6 & 8) == 0)
    {
LABEL_10:
      if ((v6 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
LABEL_23:
    __int16 v18 = [NSString stringWithFormat:@"spatial"];
    [v9 addObject:v18];

    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 0x20) == 0)
      {
LABEL_13:
        if ([v9 count])
        {
          BOOL v11 = [v9 componentsJoinedByString:@", "];
        }
        else
        {
          BOOL v11 = @"None";
        }

        int v23 = 138543874;
        int v24 = self;
        __int16 v25 = 2114;
        int v26 = v8;
        __int16 v27 = 2114;
        BOOL v28 = v11;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@ file is HLS file - Traits: %{public}@", (uint8_t *)&v23, 0x20u);

        goto LABEL_28;
      }
LABEL_12:
      int64_t v10 = [NSString stringWithFormat:@"surround"];
      [v9 addObject:v10];

      goto LABEL_13;
    }
LABEL_24:
    __int16 v19 = [NSString stringWithFormat:@"atmos"];
    [v9 addObject:v19];

    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = @"Cached";
    if (v5) {
      int v13 = @"Downloaded";
    }
    int v23 = 138543618;
    int v24 = self;
    __int16 v25 = 2114;
    int v26 = v13;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@ file is CRABS", (uint8_t *)&v23, 0x16u);
  }

  int64_t v14 = 1;
LABEL_35:

  return v14;
}

- (id)evaluateAssetLoadProperties:(id)a3 allowingCachedAssets:(BOOL)a4 defaults:(id)a5
{
  BOOL v6 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [MPCAssetLoadPropertiesLocalFileEvaluation alloc];
  BOOL v11 = [v8 fileAsset];
  uint64_t v12 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v10 initWithFileAsset:v11];

  [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:0];
  -[MPCAssetLoadPropertiesLocalFileEvaluation setHLSContentPolicy:](v12, "setHLSContentPolicy:", [v8 HLSContentPolicy]);
  int v13 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAsset];
  int64_t v14 = v13;
  if (v13)
  {
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileIsDownloaded:](v12, "setFileIsDownloaded:", [v13 isNonPurgeable]);
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileIsCached:](v12, "setFileIsCached:", [v14 isNonPurgeable] ^ 1);
    BOOL v15 = [v14 filePath];
    if (![v15 length])
    {
      uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [Missing cached or downloaded file]", buf, 0xCu);
      }

      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:3];
      int64_t v18 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)self _recommendationForEvaluation:v12 assetCachingIsAllowed:v6 userDefaults:v9];
      int v17 = v12;
      goto LABEL_14;
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFilePath:v15];
    if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsCached] && !v6)
    {
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [Cached assets not allowed]", buf, 0xCu);
      }

      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:5];
      int v17 = v12;
      int64_t v18 = 0;
LABEL_14:
      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v17 setRecommendation:v18];
LABEL_41:

      goto LABEL_42;
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileIsHLS:[(MPCAssetLoadPropertiesLocalFileEvaluator *)self isHLSFileAsset:v14]];
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileAssetType:[(MPCAssetLoadPropertiesLocalFileEvaluator *)self _loadedAudioAssetTypeForFileAsset:v14]];
    -[MPCAssetLoadPropertiesLocalFileEvaluation setExpectedAssetType:](v12, "setExpectedAssetType:", [v8 preferredAudioAssetType]);
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileQualityType:](v12, "setFileQualityType:", [v14 qualityType]);
    if ([v8 prefersHighQualityContent]) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setExpectedQualityType:v21];
    if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS]
      && [v8 HLSContentPolicy] == 3)
    {
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
      if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS]) {
        goto LABEL_29;
      }
    }
    int v23 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)self playbackEngine];
    if ([v23 isVocalAttenuationEnabled])
    {
      int v24 = [v8 supportsVocalAttenuation];

      if (v24)
      {
        __int16 v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [vocal attenuation enabled for supported item]", buf, 0xCu);
        }

        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:0];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredFileFormat:0];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:7];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:0];
        int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    else
    {
    }
LABEL_29:
    BOOL v57 = v6;
    __int16 v27 = [v8 storeAsset];
    if ([v27 endpointType] == 2)
    {

      goto LABEL_33;
    }
    int v28 = v22;
    uint64_t v29 = [v8 storeAsset];
    BOOL v30 = self;
    uint64_t v31 = v15;
    id v32 = v9;
    uint64_t v33 = [v29 endpointType];

    BOOL v34 = v33 == 1;
    id v9 = v32;
    BOOL v15 = v31;
    self = v30;
    if (v34)
    {
LABEL_33:
      v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Local file asset is usable as is [Purchased or matched content]", buf, 0xCu);
      }

      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredFileFormat:1];
      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:1];
      if (v57) {
        uint64_t v36 = 3;
      }
      else {
        uint64_t v36 = 0;
      }
      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:v36];
      int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    uint64_t v39 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType];
    uint64_t v40 = v39;
    if (v39 < 2 || [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS])
    {
      int v41 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS];
      if (v40 < 2) {
        int v42 = v41;
      }
      else {
        int v42 = 0;
      }
    }
    else
    {
      int v42 = 1;
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredFileFormat:v42 ^ 1u];
    if (v28)
    {
      if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAssetType] >= 2
        && [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType] == 1)
      {
        v43 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v30;
          _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Local HLS asset of compatible quality [HLS file for CRABS desired playback] - Overriding HLSPolicyContentForbidden", buf, 0xCu);
        }

        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:1];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:[(MPCAssetLoadPropertiesLocalFileEvaluator *)v30 _recommendationForEvaluation:v12 assetCachingIsAllowed:v57 userDefaults:v9]];
        int v26 = _MPCLogCategoryPlayback();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
      }
      else
      {
        v47 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v30;
          _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [HLS file not allowed for playback]", buf, 0xCu);
        }

        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:0];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredFileFormat:0];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:6];
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:[(MPCAssetLoadPropertiesLocalFileEvaluator *)v30 _recommendationForEvaluation:v12 assetCachingIsAllowed:v57 userDefaults:v9]];
        int v26 = _MPCLogCategoryPlayback();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
      }
      goto LABEL_39;
    }
    v44 = [v14 hlsKeyServerURL];
    if ([v44 length])
    {
      v45 = [v14 hlsKeyCertificateURL];
      BOOL v46 = [v45 length] != 0;
    }
    else
    {
      BOOL v46 = 0;
    }

    if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS] && !v46)
    {
      v48 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [HLS file with missing hls keys]", buf, 0xCu);
      }

      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:4];
      [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:[(MPCAssetLoadPropertiesLocalFileEvaluator *)self _recommendationForEvaluation:v12 assetCachingIsAllowed:v57 userDefaults:v9]];
      int v26 = _MPCLogCategoryPlayback();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
LABEL_39:
      v37 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 humanDescription];
      *(_DWORD *)buf = 138543618;
      v59 = self;
      __int16 v60 = 2114;
      v61 = v37;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@", buf, 0x16u);

LABEL_40:
      goto LABEL_41;
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:1];
    BOOL v49 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsHLS];
    char v50 = _os_feature_enabled_impl();
    if (v49)
    {
      if ((v50 & 1) == 0 && [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsDownloaded])
      {
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
        v51 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Downloaded asset matches quality [Upgrade on play is off]";
LABEL_94:
          _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
          goto LABEL_95;
        }
        goto LABEL_95;
      }
      if (![(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileMatchesRequiredFileFormat])
      {
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:0];
        if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAssetType] >= 2
          && [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType] == 1)
        {
          [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
          v51 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v59 = self;
            v52 = "[AL] - %{public}@: [Asset caching] - Local HLS asset of compatible quality [HLS file for CRABS desired"
                  " playback] - Overriding file format mismatch";
            goto LABEL_94;
          }
          goto LABEL_95;
        }
        if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAssetType] >= 2
          && ![(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType])
        {
          [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
          v51 = _MPCLogCategoryPlayback();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_95;
          }
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Unexpected combination local HLS file for unspecified requirement ["
                "HLS file for non-specified desired playback] - Overriding file format mismatch";
          goto LABEL_94;
        }
LABEL_103:
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:[(MPCAssetLoadPropertiesLocalFileEvaluator *)self _recommendationForEvaluation:v12 assetCachingIsAllowed:v57 userDefaults:v9]];
        int v26 = _MPCLogCategoryPlayback();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAssetType] >= 3
        && [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType] == 2)
      {
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
        v51 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Local asset of acceptable quality [Higher than desired quality]";
          goto LABEL_94;
        }
        goto LABEL_95;
      }
      uint64_t v55 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileAssetType];
      BOOL v54 = v55 == [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedAssetType];
    }
    else
    {
      if ((v50 & 1) == 0 && [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileIsDownloaded])
      {
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:1];
        v51 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Downloaded asset matches quality [Upgrade on play is off]";
          goto LABEL_94;
        }
LABEL_95:

        goto LABEL_103;
      }
      if (![(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileMatchesRequiredFileFormat])
      {
        [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:0];
        v51 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Local asset of incorrect quality [File format differs from requirements]";
          goto LABEL_94;
        }
        goto LABEL_95;
      }
      uint64_t v53 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileQualityType];
      if (v53 == [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedQualityType])
      {
        BOOL v54 = 1;
      }
      else
      {
        uint64_t v56 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 fileQualityType];
        BOOL v54 = v56 > [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 expectedQualityType];
      }
    }
    [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setFileMatchesRequiredQuality:v54];
    goto LABEL_103;
  }
  __int16 v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = self;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [No cached or downloaded file]", buf, 0xCu);
  }

  [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setStatus:2];
  [(MPCAssetLoadPropertiesLocalFileEvaluation *)v12 setRecommendation:v6];
LABEL_42:

  return v12;
}

- (MPCAssetLoadPropertiesLocalFileEvaluator)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCAssetLoadPropertiesLocalFileEvaluator;
  int v5 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)&v8 init];
  BOOL v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
  }

  return v6;
}

@end