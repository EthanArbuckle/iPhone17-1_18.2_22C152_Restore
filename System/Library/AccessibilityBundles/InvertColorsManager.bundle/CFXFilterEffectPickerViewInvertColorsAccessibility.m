@interface CFXFilterEffectPickerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CFXFilterEffectPickerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXFilterEffectPickerView";
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