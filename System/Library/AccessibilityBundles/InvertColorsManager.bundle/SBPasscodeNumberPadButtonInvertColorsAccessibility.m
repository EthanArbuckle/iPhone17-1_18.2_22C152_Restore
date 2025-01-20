@interface SBPasscodeNumberPadButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBPasscodeNumberPadButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPasscodeNumberPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

@end