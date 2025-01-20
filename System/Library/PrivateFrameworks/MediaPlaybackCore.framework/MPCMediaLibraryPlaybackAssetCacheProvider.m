@interface MPCMediaLibraryPlaybackAssetCacheProvider
+ (id)_downloadedAssetDestinationDirectoryForMediaLibrary:(id)a3;
+ (id)_highQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3;
+ (id)_lowQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3;
+ (id)deviceLibraryProviderWithUserIdentity:(id)a3;
+ (uint64_t)_increaseDailyAssetDownloadKB:(uint64_t)a1;
+ (void)_sendDailyTotalDownloadSizeEventWithDays:(uint64_t)a3 sizeInKB:;
- (BOOL)isUnderDailyCacheAssetDownloadLimit;
- (id)_initWithMediaLibrary:(id)a3;
- (int64_t)_persistentIDForModelObject:(id)a3;
- (void)clearPlaybackAssetCacheFileAssetForGenericObject:(id)a3 withCompletionHandler:(id)a4;
- (void)didCacheNewAssetToDestinationURL:(id)a3;
- (void)getPlaybackAssetDestinationURL:(id *)a3 sharedCacheURL:(id *)a4 purgeable:(BOOL)a5 purchaseBundleDestinationURL:(id *)a6 assetQualityType:(int64_t)a7 fileName:(id)a8 pathExtension:(id)a9;
- (void)setPlaybackAssetCacheFileAsset:(id)a3 forGenericObject:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MPCMediaLibraryPlaybackAssetCacheProvider

- (void).cxx_destruct
{
}

+ (id)deviceLibraryProviderWithUserIdentity:(id)a3
{
  v3 = [MEMORY[0x263F11E40] deviceMediaLibraryWithUserIdentity:a3];
  id v4 = [[MPCMediaLibraryPlaybackAssetCacheProvider alloc] _initWithMediaLibrary:v3];

  return v4;
}

- (id)_initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaLibraryPlaybackAssetCacheProvider;
  v6 = [(MPCMediaLibraryPlaybackAssetCacheProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
  }

  return v7;
}

- (int64_t)_persistentIDForModelObject:(id)a3
{
  v3 = [a3 flattenedGenericObject];
  uint64_t v4 = [v3 type];
  switch(v4)
  {
    case 9:
      id v5 = [v3 movie];
      break;
    case 6:
      id v5 = [v3 tvEpisode];
      break;
    case 1:
      id v5 = [v3 song];
      break;
    default:
      int64_t v9 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  v7 = [v5 identifiers];
  v8 = [v7 library];
  int64_t v9 = [v8 persistentID];

LABEL_9:
  return v9;
}

- (void)didCacheNewAssetToDestinationURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  [v3 path];
  v22 = id v29 = 0;
  v23 = v4;
  id v5 = objc_msgSend(v4, "attributesOfItemAtPath:error:");
  id v6 = v29;
  if (v5)
  {
    v7 = [v5 objectForKey:*MEMORY[0x263F080D8]];
    if ([v7 isEqualToString:*MEMORY[0x263F080E0]])
    {
      v8 = [v23 enumeratorAtPath:v22];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (!v9)
      {

LABEL_15:
        goto LABEL_16;
      }
      uint64_t v10 = v9;
      v19 = v7;
      v20 = v5;
      id v21 = v3;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v26;
      uint64_t v13 = *MEMORY[0x263F080B8];
      do
      {
        uint64_t v14 = 0;
        v15 = v6;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v8);
          }
          v16 = objc_msgSend(v22, "stringByAppendingPathComponent:", *(void *)(*((void *)&v25 + 1) + 8 * v14), v19, v20, v21);
          id v24 = v15;
          v17 = [v23 attributesOfItemAtPath:v16 error:&v24];
          id v6 = v24;

          v18 = [v17 objectForKey:v13];
          v11 += [v18 longLongValue];

          ++v14;
          v15 = v6;
        }
        while (v10 != v14);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
      id v5 = v20;
      id v3 = v21;
      v7 = v19;
    }
    else
    {
      v8 = [v5 objectForKey:*MEMORY[0x263F080B8]];
      unint64_t v11 = [v8 longLongValue];
    }

    if (v11) {
      +[MPCMediaLibraryPlaybackAssetCacheProvider _increaseDailyAssetDownloadKB:]((uint64_t)MPCMediaLibraryPlaybackAssetCacheProvider, (int)(v11 / 0x3E8));
    }
    goto LABEL_15;
  }
