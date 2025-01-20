@interface NSString(_AX_HA_)
- (unint64_t)unsignedLongLongValue;
@end

@implementation NSString(_AX_HA_)

- (unint64_t)unsignedLongLongValue
{
  v1 = (const char *)[a1 UTF8String];

  return strtoull(v1, 0, 0);
}

@end