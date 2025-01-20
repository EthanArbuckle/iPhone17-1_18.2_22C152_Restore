@interface SBKeyboardFocusCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFocusLockedToSpringBoard;
- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4;
- (BOOL)_axIsAcquiringSpringBoardDeferral;
- (BOOL)_axIsInvalidatingSpringBoardDeferral;
- (id)_accessibilityTokenStringForPid:(int)a3 sceneID:(id)a4;
- (id)_axNativeFocusedApplicationDeathWatcher;
- (id)_axNativeFocusedApplicationDeferral;
- (id)_axPrimaryKeyboardFocusOverrideSceneID;
- (id)_axSecondaryKeyboardFocusOverrideSceneID;
- (id)_axSpringBoardDeferral;
- (int)_axPrimaryKeyboardFocusOverridePid;
- (int)_axSecondaryKeyboardFocusOverridePid;
- (void)_accessibilityFocusOnAppWithPid:(int)a3 bundleIdentifier:(id)a4 identifier:(id)a5;
- (void)_accessibilityFocusOnSpringBoardWithSceneID:(id)a3;
- (void)_accessibilitySetPrimaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4;
- (void)_accessibilitySetSecondaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4;
- (void)_accessibilityUserFocusRequestForScene:(id)a3;
- (void)_axClearKeyboardFocusOverrideDeferral;
- (void)_axDeferKeyboardFocusToPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5;
- (void)_axSetIsAcquiringSpringBoardDeferral:(BOOL)a3;
- (void)_axSetIsInvalidatingSpringBoardDeferral:(BOOL)a3;
- (void)_axSetKeyboardFocusPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5;
- (void)_axSetNativeFocusedApplicationDeathWatcher:(id)a3;
- (void)_axSetNativeFocusedApplicationDeferral:(id)a3;
- (void)_axSetPrimaryKeyboardFocusOverridePid:(int)a3;
- (void)_axSetPrimaryKeyboardFocusOverrideSceneID:(id)a3;
- (void)_axSetSecondaryKeyboardFocusOverridePid:(int)a3;
- (void)_axSetSecondaryKeyboardFocusOverrideSceneID:(id)a3;
- (void)_axSetSpringBoardDeferral:(id)a3;
@end

@implementation SBKeyboardFocusCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBKeyboardFocusCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int)_axPrimaryKeyboardFocusOverridePid
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetPrimaryKeyboardFocusOverridePid:(int)a3
{
}

- (int)_axSecondaryKeyboardFocusOverridePid
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetSecondaryKeyboardFocusOverridePid:(int)a3
{
}

- (id)_axPrimaryKeyboardFocusOverrideSceneID
{
}

- (void)_axSetPrimaryKeyboardFocusOverrideSceneID:(id)a3
{
}

- (id)_axSecondaryKeyboardFocusOverrideSceneID
{
}

- (void)_axSetSecondaryKeyboardFocusOverrideSceneID:(id)a3
{
}

- (id)_axNativeFocusedApplicationDeferral
{
}

- (void)_axSetNativeFocusedApplicationDeferral:(id)a3
{
}

- (id)_axNativeFocusedApplicationDeathWatcher
{
}

- (void)_axSetNativeFocusedApplicationDeathWatcher:(id)a3
{
}

- (BOOL)_axIsAcquiringSpringBoardDeferral
{
  return MEMORY[0x270F09620](self, &__SBKeyboardFocusCoordinatorAccessibility___axIsAcquiringSpringBoardDeferral);
}

- (void)_axSetIsAcquiringSpringBoardDeferral:(BOOL)a3
{
}

- (BOOL)_axIsInvalidatingSpringBoardDeferral
{
  return MEMORY[0x270F09620](self, &__SBKeyboardFocusCoordinatorAccessibility___axIsInvalidatingSpringBoardDeferral);
}

- (void)_axSetIsInvalidatingSpringBoardDeferral:(BOOL)a3
{
}