LABEL_16:
}

+ (uint64_t)_increaseDailyAssetDownloadKB:(uint64_t)a1
{
  v25[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  uint64_t v4 = [MEMORY[0x263EFF910] now];
  [v4 timeIntervalSince1970];
  uint64_t v6 = (uint64_t)v5 / 86400;

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __75__MPCMediaLibraryPlaybackAssetCacheProvider__increaseDailyAssetDownloadKB___block_invoke;
  v19 = &__block_descriptor_48_e5_v8__0l;
  uint64_t v20 = v6;
  uint64_t v21 = v3;
  if (_increaseDailyAssetDownloadKB__onceToken != -1) {
    dispatch_once(&_increaseDailyAssetDownloadKB__onceToken, &v16);
  }
  int v7 = __MPCDailyAssetDownloadCountDay;
  uint64_t v8 = v6 - __MPCDailyAssetDownloadCountDay;
  if (v6 <= __MPCDailyAssetDownloadCountDay)
  {
    uint64_t v9 = a2
       + (int)atomic_fetch_add_explicit((atomic_uint *volatile)__MPCDailyAssetDownloadSizeInKB, a2, memory_order_relaxed);
    if (!a2) {
      return v9;
    }
  }
  else
  {
    __swp(__MPCDailyAssetDownloadCountDay, __MPCDailyAssetDownloadSizeInKB);
    +[MPCMediaLibraryPlaybackAssetCacheProvider _sendDailyTotalDownloadSizeEventWithDays:sizeInKB:](v3, v8, v7);
    __MPCDailyAssetDownloadCountDay = v6;
    uint64_t v9 = a2
       + (int)atomic_fetch_add_explicit((atomic_uint *volatile)__MPCDailyAssetDownloadSizeInKB, a2, memory_order_relaxed);
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v16, v17, v18, v19, v20, v21);
  v24[0] = @"day";
  unint64_t v11 = [NSNumber numberWithLongLong:v6];
  v25[0] = v11;
  v24[1] = @"sizeInKB";
  uint64_t v12 = [NSNumber numberWithInteger:v9];
  v25[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v10 setObject:v13 forKey:@"_MPCDailyAssetDownloadCurrentSize"];

  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v23 = v9;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MPCMediaLibraryPlaybackAssetCacheProvider: Updated daily asset download size: %{public}ld KB", buf, 0xCu);
  }

  return v9;
}

void __75__MPCMediaLibraryPlaybackAssetCacheProvider__increaseDailyAssetDownloadKB___block_invoke(uint64_t a1)
{
  __MPCDailyAssetDownloadCountDay = *(void *)(a1 + 32);
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v9 = [v2 objectForKey:@"_MPCDailyAssetDownloadCurrentSize"];

  uint64_t v3 = v9;
  if (v9)
  {
    uint64_t v4 = [v9 objectForKeyedSubscript:@"day"];
    uint64_t v5 = [v4 longLongValue];

    uint64_t v6 = [v9 objectForKeyedSubscript:@"sizeInKB"];
    uint64_t v7 = [v6 integerValue];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8 == v5)
    {
      atomic_store(v7, __MPCDailyAssetDownloadSizeInKB);
    }
    else
    {
      uint64_t v3 = v9;
      if (v8 <= v5) {
        goto LABEL_7;
      }
      +[MPCMediaLibraryPlaybackAssetCacheProvider _sendDailyTotalDownloadSizeEventWithDays:sizeInKB:](*(void *)(a1 + 40), v8 - v5, v7);
    }
    uint64_t v3 = v9;
  }
LABEL_7:
}

