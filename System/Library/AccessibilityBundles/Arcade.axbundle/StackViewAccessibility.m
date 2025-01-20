@interface StackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation StackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.StackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(StackViewAccessibility *)self safeArrayForKey:@"accessibilityNonHiddenSubviews"];
  v3 = AXLabelForElements();

  return v3;
}

@end