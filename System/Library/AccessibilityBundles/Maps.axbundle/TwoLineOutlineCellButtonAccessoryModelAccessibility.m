@interface TwoLineOutlineCellButtonAccessoryModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)visibility;
@end

@implementation TwoLineOutlineCellButtonAccessoryModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TwoLineOutlineCellButtonAccessoryModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)visibility
{
  if (_AXSCommandAndControlEnabled()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TwoLineOutlineCellButtonAccessoryModelAccessibility;
  return [(TwoLineOutlineCellButtonAccessoryModelAccessibility *)&v4 visibility];
}

@end