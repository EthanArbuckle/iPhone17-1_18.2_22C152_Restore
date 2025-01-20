@interface AXSecureWindow
+ (BOOL)_isSecure;
@end

@implementation AXSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

@end