@interface NSString
+ (id)uniqueIdentifier;
@end

@implementation NSString

+ (id)uniqueIdentifier
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  if (v2)
  {
    CFUUIDRef v3 = v2;
    v4 = (__CFString *)CFUUIDCreateString(0, v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end