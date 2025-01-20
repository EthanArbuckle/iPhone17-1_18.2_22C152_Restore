@interface GTMTLQL
@end

@implementation GTMTLQL

void __GTMTLQL_EncodeBuffer_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndex:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v8 = [v3 objectAtIndex:1];

  id v7 = [v8 copy];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __GTMTLQL_EncodeTexture_block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 count];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    for (unint64_t i = 0; i < v4; i += 2)
    {
      v6 = [v9 objectAtIndex:i];
      id v7 = [v9 objectAtIndex:i + 1];
      id v8 = [v7 copy];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
    }
  }
}

void __GTMTLQL_EncodeTexture_block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 objectAtIndex:0];
  id v4 = [v15 objectAtIndex:1];
  uint64_t v5 = [v4 bytes];
  id v6 = [*(id *)(a1 + 32) iosurfacePlane];
  unint64_t v7 = (48 * v5[2] + 279) & 0xFFFFFFFFFFFFFF00;
  if (v6)
  {
    id v8 = v5 + 8;
    id v9 = (char *)v6;
    do
    {
      uint64_t v10 = *v8;
      v8 += 6;
      v7 += v10;
      --v9;
    }
    while (v9);
  }
  v11 = (char *)&v5[6 * (void)v6];
  id v12 = v4;
  v13 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)[v12 bytes] + v7, *((void *)v11 + 8));
  [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v3];

  memset(v16, 0, 32);
  v16[2] = *((_OWORD *)v11 + 2);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 1;
  id v14 = v3;
  id v20 = [v14 UTF8String];
  long long v21 = *(_OWORD *)(v11 + 56);
  uint64_t v22 = 0;
  DYTraceEncode_MTLTexture_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage((uint64_t)v16, *(unsigned int **)(a1 + 56), *(void *)(a1 + 64), 0, 0);
  [*(id *)(a1 + 48) appendBytes:*(void *)(a1 + 56) length:**(unsigned int **)(a1 + 56)];
}

@end