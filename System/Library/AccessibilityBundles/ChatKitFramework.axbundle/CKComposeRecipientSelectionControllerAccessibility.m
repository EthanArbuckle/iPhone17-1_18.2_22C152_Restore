@interface CKComposeRecipientSelectionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_layoutFromFieldShouldHide:(BOOL)a3;
@end

@implementation CKComposeRecipientSelectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKComposeRecipientSelectionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKComposeRecipientSelectionController", @"_layoutFromFieldShouldHide:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKComposeRecipientSelectionController", @"fromFieldContentStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKComposeRecipientSelectionController", @"subscriptionSelectorButton", "@", 0);
}

- (void)_layoutFromFieldShouldHide:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKComposeRecipientSelectionControllerAccessibility;
  [(CKComposeRecipientSelectionControllerAccessibility *)&v10 _layoutFromFieldShouldHide:sel__layoutFromFieldShouldHide_];
  if (!a3)
  {
    v5 = [(CKComposeRecipientSelectionControllerAccessibility *)self safeValueForKey:@"fromFieldContentStackView"];
    [v5 setIsAccessibilityElement:1];
    v6 = accessibilityLocalizedString(@"from.field");
    v9 = [(CKComposeRecipientSelectionControllerAccessibility *)self safeValueForKey:@"subscriptionSelectorButton"];
    v7 = __UIAXStringForVariables();

    objc_msgSend(v5, "setAccessibilityLabel:", v7, v9, @"__AXStringForVariablesSentinel");
    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    v8 = accessibilityLocalizedString(@"collapsed.from.field.hint");
    [v5 setAccessibilityHint:v8];
  }
}

@end