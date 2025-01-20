@interface PlayControlsStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdatePlayButtonState;
@end

@implementation PlayControlsStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.PlayControlsStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityPlayButtonState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityPlaybackStatusView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityEpisodeStateControls", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.PlayControlsStackView", @"accessibilityUpdatePlayButtonState", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PlayControlsStackViewAccessibility *)self safeUIViewForKey:@"accessibilityPlaybackStatusView"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [v3 accessibilityLabel];
  }
  else
  {
    v4 = 0;
  }
  v5 = [(PlayControlsStackViewAccessibility *)self safeValueForKey:@"accessibilityEpisodeStateControls"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PlayControlsStackViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PlayControlsStackViewAccessibility *)&v3 accessibilityTraits];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PlayControlsStackViewAccessibility;
  [(PlayControlsStackViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PlayControlsStackViewAccessibility *)self safeValueForKey:@"accessibilityPlayPauseButton"];
  unint64_t v4 = [(PlayControlsStackViewAccessibility *)self safeIntegerForKey:@"accessibilityPlayButtonState"];
  if (v4 > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = accessibilityLocalizedString(off_265144258[v4]);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__PlayControlsStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265144238;
  id v8 = v5;
  id v6 = v5;
  [v3 _setAccessibilityLabelBlock:v7];
}

id __80__PlayControlsStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)accessibilityUpdatePlayButtonState
{
  v3.receiver = self;
  v3.super_class = (Class)PlayControlsStackViewAccessibility;
  [(PlayControlsStackViewAccessibility *)&v3 accessibilityUpdatePlayButtonState];
  [(PlayControlsStackViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end