+ (void)_sendDailyTotalDownloadSizeEventWithDays:(uint64_t)a3 sizeInKB:
{
  self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__MPCMediaLibraryPlaybackAssetCacheProvider__sendDailyTotalDownloadSizeEventWithDays_sizeInKB___block_invoke;
  v6[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v6[4] = a2;
  v6[5] = a3;
  uint64_t v5 = _Block_copy(v6);
  AnalyticsSendEventLazy();
}

id __95__MPCMediaLibraryPlaybackAssetCacheProvider__sendDailyTotalDownloadSizeEventWithDays_sizeInKB___block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"appID";
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  v10[0] = v3;
  v9[1] = @"days";
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v10[1] = v4;
  v9[2] = @"totalKB";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v10[2] = v5;
  v9[3] = @"avgKBPerDay";
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40) / *(void *)(a1 + 32)];
  v10[3] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (BOOL)isUnderDailyCacheAssetDownloadLimit
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 valueForKey:@"_MPCDailyAssetDownloadLimitKB"];

  if ([v3 integerValue] < 1)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v4 = +[MPCMediaLibraryPlaybackAssetCacheProvider _increaseDailyAssetDownloadKB:]((uint64_t)MPCMediaLibraryPlaybackAssetCacheProvider, 0);
    uint64_t v5 = [v3 integerValue];
    BOOL v6 = v4 < v5;
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v4 < v5;
      id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v11 = 134218754;
      uint64_t v12 = v4;
      __int16 v13 = 2114;
      uint64_t v14 = v3;
      __int16 v15 = 1024;
      BOOL v16 = v8;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "MPCMediaLibraryPlaybackAssetCacheProvider: Current daily asset download size: %ld KB, daily limit: %{public}@ KB, is under daily limit: %{BOOL}u %@", (uint8_t *)&v11, 0x26u);
    }
  }

  return v6;
}

- (void)setPlaybackAssetCacheFileAsset:(id)a3 forGenericObject:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 filePath];
  if ([v11 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x2020000000;
    int64_t v35 = 0;
    int64_t v35 = [(MPCMediaLibraryPlaybackAssetCacheProvider *)self _persistentIDForModelObject:v9];
    uint64_t v12 = [v9 flattenedGenericObject];
    uint64_t v13 = [v12 type];
    switch(v13)
    {
      case 1:
        uint64_t v14 = [v12 song];
        break;
      case 6:
        uint64_t v14 = [v12 tvEpisode];
        break;
      case 9:
        uint64_t v14 = [v12 movie];
        break;
      default:
        __int16 v17 = 0;
        goto LABEL_13;
    }
    __int16 v17 = (void *)v14;
LABEL_13:
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_2643BFDF8;
    id v28 = v8;
    id v29 = self;
    p_long long buf = &buf;
    id v18 = v10;
    id v31 = v18;
    id v30 = v11;
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = v19;
    if (*(void *)(*((void *)&buf + 1) + 24))
    {
      (*((void (**)(void *))v19 + 2))(v19);
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263F11F30]);
      [v21 setShouldLibraryAdd:0];
      id v22 = objc_alloc_init(MEMORY[0x263F120D8]);
      [v22 appendSection:&stru_26CBCA930];
      [v22 appendItem:v17];
      [v21 setModelObjects:v22];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_2;
      v23[3] = &unk_2643BFE20;
      long long v26 = &buf;
      id v24 = v20;
      id v25 = v18;
      [v21 performWithResponseHandler:v23];
    }
    _Block_object_dispose(&buf, 8);
    goto LABEL_17;
  }
  __int16 v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "%{public}@: File asset missing file path, finishing.", (uint8_t *)&buf, 0xCu);
  }

  BOOL v16 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1005 userInfo:0];
  (*((void (**)(id, void *))v10 + 2))(v10, v16);

LABEL_17:
}

