@interface CAMExpandableMenuButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (void)startCollapsingWithProposedFrame:(CGRect)a3;
@end

@implementation CAMExpandableMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExpandableMenuButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandableMenuButton", @"isExpanded", "B", 0);
  [v3 validateClass:@"CAMExpandableMenuButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"canBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandableMenuButton", @"startCollapsingWithProposedFrame:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(CAMExpandableMenuButtonAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)CAMExpandableMenuButtonAccessibility;
  unsigned int v3 = [(CAMExpandableMenuButtonAccessibility *)&v5 canBecomeFocused];
  if ([(CAMExpandableMenuButtonAccessibility *)self _accessibilityIsFKARunningForFocusItem])v3 &= ~[(CAMExpandableMenuButtonAccessibility *)self safeBoolForKey:@"isExpanded"]; {
  return v3;
  }
}

- (void)startCollapsingWithProposedFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMExpandableMenuButtonAccessibility;
  -[CAMExpandableMenuButtonAccessibility startCollapsingWithProposedFrame:](&v3, sel_startCollapsingWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end