- (id)_axSpringBoardDeferral
{
}

- (void)_axSetSpringBoardDeferral:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBKeyboardFocusCoordinator" conformsToProtocol:@"SBKeyboardFocusControlling"];
  [v3 validateProtocol:@"SBKeyboardFocusControlling" hasRequiredInstanceMethod:@"userFocusRequestForScene:reason:completion:"];
  [v3 validateClass:@"SBKeyboardFocusSceneController" hasInstanceVariable:@"_springBoardFocusLockAssertions" withType:"BSCompoundAssertion"];
  [v3 validateClass:@"SBKeyboardFocusCoordinator" hasInstanceVariable:@"_sceneControllers" withType:"NSMutableSet"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBKeyboardFocusCoordinator", @"focusLockSpringBoardWindowScene:forAccessibilityReason:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBKeyboardFocusCoordinator", @"requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:forAccessibilityReason:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBKeyboardFocusCoordinator", @"suppressKeyboardFocusEvaluationForReason:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"systemUIScenesCoordinator", "@", 0);
  [v3 validateProtocol:@"SBFSceneWorkspaceControlling" hasMethod:@"enumerateScenesWithBlock:" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"SBSystemUISceneController" conformsToProtocol:@"SBFSceneWorkspaceControlling"];
  [v3 validateClass:@"SBLiveTranscriptionUISceneController" isKindOfClass:@"SBSystemUISceneController"];
  [v3 validateClass:@"SBFullKeyboardAccessUISceneController" isKindOfClass:@"SBSystemUISceneController"];
  [v3 validateClass:@"SBAssistiveTouchUISceneController" isKindOfClass:@"SBSystemUISceneController"];
  [v3 validateClass:@"SBAccessibilityUIServerUISceneController" isKindOfClass:@"SBSystemUISceneController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemUIScenesCoordinator", @"liveTranscriptionUISceneController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemUIScenesCoordinator", @"fullKeyboardAccessUISceneController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemUIScenesCoordinator", @"assistiveTouchUISceneController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemUIScenesCoordinator", @"accessibilityUIServerUISceneController", "@", 0);
}

- (void)_accessibilityUserFocusRequestForScene:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __82__SBKeyboardFocusCoordinatorAccessibility__accessibilityUserFocusRequestForScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userFocusRequestForScene:*(void *)(a1 + 40) reason:@"Accessibility-FKA" completion:0];
}

- (void)_accessibilitySetPrimaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4
{
}

- (void)_accessibilitySetSecondaryKeyboardFocusOverridePid:(int)a3 sceneID:(id)a4
{
}

- (BOOL)_accessibilityIsFocusLockedToSpringBoard
{
  v2 = [(SBKeyboardFocusCoordinatorAccessibility *)self safeSetForKey:@"_sceneControllers"];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke;
  v5[3] = &unk_265154370;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"_springBoardFocusLockAssertions"];
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 reasons];
  v7 = objc_msgSend(v6, "ax_filteredSetUsingBlock:", &__block_literal_global_13);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 count] != 0;
}

uint64_t __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityIsFocusLockedToSpringBoard__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsString:@"Accessibility-FKA"] ^ 1;
}

- (void)_axDeferKeyboardFocusToPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  char v9 = [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilityTokenStringForPid:v6 sceneID:v8];
  v10 = v9;
  if (v9)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    id v29 = 0;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke;
    v20 = &unk_265153DF0;
    v23 = &v24;
    v21 = self;
    id v22 = v9;
    AXPerformSafeBlock();
    v11 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
    [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetNativeFocusedApplicationDeferral:v11];
    id v12 = objc_alloc(MEMORY[0x263F29CB0]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke_2;
    v14[3] = &unk_265154398;
    BOOL v16 = a5;
    int v15 = v6;
    v14[4] = self;
    v13 = (void *)[v12 initWithPID:v6 queue:MEMORY[0x263EF83A0] deathHandler:v14];
    [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetNativeFocusedApplicationDeathWatcher:v13];
  }
  else
  {
    v11 = FKALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SBKeyboardFocusCoordinatorAccessibility _axDeferKeyboardFocusToPid:sceneID:forPrimaryOverride:](v6, (uint64_t)v8, v11);
    }
  }
}

