@interface WFOpenAppAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSString)associatedAppBundleIdentifier;
- (void)finishRunningWithNoAppError;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFOpenAppAction

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  v5 = (objc_class *)MEMORY[0x263F86EE8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v9 = [(WFOpenAppAction *)self associatedAppBundleIdentifier];
  v8 = (void *)[v7 initWithBundleIdentifier:v9];
  (*((void (**)(id, void *))a3 + 2))(v6, v8);
}

- (NSString)associatedAppBundleIdentifier
{
  v2 = [(WFOpenAppAction *)self parameterStateForKey:@"WFSelectedApp"];
  v3 = [v2 value];
  v4 = [v3 bundleIdentifier];

  v5 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v4];
  id v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  id v7 = [v6 resolvedAppMatchingDescriptor:v5];

  v8 = [v7 bundleIdentifier];

  return (NSString *)v8;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"WFSelectedApp"])
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    v11 = [v10 value];

    v12 = [v11 bundleIdentifier];
    [(WFOpenAppAction *)self setSupplementalParameterValue:v12 forKey:@"WFAppIdentifier"];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFOpenAppAction;
  BOOL v13 = [(WFOpenAppAction *)&v15 setParameterState:v6 forKey:v7];

  return v13;
}

- (void)finishRunningWithNoAppError
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F870B8];
  uint64_t v8 = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"Open App failed because it couldn’t find an app to open.");
  v9[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v3 errorWithDomain:v4 code:5 userInfo:v6];

  [(WFOpenAppAction *)self finishRunningWithError:v7];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFOpenAppAction *)self parameterValueForKey:@"WFSelectedApp" ofClass:objc_opt_class()];
  id v6 = [v5 bundleIdentifier];
  if (v6)
  {
LABEL_2:
    id v7 = [(WFOpenAppAction *)self userInterface];
    if ([v7 isRunningWithSiriUI])
    {
      id v8 = (id)[objc_alloc(MEMORY[0x263F853E8]) initWithBundleIdentifier:v6];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke;
      v49[3] = &unk_264E59890;
      v49[4] = self;
      if (([v7 performSiriRequest:v8 completionHandler:v49] & 1) == 0)
      {
        id v9 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
        [(WFOpenAppAction *)self finishRunningWithError:v9];
      }
LABEL_27:

      goto LABEL_28;
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v10 = [MEMORY[0x263F85258] currentDevice];
    if ([v10 idiom] == 1)
    {
      v11 = [(WFOpenAppAction *)self parameterValueForKey:@"WFOpenInSlideOver" ofClass:objc_opt_class()];
      int v12 = [v11 BOOLValue];

      if (v12)
      {
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2020000000;
        BOOL v13 = (id *)getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr;
        uint64_t v53 = getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr;
        if (!getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_block_invoke;
          v55 = &unk_264E5EC88;
          v56 = &v50;
          v14 = SpringBoardServicesLibrary_26768();
          objc_super v15 = dlsym(v14, "SBSOpenApplicationLayoutRoleSideNarrowOverlay");
          *(void *)(v56[1] + 24) = v15;
          getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr = *(void *)(v56[1] + 24);
          BOOL v13 = (id *)v51[3];
        }
        _Block_object_dispose(&v50, 8);
        if (!v13)
        {
          v41 = [MEMORY[0x263F08690] currentHandler];
          v42 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLayoutRoleSideNarrowOverlay(void)"];
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"WFOpenAppAction.m", 31, @"%s", dlerror());

          goto LABEL_38;
        }
LABEL_18:
        id v21 = *v13;
        v22 = getSBSOpenApplicationOptionKeyLayoutRole_26773();
        [v8 setObject:v21 forKey:v22];

        v23 = [(WFOpenAppAction *)self userInterface];
        LODWORD(v22) = [v23 progressIsPersistentInSystemAperture];

        if (!v22)
        {
LABEL_23:
          [v8 setObject:&unk_26F075660 forKey:*MEMORY[0x263F3F5B8]];
          if ([MEMORY[0x263F86920] deviceSupportsSystemAssistantExperience]) {
            uint64_t v27 = _os_feature_enabled_impl();
          }
          else {
            uint64_t v27 = 0;
          }
          v28 = (void *)[objc_alloc(MEMORY[0x263F33710]) initWithBundleIdentifier:v6 options:v8 URL:0 userActivity:0 retainsSiri:v27];
          [v28 setRequiresUserFacingApp:1];
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_195;
          aBlock[3] = &unk_264E598B8;
          aBlock[4] = self;
          id v29 = v28;
          id v47 = v29;
          id v48 = v6;
          v30 = _Block_copy(aBlock);
          v31 = [(WFOpenAppAction *)self runningDelegate];
          [v31 action:self didDecideRunningProgressIsAllowed:0];

          v32 = [(WFOpenAppAction *)self userInterface];
          [v32 applicationWillLaunchInForeground];

          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_4;
          v43[3] = &unk_264E5B198;
          v43[4] = self;
          id v44 = v29;
          id v45 = v30;
          id v33 = v30;
          id v34 = v29;
          [v34 performWithCompletionHandler:v43];

          goto LABEL_27;
        }
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2020000000;
        v24 = (void *)getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
        uint64_t v53 = getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
        if (!getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_block_invoke;
          v55 = &unk_264E5EC88;
          v56 = &v50;
          v25 = SpringBoardServicesLibrary_26768();
          v26 = dlsym(v25, "SBSOpenApplicationLaunchOriginActionButton");
          *(void *)(v56[1] + 24) = v26;
          getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr = *(void *)(v56[1] + 24);
          v24 = (void *)v51[3];
        }
        _Block_object_dispose(&v50, 8);
        if (v24)
        {
          [v8 setObject:*v24 forKey:*MEMORY[0x263F3F5C0]];
          goto LABEL_23;
        }
        v39 = [MEMORY[0x263F08690] currentHandler];
        v40 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLaunchOriginActionButton(void)"];
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"WFOpenAppAction.m", 29, @"%s", dlerror());

LABEL_38:
        __break(1u);
      }
    }
    else
    {
    }
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    BOOL v13 = (id *)getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_26774;
    uint64_t v53 = getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_26774;
    if (!getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_26774)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSBSOpenApplicationLayoutRolePrimarySymbolLoc_block_invoke_26775;
      v55 = &unk_264E5EC88;
      v56 = &v50;
      v19 = SpringBoardServicesLibrary_26768();
      v20 = dlsym(v19, "SBSOpenApplicationLayoutRolePrimary");
      *(void *)(v56[1] + 24) = v20;
      getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_26774 = *(void *)(v56[1] + 24);
      BOOL v13 = (id *)v51[3];
    }
    _Block_object_dispose(&v50, 8);
    if (!v13)
    {
      v37 = [MEMORY[0x263F08690] currentHandler];
      v38 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLayoutRolePrimary(void)"];
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"WFOpenAppAction.m", 32, @"%s", dlerror());

      goto LABEL_38;
    }
    goto LABEL_18;
  }
  v16 = [(WFOpenAppAction *)self parameterValueForKey:@"WFAppName" ofClass:objc_opt_class()];
  if (v16)
  {
    v17 = [MEMORY[0x263F336F8] findAppWithBundleIdentifier:0 name:v16];
    v18 = v17;
    if (v17)
    {
      id v6 = [v17 bundleIdentifier];

      goto LABEL_2;
    }
    v36 = getWFActionsLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFOpenAppAction runAsynchronouslyWithInput:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_23C364000, v36, OS_LOG_TYPE_ERROR, "%s Open App failed, no selected app descriptor and no app matching name: %@", buf, 0x16u);
    }

    [(WFOpenAppAction *)self finishRunningWithNoAppError];
  }
  else
  {
    v35 = getWFActionsLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[WFOpenAppAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_23C364000, v35, OS_LOG_TYPE_ERROR, "%s Open App failed, no selected app or app name", buf, 0xCu);
    }

    [(WFOpenAppAction *)self finishRunningWithNoAppError];
  }
