@interface _TVInfoCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
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
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoCellView", @"headerContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoCellView", @"dataViews", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(_TVInfoCellViewAccessibility *)self safeValueForKey:@"headerContentView"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(_TVInfoCellViewAccessibility *)self safeValueForKey:@"dataViews"];
  v6 = __UIAccessibilityCastAsClass();

  v9 = MEMORY[0x245666040](v6);
  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end