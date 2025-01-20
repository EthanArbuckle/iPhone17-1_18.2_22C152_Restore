@interface NSData(Hash)
- (id)SHA1;
- (id)SHA256;
@end

@implementation NSData(Hash)

- (id)SHA1
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 170, 20);
  id v1 = a1;
  CC_SHA1((const void *)objc_msgSend(v1, "bytes", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], v5), objc_msgSend(v1, "length"), v4);
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:20];
  return v2;
}

- (id)SHA256
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v5 = v1;
  long long v6 = v1;
  id v2 = a1;
  CC_SHA256((const void *)objc_msgSend(v2, "bytes", v5, v6), objc_msgSend(v2, "length"), (unsigned __int8 *)&v5);
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:16];
  return v3;
}

@end