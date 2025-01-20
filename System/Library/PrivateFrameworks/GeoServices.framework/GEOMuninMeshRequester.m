@interface GEOMuninMeshRequester
+ (unsigned)tileProviderIdentifier;
- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOMuninMeshRequester

+ (unsigned)tileProviderIdentifier
{
  return 6;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  uint64_t v4 = *(unsigned __int8 *)(a3 + 15) >> 5;
  v5 = [a1 resourceManifestManager];
  uint64_t v6 = [v5 muninBucketURLForId:*(unsigned __int16 *)(a3 + 13) lod:v4];

  unint64_t v7 = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
  uint64_t v8 = *(void *)(a3 + 1);
  v27 = (void *)v6;
  v9 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%0*u", 10, v7);
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, v8);
  v11 = @"mt";
  if (!v4) {
    v11 = @"m";
  }
  v28 = v11;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  for (uint64_t i = 0; i != 20; i += 4)
  {
    v14 = objc_msgSend(v10, "substringWithRange:", i, 4);
    [v12 addObject:v14];
  }
  v15 = NSString;
  v16 = [v12 objectAtIndexedSubscript:0];
  v17 = [v12 objectAtIndexedSubscript:1];
  v18 = [v12 objectAtIndexedSubscript:2];
  v19 = [v12 objectAtIndexedSubscript:3];
  v20 = [v12 objectAtIndexedSubscript:4];
  v21 = [v15 stringWithFormat:@"%@/%@/%@/%@/%@/%@/%@/%u", v16, v17, v18, v19, v20, v29, v28, v4];

  v22 = [v9 URLByAppendingPathComponent:v21];

  if (v22)
  {
    v23 = GEOURLAuthenticationGenerateURL((uint64_t)v22);

    v24 = [GEOURLWithHeaders alloc];
    v25 = [(GEOURLWithHeaders *)v24 initWithURL:v23 headerFields:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end