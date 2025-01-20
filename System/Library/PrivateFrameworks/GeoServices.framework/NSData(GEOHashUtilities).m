@interface NSData(GEOHashUtilities)
+ (id)_geo_dataForHexString:()GEOHashUtilities;
- (id)_geo_MD5Hash;
- (id)_geo_SHA1Hash;
- (id)_geo_SHA256Hash;
- (id)_geo_hexString;
@end

@implementation NSData(GEOHashUtilities)

- (id)_geo_hexString
{
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v5++));
    while (v5 < [v3 length]);
  }

  return v2;
}

- (id)_geo_MD5Hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1C9B8];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "dataWithBytes:length:", CC_MD5((const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"), md), 16);

  return v3;
}

- (id)_geo_SHA1Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];

  return v2;
}

- (id)_geo_SHA256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];

  return v2;
}

+ (id)_geo_dataForHexString:()GEOHashUtilities
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 cStringUsingEncoding:1];
    unint64_t v7 = [v5 lengthOfBytesUsingEncoding:1];
    v8 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v7 >> 1];
    if (v7)
    {
      unint64_t v9 = 0;
      uint64_t v10 = MEMORY[0x1E4F14390];
      do
      {
        char v20 = 0;
        unsigned int v11 = *(char *)(v6 + v9);
        char v12 = v11 - 48;
        if (v11 - 48 > 9)
        {
          if ((v11 & 0x80000000) != 0) {
            int v13 = __maskrune(*(char *)(v6 + v9), 0x8000uLL);
          }
          else {
            int v13 = *(_DWORD *)(v10 + 4 * v11 + 60) & 0x8000;
          }
          if (v13) {
            char v14 = -55;
          }
          else {
            char v14 = -87;
          }
          char v12 = v14 + v11;
        }
        unsigned int v15 = *(char *)(v6 + v9 + 1);
        char v16 = v15 - 48;
        if (v15 - 48 > 9)
        {
          if ((v15 & 0x80000000) != 0) {
            int v17 = __maskrune(*(char *)(v6 + v9 + 1), 0x8000uLL);
          }
          else {
            int v17 = *(_DWORD *)(v10 + 4 * v15 + 60) & 0x8000;
          }
          if (v17) {
            char v18 = -55;
          }
          else {
            char v18 = -87;
          }
          char v16 = v18 + v15;
        }
        char v20 = v16 + 16 * v12;
        [v8 appendBytes:&v20 length:1];
        v9 += 2;
      }
      while (v9 < v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end