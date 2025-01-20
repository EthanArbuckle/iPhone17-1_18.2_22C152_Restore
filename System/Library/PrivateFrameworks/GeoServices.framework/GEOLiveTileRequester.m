@interface GEOLiveTileRequester
+ (unsigned)tileProviderIdentifier;
- (id)_localizationURLForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(uint64_t)a3;
- (id)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOLiveTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 18;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:((*(void *)(a3 + 1) >> 58) | (*(_DWORD *)(a3 + 9) << 6)) & 0x3FFF size:(*(_DWORD *)(a3 + 9) >> 8) & 0xF scale:(unsigned __int16)*(_DWORD *)(a3 + 9) >> 12];

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  if ((*(_DWORD *)(a3 + 9) & 0xF0000) != 0)
  {
    v5 = objc_msgSend(a1, "activeTileSetForKey:");
    v6 = [v5 baseURL];
    if (v6)
    {
      v7 = [[GEOURLComponentsWithHeaders alloc] initWithString:v6];
      if (v7)
      {
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
        v21 = __38__GEOLiveTileRequester_urlForTileKey___block_invoke;
        v22 = &unk_1E53E5AF8;
        uint64_t v26 = a3;
        v13 = v5;
        v23 = v13;
        id v24 = v11;
        v25 = a1;
        id v14 = v11;
        [(GEOURLComponentsWithHeaders *)v7 updateQueryItemsWithBlock:&v19];
        uint64_t v15 = objc_msgSend(a1, "kindForTileKey:", a3, v19, v20, v21, v22);
        v16 = +[GEOExperimentConfiguration sharedConfiguration];
        v17 = [(GEOURLComponentsWithHeaders *)v7 URLComponents];
        [v16 updateURLComponents:v17 forRequestKind:v15];

        v12 = GEOURLAuthenticationForComponents(v7, v13);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = [a1 _localizationURLForTileKey:a3];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __38__GEOLiveTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 addItemWithName:@"style" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 58) | (*(_DWORD *)(*(void *)(a1 + 56) + 9) << 6)) & 0x3FFF];
  [v5 addItemWithName:@"size" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 10) & 0xF];
  [v5 addItemWithName:@"scale" uintValue:(unsigned __int16)*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 12];
  objc_msgSend(v5, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "version"));
  [v5 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) & 0x3F];
  [v5 addItemWithName:@"x" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) >> 6];
  [v5 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 5) & 0x3FFFFFF];
  [v5 addItemWithName:@"domain" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 11) & 0xF];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v5 addItemWithName:@"vertical_datum" value:@"wgs84"];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v5, "addItemWithName:value:", @"vlang");
  }
  int v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 56)];
  v4 = v5;
  if (v3)
  {
    objc_msgSend(v5, "addItemWithName:intValue:", @"checksum");
    v4 = v5;
  }
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  if ((*(_DWORD *)(a3 + 9) & 0xF0000) != 0)
  {
    id v5 = objc_msgSend(a1, "activeTileSetForKey:");
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
        v12 = [v11 locale];
        v13 = [v6 languageForTileKey:a3 overrideLocale:v12];

        if (v13)
        {
          uint64_t v20 = MEMORY[0x1E4F143A8];
          uint64_t v21 = 3221225472;
          v22 = __51__GEOLiveTileRequester__localizationURLForTileKey___block_invoke;
          v23 = &unk_1E53E5AF8;
          uint64_t v27 = a3;
          id v14 = v5;
          id v24 = v14;
          id v25 = v13;
          uint64_t v26 = a1;
          [(GEOURLComponentsWithHeaders *)v10 updateQueryItemsWithBlock:&v20];
          uint64_t v15 = objc_msgSend(a1, "kindForTileKey:", a3, v20, v21, v22, v23);
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
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __51__GEOLiveTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 addItemWithName:@"style" uintValue:((*(void *)(*(void *)(a1 + 56) + 1) >> 58) | (*(_DWORD *)(*(void *)(a1 + 56) + 9) << 6)) & 0x3FFF];
  [v9 addItemWithName:@"size" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 10) & 0xF];
  [v9 addItemWithName:@"scale" uintValue:(unsigned __int16)*(_DWORD *)(*(void *)(a1 + 56) + 9) >> 12];
  objc_msgSend(v9, "addItemWithName:uintValue:", @"v", objc_msgSend(*(id *)(a1 + 32), "version"));
  [v9 addItemWithName:@"z" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) & 0x3F];
  [v9 addItemWithName:@"x" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 1) >> 6];
  [v9 addItemWithName:@"y" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 5) & 0x3FFFFFF];
  [v9 addItemWithName:@"domain" uintValue:*(_DWORD *)(*(void *)(a1 + 56) + 11) & 0xF];
  [v9 addItemWithName:@"lang" value:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) checksumMethodForIncomingTileDataWithKey:*(void *)(a1 + 56)];
  if (v3) {
    [v9 addItemWithName:@"checksum" intValue:v3];
  }
  v4 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  id v5 = [v4 queryItems];
  [v9 addItemsFromArray:v5];

  v6 = +[GEOPreflight queryItems];
  [v9 addItemsFromArray:v6];

  v7 = [*(id *)(a1 + 48) resourceManifestManager];
  v8 = [v7 disputedBordersQueryItemsForTileKey:*(void *)(a1 + 56) country:*(void *)(*(void *)(a1 + 48) + 48) region:*(void *)(*(void *)(a1 + 48) + 56)];
  [v9 addItemsFromArray:v8];
}

@end