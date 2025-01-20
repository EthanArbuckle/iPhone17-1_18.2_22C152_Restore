@interface CKTranscriptLabelCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsNotFirstElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
@end

@implementation CKTranscriptLabelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptLabelCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptLabelCell", @"label", "@", 0);
  [v3 validateClass:@"CKTranscriptLabelCell" isKindOfClass:@"CKTranscriptCell"];
  [v3 validateClass:@"CKTranscriptCell" isKindOfClass:@"CKEditableCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEditableCollectionViewCell", @"orientation", "c", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptLabelCellAccessibility;
  [(CKTranscriptLabelCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKTranscriptLabelCellAccessibility *)self safeValueForKey:@"label"];
  id v4 = objc_alloc(MEMORY[0x263F1C3B8]);
  v5 = accessibilityLocalizedString(@"drop.into.compose");
  v6 = (void *)[v4 initWithName:v5 view:self];
  v12[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v3 setAccessibilityDropPointDescriptors:v7];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8]];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__CKTranscriptLabelCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_265113610;
  objc_copyWeak(&v9, &location);
  [v3 _setAccessibilityHeadingLevelBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __80__CKTranscriptLabelCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained safeIntegerForKey:@"orientation"];
  if (v2 > 2u) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_265113630[(char)v2];
  }

  return v3;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptLabelCellAccessibility;
  [(CKTranscriptLabelCellAccessibility *)&v3 didMoveToWindow];
  [(CKTranscriptLabelCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

@end