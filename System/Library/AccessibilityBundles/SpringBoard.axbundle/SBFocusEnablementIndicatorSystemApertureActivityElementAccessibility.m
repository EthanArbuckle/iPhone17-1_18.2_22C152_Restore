@interface SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility)initWithActivityDescription:(id)a3 enabled:(BOOL)a4;
@end

@implementation SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFocusEnablementIndicatorSystemApertureActivityElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFocusEnablementIndicatorSystemApertureActivityElement", @"initWithActivityDescription:enabled:", "@", "B", 0);
  [v3 validateProtocol:@"FCActivityDescribing" hasMethod:@"activityDisplayName" isInstanceMethod:1 isRequired:1];
}

- (SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility;
  id v5 = a3;
  v6 = [(SBFocusEnablementIndicatorSystemApertureActivityElementAccessibility *)&v12 initWithActivityDescription:v5 enabled:v4];
  v7 = [v5 safeStringForKey:@"activityDisplayName"];

  if (v4) {
    v8 = @"focus.off";
  }
  else {
    v8 = @"focus.on";
  }
  v9 = accessibilityLocalizedString(v8);
  v10 = AXCFormattedString();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);

  return v6;
}

@end