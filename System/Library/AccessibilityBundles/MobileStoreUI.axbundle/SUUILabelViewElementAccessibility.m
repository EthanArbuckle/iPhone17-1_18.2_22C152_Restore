@interface SUUILabelViewElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUUILabelViewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUILabelViewElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SUUILabelViewElementAccessibility *)self safeValueForKey:@"_text"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end