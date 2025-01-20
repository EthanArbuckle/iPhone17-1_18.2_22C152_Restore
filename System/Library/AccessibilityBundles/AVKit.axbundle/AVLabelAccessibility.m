@interface AVLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AVLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(AVLabelAccessibility *)self accessibilityUserDefinedLabel];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    id v3 = [v4 text];
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end