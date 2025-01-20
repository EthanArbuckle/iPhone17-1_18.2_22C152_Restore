@interface GEOVisualLocalizationMetadataTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)downloadsDataToDisk;
- (id)activeTileSetForKey:(void *)a1;
- (id)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOVisualLocalizationMetadataTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 14;
}

- (id)activeTileSetForKey:(void *)a1
{
  v1 = [a1 resourceManifestManager];
  v2 = [v1 activeTileGroup];
  v3 = [v2 activeTileSetForStyle:70 size:2 scale:0];

  return v3;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (id)urlForTileKey:(uint64_t)a3
{
  v4 = objc_msgSend(a1, "activeTileSetForKey:");
  v5 = [v4 baseURL];
  if (v5)
  {
    v6 = [[GEOURLComponentsWithHeaders alloc] initWithString:v5];
    if (v6)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __60__GEOVisualLocalizationMetadataTileRequester_urlForTileKey___block_invoke;
      v28 = &unk_1E53E99C8;
      v7 = v4;
      v29 = v7;
      [(GEOURLComponentsWithHeaders *)v6 updateQueryItemsWithBlock:&v25];
      *((void *)&v8 + 1) = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
      *(void *)&long long v8 = *(void *)(a3 + 1);
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", (v8 >> 46) & 0x3FFFFFF, v25, v26, v27, v28);
      v10 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
      [v10 setObject:v9 forKeyedSubscript:@"Maps-Tile-X"];

      v11 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", ((*(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF);
      v12 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
      [v12 setObject:v11 forKeyedSubscript:@"Maps-Tile-Y"];

      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", (*(void *)(a3 + 1) >> 40) & 0x3FLL);
      v14 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
      [v14 setObject:v13 forKeyedSubscript:@"Maps-Tile-Z"];

      unsigned int v15 = *(_DWORD *)(a3 + 1);
      if (((v15 >> 6) & 0x1FF) != 0)
      {
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", (v15 >> 6) & 0x1FF);
        v17 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
        [v17 setObject:v16 forKeyedSubscript:@"Maps-VL-Data-Max-Format-Version"];

        unsigned int v15 = *(_DWORD *)(a3 + 1);
      }
      uint64_t v18 = v15 & 0x3F;
      if (v18)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v18);
        v20 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
        [v20 setObject:v19 forKeyedSubscript:@"Maps-VL-Data-Max-Output-Version"];
      }
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 1);
      v22 = [(GEOURLComponentsWithHeaders *)v6 headerFields];
      [v22 setObject:v21 forKeyedSubscript:@"Maps-VL-Metadata-Max-Format-Version"];

      v23 = GEOURLAuthenticationForComponents(v6, v7);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __60__GEOVisualLocalizationMetadataTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "addItemWithName:uintValue:", @"v", objc_msgSend(v2, "version"));
  id v4 = +[GEOPreflight queryItems];
  [v3 addItemsFromArray:v4];
}

@end