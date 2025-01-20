@interface SectionHeaderOutlineCellAccessoryModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)visibility;
@end

@implementation SectionHeaderOutlineCellAccessoryModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SectionHeaderOutlineCellAccessoryModel";
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
  v4.super_class = (Class)SectionHeaderOutlineCellAccessoryModelAccessibility;
  return [(SectionHeaderOutlineCellAccessoryModelAccessibility *)&v4 visibility];
}

@end