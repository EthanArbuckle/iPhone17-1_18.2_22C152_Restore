@interface TLKImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation TLKImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKImageView";
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