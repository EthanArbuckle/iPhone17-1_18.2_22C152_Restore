@interface CKNavigationBarCanvasViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setTitleView:(id)a3;
@end

@implementation CKNavigationBarCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNavigationBarCanvasView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationBarCanvasView", @"buttonViewFaceTimeAudio", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationBarCanvasView", @"setTitleView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationBarCanvasView", @"isBusinessChat", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationBarCanvasView", @"titleView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKNavigationBarCanvasViewAccessibility;
  [(CKNavigationBarCanvasViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKNavigationBarCanvasViewAccessibility *)self safeValueForKey:@"titleView"];
  [(CKNavigationBarCanvasViewAccessibility *)self setTitleView:v3];
}

- (void)setTitleView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKNavigationBarCanvasViewAccessibility;
  [(CKNavigationBarCanvasViewAccessibility *)&v6 setTitleView:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setAccessibilityRespondsToUserInteraction:1];
    if ([(CKNavigationBarCanvasViewAccessibility *)self safeBoolForKey:@"isBusinessChat"])
    {
      v5 = accessibilityLocalizedString(@"conversation.verified");
      [v4 setAccessibilityValue:v5];
    }
    else
    {
      [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    }
  }
}

@end