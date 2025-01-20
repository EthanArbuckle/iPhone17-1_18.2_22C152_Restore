@interface NowPlayingRouteSharePlayTogetherControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation NowPlayingRouteSharePlayTogetherControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingRouteSharePlayTogetherControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.NowPlayingRouteSharePlayTogetherControl" hasSwiftField:@"sharePlayTogetherButton" withSwiftType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.NowPlayingRouteSharePlayTogetherControl", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)NowPlayingRouteSharePlayTogetherControlAccessibility;
  [(NowPlayingRouteSharePlayTogetherControlAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  char v11 = 0;
  objc_opt_class();
  id v3 = [(NowPlayingRouteSharePlayTogetherControlAccessibility *)self safeSwiftValueForKey:@"sharePlayTogetherButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 configuration];
  v6 = [v5 title];

  v7 = accessibilityMusicLocalizedString(@"shareplay");
  [v4 setAccessibilityLabel:v7];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__NowPlayingRouteSharePlayTogetherControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_26513BC20;
  id v10 = v6;
  id v8 = v6;
  [v4 setAccessibilityValueBlock:v9];
}

id __98__NowPlayingRouteSharePlayTogetherControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) integerValue])
  {
    v2 = accessibilityMusicLocalizedString(@"PARTICIPANT_COUNT");
    [*(id *)(a1 + 32) integerValue];
    id v3 = AXCFormattedString();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingRouteSharePlayTogetherControlAccessibility;
  [(NowPlayingRouteSharePlayTogetherControlAccessibility *)&v3 layoutSubviews];
  [(NowPlayingRouteSharePlayTogetherControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end