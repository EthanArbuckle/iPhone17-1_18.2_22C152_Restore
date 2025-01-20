@interface _SFNavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAutoReaderAction:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
- (_SFNavigationBarAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateCancelButton;
- (void)_axUpdateTextFields;
- (void)_axUpdateURLValue;
- (void)_compressedBarTapped;
- (void)_formatToggleButtonTapped:(id)a3;
- (void)_updateSecurityWarningsVisibility;
- (void)_updateShowsLockIcon;
- (void)_updateText;
- (void)fluidProgressViewDidShowProgress:(id)a3;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4;
@end

@implementation _SFNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFNavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFDimmingButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"_SFNavigationBar" isKindOfClass:@"UIView"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_reloadButton" withType:"_SFDimmingButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_stopButton" withType:"_SFDimmingButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_formatToggleButton" withType:"SFNavigationBarToggleButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_URLOutline" withType:"_SFNavigationBarURLButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_compressedBarButton" withType:"UIButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_cancelButton" withType:"UIButton"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_item" withType:"SFNavigationBarItem"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_securityAnnotationLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"isExpanded", "B", 0);
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_lockView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"delegate", "@", 0);
  [v3 validateProtocol:@"_SFNavigationBarDelegate" hasRequiredInstanceMethod:@"navigationBarReaderButtonWasTapped:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_updateText", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_updateShowsLockIcon", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFNavigationBarItem", @"showsLockIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_updateAvailabilityButtonVisibilityForType:animated: showAvailabilityText:adjustURLLabels:", "v", "q", "B", "B", "B", 0);
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_item" withType:"SFNavigationBarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFNavigationBarItem", @"showsReaderButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFNavigationBarItem", @"showsSecurityAnnotation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_formatToggleButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_compressedBarTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"setExpanded:textFieldSelectionRange:", "v", "B", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"fluidProgressViewDidShowProgress:", "v", "@", 0);
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_inputMode" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFNavigationBar", @"_updateSecurityWarningsVisibility", "v", 0);
  [v3 validateClass:@"_SFBrowserContentViewController" hasInstanceVariable:@"_showingReader" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFBrowserContentViewController", @"webViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFReaderEnabledWebViewController", @"readerController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFReaderController", @"isReaderAvailable", "B", 0);
  [v3 validateClass:@"SFNavigationBarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFNavigationBarItem", @"showsSecurityAnnotation", "B", 0);
  if (AXProcessIsSafari())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"isShowingReader", "B", 0);
    [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_tabController" withType:"TabController"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabDocument", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"readerContext", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"prepareToUseReader", "v", 0);
  }
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  if (AXDeviceIsPhoneIdiom()) {
    return 1000;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFNavigationBarAccessibility;
  return [(_SFNavigationBarAccessibility *)&v4 _accessibilitySortPriority];
}

- (void)_formatToggleButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v3 _formatToggleButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_updateSecurityWarningsVisibility
{
  v7.receiver = self;
  v7.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v7 _updateSecurityWarningsVisibility];
  [(_SFNavigationBarAccessibility *)self _axUpdateURLValue];
  objc_super v3 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_item"];
  if ([v3 safeBoolForKey:@"showsSecurityAnnotation"])
  {
    objc_super v4 = (void *)MEMORY[0x263F21660];
    v5 = accessibilitySafariServicesLocalizedString(@"website.not.secure");
    v6 = [v4 axAttributedStringWithString:v5];

    [v6 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);
  }
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v5 fluidProgressViewDidShowProgress:v4];
  if ([v4 _accessibilityBoolValueForKey:@"StartedFluidProgress"])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81458], &unk_26F7A1E20);
    [v4 _accessibilitySetBoolValue:0 forKey:@"StartedFluidProgress"];
  }
}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility setExpanded:textFieldSelectionRange:](&v5, sel_setExpanded_textFieldSelectionRange_, a3, a4.location, a4.length);
  [(_SFNavigationBarAccessibility *)self _axUpdateCancelButton];
  [(_SFNavigationBarAccessibility *)self _axUpdateTextFields];
}

