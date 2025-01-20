@interface LargeDayNavigationViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityUserInputLabels;
@end

@implementation LargeDayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeDayNavigationViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewCell", @"date", "@", 0);
  [v3 validateClass:@"LargeDayNavigationViewCell" isKindOfClass:@"DayNavigationViewCell"];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  id v3 = [(LargeDayNavigationViewCellAccessibility *)self safeValueForKey:@"date"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = MEMORY[0x245654920](v4);
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x263EFF8C0];
  v7 = [(LargeDayNavigationViewCellAccessibility *)self safeValueForKey:@"_leftString"];
  v8 = [(LargeDayNavigationViewCellAccessibility *)self safeValueForKey:@"_centerString"];
  v9 = [(LargeDayNavigationViewCellAccessibility *)self safeValueForKey:@"_rightString"];
  v10 = objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 3, v7, v8, v9);
  v11 = [v10 componentsJoinedByString:@" "];

  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v11);

  return v12;
}

@end