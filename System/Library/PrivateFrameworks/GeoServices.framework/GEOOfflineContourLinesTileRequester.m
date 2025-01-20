@interface GEOOfflineContourLinesTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4;
- (id)activeTileSetForKey:(uint64_t)a3;
- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3;
@end

@implementation GEOOfflineContourLinesTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 84;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:90 size:(*(void *)(a3 + 1) >> 58) & 0xFLL scale:0];

  return v6;
}

- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3
{
  if (!a3 || (*(unsigned char *)a3 & 0x7F) != 0x14) {
    return 0;
  }
  *(void *)((char *)&v4 + 1) = ((unint64_t)(*(void *)(a3 + 1) >> 6) << 46) | ((*(void *)(a3 + 1) & 0x3FLL) << 40);
  LOBYTE(v4) = 2;
  return v4;
}

- (id)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v11[0] = [a1 _regularTileKeyForContourLinesTileKey:a3];
  v11[1] = v7;
  v10.receiver = a1;
  v10.super_class = (Class)GEOOfflineContourLinesTileRequester;
  v8 = [(GEOOfflineVectorTileRequester *)&v10 _offlineDataKeyForTileKey:v11 localeKey:v6];

  return v8;
}

@end