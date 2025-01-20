@interface CKCanvasBackButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUserTestingIsBackNavButton;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKCanvasBackButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKCanvasBackButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCanvasBackButtonView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCanvasBackButtonView", @"backButtonView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityUserTestingIsBackNavButton
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKCanvasBackButtonViewAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  if ([v3 length])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"message.view.back.button.unread");
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81370] | *MEMORY[0x263F1CEE8];
}

@end