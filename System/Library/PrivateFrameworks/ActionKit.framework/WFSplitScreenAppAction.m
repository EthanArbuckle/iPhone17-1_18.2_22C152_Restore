@interface WFSplitScreenAppAction
- (NSMutableDictionary)leftWindowsToWindowID;
- (NSMutableDictionary)rightWindowsToWindowID;
- (OS_dispatch_queue)queue;
- (id)disabledOnPlatforms;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setLeftWindowsToWindowID:(id)a3;
- (void)setRightWindowsToWindowID:(id)a3;
@end

@implementation WFSplitScreenAppAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightWindowsToWindowID, 0);
  objc_storeStrong((id *)&self->_leftWindowsToWindowID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setRightWindowsToWindowID:(id)a3
{
}

- (NSMutableDictionary)rightWindowsToWindowID
{
  return self->_rightWindowsToWindowID;
}

- (void)setLeftWindowsToWindowID:(id)a3
{
}

- (NSMutableDictionary)leftWindowsToWindowID
{
  return self->_leftWindowsToWindowID;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFSplitScreenAppAction;
  v2 = [(WFSplitScreenAppAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v59[4] = *(id *)MEMORY[0x263EF8340];
  id v40 = a3;
  v4 = [(WFSplitScreenAppAction *)self parameterValueForKey:@"WFPrimaryAppIdentifier" ofClass:objc_opt_class()];
  objc_super v5 = [v4 bundleIdentifier];
  if (v5)
  {
    v39 = [(WFSplitScreenAppAction *)self parameterValueForKey:@"WFSecondaryAppIdentifier" ofClass:objc_opt_class()];
    v41 = [v39 bundleIdentifier];
    v38 = [(WFSplitScreenAppAction *)self parameterValueForKey:@"WFAppRatio" ofClass:objc_opt_class()];
    if ([v38 isEqualToString:@"½ + ½"])
    {
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      v6 = (id *)getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr;
      uint64_t v51 = getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr;
      if (!getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_block_invoke;
        v46 = &unk_264E5EC88;
        v47 = &v48;
        v7 = SpringBoardServicesLibrary();
        v49[3] = (uint64_t)dlsym(v7, "SBSOpenApplicationLayoutRoleSideLarge");
        getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr = *(void *)(v47[1] + 24);
        v6 = (id *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (!v6)
      {
        v8 = [MEMORY[0x263F08690] currentHandler];
        v9 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLayoutRoleSideLarge(void)"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"WFSplitScreenAppAction.m", 29, @"%s", dlerror());

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      v6 = (id *)getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr;
      uint64_t v51 = getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr;
      if (!getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_block_invoke;
        v46 = &unk_264E5EC88;
        v47 = &v48;
        v10 = SpringBoardServicesLibrary();
        v49[3] = (uint64_t)dlsym(v10, "SBSOpenApplicationLayoutRoleSideNarrow");
        getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr = *(void *)(v47[1] + 24);
        v6 = (id *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (!v6)
      {
        v35 = [MEMORY[0x263F08690] currentHandler];
        v36 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLayoutRoleSideNarrow(void)"];
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"WFSplitScreenAppAction.m", 30, @"%s", dlerror());

        goto LABEL_24;
      }
    }
    id v37 = *v6;
    v11 = (void *)MEMORY[0x263EFF9A0];
    v12 = getSBSOpenApplicationOptionKeyLayoutRole();
    v58[0] = v12;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    v13 = (id *)getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr;
    uint64_t v51 = getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr;
    if (!getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr)
    {
      uint64_t v43 = MEMORY[0x263EF8330];
      uint64_t v44 = 3221225472;
      v45 = __getSBSOpenApplicationLayoutRolePrimarySymbolLoc_block_invoke;
      v46 = &unk_264E5EC88;
      v47 = &v48;
      v14 = SpringBoardServicesLibrary();
      v49[3] = (uint64_t)dlsym(v14, "SBSOpenApplicationLayoutRolePrimary");
      getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr = *(void *)(v47[1] + 24);
      v13 = (id *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x263F3F5E8];
      v59[0] = *v13;
      v59[1] = (id)MEMORY[0x263EFFA88];
      uint64_t v16 = *MEMORY[0x263F3F608];
      v58[1] = v15;
      v58[2] = v16;
      v58[3] = *MEMORY[0x263F3F5B8];
      v59[2] = (id)MEMORY[0x263EFFA88];
      v59[3] = &unk_26F074B38;
      v17 = NSDictionary;
      id v18 = v59[0];
      v19 = [v17 dictionaryWithObjects:v59 forKeys:v58 count:4];

      v20 = [v11 dictionaryWithDictionary:v19];

      if (!v41)
      {
LABEL_19:
        v29 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
        v30 = [MEMORY[0x263F3F778] optionsWithDictionary:v20];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __53__WFSplitScreenAppAction_runAsynchronouslyWithInput___block_invoke;
        v42[3] = &unk_264E564A8;
        v42[4] = self;
        [v29 openApplication:v5 withOptions:v30 completion:v42];

        goto LABEL_20;
      }
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      v21 = (id *)getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr;
      uint64_t v51 = getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr;
      if (!getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_block_invoke;
        v46 = &unk_264E5EC88;
        v47 = &v48;
        v22 = SpringBoardServicesLibrary();
        v49[3] = (uint64_t)dlsym(v22, "SBSOpenApplicationOptionKeyAdditionalApplications");
        getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr = *(void *)(v47[1] + 24);
        v21 = (id *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (v21)
      {
        id v56 = *v21;
        id v23 = v56;
        v24 = (void *)[v41 copy];
        v54 = v24;
        v25 = getSBSOpenApplicationOptionKeyLayoutRole();
        v52 = v25;
        id v53 = v37;
        v26 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        v55 = v26;
        v27 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        v57 = v27;
        v28 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];

        [v20 addEntriesFromDictionary:v28];
        goto LABEL_19;
      }
      v33 = [MEMORY[0x263F08690] currentHandler];
      v34 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationOptionKeyAdditionalApplications(void)"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"WFSplitScreenAppAction.m", 26, @"%s", dlerror());
    }
    else
    {
      v31 = [MEMORY[0x263F08690] currentHandler];
      v32 = [NSString stringWithUTF8String:"NSString *getSBSOpenApplicationLayoutRolePrimary(void)"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"WFSplitScreenAppAction.m", 28, @"%s", dlerror());
    }
LABEL_24:
    __break(1u);
  }
  [(WFSplitScreenAppAction *)self finishRunningWithError:0];
LABEL_20:
}

void __53__WFSplitScreenAppAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[WFSplitScreenAppAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_ERROR, "%s Could not split screen apps with error: %@", buf, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = [v4 domain];
    uint64_t v9 = [v4 code];
    uint64_t v13 = *MEMORY[0x263F08320];
    v10 = WFLocalizedString(@"Failed to open the specified apps in split screen mode.");
    v14 = v10;
    v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v12 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v11, v13);
    [v6 finishRunningWithError:v12];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFSplitScreenAppAction", 0);
    objc_super v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

@end