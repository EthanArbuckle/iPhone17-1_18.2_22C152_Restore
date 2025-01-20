@interface MFComposeStyleSelectorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)changeFontSizeAction:(id)a3;
@end

@implementation MFComposeStyleSelectorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeStyleSelectorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeStyleSelectorViewController", @"changeFontSizeAction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeStyleSelectorViewController", @"currentFontSize", "q", 0);
}

- (void)changeFontSizeAction:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeStyleSelectorViewControllerAccessibility;
  [(MFComposeStyleSelectorViewControllerAccessibility *)&v3 changeFontSizeAction:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__MFComposeStyleSelectorViewControllerAccessibility_changeFontSizeAction___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CDC8];
  objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", @"currentFontSize"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);
}

@end