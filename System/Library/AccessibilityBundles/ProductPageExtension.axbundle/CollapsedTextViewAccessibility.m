@interface CollapsedTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CollapsedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.CollapsedTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(CollapsedTextViewAccessibility *)self safeValueForKey:@"accessibilityTextView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return v5;
}

@end