void __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) qualityType];
  unint64_t v3 = [*(id *)(a1 + 32) traits];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) itemWithPersistentID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) verifyExistence:0];
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x263F11338];
    uint64_t v6 = *MEMORY[0x263F11290];
    uint64_t v7 = *MEMORY[0x263F112B8];
    uint64_t v96 = *MEMORY[0x263F11298];
    uint64_t v97 = *MEMORY[0x263F11330];
    uint64_t v98 = *MEMORY[0x263F112C8];
    uint64_t v100 = *MEMORY[0x263F112B0];
    id v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F11338], *MEMORY[0x263F11330], *MEMORY[0x263F11290], *MEMORY[0x263F112B0], *MEMORY[0x263F112B8], *MEMORY[0x263F112C8], *MEMORY[0x263F11298], 0);
    id v9 = [(__CFString *)v4 valuesForProperties:v8];

    uint64_t v99 = v6;
    id v10 = [v9 objectForKey:v6];
    if ([v10 length])
    {
      int v11 = [v9 objectForKey:v5];
      char v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 40);
          __int16 v15 = *(__CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v105 = v14;
          __int16 v106 = 2048;
          v107 = v15;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Item asset file path is not set because the item has a downloaded asset persistentID=%lld", buf, 0x16u);
        }

        uint64_t v16 = *(void *)(a1 + 56);
        __int16 v17 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1007 userInfo:0];
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
LABEL_80:

        goto LABEL_81;
      }
    }
    else
    {
    }
    uint64_t v20 = (4 * v3) & 0x20 | (v3 >> 4) & 3 | (16 * ((v3 >> 2) & 1)) | (4 * ((v3 >> 1) & 1));
    id v21 = [v9 objectForKey:v100];
    uint64_t v22 = [v21 integerValue];

    char v95 = v22;
    if (v20 == v22)
    {
LABEL_57:
      __int16 v17 = [*(id *)(a1 + 32) hlsKeyCertificateURL];
      if ([v17 length])
      {
        uint64_t v50 = [v9 objectForKey:v7];
        if (!v50
          || (v51 = (void *)v50,
              [v9 objectForKey:v7],
              v52 = objc_claimAutoreleasedReturnValue(),
              char v53 = [v17 isEqualToString:v52],
              v52,
              v51,
              (v53 & 1) == 0))
        {
          [(__CFString *)v4 setValue:v17 forProperty:v7];
        }
      }
      v54 = [*(id *)(a1 + 32) hlsKeyServerURL];
      if ([v54 length])
      {
        uint64_t v55 = [v9 objectForKey:v98];
        if (!v55
          || (v56 = (void *)v55,
              [v9 objectForKey:v98],
              v57 = objc_claimAutoreleasedReturnValue(),
              char v58 = [v54 isEqualToString:v57],
              v57,
              v56,
              (v58 & 1) == 0))
        {
          [(__CFString *)v4 setValue:v54 forProperty:v98];
        }
      }
      v101 = v54;
      v59 = [*(id *)(a1 + 32) hlsKeyServerProtocol];
      uint64_t v60 = v99;
      if ([v59 length])
      {
        uint64_t v61 = *MEMORY[0x263F112C0];
        uint64_t v62 = [v9 objectForKey:*MEMORY[0x263F112C0]];
        if (!v62) {
          goto LABEL_68;
        }
        v63 = (void *)v62;
        [v9 objectForKey:v61];
        v64 = v9;
        v65 = v4;
        v67 = uint64_t v66 = v2;
        char v68 = [v59 isEqualToString:v67];

        uint64_t v2 = v66;
        uint64_t v4 = v65;
        id v9 = v64;
        uint64_t v60 = v99;

        if ((v68 & 1) == 0) {
LABEL_68:
        }
          [(__CFString *)v4 setValue:v59 forProperty:v61];
      }
      v69 = [v9 objectForKey:v60];
      uint64_t v70 = [v69 length];

      if (!v70) {
        goto LABEL_73;
      }
      v71 = [v9 objectForKey:v60];
      int v72 = [v71 isEqualToString:*(void *)(a1 + 48)];

      if (!v72) {
        goto LABEL_73;
      }
      v73 = [v9 objectForKey:v97];
      int v74 = [v73 BOOLValue];

      if (v74)
      {
        if (v2 == 2) {
          goto LABEL_73;
        }
      }
      uint64_t v82 = [*(id *)(a1 + 48) pathExtension];
      if (!v82) {
        goto LABEL_85;
      }
      v83 = (void *)v82;
      v84 = MSVOfflineHLSFileExtensions();
      v85 = [*(id *)(a1 + 48) pathExtension];
      int v86 = [v84 containsObject:v85];

      if (!v86) {
        goto LABEL_85;
      }
      v87 = [v9 objectForKey:v96];
      v88 = [NSNumber numberWithLongLong:MSVGetDiskUsageForPath()];
      char v89 = [v87 isEqualToNumber:v88];

      if ((v89 & 1) == 0)
      {
LABEL_73:
        uint64_t v75 = [*(id *)(a1 + 32) protectionType];
        if (v75 == 1) {
          uint64_t v76 = 1;
        }
        else {
          uint64_t v76 = 2 * (v75 == 2);
        }
        v77 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = *(void *)(a1 + 40);
          v79 = *(__CFString **)(a1 + 48);
          *(_DWORD *)long long buf = 138543874;
          uint64_t v105 = v78;
          __int16 v106 = 2114;
          v107 = v79;
          __int16 v108 = 2114;
          v109 = v4;
          _os_log_impl(&dword_21BB87000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing path %{public}@ for media item: %{public}@", buf, 0x20u);
        }

        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_14;
        v102[3] = &unk_2643BFDD0;
        uint64_t v80 = *(void *)(a1 + 48);
        id v103 = *(id *)(a1 + 56);
        [(__CFString *)v4 populateLocationPropertiesWithPath:v80 assetProtectionType:v76 completionBlock:v102];
        v81 = v103;
      }
      else
      {
LABEL_85:
        uint64_t v90 = *(void *)(a1 + 56);
        v81 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1004 userInfo:0];
        (*(void (**)(uint64_t, void *))(v90 + 16))(v90, v81);
      }

      goto LABEL_80;
    }
    os_log_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_56:

      v49 = [NSNumber numberWithInteger:v20];
      [(__CFString *)v4 setValue:v49 forProperty:v100];

      goto LABEL_57;
    }
    uint64_t v93 = v2;
    uint64_t v94 = v7;
    uint64_t v92 = *(void *)(a1 + 40);
    char v24 = [*(id *)(a1 + 32) traits];
    id v25 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
    if (v24)
    {
      long long v26 = [NSString stringWithFormat:@"adm"];
      [v25 addObject:v26];
    }
    if ((v24 & 2) != 0)
    {
      long long v27 = [NSString stringWithFormat:@"lossless"];
      [v25 addObject:v27];
    }
    if ((v24 & 4) != 0)
    {
      id v28 = [NSString stringWithFormat:@"high-res lossless"];
      [v25 addObject:v28];
    }
    if ((v24 & 8) != 0)
    {
      id v29 = [NSString stringWithFormat:@"spatial"];
      [v25 addObject:v29];
    }
    if ((v24 & 0x10) != 0)
    {
      id v30 = [NSString stringWithFormat:@"atmos"];
      [v25 addObject:v30];
    }
    if ((v24 & 0x20) != 0)
    {
      id v31 = [NSString stringWithFormat:@"surround"];
      [v25 addObject:v31];
    }
    if ([v25 count])
    {
      v32 = [v25 componentsJoinedByString:@", "];
    }
    else
    {
      v32 = @"None";
    }

    v91 = v32;
    v33 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
    if (((2 * (_BYTE)v3) & 4) != 0)
    {
      uint64_t v34 = [NSString stringWithFormat:@"lossless"];
      [v33 addObject:v34];
    }
    if (((4 * (_BYTE)v3) & 0x10) != 0)
    {
      int64_t v35 = [NSString stringWithFormat:@"high-res lossless"];
      [v33 addObject:v35];
    }
    uint64_t v2 = v93;
    if (((4 * v3) & 0x20) != 0)
    {
      uint64_t v36 = [NSString stringWithFormat:@"spatial"];
      [v33 addObject:v36];
    }
    if ((v3 & 0x10) != 0)
    {
      v37 = [NSString stringWithFormat:@"atmos"];
      [v33 addObject:v37];
    }
    if ((v3 & 0x20) != 0)
    {
      v38 = [NSString stringWithFormat:@"surround"];
      [v33 addObject:v38];
    }
    uint64_t v7 = v94;
    if ([v33 count])
    {
      v39 = [v33 componentsJoinedByString:@", "];
    }
    else
    {
      v39 = @"None";
    }

    v40 = v39;
    v41 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
    if ((v95 & 8) != 0)
    {
      v44 = [NSString stringWithFormat:@"lossy stereo"];
      [v41 addObject:v44];

      uint64_t v7 = v94;
      if ((v95 & 4) == 0)
      {
LABEL_41:
        if ((v95 & 0x10) == 0) {
          goto LABEL_42;
        }
        goto LABEL_50;
      }
    }
    else if ((v95 & 4) == 0)
    {
      goto LABEL_41;
    }
    v45 = [NSString stringWithFormat:@"lossless"];
    [v41 addObject:v45];

    uint64_t v7 = v94;
    if ((v95 & 0x10) == 0)
    {
LABEL_42:
      if ((v95 & 0x20) == 0) {
        goto LABEL_43;
      }
      goto LABEL_51;
    }
