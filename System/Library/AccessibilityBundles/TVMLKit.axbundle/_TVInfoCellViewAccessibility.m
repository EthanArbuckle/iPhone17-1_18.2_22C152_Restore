@interface _TVInfoCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityLabel;
@end

@implementation _TVInfoCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVInfoCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(_TVInfoCellViewAccessibility *)self safeValueForKey:@"dataViews"];
  v3 = __UIAccessibilitySafeClass();

  v4 = MEMORY[0x245666360](v3);

  return v4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end