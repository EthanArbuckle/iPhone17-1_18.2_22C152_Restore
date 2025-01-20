@interface BLSBacklightFBSSceneEnvironmentDiffAction
- (BLSBacklightFBSSceneEnvironmentDiffActionDelegate)delegate;
- (NSObject)sceneUpdateForUpdatedFBSScene:(void *)a3 fromSettings:(void *)a4 transitionContext:(void *)a5 environment:;
- (id)desiredFidelityRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:;
- (id)frameSpecifiersRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:;
- (void)completeBLSActionsForUpdatedFBSScene:(void *)a3 transitionContext:;
- (void)environmentDiffInspector;
- (void)performActionsForUpdatedFBSScene:(id)a3 settingsDiff:(id)a4 fromSettings:(id)a5 transitionContext:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation BLSBacklightFBSSceneEnvironmentDiffAction

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_diffInspector, 0);
}

void __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((a3 & 0x38) != 0)
  {
    v6 = -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v5, *(void **)(a1 + 56));
    if (v6)
    {
      v7 = bls_scenes_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke_cold_1();
      }

      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      if (a3) {
        goto LABEL_6;
      }
LABEL_11:
      -[BLSBacklightFBSSceneEnvironmentDiffAction completeBLSActionsForUpdatedFBSScene:transitionContext:](*(void *)(a1 + 32), *(void **)(a1 + 40), v5);
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
  }
  os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  if ((a3 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  v9 = bls_scenes_log();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = *(void **)(a1 + 56);
    int v26 = 134218498;
    v27 = v10;
    __int16 v28 = 2114;
    v29 = v6;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1B55DE000, v9, v8, "%p updated with sceneUpdate:%{public}@ environment:%{public}@", (uint8_t *)&v26, 0x20u);
  }

  v11 = [*(id *)(a1 + 56) updater];
  [v11 updatedEnvironmentWithDelta:a3 backlightSceneUpdate:v6];

LABEL_12:
  v16 = -[BLSBacklightFBSSceneEnvironmentDiffAction desiredFidelityRequestForUpdatedFBSScene:fromSettings:transitionContext:](*(void *)(a1 + 32), v12, v13, v5);
  if (v16)
  {
    v17 = bls_scenes_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 56);
      v19 = [v18 identifier];
      int v26 = 134218498;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v19;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1B55DE000, v17, OS_LOG_TYPE_INFO, "%p environment:%{public}@ will perform desiredFidelityRequest:%@", (uint8_t *)&v26, 0x20u);
    }
    v20 = [*(id *)(a1 + 56) updater];
    [v20 performDesiredFidelityRequest:v16];
  }
  v21 = -[BLSBacklightFBSSceneEnvironmentDiffAction frameSpecifiersRequestForUpdatedFBSScene:fromSettings:transitionContext:](*(void *)(a1 + 32), v14, v15, v5);
  if (v21)
  {
    v22 = bls_scenes_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(void **)(a1 + 56);
      v24 = [v23 identifier];
      int v26 = 134218498;
      v27 = v23;
      __int16 v28 = 2114;
      v29 = v24;
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1B55DE000, v22, OS_LOG_TYPE_INFO, "%p environment:%{public}@ will perform frameSpecifiersRequest:%@", (uint8_t *)&v26, 0x20u);
    }
    v25 = [*(id *)(a1 + 56) updater];
    [v25 performFrameSpecifiersRequest:v21];
  }
}

