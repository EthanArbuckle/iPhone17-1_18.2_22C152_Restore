@interface LPTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation LPTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LPTextView";
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
  v2 = [(LPTextViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(LPTextViewAccessibility *)self safeValueForKey:@"_textView"];
  BOOL v3 = [v2 accessibilityLabel];

  return v3;
}

@end