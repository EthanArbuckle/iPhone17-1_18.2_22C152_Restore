@interface CKEntryViewButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityElementHelpForCatalyst;
- (id)_accessibilityHint;
- (id)_accessibilityLabel;
- (int64_t)_axButtonType;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKEntryViewButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKEntryViewButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEntryViewButton", @"entryViewButtonType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEntryViewButton", @"button", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)CKEntryViewButtonAccessibility;
  [(CKEntryViewButtonAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKEntryViewButtonAccessibility *)self safeUIViewForKey:@"button"];
  v4 = [(CKEntryViewButtonAccessibility *)self _accessibilityLabel];
  [v3 setAccessibilityLabel:v4];

  v5 = [(CKEntryViewButtonAccessibility *)self _accessibilityHint];
  [v3 setAccessibilityHint:v5];

  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CKEntryViewButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_265113350;
  objc_copyWeak(&v7, &location);
  [(CKEntryViewButtonAccessibility *)self setAccessibilityTraitsBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __76__CKEntryViewButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained accessibilityTraits];

  return v2;
}

- (id)_accessibilityLabel
{
  unint64_t v2 = [(CKEntryViewButtonAccessibility *)self _axButtonType];
  if (v2 > 8)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = accessibilityLocalizedString(off_265113370[v2]);
  }

  return v3;
}

- (id)_accessibilityHint
{
  unint64_t v2 = [(CKEntryViewButtonAccessibility *)self _axButtonType];
  if (v2 <= 5 && ((0x2Du >> v2) & 1) != 0)
  {
    id v3 = accessibilityLocalizedString(off_2651133B8[v2]);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_accessibilityElementHelpForCatalyst
{
  if ([(CKEntryViewButtonAccessibility *)self _axButtonType] == 5)
  {
    unint64_t v2 = accessibilityLocalizedString(@"audio.button.hint.macos");
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (int64_t)_axButtonType
{
  return [(CKEntryViewButtonAccessibility *)self safeIntegerForKey:@"entryViewButtonType"];
}

@end