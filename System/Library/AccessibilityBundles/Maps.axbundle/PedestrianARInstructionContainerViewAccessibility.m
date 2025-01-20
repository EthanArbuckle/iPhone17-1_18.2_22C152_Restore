@interface PedestrianARInstructionContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PedestrianARInstructionContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PedestrianARInstructionContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PedestrianARInstructionContainerView", @"topLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PedestrianARInstructionContainerView", @"bottomLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PedestrianARInstructionContainerViewAccessibility *)self safeUIViewForKey:@"topLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(PedestrianARInstructionContainerViewAccessibility *)self safeUIViewForKey:@"bottomLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __AXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARInstructionContainerViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(PedestrianARInstructionContainerViewAccessibility *)&v3 accessibilityTraits];
}

@end