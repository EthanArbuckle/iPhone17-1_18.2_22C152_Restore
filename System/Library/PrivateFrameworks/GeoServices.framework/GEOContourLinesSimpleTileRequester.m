@interface GEOContourLinesSimpleTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3 units:(unsigned char *)a4;
@end

@implementation GEOContourLinesSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 20;
}

- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3 units:(unsigned char *)a4
{
  if (!a3 || (*(unsigned char *)a3 & 0x7F) != 0x14) {
    return 0;
  }
  unint64_t v4 = *(void *)(a3 + 1);
  if (a4) {
    *a4 = (v4 >> 62) | (4 * *(unsigned char *)(a3 + 9));
  }
  *(void *)((char *)&v6 + 1) = ((unint64_t)(v4 >> 6) << 46) | ((v4 & 0x3F) << 40);
  LOBYTE(v6) = [(id)objc_opt_class() tileProviderIdentifier] & 0x7F;
  return v6;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  unint64_t v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  long long v6 = [v5 activeTileSetForStyle:90 size:(*(void *)(a3 + 1) >> 58) & 0xFLL scale:0];

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = [a1 resourceManifestManager];
  long long v6 = [a1 activeTileSetForKey:a3];
  char v19 = 0;
  *(void *)&long long v27 = [a1 _regularTileKeyForContourLinesTileKey:a3 units:&v19];
  *((void *)&v27 + 1) = v7;
  if (v19) {
    v8 = @"meters";
  }
  else {
    v8 = @"feet";
  }
  v9 = v8;
  v10 = [v6 baseURL];
  if (v10)
  {
    v11 = [[GEOURLComponentsWithHeaders alloc] initWithString:v10];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__GEOContourLinesSimpleTileRequester_urlForTileKey___block_invoke;
    v20[3] = &unk_1E53F5758;
    long long v26 = v27;
    id v21 = v5;
    v22 = v9;
    v23 = a1;
    uint64_t v25 = a3;
    v12 = v6;
    v24 = v12;
    [(GEOURLComponentsWithHeaders *)v11 updateQueryItemsWithBlock:v20];
    v18.receiver = a1;
    v18.super_class = (Class)GEOContourLinesSimpleTileRequester;
    id v13 = [(GEOSimpleTileRequester *)&v18 kindForTileKey:&v27];
    v14 = +[GEOExperimentConfiguration sharedConfiguration];
    v15 = [(GEOURLComponentsWithHeaders *)v11 URLComponents];
    [v14 updateURLComponents:v15 forRequestKind:v13];

    v16 = GEOURLAuthenticationForComponents(v11, v12);
  }
  else
  {
    v16 = [a1 _localizationURLForTileKey:a3];
  }

  return v16;
}

void __52__GEOContourLinesSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 addItemWithName:@"style" uintValue:*(unsigned __int16 *)(a1 + 85) >> 2];
  [v8 addItemWithName:@"size" uintValue:*(unsigned char *)(a1 + 87) & 0xF];
  [v8 addItemWithName:@"scale" uintValue:*(unsigned __int8 *)(a1 + 87) >> 4];
  objc_msgSend(v8, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", a1 + 72));
  [v8 addItemWithName:@"z" uintValue:*(_DWORD *)(a1 + 78) & 0x3F];
  [v8 addItemWithName:@"x" uintValue:((*(void *)(a1 + 73) >> 46) | (*(_DWORD *)(a1 + 81) << 18)) & 0x3FFFFFF];
  [v8 addItemWithName:@"y" uintValue:*(_DWORD *)(a1 + 82) & 0x3FFFFFF];
  [v8 addItemWithName:@"units" value:*(void *)(a1 + 40)];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v8 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  v3 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  unint64_t v4 = [v3 queryItems];
  [v8 addItemsFromArray:v4];

  v5 = +[GEOPreflight queryItems];
  [v8 addItemsFromArray:v5];

  uint64_t v6 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v6) {
    [v8 addItemWithName:@"checksum" intValue:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 56) disputedBordersQueryItemsForCountry:*(void *)(*(void *)(a1 + 48) + 48) region:*(void *)(*(void *)(a1 + 48) + 56)];
  [v8 addItemsFromArray:v7];
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = [a1 resourceManifestManager];
  uint64_t v6 = [a1 activeTileSetForKey:a3];
  char v23 = 0;
  *(void *)&long long v31 = [a1 _regularTileKeyForContourLinesTileKey:a3 units:&v23];
  *((void *)&v31 + 1) = v7;
  if (v23) {
    id v8 = @"meters";
  }
  else {
    id v8 = @"feet";
  }
  v9 = v8;
  v10 = [a1 tileRequest];
  v11 = [v10 locale];
  v12 = [v5 localizationURLStringIfNecessaryForActiveTileSet:v6 tileKey:&v31 overrideLocale:v11];

  if (v12)
  {
    id v13 = [a1 tileRequest];
    v14 = [v13 locale];
    v15 = [v5 languageForTileKey:&v31 overrideLocale:v14];

    if (v15)
    {
      v16 = [[GEOURLComponentsWithHeaders alloc] initWithString:v12];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __65__GEOContourLinesSimpleTileRequester__localizationURLForTileKey___block_invoke;
      v24[3] = &unk_1E53F5758;
      long long v30 = v31;
      id v25 = v5;
      id v26 = v15;
      long long v27 = v9;
      uint64_t v28 = a1;
      uint64_t v29 = a3;
      [(GEOURLComponentsWithHeaders *)v16 updateQueryItemsWithBlock:v24];
      v22.receiver = a1;
      v22.super_class = (Class)GEOContourLinesSimpleTileRequester;
      id v17 = [(GEOSimpleTileRequester *)&v22 kindForTileKey:&v31];
      objc_super v18 = +[GEOExperimentConfiguration sharedConfiguration];
      char v19 = [(GEOURLComponentsWithHeaders *)v16 URLComponents];
      [v18 updateURLComponents:v19 forRequestKind:v17];

      v20 = GEOURLAuthenticationForComponents(v16, v6);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __65__GEOContourLinesSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
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
  [v7 addItemWithName:@"units" value:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 56) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 64)];
  if (v3) {
    [v7 addItemWithName:@"checksum" intValue:v3];
  }
  unint64_t v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v5 = [v4 queryItems];
  [v7 addItemsFromArray:v5];

  uint64_t v6 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v6];
}

@end