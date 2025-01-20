@interface QLMediaItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyContentOffset:(id)a3 contentOffset:(CGPoint)a4;
- (void)_axSetLabelForTimeLabel;
- (void)_axSetUpScrubberView;
- (void)_axUpdateAccessibleElements;
- (void)setTimeLabelNeedsUpdate;
- (void)setUpTimeLabelIfNeeded;
@end

@implementation QLMediaItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLMediaItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"isDragging", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLVideoScrubberView", @"isUserInteractingWithScrubber", "B", 0);
  [v3 validateClass:@"QLMediaItemViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"QLMediaItemViewController" isKindOfClass:@"QLMediaItemBaseViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMediaItemViewController", @"timeLabelScrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMediaItemViewController", @"setUpTimeLabelIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMediaItemViewController", @"setTimeLabelNeedsUpdate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMediaItemBaseViewController", @"elapsedTime", "d", 0);
  [v3 validateClass:@"QLMediaItemViewController" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v3 validateClass:@"QLAudioItemViewController" isKindOfClass:@"QLMediaItemViewController"];
  [v3 validateClass:@"QLMovieItemViewController" isKindOfClass:@"QLMediaItemViewController"];
  [v3 validateClass:@"QLAudioItemViewController" hasInstanceVariable:@"_playButton" withType:"QLOverlayPlayButton"];
  [v3 validateClass:@"QLMovieItemViewController" hasInstanceVariable:@"_playButton" withType:"QLOverlayPlayButton"];
  [v3 validateClass:@"QLMovieItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMovieItemViewController", @"isEditing", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewControllerAccessibility;
  [(QLMediaItemViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(QLMediaItemViewControllerAccessibility *)self _axSetUpScrubberView];
}

- (void)_axApplyContentOffset:(id)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  objc_opt_class();
  v7 = [v6 _accessibilityViewAncestorIsKindOf:MEMORY[0x2455E48A0](@"QLVideoScrubberView")];
  v8 = __UIAccessibilityCastAsSafeCategory();

  [v6 _axSetIsDragging:1];
  [v8 _axSetIsScrubbering:1];
  objc_msgSend(v6, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, x, y);
  v11 = v6;
  v12 = v8;
  id v9 = v8;
  id v10 = v6;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __78__QLMediaItemViewControllerAccessibility__axApplyContentOffset_contentOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axSetIsDragging:0];
  v2 = *(void **)(a1 + 40);

  return [v2 _axSetIsScrubbering:0];
}

- (void)_axSetUpScrubberView
{
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = [(QLMediaItemViewControllerAccessibility *)self safeValueForKey:@"timeLabelScrollView"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && ([v4 isAccessibilityElement] & 1) == 0)
  {
    objc_initWeak(&location, v4);
    [v4 accessibilitySetIdentification:@"MediaScrubber"];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke;
    v15[3] = &unk_2650A96F8;
    objc_copyWeak(&v16, &location);
    [v4 _setIsAccessibilityElementBlock:v15];
    v5 = accessibilityLocalizedString(@"media.scrubber");
    [v4 setAccessibilityLabel:v5];

    [v4 setAccessibilityTraits:*MEMORY[0x263F1CED8]];
    id v6 = accessibilityLocalizedString(@"media.scrubber.hint");
    [v4 setAccessibilityHint:v6];

    objc_initWeak(&from, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_2;
    v12[3] = &unk_2650A9720;
    objc_copyWeak(&v13, &from);
    [v4 _setAccessibilityValueBlock:v12];
    objc_initWeak(&v11, v4);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_3;
    v9[3] = &unk_2650A9748;
    objc_copyWeak(&v10, &v11);
    v9[4] = self;
    [v4 _setAccessibilityIncrementBlock:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_4;
    v7[3] = &unk_2650A9748;
    objc_copyWeak(&v8, &v11);
    v7[4] = self;
    [v4 _setAccessibilityDecrementBlock:v7];
    [(QLMediaItemViewControllerAccessibility *)self _axUpdateAccessibleElements];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

uint64_t __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _accessibilityViewIsVisible];

  return v2;
}

uint64_t __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained safeCGFloatForKey:@"elapsedTime"];
  unint64_t v3 = v2;

  v4.n128_u64[0] = v3;

  return MEMORY[0x270F0A0A8](v4);
}

