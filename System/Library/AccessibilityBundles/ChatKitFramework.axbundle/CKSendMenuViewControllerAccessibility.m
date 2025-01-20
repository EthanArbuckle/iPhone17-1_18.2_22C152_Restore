@interface CKSendMenuViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)shouldEnablePagingForScrollView:(id)a3;
- (double)calculatePercentVisibleForSection:(int64_t)a3;
- (void)loadMoreAppsSection;
@end

@implementation CKSendMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSendMenuViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSendMenuViewController", @"sendMenuViewControllerDelegate", "@", 0);
  [v3 validateProtocol:@"CKSendMenuViewControllerDelegate" hasRequiredInstanceMethod:@"sendMenuViewControllerRequestDismiss:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSendMenuViewController", @"loadMoreAppsSection", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSendMenuViewController", @"calculatePercentVisibleForSection:", "d", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSendMenuViewController", @"shouldEnablePagingForScrollView:", "B", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  v4 = [(CKSendMenuViewControllerAccessibility *)self safeValueForKey:@"sendMenuViewControllerDelegate"];
  id v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __67__CKSendMenuViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMenuViewControllerRequestDismiss:*(void *)(a1 + 40)];
}

- (void)loadMoreAppsSection
{
  v2.receiver = self;
  v2.super_class = (Class)CKSendMenuViewControllerAccessibility;
  [(CKSendMenuViewControllerAccessibility *)&v2 loadMoreAppsSection];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (double)calculatePercentVisibleForSection:(int64_t)a3
{
  double v5 = 1.0;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKSendMenuViewControllerAccessibility;
    [(CKSendMenuViewControllerAccessibility *)&v8 calculatePercentVisibleForSection:a3];
    return v6;
  }
  return v5;
}

- (BOOL)shouldEnablePagingForScrollView:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKSendMenuViewControllerAccessibility;
    BOOL v5 = [(CKSendMenuViewControllerAccessibility *)&v7 shouldEnablePagingForScrollView:v4];
  }

  return v5;
}

@end