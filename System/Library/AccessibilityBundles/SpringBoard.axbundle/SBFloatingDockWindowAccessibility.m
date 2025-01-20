@interface SBFloatingDockWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityKeyCommands;
- (int64_t)_accessibilitySortPriority;
- (void)_axLeftArrowPressed;
- (void)_axRightArrowPressed;
@end

@implementation SBFloatingDockWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatingDockWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityScrollLeftPage:", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityScrollRightPage:", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_currentFolderController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"floatingDockController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockWindow", @"floatingDockRootViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isPresentingLibraryInFloatingDockWindow", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockRootViewController", @"isPresentingFolder", "B", 0);
}

- (int64_t)_accessibilitySortPriority
{
  return -1;
}

- (id)_accessibilityKeyCommands
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockWindowAccessibility;
  v2 = [(SBFloatingDockWindowAccessibility *)&v8 _accessibilityKeyCommands];
  id v3 = (void *)[v2 mutableCopy];

  v4 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D8] modifierFlags:0x100000 action:sel__axLeftArrowPressed];
  v9[0] = v4;
  v5 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3E0] modifierFlags:0x100000 action:sel__axRightArrowPressed];
  v9[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (void)_axRightArrowPressed
{
  AXSBCurrentFolderController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 safeValueForKey:@"_contentView"];
  id v3 = [v2 safeArrayForKey:@"_iconListViews"];
  v4 = [v3 firstObject];
  [v4 _accessibilityScrollLeftPage:0];
}

- (void)_axLeftArrowPressed
{
  AXSBCurrentFolderController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 safeValueForKey:@"_contentView"];
  id v3 = [v2 safeArrayForKey:@"_iconListViews"];
  v4 = [v3 firstObject];
  [v4 _accessibilityScrollRightPage:0];
}

- (BOOL)accessibilityViewIsModal
{
  id v3 = AXWindowScene(@"activeDisplayWindowScene");
  v4 = [v3 safeValueForKey:@"floatingDockController"];
  id v5 = [(SBFloatingDockWindowAccessibility *)self safeValueForKey:@"floatingDockRootViewController"];
  if (([v4 safeBoolForKey:@"isPresentingLibraryInFloatingDockWindow"] & 1) != 0
    || ([v5 safeBoolForKey:@"isPresentingFolder"] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFloatingDockWindowAccessibility;
    BOOL v6 = [(SBFloatingDockWindowAccessibility *)&v8 accessibilityViewIsModal];
  }

  return v6;
}

@end