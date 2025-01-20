@interface GEOIdentifiedMapDataRequester
+ (uint64_t)tileSetForKey:(uint64_t)a3;
+ (unsigned)tileProviderIdentifier;
- (BOOL)checksumMethodForIncomingTileDataWithKey:(uint64_t)a3;
- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4;
- (GEOURLComponentsWithHeaders)_urlComponentsForKey:(uint64_t)a3 url:(void *)a4;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOIdentifiedMapDataRequester

+ (unsigned)tileProviderIdentifier
{
  return 9;
}

+ (uint64_t)tileSetForKey:(uint64_t)a3
{
  return (*(unsigned __int8 *)(a3 + 10) << 8) | 0x800001u;
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

- (id)activeTileSetForKey:(uint64_t)a3
{
  BOOL v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:*(unsigned __int8 *)(a3 + 10)];

  return v6;
}

- (GEOURLComponentsWithHeaders)_urlComponentsForKey:(uint64_t)a3 url:(void *)a4
{
  id v6 = a4;
  v7 = [[GEOURLComponentsWithHeaders alloc] initWithURL:v6];

  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__GEOIdentifiedMapDataRequester__urlComponentsForKey_url___block_invoke;
    v19[3] = &unk_1E53E5928;
    v19[4] = a1;
    v19[5] = a3;
    [(GEOURLComponentsWithHeaders *)v7 updateQueryItemsWithBlock:v19];
    uint64_t v8 = *(unsigned __int8 *)(a3 + 10);
    if (v8 == 60)
    {
      v9 = [MEMORY[0x1E4F1CA48] array];
      if (*(_DWORD *)(a3 + 11))
      {
        v10 = [@"application/vnd.apple.maps.materialtex=" stringByAppendingString:@"astc"];;
        [v9 addObject:v10];
      }
      v11 = [@"application/vnd.apple.maps.materialtex=" stringByAppendingString:@"png"];;
      [v9 addObject:v11];

      v12 = [v9 componentsJoinedByString:@", "];
      v13 = [(GEOURLComponentsWithHeaders *)v7 headerFields];
      [v13 setObject:v12 forKeyedSubscript:@"Accept"];

      uint64_t v8 = *(unsigned __int8 *)(a3 + 10);
    }
    uint64_t v14 = (v8 << 32) | 0x100;
    v15 = +[GEOExperimentConfiguration sharedConfiguration];
    v16 = [(GEOURLComponentsWithHeaders *)v7 URLComponents];
    [v15 updateURLComponents:v16 forRequestKind:v14];

    v17 = v7;
  }

  return v7;
}

void __58__GEOIdentifiedMapDataRequester__urlComponentsForKey_url___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 addItemWithName:@"style" uintValue:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10)];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v7 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  uint64_t v3 = [*(id *)(a1 + 32) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 40)];
  if (v3) {
    [v7 addItemWithName:@"checksum" intValue:v3];
  }
  BOOL v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v5 = [v4 queryItems];
  [v7 addItemsFromArray:v5];

  id v6 = +[GEOPreflight queryItems];
  [v7 addItemsFromArray:v6];
}

- (id)urlForTileKey:(uint64_t)a3
{
  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  id v6 = [(GEOURLWithHeaders *)v5 baseURL];
  if (v6 && ([MEMORY[0x1E4F1CB10] URLWithString:v6], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = (void *)v7;
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", *(void *)(a3 + 1));
    v10 = [v8 URLByAppendingPathComponent:v9];

    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%u", -[GEOURLWithHeaders version](v5, "version"));
    v12 = [v10 URLByAppendingPathComponent:v11];

    v13 = [a1 _urlComponentsForKey:a3 url:v12];
    uint64_t v14 = GEOURLAuthenticationForComponents(v13, v5);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1E9114D58) <= a4;
}

@end