LABEL_28:
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v3 error];
    [v4 finishRunningWithError:v5];

    id v6 = v3;
  }
  else
  {

    id v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315394;
      v11 = "-[WFOpenAppAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    [v9 finishRunningWithError:v6];
  }
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_195(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = objc_opt_new();
    id v7 = WFLocalizedString(@"Open App failed because the app could not be opened.");
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];

    if (v5) {
      [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
    }
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"WFOpenAppActionErrorDomain" code:0 userInfo:v6];

    id v5 = (id)v8;
  }
  if (v5 && (WFOpenAppActionIsPDUError(v5) & 1) == 0)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_264E5C218;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v9 observeForAppLaunchWithTimeout:v10 completionHandler:3.0];
  }
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) != 0 || !VCIsDeviceLocked())
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_5;
    v7[3] = &unk_264E5CD58;
    id v6 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v6 requestUnlock:v7];
  }
}

uint64_t __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithCompletionHandler:*(void *)(a1 + 40)];
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_3;
  block[3] = &unk_264E5E938;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v4;
  id v7 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) parameterValueForKey:@"WFAppName" ofClass:objc_opt_class()];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F336F8]) initWithBundleIdentifier:*(void *)(a1 + 40) localizedName:v2];
  id v4 = [MEMORY[0x263F337C8] itemWithObject:v3 named:v2];
  dispatch_time_t v5 = (void *)MEMORY[0x263F337B0];
  v8[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v7 = [v5 collectionWithItems:v6];
  [*(id *)(a1 + 32) setOutput:v7];

  [*(id *)(a1 + 32) finishRunningWithError:*(void *)(a1 + 48)];
}

@end