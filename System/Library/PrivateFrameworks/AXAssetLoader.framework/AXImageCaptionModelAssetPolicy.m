@interface AXImageCaptionModelAssetPolicy
+ (id)assertionForNewsestCompatibleImageCaptionModelAssetWithStage:(id)a3 language:(id)a4 clientIdentifier:(id)a5;
+ (int64_t)maximumCompatibilityVersion;
+ (int64_t)minimumCompatibilityVersion;
- (BOOL)daemonShouldDownloadInBackgroundIfNeeded;
- (id)assetType;
- (id)assetsToDownloadFromRefreshedAssets:(id)a3;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)launchActivityIdentifier;
- (void)_partitionAssets:(id)a3 intoValidAssets:(id)a4 invalidAssets:(id)a5;
@end

@implementation AXImageCaptionModelAssetPolicy

+ (id)assertionForNewsestCompatibleImageCaptionModelAssetWithStage:(id)a3 language:(id)a4 clientIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  [(AXImageCaptionModelAssetAssertion *)v10 setAssertionType:1];
  [(AXImageCaptionModelAssetAssertion *)v10 setClientIdentifier:v7];

  [(AXImageCaptionModelAssetAssertion *)v10 setModelStage:v9];
  [(AXImageCaptionModelAssetAssertion *)v10 setModelLanguage:v8];

  return v10;
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.ImageCaptionModel.LaunchActivity";
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return 1;
}

+ (int64_t)minimumCompatibilityVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[AXAssetMetadataStore store];
  v3 = [v2 overrideMinimumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.ImageCaptionModel"];

  if (v3)
  {
    v4 = AXLogAssetLoader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412802;
      id v8 = @"com.apple.MobileAsset.ImageCaptionModel";
      __int16 v9 = 2048;
      uint64_t v10 = 7;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 integerValue];
      _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_INFO, "Asset type [%@] default minimumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", (uint8_t *)&v7, 0x20u);
    }

    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v5 = 7;
  }

  return v5;
}

+ (int64_t)maximumCompatibilityVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[AXAssetMetadataStore store];
  v3 = [v2 overrideMaximumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.ImageCaptionModel"];

  if (v3)
  {
    v4 = AXLogAssetLoader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412802;
      id v8 = @"com.apple.MobileAsset.ImageCaptionModel";
      __int16 v9 = 2048;
      uint64_t v10 = 9;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 integerValue];
      _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_INFO, "Asset type [%@] default maximumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", (uint8_t *)&v7, 0x20u);
    }

    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v5 = 9;
  }

  return v5;
}

- (id)assetType
{
  return @"com.apple.MobileAsset.ImageCaptionModel";
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  v4 = +[AXAssetMetadataStore store];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  int v7 = [(AXImageCaptionModelAssetPolicy *)self assetType];
  v48 = v4;
  id v8 = [v4 heldAssertionsForAssetType:v7];
  v51 = (void *)v5;
  v46 = (void *)v6;
  +[AXImageCaptionModelAssetAssertion partitionAssertionsWithPropertyListRepresentations:v8 intoVersionLockedAssertions:v5 upgradableAssertions:v6];

  __int16 v9 = AXLogAssetLoader();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC53F000, v9, OS_LOG_TYPE_INFO, "Will evaluate installed ImageCaptionModel assets for items to purge", buf, 2u);
  }

  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  v53 = [MEMORY[0x1E4F1CA80] set];
  v47 = (void *)v11;
  [(AXImageCaptionModelAssetPolicy *)self _partitionAssets:v49 intoValidAssets:v10 invalidAssets:v11];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = v10;
  uint64_t v52 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v14 = v51;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (!v15)
        {

          continue;
        }
        uint64_t v16 = v15;
        uint64_t v54 = i;
        uint64_t v17 = *(void *)v67;
        v56 = v13;
        uint64_t v59 = *(void *)v67;
        v60 = v14;
        while (2)
        {
          uint64_t v18 = 0;
          uint64_t v61 = v16;
          do
          {
            if (*(void *)v67 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v66 + 1) + 8 * v18);
            v20 = [v19 modelVersion];
            v21 = [v19 modelStage];
            uint64_t v22 = [v19 modelLanguage];
            v23 = (void *)v22;
            if (v20) {
              BOOL v24 = v21 == 0;
            }
            else {
              BOOL v24 = 1;
            }
            if (!v24 && v22 != 0)
            {
              v26 = [v13 imageCaptionModel];
              v27 = [v26 stage];
              if (![v21 isEqualToString:v27]) {
                goto LABEL_25;
              }
              v28 = [v13 imageCaptionModel];
              v29 = [v28 language];
              if (![v23 isEqualToString:v29])
              {

                uint64_t v17 = v59;
                id v14 = v60;
LABEL_25:

                uint64_t v16 = v61;
                goto LABEL_26;
              }
              v57 = [v13 imageCaptionModel];
              v30 = [v57 version];
              uint64_t v58 = [v20 compare:v30 options:64];

              uint64_t v13 = v56;
              uint64_t v17 = v59;
              id v14 = v60;
              uint64_t v16 = v61;
              if (!v58)
              {
                v31 = AXLogAssetLoader();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v76 = v56;
                  __int16 v77 = 2112;
                  v78 = v19;
                  _os_log_impl(&dword_1DC53F000, v31, OS_LOG_TYPE_INFO, "  WIll not purge asset [%@]. Protected by assertion: %@", buf, 0x16u);
                }

                [v53 addObject:v56];
                goto LABEL_32;
              }
            }
