@interface NCNotificationListSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)axDigestCollapseButton;
- (id)axTitle;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureClearButtonIfNecessary;
- (void)_configureCollapseButtonIfNecessary;
@end

@implementation NCNotificationListSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"clearButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"collapseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"_configureClearButtonIfNecessary", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"_handleCollapseActionTriggered:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionHeaderView", @"_configureCollapseButtonIfNecessary", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  [(NCNotificationListSectionHeaderViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NCNotificationListSectionHeaderViewAccessibility *)self safeValueForKey:@"clearButton"];
  v4 = [(NCNotificationListSectionHeaderViewAccessibility *)self axTitle];
  [v3 setAccessibilityValue:v4];

  v5 = [(NCNotificationListSectionHeaderViewAccessibility *)self axDigestCollapseButton];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_265161850;
  v10[4] = self;
  [v5 _setAccessibilityLabelBlock:v10];

  objc_initWeak(&location, self);
  v6 = [(NCNotificationListSectionHeaderViewAccessibility *)self axDigestCollapseButton];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_265161878;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityActivateBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = accessibilityLocalizedString(@"collapse.digest");
  v4 = [*(id *)(a1 + 32) axTitle];
  v5 = objc_msgSend(v2, "stringWithFormat:", v3, v4);

  return v5;
}

uint64_t __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_destroyWeak(&v2);
  return 1;
}

void __94__NCNotificationListSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 axDigestCollapseButton];
  [v2 _handleCollapseActionTriggered:v1];
}

- (id)axDigestCollapseButton
{
  return (id)[(NCNotificationListSectionHeaderViewAccessibility *)self safeValueForKey:@"collapseButton"];
}

- (id)axTitle
{
  return (id)[(NCNotificationListSectionHeaderViewAccessibility *)self safeStringForKey:@"title"];
}

- (int64_t)_accessibilitySortPriority
{
  return 0;
}

- (void)_configureClearButtonIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  [(NCNotificationListSectionHeaderViewAccessibility *)&v3 _configureClearButtonIfNecessary];
  [(NCNotificationListSectionHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_configureCollapseButtonIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderViewAccessibility;
  [(NCNotificationListSectionHeaderViewAccessibility *)&v3 _configureCollapseButtonIfNecessary];
  [(NCNotificationListSectionHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end