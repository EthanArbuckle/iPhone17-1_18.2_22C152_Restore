@interface InCallControlsStatusCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivateActionButton;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation InCallControlsStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsStatusCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsStatusCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsStatusCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsStatusCell", @"actionButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(InCallControlsStatusCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(InCallControlsStatusCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_opt_new();
  v4 = [(InCallControlsStatusCellAccessibility *)self safeUIViewForKey:@"actionButton"];
  if ([v4 _accessibilityViewIsVisible])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = [v4 accessibilityLabel];
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__accessibilityActivateActionButton];
    [v3 addObject:v7];
  }

  return v3;
}

- (BOOL)_accessibilityActivateActionButton
{
  v2 = [(InCallControlsStatusCellAccessibility *)self safeValueForKey:@"actionButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

@end