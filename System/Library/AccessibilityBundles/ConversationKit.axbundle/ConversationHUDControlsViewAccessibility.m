@interface ConversationHUDControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
@end

@implementation ConversationHUDControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ConversationHUDControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.BannerPresentationManager", @"dismissPresentedBannerForReason:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.BannerPresentationManager", @"presentedBanner", "@", 0);
}

- (BOOL)accessibilityElementsHidden
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 _accessibilityVisibleFrame];
  BOOL IsEmpty = CGRectIsEmpty(v5);

  return IsEmpty;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 delegate];

  v4 = [v3 safeValueForKey:@"bannerPresentationManager"];
  CGRect v5 = [v4 safeValueForKey:@"presentedBanner"];
  if (v5)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    id v8 = v4;
    AXPerformSafeBlock();
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __70__ConversationHUDControlsViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) dismissPresentedBannerForReason:@"Accessibility escape performed" animated:1];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end