@interface PHSingleCallParticipantLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetUpCallDetailsViewButton;
- (void)setUpCallDetailsViewButton;
@end

@implementation PHSingleCallParticipantLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSingleCallParticipantLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHSingleCallParticipantLabelView" hasInstanceVariable:@"_statusLabel" withType:"UILabel"];
  [v3 validateClass:@"PHSingleCallParticipantLabelView" hasProperty:@"callDetailsViewButton" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSingleCallParticipantLabelView", @"setUpCallDetailsViewButton", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)PHSingleCallParticipantLabelViewAccessibility;
  [(PHSingleCallParticipantLabelViewAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PHSingleCallParticipantLabelViewAccessibility *)self safeValueForKey:@"_statusLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CF68] | v4;

  v6 = [(PHSingleCallParticipantLabelViewAccessibility *)self safeValueForKey:@"_statusLabel"];
  [v6 setAccessibilityTraits:v5];

  LOBYTE(location) = 0;
  objc_opt_class();
  v7 = [(PHSingleCallParticipantLabelViewAccessibility *)self safeValueForKey:@"_statusLabel"];
  v8 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v8);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __91__PHSingleCallParticipantLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12 = &unk_26512A0B0;
  objc_copyWeak(&v13, &location);
  [v8 _setAccessibilityLabelBlock:&v9];
  [(PHSingleCallParticipantLabelViewAccessibility *)self _axSetUpCallDetailsViewButton];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __91__PHSingleCallParticipantLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained text];

  id v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"((\\d{1,2}:)?\\d{2}:\\d{2})" options:1 error:0];
  uint64_t v4 = objc_msgSend(v3, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
  if ([v4 count] == 1)
  {
    id v5 = [MEMORY[0x263F21660] axAttributedStringWithString:v2];
    v6 = [v4 firstObject];
    [v6 range];
    unint64_t v8 = v7;

    if (v8 > 5)
    {
      uint64_t v17 = *MEMORY[0x263F21738];
      uint64_t v18 = MEMORY[0x263EFFA88];
      uint64_t v9 = NSDictionary;
      uint64_t v10 = &v18;
      v11 = &v17;
    }
    else
    {
      uint64_t v19 = *MEMORY[0x263F21740];
      v20[0] = MEMORY[0x263EFFA88];
      uint64_t v9 = NSDictionary;
      uint64_t v10 = v20;
      v11 = &v19;
    }
    v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
    id v13 = [v4 firstObject];
    uint64_t v14 = [v13 range];
    objc_msgSend(v5, "setAttributes:withRange:", v12, v14, v15);
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (void)setUpCallDetailsViewButton
{
  v3.receiver = self;
  v3.super_class = (Class)PHSingleCallParticipantLabelViewAccessibility;
  [(PHSingleCallParticipantLabelViewAccessibility *)&v3 setUpCallDetailsViewButton];
  [(PHSingleCallParticipantLabelViewAccessibility *)self _axSetUpCallDetailsViewButton];
}

- (void)_axSetUpCallDetailsViewButton
{
  id v2 = [(PHSingleCallParticipantLabelViewAccessibility *)self safeUIViewForKey:@"callDetailsViewButton"];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end