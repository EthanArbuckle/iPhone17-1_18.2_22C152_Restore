@interface SFScribbleSelectionOverlayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFScribbleSelectionOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFScribbleSelectionOverlay";
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
  v4.receiver = self;
  v4.super_class = (Class)SFScribbleSelectionOverlayAccessibility;
  [(SFScribbleSelectionOverlayAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SFScribbleSelectionOverlayAccessibility *)self safeValueForKey:@"hideButton"];
  [v3 setAccessibilityElementsHiddenBlock:&__block_literal_global_5];
}

@end