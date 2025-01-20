@interface TVRUIRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axSiriHintEnabled;
- (BOOL)_axVolumeHintEnabled;
- (id)_axButtonHintText;
- (id)_axHintsViewController;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)clearMessageContent;
- (void)showLoadingSpinner;
- (void)showSearchingSpinner;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRUIRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"devicePickerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"touchpadViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"activeDevice", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"messageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRMessageView", @"currentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"showLoadingSpinner", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"showSearchingSpinner", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"clearMessageContent", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"tapToRadarButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIRemoteViewController", @"messageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUITouchpadViewController", @"touchpadView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"titleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"titleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"isDevicePickerShowing", "B", 0);
  [v3 validateClass:@"TVRUITouchpadViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIHintsViewController", @"allowSiriHint", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIHintsViewController", @"allowVolumeHint", "B", 0);
  if (NSClassFromString(&cfstr_Tvremoteviewco.isa)) {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRemoteViewController", @"hintsViewController", "@", 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v23.receiver = self;
  v23.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  [(TVRUIRemoteViewControllerAccessibility *)&v23 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"devicePickerViewController"];
  v4 = [v3 safeUIViewForKey:@"titleView"];

  v5 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"touchpadViewController"];
  v6 = [v5 safeUIViewForKey:@"touchpadView"];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_26515E940;
  objc_copyWeak(&v19, &from);
  id v7 = v4;
  id v18 = v7;
  objc_copyWeak(&v20, &location);
  [v6 _setAccessibilityFrameBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v15[3] = &unk_26515E918;
  objc_copyWeak(&v16, &location);
  [v6 _setIsAccessibilityElementBlock:v15];
  v8 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"tapToRadarButton"];
  [v8 setAccessibilityLabel:@"Tap to Radar"];

  v9 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKeyPath:@"devicePickerViewController.titleButton"];
  v10 = [(TVRUIRemoteViewControllerAccessibility *)self _axButtonHintText];
  [v9 setAccessibilityHint:v10];

  v11 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"_messageView"];
  v12 = [v11 safeUIViewForKey:@"currentView"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v13[3] = &unk_26515E8F0;
  objc_copyWeak(&v14, &location);
  [v12 _setAccessibilityLabelBlock:v13];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

double __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained frame];
  [a1[4] frame];
  AX_CGRectBySubtractingRect();
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = objc_loadWeakRetained(a1 + 6);
  v12 = [v11 safeValueForKey:@"touchpadViewController"];
  v13 = [v12 safeUIViewForKey:@"view"];
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  *(void *)&double v14 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v16, v13);

  return v14;
}

uint64_t __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained safeValueForKey:@"devicePickerViewController"];
  if ([v3 safeBoolForKey:@"isDevicePickerShowing"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained(v1);
    CGFloat v6 = [v5 safeValueForKey:@"activeDevice"];
    if (v6)
    {
      id v7 = objc_loadWeakRetained(v1);
      CGFloat v8 = [v7 safeValueForKey:@"_messageView"];
      double v9 = [v8 safeValueForKey:@"currentView"];
      uint64_t v4 = [v9 _accessibilityViewIsVisible] ^ 1;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

id __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_messageView"];
  double v3 = [v2 safeUIViewForKey:@"currentView"];

  uint64_t v4 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
  id v5 = MEMORY[0x2456667F0]();

  return v5;
}

uint64_t __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uilabel.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 isAccessibilityElement]) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_axHintsViewController
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = [v2 parentViewController];
  uint64_t v4 = [v3 safeValueForKey:@"hintsViewController"];

  return v4;
}

- (BOOL)_axSiriHintEnabled
{
  id v2 = [(TVRUIRemoteViewControllerAccessibility *)self _axHintsViewController];
  char v3 = [v2 safeBoolForKey:@"allowSiriHint"];

  return v3;
}

- (BOOL)_axVolumeHintEnabled
{
  id v2 = [(TVRUIRemoteViewControllerAccessibility *)self _axHintsViewController];
  char v3 = [v2 safeBoolForKey:@"allowVolumeHint"];

  return v3;
}

- (id)_axButtonHintText
{
  char v3 = [MEMORY[0x263EFF980] array];
  if ([(TVRUIRemoteViewControllerAccessibility *)self _axSiriHintEnabled])
  {
    uint64_t v4 = accessibilityLocalizedString(@"tv.remote.hint.siri.text");
    [v3 addObject:v4];
  }
  if ([(TVRUIRemoteViewControllerAccessibility *)self _axVolumeHintEnabled])
  {
    id v5 = accessibilityLocalizedString(@"tv.remote.hint.volume.text");
    [v3 addObject:v5];
  }
  CGFloat v6 = MEMORY[0x2456667F0](v3);

  return v6;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  [(TVRUIRemoteViewControllerAccessibility *)&v3 viewWillLayoutSubviews];
  [(TVRUIRemoteViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)showLoadingSpinner
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  [(TVRUIRemoteViewControllerAccessibility *)&v5 showLoadingSpinner];
  objc_super v3 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"_messageView"];
  uint64_t v4 = [v3 safeUIViewForKey:@"currentView"];

  [v4 setIsAccessibilityElement:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
}

- (void)showSearchingSpinner
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  [(TVRUIRemoteViewControllerAccessibility *)&v5 showSearchingSpinner];
  objc_super v3 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"_messageView"];
  uint64_t v4 = [v3 safeUIViewForKey:@"currentView"];

  [v4 setIsAccessibilityElement:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
}

- (void)clearMessageContent
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  [(TVRUIRemoteViewControllerAccessibility *)&v5 clearMessageContent];
  objc_super v3 = [(TVRUIRemoteViewControllerAccessibility *)self safeValueForKey:@"_messageView"];
  uint64_t v4 = [v3 safeUIViewForKey:@"currentView"];

  [v4 setIsAccessibilityElement:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end