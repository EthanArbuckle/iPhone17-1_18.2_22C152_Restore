@interface SBRootSceneWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBRootSceneWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRootSceneWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBRootSceneWindow" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  [v3 validateClass:@"SBIconController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootSceneWindowAccessibility;
  [(SBRootSceneWindowAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBRootSceneWindowAccessibility *)self safeArrayForKey:@"subviews"];
  v4 = [v3 firstObject];
  [v4 _setAccessibilityElementsHiddenBlock:&__block_literal_global_9];
}

uint64_t __76__SBRootSceneWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v1 = AXSBHIconManagerFromSharedIconController();
  int v2 = [v1 safeBoolForKey:@"isEditing"];
  if (v2)
  {
    v0 = +[AXSpringBoardGlue sharedInstance];
    if ([v0 _axIsAppLibraryOrTodayViewPresent])
    {
      uint64_t v3 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  v4 = AXSBHIconManagerFromSharedIconController();
  uint64_t v3 = [v4 safeBoolForKey:@"hasOpenFolder"];

  if (v2) {
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

@end