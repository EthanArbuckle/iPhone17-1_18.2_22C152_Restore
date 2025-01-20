@interface SBFloatingDockViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsClosingFolder;
- (void)_axSetIsClosingFolder:(BOOL)a3;
- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4;
- (void)dockViewDidResignVisible;
@end

@implementation SBFloatingDockViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatingDockViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockViewController", @"dismissPresentedFolderAnimated:completion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockViewController", @"dockViewDidResignVisible", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
}

- (BOOL)_axIsClosingFolder
{
  return MEMORY[0x270F0A438](self, &__SBFloatingDockViewControllerAccessibility___axIsClosingFolder);
}

- (void)_axSetIsClosingFolder:(BOOL)a3
{
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(SBFloatingDockViewControllerAccessibility *)self _axSetIsClosingFolder:1];
  v7 = AXSBHIconManagerFromSharedIconController();
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke;
  v26 = &unk_265157D70;
  id v27 = v7;
  AXPerformSafeBlock();
  v8 = [v27 safeValueForKey:@"openedFolder"];
  v9 = [v8 safeValueForKey:@"displayName"];
  v10 = (void *)[v6 copy];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke_2;
  v16[3] = &unk_265157F28;
  BOOL v21 = v8 != 0;
  id v17 = v27;
  v18 = self;
  BOOL v22 = v4;
  id v19 = v9;
  id v20 = v10;
  id v11 = v9;
  id v12 = v10;
  id v13 = v27;
  v14 = (void *)MEMORY[0x245664140](v16);
  v15.receiver = self;
  v15.super_class = (Class)SBFloatingDockViewControllerAccessibility;
  [(SBFloatingDockViewControllerAccessibility *)&v15 dismissPresentedFolderAnimated:v4 completion:v14];
}

uint64_t __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axSetCurrentFolderScrollEnabled:1];
}

void __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v4 = [*(id *)(a1 + 32) safeBoolForKey:@"hasOpenFolder"];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (*(unsigned char *)(a1 + 64)) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0 && [*(id *)(a1 + 40) _axIsClosingFolder])
  {
    if (*(unsigned char *)(a1 + 65))
    {
      UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21940]);
      id v8 = objc_allocWithZone(NSDictionary);
      v9 = [NSNumber numberWithInt:1];
      v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, *MEMORY[0x263F216D8], *MEMORY[0x263EFFB40], *MEMORY[0x263F21770], 0);

      id v11 = objc_allocWithZone(MEMORY[0x263F086A0]);
      id v12 = NSString;
      id v13 = accessibilityLocalizedString(@"closing.folder");
      v14 = objc_msgSend(v12, "stringWithFormat:", v13, *(void *)(a1 + 48));
      objc_super v15 = (void *)[v11 initWithString:v14 attributes:v10];

      UIAccessibilityPostNotification(v7, v15);
    }
    [*(id *)(a1 + 40) _axSetIsClosingFolder:0];
  }
  UIAccessibilityNotifications v16 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v16, 0);
}

- (void)dockViewDidResignVisible
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockViewControllerAccessibility;
  [(SBFloatingDockViewControllerAccessibility *)&v3 dockViewDidResignVisible];
  v2 = [MEMORY[0x263F22968] server];
  [v2 didPotentiallyDismissNonExclusiveSystemUI];
}

@end