LABEL_26:

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v66 objects:v79 count:16];
          if (v16) {
            continue;
          }
          break;
        }

LABEL_32:
        uint64_t i = v54;
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v52);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v33 = v46;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        v39 = [obj allObjects];
        v40 = [v38 modelStage];
        v41 = [v38 modelLanguage];
        v42 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v39 withStage:v40 language:v41 isInstalled:1 isDownloadable:0];

        if (v42) {
          [v53 addObject:v42];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v35);
  }

  v43 = [MEMORY[0x1E4F1CA80] set];
  [v43 unionSet:v47];
  [v43 unionSet:obj];
  [v43 minusSet:v53];
  v44 = [v43 allObjects];

  return v44;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  v4 = AXLogAssetLoader();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_INFO, "Will evaluate downloadable ImageCaptionModel assets for items to download", buf, 2u);
  }

  uint64_t v5 = +[AXAssetMetadataStore store];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(AXImageCaptionModelAssetPolicy *)self assetType];
  uint64_t v52 = v5;
  __int16 v9 = [v5 heldAssertionsForAssetType:v8];
  v56 = (void *)v6;
  v51 = (void *)v7;
  +[AXImageCaptionModelAssetAssertion partitionAssertionsWithPropertyListRepresentations:v9 intoVersionLockedAssertions:v6 upgradableAssertions:v7];

  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = +[AXAsset downloadableAssets:v53];
  [(AXImageCaptionModelAssetPolicy *)self _partitionAssets:v11 intoValidAssets:v10 invalidAssets:0];

  uint64_t v54 = [MEMORY[0x1E4F1CA80] set];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v10;
  uint64_t v57 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v75 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v14 = v56;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v58 = i;
          uint64_t v17 = *(void *)v71;
          v60 = v13;
          uint64_t v62 = *(void *)v71;
          long long v63 = v14;
          while (2)
          {
            uint64_t v18 = 0;
            id v64 = (id)v16;
            do
            {
              if (*(void *)v71 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v70 + 1) + 8 * v18);
              v20 = [v19 modelVersion];
              v21 = [v19 modelStage];
              uint64_t v22 = [v19 modelLanguage];
              v23 = (void *)v22;
              if (v20) {
                BOOL v24 = v21 == 0;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24 && v22 != 0)
              {
                v26 = [v13 imageCaptionModel];
                v27 = [v26 stage];
                if ([v21 isEqualToString:v27])
                {
                  v28 = [v13 imageCaptionModel];
                  v29 = [v28 language];
                  if ([v23 isEqualToString:v29])
                  {
                    uint64_t v61 = [v13 imageCaptionModel];
                    v30 = [v61 version];
                    BOOL v31 = [v20 compare:v30 options:64] == 0;

                    uint64_t v13 = v60;
                  }
                  else
                  {
                    BOOL v31 = 0;
                  }

                  uint64_t v17 = v62;
                  id v14 = v63;
                  uint64_t v16 = (uint64_t)v64;
                  if (v31)
                  {

                    [v54 addObject:v13];
                    goto LABEL_30;
                  }
                }
                else
                {

                  uint64_t v16 = (uint64_t)v64;
                }
              }

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v70 objects:v80 count:16];
            if (v16) {
              continue;
            }
            break;
          }

LABEL_30:
          uint64_t i = v58;
        }
        else
        {
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v57);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v65 = v51;
  uint64_t v32 = [v65 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v67 != v34) {
          objc_enumerationMutation(v65);
        }
        uint64_t v36 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        v37 = [obj allObjects];
        v38 = [v36 modelStage];
        v39 = [v36 modelLanguage];
        v40 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v37 withStage:v38 language:v39 isInstalled:0 isDownloadable:1];

        if (v40)
        {
          v41 = [v36 modelStage];
          v42 = [v36 modelLanguage];
          v43 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v53 withStage:v41 language:v42 isInstalled:1 isDownloadable:0];

          if (!v43) {
            goto LABEL_42;
          }
          v44 = [v40 imageCaptionModel];
          v45 = [v44 version];
          v46 = [v43 imageCaptionModel];
          v47 = [v46 version];
          uint64_t v48 = [v45 compare:v47 options:64];

          if (v48 == 1) {
LABEL_42:
          }
            [v54 addObject:v40];
        }
      }
      uint64_t v33 = [v65 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v33);
  }

  id v49 = [v54 allObjects];

  return v49;
}

- (void)_partitionAssets:(id)a3 intoValidAssets:(id)a4 invalidAssets:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  id v8 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v13 imageCaptionModel];
        uint64_t v15 = v8;
        if (v14)
        {
          uint64_t v16 = [v14 version];
          uint64_t v15 = v8;
          if (v16)
          {
            uint64_t v17 = [v14 stage];
            if (v17)
            {
              uint64_t v18 = (void *)v17;
              v19 = [v14 language];

              if (v19) {
                uint64_t v15 = v20;
              }
              else {
                uint64_t v15 = v8;
              }
            }
            else
            {

              uint64_t v15 = v8;
            }
          }
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

@end