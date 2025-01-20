@interface GEOVoltaireSimple3DTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)tileEditionForKey:(uint64_t)a3;
- (unint64_t)tileSetForKey:(uint64_t)a3;
@end

@implementation GEOVoltaireSimple3DTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 3;
}

- (unint64_t)tileSetForKey:(uint64_t)a3
{
  return ((((*(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32)) >> 26) & 0xFF0000FF | ((unsigned __int16)(*(_DWORD *)(a3 + 9) >> 2) << 8)) << 8) | 2;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  unsigned int v6 = *(unsigned __int16 *)(a3 + 13);
  int v7 = v6 | (*(unsigned __int8 *)(a3 + 15) << 16);
  v8 = [v5 activeTileSetForStyle:((*(unsigned int *)(a3 + 9) | ((*(void *)&v7 & 0xFFFFFFuLL) << 32)) >> 26) & 0x3FFF size:v6 >> 8 scale:HIWORD(v7)];

  return v8;
}

- (uint64_t)tileEditionForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  uint64_t v6 = [v5 versionForFlyoverRegion:(*(_DWORD *)(a3 + 9) >> 2) & 0xFFFFFF];

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(GEOURLWithHeaders *)v5 baseURL];
  if (v6)
  {
    int v7 = [[GEOURLComponentsWithHeaders alloc] initWithString:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__GEOVoltaireSimple3DTileRequester_urlForTileKey___block_invoke;
    v13[3] = &unk_1E53E5928;
    v13[4] = a1;
    v13[5] = a3;
    [(GEOURLComponentsWithHeaders *)v7 updateQueryItemsWithBlock:v13];
    uint64_t v8 = [a1 kindForTileKey:a3];
    v9 = +[GEOExperimentConfiguration sharedConfiguration];
    v10 = [(GEOURLComponentsWithHeaders *)v7 URLComponents];
    [v9 updateURLComponents:v10 forRequestKind:v8];

    v11 = GEOURLAuthenticationForComponents(v7, v5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __50__GEOVoltaireSimple3DTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [*(id *)(a1 + 32) tileRequest];
  uint64_t v6 = [v5 manifestConfiguration];
  id v15 = v3;
  int v7 = +[GEOResourceManifestManager modernManagerForConfiguration:v6];
  uint64_t v8 = [v7 activeTileGroup];

  [v15 addItemWithName:@"style" uintValue:((*(unsigned int *)(v4 + 9) | ((unint64_t)(*(unsigned __int16 *)(v4 + 13) | (*(unsigned __int8 *)(v4 + 15) << 16)) << 32)) >> 26) & 0x3FFF];
  uint64_t v9 = (*(_DWORD *)(v4 + 9) >> 2) & 0xFFFFFF;
  objc_msgSend(v15, "addItemWithName:uintValue:", @"v", objc_msgSend(v8, "versionForFlyoverRegion:", v9));
  [v15 addItemWithName:@"region" uintValue:v9];
  [v15 addItemWithName:@"z" uintValue:*(_DWORD *)(v4 + 1) & 0x3F];
  [v15 addItemWithName:@"x" uintValue:*(_DWORD *)(v4 + 1) >> 6];
  [v15 addItemWithName:@"y" uintValue:*(_DWORD *)(v4 + 5) & 0x3FFFFFF];
  if ([v8 hasDataVersionForFlyoverRegion:v9]) {
    objc_msgSend(v15, "addItemWithName:uintValue:", @"dv", objc_msgSend(v8, "dataVersionForFlyoverRegion:", v9));
  }
  unint64_t v10 = *(unsigned int *)(v4 + 9) | ((unint64_t)(*(unsigned __int16 *)(v4 + 13) | (*(unsigned __int8 *)(v4 + 15) << 16)) << 32);
  if (((v10 >> 26) & 0x3FFF) <= 0x34 && ((1 << (v10 >> 26)) & 0x101C0000008000) != 0) {
    [v15 addItemWithName:@"h" uintValue:(*(void *)(v4 + 1) >> 58) | (*(_DWORD *)(v4 + 9) << 6)];
  }
  v12 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v13 = [v12 queryItems];
  [v15 addItemsFromArray:v13];

  v14 = +[GEOPreflight queryItems];
  [v15 addItemsFromArray:v14];
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1E9114D58) <= a4;
}

@end