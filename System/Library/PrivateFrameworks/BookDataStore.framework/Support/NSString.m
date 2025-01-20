@interface NSString
+ (id)bds_UUID;
@end

@implementation NSString

+ (id)bds_UUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return v3;
}

@end