@interface VUIPromoMetadataViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axOnlySkipButtonAvailable;
- (id)_axCanonicalId;
- (id)_axMediaTagsView;
- (id)_axMetadataLabel;
- (id)_axPromoInfo;
- (id)_axSkipButton;
- (id)_axTitleImageView;
- (id)_axUpNextButton;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)updateWithInfo:(id)a3;
@end

@implementation VUIPromoMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIPromoMetadataView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"skipInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVPMediaItemSkipInfo", @"promoInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"titleImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"mediaTagsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVPMediaItemPromoInfo", @"canonicalId", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"skipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"onlySkipButtonAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIPromoMetadataView", @"upNextButton", "@", 0);
}

- (id)_axPromoInfo
{
  return (id)[(VUIPromoMetadataViewAccessibility *)self safeValueForKeyPath:@"skipInfo.promoInfo"];
}

- (id)_axTitleImageView
{
  return (id)[(VUIPromoMetadataViewAccessibility *)self safeValueForKey:@"titleImageView"];
}

- (id)_axMediaTagsView
{
  return (id)[(VUIPromoMetadataViewAccessibility *)self safeValueForKey:@"mediaTagsView"];
}

- (id)_axSkipButton
{
  return (id)[(VUIPromoMetadataViewAccessibility *)self safeValueForKey:@"skipButton"];
}

- (BOOL)_axOnlySkipButtonAvailable
{
  return [(VUIPromoMetadataViewAccessibility *)self safeBoolForKey:@"onlySkipButtonAvailable"];
}

- (id)_axUpNextButton
{
  return (id)[(VUIPromoMetadataViewAccessibility *)self safeValueForKey:@"upNextButton"];
}

- (id)_axCanonicalId
{
  v2 = [(VUIPromoMetadataViewAccessibility *)self _axPromoInfo];
  id v3 = [v2 safeValueForKey:@"canonicalId"];

  return v3;
}

- (id)_axMetadataLabel
{
  id v3 = [(VUIPromoMetadataViewAccessibility *)self _axTitleImageView];
  v4 = [v3 accessibilityLabel];
  v5 = [(VUIPromoMetadataViewAccessibility *)self _axMediaTagsView];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20.receiver = self;
  v20.super_class = (Class)VUIPromoMetadataViewAccessibility;
  [(VUIPromoMetadataViewAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VUIPromoMetadataViewAccessibility *)self _axTitleImageView];
  [v3 setIsAccessibilityElement:1];

  v4 = [(VUIPromoMetadataViewAccessibility *)self _axTitleImageView];
  v5 = [(VUIPromoMetadataViewAccessibility *)self _axPromoInfo];
  v6 = [v5 safeStringForKey:@"title"];
  [v4 setAccessibilityLabel:v6];

  v7 = [(VUIPromoMetadataViewAccessibility *)self _axTitleImageView];
  uint64_t v8 = *MEMORY[0x263F1CEF8];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v9 = [(VUIPromoMetadataViewAccessibility *)self _axMediaTagsView];
  [v9 setIsAccessibilityElement:1];

  v10 = [(VUIPromoMetadataViewAccessibility *)self _axMediaTagsView];
  [v10 setAccessibilityTraits:v8];

  objc_initWeak(&location, self);
  v11 = [(VUIPromoMetadataViewAccessibility *)self _axSkipButton];
  [v11 _accessibilitySetShouldIncludeRowRangeInElementDescription:1];

  v12 = [(VUIPromoMetadataViewAccessibility *)self _axSkipButton];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_2651661F8;
  objc_copyWeak(&v18, &location);
  [v12 _setAccessibilityRowRangeBlock:v17];

  v13 = [(VUIPromoMetadataViewAccessibility *)self _axUpNextButton];
  [v13 _accessibilitySetShouldIncludeRowRangeInElementDescription:1];

  v14 = [(VUIPromoMetadataViewAccessibility *)self _axUpNextButton];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v15[3] = &unk_2651661F8;
  objc_copyWeak(&v16, &location);
  [v14 _setAccessibilityRowRangeBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

id __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axOnlySkipButtonAvailable])
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 2, 2);
  }

  return v2;
}

id __79__VUIPromoMetadataViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axOnlySkipButtonAvailable])
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 1, 2);
  }

  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIPromoMetadataViewAccessibility;
  [(VUIPromoMetadataViewAccessibility *)&v3 layoutSubviews];
  [(VUIPromoMetadataViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)updateWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIPromoMetadataViewAccessibility;
  [(VUIPromoMetadataViewAccessibility *)&v4 updateWithInfo:a3];
  [(VUIPromoMetadataViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)VUIPromoMetadataViewAccessibility;
  [(VUIPromoMetadataViewAccessibility *)&v2 didMoveToSuperview];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __55__VUIPromoMetadataViewAccessibility_didMoveToSuperview__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) _axSkipButton];
  UIAccessibilityPostNotification(v1, v2);
}

@end