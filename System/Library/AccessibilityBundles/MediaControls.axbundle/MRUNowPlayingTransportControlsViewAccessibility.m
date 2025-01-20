@interface MRUNowPlayingTransportControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation MRUNowPlayingTransportControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingTransportControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"leadingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"leftButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"centerButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"rightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"routingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"layout", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingTransportControlsView", @"showRoutingButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUTransportButton", @"transportControlItem", "@", 0);
}

- (id)accessibilityElements
{
  if ([(MRUNowPlayingTransportControlsViewAccessibility *)self safeIntForKey:@"_layout"])
  {
    v11.receiver = self;
    v11.super_class = (Class)MRUNowPlayingTransportControlsViewAccessibility;
    id v3 = [(MRUNowPlayingTransportControlsViewAccessibility *)&v11 accessibilityElements];
  }
  else
  {
    id v3 = objc_opt_new();
    v4 = [(MRUNowPlayingTransportControlsViewAccessibility *)self safeValueForKey:@"leadingButton"];
    v5 = [v4 safeValueForKey:@"transportControlItem"];

    if (v5) {
      [v3 axSafelyAddObject:v4];
    }
    v6 = [(MRUNowPlayingTransportControlsViewAccessibility *)self safeValueForKey:@"leftButton"];
    [v3 axSafelyAddObject:v6];

    v7 = [(MRUNowPlayingTransportControlsViewAccessibility *)self safeValueForKey:@"centerButton"];
    [v3 axSafelyAddObject:v7];

    v8 = [(MRUNowPlayingTransportControlsViewAccessibility *)self safeValueForKey:@"rightButton"];
    [v3 axSafelyAddObject:v8];

    if ([(MRUNowPlayingTransportControlsViewAccessibility *)self safeBoolForKey:@"_showRoutingButton"])
    {
      v9 = [(MRUNowPlayingTransportControlsViewAccessibility *)self safeValueForKey:@"routingButton"];
      [v3 axSafelyAddObject:v9];
    }
  }

  return v3;
}

@end