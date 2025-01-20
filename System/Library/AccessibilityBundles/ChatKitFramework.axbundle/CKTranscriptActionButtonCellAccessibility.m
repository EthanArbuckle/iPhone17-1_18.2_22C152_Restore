@interface CKTranscriptActionButtonCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKTranscriptActionButtonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptActionButtonCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptActionButtonCellAccessibility;
  [(CKTranscriptActionButtonCellAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  v3 = [(CKTranscriptActionButtonCellAccessibility *)self safeUIViewForKey:@"cellView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, v4);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __87__CKTranscriptActionButtonCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_265112EF8;
  objc_copyWeak(&v10, &location);
  [v4 _setAccessibilityValueBlock:&v6];
  v5 = accessibilityLocalizedString(@"grid.view.button");
  objc_msgSend(v4, "setAccessibilityLabel:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __87__CKTranscriptActionButtonCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained titleLabel];
  v3 = [v2 text];

  return v3;
}

@end