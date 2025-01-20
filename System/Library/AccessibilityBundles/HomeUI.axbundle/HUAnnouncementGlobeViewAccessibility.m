@interface HUAnnouncementGlobeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_playAnnouncementWithInfo:(id)a3;
- (void)_setupSubviewsForAnnouncementInfo:(id)a3;
@end

@implementation HUAnnouncementGlobeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAnnouncementGlobeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUAnnouncementGlobeView" hasInstanceVariable:@"_tappableCoverView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnouncementGlobeView", @"_setupSubviewsForAnnouncementInfo:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnouncementGlobeView", @"_playAnnouncementWithInfo:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnouncementGlobeView", @"audioPlayer", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  [(HUAnnouncementGlobeViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(HUAnnouncementGlobeViewAccessibility *)self safeUIViewForKey:@"_tappableCoverView"];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_265128018;
  objc_copyWeak(&v10, &location);
  [v3 _setAccessibilityLabelBlock:&v6];

  v4 = [(HUAnnouncementGlobeViewAccessibility *)self safeUIViewForKey:@"_tappableCoverView", v6, v7, v8, v9];
  [v4 _setAccessibilityHintBlock:&__block_literal_global_1];

  v5 = [(HUAnnouncementGlobeViewAccessibility *)self safeUIViewForKey:@"_tappableCoverView"];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"audioPlayer"];

  if (v2) {
    id v3 = @"stop.button";
  }
  else {
    id v3 = @"play.button";
  }
  v4 = accessibilityHomeUILocalizedString(v3);

  return v4;
}

uint64_t __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 0;
}

- (void)_setupSubviewsForAnnouncementInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  [(HUAnnouncementGlobeViewAccessibility *)&v4 _setupSubviewsForAnnouncementInfo:a3];
  [(HUAnnouncementGlobeViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_playAnnouncementWithInfo:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  [(HUAnnouncementGlobeViewAccessibility *)&v3 _playAnnouncementWithInfo:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], &stru_26F6C69B8);
}

@end