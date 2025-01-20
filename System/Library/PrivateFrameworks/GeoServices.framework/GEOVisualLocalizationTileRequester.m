@interface GEOVisualLocalizationTileRequester
+ (unsigned)tileProviderIdentifier;
- (BOOL)downloadsDataToDisk;
- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3;
- (id)activeTileSetForKey:(void *)a1;
- (id)additionalAnalyticsStatesForKey:(uint64_t)a3;
@end

@implementation GEOVisualLocalizationTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 15;
}

- (id)activeTileSetForKey:(void *)a1
{
  v1 = [a1 resourceManifestManager];
  v2 = [v1 activeTileGroup];
  v3 = [v2 activeTileSetForStyle:71 size:2 scale:0];

  return v3;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [v5 baseURL];
  if (v6)
  {
    v7 = [a1 tileRequest];
    v8 = [v7 additionalInfos];
    v9 = [v8 objectForKey:a3];

    if (v9)
    {
      v10 = _GEOVisualLocalizationTileURLPathForKey(a3, [v9 bytes]);
      if (v10
        && ([MEMORY[0x1E4F1CB10] URLWithString:v6],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 URLByAppendingPathComponent:v10],
            v12 = objc_claimAutoreleasedReturnValue(),
            v11,
            v12))
      {
        v13 = [[GEOURLComponentsWithHeaders alloc] initWithURL:v12];
        if (v13)
        {
          uint64_t v15 = GEOURLAuthenticationGenerateURL((uint64_t)v12);

          v16 = [GEOURLWithHeaders alloc];
          v14 = [(GEOURLWithHeaders *)v16 initWithURL:v15 headerFields:MEMORY[0x1E4F1CC08]];
          v12 = (void *)v15;
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(GEOLogMsgState);
  [(GEOLogMsgState *)v4 setStateType:706];
  v5 = objc_alloc_init(GEOLogMsgStateTileSet);
  [(GEOLogMsgState *)v4 setTileSet:v5];

  v6 = objc_alloc_init(GEOTileSetInfo);
  [(GEOTileSetInfo *)v6 setCount:1];
  [(GEOTileSetInfo *)v6 setUncertainty:*(unsigned __int8 *)(a3 + 9)];
  [(GEOTileSetInfo *)v6 setZoom:*(_DWORD *)(a3 + 10) & 0x1F];
  [(GEOTileSetInfo *)v6 setStyle:71];
  v7 = [(GEOLogMsgState *)v4 tileSet];
  [v7 addTileSetInfo:v6];

  v10[0] = v4;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

@end