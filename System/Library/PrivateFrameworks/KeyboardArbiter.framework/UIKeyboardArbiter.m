@interface UIKeyboardArbiter
@end

@implementation UIKeyboardArbiter

void __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    goto LABEL_4;
  }
  v2 = [getFBSceneManagerClass() sharedInstance];
  v3 = [v2 sceneFromIdentityToken:*(void *)(a1 + 32)];

  if (!v3
    || ([v3 settings],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 displayConfiguration],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
LABEL_4:
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v6 = (void *)getFBDisplayManagerClass_softClass;
    uint64_t v30 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getFBDisplayManagerClass_block_invoke;
      v26[3] = &unk_264721890;
      v26[4] = &v27;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v26);
      v6 = (void *)v28[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v27, 8);
    v5 = [v7 mainConfiguration];
  }
  v8 = [getFBSceneManagerClass() keyboardScene];
  [v5 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v17 = [v8 settings];
  v18 = [v17 displayConfiguration];
  [v18 bounds];
  v32.origin.x = v19;
  v32.origin.y = v20;
  v32.size.width = v21;
  v32.size.height = v22;
  v31.origin.x = v10;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v16;
  BOOL v23 = CGRectEqualToRect(v31, v32);

  if (!v23)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke_2;
    v24[3] = &unk_264721550;
    id v25 = v5;
    [v8 updateSettingsWithBlock:v24];
  }
}

void __35___UIKeyboardArbiter_initWithLink___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 state];
  double v9 = [v8 endowmentNamespaces];
  unsigned int v10 = [v9 containsObject:*MEMORY[0x263F3F620]];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = [v7 pid];

  CGFloat v12 = [v6 state];
  if ([v12 taskState] == 4) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = 0;
  }
  CGFloat v14 = [v6 state];

  objc_msgSend(WeakRetained, "processWithPID:foreground:suspended:", v11, v13, objc_msgSend(v14, "taskState") == 3);
}

void __55___UIKeyboardArbiter_applySceneFocusChange_forRequest___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1[4]
    && (id v2 = a1[5]) != 0
    && ([v2 _isFocusNothing] & 1) == 0
    && (id v3 = a1[6],
        [a1[5] sceneIdentity],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v3 _handleForSceneIdentity:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = a1[6];
    id v16 = 0;
    id v7 = [v6 _activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:&v16];
    id v8 = v16;
    memset(v19, 0, sizeof(v19));
    double v9 = _UIArbiterLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    unsigned int v10 = [a1[5] sceneIdentity];
    int v17 = 138543362;
    v18 = v10;
    LODWORD(v15) = 12;
    uint64_t v11 = (_OWORD *)_os_log_send_and_compose_impl();

    CGFloat v12 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v19];
    [v12 infoWithMessage:v13];

    if (v11 != v19) {
      free(v11);
    }
    objc_msgSend(a1[6], "_focusSceneHandle:previousHostFocusHandle:previousLeafFocusHandle:shouldStealKeyboardOnSuccess:", v5, v7, v8, objc_msgSend(a1[4], "shouldStealKeyboardOnSuccess"));
  }
  else
  {
    id v14 = a1[6];
    [v14 _invalidateFocus];
  }
}

