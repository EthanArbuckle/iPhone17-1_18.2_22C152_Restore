@interface SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axDestinationAppName;
- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4;
@end

@implementation SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMoveFloatingApplicationGestureWorkspaceTransaction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBMoveFloatingApplicationGestureWorkspaceTransaction" isKindOfClass:@"SBFluidSwitcherGestureWorkspaceTransaction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherGestureWorkspaceTransaction", @"handleTransitionRequestForGestureComplete:fromGestureManager:", "v", "@", "@", 0);
  [v3 validateClass:@"SBSwitcherTransitionRequest"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherTransitionRequest", @"floatingConfiguration", "q", 0);
  [v3 validateClass:@"SBWorkspaceTransaction"];
  [v3 validateClass:@"SBMoveFloatingApplicationGestureWorkspaceTransaction" isKindOfClass:@"SBWorkspaceTransaction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransaction", @"transitionRequest", "@", 0);
  [v3 validateClass:@"SBWorkspaceTransitionRequest"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransitionRequest", @"applicationContext", "@", 0);
  [v3 validateClass:@"SBWorkspaceApplicationSceneTransitionContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"applicationSceneEntities", "@", 0);
  [v3 validateClass:@"SBApplicationSceneEntity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneEntity", @"application", "@", 0);
  [v3 validateClass:@"SBApplication"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility;
  id v6 = a3;
  [(SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility *)&v16 handleTransitionRequestForGestureComplete:v6 fromGestureManager:a4];
  int v7 = [(SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility *)self _accessibilityIsRTL];
  uint64_t v8 = [v6 safeIntegerForKey:@"floatingConfiguration"];

  v9 = [(SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility *)self _axDestinationAppName];
  switch(v8)
  {
    case 1:
      v10 = NSString;
      v11 = @"app.pip.nib.action.moved.app.left";
      v12 = @"app.pip.nib.action.moved.app.right";
      goto LABEL_5;
    case 2:
      v10 = NSString;
      v11 = @"app.pip.nib.action.moved.app.right";
      v12 = @"app.pip.nib.action.moved.app.left";
LABEL_5:
      if (v7) {
        v14 = v12;
      }
      else {
        v14 = v11;
      }
      goto LABEL_10;
    case 3:
      v10 = NSString;
      v14 = @"app.pip.nib.action.moved.app.stashed.left";
      goto LABEL_10;
    case 4:
      v10 = NSString;
      v14 = @"app.pip.nib.action.moved.app.stashed.right";
LABEL_10:
      v15 = accessibilityLocalizedString(v14);
      v13 = objc_msgSend(v10, "stringWithFormat:", v15, v9);

      break;
    default:
      v13 = 0;
      break;
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
}

- (id)_axDestinationAppName
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = [(SBMoveFloatingApplicationGestureWorkspaceTransactionAccessibility *)self safeValueForKey:@"transitionRequest"];
  id v3 = [v2 safeValueForKey:@"applicationContext"];
  char v24 = 0;
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"applicationSceneEntities"];
  v5 = __UIAccessibilityCastAsClass();

  v18 = v3;
  v19 = v2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    v10 = &stru_26F7D3690;
    do
    {
      uint64_t v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "safeValueForKey:", @"application", v16, v17, v18, v19, (void)v20);
        v14 = [v13 safeStringForKey:@"displayName"];

        objc_super v16 = v14;
        v17 = @"__AXStringForVariablesSentinel";
        __UIAXStringForVariables();
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      uint64_t v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, v14, @"__AXStringForVariablesSentinel");
    }
    while (v8);
  }
  else
  {
    v10 = &stru_26F7D3690;
  }

  return v10;
}

@end