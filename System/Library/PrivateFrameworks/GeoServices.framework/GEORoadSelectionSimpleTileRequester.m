@interface GEORoadSelectionSimpleTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(void *)a1;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)_regularTileKeyForRoadSelectionSelectionTileKey:(uint64_t)a3 roadId:(void *)a4;
- (uint64_t)tileDataIsCacheableForTileKey:;
@end

@implementation GEORoadSelectionSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 19;
}

- (uint64_t)_regularTileKeyForRoadSelectionSelectionTileKey:(uint64_t)a3 roadId:(void *)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v6 = [a1 resourceManifestManager];
  uint64_t v22 = 0;
  int v21 = 0;
  uint64_t v20 = 0;
  if (GEOSelectionTileKeyGetXYZId(a3, (int *)&v22 + 1, &v22, &v21, &v20))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [&unk_1ED73EF50 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(&unk_1ED73EF50);
        }
        if (objc_msgSend(v6, "supportsTileStyle:size:scale:", 87, objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "integerValue"), 0))break; {
        if (v8 == ++v10)
        }
        {
          uint64_t v8 = [&unk_1ED73EF50 countByEnumeratingWithState:&v16 objects:v23 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      if (!a4) {
        goto LABEL_15;
      }
    }
    else
    {
LABEL_10:
      if (!a4) {
        goto LABEL_15;
      }
    }
    *a4 = v20;
LABEL_15:
    uint64_t v12 = HIDWORD(v22);
    char v13 = v21;
    char v14 = [(id)objc_opt_class() tileProviderIdentifier];
    *(void *)((char *)v24 + 1) = (v12 << 46) | ((unint64_t)(v13 & 0x3F) << 40);
    LOBYTE(v24[0]) = v14 & 0x7F;
    uint64_t v11 = v24[0];
    goto LABEL_16;
  }
  *(void *)((char *)v24 + 1) = 0;
  LOBYTE(v24[0]) = 0;
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

- (uint64_t)tileDataIsCacheableForTileKey:
{
  return 0;
}

- (id)activeTileSetForKey:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = [a1 resourceManifestManager];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [&unk_1ED73EF68 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v11 != v4) {
        objc_enumerationMutation(&unk_1ED73EF68);
      }
      uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * v5) integerValue];
      if ([v1 supportsTileStyle:87 size:v6 scale:0]) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [&unk_1ED73EF68 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v6 = 2;
  }
  uint64_t v7 = [v1 activeTileGroup];
  uint64_t v8 = [v7 activeTileSetForStyle:87 size:v6 scale:0];

  return v8;
}

