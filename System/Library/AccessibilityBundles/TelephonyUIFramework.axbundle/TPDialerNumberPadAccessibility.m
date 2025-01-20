@interface TPDialerNumberPadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsSoftwareKeyboardMimic;
@end

@implementation TPDialerNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPDialerNumberPad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  return 1;
}

@end