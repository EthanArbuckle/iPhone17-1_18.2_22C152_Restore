@interface GEOFeatureSpecificSimpleTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(void *)a1;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)_regularTileKeyForTransitLineSelectionTileKey:(uint64_t)a3 muid:(void *)a4;
- (uint64_t)tileDataIsCacheableForTileKey:;
@end

@implementation GEOFeatureSpecificSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 10;
}

- (uint64_t)_regularTileKeyForTransitLineSelectionTileKey:(uint64_t)a3 muid:(void *)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v6 = [a1 resourceManifestManager];
  uint64_t v19 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  if (GEOSelectionTileKeyGetXYZId(a3, (int *)&v19 + 1, &v19, &v18, &v17))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [&unk_1ED73EF80 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(&unk_1ED73EF80);
        }
        if (objc_msgSend(v6, "supportsTileStyle:size:scale:", 47, objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "integerValue"), 0))break; {
        if (v8 == ++v10)
        }
        {
          uint64_t v8 = [&unk_1ED73EF80 countByEnumeratingWithState:&v13 objects:v20 count:16];
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
    *a4 = v17;
LABEL_15:
    *(void *)((char *)v21 + 1) = ((unint64_t)HIDWORD(v19) << 46) | ((unint64_t)(v18 & 0x3F) << 40);
    LOBYTE(v21[0]) = 10;
    uint64_t v11 = v21[0];
    goto LABEL_16;
  }
  *(void *)((char *)v21 + 1) = 0;
  LOBYTE(v21[0]) = 0;
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
  uint64_t v2 = [&unk_1ED73EF98 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v11 != v4) {
        objc_enumerationMutation(&unk_1ED73EF98);
      }
      uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * v5) integerValue];
      if ([v1 supportsTileStyle:47 size:v6 scale:0]) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [&unk_1ED73EF98 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  uint64_t v8 = [v7 activeTileSetForStyle:47 size:v6 scale:0];

  return v8;
}

- (id)urlForTileKey:(uint64_t)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  uint64_t v22 = 0;
  v23[0] = [a1 _regularTileKeyForTransitLineSelectionTileKey:a3 muid:&v22];
  v23[1] = v7;
  uint64_t v8 = [(GEOURLWithHeaders *)v6 baseURL];
  if (v8)
  {
    uint64_t v9 = [[GEOURLComponentsWithHeaders alloc] initWithString:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__GEOFeatureSpecificSimpleTileRequester_urlForTileKey___block_invoke;
    v16[3] = &unk_1E53ED010;
    uint64_t v19 = v23;
    id v17 = v5;
    int v18 = a1;
    uint64_t v20 = v22;
    uint64_t v21 = a3;
    [(GEOURLComponentsWithHeaders *)v9 updateQueryItemsWithBlock:v16];
    v15.receiver = a1;
    v15.super_class = (Class)GEOFeatureSpecificSimpleTileRequester;
    id v10 = [(GEOSimpleTileRequester *)&v15 kindForTileKey:v23];
    long long v11 = +[GEOExperimentConfiguration sharedConfiguration];
    long long v12 = [(GEOURLComponentsWithHeaders *)v9 URLComponents];
    [v11 updateURLComponents:v12 forRequestKind:v10];

    long long v13 = GEOURLAuthenticationForComponents(v9, v6);
  }
  else
  {
    long long v13 = [a1 _localizationURLForTileKey:a3];
  }

  return v13;
}

void __55__GEOFeatureSpecificSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(*(void *)(a1 + 48) + 13) >> 2];
  [v7 addItemWithName:@"size" uintValue:*(unsigned char *)(*(void *)(a1 + 48) + 15) & 0xF];
  [v7 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(*(void *)(a1 + 48) + 15) >> 4];
  objc_msgSend(v7, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(void *)(a1 + 48)));
  [v7 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 48) + 6) & 0x3F];
  [v7 addItemWithName:@"x" uintValue:((*(void *)(*(void *)(a1 + 48) + 1) >> 46) | (*(_DWORD *)(*(void *)(a1 + 48) + 9) << 18)) & 0x3FFFFFF];
  [v7 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 48) + 10) & 0x3FFFFFF];
  [v7 addItemWithName:@"id" uint64Value:*(void *)(a1 + 56)];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v7 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  uint64_t v3 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  uint64_t v4 = [v3 queryItems];
  [v7 addItemsFromArray:v4];

  uint64_t v5 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v5];

  uint64_t v6 = [*(id *)(a1 + 40) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v6) {
    [v7 addItemWithName:@"checksum" intValue:v6];
  }
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  uint64_t v28 = 0;
  v29[0] = [a1 _regularTileKeyForTransitLineSelectionTileKey:a3 muid:&v28];
  v29[1] = v7;
  uint64_t v8 = [a1 tileRequest];
  uint64_t v9 = [v8 locale];
  id v10 = [v5 localizationURLStringIfNecessaryForActiveTileSet:v6 tileKey:v29 overrideLocale:v9];

  if (v10)
  {
    long long v11 = [a1 tileRequest];
    long long v12 = [v11 locale];
    long long v13 = [v5 languageForTileKey:v29 overrideLocale:v12];

    if (v13)
    {
      long long v14 = [[GEOURLComponentsWithHeaders alloc] initWithString:v10];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__GEOFeatureSpecificSimpleTileRequester__localizationURLForTileKey___block_invoke;
      void v21[3] = &unk_1E53ED038;
      v25 = v29;
      id v22 = v5;
      id v23 = v13;
      v24 = a1;
      uint64_t v26 = v28;
      uint64_t v27 = a3;
      [(GEOURLComponentsWithHeaders *)v14 updateQueryItemsWithBlock:v21];
      v20.receiver = a1;
      v20.super_class = (Class)GEOFeatureSpecificSimpleTileRequester;
      id v15 = [(GEOSimpleTileRequester *)&v20 kindForTileKey:v29];
      long long v16 = +[GEOExperimentConfiguration sharedConfiguration];
      id v17 = [(GEOURLComponentsWithHeaders *)v14 URLComponents];
      [v16 updateURLComponents:v17 forRequestKind:v15];

      int v18 = GEOURLAuthenticationForComponents(v14, v6);
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

void __68__GEOFeatureSpecificSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(*(void *)(a1 + 56) + 13) >> 2];
  [v7 addItemWithName:@"size" uintValue:*(unsigned char *)(*(void *)(a1 + 56) + 15) & 0xF];
  [v7 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(*(void *)(a1 + 56) + 15) >> 4];
  objc_msgSend(v7, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(void *)(a1 + 56)));
  [v7 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 6) & 0x3F];
  [v7 addItemWithName:@"x" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 46) | (*(_DWORD *)(*(void *)(a1 + 56) + 9) << 18)) & 0x3FFFFFF];
  [v7 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 10) & 0x3FFFFFF];
  [v7 addItemWithName:@"lang" value:*(void *)(a1 + 40)];
  [v7 addItemWithName:@"id" uint64Value:*(void *)(a1 + 64)];
  uint64_t v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 72)];
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