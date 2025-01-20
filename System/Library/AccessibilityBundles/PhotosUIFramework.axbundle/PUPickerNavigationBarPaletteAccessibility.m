@interface PUPickerNavigationBarPaletteAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityNavigationBarShouldOverrideMinimumHeight;
@end

@implementation PUPickerNavigationBarPaletteAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPickerNavigationBarPalette";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityNavigationBarShouldOverrideMinimumHeight
{
  return 0;
}

@end