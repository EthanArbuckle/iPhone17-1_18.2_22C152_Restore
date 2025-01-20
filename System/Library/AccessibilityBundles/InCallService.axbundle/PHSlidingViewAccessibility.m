@interface PHSlidingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createFindMyUI;
- (void)interactiveStartWithCountdownModel:(id)a3;
- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4;
- (void)setSlidingViewState:(unint64_t)a3;
- (void)showSlidingViewModel:(id)a3 animatedSliderCompletion:(id)a4 medicalIDSliderCompletion:(id)a5 shouldMaxVolumeCompletion:(id)a6;
@end

@implementation PHSlidingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSlidingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"animatedSlidingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"findMyButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"createFindMyUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"medicalIDSlidingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"showSlidingViewModel:animatedSliderCompletion:medicalIDSliderCompletion:shouldMaxVolumeCompletion:", "v", "@", "@?", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"repeatingUpdateAnimatedSliderForCountdownNumber:forModel:", "v", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"setSlidingViewState:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingView", @"interactiveStartWithCountdownModel:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSNotifyCountdownViewModel", @"playsSound", "B", 0);
}

- (void)createFindMyUI
{
  v3.receiver = self;
  v3.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v3 createFindMyUI];
  [(PHSlidingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = [(PHSlidingViewAccessibility *)self safeUIViewForKey:@"findMyButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__PHSlidingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_26512A0B0;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __72__PHSlidingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained attributedTitleForState:0];
  objc_super v3 = [v2 string];

  return v3;
}

- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v6 repeatingUpdateAnimatedSliderForCountdownNumber:a3 forModel:a4];
  if (a3 <= 4)
  {
    v5 = AXFormatInteger();
    UIAccessibilitySpeak();
  }
}

- (void)setSlidingViewState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(PHSlidingViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
  [v5 alpha];
  double v7 = v6;

  v15.receiver = self;
  v15.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v15 setSlidingViewState:a3];
  objc_super v8 = [(PHSlidingViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
  [v8 alpha];
  double v10 = v9;

  if (v10 > 0.0 && v7 == 0.0)
  {
    UIAccessibilityNotifications v11 = *MEMORY[0x263F1CE18];
    v12 = [(PHSlidingViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
    UIAccessibilityPostNotification(v11, v12);
  }
  if (a3 != 1)
  {
    v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl(&dword_2421F2000, v13, OS_LOG_TYPE_DEFAULT, "Resetting VO quiet state: %@", buf, 0xCu);
    }
    [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
  }
}

- (void)interactiveStartWithCountdownModel:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning() && ([v4 safeBoolForKey:@"playsSound"] & 1) == 0)
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2421F2000, v5, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we're in quiet mode", buf, 2u);
    }

    [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:MEMORY[0x263EFFA88]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], &stru_26F6D4890);
  }
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v6 interactiveStartWithCountdownModel:v4];
}

- (void)showSlidingViewModel:(id)a3 animatedSliderCompletion:(id)a4 medicalIDSliderCompletion:(id)a5 shouldMaxVolumeCompletion:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PHSlidingViewAccessibility;
  [(PHSlidingViewAccessibility *)&v8 showSlidingViewModel:a3 animatedSliderCompletion:a4 medicalIDSliderCompletion:a5 shouldMaxVolumeCompletion:a6];
  double v7 = [(PHSlidingViewAccessibility *)self safeValueForKey:@"animatedSlidingButton"];
  if (!v7)
  {
    double v7 = [(PHSlidingViewAccessibility *)self safeValueForKey:@"medicalIDSlidingButton"];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v7);
}

@end