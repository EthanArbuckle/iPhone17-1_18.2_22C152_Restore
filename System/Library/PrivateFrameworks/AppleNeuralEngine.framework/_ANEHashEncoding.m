@interface _ANEHashEncoding
+ (id)convertToHexString:(char *)a3 length:(unint64_t)a4;
+ (id)hexStringForBytes:(char *)a3 length:(unint64_t)a4;
+ (id)hexStringForData:(id)a3;
+ (id)hexStringForDataArray:(id)a3;
+ (id)hexStringForString:(id)a3;
+ (unsigned)hashForString:(id)a3 seed:(unsigned int)a4;
+ (void)copySHA256For:(id)a3 toBuffer:(char *)a4;
@end

@implementation _ANEHashEncoding

+ (id)hexStringForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 UTF8String];
  uint64_t v6 = [v4 length];

  return (id)[a1 hexStringForBytes:v5 length:v6];
}

+ (void)copySHA256For:(id)a3 toBuffer:(char *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (const void *)[v5 UTF8String];
  if (v6)
  {
    CC_SHA256(v6, [v5 length], md);
    long long v7 = v9;
    *(_OWORD *)a4 = *(_OWORD *)md;
    *((_OWORD *)a4 + 1) = v7;
  }
}

+ (id)hexStringForBytes:(char *)a3 length:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CC_SHA256(a3, a4, md);
  id v5 = [a1 convertToHexString:md length:32];
  return v5;
}

+ (id)convertToHexString:(char *)a3 length:(unint64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E0193890](a1, a2);
  for (i = (void *)[&stru_1F35E5710 mutableCopy]; a4; --a4)
  {
    unsigned int v8 = *a3++;
    objc_msgSend(i, "appendFormat:", @"%02X", v8);
  }
  return i;
}

+ (id)hexStringForData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return (id)[a1 hexStringForBytes:v5 length:v6];
}

+ (id)hexStringForDataArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int data = 0;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 4u);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        CC_SHA256_Update(&c, (const void *)objc_msgSend(v10, "bytes", (void)v13), objc_msgSend(v10, "length"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v7);
  }

  CC_SHA256_Final(md, &c);
  v11 = [a1 convertToHexString:md length:32];

  return v11;
}

+ (unsigned)hashForString:(id)a3 seed:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 UTF8String];
  if (v5)
  {
    uint64_t v6 = (const char *)v5;
    unsigned int data = bswap32(a4);
    memset(&v9, 0, sizeof(v9));
    CC_SHA256_Init(&v9);
    CC_SHA256_Update(&v9, &data, 4u);
    CC_LONG v7 = strlen(v6);
    CC_SHA256_Update(&v9, v6, v7);
    CC_SHA256_Final(md, &v9);
    LODWORD(v5) = *(_DWORD *)md;
  }
  return v5;
}

@end