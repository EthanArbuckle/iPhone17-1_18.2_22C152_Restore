@interface MTATimerPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation MTATimerPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPickerCell", @"picker", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPickerCell", @"timeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPickerCell", @"setState:animated:", "v", "Q", "B", 0);
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTATimerPickerCellAccessibility;
  [(MTATimerPickerCellAccessibility *)&v10 setState:a3 animated:a4];
  v6 = [(MTATimerPickerCellAccessibility *)self safeValueForKey:@"picker"];
  v7 = [(MTATimerPickerCellAccessibility *)self safeValueForKey:@"timeView"];
  if (a3 - 1 <= 2)
  {
    uint64_t v8 = ((_BYTE)a3 - 1) & 7;
    uint64_t v9 = (6u >> v8) & 1;
    [v6 setIsAccessibilityElement:v8 == 0];
    [v7 setIsAccessibilityElement:v9];
  }
  AXPerformSafeBlock();
}

uint64_t __53__MTATimerPickerCellAccessibility_setState_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityClearChildren];
}

@end