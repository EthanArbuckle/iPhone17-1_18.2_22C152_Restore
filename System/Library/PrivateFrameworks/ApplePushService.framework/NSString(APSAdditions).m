@interface NSString(APSAdditions)
+ (__CFString)apsStringGUID;
@end

@implementation NSString(APSAdditions)

+ (__CFString)apsStringGUID
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

@end