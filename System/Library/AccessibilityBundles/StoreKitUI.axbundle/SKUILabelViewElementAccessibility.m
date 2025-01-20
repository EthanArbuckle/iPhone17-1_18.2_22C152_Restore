@interface SKUILabelViewElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SKUILabelViewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUILabelViewElement";
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
  v2 = [(SKUILabelViewElementAccessibility *)self safeValueForKey:@"_text"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end