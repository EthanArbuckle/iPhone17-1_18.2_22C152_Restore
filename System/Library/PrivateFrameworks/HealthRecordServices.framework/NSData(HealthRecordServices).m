@interface NSData(HealthRecordServices)
- (id)hk_base45Encoded;
- (id)hk_zlibCompressedIncludingHeaderAndTrailer:()HealthRecordServices errorOut:;
@end

@implementation NSData(HealthRecordServices)

- (id)hk_base45Encoded
{
  unint64_t v2 = [a1 length];
  v3 = malloc_type_malloc(3 * (v2 >> 1) + 2 * (v2 & 1) + 1, 0x78194FB1uLL);
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = [a1 bytes];
    if (v2)
    {
      LODWORD(v6) = 0;
      for (unint64_t i = 0; i < v2; i += 2)
      {
        int v8 = *(unsigned __int8 *)(v5 + i);
        if (i + 1 >= v2)
        {
          uint64_t v10 = (((v8 - ((unsigned __int16)(109 * v8) >> 8)) >> 1) + ((109 * v8) >> 8)) >> 5;
          char v16 = hk_base45Encoded_characterSet[(v8 - 45 * v10)];
          int v14 = v6 + 1;
          v4[v6] = v16;
          int v15 = 2;
        }
        else
        {
          unsigned __int16 v9 = _byteswap_ushort(*(_WORD *)(v5 + i));
          uint64_t v10 = (((unsigned __int16)(v9 - ((745 * v9) >> 16)) >> 1) + ((745 * v9) >> 16)) >> 10;
          unsigned __int16 v11 = v9 - 2025 * v10;
          unsigned int v12 = v11 / 0x2Du;
          v13 = &v4[v6];
          unsigned char *v13 = hk_base45Encoded_characterSet[v11 % 0x2Du];
          int v14 = v6 + 2;
          v13[1] = hk_base45Encoded_characterSet[v12];
          int v15 = 3;
        }
        uint64_t v6 = (v6 + v15);
        v4[v14] = hk_base45Encoded_characterSet[v10];
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v4[v6] = 0;
    v17 = [NSString stringWithUTF8String:v4];
    free(v4);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)hk_zlibCompressedIncludingHeaderAndTrailer:()HealthRecordServices errorOut:
{
  uint64_t v5 = objc_msgSend(a1, "compressedDataUsingAlgorithm:error:", 3);
  uint64_t v6 = v5;
  if (v5)
  {
    if (a3)
    {
      uLong v7 = adler32(0, 0, 0);
      id v8 = a1;
      unsigned int v11 = bswap32(adler32(v7, (const Bytef *)[v8 bytes], objc_msgSend(v8, "length")));
      id v9 = [MEMORY[0x263EFF990] data];
      [v9 appendBytes:&hk_zlibCompressedIncludingHeaderAndTrailer_errorOut__defaultCompression length:2];
      [v9 appendData:v6];
      [v9 appendBytes:&v11 length:4];
    }
    else
    {
      id v9 = v5;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end