uint64_t __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) requestKeyboardFocusOverrideSceneIdentityTokenStringRepresentation:*(void *)(a1 + 40) forAccessibilityReason:@"Accessibility-FKA"];

  return MEMORY[0x270F9A758]();
}

uint64_t __97__SBKeyboardFocusCoordinatorAccessibility__axDeferKeyboardFocusToPid_sceneID_forPrimaryOverride___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = FKALogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    if (*(unsigned char *)(a1 + 44)) {
      id v4 = @"primary";
    }
    else {
      id v4 = @"secondary";
    }
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_242561000, v2, OS_LOG_TYPE_INFO, "Reset %@ override for dead native focused application with pid: %i", (uint8_t *)&v7, 0x12u);
  }

  v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 44)) {
    return [v5 _accessibilitySetPrimaryKeyboardFocusOverridePid:0 sceneID:0];
  }
  else {
    return [v5 _accessibilitySetSecondaryKeyboardFocusOverridePid:0 sceneID:0];
  }
}

- (void)_axSetKeyboardFocusPid:(int)a3 sceneID:(id)a4 forPrimaryOverride:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  __int16 v9 = [(SBKeyboardFocusCoordinatorAccessibility *)self _axSpringBoardDeferral];
  [v9 invalidate];

  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSpringBoardDeferral:0];
  int v10 = FKALogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = @"secondary";
    if (v5) {
      uint64_t v11 = @"primary";
    }
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl(&dword_242561000, v10, OS_LOG_TYPE_INFO, "Set %@ keyboard focus override pid: %i", (uint8_t *)&v13, 0x12u);
  }

  if (v5)
  {
    [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetPrimaryKeyboardFocusOverridePid:v6];
    [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetPrimaryKeyboardFocusOverrideSceneID:v8];
    goto LABEL_11;
  }
  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSecondaryKeyboardFocusOverridePid:v6];
  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSecondaryKeyboardFocusOverrideSceneID:v8];
  if (![(SBKeyboardFocusCoordinatorAccessibility *)self _axPrimaryKeyboardFocusOverridePid])
  {
LABEL_11:
    [(SBKeyboardFocusCoordinatorAccessibility *)self _axClearKeyboardFocusOverrideDeferral];
    if (v6) {
      [(SBKeyboardFocusCoordinatorAccessibility *)self _axDeferKeyboardFocusToPid:v6 sceneID:v8 forPrimaryOverride:v5];
    }
    goto LABEL_13;
  }
  id v12 = FKALogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_242561000, v12, OS_LOG_TYPE_INFO, "Not updating deferral, because the primary keyboard focus override was in effect.", (uint8_t *)&v13, 2u);
  }

LABEL_13:
}

- (id)_accessibilityTokenStringForPid:(int)a3 sceneID:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v19 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  id v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  id v4 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"systemUIScenesCoordinator"];
  BOOL v5 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v6 = [v4 safeValueForKey:@"liveTranscriptionUISceneController"];
  int v7 = [v4 safeValueForKey:@"fullKeyboardAccessUISceneController"];
  id v8 = [v4 safeValueForKey:@"assistiveTouchUISceneController"];
  __int16 v9 = [v4 safeValueForKey:@"accessibilityUIServerUISceneController"];
  int v10 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 4, v6, v7, v8, v9);
  uint64_t v18 = v4;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v11);
      }
      id v20 = v19;
      AXPerformSafeBlock();
      BOOL v15 = v26[5] == 0;

      if (!v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v16 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke_2;
  v5[3] = &unk_2651543C0;
  int v8 = *(_DWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateScenesWithBlock:v5];
}

