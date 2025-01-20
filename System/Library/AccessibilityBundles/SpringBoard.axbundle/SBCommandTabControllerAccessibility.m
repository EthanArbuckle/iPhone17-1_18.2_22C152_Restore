@interface SBCommandTabControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_activateWithForwardDirection:(BOOL)a3;
@end

@implementation SBCommandTabControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCommandTabController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSceneManagerCoordinator"];
  [v3 validateClass:@"FBDisplayManager"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"FBDisplayManager", @"mainIdentity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManagerCoordinator", @"sceneManagerForDisplayIdentity:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneManager", @"externalForegroundApplicationSceneHandles", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBCommandTabController", @"_activateWithForwardDirection:", "v", "B", 0);
  [v3 validateClass:@"SBCommandTabController" hasInstanceVariable:@"_commandTabViewController" withType:"SBCommandTabViewController"];
}

- (void)_activateWithForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBCommandTabControllerAccessibility;
  -[SBCommandTabControllerAccessibility _activateWithForwardDirection:](&v21, sel__activateWithForwardDirection_);
  if (v3)
  {
    v5 = [NSClassFromString(&cfstr_Sbscenemanager.isa) safeValueForKey:@"sharedInstance"];
    v6 = [NSClassFromString(&cfstr_Fbdisplaymanag.isa) safeValueForKey:@"mainIdentity"];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    id v7 = v5;
    id v8 = v6;
    AXPerformSafeBlock();
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    LOBYTE(v15) = 0;
    objc_opt_class();
    v10 = [v9 safeValueForKey:@"externalForegroundApplicationSceneHandles"];
    v11 = __UIAccessibilityCastAsClass();

    if (!(_BYTE)v15)
    {
      uint64_t v12 = [v11 count];

      if (v12)
      {
LABEL_6:

        return;
      }
      LOBYTE(v15) = 0;
      objc_opt_class();
      v13 = [(SBCommandTabControllerAccessibility *)self safeValueForKey:@"_commandTabViewController"];
      v14 = __UIAccessibilityCastAsSafeCategory();

      if (!(_BYTE)v15)
      {
        [v14 accessibilityAnnounceSelectedIcon];

        goto LABEL_6;
      }
    }
    abort();
  }
}

uint64_t __69__SBCommandTabControllerAccessibility__activateWithForwardDirection___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) sceneManagerForDisplayIdentity:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end