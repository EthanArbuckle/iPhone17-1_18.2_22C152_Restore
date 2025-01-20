@interface SBHomeScreenWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAppleIntelligenceSiriRequestsPresenting;
- (BOOL)_accessibilityCanAccessHomeScreenDuringOneness;
- (BOOL)_accessibilityIgnoresStatusBarFrame;
- (BOOL)_accessibilityIsInWidgetStack;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_accessibilityWindowVisible;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityKeyCommands;
- (void)_axLeftArrowPressed;
- (void)_axRightArrowPressed;
@end

@implementation SBHomeScreenWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenWindow";
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenWindow", @"homeScreenViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenViewController", @"iconController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_rootFolderController", "@", 0);
  [v3 validateClass:@"SBRootFolderController" isKindOfClass:@"SBFolderController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"firstIconPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isDisplayingWidgetIntroductionOnPage:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoardAccessibility", @"_accessibilityIsShowingLongLookNotification", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"stackConfigurationViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAssistantController", @"rootViewController", "@", 0);
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  v2 = [(SBHomeScreenWindowAccessibility *)self safeValueForKeyPath:@"homeScreenViewController.iconController._rootFolderController"];
  [v2 safeIntegerForKey:@"firstIconPageIndex"];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = v2;
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBHomeScreenWindowAccessibility__accessibilityIsIsolatedWindow__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDisplayingWidgetIntroductionOnPage:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  if ([(SBHomeScreenWindowAccessibility *)self _accessibilityCanAccessHomeScreenDuringOneness]|| [(SBHomeScreenWindowAccessibility *)self _accessibilityAppleIntelligenceSiriRequestsPresenting])
  {
    return 1;
  }
  v4 = [MEMORY[0x263F22968] server];
  if ([v4 isShowingHomescreen])
  {
    id v5 = [MEMORY[0x263F22968] server];
    if ([v5 isControlCenterVisible]) {
      char v3 = 1;
    }
    else {
      char v3 = [(id)*MEMORY[0x263F1D020] safeBoolForKey:@"_accessibilityIsShowingLongLookNotification"];
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)_accessibilityWindowVisible
{
  if ([(SBHomeScreenWindowAccessibility *)self _accessibilityCanAccessHomeScreenDuringOneness]|| [(SBHomeScreenWindowAccessibility *)self _accessibilityAppleIntelligenceSiriRequestsPresenting])
  {
    return 0;
  }
  v4 = [MEMORY[0x263F22968] server];
  char v5 = [v4 isShowingHomescreen];

  return v5;
}

- (BOOL)_accessibilityCanAccessHomeScreenDuringOneness
{
  BOOL v2 = AXRequestingClient() != 16 && AXRequestingClient() != 2;
  char v3 = [MEMORY[0x263F22968] server];
  BOOL v4 = [v3 isContinuitySessionActive] & v2;

  return v4;
}

- (BOOL)_accessibilityAppleIntelligenceSiriRequestsPresenting
{
  BOOL v2 = AXSBAssistantControllerSharedInstance();
  char v3 = [v2 safeValueForKey:@"rootViewController"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  char v3 = AXSBHIconManagerFromSharedIconController();
  char v4 = [v3 safeBoolForKey:@"isEditing"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenWindowAccessibility;
  return [(SBHomeScreenWindowAccessibility *)&v6 _accessibilityIgnoresStatusBarFrame];
}

- (id)_accessibilityKeyCommands
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenWindowAccessibility;
  BOOL v2 = [(SBHomeScreenWindowAccessibility *)&v8 _accessibilityKeyCommands];
  char v3 = (void *)[v2 mutableCopy];

  char v4 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D8] modifierFlags:0x100000 action:sel__axLeftArrowPressed];
  v9[0] = v4;
  char v5 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3E0] modifierFlags:0x100000 action:sel__axRightArrowPressed];
  v9[1] = v5;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (void)_axRightArrowPressed
{
  AXSBCurrentFolderController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = [v5 safeValueForKey:@"_contentView"];
  char v3 = [v2 safeArrayForKey:@"_iconListViews"];
  char v4 = [v3 firstObject];
  [v4 _accessibilityScrollLeftPage:0];
}

- (void)_axLeftArrowPressed
{
  AXSBCurrentFolderController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = [v5 safeValueForKey:@"_contentView"];
  char v3 = [v2 safeArrayForKey:@"_iconListViews"];
  char v4 = [v3 firstObject];
  [v4 _accessibilityScrollRightPage:0];
}

- (BOOL)_accessibilityIsInWidgetStack
{
  objc_opt_class();
  char v3 = [(SBHomeScreenWindowAccessibility *)self safeValueForKey:@"rootViewController"];
  char v4 = __UIAccessibilityCastAsClass();

  NSClassFromString(&cfstr_Sbhomescreenvi.isa);
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 safeValueForKey:@"iconController"];
    objc_super v6 = [v5 safeValueForKey:@"_rootFolderController"];
    v7 = [v6 safeValueForKey:@"stackConfigurationViewController"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end