LABEL_50:
    v46 = [NSString stringWithFormat:@"high-res lossless"];
    [v41 addObject:v46];

    uint64_t v7 = v94;
    if ((v95 & 0x20) == 0)
    {
LABEL_43:
      if ((v95 & 1) == 0) {
        goto LABEL_44;
      }
      goto LABEL_52;
    }
LABEL_51:
    v47 = [NSString stringWithFormat:@"spatial"];
    [v41 addObject:v47];

    uint64_t v7 = v94;
    if ((v95 & 1) == 0)
    {
LABEL_44:
      if ((v95 & 2) == 0)
      {
LABEL_46:
        if ([v41 count])
        {
          v43 = [v41 componentsJoinedByString:@", "];
        }
        else
        {
          v43 = @"None";
        }

        *(_DWORD *)long long buf = 138544130;
        uint64_t v105 = v92;
        __int16 v106 = 2114;
        v107 = v91;
        __int16 v108 = 2114;
        v109 = v40;
        __int16 v110 = 2114;
        v111 = v43;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: File traits translation from MPFileAsset to MPMediaItem: %{public}@ -> %{public}@ - Existing file traits: %{public}@", buf, 0x2Au);

        goto LABEL_56;
      }
LABEL_45:
      v42 = [NSString stringWithFormat:@"surround"];
      [v41 addObject:v42];

      goto LABEL_46;
    }
