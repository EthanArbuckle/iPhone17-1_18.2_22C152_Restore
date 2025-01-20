@interface MRUMediaControlsModuleMoreButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MRUMediaControlsModuleMoreButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUMediaControlsModuleMoreButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMediaControlsModuleMoreButton", @"title", "@", 0);
  [v3 validateClass:@"MRUMediaControlsModuleMoreButton" hasInstanceVariable:@"_badge" withType:"MRUMediaControlsModuleBadge"];
  [v3 validateClass:@"MRUMediaControlsModuleBadge" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"MRUMediaControlsModuleView"];
}

- (id)accessibilityLabel
{
  id v3 = [(MRUMediaControlsModuleMoreButtonAccessibility *)self safeValueForKeyPath:@"_badge._label.text"];
  v4 = [(MRUMediaControlsModuleMoreButtonAccessibility *)self safeStringForKey:@"title"];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v6.receiver = self;
  v6.super_class = (Class)MRUMediaControlsModuleMoreButtonAccessibility;
  BOOL v3 = [(MRUMediaControlsModuleMoreButtonAccessibility *)&v6 accessibilityActivate];
  v4 = [(MRUMediaControlsModuleMoreButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);

  return v3;
}

uint64_t __70__MRUMediaControlsModuleMoreButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mrumediacontro_2.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end