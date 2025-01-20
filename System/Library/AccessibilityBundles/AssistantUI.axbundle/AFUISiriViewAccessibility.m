@interface AFUISiriViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFuzzyHitTestElements;
- (id)accessibilityElements;
- (id)automationElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_animateButtonsHidden:(BOOL)a3;
- (void)_axUpdateReportBug;
- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3;
- (void)layoutSubviews;
@end

@implementation AFUISiriViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_reportBugButton" withType:"SiriUIContentButton"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_siriStatusView" withType:"UIView<SiriUISiriStatusViewProtocol>"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_helpButton" withType:"SiriUIHelpButton"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_audioRoutePickerButton" withType:"SiriUIAudioRoutePickerButton"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_lockContainerView" withType:"AFUIPasscodeContainerView"];
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_lockViewHidden" withType:"BOOL"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriView", @"configureReportBugButtonToShowHoldToTalkState:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriView", @"remoteContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriView", @"_animateButtonsHidden:", "v", "B", 0);
}

- (id)automationElements
{
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewAccessibility;
  id v3 = [(AFUISiriViewAccessibility *)&v7 automationElements];
  v4 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"remoteContentView"];
  if (v4 && ([v3 containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = [v3 arrayByAddingObject:v4];

    id v3 = (void *)v5;
  }

  return v3;
}

- (id)accessibilityElements
{
  v13[1] = *MEMORY[0x263EF8340];
  if (([(AFUISiriViewAccessibility *)self safeBoolForKey:@"_lockViewHidden"] & 1) != 0
    || ([(AFUISiriViewAccessibility *)self safeValueForKey:@"_lockContainerView"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    int v6 = AFPreferencesTypeToSiriEnabled();
    objc_super v7 = (void *)MEMORY[0x263EFF8C0];
    v4 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"remoteContentView"];
    if (v6)
    {
      v8 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_audioRoutePickerButton"];
      uint64_t v5 = objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v8);
    }
    else
    {
      v8 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_helpButton"];
      v9 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_siriStatusView"];
      v10 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_reportBugButton"];
      v11 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_audioRoutePickerButton"];
      uint64_t v5 = objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v8, v9, v10, v11);
    }
  }
  else
  {
    v4 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_lockContainerView"];
    v13[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  return v5;
}

- (id)_accessibilityFuzzyHitTestElements
{
  v2 = [(AFUISiriViewAccessibility *)self accessibilityElements];
  id v3 = [v2 reverseObjectEnumerator];
  v4 = [v3 allObjects];

  return v4;
}

- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriViewAccessibility;
  [(AFUISiriViewAccessibility *)&v4 configureReportBugButtonToShowHoldToTalkState:a3];
  [(AFUISiriViewAccessibility *)self _axUpdateReportBug];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  [(AFUISiriViewAccessibility *)&v3 layoutSubviews];
  [(AFUISiriViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axUpdateReportBug
{
  objc_super v3 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_reportBugButton"];
  [v3 setIsAccessibilityElement:1];

  id v5 = [(AFUISiriViewAccessibility *)self safeValueForKey:@"_reportBugButton"];
  objc_super v4 = AssistantUIAccessibilityLocalizedString(@"assistant.reportbug.label");
  [v5 setAccessibilityLabel:v4];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  [(AFUISiriViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(AFUISiriViewAccessibility *)self _axUpdateReportBug];
}

- (void)_animateButtonsHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewAccessibility;
  [(AFUISiriViewAccessibility *)&v3 _animateButtonsHidden:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
}

@end