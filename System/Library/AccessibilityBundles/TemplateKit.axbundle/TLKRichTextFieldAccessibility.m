@interface TLKRichTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axLabelForElementIfVisible:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKRichTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKRichTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKRichTextField", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKRichTextField", @"starRatingView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(TLKRichTextFieldAccessibility *)self safeValueForKey:@"textLabel"];
  v4 = [(TLKRichTextFieldAccessibility *)self _axLabelForElementIfVisible:v3];
  v5 = [(TLKRichTextFieldAccessibility *)self safeValueForKey:@"starRatingView"];
  v8 = [(TLKRichTextFieldAccessibility *)self _axLabelForElementIfVisible:v5];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)_axLabelForElementIfVisible:(id)a3
{
  id v3 = a3;
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [v3 accessibilityLabel];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end