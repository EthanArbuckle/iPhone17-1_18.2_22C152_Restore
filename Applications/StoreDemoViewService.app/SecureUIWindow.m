@interface SecureUIWindow
+ (BOOL)_isSecure;
@end

@implementation SecureUIWindow

+ (BOOL)_isSecure
{
  return 1;
}

@end