- (void)performActionsForUpdatedFBSScene:(id)a3 settingsDiff:(id)a4 fromSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = -[BLSBacklightFBSSceneEnvironmentDiffAction environmentDiffInspector](self);
  unsigned __int8 v15 = [v14 inspectDiff:v11];
  v16 = [v10 backlightSceneEnvironment];
  v17 = bls_scenes_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v36 = [v16 identifier];
    uint64_t v23 = BLSBacklightFBSSceneEnvironmentDeltaDescription(v15);
    v33 = NSString;
    v35 = (void *)v23;
    v31 = [v16 visualState];
    uint64_t v32 = [v16 presentationDate];
    __int16 v30 = objc_msgSend(v32, "bls_shortLoggingString");
    v34 = [v33 stringWithFormat:@"%@ %@", v31, v30];
    int v26 = NSString;
    __int16 v28 = objc_msgSend(v12, "bls_visualState");
    v29 = objc_msgSend(v12, "bls_presentationDate");
    v25 = objc_msgSend(v29, "bls_shortLoggingString");
    v27 = [v26 stringWithFormat:@"%@ %@", v28, v25];
    [v16 frameSpecifier];
    *(_DWORD *)buf = 134219522;
    v42 = v16;
    __int16 v43 = 2114;
    v44 = v36;
    __int16 v45 = 2114;
    v46 = v35;
    __int16 v47 = 2114;
    id v48 = v11;
    __int16 v49 = 2114;
    v50 = v34;
    __int16 v51 = 2114;
    v52 = v27;
    v54 = __int16 v53 = 2114;
    v24 = (void *)v54;
    _os_log_debug_impl(&dword_1B55DE000, v17, OS_LOG_TYPE_DEBUG, "%p environment updated:%{public}@\n  delta:%{public}@\n  diff:%{public}@\n  new:%{public}@\n  old:%{public}@\n  new:%{public}@", buf, 0x48u);
  }
  v18 = [(BLSBacklightFBSSceneEnvironmentDiffAction *)self delegate];
  if (!v18) {
    v18 = objc_alloc_init(BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate);
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke;
  v37[3] = &unk_1E6107340;
  v37[4] = self;
  id v38 = v10;
  id v39 = v12;
  id v40 = v16;
  uint64_t v19 = v15;
  id v20 = v16;
  id v21 = v12;
  id v22 = v10;
  [(BLSBacklightFBSSceneEnvironmentDiffActionNullDelegate *)v18 performChangesWithTransitionContext:v13 environmentDelta:v19 performActionsBlock:v37];
}

- (void)environmentDiffInspector
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[1];
    if (!v3)
    {
      v4 = objc_alloc_init(BLSBacklightSceneSettingsDiffInspector);
      id v5 = (void *)v2[1];
      v2[1] = v4;

      v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)desiredFidelityRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(a4, "actions", 0);
    id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          os_log_type_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v9 = +[BLSBacklightFBSSceneEnvironmentActionHandler desiredFidelityRequestFromAction:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)frameSpecifiersRequestForUpdatedFBSScene:(uint64_t)a3 fromSettings:(void *)a4 transitionContext:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(a4, "actions", 0);
    id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          os_log_type_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v9 = +[BLSBacklightFBSSceneEnvironmentActionHandler frameSpecifiersRequestFromAction:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BLSBacklightFBSSceneEnvironmentDiffActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSBacklightFBSSceneEnvironmentDiffActionDelegate *)WeakRetained;
}

- (void)completeBLSActionsForUpdatedFBSScene:(void *)a3 transitionContext:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!a1) {
    goto LABEL_43;
  }
  os_log_type_t v8 = [v6 actions];
  uint64_t v9 = [v8 count];

  if (!v9) {
    goto LABEL_43;
  }
  uint64_t v32 = a1;
  v33 = v7;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = [v7 actions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (!v11)
  {
    long long v13 = 0;
    v34 = 0;
    long long v14 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  long long v13 = 0;
  v34 = 0;
  long long v14 = 0;
  uint64_t v15 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = v14;
        uint64_t v19 = v13;
        long long v14 = v17;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = v34;
          uint64_t v19 = v13;
          v34 = v17;
        }
        else
        {
          objc_opt_class();
          v18 = v13;
          uint64_t v19 = v17;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
      }
      id v20 = v17;

      long long v13 = v19;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  }
  while (v12);
