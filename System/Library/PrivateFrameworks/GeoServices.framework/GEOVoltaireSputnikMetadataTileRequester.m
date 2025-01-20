@interface GEOVoltaireSputnikMetadataTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
- (uint64_t)tileEditionForKey:(uint64_t)a3;
- (uint64_t)tileSetForKey:(uint64_t)a3;
@end

@implementation GEOVoltaireSputnikMetadataTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 4;
}

- (uint64_t)tileSetForKey:(uint64_t)a3
{
  return ((HIBYTE(*(void *)(a3 + 1)) | (*(void *)(a3 + 1) >> 24) & 0xFFFF00) << 8) | 2;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForTileType:*(_DWORD *)(a3 + 8) & 0x3FFF scale:0];

  return v6;
}

- (uint64_t)tileEditionForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  uint64_t v6 = [v5 versionForFlyoverRegion:*(_DWORD *)(a3 + 5) & 0xFFFFFF];

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(GEOURLWithHeaders *)v5 baseURL];
  if (v6)
  {
    v7 = [[GEOURLComponentsWithHeaders alloc] initWithString:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__GEOVoltaireSputnikMetadataTileRequester_urlForTileKey___block_invoke;
    v13[3] = &unk_1E53E5928;
    v13[4] = a1;
    v13[5] = a3;
    [(GEOURLComponentsWithHeaders *)v7 updateQueryItemsWithBlock:v13];
    uint64_t v8 = *(void *)(a3 + 4) & 0x3FFF00000000 | 0x100;
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

void __57__GEOVoltaireSputnikMetadataTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(_DWORD **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) tileRequest];
  uint64_t v6 = [v5 manifestConfiguration];
  id v13 = v3;
  v7 = +[GEOResourceManifestManager modernManagerForConfiguration:v6];
  uint64_t v8 = [v7 activeTileGroup];

  [v13 addItemWithName:@"style" uintValue:v4[2] & 0x3FFF];
  uint64_t v9 = *(_DWORD *)((char *)v4 + 5) & 0xFFFFFF;
  objc_msgSend(v13, "addItemWithName:uintValue:", @"v", objc_msgSend(v8, "versionForFlyoverRegion:", v9));
  [v13 addItemWithName:@"part" uintValue:*(unsigned int *)((char *)v4 + 1)];
  [v13 addItemWithName:@"region" uintValue:v9];
  if ([v8 hasDataVersionForFlyoverRegion:v9]) {
    objc_msgSend(v13, "addItemWithName:uintValue:", @"dv", objc_msgSend(v8, "dataVersionForFlyoverRegion:", v9));
  }
  v10 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  v11 = [v10 queryItems];
  [v13 addItemsFromArray:v11];

  v12 = +[GEOPreflight queryItems];
  [v13 addItemsFromArray:v12];
}

@end