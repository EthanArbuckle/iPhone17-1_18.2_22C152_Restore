@interface ExpandableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ExpandableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ExpandableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.ExpandableTextView" hasSwiftField:@"moreTextLabel" withSwiftType:"GradientBackedLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.ExpandableTextView", @"handleTapGesture:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)ExpandableTextViewAccessibility;
  [(ExpandableTextViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(ExpandableTextViewAccessibility *)self safeSwiftValueForKey:@"moreTextLabel"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_26514EF18;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityActivateBlock:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

uint64_t __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __77__ExpandableTextViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleTapGesture:0];
}

@end