LABEL_18:

  id v21 = [v5 backlightSceneEnvironment];
  id v22 = [v21 identifier];
  if (v14)
  {
    int v23 = [v14 canSendResponse];
    v24 = bls_scenes_log();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v40 = v32;
        __int16 v41 = 2114;
        v42 = v22;
        __int16 v43 = 2114;
        v44 = v14;
        _os_log_debug_impl(&dword_1B55DE000, v25, OS_LOG_TYPE_DEBUG, "%p nothing changed in updateAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      v25 = [MEMORY[0x1E4F4F678] response];
      [v14 sendResponse:v25];
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      v42 = v22;
      __int16 v43 = 2114;
      v44 = v14;
      _os_log_impl(&dword_1B55DE000, v25, OS_LOG_TYPE_INFO, "%p nothing changed in updateAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }
  }
  v7 = v33;
  if (v34)
  {
    int v26 = [v34 canSendResponse];
    v27 = bls_scenes_log();
    __int16 v28 = (BLSBacklightSceneUpdateBacklightRampResponse *)v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v40 = v32;
        __int16 v41 = 2114;
        v42 = v22;
        __int16 v43 = 2114;
        v44 = v34;
        _os_log_debug_impl(&dword_1B55DE000, &v28->super.super, OS_LOG_TYPE_DEBUG, "%p nothing changed in rampAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      __int16 v28 = [[BLSBacklightSceneUpdateBacklightRampResponse alloc] initWithRampDuration:0.0];
      [v34 sendResponse:v28];
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      v42 = v22;
      __int16 v43 = 2114;
      v44 = v34;
      _os_log_impl(&dword_1B55DE000, &v28->super.super, OS_LOG_TYPE_INFO, "%p nothing changed in rampAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }
  }
  if (v13)
  {
    int v29 = [v13 canSendResponse];
    __int16 v30 = bls_scenes_log();
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v40 = v32;
        __int16 v41 = 2114;
        v42 = v22;
        __int16 v43 = 2114;
        v44 = v13;
        _os_log_debug_impl(&dword_1B55DE000, v31, OS_LOG_TYPE_DEBUG, "%p nothing changed in animationCompleteAction for %{public}@, completing inline:%{public}@", buf, 0x20u);
      }

      v31 = [MEMORY[0x1E4F4F678] response];
      [v13 sendResponse:v31];
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      v42 = v22;
      __int16 v43 = 2114;
      v44 = v13;
      _os_log_impl(&dword_1B55DE000, v31, OS_LOG_TYPE_INFO, "%p nothing changed in animationCompleteAction for %{public}@, unable to send response:%{public}@", buf, 0x20u);
    }
  }
LABEL_43:
}

- (NSObject)sceneUpdateForUpdatedFBSScene:(void *)a3 fromSettings:(void *)a4 transitionContext:(void *)a5 environment:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v77 = a5;
  if (a1)
  {
    uint64_t v12 = [v9 settings];
    long long v13 = objc_msgSend(v12, "bls_visualState");
    if (!v13)
    {
      v25 = bls_scenes_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = [v77 identifier];
        *(_DWORD *)buf = 134218242;
        id v97 = v77;
        __int16 v98 = 2114;
        v99 = v26;
        _os_log_impl(&dword_1B55DE000, v25, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ settings visualState nil", buf, 0x16u);
      }
      v27 = 0;
      goto LABEL_71;
    }
    v72 = v9;
    v73 = v12;
    v74 = v11;
    v75 = v10;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v14 = [v11 actions];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v92 objects:v108 count:16];
    v76 = v13;
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = 0;
      unint64_t v78 = 0;
      v18 = 0;
      uint64_t v19 = *(void *)v93;
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v93 != v19) {
            objc_enumerationMutation(v14);
          }
          id v21 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v18;
            unint64_t v23 = v17;
            v18 = v21;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v22 = (void *)v78;
              unint64_t v23 = v17;
              unint64_t v78 = (unint64_t)v21;
            }
            else
            {
              objc_opt_class();
              id v22 = (void *)v17;
              unint64_t v23 = (unint64_t)v21;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
          }
          id v24 = v21;

          unint64_t v17 = v23;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v92 objects:v108 count:16];
        if (!v16) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v17 = 0;
    unint64_t v78 = 0;
    v18 = 0;
LABEL_21:

    __int16 v28 = v18;
    uint64_t v29 = [v18 isAnimated];
    uint64_t v30 = v29;
    long long v13 = v76;
    v31 = (void *)v78;
    if (!v18 && v78 | v17)
    {
      uint64_t v32 = bls_scenes_log();
      id v9 = v72;
      id v10 = v75;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:]((uint64_t)v77, v74, v32);
      }

      if (v78)
      {
        v33 = [[BLSBacklightSceneUpdateBacklightRampResponse alloc] initWithRampDuration:0.0];
        [(id)v78 sendResponse:v33];
      }
      if (v17)
      {
        v34 = [MEMORY[0x1E4F4F678] response];
        long long v35 = (void *)v17;
LABEL_39:
        [v35 sendResponse:v34];
        id v39 = 0;
LABEL_69:

        goto LABEL_70;
      }
      goto LABEL_48;
    }
    if (v17) {
      int v36 = 0;
    }
    else {
      int v36 = v29;
    }
    id v9 = v72;
    id v10 = v75;
    if (v36 == 1)
    {
      long long v37 = bls_scenes_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v56 = [v77 identifier];
        v57 = [v74 debugDescription];
        v58 = [v72 debugDescription];
        *(_DWORD *)buf = 134218754;
        id v97 = v77;
        v31 = (void *)v78;
        __int16 v98 = 2114;
        v99 = v56;
        __int16 v100 = 2114;
        id v101 = v57;
        __int16 v102 = 2114;
        v103 = v58;
        _os_log_error_impl(&dword_1B55DE000, v37, OS_LOG_TYPE_ERROR, "%p:%{public}@ scene settings change animated but did not contain animationComplete action, transitionContext:%{public}@ scene:%{public}@", buf, 0x2Au);

        __int16 v28 = v18;
      }

      if (v28)
      {
        long long v38 = [MEMORY[0x1E4F4F678] response];
        [v28 sendResponse:v38];
      }
      if (v31)
      {
        v34 = [[BLSBacklightSceneUpdateBacklightRampResponse alloc] initWithRampDuration:0.0];
        long long v35 = v31;
        goto LABEL_39;
      }
