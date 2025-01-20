@interface SBFolderContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBFolderContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFloatyFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderContainerView", @"folderView", "@", 0);
  [v3 validateClass:@"SBFolderContainerView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isTransparentFocusRegion", "B", 0);
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [(SBFolderContainerViewAccessibility *)self safeValueForKey:@"folderView"];
  NSClassFromString(&cfstr_Sbfloatyfolder_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isTransparentFocusRegion
{
  v5.receiver = self;
  v5.super_class = (Class)SBFolderContainerViewAccessibility;
  unsigned __int8 v3 = [(SBFolderContainerViewAccessibility *)&v5 _isTransparentFocusRegion];
  return [(SBFolderContainerViewAccessibility *)self _accessibilityIsFKARunningForFocusItem] | v3;
}

@end