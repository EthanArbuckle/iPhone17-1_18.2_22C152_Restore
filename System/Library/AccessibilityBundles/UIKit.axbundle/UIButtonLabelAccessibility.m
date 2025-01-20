@interface UIButtonLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UIButtonLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButtonLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIButtonLabelAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 0;
  }
  id v4 = (id)[(UIButtonLabelAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

@end