LABEL_48:
      id v39 = 0;
LABEL_70:
      v25 = v39;

      v27 = v25;
      uint64_t v12 = v73;
      id v11 = v74;
LABEL_71:

      goto LABEL_72;
    }
    uint64_t v70 = objc_msgSend(v75, "bls_visualState");
    uint64_t v40 = [v77 frameSpecifier];
    objc_msgSend(v40, "setGrantedFidelity:", objc_msgSend(v76, "updateFidelity"));
    v69 = [v18 event];
    v71 = v40;
    if (!v40)
    {
      __int16 v41 = [v77 presentationDate];
      if (v41)
      {
        v42 = bls_scenes_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[BLSBacklightFBSSceneEnvironmentDiffAction sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:]();
        }

        __int16 v28 = v18;
      }
    }
    if (v28)
    {
      __int16 v43 = v89;
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10;
      v89[3] = &unk_1E6106FA8;
      v67 = &v90;
      id v90 = v28;
      v44 = (id *)&v91;
      __int16 v45 = v77;
      uint64_t v46 = (id *)&v91;
    }
    else
    {
      __int16 v43 = v85;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12;
      v85[3] = &unk_1E6107388;
      v67 = &v86;
      id v86 = v77;
      uint64_t v46 = &v87;
      id v87 = v76;
      v44 = (id *)&v88;
      __int16 v45 = v71;
    }
    v65 = v44;
    id *v44 = v45;
    v68 = (void *)MEMORY[0x1BA99C630](v43);
    if (v78)
    {
      __int16 v47 = v82;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_13;
      v82[3] = &unk_1E61073B0;
      v62 = &v83;
      id v83 = (id)v78;
      v61 = &v84;
      id v84 = v77;
    }
    else
    {
      __int16 v47 = 0;
    }
    id v48 = (void *)MEMORY[0x1BA99C630](v47);
    if (v17) {
      int v49 = v30;
    }
    else {
      int v49 = 0;
    }
    v66 = v46;
    if (v49 == 1)
    {
      [v77 setAnimatingVisualState:1];
    }
    else if (!v17)
    {
      v50 = 0;
      goto LABEL_60;
    }
    v50 = v79;
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15;
    v79[3] = &unk_1E6106FA8;
    v64 = &v80;
    id v80 = v77;
    v63 = &v81;
    id v81 = (id)v17;
LABEL_60:
    __int16 v51 = (void *)MEMORY[0x1BA99C630](v50);
    v52 = [BLSBacklightSceneUpdate alloc];
    char v53 = [v18 isTouchTargetable];
    BYTE1(v60) = [v18 isUpdateToDateSpecifier];
    LOBYTE(v60) = v53;
    long long v13 = v76;
    id v39 = -[BLSBacklightSceneUpdate initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:](v52, "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", v77, v76, v70, v71, v30, v69, v60, v68, v48, v51);
    uint64_t v54 = bls_scenes_log();
    v31 = (void *)v78;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      v59 = [v77 identifier];
      *(_DWORD *)buf = 134219266;
      id v97 = v77;
      __int16 v98 = 2114;
      v99 = v59;
      __int16 v100 = 2112;
      id v101 = v39;
      __int16 v102 = 2112;
      v103 = v18;
      __int16 v104 = 2112;
      unint64_t v105 = v78;
      __int16 v106 = 2112;
      unint64_t v107 = v17;
      _os_log_debug_impl(&dword_1B55DE000, v54, OS_LOG_TYPE_DEBUG, "%p:%{public}@ created sceneUpdate %@ from actions\n\t%@\n\t%@\n\t%@", buf, 0x3Eu);

      long long v13 = v76;
    }

    if (v17)
    {
    }
    __int16 v28 = v18;
    if (v78)
    {
    }
    id v10 = v75;
    v34 = (BLSBacklightSceneUpdateBacklightRampResponse *)v70;
    if (!v18) {

    }
    goto LABEL_69;
  }
  v27 = 0;
LABEL_72:

  return v27;
}

