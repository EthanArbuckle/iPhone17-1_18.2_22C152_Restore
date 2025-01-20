@interface NSData(GEOMapService)
- (id)_geo_compressedDataViaAlgo:()GEOMapService;
- (id)_geo_decompressedDataViaAlgo:()GEOMapService;
@end

@implementation NSData(GEOMapService)

- (id)_geo_compressedDataViaAlgo:()GEOMapService
{
  if ((unint64_t)[a1 length] <= 0x100000)
  {
    size_t v6 = 3 * ((unint64_t)[a1 length] >> 2);
    id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:v6 + 4];
    v8 = (uint8_t *)([v7 mutableBytes] + 4);
    id v9 = a1;
    size_t v10 = compression_encode_buffer(v8, v6, (const uint8_t *)[v9 bytes], objc_msgSend(v9, "length"), 0, a3);
    if (v10)
    {
      size_t v11 = v10;
      unsigned int v12 = bswap32([v9 length]);
      id v13 = v7;
      *(_DWORD *)[v13 mutableBytes] = v12;
      [v13 setLength:v11 + 4];
      v5 = (void *)[v13 copy];
    }
    else
    {
      v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_FAULT, "Unable to compress data", v16, 2u);
      }

      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_geo_decompressedDataViaAlgo:()GEOMapService
{
  if ((unint64_t)[a1 length] <= 0x100000
    && (unint64_t)[a1 length] >= 5
    && (v5 = a1, size_t v6 = bswap32(*(_DWORD *)[v5 bytes]),
                                         v6 <= 0x100000))
  {
    id v9 = [MEMORY[0x1E4F1CA58] dataWithLength:v6];
    size_t v10 = (uint8_t *)[v9 mutableBytes];
    id v11 = v5;
    if (compression_decode_buffer(v10, v6, (const uint8_t *)([v11 bytes] + 4), objc_msgSend(v11, "length") - 4, 0, a3) == v6)
    {
      id v7 = (void *)[v9 copy];
    }
    else
    {
      unsigned int v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_FAULT, "Unable to decompress data", v13, 2u);
      }

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end