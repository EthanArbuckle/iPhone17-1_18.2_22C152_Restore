@interface _SBHLibraryPodIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsHiddenPod;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (int64_t)accessibilityContainerType;
@end

@implementation _SBHLibraryPodIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBHLibraryPodIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SBHLibraryPodIconView" isKindOfClass:@"SBIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"customIconImageViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryCategoryIconViewController", @"_canBeLocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryCategoryIconViewController", @"isLocked", "B", 0);
}

- (id)accessibilityHint
{
  if ([(_SBHLibraryPodIconViewAccessibility *)self _axIsHiddenPod])
  {
    v2 = accessibilityLocalizedString(@"app.library.hidden.folder.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(_SBHLibraryPodIconViewAccessibility *)self _axIsHiddenPod])
  {
    [(_SBHLibraryPodIconViewAccessibility *)self accessibilityFrame];
    AX_CGRectGetCenter();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_SBHLibraryPodIconViewAccessibility;
    [(_SBHLibraryPodIconViewAccessibility *)&v5 accessibilityActivationPoint];
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)accessibilityContainerType
{
  if ([(_SBHLibraryPodIconViewAccessibility *)self _axIsHiddenPod]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBHLibraryPodIconViewAccessibility;
  return [(_SBHLibraryPodIconViewAccessibility *)&v4 accessibilityContainerType];
}

- (BOOL)_axIsHiddenPod
{
  v2 = [(_SBHLibraryPodIconViewAccessibility *)self safeValueForKey:@"customIconImageViewController"];
  if ([v2 safeBoolForKey:@"_canBeLocked"]) {
    char v3 = [v2 safeBoolForKey:@"isLocked"];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

@end