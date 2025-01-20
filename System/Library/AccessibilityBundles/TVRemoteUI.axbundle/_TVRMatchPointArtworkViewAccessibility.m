@interface _TVRMatchPointArtworkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _TVRMatchPointArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVRMatchPointArtworkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVRMatchPointArtworkView" hasInstanceVariable:@"_selectIndicator" withType:"UIView"];
  [v3 validateClass:@"_TVRMatchPointArtworkView" hasInstanceVariable:@"_upImageView" withType:"UIImageView"];
  [v3 validateClass:@"_TVRMatchPointArtworkView" hasInstanceVariable:@"_rightImageView" withType:"UIImageView"];
  [v3 validateClass:@"_TVRMatchPointArtworkView" hasInstanceVariable:@"_downImageView" withType:"UIImageView"];
  [v3 validateClass:@"_TVRMatchPointArtworkView" hasInstanceVariable:@"_leftImageView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v35.receiver = self;
  v35.super_class = (Class)_TVRMatchPointArtworkViewAccessibility;
  [(_TVRMatchPointArtworkViewAccessibility *)&v35 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVRMatchPointArtworkViewAccessibility *)self safeUIViewForKey:@"_selectIndicator"];
  v4 = [(_TVRMatchPointArtworkViewAccessibility *)self safeUIViewForKey:@"_upImageView"];
  v5 = [(_TVRMatchPointArtworkViewAccessibility *)self safeUIViewForKey:@"_rightImageView"];
  v6 = [(_TVRMatchPointArtworkViewAccessibility *)self safeUIViewForKey:@"_downImageView"];
  v7 = [(_TVRMatchPointArtworkViewAccessibility *)self safeUIViewForKey:@"_leftImageView"];
  [v3 setIsAccessibilityElement:1];
  [v4 setIsAccessibilityElement:1];
  [v5 setIsAccessibilityElement:1];
  [v6 setIsAccessibilityElement:1];
  [v7 setIsAccessibilityElement:1];
  v8 = accessibilityLocalizedString(@"tv.remote.touchpad.select.button");
  [v3 setAccessibilityLabel:v8];

  v9 = accessibilityLocalizedString(@"tv.remote.touchpad.up.button");
  [v4 setAccessibilityLabel:v9];

  v10 = accessibilityLocalizedString(@"tv.remote.touchpad.right.button");
  [v5 setAccessibilityLabel:v10];

  v11 = accessibilityLocalizedString(@"tv.remote.touchpad.down.button");
  [v6 setAccessibilityLabel:v11];

  v12 = accessibilityLocalizedString(@"tv.remote.touchpad.left.button");
  [v7 setAccessibilityLabel:v12];

  uint64_t v13 = *MEMORY[0x263F1CEE8];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 setAccessibilityTraits:v13];
  [v5 setAccessibilityTraits:v13];
  [v6 setAccessibilityTraits:v13];
  [v7 setAccessibilityTraits:v13];
  [v3 _accessibilitySetScannerActivateBehavior:1];
  [v4 _accessibilitySetScannerActivateBehavior:1];
  [v5 _accessibilitySetScannerActivateBehavior:1];
  [v6 _accessibilitySetScannerActivateBehavior:1];
  [v7 _accessibilitySetScannerActivateBehavior:1];
  [v3 accessibilityFrame];
  double v15 = v14;
  double v17 = v16;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v18 = (UIView *)objc_claimAutoreleasedReturnValue();
  [v4 center];
  double v34 = v19;
  [v4 center];
  double v21 = v20;
  [v5 center];
  double v23 = v22;
  [v5 center];
  double v25 = v24;
  [v6 center];
  double v27 = v26;
  [v6 center];
  double v29 = v28;
  [v7 center];
  double v31 = v30;
  [v7 center];
  if (v18)
  {
    CGFloat v33 = v32 - v17 * 0.5;
    v36.origin.x = v34 - v15 * 0.5;
    v36.origin.y = v21 - v17 * 0.5;
    v36.size.width = v15;
    v36.size.height = v17;
    CGRect v37 = UIAccessibilityConvertFrameToScreenCoordinates(v36, v18);
    objc_msgSend(v4, "setAccessibilityFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    v38.origin.x = v23 - v15 * 0.5;
    v38.origin.y = v25 - v17 * 0.5;
    v38.size.width = v15;
    v38.size.height = v17;
    CGRect v39 = UIAccessibilityConvertFrameToScreenCoordinates(v38, v18);
    objc_msgSend(v5, "setAccessibilityFrame:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v40.origin.x = v27 - v15 * 0.5;
    v40.origin.y = v29 - v17 * 0.5;
    v40.size.width = v15;
    v40.size.height = v17;
    CGRect v41 = UIAccessibilityConvertFrameToScreenCoordinates(v40, v18);
    objc_msgSend(v6, "setAccessibilityFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
    v42.origin.y = v33;
    v42.origin.x = v31 - v15 * 0.5;
    v42.size.width = v15;
    v42.size.height = v17;
    CGRect v43 = UIAccessibilityConvertFrameToScreenCoordinates(v42, v18);
    objc_msgSend(v7, "setAccessibilityFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRMatchPointArtworkViewAccessibility;
  [(_TVRMatchPointArtworkViewAccessibility *)&v3 layoutSubviews];
  [(_TVRMatchPointArtworkViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end