- (BOOL)_accessibilityAutoReaderAction:(id)a3
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v24.receiver = self;
  v24.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_reloadButton"];
  id v4 = accessibilitySafariServicesLocalizedString(@"button.reload");
  [v3 setAccessibilityLabel:v4];

  objc_super v5 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_reloadButton"];
  [v5 setAccessibilityIdentifier:@"ReloadButton"];

  v6 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_stopButton"];
  objc_super v7 = accessibilitySafariServicesLocalizedString(@"button.stop");
  [v6 setAccessibilityLabel:v7];

  v8 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_stopButton"];
  [v8 setAccessibilityIdentifier:@"StopButton"];

  LOBYTE(location) = 0;
  objc_opt_class();
  v9 = [(_SFNavigationBarAccessibility *)self safeUIViewForKey:@"_formatToggleButton"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = accessibilitySafariServicesLocalizedString(@"format.options.button");
  [v10 setAccessibilityLabel:v11];

  [v10 _setAccessibilityIsNotFirstElement:1];
  v12 = accessibilitySafariServicesLocalizedString(@"format.options.button.hint");
  [v10 setAccessibilityHint:v12];

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75___SFNavigationBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v21[3] = &unk_26514ABA0;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  [v10 _setAccessibilityCustomActionsBlock:v21];
  v13 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLLabel"];
  [v13 setIsAccessibilityElement:0];

  v14 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
  [v14 setIsAccessibilityElement:1];

  v15 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
  v16 = accessibilitySafariServicesLocalizedString(@"address.text");
  [v15 setAccessibilityLabel:v16];

  v17 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
  [v17 setAccessibilityIdentifier:@"URL"];

  [(_SFNavigationBarAccessibility *)self _axUpdateURLValue];
  [(_SFNavigationBarAccessibility *)self _axUpdateCancelButton];
  [(_SFNavigationBarAccessibility *)self _axUpdateTextFields];
  if ([(_SFNavigationBarAccessibility *)self safeUnsignedIntegerForKey:@"_inputMode"] != 1)
  {
    if (AXDeviceIsPhoneIdiom())
    {
      v18 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_compressedBarButton"];

      v19 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
      if (v18) {
        accessibilitySafariServicesLocalizedString(@"addressbar.minimized.hint");
      }
      else {
      v20 = accessibilitySafariServicesLocalizedString(@"addressbar.hint");
      }
      [v19 setAccessibilityHint:v20];
    }
    else
    {
      v19 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
      v20 = accessibilitySafariServicesLocalizedString(@"addressbar.hint");
      [v19 setAccessibilityHint:v20];
    }
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_axUpdateCancelButton
{
  int v3 = [(_SFNavigationBarAccessibility *)self safeBoolForKey:@"isExpanded"];
  id v4 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_cancelButton"];
  [v4 setAccessibilityElementsHidden:v3 ^ 1u];
}

- (void)_axUpdateTextFields
{
  uint64_t v3 = [(_SFNavigationBarAccessibility *)self safeBoolForKey:@"isExpanded"];
  id v4 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
  [v4 setIsAccessibilityElement:v3 ^ 1];

  id v5 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_textField"];
  [v5 setIsAccessibilityElement:v3];
}

- (void)_axUpdateURLValue
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(_SFNavigationBarAccessibility *)self safeUIViewForKey:@"_URLOutline"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50___SFNavigationBarAccessibility__axUpdateURLValue__block_invoke;
  v4[3] = &unk_26514ABC8;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityValueBlock:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_opt_class();
  v8 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_reloadButton"];
  v9 = __UIAccessibilityCastAsClass();

  char v41 = 0;
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
  double v12 = v11;
  double v14 = v13;

  if (objc_msgSend(v9, "pointInside:withEvent:", v7, v12, v14)
    && [v9 _accessibilityViewIsVisible])
  {
    id v15 = v9;
    goto LABEL_22;
  }
  objc_opt_class();
  v16 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_stopButton"];
  v17 = __UIAccessibilityCastAsClass();

  char v41 = 0;
  objc_opt_class();
  v18 = __UIAccessibilityCastAsClass();
  objc_msgSend(v18, "convertPoint:toView:", v17, x, y);
  double v20 = v19;
  double v22 = v21;

  if (!objc_msgSend(v17, "pointInside:withEvent:", v7, v20, v22)
    || ![v17 _accessibilityViewIsVisible])
  {
    v23 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_textField"];
    char v41 = 0;
    objc_opt_class();
    objc_super v24 = __UIAccessibilityCastAsClass();
    objc_msgSend(v24, "convertPoint:toView:", v23, x, y);
    double v26 = v25;
    double v28 = v27;

    if (objc_msgSend(v23, "pointInside:withEvent:", v7, v26, v28))
    {
      v29 = objc_msgSend(v23, "_accessibilityHitTest:withEvent:", v7, v26, v28);
      id v30 = v29;
      if (v29 && [v29 isAccessibilityElement])
      {
        id v30 = v30;
        id v15 = v30;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      id v30 = 0;
    }
    v31 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_URLOutline"];
    char v41 = 0;
    objc_opt_class();
    v32 = __UIAccessibilityCastAsClass();
    objc_msgSend(v32, "convertPoint:toView:", v31, x, y);
    double v34 = v33;
    double v36 = v35;

    if (objc_msgSend(v31, "pointInside:withEvent:", v7, v34, v36))
    {
      v37 = objc_msgSend(v31, "_accessibilityHitTest:withEvent:", v7, v34, v36);

      if (v37)
      {
        if ([v37 isAccessibilityElement])
        {
          id v38 = v37;
          id v30 = v38;
LABEL_19:
          id v15 = v38;

          goto LABEL_20;
        }
        id v30 = v37;
      }
      else
      {
        id v30 = 0;
      }
    }
    v40.receiver = self;
    v40.super_class = (Class)_SFNavigationBarAccessibility;
    -[_SFNavigationBarAccessibility _accessibilityHitTest:withEvent:](&v40, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v15 = v17;
LABEL_21:

LABEL_22:

  return v15;
}

- (void)_updateText
{
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v3 _updateText];
  [(_SFNavigationBarAccessibility *)self _axUpdateURLValue];
}

- (void)_updateShowsLockIcon
{
  v8.receiver = self;
  v8.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v8 _updateShowsLockIcon];
  objc_super v3 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_lockView"];
  [v3 setIsAccessibilityElement:0];
  [v3 accessibilitySetIdentification:@"lockView"];
  id v4 = [(_SFNavigationBarAccessibility *)self safeValueForKey:@"_item"];
  int v5 = [v4 safeBoolForKey:@"showsLockIcon"];

  if (v5) {
    v6 = @"secure.validated.icon";
  }
  else {
    v6 = @"secure.icon";
  }
  id v7 = accessibilitySafariServicesLocalizedString(v6);
  [v3 setAccessibilityLabel:v7];

  [(_SFNavigationBarAccessibility *)self _axUpdateURLValue];
}

- (void)_compressedBarTapped
{
  v2.receiver = self;
  v2.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v2 _compressedBarTapped];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  [(_SFNavigationBarAccessibility *)&v3 layoutSubviews];
  [(_SFNavigationBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (_SFNavigationBarAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  objc_super v3 = -[_SFNavigationBarAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_SFNavigationBarAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end