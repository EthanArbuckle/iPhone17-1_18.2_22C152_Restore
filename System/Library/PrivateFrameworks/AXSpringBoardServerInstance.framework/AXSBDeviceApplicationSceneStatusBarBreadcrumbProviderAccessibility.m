@interface AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility
+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility

+ (BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)a3 sceneHandle:(id)a4 withTransitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 safeValueForKey:@"application"];
  v12 = [v11 safeValueForKey:@"bundleIdentifier"];

  LOBYTE(v47) = 0;
  objc_opt_class();
  v13 = __UIAccessibilityCastAsClass();

  if (![v13 isEqualToString:*MEMORY[0x263F8B0C8]]) {
    goto LABEL_12;
  }
  id v33 = a1;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  uint64_t v41 = MEMORY[0x263EF8330];
  uint64_t v42 = 3221225472;
  v43 = __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke;
  v44 = &unk_2647F06D8;
  v46 = &v47;
  id v14 = v10;
  id v45 = v14;
  AXPerformSafeBlock();
  id v15 = (id)v48[5];

  _Block_object_dispose(&v47, 8);
  v16 = [v15 safeValueForKey:@"application"];

  v17 = [v16 safeStringForKey:@"bundleIdentifier"];

  LOBYTE(v47) = 0;
  objc_opt_class();
  uint64_t v18 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v47) {
    goto LABEL_14;
  }
  v19 = (void *)v18;

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke_2;
  v38 = &unk_2647F06D8;
  v40 = &v47;
  id v20 = v14;
  id v39 = v20;
  AXPerformSafeBlock();
  id v21 = (id)v48[5];

  _Block_object_dispose(&v47, 8);
  v22 = [v21 safeValueForKey:@"application"];

  v23 = [v22 safeStringForKey:@"bundleIdentifier"];

  LOBYTE(v47) = 0;
  objc_opt_class();
  uint64_t v24 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v47) {
    goto LABEL_14;
  }
  v25 = (void *)v24;

  LOBYTE(v47) = 0;
  v26 = [v20 safeValueForKey:@"request"];
  v27 = __UIAccessibilitySafeClass();

  if ((_BYTE)v47) {
LABEL_14:
  }
    abort();
  uint64_t v28 = [v27 safeIntegerForKey:@"source"];
  uint64_t v29 = [v25 length];
  int v30 = [v27 safeBoolForKey:@"isMainWorkspaceTransitionRequest"];
  if (![v19 isEqual:v13]
    || (v30 & ~[v25 isEqual:v13]) != 1
    || !v29
    || v28 != 18)
  {

    a1 = v33;
LABEL_12:
    v34.receiver = a1;
    v34.super_class = (Class)&OBJC_METACLASS___AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility;
    unsigned __int8 v31 = objc_msgSendSuper2(&v34, sel__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext_, v8, v9, v10, v33);
    goto LABEL_13;
  }

  unsigned __int8 v31 = 1;
LABEL_13:

  return v31;
}

+ (id)safeCategoryTargetClassName
{
  return @"SBDeviceApplicationSceneStatusBarBreadcrumbProvider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBWorkspaceApplicationSceneTransitionContext"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBDeviceApplicationSceneStatusBarBreadcrumbProvider", @"_shouldAddBreadcrumbToActivatingSceneEntity:sceneHandle:withTransitionContext:", "B", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"applicationSceneEntityForLayoutRole:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"previousApplicationSceneEntityForLayoutRole:", "@", "q", 0);
  [v3 validateClass:@"SBWorkspaceTransitionContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransitionContext", @"request", "@", 0);
  [v3 validateClass:@"SBMainWorkspaceTransitionRequest"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspaceTransitionRequest", @"source", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspaceTransitionRequest", @"isMainWorkspaceTransitionRequest", "B", 0);
  [v3 validateClass:@"SBApplicationSceneEntity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneEntity", @"application", "@", 0);
  [v3 validateClass:@"SBApplication"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
}

uint64_t __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) applicationSceneEntityForLayoutRole:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __148__AXSBDeviceApplicationSceneStatusBarBreadcrumbProviderAccessibility__shouldAddBreadcrumbToActivatingSceneEntity_sceneHandle_withTransitionContext___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) previousApplicationSceneEntityForLayoutRole:1];
  return MEMORY[0x270F9A758]();
}

@end