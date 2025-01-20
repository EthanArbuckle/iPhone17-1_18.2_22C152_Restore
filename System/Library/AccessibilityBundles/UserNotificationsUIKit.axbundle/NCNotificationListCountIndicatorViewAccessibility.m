@interface NCNotificationListCountIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationListCountIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListCountIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationListCountIndicatorView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBUILegibilityLabel" isKindOfClass:@"UIView"];
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_titleLabel" withType:"NCNotificationListCountIndicatorButton"];
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_subtitleString" withType:"NSString"];
  [v3 validateClass:@"NCNotificationListCountIndicatorViewController" conformsToProtocol:@"NCNotificationListCountIndicatorViewDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCountIndicatorView", @"delegate", "@", 0);
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_titleLabelRepresentsNotificationCount" withType:"BOOL"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"listModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"rootListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCountIndicatorViewController", @"notificationListCountIndicatorViewTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCountIndicatorViewController", @"notificationListCountIndicatorViewLongPressed:presentingView:", "v", "@", "@", 0);
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_titleString" withType:"NSString"];
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_titleSymbol" withType:"NSString"];
  [v3 validateClass:@"NCNotificationListCountIndicatorView" hasInstanceVariable:@"_contentHidden" withType:"BOOL"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  if (v3) {
    int v4 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeBoolForKey:@"_contentHidden"] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeStringForKey:@"_titleString"];
  v6 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeStringForKey:@"_subtitleString"];
  int v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListCountIndicatorViewAccessibility;
  unint64_t v3 = [(NCNotificationListCountIndicatorViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  if (v4)
  {

LABEL_4:
    v3 |= *MEMORY[0x263F1CEE8];
    return v3;
  }
  v5 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeStringForKey:@"_subtitleString"];

  if (v5) {
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  int v4 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeValueForKey:@"delegate"];
  v5 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  int v6 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeBoolForKey:@"_titleLabelRepresentsNotificationCount"];
  objc_super v7 = [v4 parentViewController];
  if (v6)
  {
    v2 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeStringForKey:@"_titleSymbol"];
    if ([v2 isEqualToString:@"circlebadge.fill"])
    {

LABEL_7:
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke;
      v30 = &unk_265161640;
      id v31 = v4;
      v32 = self;
      AXPerformSafeBlock();
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_2;
      v25 = &unk_2651615D8;
      id v26 = v7;
      AXPerformBlockOnMainThreadAfterDelay();

      goto LABEL_8;
    }
  }
  v8 = [(NCNotificationListCountIndicatorViewAccessibility *)self safeStringForKey:@"_subtitleString"];

  if (v6) {
  if (v8)
  }
    goto LABEL_7;
  if (!v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)NCNotificationListCountIndicatorViewAccessibility;
    BOOL v9 = [(NCNotificationListCountIndicatorViewAccessibility *)&v14 accessibilityActivate];
    goto LABEL_9;
  }
  if (v6) {
    v11 = v5;
  }
  else {
    v11 = self;
  }
  v12 = v11;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_3;
  v18 = &unk_265161668;
  id v19 = v4;
  v20 = self;
  v21 = v12;
  v13 = v12;
  AXPerformSafeBlock();
  AXPerformBlockOnMainThreadAfterDelay();

LABEL_8:
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

uint64_t __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationListCountIndicatorViewTapped:*(void *)(a1 + 40)];
}

void __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"listModel"];
  v2 = [v3 safeValueForKey:@"masterListView"];
  UIAccessibilityPostNotification(v1, v2);
}

uint64_t __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationListCountIndicatorViewLongPressed:*(void *)(a1 + 40) presentingView:*(void *)(a1 + 48)];
}

void __74__NCNotificationListCountIndicatorViewAccessibility_accessibilityActivate__block_invoke_4()
{
}

- (id)automationElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 _allSubviews];

  return v3;
}

@end