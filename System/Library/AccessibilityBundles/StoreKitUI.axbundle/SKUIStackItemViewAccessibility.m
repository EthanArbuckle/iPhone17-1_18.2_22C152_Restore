@interface SKUIStackItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUIStackItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStackItemView";
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
  v2 = [(SKUIStackItemViewAccessibility *)self safeValueForKey:@"textView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end