@interface PHVideoCallInterfaceOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (BOOL)accessibilityViewIsModal;
@end

@implementation PHVideoCallInterfaceOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVideoCallInterfaceOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHCallParticipantsView"];
  [v3 validateClass:@"PHVideoCallInterfaceOverlayView" isKindOfClass:@"UIView"];
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [(PHVideoCallInterfaceOverlayViewAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Phcallparticip.isa)];
  char v3 = [v2 accessibilityViewIsModal];

  return v3;
}

@end