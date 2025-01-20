@interface ARCoachingOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsActive;
- (id)_axCoachingText;
- (void)_axAnnounceCoachingText;
- (void)crossFadeCoachingMessage:(int64_t)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ARCoachingOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ARCoachingOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ARCoachingOverlayView", @"setActive:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ARCoachingOverlayView", @"crossFadeCoachingMessage:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ARCoachingOverlayView", @"isActive", "B", 0);
  [v3 validateClass:@"ARCoachingOverlayView" hasInstanceVariable:@"_coachingText" withType:"UILabel"];
  [v3 validateClass:@"ARCoachingOverlayView" hasInstanceVariable:@"_coachingMessageType" withType:"q"];
}

- (BOOL)_axIsActive
{
  return [(ARCoachingOverlayViewAccessibility *)self safeBoolForKey:@"isActive"];
}

- (id)_axCoachingText
{
  v2 = [(ARCoachingOverlayViewAccessibility *)self safeValueForKey:@"_coachingText"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_axAnnounceCoachingText
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [(ARCoachingOverlayViewAccessibility *)self _axCoachingText];
  UIAccessibilityPostNotification(v2, v3);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(ARCoachingOverlayViewAccessibility *)self _axIsActive];
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingOverlayViewAccessibility;
  [(ARCoachingOverlayViewAccessibility *)&v9 setActive:v5 animated:v4];
  BOOL v8 = [(ARCoachingOverlayViewAccessibility *)self _axIsActive];
  if (!v7 && v8) {
    [(ARCoachingOverlayViewAccessibility *)self _axAnnounceCoachingText];
  }
}

- (void)crossFadeCoachingMessage:(int64_t)a3
{
  uint64_t v5 = [(ARCoachingOverlayViewAccessibility *)self safeIntegerForKey:@"_coachingMessageType"];
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingOverlayViewAccessibility;
  [(ARCoachingOverlayViewAccessibility *)&v6 crossFadeCoachingMessage:a3];
  if (v5 != a3) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __63__ARCoachingOverlayViewAccessibility_crossFadeCoachingMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axAnnounceCoachingText];
}

@end