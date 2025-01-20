@interface _SFPageFormatMenuControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_readerTextSizeAlertItem;
- (void)_didTapButtonInStepper:(id)a3;
@end

@implementation _SFPageFormatMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFPageFormatMenuController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFPageFormatMenuController", @"_readerTextSizeAlertItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFPageFormatMenuController", @"_didTapButtonInStepper:", "v", "@", 0);
  [v3 validateClass:@"_SFPageFormatMenuController" hasInstanceVariable:@"_viewController" withType:"UIViewController"];
  [v3 validateClass:@"SFBrowsingAssistant" hasProperty:@"stepperFocused" withType:"B"];
}

- (id)_readerTextSizeAlertItem
{
  v5.receiver = self;
  v5.super_class = (Class)_SFPageFormatMenuControllerAccessibility;
  v2 = [(_SFPageFormatMenuControllerAccessibility *)&v5 _readerTextSizeAlertItem];
  id v3 = accessibilitySafariServicesLocalizedString(@"page.zoom");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (void)_didTapButtonInStepper:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SFPageFormatMenuControllerAccessibility *)self safeValueForKeyPath:@"_viewController"];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __67___SFPageFormatMenuControllerAccessibility__didTapButtonInStepper___block_invoke;
  v11 = &unk_26514AAE0;
  id v6 = v5;
  id v12 = v6;
  AXPerformSafeBlock();
  if (!UIAccessibilityIsVoiceOverRunning()
    && (_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0
    && !UIAccessibilityIsSwitchControlRunning())
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFPageFormatMenuControllerAccessibility;
    [(_SFPageFormatMenuControllerAccessibility *)&v7 _didTapButtonInStepper:v4];
  }
}

@end