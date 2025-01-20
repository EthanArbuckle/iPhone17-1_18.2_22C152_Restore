@interface GEOOfflineVectorTileRequester
+ (unsigned)tileProviderIdentifier;
- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4;
- (id)activeTileSetForKey:(uint64_t)a3;
- (uint64_t)tileSetForKey:(void *)a1;
- (void)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(long long *)a3 onlineTileKey:(long long *)a4 completionHandler:(void *)a5;
@end

@implementation GEOOfflineVectorTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 66;
}

- (uint64_t)tileSetForKey:(void *)a1
{
  v1 = objc_msgSend(a1, "activeTileSetForKey:");
  v2 = v1;
  if (v1)
  {
    __int16 v3 = [v1 style];
    char v4 = [v2 scale];
    uint64_t v5 = ((v3 & 0x3FFF | (([v2 size] & 0xF) << 14) & 0xFFC3FFFF | ((v4 & 0xF) << 18)) << 8) | 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  char v4 = [a1 resourceManifestManager];
  uint64_t v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:*(unsigned __int16 *)(a3 + 13) >> 2 size:*(unsigned char *)(a3 + 15) & 0xF scale:*(unsigned __int8 *)(a3 + 15) >> 4];

  return v6;
}

- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  id v5 = a4;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: onlineTileKey != ((void *)0)", (uint8_t *)&v15, 2u);
    }
    goto LABEL_14;
  }
  unsigned int v17 = 0;
  if (!GEOTileKeyStyle(a3, &v17) || (*(unsigned char *)a3 & 0x7F) != 2)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  unsigned int v16 = bswap32(v17);
  uint64_t v6 = [v5 lengthOfBytesUsingEncoding:1] + 12;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v6];
  [v7 appendBytes:&v16 length:4];
  unint64_t v8 = *(void *)(a3 + 1);
  if (((v8 >> 40) & 0x3F) < 0x20)
  {
    *((void *)&v11 + 1) = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    *(void *)&long long v11 = *(void *)(a3 + 1);
    unint64_t v10 = (v11 >> 17) & 0x7FFFFFE0000000 | (*((void *)&v11 + 1) >> 8) & 0x3FFFFFFLL | (v8 >> 40 << 59);
  }
  else
  {
    v9 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "[Offline] z is too large to fit in a tile path key", (uint8_t *)&v15, 2u);
    }

    unint64_t v10 = 0;
  }
  unint64_t v15 = bswap64(v10);
  [v7 appendBytes:&v15 length:8];
  if ([v5 length])
  {
    v12 = [v5 dataUsingEncoding:1];
    [v7 appendData:v12];
  }
  v13 = [[GEOOfflineDataKey alloc] initWithLayer:9 serviceKey:v7];

LABEL_15:

  return v13;
}

- (void)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(long long *)a3 onlineTileKey:(long long *)a4 completionHandler:(void *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v9 = *a4;
  long long v16 = *a3;
  long long v15 = v9;
  unint64_t v10 = +[GEOOfflineDataAccess sharedInstance];
  long long v11 = [a1 delegateQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke;
  v13[3] = &unk_1E53EC980;
  v13[4] = a1;
  id v14 = v8;
  id v12 = v8;
  [v10 getFullyDownloadedRegionsWithCallbackQueue:v11 callback:v13];
}

void __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    double v4 = GEOMapRectForGEOTileKey(a1 + 48);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = GEOMapRectForMapRegion(*(void **)(*((void *)&v27 + 1) + 8 * v15));
          if (GEOMapRectIntersectsRect(v16, v17, v18, v19, v4, v6, v8, v10))
          {

            goto LABEL_15;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    unsigned int UInteger = GEOConfigGetUInteger(GeoOfflineConfig_GlobalTileCoverageMaxZoom, (uint64_t)off_1E9115958);
    if (UInteger && (*(_DWORD *)buf = 0, GEOTileKeyZoom(a1 + 48, buf)) && *(_DWORD *)buf <= UInteger)
    {
LABEL_15:
      v21 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = GEOStringFromTileKey((char *)(a1 + 64));
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "[Offline] Generating empty VMP4 for tile %@", buf, 0xCu);
      }
      v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", _block_invoke_emptyVMP4, 29, 0, (void)v27);
      uint64_t v24 = *(void *)(a1 + 40);
      v25 = [[GEOTileData alloc] initWithData:v23];
      (*(void (**)(uint64_t, GEOTileData *))(v24 + 16))(v24, v25);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    }
  }
  else
  {
    v26 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke_2;
    block[3] = &unk_1E53DA028;
    id v32 = *(id *)(a1 + 40);
    dispatch_async(v26, block);
  }
}

uint64_t __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end