uint64_t __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke()
{
  return objc_opt_class();
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) canSendResponse];
  v4 = bls_scenes_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10_cold_1();
    }

    id v6 = *v2;
    id v5 = [MEMORY[0x1E4F4F678] response];
    [v6 sendResponse:v5];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 40);
    os_log_type_t v8 = [v7 identifier];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134218498;
    id v11 = v7;
    __int16 v12 = 2114;
    long long v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send response to updateAction:%{public}@", (uint8_t *)&v10, 0x20u);
  }
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12(uint64_t a1)
{
  v2 = bls_scenes_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12_cold_1(a1, v2);
  }
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_13(uint64_t a1, double a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v4 = [*(id *)(a1 + 32) canSendResponse];
  id v5 = bls_scenes_log();
  id v6 = (BLSBacklightSceneUpdateBacklightRampResponse *)v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v11 = *(void **)(a1 + 40);
      __int16 v12 = [v11 identifier];
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 134218754;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      unint64_t v17 = v12;
      __int16 v18 = 2048;
      double v19 = a2;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_debug_impl(&dword_1B55DE000, &v6->super.super, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will send duration:%lf response to rampAction:%{public}@", (uint8_t *)&v14, 0x2Au);
    }
    v7 = *(void **)(a1 + 32);
    id v6 = [[BLSBacklightSceneUpdateBacklightRampResponse alloc] initWithRampDuration:a2];
    [v7 sendResponse:v6];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v8 identifier];
    uint64_t v10 = *(void *)(a1 + 32);
    int v14 = 134218754;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    unint64_t v17 = v9;
    __int16 v18 = 2048;
    double v19 = a2;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    _os_log_impl(&dword_1B55DE000, &v6->super.super, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send duration:%lf response to rampAction:%{public}@", (uint8_t *)&v14, 0x2Au);
  }
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void **)(a1 + 32);
  [*(id *)(a1 + 32) setAnimatingVisualState:0];
  int v4 = *(void **)(a1 + 40);
  int v3 = (void **)(a1 + 40);
  int v5 = [v4 canSendResponse];
  id v6 = bls_scenes_log();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15_cold_1();
    }

    os_log_type_t v8 = *v3;
    v7 = [MEMORY[0x1E4F4F678] response];
    [v8 sendResponse:v7];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *v2;
    uint64_t v10 = [v9 identifier];
    id v11 = *v3;
    int v12 = 134218498;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    unint64_t v17 = v11;
    _os_log_impl(&dword_1B55DE000, v7, OS_LOG_TYPE_INFO, "%p:%{public}@ unable to send response to animationCompleteAction:%{public}@", (uint8_t *)&v12, 0x20u);
  }
}

void __122__BLSBacklightFBSSceneEnvironmentDiffAction_performActionsForUpdatedFBSScene_settingsDiff_fromSettings_transitionContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = [*v2 identifier];
  int v4 = 138412546;
  int v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_DEBUG, "FBSSceneDiffAction.performActionsForUpdatedFBSScene: got sceneUpdate from sceneSettings for %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)sceneUpdateForUpdatedFBSScene:(NSObject *)a3 fromSettings:transitionContext:environment:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = [a2 actions];
  __int16 v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_3);
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  int v12 = v6;
  _os_log_error_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_ERROR, "%p scene settings change did not contain an update action, but did contain a ramp or animation complete action \nenvironment:%{public}@ \nactions:%{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)sceneUpdateForUpdatedFBSScene:fromSettings:transitionContext:environment:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  int v3 = v2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [v2 identifier];
  int v5 = objc_msgSend(v1, "bls_shortLoggingString");
  __int16 v6 = [v3 alwaysOnSession];
  int v7 = 134218754;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  int v12 = v5;
  __int16 v13 = 2114;
  __int16 v14 = v6;
  _os_log_error_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_ERROR, "%p:%{public}@ unexpectedly nil frameSpecifier. presentationDate:%{public}@ alwaysOnSession:%{public}@", (uint8_t *)&v7, 0x2Au);
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = [*(id *)(v0 + 40) identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1B55DE000, v2, v3, "%p:%{public}@ will send response to updateAction:%{public}@", v4, v5, v6, v7, v8);
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "bls_shortLoggingString");
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = 134218754;
  __int16 v9 = v4;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  __int16 v12 = 2114;
  __int16 v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v7;
  _os_log_debug_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_DEBUG, "%p:%{public}@ bare scene update complete visualState:%{public}@ frameSpecifier:%{public}@", (uint8_t *)&v8, 0x2Au);
}

void __118__BLSBacklightFBSSceneEnvironmentDiffAction_sceneUpdateForUpdatedFBSScene_fromSettings_transitionContext_environment___block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = [*v0 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1B55DE000, v2, v3, "%p:%{public}@ will send response to animationCompleteAction:%{public}@", v4, v5, v6, v7, v8);
}

@end