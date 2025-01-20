@interface UISwipeActionStandardButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UISwipeActionStandardButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwipeActionStandardButton";
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