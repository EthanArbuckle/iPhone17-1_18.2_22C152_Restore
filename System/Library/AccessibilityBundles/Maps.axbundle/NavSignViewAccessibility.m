@interface NavSignViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation NavSignViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavSignView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignView", @"majorLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignView", @"minorLabel", "@", 0);
  [v3 validateClass:@"NavSignLabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignView", @"isManeuverSign", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignView", @"maneuverSign", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceManeuverArtwork", @"maneuver", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavManeuverSignView", @"maneuverGuidanceInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverGuidanceInfo", @"shieldInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverGuidanceInfo", @"maneuverArtwork", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignShieldInfo", @"shieldText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverGuidanceInfo", @"minorText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKServerFormattedString", @"geoServerString", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(NavSignViewAccessibility *)self safeValueForKey:@"majorLabel"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    v5 = [v4 accessibilityLabel];
  }
  else
  {
    v5 = &stru_26F6E7138;
  }
  LOBYTE(v25) = 0;
  objc_opt_class();
  v6 = [(NavSignViewAccessibility *)self safeValueForKey:@"minorLabel"];
  v7 = __UIAccessibilityCastAsClass();

  if ([v7 _accessibilityViewIsVisible])
  {
    v22 = [v7 accessibilityLabel];
    v23 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __UIAXStringForVariables();

    v5 = (__CFString *)v8;
  }
  if (![(NavSignViewAccessibility *)self safeBoolForKey:@"isManeuverSign", v22, v23])
  {
    v14 = &stru_26F6E7138;
    goto LABEL_16;
  }
  v9 = [(NavSignViewAccessibility *)self safeValueForKey:@"maneuverSign"];
  v10 = [(NavSignViewAccessibility *)self safeValueForKey:@"maneuverGuidanceInfo"];
  v11 = v10;
  if (v9)
  {
    v12 = [v10 safeValueForKey:@"maneuverArtwork"];
    int v13 = [v12 safeIntForKey:@"maneuver"];

    AXMapsStringForManeuverType(v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v11) {
      goto LABEL_15;
    }
LABEL_12:
    v15 = [v11 safeValueForKey:@"shieldInfo"];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 safeStringForKey:@"shieldText"];
      v18 = __UIAXStringForVariables();

      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__1;
      v29 = __Block_byref_object_dispose__1;
      id v30 = 0;
      id v24 = v11;
      AXPerformSafeBlock();
      id v19 = (id)v26[5];

      _Block_object_dispose(&v25, 8);
      __UIAXStringForVariables();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  v14 = &stru_26F6E7138;
  if (v10) {
    goto LABEL_12;
  }
LABEL_15:

LABEL_16:
  v20 = __UIAXStringForVariables();

  return v20;
}

void __46__NavSignViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v7 = [*(id *)(a1 + 32) safeValueForKey:@"minorText"];
  id v3 = [v7 safeValueForKey:@"geoServerString"];
  uint64_t v4 = objc_msgSend(v2, "_navigation_stringForServerFormattedString:", v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end