@interface SBRootFolderViewPageManagementLayoutManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5;
@end

@implementation SBRootFolderViewPageManagementLayoutManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRootFolderViewPageManagementLayoutManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderViewPageManagementLayoutManager", @"transitionToActive:inFolderView:usingAnimator:", "v", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderViewPageManagementLayoutManager", @"focusModeSymbolView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DNDStateService", @"queryCurrentStateWithError:", "@", "^@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DNDState", @"activeModeConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DNDModeConfiguration", @"mode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DNDMode", @"name", "@", 0);
}

- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBRootFolderViewPageManagementLayoutManagerAccessibility;
  [(SBRootFolderViewPageManagementLayoutManagerAccessibility *)&v19 transitionToActive:v6 inFolderView:v8 usingAnimator:v9];
  v10 = [(SBRootFolderViewPageManagementLayoutManagerAccessibility *)self safeUIViewForKey:@"focusModeSymbolView"];
  v11 = v10;
  if (v6 && v10)
  {
    objc_initWeak(&location, v10);
    v12 = dispatch_get_global_queue(0, 0);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke;
    v16 = &unk_265157DE8;
    objc_copyWeak(&v17, &location);
    dispatch_async(v12, &v13);

    objc_msgSend(v11, "setIsAccessibilityElement:", 1, v13, v14, v15, v16);
    [v11 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v11);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[1] = (id)MEMORY[0x263EF8330];
  v4[2] = (id)3221225472;
  v4[3] = __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_306;
  v4[4] = &unk_265157D98;
  v4[5] = &v5;
  AXPerformSafeBlock();
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  id v3 = v2;
  objc_copyWeak(v4, (id *)(a1 + 32));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v4);
}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_306(uint64_t a1)
{
  AXSBIconControllerSharedInstance();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v6 safeValueForKey:@"dndStateService"];
  uint64_t v3 = [v2 queryCurrentStateWithError:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__SBRootFolderViewPageManagementLayoutManagerAccessibility_transitionToActive_inFolderView_usingAnimator___block_invoke_2(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = accessibilityLocalizedString(@"focus.on");
  uint64_t v4 = [*(id *)(a1 + 32) safeValueForKeyPath:@"activeModeConfiguration.mode.name"];
  objc_msgSend(v2, "stringWithFormat:", v3, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAccessibilityLabel:v6];
}

@end