void __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_3(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained contentSize];
  double v5 = v4;
  id v6 = objc_loadWeakRetained(v2);
  [v6 contentInset];
  double v8 = v5 - v7;

  id v9 = objc_loadWeakRetained(v2);
  [v9 contentOffset];
  double v11 = v10;
  double v13 = v12;

  id v14 = objc_loadWeakRetained(v2);
  [v14 contentSize];
  double v16 = v11 + v15 / 10.0;

  if (v16 >= v8) {
    double v16 = v8;
  }
  v17 = *(void **)(a1 + 32);
  objc_opt_class();
  id v19 = objc_loadWeakRetained(v2);
  v18 = __UIAccessibilityCastAsSafeCategory();
  objc_msgSend(v17, "_axApplyContentOffset:contentOffset:", v18, v16, v13);
}

void __62__QLMediaItemViewControllerAccessibility__axSetUpScrubberView__block_invoke_4(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained contentOffset];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_loadWeakRetained(v2);
  [v8 contentSize];
  double v10 = v5 + v9 / -10.0;

  double v11 = *(void **)(a1 + 32);
  objc_opt_class();
  id v13 = objc_loadWeakRetained(v2);
  double v12 = __UIAccessibilityCastAsSafeCategory();
  objc_msgSend(v11, "_axApplyContentOffset:contentOffset:", v12, v10, v7);
}

- (void)_axUpdateAccessibleElements
{
  LOBYTE(location) = 0;
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  double v4 = [v3 view];

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__QLMediaItemViewControllerAccessibility__axUpdateAccessibleElements__block_invoke;
  v5[3] = &unk_2650A9770;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityElementsBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __69__QLMediaItemViewControllerAccessibility__axUpdateAccessibleElements__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MEMORY[0x2455E48A0](@"QLMovieItemViewController");
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_loadWeakRetained(v1);
    char v4 = [v3 safeBoolForKey:@"isEditing"];

    if (v4)
    {
      double v5 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_loadWeakRetained(v1);
  double v7 = [v6 safeValueForKey:@"_playButton"];

  id v8 = objc_loadWeakRetained(v1);
  double v9 = [v8 safeValueForKey:@"_timeLabel"];

  id v10 = objc_loadWeakRetained(v1);
  double v11 = [v10 safeUIViewForKey:@"timeLabelScrollView"];

  double v12 = [v11 superview];
  [v12 setAccessibilityElementsHidden:1];

  [v5 axSafelyAddObject:v7];
  [v5 axSafelyAddObject:v9];
  [v5 axSafelyAddObject:v11];

LABEL_6:

  return v5;
}

- (void)_axSetLabelForTimeLabel
{
  unint64_t v2 = [(QLMediaItemViewControllerAccessibility *)self safeValueForKey:@"_timeLabel"];
  if (v2)
  {
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    char v4 = [v3 text];

    if ([v4 hasPrefix:@"-"])
    {
      uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26F4387B8];

      id v6 = @"media.time.remaining";
      char v4 = (void *)v5;
    }
    else
    {
      id v6 = @"media.time.elapsed";
    }
    double v7 = AXLocalizeDurationTime();
    id v8 = accessibilityLocalizedString(v6);
    double v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);

    [v2 setAccessibilityLabel:v9];
  }
}

- (void)setUpTimeLabelIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewControllerAccessibility;
  [(QLMediaItemViewControllerAccessibility *)&v3 setUpTimeLabelIfNeeded];
  [(QLMediaItemViewControllerAccessibility *)self _axSetUpScrubberView];
}

- (void)setTimeLabelNeedsUpdate
{
  v9.receiver = self;
  v9.super_class = (Class)QLMediaItemViewControllerAccessibility;
  [(QLMediaItemViewControllerAccessibility *)&v9 setTimeLabelNeedsUpdate];
  [(QLMediaItemViewControllerAccessibility *)self _axSetLabelForTimeLabel];
  objc_super v3 = [(QLMediaItemViewControllerAccessibility *)self safeValueForKey:@"timeLabelScrollView"];
  objc_opt_class();
  char v4 = [v3 _accessibilityViewAncestorIsKindOf:MEMORY[0x2455E48A0](@"QLVideoScrubberView")];
  uint64_t v5 = __UIAccessibilityCastAsSafeCategory();

  if ([v3 safeBoolForKey:@"isDragging"]
    && ([v5 safeBoolForKey:@"_axIsScrubbering"] & 1) == 0)
  {
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    double v7 = [(QLMediaItemViewControllerAccessibility *)self safeValueForKey:@"_timeLabel"];
    id v8 = [v7 accessibilityLabel];
    UIAccessibilityPostNotification(v6, v8);
  }
}

@end