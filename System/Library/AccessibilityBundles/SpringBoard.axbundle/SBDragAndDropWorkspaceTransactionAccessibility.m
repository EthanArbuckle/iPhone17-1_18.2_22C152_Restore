@interface SBDragAndDropWorkspaceTransactionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityCurrentDropRegionContext;
- (id)accessibilityIntersectingDisplayName;
- (int64_t)accessibilityCurrentDropAction;
- (unint64_t)accessibilityCurrentDropRegion;
- (void)_accessibilityUpdateDropActionForAction:(int64_t)a3;
- (void)_accessibilityUpdateDropActionForRegion:(unint64_t)a3;
- (void)_didComplete;
- (void)_updateCurrentDropActionForSession:(id)a3;
@end

@implementation SBDragAndDropWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDragAndDropWorkspaceTransaction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationForDisplayItem:", "@", "@", 0);
  [v3 validateClass:@"SBDragAndDropWorkspaceTransaction" hasInstanceVariable:@"_currentSwitcherDropRegionContext" withType:"SBSwitcherDropRegionContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherDropRegionContext", @"intersectingAppLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDragAndDropWorkspaceTransaction", @"_didComplete", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherDropRegionContext", @"currentDropRegion", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"allItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"itemForLayoutRole:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  [v3 validateClass:@"SBDragAndDropWorkspaceTransaction" hasInstanceVariable:@"_currentLayoutState" withType:"SBMainDisplayLayoutState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  [v3 validateClass:@"SBDragAndDropWorkspaceTransaction" hasInstanceVariable:@"_currentDropAction" withType:"NSInteger"];
}

- (void)_updateCurrentDropActionForSession:(id)a3
{
  id v4 = a3;
  v5 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self safeValueForKey:@"_currentLayoutState"];
  uint64_t v6 = [v5 safeIntegerForKey:@"unlockedEnvironmentMode"];

  int64_t v7 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropAction];
  unint64_t v8 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropRegion];
  v9.receiver = self;
  v9.super_class = (Class)SBDragAndDropWorkspaceTransactionAccessibility;
  [(SBDragAndDropWorkspaceTransactionAccessibility *)&v9 _updateCurrentDropActionForSession:v4];

  if (v6 == 2)
  {
    [(SBDragAndDropWorkspaceTransactionAccessibility *)self _accessibilityUpdateDropActionForRegion:v8];
  }
  else if (v6 == 3)
  {
    [(SBDragAndDropWorkspaceTransactionAccessibility *)self _accessibilityUpdateDropActionForAction:v7];
  }
}

- (void)_didComplete
{
  id v3 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityIntersectingDisplayName];
  if (v3)
  {
    id v4 = NSString;
    v5 = accessibilityLocalizedString(@"app.switcher.creating.split.view");
    uint64_t v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransactionAccessibility;
  [(SBDragAndDropWorkspaceTransactionAccessibility *)&v7 _didComplete];
}

- (void)_accessibilityUpdateDropActionForRegion:(unint64_t)a3
{
  unint64_t v5 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropRegion];
  if (v5 == a3) {
    return;
  }
  unint64_t v6 = v5;
  if (!(v5 | a3)) {
    return;
  }
  objc_super v7 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityIntersectingDisplayName];
  if (v7)
  {
    id v12 = v7;
    if (v6 == 5)
    {
      unint64_t v8 = NSString;
      objc_super v9 = @"app.switcher.create.split.view.right";
LABEL_9:
      v10 = accessibilityLocalizedString(v9);
      v11 = objc_msgSend(v8, "stringWithFormat:", v10, v12);

      objc_super v7 = v12;
      if (v11)
      {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v11);

        objc_super v7 = v12;
      }
      goto LABEL_11;
    }
    if (v6 == 4)
    {
      unint64_t v8 = NSString;
      objc_super v9 = @"app.switcher.create.split.view.left";
      goto LABEL_9;
    }
  }
LABEL_11:
}

- (void)_accessibilityUpdateDropActionForAction:(int64_t)a3
{
  int64_t v4 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropAction];
  if (v4 != a3)
  {
    if ((unint64_t)(v4 - 1) > 9) {
      unint64_t v5 = @"drop.action.cancel.drop.announcement";
    }
    else {
      unint64_t v5 = off_265154570[v4 - 1];
    }
    accessibilityLocalizedString(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);
  }
}

- (int64_t)accessibilityCurrentDropAction
{
  return [(SBDragAndDropWorkspaceTransactionAccessibility *)self safeIntegerForKey:@"_currentDropAction"];
}

- (unint64_t)accessibilityCurrentDropRegion
{
  v2 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropRegionContext];
  unint64_t v3 = [v2 safeUnsignedIntegerForKey:@"currentDropRegion"];

  return v3;
}

- (id)accessibilityCurrentDropRegionContext
{
  return (id)[(SBDragAndDropWorkspaceTransactionAccessibility *)self safeValueForKey:@"_currentSwitcherDropRegionContext"];
}

- (id)accessibilityIntersectingDisplayName
{
  unint64_t v3 = [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropRegionContext];
  int64_t v4 = [v3 safeValueForKey:@"intersectingAppLayout"];

  [(SBDragAndDropWorkspaceTransactionAccessibility *)self accessibilityCurrentDropRegion];
  if (v4)
  {
    unint64_t v5 = [v4 safeArrayForKey:@"allItems"];
    if ((unint64_t)[v5 count] < 2)
    {
      if ([v5 count] == 1)
      {
        id v6 = [v5 firstObject];
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__7;
      v16 = __Block_byref_object_dispose__7;
      id v17 = 0;
      id v11 = v4;
      AXPerformSafeBlock();
      id v6 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__7;
    v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    id v10 = v6;
    AXPerformSafeBlock();
    id v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    objc_super v7 = [v8 safeStringForKey:@"displayName"];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

uint64_t __86__SBDragAndDropWorkspaceTransactionAccessibility_accessibilityIntersectingDisplayName__block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (a1[6] == 4) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  *(void *)(*(void *)(a1[5] + 8) + 40) = [v2 itemForLayoutRole:v3];

  return MEMORY[0x270F9A758]();
}

void __86__SBDragAndDropWorkspaceTransactionAccessibility_accessibilityIntersectingDisplayName__block_invoke_2(uint64_t a1)
{
  AXSBApplicationControllerSharedInstance();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 applicationForDisplayItem:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end