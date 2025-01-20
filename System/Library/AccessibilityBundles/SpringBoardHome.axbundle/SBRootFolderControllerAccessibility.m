@interface SBRootFolderControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)transitionDidFinish:(id)a3;
@end

@implementation SBRootFolderControllerAccessibility

- (void)transitionDidFinish:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(SBRootFolderControllerAccessibility *)self safeBoolForKey:@"isPullDownSearchVisibleOrTransitioning"])
  {
    v5 = [(SBRootFolderControllerAccessibility *)self safeValueForKey:@"rootFolderView"];
    v6 = [v5 safeValueForKey:@"_searchPulldownWrapperView"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke;
    v11[3] = &unk_265158088;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    [v6 _setAccessibilityViewIsModalBlock:v11];
LABEL_5:

    objc_destroyWeak(v7);
    goto LABEL_6;
  }
  if ([(SBRootFolderControllerAccessibility *)self safeBoolForKey:@"isLeadingCustomViewSearchVisibleOrTransitioning"])
  {
    v5 = [(SBRootFolderControllerAccessibility *)self safeValueForKey:@"rootFolderView"];
    v6 = [v5 safeValueForKey:@"_searchableLeadingCustomWrapperView"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke_2;
    v9[3] = &unk_265158088;
    v7 = &v10;
    objc_copyWeak(&v10, &location);
    [v6 _setAccessibilityViewIsModalBlock:v9];
    goto LABEL_5;
  }
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderControllerAccessibility;
  [(SBRootFolderControllerAccessibility *)&v8 transitionDidFinish:v4];
  objc_destroyWeak(&location);
}

+ (id)safeCategoryTargetClassName
{
  return @"SBRootFolderController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBRootFolderView" hasInstanceVariable:@"_searchPulldownWrapperView" withType:"_SBRootFolderLayoutWrapperView"];
  [v3 validateClass:@"SBRootFolderView" hasInstanceVariable:@"_searchableLeadingCustomWrapperView" withType:"_SBRootFolderLayoutWrapperView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isPullDownSearchVisibleOrTransitioning", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isLeadingCustomViewSearchVisibleOrTransitioning", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"transitionDidFinish:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isPullDownSearchVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isLeadingCustomViewSearchVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"rootFolderView", "@", 0);
}

uint64_t __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isPullDownSearchVisible"];

  return v2;
}

uint64_t __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isLeadingCustomViewSearchVisible"];

  return v2;
}

@end