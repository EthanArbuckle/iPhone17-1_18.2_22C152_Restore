@interface ETColorPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (ETColorPickerViewAccessibility)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetCenterCircleHint;
- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutPaletteCircles;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
- (void)showColorWheel;
@end

@implementation ETColorPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETColorPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETColorPickerView"];
  [v3 validateClass:@"ETColorPickerView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"showColorWheel", "v", 0);
  [v3 validateClass:@"ETColorPickerView" hasInstanceVariable:@"_paletteCircles" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"layoutPaletteCircles", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"initWithFrame: collapsedFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"_dismissAnimated: completion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"dismissAnimated: completion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorPickerView", @"presentAnimated: completion:", "v", "B", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ETColorPickerViewAccessibility;
  [(ETColorPickerViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ETColorPickerViewAccessibility *)self _accessibilitySetCenterCircleHint];
}

- (BOOL)isAccessibilityElement
{
  return [(ETColorPickerViewAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  objc_super v3 = [(ETColorPickerViewAccessibility *)self safeValueForKey:@"_selectedCircle"];
  v4 = [v3 safeValueForKey:@"backgroundColor"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = accessibilityLocalizedString(@"people.color.picker");
  v9 = [v5 axColorStringForSpeaking];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  int v3 = [(ETColorPickerViewAccessibility *)self safeBoolForKey:@"isExpanded"];
  if (v3) {
    [(ETColorPickerViewAccessibility *)self dismissAnimated:1 completion:0];
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  if ([(ETColorPickerViewAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    v15.receiver = self;
    v15.super_class = (Class)ETColorPickerViewAccessibility;
    [(ETColorPickerViewAccessibility *)&v15 accessibilityFrame];
    double v7 = v6;
  }
  else
  {
    objc_opt_class();
    v8 = [(ETColorPickerViewAccessibility *)self safeValueForKey:@"superview"];
    v9 = __UIAccessibilityCastAsClass();

    [v9 bounds];
    double v7 = v10;

    objc_opt_class();
    v11 = __UIAccessibilityCastAsClass();
    [v11 bounds];
    double v13 = v12;

    double v3 = v7 * 0.5;
    double v5 = v13 + v13;
    double v4 = 0.0;
  }
  double v14 = v7;
  result.size.height = v5;
  result.size.width = v14;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (ETColorPickerViewAccessibility)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ETColorPickerViewAccessibility;
  double v4 = -[ETColorPickerViewAccessibility initWithFrame:collapsedFrame:](&v6, sel_initWithFrame_collapsedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  [(ETColorPickerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ETColorPickerViewAccessibility_presentAnimated_completion___block_invoke;
  v10[3] = &unk_26511CCA0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = (void *)MEMORY[0x24564AE80](v10);
  v9.receiver = self;
  v9.super_class = (Class)ETColorPickerViewAccessibility;
  [(ETColorPickerViewAccessibility *)&v9 presentAnimated:v4 completion:v8];
}

void __61__ETColorPickerViewAccessibility_presentAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v3, 0);
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__ETColorPickerViewAccessibility__dismissAnimated_completion___block_invoke;
  v10[3] = &unk_26511CCA0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = (void *)MEMORY[0x24564AE80](v10);
  v9.receiver = self;
  v9.super_class = (Class)ETColorPickerViewAccessibility;
  [(ETColorPickerViewAccessibility *)&v9 _dismissAnimated:v4 completion:v8];
}

void __62__ETColorPickerViewAccessibility__dismissAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v3, 0);
}

- (void)showColorWheel
{
  v2.receiver = self;
  v2.super_class = (Class)ETColorPickerViewAccessibility;
  [(ETColorPickerViewAccessibility *)&v2 showColorWheel];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)layoutPaletteCircles
{
  v3.receiver = self;
  v3.super_class = (Class)ETColorPickerViewAccessibility;
  [(ETColorPickerViewAccessibility *)&v3 layoutPaletteCircles];
  [(ETColorPickerViewAccessibility *)self _accessibilitySetCenterCircleHint];
}

- (void)_accessibilitySetCenterCircleHint
{
  objc_opt_class();
  objc_super v3 = [(ETColorPickerViewAccessibility *)self safeValueForKey:@"_paletteCircles"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  double v5 = [v4 lastObject];
  id v6 = accessibilityLocalizedString(@"non.adjustable.color.circle.hint");
  [v5 setAccessibilityHint:v6];
}

@end