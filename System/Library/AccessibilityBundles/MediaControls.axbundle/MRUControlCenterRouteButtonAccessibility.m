@interface MRUControlCenterRouteButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityLabel;
@end

@implementation MRUControlCenterRouteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUControlCenterRouteButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUControlCenterRouteButton", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUControlCenterRouteButton", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MRUControlCenterRouteButtonAccessibility *)self safeValueForKey:@"label"];
  v4 = [v3 accessibilityLabel];

  objc_opt_class();
  v5 = [(MRUControlCenterRouteButtonAccessibility *)self safeValueForKey:@"imageView"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 image];
  v8 = [v7 imageAsset];
  v9 = [v8 safeStringForKey:@"assetName"];

  if ([v9 isEqualToString:@"airplayaudio"])
  {
    v10 = @"airplay.audio.label";
LABEL_12:
    uint64_t v11 = accessibilityLocalizedString(v10);
LABEL_13:
    v12 = (void *)v11;
    goto LABEL_14;
  }
  if ([v9 isEqualToString:@"airplayvideo"])
  {
    v10 = @"airplay.video.label";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"headphones"])
  {
    v10 = @"route.description.headphones";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"speaker.wave.2.fill"])
  {
    v10 = @"playback.destination.button.label";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"airpods"]
    || [v9 isEqualToString:@"airpods.gen3"])
  {
    v10 = @"route.description.airpods";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"airpodspro"])
  {
    v10 = @"route.description.airpodspro";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"airpodsmax"])
  {
    v10 = @"route.description.airpodsmax";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"beats.fit.pro"])
  {
    v10 = @"route.description.beatspro";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"homepod.fill"])
  {
    v10 = @"route.description.homepod";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"display"])
  {
    v10 = @"route.description.display";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"hifispeaker.fill"])
  {
    v10 = @"route.description.speaker";
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"tv"])
  {
    v10 = @"route.description.tv";
    goto LABEL_12;
  }
  if (v9)
  {
    v15 = AXLogAppAccessibility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(MRUControlCenterRouteButtonAccessibility *)(uint64_t)v9 accessibilityLabel];
    }

    uint64_t v11 = [v6 accessibilityLabel];
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:
  v13 = __UIAXStringForVariables();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MRUControlCenterRouteButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MRUControlCenterRouteButtonAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityLabel
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242277000, a2, OS_LOG_TYPE_ERROR, "Unhandled asset name for media control button: %@", (uint8_t *)&v2, 0xCu);
}

@end