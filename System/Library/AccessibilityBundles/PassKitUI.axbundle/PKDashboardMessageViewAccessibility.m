@interface PKDashboardMessageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDismiss:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRoleDescription;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation PKDashboardMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDashboardMessageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardMessageView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardMessageView", @"message", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardMessageView", @"dismissButtonPressed:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PKDashboardMessageViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"title, message"];
}

- (id)accessibilityCustomActions
{
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardMessageViewAccessibility;
  id v3 = [(PKDashboardMessageViewAccessibility *)&v9 accessibilityCustomActions];
  v4 = (void *)[v3 mutableCopy];

  if (!v4)
  {
    v4 = [MEMORY[0x263EFF980] array];
  }
  id v5 = objc_alloc(MEMORY[0x263F1C390]);
  v6 = accessibilityLocalizedString(@"dismiss.message");
  v7 = (void *)[v5 initWithName:v6 target:self selector:sel__axDismiss_];
  [v4 addObject:v7];

  return v4;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"message.role");
}

- (BOOL)_axDismiss:(id)a3
{
  return 1;
}

uint64_t __50__PKDashboardMessageViewAccessibility__axDismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissButtonPressed:0];
}

@end