void __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) handlerForPID:*(unsigned int *)(a1 + 40)];
  char v3 = [v2 running];
  [v2 setRunning:*(unsigned char *)(a1 + 44) == 0];
  int v4 = [v2 running];
  if (v3)
  {
    if (v4) {
      goto LABEL_29;
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v5 = _UIArbiterLog();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    int v52 = 138412290;
    id v53 = v2;
    LODWORD(v48) = 12;
    id v6 = (long long *)_os_log_send_and_compose_impl();

    id v7 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v8 = (void *)[[NSString alloc] initWithUTF8String:&v54];
    [v7 debugWithMessage:v8];

    if (v6 != &v54) {
      free(v6);
    }
    [v2 clearAcquiringFocus];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));

    BOOL v10 = WeakRetained == v2;
    if (WeakRetained == v2)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      CGFloat v12 = [MEMORY[0x263F83020] informationForKeyboardDown];
      [v11 updateKeyboardStatus:v12 fromHandler:v2];

      objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), 0);
      if ([v2 isViewService]) {
        [v2 activeProcessResign];
      }
    }
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));

    if (v2 == v13)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), 0);
      BOOL v10 = 1;
    }
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));

    if (v2 == v14)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 96), 0);
      BOOL v10 = 1;
    }
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 112);
    id v16 = [v2 remoteFocusContext];
    int v17 = [v16 sceneIdentity];
    v18 = [v17 stringRepresentation];
    LODWORD(v15) = [v15 containsObject:v18];

    if (v15)
    {
      CGFloat v19 = *(void **)(*(void *)(a1 + 32) + 112);
      uint64_t v20 = [v2 remoteFocusContext];
      CGFloat v21 = [v20 sceneIdentity];
      CGFloat v22 = [v21 stringRepresentation];
      [v19 removeObject:v22];
    }
    else if (!v10)
    {
      goto LABEL_29;
    }
    [*(id *)(a1 + 32) reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:0];
  }
  else if (v4)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    BOOL v23 = _UIArbiterLog();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    int v52 = 138412290;
    id v53 = v2;
    LODWORD(v48) = 12;
    v24 = (long long *)_os_log_send_and_compose_impl();

    id v25 = +[_UIKeyboardArbiterDebug sharedInstance];
    v26 = (void *)[[NSString alloc] initWithUTF8String:&v54];
    [v25 debugWithMessage:v26];

    if (v24 != &v54) {
      free(v24);
    }
    id v27 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));

    if (v2 == v27)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      CGRect v31 = _UIArbiterLog();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
      int v52 = 138412290;
      id v53 = v2;
      LODWORD(v48) = 12;
      CGRect v32 = (long long *)_os_log_send_and_compose_impl();

      v33 = +[_UIKeyboardArbiterDebug sharedInstance];
      v34 = (void *)[[NSString alloc] initWithUTF8String:&v54];
      [v33 debugWithMessage:v34];

      if (v32 != &v54) {
        free(v32);
      }
    }
    else
    {
      v28 = [*(id *)(a1 + 32) lastUpdate];
      uint64_t v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v30 = [MEMORY[0x263F83020] informationForKeyboardDown];
      }
      v35 = v30;

      if (![v2 isViewService]
        || ([v35 sourceBundleIdentifier],
            v36 = objc_claimAutoreleasedReturnValue(),
            char v37 = [v36 isEqualToString:@"com.apple.Spotlight"],
            v36,
            (v37 & 1) == 0))
      {
        v38 = *(void **)(a1 + 32);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke_158;
        v49[3] = &unk_2647215C0;
        id v50 = v2;
        id v51 = v35;
        [v38 runOperations:v49 onHandler:v50 fromFunction:"-[_UIKeyboardArbiter processWithPID:foreground:suspended:]_block_invoke_2"];
      }
    }
  }
LABEL_29:
  id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));

  if (v39 == v2)
  {
    if (*(unsigned char *)(a1 + 45))
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v40 = _UIArbiterLog();
      os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
      int v52 = 138412290;
      id v53 = v2;
      LODWORD(v48) = 12;
      v41 = (long long *)_os_log_send_and_compose_impl();

      v42 = +[_UIKeyboardArbiterDebug sharedInstance];
      v43 = (void *)[[NSString alloc] initWithUTF8String:&v54];
      [v42 debugWithMessage:v43];

      if (v41 != &v54) {
        free(v41);
      }
      [v2 uncacheWindowContext];
    }
    else
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v44 = _UIArbiterLog();
      os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
      int v52 = 138412290;
      id v53 = v2;
      LODWORD(v48) = 12;
      v45 = (long long *)_os_log_send_and_compose_impl();

      v46 = +[_UIKeyboardArbiterDebug sharedInstance];
      v47 = (void *)[[NSString alloc] initWithUTF8String:&v54];
      [v46 debugWithMessage:v47];

      if (v45 != &v54) {
        free(v45);
      }
      [v2 cacheWindowContext];
    }
  }
}

uint64_t __47___UIKeyboardArbiter_updateInterestedBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
  id obj = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(obj);
  [*((id *)a1[4] + 3) addObject:a1[5]];
  [a1[4] updateInterestedBundleIDs];
  [a1[6] resume];
  id v2 = (void *)*((void *)a1[4] + 23);
  char v3 = [a1[5] bundleIdentifier];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    (*(void (**)(void))(*((void *)a1[4] + 24) + 16))();
    int v4 = a1[4];
    v5 = (void *)v4[23];
    v4[23] = 0;

    id v6 = a1[4];
    id v7 = (void *)v6[24];
    v6[24] = 0;
  }
  objc_sync_exit(obj);
}

uint64_t __35___UIKeyboardArbiter_initWithLink___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sceneLink];
  [v2 connectWithQueue:*(void *)(*(void *)(a1 + 32) + 8)];

  char v3 = *(void **)(a1 + 32);
  return [v3 attemptConnection];
}

