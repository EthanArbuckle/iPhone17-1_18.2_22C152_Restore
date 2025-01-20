@interface NSData(CLSNSDataCryptoExtensions)
- (id)cls_hexString;
- (id)cls_sha1Hash;
@end

@implementation NSData(CLSNSDataCryptoExtensions)

- (id)cls_hexString
{
  unint64_t v2 = [a1 length];
  uint64_t v3 = [a1 bytes];
  v4 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0xF94682EFuLL);
  if (v4)
  {
    v5 = v4;
    if (v2)
    {
      int v6 = 0;
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        sprintf(&v5[v6], "%02x", *(unsigned __int8 *)(v3 + v7));
        uint64_t v7 = v8;
        BOOL v9 = v2 > v8++;
        v6 += 2;
      }
      while (v9);
    }
    v10 = (void *)[[NSString alloc] initWithBytes:v5 length:2 * v2 encoding:4];
    free(v5);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)cls_sha1Hash
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  id v2 = a1;
  CC_SHA1_Update(&v5, (const void *)[v2 bytes], objc_msgSend(v2, "length"));
  CC_SHA1_Final(md, &v5);
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  return v3;
}

@end