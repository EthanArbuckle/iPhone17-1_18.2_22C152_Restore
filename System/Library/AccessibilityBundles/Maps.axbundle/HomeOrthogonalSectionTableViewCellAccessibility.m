@interface HomeOrthogonalSectionTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (id)automationElements;
@end

@implementation HomeOrthogonalSectionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HomeOrthogonalSectionTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(HomeOrthogonalSectionTableViewCellAccessibility *)self safeValueForKey:@"_wrapperView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end