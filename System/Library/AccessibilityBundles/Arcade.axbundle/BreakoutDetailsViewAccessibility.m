@interface BreakoutDetailsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPerformCallToAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axBadgeLabel;
- (id)_axCallToActionButton;
- (id)_axDescriptionLabel;
- (id)_axTitleLabel;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation BreakoutDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.BreakoutDetailsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.BreakoutDetailsView", @"accessibilityBadgeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.BreakoutDetailsView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.BreakoutDetailsView", @"accessibilityDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.BreakoutDetailsView", @"accessibilityCallToActionButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3 = [(BreakoutDetailsViewAccessibility *)self _axDescriptionLabel];
  v4 = [v3 accessibilityLabel];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@" / "];

  v6 = [(BreakoutDetailsViewAccessibility *)self _axBadgeLabel];
  v9 = [(BreakoutDetailsViewAccessibility *)self _axTitleLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (id)_axCallToActionButton
{
  return (id)[(BreakoutDetailsViewAccessibility *)self safeValueForKey:@"accessibilityCallToActionButton"];
}

- (id)_axBadgeLabel
{
  return (id)[(BreakoutDetailsViewAccessibility *)self safeValueForKey:@"accessibilityBadgeLabel"];
}

- (id)_axTitleLabel
{
  return (id)[(BreakoutDetailsViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
}

- (id)_axDescriptionLabel
{
  return (id)[(BreakoutDetailsViewAccessibility *)self safeValueForKey:@"accessibilityDescriptionLabel"];
}

- (BOOL)_accessibilityPerformCallToAction:(id)a3
{
  id v3 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  [v3 accessibilityActivate];

  return 1;
}

- (id)accessibilityCustomActions
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v10.receiver = self;
  v10.super_class = (Class)BreakoutDetailsViewAccessibility;
  v4 = [(BreakoutDetailsViewAccessibility *)&v10 accessibilityCustomActions];
  v5 = [v3 arrayWithArray:v4];

  v6 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  v7 = [v6 accessibilityLabel];

  if ([v7 length])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v7 target:self selector:sel__accessibilityPerformCallToAction_];
    [v5 axSafelyAddObject:v8];
  }

  return v5;
}

- (id)automationElements
{
  v10.receiver = self;
  v10.super_class = (Class)BreakoutDetailsViewAccessibility;
  id v3 = [(BreakoutDetailsViewAccessibility *)&v10 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  [v7 axSafelyAddObject:v8];

  return v7;
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(BreakoutDetailsViewAccessibility *)self _axBadgeLabel];
  [v4 setIsAccessibilityElement:1];

  v5 = [(BreakoutDetailsViewAccessibility *)self _axBadgeLabel];
  [v3 axSafelyAddObject:v5];

  id v6 = [(BreakoutDetailsViewAccessibility *)self _axTitleLabel];
  [v6 setIsAccessibilityElement:1];

  v7 = [(BreakoutDetailsViewAccessibility *)self _axTitleLabel];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v8 = [(BreakoutDetailsViewAccessibility *)self _axTitleLabel];
  [v3 axSafelyAddObject:v8];

  v9 = [(BreakoutDetailsViewAccessibility *)self _axDescriptionLabel];
  [v9 setIsAccessibilityElement:1];

  objc_super v10 = [(BreakoutDetailsViewAccessibility *)self _axDescriptionLabel];
  [v3 axSafelyAddObject:v10];

  v11 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  [v11 setIsAccessibilityElement:1];

  v12 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  [v12 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  v13 = [(BreakoutDetailsViewAccessibility *)self _axCallToActionButton];
  [v3 axSafelyAddObject:v13];

  return v3;
}

@end