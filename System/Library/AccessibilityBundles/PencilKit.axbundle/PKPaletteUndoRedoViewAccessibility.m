@interface PKPaletteUndoRedoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKPaletteUndoRedoViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPaletteUndoRedoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteUndoRedoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteUndoRedoView", @"undoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteUndoRedoView", @"redoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteButton", @"button", "@", 0);
  [v3 validateClass:@"PKPaletteButton" isKindOfClass:@"UIControl"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteUndoRedoViewAccessibility;
  [(PKPaletteUndoRedoViewAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPaletteUndoRedoViewAccessibility *)self safeValueForKey:@"undoButton"];
  v4 = [v3 safeValueForKey:@"button"];

  [v4 setIsAccessibilityElement:1];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_265143010;
  objc_copyWeak(&v12, &location);
  [v4 _setAccessibilityTraitsBlock:v11];
  v5 = accessibilityPencilKitLocalizedString(@"palette.undo");
  [v4 setAccessibilityLabel:v5];

  v6 = [(PKPaletteUndoRedoViewAccessibility *)self safeValueForKey:@"redoButton"];
  v7 = [v6 safeValueForKey:@"button"];

  [v7 setIsAccessibilityElement:1];
  v8 = accessibilityPencilKitLocalizedString(@"palette.redo");
  [v7 setAccessibilityLabel:v8];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_265143010;
  objc_copyWeak(&v10, &location);
  [v7 _setAccessibilityTraitsBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"undoButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  int v6 = [v4 isEnabled];
  v7 = (void *)MEMORY[0x263F1CF18];
  if (!v6) {
    v7 = (void *)MEMORY[0x263F1CF20];
  }
  uint64_t v8 = *v7 | v5;

  return v8;
}

uint64_t __80__PKPaletteUndoRedoViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"redoButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  int v6 = [v4 isEnabled];
  v7 = (void *)MEMORY[0x263F1CF18];
  if (!v6) {
    v7 = (void *)MEMORY[0x263F1CF20];
  }
  uint64_t v8 = *v7 | v5;

  return v8;
}

- (PKPaletteUndoRedoViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteUndoRedoViewAccessibility;
  id v3 = -[PKPaletteUndoRedoViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKPaletteUndoRedoViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end