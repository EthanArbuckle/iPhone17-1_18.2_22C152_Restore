@interface BTSFitTestControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)focusHeader;
- (void)focusPlayButton;
- (void)inEarStatusChanged:(id)a3;
- (void)sealValueChanged:(id)a3;
- (void)startFitTest;
- (void)updateFocus;
- (void)viewWillAppear;
@end

@implementation BTSFitTestControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BTSFitTestController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSFitTestController", @"startFitTest", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSFitTestController", @"inEarStatusChanged:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSFitTestController", @"sealValueChanged:", "v", "@", 0);
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_playButton" withType:"OBTrayButton"];
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_testActive" withType:"B"];
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_budsInEar" withType:"B"];
  [v3 validateClass:@"OBTrayButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"headerLabel", "@", 0);
  [v3 validateClass:@"OBTemplateLabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_leftBudResultLabel" withType:"UILabel"];
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_rightBudResultLabel" withType:"UILabel"];
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"_fitTestController" withType:"OBWelcomeController"];
  [v3 validateClass:@"OBWelcomeController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"contentView", "@", 0);
  [v3 validateClass:@"BTSFitTestController" hasInstanceVariable:@"currentDevice" withType:"BluetoothDevice"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v24.receiver = self;
  v24.super_class = (Class)BTSFitTestControllerAccessibility;
  [(BTSFitTestControllerAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  objc_opt_class();
  id v3 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_playButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_leftBudResultLabel"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_rightBudResultLabel"];
  v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_fitTestController"];
  v10 = __UIAccessibilityCastAsClass();

  char v22 = 0;
  objc_opt_class();
  v11 = [v10 safeValueForKey:@"contentView"];
  v12 = __UIAccessibilityCastAsClass();

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v20[3] = &unk_265124120;
  objc_copyWeak(&v21, &location);
  [v4 _setAccessibilityTraitsBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v18[3] = &unk_265124148;
  objc_copyWeak(&v19, &location);
  [v4 _setAccessibilityLabelBlock:v18];
  [v12 setIsAccessibilityElement:1];
  [v12 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
  [v12 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F6B2EF8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_352;
  v15[3] = &unk_265124170;
  v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  [v12 _setAccessibilityLabelBlock:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

uint64_t __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeBoolForKey:@"_budsInEar"];

  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v1;
}

id __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained safeValueForKey:@"_playButton"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 titleLabel];
  v7 = [v6 text];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [v5 titleLabel];
    uint64_t v10 = [v9 text];
  }
  else
  {
    v9 = accessibilityLocalizedStringForB298(@"fit.test.button.play");
    id v11 = objc_loadWeakRetained(v2);
    int v12 = [v11 safeBoolForKey:@"_testActive"];

    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v10 = accessibilityLocalizedStringForB298(@"fit.test.button.in.progress");
  }
  id v13 = (void *)v10;

  v9 = v13;
LABEL_6:

  return v9;
}

id __79__BTSFitTestControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_352(id *a1)
{
  objc_opt_class();
  v2 = [a1[4] safeValueForKey:@"currentDevice"];
  int v3 = __UIAccessibilityCastAsClass();

  LODWORD(v2) = [v3 productId];
  if (v2 == 8210)
  {
    uint64_t v4 = accessibilityLocalizedStringForB298(@"Beats494");
  }
  else
  {
    v5 = accessibilityLocalizedStringForB298(@"left.airpod");
    v6 = accessibilityLocalizedStringForB298(@"right.airpod");
    v7 = [a1[5] accessibilityLabel];
    v9 = [a1[6] accessibilityLabel];
    uint64_t v4 = __UIAXStringForVariables();
  }

  return v4;
}

- (void)updateFocus
{
  char v3 = [(BTSFitTestControllerAccessibility *)self safeBoolForKey:@"_testActive"];
  if (![(BTSFitTestControllerAccessibility *)self safeBoolForKey:@"_budsInEar"]
    || (v3 & 1) != 0)
  {
    [(BTSFitTestControllerAccessibility *)self focusHeader];
  }
  else
  {
    [(BTSFitTestControllerAccessibility *)self focusPlayButton];
  }
}

- (void)focusPlayButton
{
  objc_opt_class();
  char v3 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_playButton"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v4);
}

- (void)focusHeader
{
  v2 = [(BTSFitTestControllerAccessibility *)self safeValueForKey:@"_fitTestController"];
  char v3 = [v2 safeValueForKey:@"headerView"];
  objc_opt_class();
  uint64_t v4 = [v3 safeValueForKey:@"headerLabel"];
  v5 = __UIAccessibilityCastAsClass();

  if ([v5 accessibilityElementIsFocused])
  {
    v6 = [v5 text];
    UIAccessibilitySpeak();
  }
  else
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v5);
  }
}

- (void)viewWillAppear
{
  v3.receiver = self;
  v3.super_class = (Class)BTSFitTestControllerAccessibility;
  [(BTSFitTestControllerAccessibility *)&v3 viewWillAppear];
  [(BTSFitTestControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)startFitTest
{
  v3.receiver = self;
  v3.super_class = (Class)BTSFitTestControllerAccessibility;
  [(BTSFitTestControllerAccessibility *)&v3 startFitTest];
  [(BTSFitTestControllerAccessibility *)self updateFocus];
}

- (void)inEarStatusChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BTSFitTestControllerAccessibility;
  [(BTSFitTestControllerAccessibility *)&v4 inEarStatusChanged:a3];
  [(BTSFitTestControllerAccessibility *)self updateFocus];
}

- (void)sealValueChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BTSFitTestControllerAccessibility;
  [(BTSFitTestControllerAccessibility *)&v4 sealValueChanged:a3];
  [(BTSFitTestControllerAccessibility *)self focusHeader];
}

@end