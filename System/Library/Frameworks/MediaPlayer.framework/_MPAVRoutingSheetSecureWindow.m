@interface _MPAVRoutingSheetSecureWindow
+ (BOOL)_isSecure;
- (BOOL)_canAffectStatusBarAppearance;
@end

@implementation _MPAVRoutingSheetSecureWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end