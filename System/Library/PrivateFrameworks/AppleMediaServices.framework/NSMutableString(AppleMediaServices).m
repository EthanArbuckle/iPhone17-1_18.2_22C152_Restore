@interface NSMutableString(AppleMediaServices)
- (void)ams_appendNullableString:()AppleMediaServices;
@end

@implementation NSMutableString(AppleMediaServices)

- (void)ams_appendNullableString:()AppleMediaServices
{
  if (a3) {
    return objc_msgSend(a1, "appendString:");
  }
  return a1;
}

@end