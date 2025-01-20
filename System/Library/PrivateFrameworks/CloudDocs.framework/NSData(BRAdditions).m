@interface NSData(BRAdditions)
- (id)br_md5;
@end

@implementation NSData(BRAdditions)

- (id)br_md5
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

  return v2;
}

@end