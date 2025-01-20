@interface GEOLegacyVisualLocalizationTileRequester
+ (unsigned)tileProviderIdentifier;
- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3;
@end

@implementation GEOLegacyVisualLocalizationTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 13;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "activeTileSetForKey:");
  v6 = [v5 baseURL];
  if (v6)
  {
    v7 = [a1 tileRequest];
    v8 = [v7 additionalInfos];
    v9 = [v8 objectForKey:a3];

    if (v9)
    {
      v10 = (uint64_t *)[v9 bytes];
      char v21 = *(unsigned char *)a3 & 0x80 | 0xF;
      uint64_t v22 = *v10;
      char v23 = *(unsigned char *)(a3 + 3);
      *((void *)&v12 + 1) = *(unsigned int *)(a3 + 12);
      *(void *)&long long v12 = *(void *)(a3 + 4);
      uint64_t v11 = v12 >> 22;
      __int16 v25 = WORD2(v11) & 0x7FFF;
      int v24 = v11 & 0xFC000000 | ((unint64_t)v12 >> 17) & 0x3FFFFE0 | WORD1(v12) & 0x1F;
      v13 = _GEOVisualLocalizationTileURLPathForKey((uint64_t)&v21, (uint64_t)v10);
      if (v13
        && ([MEMORY[0x1E4F1CB10] URLWithString:v6],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v14 URLByAppendingPathComponent:v13],
            v15 = objc_claimAutoreleasedReturnValue(),
            v14,
            v15))
      {
        v16 = [[GEOURLComponentsWithHeaders alloc] initWithURL:v15];
        if (v16)
        {
          uint64_t v18 = GEOURLAuthenticationGenerateURL((uint64_t)v15);

          v19 = [GEOURLWithHeaders alloc];
          v17 = [(GEOURLWithHeaders *)v19 initWithURL:v18 headerFields:MEMORY[0x1E4F1CC08]];
          v15 = (void *)v18;
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end