void __35___UIKeyboardArbiter_initWithLink___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [MEMORY[0x263F645E8] descriptor];
  [v4 setValues:5];
  v8[0] = *MEMORY[0x263F3F620];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v4 setEndowmentNamespaces:v5];

  [v3 setStateDescriptor:v4];
  [v3 setServiceClass:33];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke_3;
  v6[3] = &unk_264721218;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  [v3 setUpdateHandler:v6];
  objc_destroyWeak(&v7);
}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!a2) {
    a2 = &unk_26D894A18;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!a2) {
    a2 = &unk_26D894A30;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  id v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) arrayByAddingObjectsFromArray:*(void *)(*(void *)(a1[6] + 8) + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __42___UIKeyboardArbiter_captureStateForDebug__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) retrieveClientDebugInformationWithCompletion:a2];
}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _descriptionWithScene:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_2;
  v7[3] = &unk_2647212E0;
  id v8 = v4;
  id v9 = v3;
  id v5 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = @"Description";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [*(id *)(a1 + 40) _descriptionWithScene:0];
  }
  v8[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 addObject:v6];

  if (!v3) {
}
  }

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(*(void *)(a1 + 40) + 8);
  id v14 = v6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_5;
  v15[3] = &unk_264721308;
  id v16 = v5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_7;
  v11[3] = &unk_264721380;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  AsyncTaskWithTimeout(v7, v8, v15, v11);
}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_6;
  v6[3] = &unk_264721358;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "queue_getDebugInfoWithCompletion:", v6);
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    a2 = &unk_26D8949F0;
  }
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, a2);
}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = *(void **)(a1 + 32);
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }
  else {
    [v3 setObject:@"Timed out/hung" forKey:@"Process"];
  }
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __39___UIKeyboardArbiter_attemptConnection__block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    id v3 = _UIArbiterLog();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    v12[0] = 0;
    LODWORD(v10) = 2;
    id v4 = (_OWORD *)_os_log_send_and_compose_impl();

    id v5 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v6 = (void *)[[NSString alloc] initWithUTF8String:v13];
    [v5 errorWithMessage:v6];

    if (v4 != v13) {
      free(v4);
    }
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39___UIKeyboardArbiter_attemptConnection__block_invoke_115;
    block[3] = &unk_2647211F0;
    block[4] = v8;
    dispatch_after(v7, v9, block);
  }
}

uint64_t __39___UIKeyboardArbiter_attemptConnection__block_invoke_115(uint64_t a1)
{
  return [*(id *)(a1 + 32) attemptConnection];
}

void __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v18, 0, sizeof(v18));
  id v3 = a2;
  id v4 = _UIArbiterLog();
  os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v12 = 136315650;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  __int16 v16 = 2112;
  id v17 = v3;
  LODWORD(v11) = 32;
  dispatch_time_t v7 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v8 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v9 = [NSString alloc];

  uint64_t v10 = (void *)[v9 initWithUTF8String:v18];
  [v8 errorWithMessage:v10];

  if (v7 != v18) {
    free(v7);
  }
}

uint64_t __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke_118(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 releaseProcessAssertion];
}

void __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 136) == *(_DWORD *)(a1 + 40))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = *(id *)(v1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(id *)(*((void *)&v22 + 1) + 8 * v7);
          if ([v8 active])
          {
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
            if (v8 == WeakRetained
              || ([v8 running] & 1) != 0
              || [v8 hasHostedPids])
            {
            }
            else
            {
              id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

              if (v8 != v10)
              {
                memset(v30, 0, sizeof(v30));
                uint64_t v11 = _UIArbiterLog();
                os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
                int v12 = objc_opt_class();
                int v26 = 138412546;
                id v27 = v12;
                __int16 v28 = 2112;
                id v29 = v8;
                id v13 = v12;
                LODWORD(v21) = 22;
                __int16 v14 = (_OWORD *)_os_log_send_and_compose_impl();

                uint64_t v15 = +[_UIKeyboardArbiterDebug sharedInstance];
                __int16 v16 = (void *)[[NSString alloc] initWithUTF8String:v30];
                [v15 errorWithMessage:v16];

                if (v14 != v30) {
                  free(v14);
                }
                id v17 = [v8 sceneLayer];
                uint64_t v18 = [v17 contextID];
                uint64_t v19 = [v8 remoteFocusContext];
                [v8 setWindowContextID:v18 focusContext:v19 windowState:0 withLevel:0.0];

                [*(id *)(a1 + 32) runOperations:&__block_literal_global_0 onHandler:v8 fromFunction:"-[_UIKeyboardArbiter scheduleWindowTimeout]_block_invoke_2"];
              }
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v20 = [v3 countByEnumeratingWithState:&v22 objects:v31 count:16];
        uint64_t v5 = v20;
      }
      while (v20);
    }
  }
}

