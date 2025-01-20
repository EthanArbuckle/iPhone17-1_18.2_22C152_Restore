@interface PXPhotosViewRoundedAccessoryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (Class)_axCuratedLibraryUIViewControllerClass;
- (id)_accessibilityLemonadeCuratedLibraryViewController;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3;
@end

@implementation PXPhotosViewRoundedAccessoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosViewRoundedAccessoryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXCuratedLibraryUIViewController"];
  [v3 validateClass:@"LemonadeCuratedLibraryView_ContainerViewController"];
  [v3 validateClass:@"PXPhotosViewRoundedAccessoryButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"LemonadeCuratedLibraryView_ContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"isCollapsed", "B", 0);
  [v3 validateClass:@"LemonadeCuratedLibraryView_ContainerViewController" hasSwiftField:@"viewModel" withSwiftType:"LemonadeCuratedLibraryViewModel"];
  [v3 validateClass:@"PhotosUICore.LemonadeCuratedLibraryViewModel" hasSwiftField:@"allPhotosViewController" withSwiftType:"PXCuratedLibraryUIViewController"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)self _accessibilityLemonadeCuratedLibraryViewController];
  objc_opt_class();
  id v3 = [v2 safeSwiftValueForKey:@"viewModel"];
  v4 = [v3 safeSwiftValueForKey:@"allPhotosViewController"];
  v5 = __UIAccessibilityCastAsClass();

  LODWORD(v3) = [v5 safeBoolForKey:@"isCollapsed"] ^ 1;
  return (char)v3;
}

- (id)accessibilityLabel
{
  id v3 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)self safeValueForKey:@"configuration"];
  v4 = [v3 safeValueForKey:@"image"];
  v5 = [v4 accessibilityIdentifier];

  if ([v5 isEqualToString:@"video"])
  {
    v6 = @"filter.video";
LABEL_16:
    uint64_t v7 = accessibilityPhotosUICoreLocalizedString(v6);
    goto LABEL_17;
  }
  if ([v5 isEqualToString:@"photo"])
  {
    v6 = @"filter.photo";
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"heart.fill"])
  {
    v6 = @"filter.favorites";
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"slider.horizontal.3"])
  {
    v6 = @"filter.edited";
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"camera.viewfinder"])
  {
    v6 = @"filter.screenshot";
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"line.horizontal.3.decrease"])
  {
    v6 = @"filter.multiple.options";
    goto LABEL_16;
  }
  if (([v5 isEqualToString:@"arrow.up.arrow.down"] & 1) != 0
    || [v5 isEqualToString:@"line.3.horizontal.decrease"])
  {
    v6 = @"filter.sort";
    goto LABEL_16;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosViewRoundedAccessoryButtonAccessibility;
  uint64_t v7 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)&v10 accessibilityLabel];
LABEL_17:
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosViewRoundedAccessoryButtonAccessibility;
  unint64_t v3 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)&v11 accessibilityTraits];
  v4 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)self safeValueForKey:@"configuration"];
  v5 = [v4 safeValueForKey:@"image"];
  v6 = [v5 accessibilityIdentifier];

  int v7 = [v6 isEqualToString:@"line.3.horizontal.decrease"];
  uint64_t v8 = *MEMORY[0x263F1CF20];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | v3;

  return v9;
}

- (id)_accessibilityLemonadeCuratedLibraryViewController
{
  if (![(PXPhotosViewRoundedAccessoryButtonAccessibility *)self _axCuratedLibraryUIViewControllerClass])[(PXPhotosViewRoundedAccessoryButtonAccessibility *)self _setAxCuratedLibraryUIViewControllerClass:MEMORY[0x2455E3C60](@"LemonadeCuratedLibraryView_ContainerViewController")]; {
  if ([(PXPhotosViewRoundedAccessoryButtonAccessibility *)self _axCuratedLibraryUIViewControllerClass])
  }
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __101__PXPhotosViewRoundedAccessoryButtonAccessibility__accessibilityLemonadeCuratedLibraryViewController__block_invoke;
    v6[3] = &unk_2650A5FF8;
    v6[4] = self;
    unint64_t v3 = [(PXPhotosViewRoundedAccessoryButtonAccessibility *)self _accessibilityFindAncestor:v6 startWithSelf:1];
    v4 = [v3 _accessibilityViewController];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __101__PXPhotosViewRoundedAccessoryButtonAccessibility__accessibilityLemonadeCuratedLibraryViewController__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 _accessibilityViewController];
  [*(id *)(a1 + 32) _axCuratedLibraryUIViewControllerClass];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

@end