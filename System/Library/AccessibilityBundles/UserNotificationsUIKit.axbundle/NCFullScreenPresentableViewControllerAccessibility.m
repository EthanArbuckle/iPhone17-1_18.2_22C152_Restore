@interface NCFullScreenPresentableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axGetAssertion;
- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3;
- (void)_axHandleStandByAnnouncementFinished;
- (void)_axSetAssertion:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation NCFullScreenPresentableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCFullScreenPresentableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCFullScreenPresentableViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"NCFullScreenPresentableViewController" hasInstanceVariable:@"_bannerView" withType:"NCFullScreenStagingBannerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCFullScreenStagingBannerView", @"stage", "q", 0);
  [v3 validateClass:@"NCFullScreenPresentableViewController" hasInstanceVariable:@"_notificationRequest" withType:"NCNotificationRequest"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"content", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"defaultHeader", "@", 0);
  [v3 validateClass:@"NCFullScreenStagingBannerView" hasInstanceVariable:@"_dateLabel" withType:"UILabel"];
  [v3 validateClass:@"NCFullScreenStagingBannerView" hasInstanceVariable:@"_detailPrimaryLabel" withType:"UILabel"];
  [v3 validateClass:@"NCFullScreenStagingBannerView" hasInstanceVariable:@"_detailSecondaryLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCFullScreenPresentableViewController", @"_animateTransitionToDetailStateForTrigger:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCFullScreenPresentableViewController", @"requestTransitionBlockingAssertionWithReason:", "@", "@", 0);
}

- (id)_axGetAssertion
{
}

- (void)_axSetAssertion:(id)a3
{
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewControllerAccessibility;
  [(NCFullScreenPresentableViewControllerAccessibility *)&v6 viewIsAppearing:a3];
  v5 = [(NCFullScreenPresentableViewControllerAccessibility *)self requestTransitionBlockingAssertionWithReason:@"brief banner load"];
  id v4 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __70__NCFullScreenPresentableViewControllerAccessibility_viewIsAppearing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateWithReason:@"skip brief banner quickly"];
}

- (void)_axHandleStandByAnnouncementFinished
{
  id v3 = [(NCFullScreenPresentableViewControllerAccessibility *)self safeValueForKey:@"bannerView"];
  id v4 = [v3 safeValueForKey:@"_detailPrimaryLabel"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
  AXPerformBlockOnMainThreadAfterDelay();
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1CDB0] object:0];
}

void __90__NCFullScreenPresentableViewControllerAccessibility__axHandleStandByAnnouncementFinished__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axGetAssertion];
  [v1 invalidateWithReason:@"vot finished speaking"];
}

- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NCFullScreenPresentableViewControllerAccessibility;
  [(NCFullScreenPresentableViewControllerAccessibility *)&v14 _animateTransitionToDetailStateForTrigger:a3];
  id v4 = [(NCFullScreenPresentableViewControllerAccessibility *)self safeValueForKey:@"bannerView"];
  if ([v4 safeIntForKey:@"stage"] == 2)
  {
    v5 = [(NCFullScreenPresentableViewControllerAccessibility *)self requestTransitionBlockingAssertionWithReason:@"detail banner loaded"];
    [(NCFullScreenPresentableViewControllerAccessibility *)self _axSetAssertion:v5];
    objc_super v6 = [(NCFullScreenPresentableViewControllerAccessibility *)self safeValueForKey:@"_notificationRequest"];
    v7 = [v6 safeValueForKey:@"content"];
    v8 = [v7 safeValueForKey:@"defaultHeader"];

    v9 = [v4 safeValueForKey:@"_dateLabel"];
    v10 = [v4 safeValueForKey:@"_detailPrimaryLabel"];
    v11 = [v4 safeValueForKey:@"_detailSecondaryLabel"];
    v12 = __UIAXStringForVariables();
    v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v9, v10, v11, @"__AXStringForVariablesSentinel");
    [v13 addObserver:self selector:sel__axHandleStandByAnnouncementFinished name:*MEMORY[0x263F1CDB0] object:0];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v12);
  }
}

@end