@interface FMAVPlayerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axAssetVideoLabel;
- (id)accessibilityLabel;
@end

@implementation FMAVPlayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMAVPlayerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  v2 = [(FMAVPlayerViewAccessibility *)self _axAssetVideoLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_axAssetVideoLabel
{
  v2 = [(FMAVPlayerViewAccessibility *)self safeStringForKey:@"accessibilityAssetName"];
  if (([v2 isEqualToString:@"PairingLoopLight-HAWKEYE"] & 1) != 0
    || ([v2 isEqualToString:@"PairingLoopDark-HAWKEYE"] & 1) != 0)
  {
    BOOL v3 = @"pairing.loop.video";
LABEL_10:
    v4 = accessibilityB389LocalizedString(v3);
    goto LABEL_11;
  }
  if (([v2 isEqualToString:@"Add-Button_iPhone-B389"] & 1) != 0
    || ([v2 isEqualToString:@"Add-FaceID_iPhone-B389"] & 1) != 0)
  {
    BOOL v3 = @"add.item.to.iPhone";
    goto LABEL_10;
  }
  if (([v2 isEqualToString:@"Add-Button_iPad-B389"] & 1) != 0
    || ([v2 isEqualToString:@"Add-FaceID_iPad-B389"] & 1) != 0)
  {
    BOOL v3 = @"add.item.to.iPad";
    goto LABEL_10;
  }
  if ([v2 isEqualToString:@"BatterySwap_loop-B389"])
  {
    BOOL v3 = @"battery-swap-video";
    goto LABEL_10;
  }
  if ([v2 isEqualToString:@"FMR1Found-B389"])
  {
    BOOL v3 = @"found.item.video";
    goto LABEL_10;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(FMAVPlayerViewAccessibility *)self _axAssetVideoLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMAVPlayerViewAccessibility;
    id v5 = [(FMAVPlayerViewAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

@end