@interface MRUNowPlayingLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MRUNowPlayingLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"routeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"titleMarqueeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"subtitleMarqueeView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingLabelViewAccessibility;
  [(MRUNowPlayingLabelViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MRUNowPlayingLabelViewAccessibility *)self safeValueForKey:@"routeLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(MRUNowPlayingLabelViewAccessibility *)self safeValueForKey:@"titleMarqueeView"];
  [v4 setIsAccessibilityElement:0];

  v5 = [(MRUNowPlayingLabelViewAccessibility *)self safeValueForKey:@"subtitleMarqueeView"];
  [v5 setIsAccessibilityElement:0];
}

@end