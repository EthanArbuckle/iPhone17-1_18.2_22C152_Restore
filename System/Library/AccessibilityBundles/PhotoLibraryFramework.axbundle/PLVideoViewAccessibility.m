@interface PLVideoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementStoredUserLabel;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (void)_accessibilityClearChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_createScrubberIfNeeded;
- (void)_showVideoOverlay;
- (void)_updateScrubberVisibilityWithDuration:(double)a3;
- (void)_videoOverlayFadeOutDidFinish;
- (void)viewDidDisappear;
@end

@implementation PLVideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLVideoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLVideoView" hasInstanceVariable:@"_scrubberBackgroundView" withType:"UIView"];
  [v3 validateClass:@"PLVideoView" hasInstanceVariable:@"_videoCameraImage" withType:"PLManagedAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"_updateScrubberVisibilityWithDuration:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"pathForVideoFile", "@", 0);
  [v3 validateClass:@"PLVideoView" hasInstanceVariable:@"_trimMessageView" withType:"PLVideoEditingOverlayView"];
}

- (void)_accessibilityClearChildren
{
}

- (void)_showVideoOverlay
{
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
  v7.receiver = self;
  v7.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v7 _showVideoOverlay];
  v4 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
  if (v3 != v4)
  {
    v5 = accessibilityLocalizedString(@"play.video.button.txt");
    [v4 setAccessibilityLabel:v5];
  }
  [v4 alpha];
  [v4 setIsAccessibilityElement:v6 > 0.0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_videoOverlayFadeOutDidFinish
{
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v5 _videoOverlayFadeOutDidFinish];
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
  [v3 alpha];
  [v3 setIsAccessibilityElement:v4 > 0.0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  [(PLVideoViewAccessibility *)self _accessibilityClearChildren];
}

- (void)viewDidDisappear
{
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubber"];
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v5 viewDidDisappear];
  double v4 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubber"];

  if (v3 != v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  [(PLVideoViewAccessibility *)self _accessibilityClearChildren];
}

- (void)_createScrubberIfNeeded
{
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubber"];
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v5 _createScrubberIfNeeded];
  double v4 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubber"];

  if (v3 != v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  [(PLVideoViewAccessibility *)self _accessibilityClearChildren];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PLVideoViewAccessibility *)self accessibilityElements];
  if ([(PLVideoViewAccessibility *)self accessibilityElementCount])
  {
    if ([v3 count] == 1)
    {
      double v4 = [v3 firstObject];
      objc_super v5 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
      BOOL v6 = v4 == v5;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)accessibilityLabel
{
  v2 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoCameraImage"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263F81490];
  double v4 = [(PLVideoViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    BOOL v6 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    [(PLVideoViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:*v3];
    objc_super v7 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubber"];
    v8 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_scrubberBackgroundView"];
    if ([v8 _accessibilityViewIsVisible]) {
      [v6 addObject:v7];
    }
    v9 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
    if ([v9 _accessibilityViewIsVisible]) {
      [v6 addObject:v9];
    }
    v10 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_trimMessageView"];
    if ([v10 _accessibilityViewIsVisible]) {
      [v6 addObject:v10];
    }
    v11 = [(PLVideoViewAccessibility *)self valueForKey:@"_moviePlayer"];
    v12 = [v11 safeValueForKey:@"view"];
    v13 = [v12 safeValueForKey:@"_accessibleSubviews"];

    if ([v13 count]) {
      [v6 addObjectsFromArray:v13];
    }
    id v5 = v6;
  }

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"_videoOverlayPlayButton"];
  double v4 = accessibilityLocalizedString(@"play.video.button.txt");
  [v3 setAccessibilityLabel:v4];
}

- (void)_updateScrubberVisibilityWithDuration:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLVideoViewAccessibility;
  [(PLVideoViewAccessibility *)&v4 _updateScrubberVisibilityWithDuration:a3];
  [(PLVideoViewAccessibility *)self _accessibilityClearChildren];
}

- (id)accessibilityURL
{
  objc_opt_class();
  id v3 = [(PLVideoViewAccessibility *)self safeValueForKey:@"pathForVideoFile"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = [NSURL fileURLWithPath:v4 isDirectory:0];

  return v5;
}

- (id)_accessibilityElementStoredUserLabel
{
  v2 = [(PLVideoViewAccessibility *)self accessibilityURL];
  id v3 = UIAccessibilityMetadataDescriptionForVideo();

  return v3;
}

@end