- (id)urlForTileKey:(uint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  uint64_t v17 = 0;
  *(void *)&long long v25 = [a1 _regularTileKeyForRoadSelectionSelectionTileKey:a3 roadId:&v17];
  *((void *)&v25 + 1) = v7;
  uint64_t v8 = [v6 baseURL];
  if (v8)
  {
    uint64_t v9 = [[GEOURLComponentsWithHeaders alloc] initWithString:v8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__GEORoadSelectionSimpleTileRequester_urlForTileKey___block_invoke;
    v18[3] = &unk_1E53E0D10;
    long long v24 = v25;
    id v19 = v5;
    uint64_t v20 = a1;
    uint64_t v22 = v17;
    uint64_t v23 = a3;
    long long v10 = v6;
    int v21 = v10;
    [(GEOURLComponentsWithHeaders *)v9 updateQueryItemsWithBlock:v18];
    v16.receiver = a1;
    v16.super_class = (Class)GEORoadSelectionSimpleTileRequester;
    id v11 = [(GEOSimpleTileRequester *)&v16 kindForTileKey:&v25];
    long long v12 = +[GEOExperimentConfiguration sharedConfiguration];
    long long v13 = [(GEOURLComponentsWithHeaders *)v9 URLComponents];
    [v12 updateURLComponents:v13 forRequestKind:v11];

    char v14 = GEOURLAuthenticationForComponents(v9, v10);
  }
  else
  {
    char v14 = [a1 _localizationURLForTileKey:a3];
  }

  return v14;
}

void __53__GEORoadSelectionSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(a1 + 85) >> 2];
  [v8 addItemWithName:@"size" uintValue:*(unsigned char *)(a1 + 87) & 0xF];
  [v8 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(a1 + 87) >> 4];
  objc_msgSend(v8, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", a1 + 72));
  [v8 addItemWithName:@"z" uintValue:*(_DWORD *)(a1 + 78) & 0x3F];
  [v8 addItemWithName:@"x" uintValue:((*(void *)(a1 + 73) >> 46) | (*(_DWORD *)(a1 + 81) << 18)) & 0x3FFFFFF];
  [v8 addItemWithName:@"y" uintValue:*(_DWORD *)(a1 + 82) & 0x3FFFFFF];
  [v8 addItemWithName:@"id" uint64Value:*(void *)(a1 + 56)];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v8 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  uint64_t v3 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  uint64_t v4 = [v3 queryItems];
  [v8 addItemsFromArray:v4];

  uint64_t v5 = +[GEOPreflight queryItems];
  [v8 addItemsFromArray:v5];

  uint64_t v6 = [*(id *)(a1 + 40) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v6) {
    [v8 addItemWithName:@"checksum" intValue:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 48) disputedBordersQueryItemsForCountry:*(void *)(*(void *)(a1 + 40) + 48) region:*(void *)(*(void *)(a1 + 40) + 56)];
  [v8 addItemsFromArray:v7];
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  uint64_t v21 = 0;
  *(void *)&long long v29 = [a1 _regularTileKeyForRoadSelectionSelectionTileKey:a3 roadId:&v21];
  *((void *)&v29 + 1) = v7;
  id v8 = [a1 tileRequest];
  uint64_t v9 = [v8 locale];
  long long v10 = [v5 localizationURLStringIfNecessaryForActiveTileSet:v6 tileKey:&v29 overrideLocale:v9];

  if (v10)
  {
    id v11 = [a1 tileRequest];
    long long v12 = [v11 locale];
    long long v13 = [v5 languageForTileKey:&v29 overrideLocale:v12];

    if (v13)
    {
      char v14 = [[GEOURLComponentsWithHeaders alloc] initWithString:v10];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__GEORoadSelectionSimpleTileRequester__localizationURLForTileKey___block_invoke;
      v22[3] = &unk_1E53E0D10;
      long long v28 = v29;
      id v23 = v5;
      id v24 = v13;
      long long v25 = a1;
      uint64_t v26 = v21;
      uint64_t v27 = a3;
      [(GEOURLComponentsWithHeaders *)v14 updateQueryItemsWithBlock:v22];
      v20.receiver = a1;
      v20.super_class = (Class)GEORoadSelectionSimpleTileRequester;
      id v15 = [(GEOSimpleTileRequester *)&v20 kindForTileKey:&v29];
      objc_super v16 = +[GEOExperimentConfiguration sharedConfiguration];
      uint64_t v17 = [(GEOURLComponentsWithHeaders *)v14 URLComponents];
      [v16 updateURLComponents:v17 forRequestKind:v15];

      long long v18 = GEOURLAuthenticationForComponents(v14, v6);
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

void __66__GEORoadSelectionSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(a1 + 85) >> 2];
  [v7 addItemWithName:@"size" uintValue:*(unsigned char *)(a1 + 87) & 0xF];
  [v7 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(a1 + 87) >> 4];
  objc_msgSend(v7, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", a1 + 72));
  [v7 addItemWithName:@"z" uintValue:*(_DWORD *)(a1 + 78) & 0x3F];
  [v7 addItemWithName:@"x" uintValue:((*(void *)(a1 + 73) >> 46) | (*(_DWORD *)(a1 + 81) << 18)) & 0x3FFFFFF];
  [v7 addItemWithName:@"y" uintValue:*(_DWORD *)(a1 + 82) & 0x3FFFFFF];
  [v7 addItemWithName:@"lang" value:*(void *)(a1 + 40)];
  [v7 addItemWithName:@"id" uint64Value:*(void *)(a1 + 56)];
  uint64_t v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v3) {
    [v7 addItemWithName:@"checksum" intValue:v3];
  }
  uint64_t v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  uint64_t v5 = [v4 queryItems];
  [v7 addItemsFromArray:v5];

  uint64_t v6 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v6];
}

@end