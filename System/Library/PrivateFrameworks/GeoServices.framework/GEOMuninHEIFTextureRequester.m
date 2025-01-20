@interface GEOMuninHEIFTextureRequester
+ (unsigned)tileProviderIdentifier;
- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOMuninHEIFTextureRequester

+ (unsigned)tileProviderIdentifier
{
  return 7;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  v3 = (unsigned int *)(a3 + 9);
  unsigned int v4 = *(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16);
  unint64_t v5 = *(unsigned int *)(a3 + 9) | ((*(void *)&v4 & 0xFFFFFFLL) << 32);
  uint64_t v6 = v4 >> 21;
  v7 = [a1 resourceManifestManager];
  uint64_t v8 = [v7 muninBucketURLForId:*((unsigned __int16 *)v3 + 2) lod:v6];

  unint64_t v9 = *v3 | ((unint64_t)(*((unsigned __int16 *)v3 + 2) | (*((unsigned __int8 *)v3 + 6) << 16)) << 32);
  uint64_t v10 = *((void *)v3 - 1);
  v31 = (void *)v8;
  v29 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  v30 = objc_msgSend(NSString, "stringWithFormat:", @"%0*u", 10, v9);
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, v10);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  for (uint64_t i = 0; i != 20; i += 4)
  {
    v14 = objc_msgSend(v11, "substringWithRange:", i, 4);
    [v12 addObject:v14];
  }
  unint64_t v15 = v5 >> 53;
  uint64_t v16 = HIWORD(v9) & 0x1F;
  v17 = NSString;
  v18 = [v12 objectAtIndexedSubscript:0];
  v19 = [v12 objectAtIndexedSubscript:1];
  v20 = [v12 objectAtIndexedSubscript:2];
  v21 = [v12 objectAtIndexedSubscript:3];
  v22 = [v12 objectAtIndexedSubscript:4];
  v23 = [v17 stringWithFormat:@"%@/%@/%@/%@/%@/%@/t/%u/%u", v18, v19, v20, v21, v22, v30, v16, v15];

  v24 = [v29 URLByAppendingPathComponent:v23];

  if (v24)
  {
    v25 = GEOURLAuthenticationGenerateURL((uint64_t)v24);

    v26 = [GEOURLWithHeaders alloc];
    v27 = [(GEOURLWithHeaders *)v26 initWithURL:v25 headerFields:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

@end