LABEL_52:
    v48 = [NSString stringWithFormat:@"atmos"];
    [v41 addObject:v48];

    uint64_t v7 = v94;
    if ((v95 & 2) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1006 userInfo:0];
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_81:
}

void __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = [v6 identifiers];
  id v8 = [v7 library];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v8 persistentID];

  if (*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    uint64_t v9 = a1[5];
    id v10 = (void *)MEMORY[0x263F087E8];
    if (v5)
    {
      uint64_t v13 = *MEMORY[0x263F08608];
      v14[0] = v5;
      int v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      int v11 = 0;
    }
    char v12 = [v10 errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1003 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

    if (v5) {
  }
    }
}

uint64_t __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPlaybackAssetDestinationURL:(id *)a3 sharedCacheURL:(id *)a4 purgeable:(BOOL)a5 purchaseBundleDestinationURL:(id *)a6 assetQualityType:(int64_t)a7 fileName:(id)a8 pathExtension:(id)a9
{
  BOOL v11 = a5;
  id v30 = a8;
  id v15 = a9;
  if (v11)
  {
    uint64_t v16 = objc_opt_class();
    mediaLibrary = self->_mediaLibrary;
    if (a7 == 2) {
      [v16 _highQualityCachedAssetDestinationDirectoryForMediaLibrary:mediaLibrary];
    }
    else {
    uint64_t v18 = [v16 _lowQualityCachedAssetDestinationDirectoryForMediaLibrary:mediaLibrary];
    }
  }
  else
  {
    uint64_t v18 = [(id)objc_opt_class() _downloadedAssetDestinationDirectoryForMediaLibrary:self->_mediaLibrary];
  }
  uint64_t v19 = v18;
  uint64_t v20 = [v18 stringByAppendingPathComponent:v30];
  id v21 = v20;
  if (a3)
  {
    uint64_t v22 = NSURL;
    os_log_t v23 = [v20 stringByAppendingPathExtension:v15];
    *a3 = [v22 fileURLWithPath:v23 isDirectory:0];
  }
  if (a6)
  {
    char v24 = NSURL;
    id v25 = [v21 stringByAppendingPathExtension:@"plist"];
    *a6 = [v24 fileURLWithPath:v25 isDirectory:0];
  }
  if (a4)
  {
    long long v26 = [MEMORY[0x263F57448] cloudAssetsSharedCacheFolderPath];
    long long v27 = NSURL;
    id v28 = [v26 stringByAppendingPathComponent:v30];
    id v29 = [v28 stringByAppendingPathExtension:v15];
    *a4 = [v27 fileURLWithPath:v29 isDirectory:0];
  }
}

