@interface GEOMuninTileRequester
+ (unsigned)tileProviderIdentifier;
- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3;
- (id)additionalAnalyticsStatesForKey:(uint64_t)a3;
- (uint64_t)activeTileSetForKey:;
- (uint64_t)shouldReportAnalyticsOnErrorForTileKey:;
- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:;
- (uint64_t)shouldReportAnalyticsOnSuccessForTileKey:;
- (uint64_t)tileEditionForKey:;
- (uint64_t)tileSetForKey:;
@end

@implementation GEOMuninTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 5;
}

- (uint64_t)tileSetForKey:
{
  return 3;
}

- (uint64_t)activeTileSetForKey:
{
  return 0;
}

- (uint64_t)tileEditionForKey:
{
  return 0;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  unsigned int v4 = *(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16);
  unint64_t v5 = *(unsigned int *)(a3 + 9) | ((*(void *)&v4 & 0xFFFFFFLL) << 32);
  uint64_t v6 = *(void *)(a3 + 1);
  uint64_t v7 = v4 >> 22;
  v8 = [a1 resourceManifestManager];
  v9 = [v8 muninBucketURLForId:*(unsigned __int16 *)(a3 + 13) lod:v7];

  v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  v27 = [v10 URLByAppendingPathComponent:@"vs-mesh"];

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, v6);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  for (uint64_t i = 0; i != 20; i += 4)
  {
    v14 = objc_msgSend(v11, "substringWithRange:", i, 4);
    [v12 addObject:v14];
  }
  v26 = NSString;
  v15 = [v12 objectAtIndexedSubscript:0];
  v16 = [v12 objectAtIndexedSubscript:1];
  v17 = [v12 objectAtIndexedSubscript:2];
  v18 = [v12 objectAtIndexedSubscript:3];
  v19 = [v12 objectAtIndexedSubscript:4];
  v20 = [v26 stringWithFormat:@"%@/%@/%@/%@/%@/%u/%u/%u", v15, v16, v17, v18, v19, v5, HIWORD(v5) & 0x1F, v5 >> 54];

  v21 = [v27 URLByAppendingPathComponent:v20];

  if (v21)
  {
    v22 = GEOURLAuthenticationGenerateURL((uint64_t)v21);

    v23 = [GEOURLWithHeaders alloc];
    v24 = [(GEOURLWithHeaders *)v23 initWithURL:v22 headerFields:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (uint64_t)shouldReportAnalyticsOnSuccessForTileKey:
{
  return 1;
}

- (uint64_t)shouldReportAnalyticsOnErrorForTileKey:
{
  return 1;
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_alloc_init(GEOLogMsgState);
  [(GEOLogMsgState *)v5 setStateType:717];
  uint64_t v6 = objc_alloc_init(GEOLogMsgStateMuninResource);
  [(GEOLogMsgState *)v5 setMuninResource:v6];

  uint64_t v7 = [a1 resourceManifestManager];
  v8 = [v7 muninBucketURLForId:*(unsigned __int16 *)(a3 + 13) lod:*(unsigned __int8 *)(a3 + 15) >> 5];
  v9 = [(GEOLogMsgState *)v5 muninResource];
  [v9 setAssetBucket:v8];

  uint64_t v10 = *(unsigned __int8 *)(a3 + 15) >> 5;
  v11 = [(GEOLogMsgState *)v5 muninResource];
  [v11 setLevelOfDetail:v10];

  v14[0] = v5;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v12;
}

@end