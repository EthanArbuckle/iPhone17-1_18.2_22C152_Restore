@interface WFAutomationEmptyStateCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityChildren;
@end

@implementation WFAutomationEmptyStateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFAutomationEmptyStateCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChildren
{
  v9.receiver = self;
  v9.super_class = (Class)WFAutomationEmptyStateCellAccessibility;
  v3 = [(WFAutomationEmptyStateCellAccessibility *)&v9 _accessibilityChildren];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_1];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 objectAtIndex:v4];
  }
  [v5 setIsAccessibilityElement:0];
  v6 = [(WFAutomationEmptyStateCellAccessibility *)self safeValueForKey:@"textField"];
  v7 = [v5 accessibilityLabel];
  [v6 setAccessibilityLabel:v7];

  return v3;
}

uint64_t __65__WFAutomationEmptyStateCellAccessibility__accessibilityChildren__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  NSClassFromString(&cfstr_Uitabletextacc.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

@end