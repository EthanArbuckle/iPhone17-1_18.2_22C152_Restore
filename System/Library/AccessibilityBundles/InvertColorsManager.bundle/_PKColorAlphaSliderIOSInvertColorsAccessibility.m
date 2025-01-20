@interface _PKColorAlphaSliderIOSInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation _PKColorAlphaSliderIOSInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PKColorAlphaSliderIOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end