@interface SBSystemActionSimpleAccessibilityPreviewElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBSystemActionSimpleAccessibilityPreviewElementAccessibility)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5;
@end

@implementation SBSystemActionSimpleAccessibilityPreviewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemActionSimpleAccessibilityPreviewElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFocusEnablementIndicatorSystemApertureActivityElement", @"initWithActivityDescription:enabled:", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemAction", @"configuredAction", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFConfiguredSystemIntentAction", @"intent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFConfiguredStaccatoIntentAction", @"templateParameterValues", "@", 0);
}

- (SBSystemActionSimpleAccessibilityPreviewElementAccessibility)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElementAccessibility;
  v11 = [(SBSystemActionSimpleAccessibilityPreviewElementAccessibility *)&v29 initWithSystemAction:v8 contentProvider:v9 keyColor:v10];
  v12 = [v8 safeValueForKey:@"configuredAction"];
  v13 = __UIAccessibilitySafeClass();

  v14 = [v13 name];
  v15 = [v13 safeDictionaryForKey:@"templateParameterValues"];
  v16 = [v15 objectForKey:*MEMORY[0x263F22398]];
  v17 = [v16 safeValueForKey:@"identifier"];
  uint64_t v18 = [v17 intValue];

  uint64_t v19 = [MEMORY[0x263F229B8] stateForTripleClickOption:v18];
  if (v19 == 2)
  {
    id v28 = v10;
    id v20 = v9;
    v21 = v11;
    UIAccessibilityNotifications v22 = *MEMORY[0x263F1CDC8];
    v23 = NSString;
    v24 = @"ax.shortcut.on";
    goto LABEL_5;
  }
  if (v19 == 1)
  {
    id v28 = v10;
    id v20 = v9;
    v21 = v11;
    UIAccessibilityNotifications v22 = *MEMORY[0x263F1CDC8];
    v23 = NSString;
    v24 = @"ax.shortcut.off";
LABEL_5:
    v25 = accessibilityLocalizedString(v24);
    v26 = objc_msgSend(v23, "stringWithFormat:", v25, v14);
    UIAccessibilityPostNotification(v22, v26);

    v11 = v21;
    id v9 = v20;
    id v10 = v28;
  }

  return v11;
}

@end