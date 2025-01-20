@interface WKContentViewAccessibility__MessageUI__WebKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axFirstResponderStartRepost;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axRepostFirstResponderWhenReady;
- (void)_axSetFirstResponderStartRepost:(id)a3;
- (void)dealloc;
- (void)willMoveToWindow:(id)a3;
@end

@implementation WKContentViewAccessibility__MessageUI__WebKit

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFirstResponderStartRepost
{
}

- (void)_axSetFirstResponderStartRepost:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  [(WKContentViewAccessibility__MessageUI__WebKit *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x263EF8330];
  objc_copyWeak(&v5, &location);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash", v4, 3221225472, __91__WKContentViewAccessibility__MessageUI__WebKit__accessibilityLoadAccessibilityInformation__block_invoke, &unk_2650A3EB0));
  AXAddNotificationCallback();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_axRepostFirstResponderWhenReady
{
  v3 = [(WKContentViewAccessibility__MessageUI__WebKit *)self _accessibilityResponderElement];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash"));
    AXRemoveNotificationCallback();

    _UIAccessibilitySetAssociatedElementContextForNextNotification();
    UIAccessibilityNotifications v5 = *MEMORY[0x263F812B8];
    UIAccessibilityPostNotification(v5, 0);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    objc_super v7 = [(WKContentViewAccessibility__MessageUI__WebKit *)self _axFirstResponderStartRepost];
    [v7 doubleValue];
    double v9 = Current - v8;

    if (v9 < 3.0) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  [(WKContentViewAccessibility__MessageUI__WebKit *)&v4 willMoveToWindow:a3];
  [(WKContentViewAccessibility__MessageUI__WebKit *)self _accessibilityLoadAccessibilityInformation];
}

- (void)dealloc
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash"));
  AXRemoveNotificationCallback();

  v4.receiver = self;
  v4.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  [(WKContentViewAccessibility__MessageUI__WebKit *)&v4 dealloc];
}

@end