uint64_t __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke_119(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardChangedWithCompletion:");
}

void __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke_2;
  v8[3] = &unk_2647213A8;
  id v9 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  [v4 runOperations:v8 onHandler:v7 fromFunction:"-[_UIKeyboardArbiter updateKeyboardUIStatus:fromHandler:]_block_invoke"];
}

void __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 wantsFence];
  uint64_t v9 = 48;
  if (v8) {
    uint64_t v9 = 40;
  }
  id v11 = (id)[*(id *)(a1 + v9) copy];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 32));
  [v11 setIsLocal:WeakRetained == *(id *)(a1 + 32)];

  objc_msgSend(v7, "queue_keyboardUIDidChange:onComplete:", v11, v6);
}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isViewService]
    || ([*(id *)(a1 + 40) sourceBundleIdentifier],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isEqualToString:@"com.apple.Spotlight"],
        v2,
        (v3 & 1) == 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_2;
    v7[3] = &unk_264721490;
    uint64_t v4 = *(void **)(a1 + 48);
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 72);
    [v4 runOperations:v7 onHandler:*(void *)(a1 + 32) fromFunction:"-[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:]_block_invoke"];
  }
}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (![*(id *)(a1 + 32) resizing]
    || [*(id *)(a1 + 40) active])
  {
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6 == *(void **)(a1 + 48) || ![v6 wantsFence]) {
      id v7 = (void *)(a1 + 64);
    }
    else {
      id v7 = (void *)(a1 + 56);
    }
    objc_msgSend(v8, "queue_keyboardChanged:onComplete:", *v7, v5);
  }
}

uint64_t __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_endInputSessionWithCompletion:");
}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_4(void *a1)
{
  id v2 = (id)a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 32));

  if (v2 != WeakRetained)
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 16);
    v4();
  }
}

uint64_t __63___UIKeyboardArbiter_completeKeyboardStatusChangedFromHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardChangedWithCompletion:");
}

void __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v14 = a1;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v3 isHandlerShowableWithHandler:v9])
        {
          id v10 = *(void **)(v14 + 40);
          id v11 = NSNumber;
          [v9 iavHeight];
          id v12 = objc_msgSend(v11, "numberWithDouble:");
          id v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "processIdentifier"));
          [v10 setObject:v12 forKey:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

uint64_t __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardIAVChanged:onComplete:", *(double *)(a1 + 32));
}

void __56___UIKeyboardArbiter_handleUnexpectedDeallocForHandler___block_invoke(uint64_t a1)
{
  id obj = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 32) clearAcquiringFocus];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  id v3 = *(id *)(a1 + 32);

  if (WeakRetained == v3) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 32), 0);
  }
  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v5 = *(id *)(a1 + 32);

  if (v4 == v5) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), 0);
  }
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 96));
  id v7 = *(id *)(a1 + 32);

  if (v6 == v7) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 96), 0);
  }
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  id v9 = *(id *)(a1 + 32);

  if (v8 == v9) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 104), 0);
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 240));
  id v11 = *(id *)(a1 + 32);

  if (v10 == v11) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 240), 0);
  }
  objc_sync_exit(obj);
}

void __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
}

uint64_t __53___UIKeyboardArbiter_updateSuppression_ofPID_active___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_keyboardSuppressed:withCompletion:", *(unsigned __int8 *)(a1 + 32), a3);
}

void __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) wantsFence])
  {
    objc_msgSend(v7, "queue_keyboardChanged:onComplete:", *(void *)(a1 + 40), v5);
  }
  else
  {
    id v6 = (void *)[*(id *)(a1 + 40) copyWithoutFence];
    objc_msgSend(v7, "queue_keyboardChanged:onComplete:", v6, v5);
  }
}

uint64_t __65___UIKeyboardArbiter_transition_eventStage_withInfo_fromHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_keyboardTransition:event:withInfo:onComplete:", a1[4], a1[6], a1[5], a3);
}

uint64_t __64___UIKeyboardArbiter_handlerRequestedFocus_shouldStealKeyboard___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_sceneBecameFocused:withCompletion:", 0, a3);
}

void __70___UIKeyboardArbiter_handlerRequestedForcedClientSceneIdentityUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 remoteFocusContext];
  id v7 = [v8 sceneIdentity];
  objc_msgSend(v6, "queue_sceneBecameFocused:withCompletion:", v7, v5);
}

