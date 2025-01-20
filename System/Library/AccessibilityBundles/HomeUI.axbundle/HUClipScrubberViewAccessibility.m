@interface HUClipScrubberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (HUClipScrubberViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_axPlayPauseButton;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HUClipScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUClipScrubberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberView", @"isPlayingMedia", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberView", @"playPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberView", @"rightActionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberView", @"clipCollectionView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(HUClipScrubberViewAccessibility *)self safeValueForKey:@"playPauseButton"];
  v5 = [(HUClipScrubberViewAccessibility *)self safeValueForKey:@"rightActionButton"];
  v6 = [(HUClipScrubberViewAccessibility *)self safeValueForKey:@"clipCollectionView"];
  v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)HUClipScrubberViewAccessibility;
  [(HUClipScrubberViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(HUClipScrubberViewAccessibility *)self _axPlayPauseButton];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__HUClipScrubberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265128018;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityLabelBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __77__HUClipScrubberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isPlayingMedia"]) {
    v2 = @"camera.clip.pause.button";
  }
  else {
    v2 = @"camera.clip.play.button";
  }
  id v3 = accessibilityHomeUILocalizedString(v2);

  return v3;
}

- (id)_axPlayPauseButton
{
  return (id)[(HUClipScrubberViewAccessibility *)self safeValueForKey:@"playPauseButton"];
}

- (HUClipScrubberViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberViewAccessibility;
  id v3 = -[HUClipScrubberViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HUClipScrubberViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end