void __83__SBKeyboardFocusCoordinatorAccessibility__accessibilityTokenStringForPid_sceneID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  BOOL v5 = [v14 clientHandle];
  id v6 = [v5 processHandle];
  if ([v6 pid] == *(_DWORD *)(a1 + 48))
  {
    uint64_t v7 = [v14 identifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    __int16 v9 = v14;
    if (v8)
    {
      int v10 = [v14 identityToken];
      uint64_t v11 = [v10 stringRepresentation];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      __int16 v9 = v14;
      *a3 = 1;
    }
  }
  else
  {

    __int16 v9 = v14;
  }
}

- (void)_axClearKeyboardFocusOverrideDeferral
{
  id v3 = [(SBKeyboardFocusCoordinatorAccessibility *)self _axNativeFocusedApplicationDeferral];
  [v3 invalidate];

  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetNativeFocusedApplicationDeferral:0];
  uint64_t v4 = [(SBKeyboardFocusCoordinatorAccessibility *)self _axNativeFocusedApplicationDeathWatcher];
  [v4 invalidate];

  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetNativeFocusedApplicationDeathWatcher:0];
}

- (void)_accessibilityFocusOnSpringBoardWithSceneID:(id)a3
{
  id v4 = a3;
  [(SBKeyboardFocusCoordinatorAccessibility *)self _axClearKeyboardFocusOverrideDeferral];
  BOOL v5 = [(SBKeyboardFocusCoordinatorAccessibility *)self _axSpringBoardDeferral];
  [v5 invalidate];

  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSpringBoardDeferral:0];
  id v6 = (id *)MEMORY[0x263F1D020];
  uint64_t v7 = [(id)*MEMORY[0x263F1D020] _accessibilityMainWindow];
  int v8 = [v7 windowScene];

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  id v29 = __Block_byref_object_dispose__6;
  id v9 = v8;
  id v30 = v9;
  if ([v4 length])
  {
    int v10 = [*v6 safeArrayForKey:@"_accessibilityFocusableScenes"];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke;
    v22[3] = &unk_265153F68;
    id v23 = v4;
    long long v24 = &v25;
    [v10 enumerateObjectsUsingBlock:v22];
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  id v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  v15[5] = MEMORY[0x263EF8330];
  v15[6] = 3221225472;
  v15[7] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_2;
  v15[8] = &unk_265154410;
  v15[9] = self;
  v15[10] = &v16;
  v15[11] = &v25;
  AXPerformSafeBlock();
  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSpringBoardDeferral:v11];
  id v12 = (id)v26[5];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  LOBYTE(v19) = 0;
  uint64_t v13 = AXFrontBoardRunningAppProcesses();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_3;
  v15[3] = &unk_265154438;
  v15[4] = &v16;
  [v13 enumerateObjectsUsingBlock:v15];
  if (!*((unsigned char *)v17 + 24) && v9 == v12)
  {
    id v14 = [(SBKeyboardFocusCoordinatorAccessibility *)self _axSpringBoardDeferral];
    [v14 invalidate];

    [(SBKeyboardFocusCoordinatorAccessibility *)self _axSetSpringBoardDeferral:0];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v25, 8);
}

void __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  int v8 = __UIAccessibilityCastAsClass();
  id v9 = [v8 _sceneIdentifier];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) focusLockSpringBoardWindowScene:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forAccessibilityReason:@"Accessibility-FKA"];

  return MEMORY[0x270F9A758]();
}

void __87__SBKeyboardFocusCoordinatorAccessibility__accessibilityFocusOnSpringBoardWithSceneID___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isSystemApplicationProcess] & 1) == 0)
  {
    if ([v5 isApplicationProcess])
    {
      if ([v5 isForeground])
      {
        id v3 = [v5 state];
        uint64_t v4 = [v3 taskState];

        if (v4 == 2) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        }
      }
    }
  }
}

