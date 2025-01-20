@interface UIInputSwitcherSegmentedTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation UIInputSwitcherSegmentedTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherSegmentedTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputSwitcherSegmentedTableCell", @"segmentControl", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = (id)[(UIInputSwitcherSegmentedTableCellAccessibility *)self safeValueForKey:@"segmentControl"];
  id v4 = (id)[v3 _accessibilitySortedElementsWithin];

  return v4;
}

@end