@interface GEOVoltaireTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)checksumMethodForIncomingTileDataWithKey:(uint64_t)a3;
- (BOOL)needsLocalizationForKey:(uint64_t)a3;
- (BOOL)shouldAllowEmptyDataForTileKey:(uint64_t)a3;
- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4;
- (id)_deviceRegionSKUQueryItemForTileSet:(id)a3;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)additionalAnalyticsStatesForKey:(uint64_t)a3;
- (id)localizationURLForTileKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
- (void)failedLoadingTileForKey:(uint64_t)a3 baseOperation:(uint64_t)a4 error:(uint64_t)a5;
@end

@implementation GEOVoltaireTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 2;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:*(unsigned __int16 *)(a3 + 13) >> 2 size:*(unsigned char *)(a3 + 15) & 0xF scale:*(unsigned __int8 *)(a3 + 15) >> 4];

  return v6;
}

- (BOOL)checksumMethodForIncomingTileDataWithKey:(uint64_t)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(a1, "activeTileSetForKey:");
  BOOL v4 = [v3 hasChecksumType] && objc_msgSend(v3, "checksumType") == 1;

  return v4;
}

- (BOOL)shouldAllowEmptyDataForTileKey:(uint64_t)a3
{
  return (((unint64_t)*(unsigned __int16 *)(a3 + 13) << 32) & 0xFFFC00000000) == 0xE400000000;
}

- (id)_deviceRegionSKUQueryItemForTileSet:(id)a3
{
  v3 = [a3 deviceSKUAllowlists];
  if ([v3 count])
  {
    char BOOL = GEOConfigGetBOOL(GeoServicesConfig_SKURegionsServiceAllowlistAppliesToTiles, (uint64_t)off_1E9114AA8);
    v5 = +[GEOPlatform sharedPlatform];
    v6 = v5;
    if (BOOL) {
      [v5 deviceCountrySKUForServiceRequests];
    }
    else {
    v7 = [v5 deviceCountrySKU];
    }

    if (v7 && [v3 containsObject:v7])
    {
      v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"sku" value:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)urlForTileKey:(uint64_t)a3
{
  v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [v5 baseURL];
  if (v6)
  {
    v7 = [[GEOURLComponentsWithHeaders alloc] initWithString:v6];
    if (v7)
    {
      GEOTileKeyAssertIsStandard(a3);
      if (([v5 hasLocalizationURL] & 1) != 0 || !objc_msgSend(v5, "supportedLanguagesCount"))
      {
        v11 = 0;
      }
      else
      {
        v8 = [a1 resourceManifestManager];
        v9 = [a1 tileRequest];
        v10 = [v9 locale];
        v11 = [v8 languageForTileKey:a3 overrideLocale:v10];
      }
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __42__GEOVoltaireTileRequester_urlForTileKey___block_invoke;
      v22 = &unk_1E53E5AF8;
      uint64_t v26 = a3;
      v23 = a1;
      id v24 = v11;
      v12 = v5;
      v25 = v12;
      id v13 = v11;
      [(GEOURLComponentsWithHeaders *)v7 updateQueryItemsWithBlock:&v19];
      uint64_t v14 = objc_msgSend(a1, "kindForTileKey:", a3, v19, v20, v21, v22, v23);
      v15 = +[GEOExperimentConfiguration sharedConfiguration];
      v16 = [(GEOURLComponentsWithHeaders *)v7 URLComponents];
      [v15 updateURLComponents:v16 forRequestKind:v14];

      v17 = GEOURLAuthenticationForComponents(v7, v12);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = [a1 _localizationURLForTileKey:a3];
  }

  return v17;
}

void __42__GEOVoltaireTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  [v12 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(*(void *)(a1 + 56) + 13) >> 2];
  [v12 addItemWithName:@"size" uintValue:*(unsigned char *)(*(void *)(a1 + 56) + 15) & 0xF];
  [v12 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(*(void *)(a1 + 56) + 15) >> 4];
  v3 = [*(id *)(a1 + 32) resourceManifestManager];
  uint64_t v4 = [v3 versionForTileKey:*(void *)(a1 + 56)];

  [v12 addItemWithName:@"v" uintValue:v4];
  [v12 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 6) & 0x3F];
  [v12 addItemWithName:@"x" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 46) | (*(_DWORD *)(*(void *)(a1 + 56) + 9) << 18)) & 0x3FFFFFF];
  [v12 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 10) & 0x3FFFFFF];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v12 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v12, "addItemWithName:value:", @"vlang");
  }
  uint64_t v5 = [*(id *)(a1 + 32) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 56)];
  if (v5) {
    [v12 addItemWithName:@"checksum" intValue:v5];
  }
  v6 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v7 = [v6 queryItems];
  [v12 addItemsFromArray:v7];

  v8 = +[GEOPreflight queryItems];
  [v12 addItemsFromArray:v8];

  v9 = [*(id *)(a1 + 32) resourceManifestManager];
  v10 = [v9 disputedBordersQueryItemsForTileKey:*(void *)(a1 + 56) country:*(void *)(*(void *)(a1 + 32) + 48) region:*(void *)(*(void *)(a1 + 32) + 56)];
  [v12 addItemsFromArray:v10];

  v11 = [*(id *)(a1 + 32) _deviceRegionSKUQueryItemForTileSet:*(void *)(a1 + 48)];
  if (v11) {
    [v12 addItem:v11];
  }
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  uint64_t v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [a1 resourceManifestManager];
  v7 = [a1 tileRequest];
  v8 = [v7 locale];
  v9 = [v6 localizationURLStringIfNecessaryForActiveTileSet:v5 tileKey:a3 overrideLocale:v8];

  if (v9)
  {
    v10 = [[GEOURLComponentsWithHeaders alloc] initWithString:v9];
    if (v10)
    {
      v11 = [a1 tileRequest];
      id v12 = [v11 locale];
      id v13 = [v6 languageForTileKey:a3 overrideLocale:v12];

      if (v13)
      {
        GEOTileKeyAssertIsStandard(a3);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __55__GEOVoltaireTileRequester__localizationURLForTileKey___block_invoke;
        v20[3] = &unk_1E53E5B20;
        uint64_t v25 = a3;
        id v21 = v6;
        id v22 = v13;
        v23 = a1;
        uint64_t v14 = v5;
        id v24 = v14;
        [(GEOURLComponentsWithHeaders *)v10 updateQueryItemsWithBlock:v20];
        uint64_t v15 = [a1 kindForTileKey:a3];
        v16 = +[GEOExperimentConfiguration sharedConfiguration];
        v17 = [(GEOURLComponentsWithHeaders *)v10 URLComponents];
        [v16 updateURLComponents:v17 forRequestKind:v15];

        v18 = GEOURLAuthenticationForComponents(v10, v14);
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __55__GEOVoltaireTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(*(void *)(a1 + 64) + 13) >> 2];
  [v10 addItemWithName:@"size" uintValue:*(unsigned char *)(*(void *)(a1 + 64) + 15) & 0xF];
  [v10 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(*(void *)(a1 + 64) + 15) >> 4];
  objc_msgSend(v10, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(void *)(a1 + 64)));
  [v10 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 64) + 6) & 0x3F];
  [v10 addItemWithName:@"x" uintValue:((*(void *)(*(void *)(a1 + 64) + 1) >> 46) | (*(_DWORD *)(*(void *)(a1 + 64) + 9) << 18)) & 0x3FFFFFF];
  [v10 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 64) + 10) & 0x3FFFFFF];
  [v10 addItemWithName:@"lang" value:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v3) {
    [v10 addItemWithName:@"checksum" intValue:v3];
  }
  uint64_t v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  uint64_t v5 = [v4 queryItems];
  [v10 addItemsFromArray:v5];

  v6 = +[GEOPreflight queryItems];
  [v10 addItemsFromArray:v6];

  v7 = [*(id *)(a1 + 48) resourceManifestManager];
  v8 = [v7 disputedBordersQueryItemsForTileKey:*(void *)(a1 + 64) country:*(void *)(*(void *)(a1 + 48) + 48) region:*(void *)(*(void *)(a1 + 48) + 56)];
  [v10 addItemsFromArray:v8];

  v9 = [*(id *)(a1 + 48) _deviceRegionSKUQueryItemForTileSet:*(void *)(a1 + 56)];
  if (v9) {
    [v10 addItem:v9];
  }
}

