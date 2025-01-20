@interface SBUISegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)automationElements;
@end

@implementation SBUISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISegmentedControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)automationElements
{
  if ([(SBUISegmentedControlAccessibility *)self accessibilityElementsHidden])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUISegmentedControlAccessibility;
    v3 = [(SBUISegmentedControlAccessibility *)&v5 automationElements];
  }

  return v3;
}

@end