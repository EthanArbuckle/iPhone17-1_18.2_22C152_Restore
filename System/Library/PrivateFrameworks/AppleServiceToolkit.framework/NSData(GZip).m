@interface NSData(GZip)
- (id)dataGZipDeflated;
- (void)_resizeOutputBuffer:()GZip forStream:;
@end

@implementation NSData(GZip)

- (id)dataGZipDeflated
{
  if ([a1 length])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x9010000000;
    v14 = &unk_23CAB770E;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v2 = [MEMORY[0x263EFF990] dataWithLength:0x4000];
    if (deflateInit2_((z_streamp)(v12 + 4), 9, 8, 31, 9, 0, "1.2.12", 112))
    {
      v3 = 0;
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __32__NSData_GZip__dataGZipDeflated__block_invoke;
      v8[3] = &unk_264E7DBA0;
      v10 = &v11;
      v8[4] = a1;
      id v5 = v2;
      id v9 = v5;
      [a1 enumerateByteRangesUsingBlock:v8];
      if (deflate((z_streamp)(v12 + 4), 4))
      {
        v6 = v12;
      }
      else
      {
        while (1)
        {
          v6 = v12;
          if (*((_DWORD *)v12 + 16)) {
            break;
          }
          [a1 _resizeOutputBuffer:v5 forStream:v12 + 4];
          deflate((z_streamp)(v12 + 4), 4);
        }
      }
      deflateEnd((z_streamp)(v6 + 4));
      [v5 setLength:v12[9]];
      if (*((_DWORD *)v12 + 10))
      {
        v3 = 0;
      }
      else
      {
        v3 = [MEMORY[0x263EFF8F8] dataWithData:v5];
      }
    }
    id v4 = v3;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

- (void)_resizeOutputBuffer:()GZip forStream:
{
  id v5 = a3;
  unint64_t v6 = *(void *)(a4 + 40);
  if (v6 >= [v5 length]) {
    [v5 increaseLengthBy:0x4000];
  }
  *(_DWORD *)(a4 + 32) = [v5 length] - *(_DWORD *)(a4 + 40);
  id v7 = v5;
  *(void *)(a4 + 24) = [v7 mutableBytes] + *(void *)(a4 + 40);
}

@end