- (void)_accessibilityFocusOnAppWithPid:(int)a3 bundleIdentifier:(id)a4 identifier:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = FKALogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_242561000, v10, OS_LOG_TYPE_INFO, "Focusing on app with bundle identifier: %@, pid: %i", (uint8_t *)&v14, 0x12u);
  }

  id v11 = [MEMORY[0x263F3F4F0] sharedInstance];
  id v12 = [v11 sceneWithIdentifier:v9];

  if (v12)
  {
    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilityUserFocusRequestForScene:v12];
  }
  else
  {
    uint64_t v13 = FKALogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusCoordinatorAccessibility _accessibilityFocusOnAppWithPid:bundleIdentifier:identifier:]((uint64_t)v9, v13);
    }
  }
}

- (BOOL)_accessibilitySwitchNativeFocusedApplicationWithPID:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(SBKeyboardFocusCoordinatorAccessibility *)self suppressKeyboardFocusEvaluationForReason:@"Accessibility-FKA"];
  id v8 = AXFrontBoardRunningAppProcesses();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __106__SBKeyboardFocusCoordinatorAccessibility__accessibilitySwitchNativeFocusedApplicationWithPID_identifier___block_invoke;
  v16[3] = &__block_descriptor_36_e19_B16__0__FBProcess_8l;
  int v17 = v4;
  id v9 = objc_msgSend(v8, "ax_firstObjectUsingBlock:", v16);

  if ([v9 isSystemApplicationProcess]
    && ([v6 containsString:@"SystemAperture"] & 1) == 0)
  {
    id v12 = FKALogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242561000, v12, OS_LOG_TYPE_INFO, "Switching to system application", buf, 2u);
    }

    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilitySetSecondaryKeyboardFocusOverridePid:0 sceneID:0];
    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilityFocusOnSpringBoardWithSceneID:v6];
    goto LABEL_15;
  }
  if (![v9 isApplicationProcess])
  {
    id v11 = FKALogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v4;
      _os_log_impl(&dword_242561000, v11, OS_LOG_TYPE_INFO, "Switching to non-application %i", buf, 8u);
    }

    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilitySetSecondaryKeyboardFocusOverridePid:v4 sceneID:v6];
    goto LABEL_15;
  }
  if (![(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilityIsFocusLockedToSpringBoard])
  {
    uint64_t v13 = FKALogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_242561000, v13, OS_LOG_TYPE_INFO, "Switching to regular application %@", buf, 0xCu);
    }

    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilitySetSecondaryKeyboardFocusOverridePid:0 sceneID:0];
    int v14 = [v9 bundleIdentifier];
    [(SBKeyboardFocusCoordinatorAccessibility *)self _accessibilityFocusOnAppWithPid:v4 bundleIdentifier:v14 identifier:v6];

LABEL_15:
    BOOL v10 = 1;
    goto LABEL_16;
  }
  BOOL v10 = 0;
LABEL_16:
  [v7 invalidate];

  return v10;
}

BOOL __106__SBKeyboardFocusCoordinatorAccessibility__accessibilitySwitchNativeFocusedApplicationWithPID_identifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pid] == *(_DWORD *)(a1 + 32);
}

- (void)_axDeferKeyboardFocusToPid:(uint64_t)a1 sceneID:(uint64_t)a2 forPrimaryOverride:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithInt:a1];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_242561000, a3, OS_LOG_TYPE_DEBUG, "Found nil tokenString for pid: %@ sceneID: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_accessibilityFocusOnAppWithPid:(uint64_t)a1 bundleIdentifier:(NSObject *)a2 identifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242561000, a2, OS_LOG_TYPE_ERROR, "No scene available, can't focus on app %@", (uint8_t *)&v2, 0xCu);
}

@end