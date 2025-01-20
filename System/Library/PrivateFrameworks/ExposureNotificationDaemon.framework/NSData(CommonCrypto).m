@interface NSData(CommonCrypto)
- (id)sha256;
@end

@implementation NSData(CommonCrypto)

- (id)sha256
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id v1 = a1;
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    v2 = [MEMORY[0x1E4F1C9B0] dataWithBytes:v4 length:32];
  }

  return v2;
}

@end