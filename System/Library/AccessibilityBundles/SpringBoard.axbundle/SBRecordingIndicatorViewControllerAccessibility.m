@interface SBRecordingIndicatorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBRecordingIndicatorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRecordingIndicatorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRecordingIndicatorViewController", @"indicatorView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRecordingIndicatorViewController", @"initForLocation:windowScene:", "@", "Q", "@", 0);
}

- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorViewControllerAccessibility;
  id v4 = [(SBRecordingIndicatorViewControllerAccessibility *)&v6 initForLocation:a3 windowScene:a4];
  [v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBRecordingIndicatorViewControllerAccessibility;
  [(SBRecordingIndicatorViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBRecordingIndicatorViewControllerAccessibility *)self safeUIViewForKey:@"indicatorView"];
  [v3 _accessibilitySetOverridesInvisibility:1];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F813F0]];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_16];
}

id __93__SBRecordingIndicatorViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"sensorActivityDataProvider"];
  v1 = [v0 safeSetForKey:@"activeSensorActivityAttributions"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v1;
  id v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3)
  {

    goto LABEL_21;
  }
  LOBYTE(v4) = 0;
  LOBYTE(v5) = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      if (v4)
      {
        BOOL v4 = 1;
        if (!v5) {
          goto LABEL_8;
        }
      }
      else
      {
        BOOL v4 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "safeIntegerForKey:", @"sensor", (void)v11) == 0;
        if (!v5)
        {
LABEL_8:
          BOOL v5 = objc_msgSend(v8, "safeIntegerForKey:", @"sensor", (void)v11) == 1;
          continue;
        }
      }
      BOOL v5 = 1;
    }
    id v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v3);

  if (v4 && v5)
  {
    v9 = @"camera.mic.in.use";
    goto LABEL_20;
  }
  if (v4)
  {
    v9 = @"camera.in.use";
    goto LABEL_20;
  }
  if (v5)
  {
    v9 = @"mic.in.use";
LABEL_20:
    id v3 = accessibilityLocalizedString(v9);
  }
  else
  {
    id v3 = 0;
  }
LABEL_21:

  return v3;
}

@end