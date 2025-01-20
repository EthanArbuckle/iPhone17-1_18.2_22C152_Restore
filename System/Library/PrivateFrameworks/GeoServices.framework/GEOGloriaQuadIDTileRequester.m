@interface GEOGloriaQuadIDTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)_shouldReportAnalyticsForTileKey:(uint64_t)a3;
- (BOOL)downloadsDataToDisk;
- (GEOTileData)processTileData:(void *)a3 forKey:(uint64_t)a4 error:(void *)a5;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:;
@end

@implementation GEOGloriaQuadIDTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 12;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForTileType:((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) >> 6) & 0x3FFF scale:0];

  return v6;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (BOOL)_shouldReportAnalyticsForTileKey:(uint64_t)a3
{
  return ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) & 0xFFF80) == 4736;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (id)urlForTileKey:(uint64_t)a3
{
  v4 = objc_msgSend(a1, "activeTileSetForKey:");
  v5 = v4;
  if (v4 && ([v4 baseURL], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) >> 6) & 0x3FFF;
    if (v7 == 80)
    {
      *((void *)&v11 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
      *(void *)&long long v11 = *(void *)(a3 + 1);
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu/%llu/%hu/%hu", 80, (unint64_t)(v11 >> 6), *(_DWORD *)(a3 + 12) & 0x3FF, (*(_DWORD *)(a3 + 12) >> 10) & 0x3FF);
    }
    else
    {
      if (v7 == 65) {
        v8 = @"zoom%llu/%llu.tar.gz";
      }
      else {
        v8 = @"%llu/%llu";
      }
      if (v7 == 65) {
        uint64_t v7 = *(void *)(a3 + 1) & 0x3FLL;
      }
      *((void *)&v9 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
      *(void *)&long long v9 = *(void *)(a3 + 1);
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v8, v7, (unint64_t)(v9 >> 6));
    }
    v12 = (void *)v10;
    v13 = [GEOURLComponentsWithHeaders alloc];
    v14 = [v5 baseURL];
    v15 = [(GEOURLComponentsWithHeaders *)v13 initWithString:v14];

    [(GEOURLComponentsWithHeaders *)v15 appendPathComponents:v12];
    v16 = [(GEOURLComponentsWithHeaders *)v15 URLWithHeaders];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GEOTileData)processTileData:(void *)a3 forKey:(uint64_t)a4 error:(void *)a5
{
  id v7 = a3;
  v8 = v7;
  unsigned int v9 = (((*(unsigned __int16 *)(a4 + 9) | (*(unsigned __int8 *)(a4 + 11) << 16)) >> 6) & 0x3FFF) - 65;
  BOOL v10 = v9 > 0x1D;
  int v11 = (1 << v9) & 0x20018E01;
  if (v10 || v11 == 0)
  {
    v22 = (GEOTileData *)v7;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = NSTemporaryDirectory();
    v18 = [v16 fileURLWithPath:v17];
    v19 = [v13 fileURLWithPath:v15 relativeToURL:v18];

    v20 = [v8 fileURL];
    v21 = GEOGetTileLoadingLog();
    LOBYTE(v17) = +[GEOUnarchiver decompressDataAtURL:v20 toURL:v19 log:v21 error:a5];

    if (v17)
    {
      v22 = [[GEOTileData alloc] initWithFileURL:v19];
      if (a5) {
        *a5 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

@end