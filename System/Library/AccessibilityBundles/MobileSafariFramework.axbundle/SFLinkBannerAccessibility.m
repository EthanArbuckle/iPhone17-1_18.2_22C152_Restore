@interface SFLinkBannerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (int64_t)_accessibilitySortPriority;
- (unint64_t)accessibilityTraits;
@end

@implementation SFLinkBannerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFLinkBanner";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFLinkBanner", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFLinkBanner", @"messageLabelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFLinkBanner", @"_open", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFLinkBanner", @"openButton", "@", 0);
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(SFLinkBannerAccessibility *)self safeValueForKey:@"openButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SFLinkBannerAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(SFLinkBannerAccessibility *)self safeValueForKey:@"messageLabelText"];
  v6 = [(SFLinkBannerAccessibility *)self safeValueForKey:@"openButton"];
  v9 = [v6 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __50__SFLinkBannerAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _open];
}

- (int64_t)_accessibilitySortPriority
{
  return 999;
}

@end