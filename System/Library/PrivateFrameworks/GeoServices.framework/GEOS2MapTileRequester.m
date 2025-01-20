@interface GEOS2MapTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOS2MapTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 16;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:((*(void *)(a3 + 1) >> 61) | (8 * *(_DWORD *)(a3 + 9))) & 0x3FFF size:(*(_DWORD *)(a3 + 9) >> 11) & 0xF scale:(*(_DWORD *)(a3 + 9) >> 15) & 0xF];

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [v5 baseURL];
  if (v6)
  {
    if (([v5 hasLocalizationURL] & 1) != 0 || !objc_msgSend(v5, "supportedLanguagesCount"))
    {
      v10 = 0;
    }
    else
    {
      v7 = [a1 resourceManifestManager];
      v8 = [a1 tileRequest];
      v9 = [v8 locale];
      v10 = [v7 languageForTileKey:a3 overrideLocale:v9];
    }
    v11 = [[GEOURLComponentsWithHeaders alloc] initWithString:v6];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__GEOS2MapTileRequester_urlForTileKey___block_invoke;
    v20[3] = &unk_1E53E5AF8;
    uint64_t v24 = a3;
    v12 = v5;
    v21 = v12;
    id v22 = v10;
    v23 = a1;
    id v13 = v10;
    [(GEOURLComponentsWithHeaders *)v11 updateQueryItemsWithBlock:v20];
    v19.receiver = a1;
    v19.super_class = (Class)GEOS2MapTileRequester;
    id v14 = [(GEOSimpleTileRequester *)&v19 kindForTileKey:a3];
    v15 = +[GEOExperimentConfiguration sharedConfiguration];
    v16 = [(GEOURLComponentsWithHeaders *)v11 URLComponents];
    [v15 updateURLComponents:v16 forRequestKind:v14];

    v17 = GEOURLAuthenticationForComponents(v11, v12);
  }
  else
  {
    v17 = [a1 _localizationURLForTileKey:a3];
  }

  return v17;
}

void __39__GEOS2MapTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 61) | (8 * *(_DWORD *)(*(void *)(a1 + 56) + 9))) & 0x3FFF];
  [v7 addItemWithName:@"size" uintValue:(*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 11) & 0xF];
  [v7 addItemWithName:@"scale" uintValue:(*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 15) & 0xF];
  objc_msgSend(v7, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "version"));
  [v7 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) & 0x3F];
  [v7 addItemWithName:@"x" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) >> 6];
  [v7 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 5) & 0x3FFFFFF];
  [v7 addItemWithName:@"f" uintValue:(*(void *)(*(void *)(a1 + 56) + 1) >> 58) & 7];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v7 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v7, "addItemWithName:value:", @"vlang");
  }
  v3 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v4 = [v3 queryItems];
  [v7 addItemsFromArray:v4];

  v5 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v5];

  uint64_t v6 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 56)];
  if (v6) {
    [v7 addItemWithName:@"checksum" intValue:v6];
  }
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  id v7 = [a1 tileRequest];
  v8 = [v7 locale];
  v9 = [v5 localizationURLStringIfNecessaryForActiveTileSet:v6 tileKey:a3 overrideLocale:v8];

  if (v9)
  {
    v10 = [a1 tileRequest];
    v11 = [v10 locale];
    v12 = [v5 languageForTileKey:a3 overrideLocale:v11];

    if (v12)
    {
      id v13 = [[GEOURLComponentsWithHeaders alloc] initWithString:v9];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__GEOS2MapTileRequester__localizationURLForTileKey___block_invoke;
      v21[3] = &unk_1E53E5AF8;
      uint64_t v25 = a3;
      id v14 = v6;
      id v22 = v14;
      id v23 = v12;
      uint64_t v24 = a1;
      [(GEOURLComponentsWithHeaders *)v13 updateQueryItemsWithBlock:v21];
      v20.receiver = a1;
      v20.super_class = (Class)GEOS2MapTileRequester;
      id v15 = [(GEOSimpleTileRequester *)&v20 kindForTileKey:a3];
      v16 = +[GEOExperimentConfiguration sharedConfiguration];
      v17 = [(GEOURLComponentsWithHeaders *)v13 URLComponents];
      [v16 updateURLComponents:v17 forRequestKind:v15];

      v18 = GEOURLAuthenticationForComponents(v13, v14);
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

void __52__GEOS2MapTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 61) | (8 * *(_DWORD *)(*(void *)(a1 + 56) + 9))) & 0x3FFF];
  [v7 addItemWithName:@"size" uintValue:(*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 11) & 0xF];
  [v7 addItemWithName:@"scale" uintValue:(*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 15) & 0xF];
  objc_msgSend(v7, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "version"));
  [v7 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) & 0x3F];
  [v7 addItemWithName:@"x" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) >> 6];
  [v7 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 5) & 0x3FFFFFF];
  [v7 addItemWithName:@"f" uintValue:(*(void *)(*(void *)(a1 + 56) + 1) >> 58) & 7];
  [v7 addItemWithName:@"lang" value:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 56)];
  if (v3) {
    [v7 addItemWithName:@"checksum" intValue:v3];
  }
  v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v5 = [v4 queryItems];
  [v7 addItemsFromArray:v5];

  uint64_t v6 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v6];
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1E9114D58) <= a4;
}

@end