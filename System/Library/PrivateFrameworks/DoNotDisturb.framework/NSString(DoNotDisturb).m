@interface NSString(DoNotDisturb)
- (uint64_t)dnd_privacyObfuscatedString;
@end

@implementation NSString(DoNotDisturb)

- (uint64_t)dnd_privacyObfuscatedString
{
  uint64_t v1 = [a1 hash];
  return objc_msgSend(NSString, "stringWithFormat:", @"%lX", v1);
}

@end