void __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F83DB0] code:a2 userInfo:0];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeKeyboardStatusChangedFromHandler:*(void *)(a1 + 40)];
}

uint64_t __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_setKeyboardDisabled:withCompletion:", *(unsigned __int8 *)(a1 + 32), a3);
}

uint64_t __77___UIKeyboardArbiter_signalEventSourceChanged_fromHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_setLastEventSource:withCompletion:", *(void *)(a1 + 32), a3);
}

uint64_t __50___UIKeyboardArbiter__previouslyFocusedHostHandle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteFocusContext];
  id v4 = [v3 sceneIdentity];
  id v5 = [v4 stringRepresentation];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __83___UIKeyboardArbiter_keyboardFocusDidChangeWithoutAdvisorInputToPid_sceneIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:pid:sceneIdentity:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
}

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 40);
  memset(v23, 0, sizeof(v23));
  id v3 = _UIArbiterLog();
  os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  id v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  int v19 = 138412546;
  uint64_t v20 = v4;
  __int16 v21 = 2112;
  uint64_t v22 = v5;
  id v6 = v4;
  LODWORD(v14) = 22;
  id v7 = (_OWORD *)_os_log_send_and_compose_impl();

  id v8 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v9 = (void *)[[NSString alloc] initWithUTF8String:v23];
  [v8 debugWithMessage:v9];

  if (v7 != v23) {
    free(v7);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_191;
  block[3] = &unk_264721728;
  uint64_t v12 = *(void *)(a1 + 48);
  id v16 = v2;
  uint64_t v17 = v12;
  block[4] = v10;
  char v18 = *(unsigned char *)(a1 + 56);
  id v13 = v2;
  dispatch_async(v11, block);
}

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_191(uint64_t a1)
{
  id v20 = *(id *)(a1 + 48);
  if ([v20 prevActiveIdentifier])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    int v3 = [WeakRetained prevActiveIdentifier];

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      [v4 prevActiveIdentifier];
      uint64_t v5 = [MEMORY[0x263EFF980] array];
      if ([v4 prevActiveIdentifier])
      {
        while (([v5 containsObject:v4] & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "handlerForPID:", objc_msgSend(v4, "prevActiveIdentifier"));
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          if (v6 == v20)
          {
            objc_msgSend(v4, "setPrevActiveIdentifier:", objc_msgSend(v20, "prevActiveIdentifier"));

            break;
          }
          [v5 addObject:v4];

          id v4 = v6;
          if (![v6 prevActiveIdentifier]) {
            goto LABEL_10;
          }
        }
      }
      id v6 = v4;
LABEL_10:
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v20];
  [*(id *)(a1 + 32) updateInterestedBundleIDs];
  if (([v20 inputUIHost] & 1) == 0) {
    [v20 clearAcquiringFocus];
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));

  if (v20 == v7)
  {
    id v8 = [MEMORY[0x263F83020] informationForKeyboardDown];
    id v9 = [v20 bundleIdentifier];
    [v8 setSourceBundleIdentifier:v9];

    [*(id *)(a1 + 32) updateKeyboardStatus:v8 fromHandler:v20];
    uint64_t v10 = [MEMORY[0x263F828C0] sharedInputModeController];
    if ([v10 deviceStateIsLocked])
    {
      id v11 = [v20 bundleIdentifier];
      char v12 = [v11 isEqualToString:@"com.apple.Spotlight"];

      if ((v12 & 1) == 0)
      {
        int v13 = [v20 processIdentifier];
LABEL_19:
        *(_DWORD *)(*(void *)(a1 + 32) + 200) = v13;
        objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), 0);

        goto LABEL_20;
      }
    }
    else
    {
    }
    int v13 = 0;
    goto LABEL_19;
  }
LABEL_20:
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));

  if (v20 == v14) {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 96), 0);
  }
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));

  if (v20 == v15) {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), 0);
  }
  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));

  if (v20 == v16)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 240), 0);
    uint64_t v17 = *(void *)(a1 + 32);
    char v18 = *(void **)(v17 + 176);
    *(void *)(v17 + 176) = 0;
  }
  [*(id *)(a1 + 32) reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:0];
  [*(id *)(a1 + 40) setExportedObject:0];
  [v20 invalidate];
  if (*(unsigned char *)(a1 + 56))
  {
    int v19 = +[_UIKeyboardArbiterDebug sharedInstance];
    [v19 setPause:0];
  }
}

void __41___UIKeyboardArbiter_unitTestEnvironment__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_2 = [v0 isEqualToString:@"com.ios.uikit.TestingHarness"];
}

@end