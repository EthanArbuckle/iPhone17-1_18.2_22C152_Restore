@interface NSData(CoreRecentsUtilities)
- (uint64_t)cr_md5DigestHexString;
@end

@implementation NSData(CoreRecentsUtilities)

- (uint64_t)cr_md5DigestHexString
{
  v1 = objc_msgSend(a1, "_cn_md5Hash");
  return objc_msgSend(v1, "_cn_hexString");
}

@end