- (void)clearPlaybackAssetCacheFileAssetForGenericObject:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  int64_t v7 = [(MPCMediaLibraryPlaybackAssetCacheProvider *)self _persistentIDForModelObject:a3];
  if (v7)
  {
    int64_t v8 = v7;
    uint64_t v9 = [(MPMediaLibrary *)self->_mediaLibrary itemWithPersistentID:v7 verifyExistence:0];
    uint64_t v10 = *MEMORY[0x263F11338];
    uint64_t v11 = *MEMORY[0x263F11290];
    char v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F11338], *MEMORY[0x263F11290], 0);
    uint64_t v13 = [v9 valuesForProperties:v12];

    uint64_t v14 = [v13 objectForKey:v11];
    if ([v14 length])
    {
      id v15 = [v13 objectForKey:v10];
      char v16 = [v15 BOOLValue];

      if ((v16 & 1) == 0)
      {
        __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v22 = self;
          __int16 v23 = 2048;
          int64_t v24 = v8;
          _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Item asset file path is not clear because the item has a downloaded asset persistentID=%lld", buf, 0x16u);
        }

        if (!v6) {
          goto LABEL_13;
        }
        uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain" code:-1007 userInfo:0];
        v6[2](v6, v18);
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __116__MPCMediaLibraryPlaybackAssetCacheProvider_clearPlaybackAssetCacheFileAssetForGenericObject_withCompletionHandler___block_invoke;
    v19[3] = &unk_2643BFDD0;
    uint64_t v20 = v6;
    [v9 populateLocationPropertiesWithPath:0 assetProtectionType:0 completionBlock:v19];
    uint64_t v18 = v20;
    goto LABEL_12;
  }
  if (v6) {
    v6[2](v6, 0);
  }
LABEL_14:
}

uint64_t __116__MPCMediaLibraryPlaybackAssetCacheProvider_clearPlaybackAssetCacheFileAssetForGenericObject_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)_downloadedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  unint64_t v3 = [a3 ml3Library];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  }
  uint64_t v6 = v5;

  int64_t v7 = [v6 pathForResourceFileOrFolder:10];
  int64_t v8 = [MEMORY[0x263F08850] defaultManager];
  if (([v8 fileExistsAtPath:v7] & 1) == 0) {
    [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v7;
}

+ (id)_lowQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  unint64_t v3 = [a3 ml3Library];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  }
  uint64_t v6 = v5;

  int64_t v7 = [v6 pathForResourceFileOrFolder:9];
  int64_t v8 = [MEMORY[0x263F08850] defaultManager];
  if (([v8 fileExistsAtPath:v7] & 1) == 0) {
    [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v7;
}

+ (id)_highQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  unint64_t v3 = [a3 ml3Library];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  }
  uint64_t v6 = v5;

  int64_t v7 = [v6 pathForResourceFileOrFolder:8];
  int64_t v8 = [MEMORY[0x263F08850] defaultManager];
  if (([v8 fileExistsAtPath:v7] & 1) == 0) {
    [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v7;
}

@end