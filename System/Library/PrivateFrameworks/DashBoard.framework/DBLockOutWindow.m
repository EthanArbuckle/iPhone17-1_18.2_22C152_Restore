@interface DBLockOutWindow
+ (BOOL)_isSecure;
@end

@implementation DBLockOutWindow

+ (BOOL)_isSecure
{
  return 1;
}

@end