- (id)localizationURLForTileKey:(uint64_t)a3
{
  uint64_t v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [v5 baseURL];

  if (v6)
  {
    v7 = [a1 _localizationURLForTileKey:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)needsLocalizationForKey:(uint64_t)a3
{
  uint64_t v5 = [a1 resourceManifestManager];
  v6 = [a1 activeTileSetForKey:a3];
  v7 = [a1 tileRequest];
  v8 = [v7 locale];
  v9 = [v5 localizationURLStringIfNecessaryForActiveTileSet:v6 tileKey:a3 overrideLocale:v8];

  if (v9)
  {
    id v10 = [a1 tileRequest];
    v11 = [v10 locale];
    id v12 = [v6 bestLanguageWithOverrideLocale:v11];

    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1E9114D58) <= a4;
}

- (void)failedLoadingTileForKey:(uint64_t)a3 baseOperation:(uint64_t)a4 error:(uint64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1[192])
  {
    v11 = a6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a6;
    v9 = [v7 arrayWithObjects:&v11 count:1];

    id v10 = objc_msgSend(a1, "resourceManifestManager", v11, v12);
    a1[192] = GEOVoltaireTileRequesterHandleStaleManifestForErrors(v9, v10);
  }
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_alloc_init(GEOLogMsgState);
  [(GEOLogMsgState *)v4 setStateType:706];
  uint64_t v5 = objc_alloc_init(GEOLogMsgStateTileSet);
  [(GEOLogMsgState *)v4 setTileSet:v5];

  v6 = objc_alloc_init(GEOTileSetInfo);
  [(GEOTileSetInfo *)v6 setCount:1];
  unsigned int v11 = 0;
  GEOTileKeyStyle(a3, &v11);
  [(GEOTileSetInfo *)v6 setStyle:v11];
  unsigned int v10 = 0;
  GEOTileKeyZoom(a3, &v10);
  [(GEOTileSetInfo *)v6 setZoom:v10];
  v7 = [(GEOLogMsgState *)v4 tileSet];
  [v7 addTileSetInfo:v6];

  v12[0] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v8;
}

@end