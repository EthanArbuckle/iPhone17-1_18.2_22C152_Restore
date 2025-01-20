@interface DBDashboardWorkspaceOwner
- (DBDashboardWorkspaceOwner)initWithStateResolver:(id)a3 environment:(id)a4 rootViewController:(id)a5 siriViewController:(id)a6;
- (DBEnvironment)environment;
- (DBNotificationSuspending)notificationSuspender;
- (DBUserAlertServer)userAlertServer;
- (DBWorkspace)workspace;
- (NSString)activeBaseApplicationBundleID;
- (id)_existingViewControllerForEntity:(id)a3;
- (unint64_t)session:(id)a3 policyForRequest:(id)a4;
- (void)_handleSuspendedActivationForEntity:(id)a3 changeItem:(id)a4 completion:(id)a5;
- (void)_newViewControllerForEntity:(id)a3 changeItem:(id)a4 completion:(id)a5;
- (void)_updateViewControllerForEntity:(id)a3 changeItem:(id)a4 oldEntity:(id)a5 completion:(id)a6;
- (void)alertServer:(id)a3 wantsAppDismissalForAlert:(id)a4 bundleID:(id)a5;
- (void)alertServer:(id)a3 wantsAppPresentationForAlert:(id)a4 bundleID:(id)a5;
- (void)handleEvent:(id)a3;
- (void)invalidate;
- (void)session:(id)a3 handleStateChangeRequest:(id)a4;
- (void)setEnvironment:(id)a3;
- (void)setNotificationSuspender:(id)a3;
- (void)setUserAlertServer:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)workspace:(id)a3 didBeginStateChangeSession:(id)a4;
- (void)workspace:(id)a3 didEndStateChangeSession:(id)a4;
@end

@implementation DBDashboardWorkspaceOwner

- (DBDashboardWorkspaceOwner)initWithStateResolver:(id)a3 environment:(id)a4 rootViewController:(id)a5 siriViewController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DBDashboardWorkspaceOwner;
  v15 = [(DBDashboardWorkspaceOwner *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_environment, v12);
    objc_storeStrong((id *)&v16->_stateResolver, a3);
    objc_storeStrong((id *)&v16->_rootViewController, a5);
    objc_storeStrong((id *)&v16->_siriViewController, a6);
    uint64_t v17 = objc_opt_new();
    entityIdentifierToViewControllerMap = v16->_entityIdentifierToViewControllerMap;
    v16->_entityIdentifierToViewControllerMap = (NSMutableDictionary *)v17;
  }
  return v16;
}

- (void)invalidate
{
  self->_invalidated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);
  [WeakRetained invalidate];

  currentSession = self->_currentSession;
  [(DBWorkspaceStateChangeSession *)currentSession invalidate];
}

- (NSString)activeBaseApplicationBundleID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);
  v3 = [WeakRetained state];

  objc_opt_class();
  id v4 = [v3 baseEntity];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = [v5 application];
    v7 = [v6 bundleIdentifier];
  }
  else
  {
    objc_opt_class();
    id v8 = [v3 baseEntity];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      v9 = [v6 applicationToProxy];
      v7 = [v9 bundleIdentifier];
    }
    else
    {
      v7 = 0;
    }
  }

  return (NSString *)v7;
}

- (void)alertServer:(id)a3 wantsAppPresentationForAlert:(id)a4 bundleID:(id)a5
{
  id v8 = a4;
  v7 = [(NSMutableDictionary *)self->_entityIdentifierToViewControllerMap objectForKey:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setUserAlert:v8];
  }
}

- (void)alertServer:(id)a3 wantsAppDismissalForAlert:(id)a4 bundleID:(id)a5
{
  -[NSMutableDictionary objectForKey:](self->_entityIdentifierToViewControllerMap, "objectForKey:", a5, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setUserAlert:0];
  }
}

- (void)workspace:(id)a3 didBeginStateChangeSession:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = (DBWorkspaceStateChangeSession *)a4;
  id v6 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Beginning session: %@", (uint8_t *)&v8, 0xCu);
  }

  currentSession = self->_currentSession;
  self->_currentSession = v5;
}

- (void)workspace:(id)a3 didEndStateChangeSession:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Ended session: %@", (uint8_t *)&v8, 0xCu);
  }

  currentSession = self->_currentSession;
  self->_currentSession = 0;
}

- (unint64_t)session:(id)a3 policyForRequest:(id)a4
{
  if (self->_invalidated) {
    return 1;
  }
  [a3 owner];

  return 0;
}

- (void)session:(id)a3 handleStateChangeRequest:(id)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_invalidated)
  {
    [v6 invalidate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);
    id v9 = [WeakRetained state];

    if (!v9)
    {
      uint64_t v10 = objc_alloc_init(DBMutableDashboardWorkspaceState);
      id v11 = +[DBDashboardHomescreenEntity entity];
      [(DBMutableDashboardWorkspaceState *)v10 setBaseEntity:v11];

      id v9 = (void *)[(DBMutableDashboardWorkspaceState *)v10 copy];
    }
    v84 = [(DBDashboardWorkspaceStateResolver *)self->_stateResolver computeNewStateFromState:v9 andRequest:v7];
    id v12 = [v84 state];
    [v6 setState:v12];
    id v13 = dispatch_group_create();
    id v14 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v119 = v6;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_INFO, "Starting display layout publisher transition for workspace change session: %@", buf, 0xCu);
    }

    v15 = [(DBDashboardWorkspaceOwner *)self environment];
    v16 = [v15 environmentConfiguration];
    uint64_t v17 = [v16 displayLayoutPublisher];
    v80 = [v17 transitionAssertionWithReason:@"Workspace Change"];

    v18 = [v12 baseEntity];
    v81 = v12;
    v85 = [v12 stackedEntity];
    v19 = v84;
    uint64_t v83 = [v84 activateSuspendedEntity];
    objc_super v20 = [v9 baseEntity];

    v82 = v18;
    if (v18 != v20)
    {
      v78 = v13;
      dispatch_group_enter(v13);
      v21 = [v18 identifier];
      v22 = [v9 baseEntity];
      [v22 identifier];
      v24 = v23 = v18;
      int v25 = [v21 isEqualToString:v24];

      if (v25)
      {
        v26 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v26, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting update for base view controller", buf, 2u);
        }

        v18 = v82;
        v27 = [v84 changeItemForEntity:v82];
        v28 = [v9 baseEntity];
        v116[0] = MEMORY[0x263EF8330];
        v116[1] = 3221225472;
        v116[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke;
        v116[3] = &unk_2649B3E90;
        id v13 = v78;
        v117 = v78;
        [(DBDashboardWorkspaceOwner *)self _updateViewControllerForEntity:v82 changeItem:v27 oldEntity:v28 completion:v116];

        v29 = v117;
      }
      else
      {
        if ([v23 isHomescreenEntity])
        {
          entityIdentifierToViewControllerMap = self->_entityIdentifierToViewControllerMap;
          v31 = [v9 baseEntity];
          v32 = [v31 identifier];
          [(NSMutableDictionary *)entityIdentifierToViewControllerMap removeObjectForKey:v32];

          v33 = [MEMORY[0x263F08C38] UUID];
          v34 = [v33 UUIDString];

          v35 = [(DBDashboardWorkspaceOwner *)self notificationSuspender];
          [v35 setSuspended:1 cancellingCurrent:1 forReason:v34];

          v36 = DBLogForCategory(6uLL);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting dismissal of base view controller", buf, 2u);
          }

          rootViewController = self->_rootViewController;
          v18 = v82;
          v37 = [v84 changeItemForEntity:v82];
          uint64_t v38 = [v37 prefersAnimation];
          v113[0] = MEMORY[0x263EF8330];
          v113[1] = 3221225472;
          v113[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_104;
          v113[3] = &unk_2649B3ED8;
          v113[4] = self;
          v114 = v34;
          id v13 = v78;
          v115 = v78;
          v29 = v34;
          [(DBDashboardRootViewController *)rootViewController dismissBaseViewControllerAnimated:v38 completion:v113];

          v39 = v114;
        }
        else
        {
          v40 = [v84 changeItemForEntity:v23];
          v41 = DBLogForCategory(6uLL);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v41, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting presentation of base view controller", buf, 2u);
          }

          v108[0] = MEMORY[0x263EF8330];
          v108[1] = 3221225472;
          v108[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_105;
          v108[3] = &unk_2649B6B98;
          v108[4] = self;
          v18 = v82;
          id v109 = v82;
          id v110 = v40;
          id v111 = v85;
          id v13 = v78;
          v112 = v78;
          v29 = v40;
          [(DBDashboardWorkspaceOwner *)self _newViewControllerForEntity:v109 changeItem:v29 completion:v108];

          v39 = v109;
        }
      }
    }
    v42 = [v9 stackedEntity];

    if (v85 != v42)
    {
      dispatch_group_enter(v13);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_111;
      aBlock[3] = &unk_2649B3D30;
      id v43 = v85;
      id v106 = v43;
      v107 = self;
      v44 = _Block_copy(aBlock);
      objc_opt_class();
      id v45 = v43;
      v79 = v44;
      if (v45 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DBSiriViewController setTouchToDismissEnabled:forRequester:](self->_siriViewController, "setTouchToDismissEnabled:forRequester:", [v45 isFloating], @"FloatingSiri");
        objc_msgSend(v45, "identifier", v45);
      }
      else
      {

        objc_msgSend(v45, "identifier", 0);
      v46 = };
      v47 = [v9 stackedEntity];
      v48 = [v47 identifier];
      int v49 = [v46 isEqualToString:v48];

      id v77 = v7;
      if (v49)
      {
        v50 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v50, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting update for stacked view controller", buf, 2u);
        }

        v19 = v84;
        v51 = [v84 changeItemForEntity:v45];
        v52 = [v9 stackedEntity];
        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_115;
        v102[3] = &unk_2649B55D8;
        id v104 = v79;
        v103 = v13;
        [(DBDashboardWorkspaceOwner *)self _updateViewControllerForEntity:v45 changeItem:v51 oldEntity:v52 completion:v102];

        objc_opt_class();
        id v53 = [v9 stackedEntity];
        if (v53 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v54 = v53;
        }
        else {
          id v54 = 0;
        }

        v18 = v82;
        if ([v54 isFloating])
        {
          v60 = self->_entityIdentifierToViewControllerMap;
          v61 = [v82 identifier];
          v62 = [(NSMutableDictionary *)v60 objectForKeyedSubscript:v61];

          [v62 deactivateSceneWithReasonMask:16];
        }

        id v59 = v104;
        v57 = v79;
      }
      else if (v45)
      {
        v19 = v84;
        v55 = [v84 changeItemForEntity:v45];
        v56 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v56, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting presentation of stacked view controller", buf, 2u);
        }

        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_117;
        v92[3] = &unk_2649B6C10;
        v92[4] = self;
        id v93 = v82;
        id v94 = v45;
        id v95 = v55;
        v57 = v79;
        id v97 = v79;
        v96 = v13;
        id v58 = v55;
        v18 = v82;
        id v59 = v58;
        [(DBDashboardWorkspaceOwner *)self _newViewControllerForEntity:v94 changeItem:v58 completion:v92];
      }
      else
      {
        v63 = self->_entityIdentifierToViewControllerMap;
        v64 = [v9 stackedEntity];
        v65 = [v64 identifier];
        [(NSMutableDictionary *)v63 removeObjectForKey:v65];

        v66 = [MEMORY[0x263F08C38] UUID];
        v67 = [v66 UUIDString];

        v68 = [(DBDashboardWorkspaceOwner *)self notificationSuspender];
        [v68 setSuspended:1 cancellingCurrent:0 forReason:v67];

        v69 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v69, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting dismissal of stacked view controller", buf, 2u);
        }

        v70 = self->_rootViewController;
        v98[0] = MEMORY[0x263EF8330];
        v98[1] = 3221225472;
        v98[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_116;
        v98[3] = &unk_2649B6BC0;
        v57 = v79;
        id v101 = v79;
        v98[4] = self;
        id v99 = v67;
        v100 = v13;
        id v59 = v67;
        [(DBDashboardRootViewController *)v70 dismissStackedViewControllerAnimated:1 completion:v98];

        v19 = v84;
        v18 = v82;
      }

      id v7 = v77;
    }
    v71 = (void *)v83;
    if (v83)
    {
      dispatch_group_enter(v13);
      v72 = [v19 changeItemForEntity:v83];
      v73 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v73, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Starting suspended activation", buf, 2u);
      }

      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_119;
      v90[3] = &unk_2649B3E90;
      v91 = v13;
      v71 = (void *)v83;
      [(DBDashboardWorkspaceOwner *)self _handleSuspendedActivationForEntity:v83 changeItem:v72 completion:v90];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_120;
    block[3] = &unk_2649B3ED8;
    id v87 = v6;
    id v88 = v80;
    id v89 = v7;
    id v74 = v80;
    dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);
  }
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Update for base view controller completed", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_104(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Dismissal of base view controller completed", v4, 2u);
  }

  v3 = [*(id *)(a1 + 32) notificationSuspender];
  [v3 setSuspended:0 forReason:*(void *)(a1 + 40)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_105(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];

  id v6 = [a1[4] notificationSuspender];
  [v6 setSuspended:1 cancellingCurrent:1 forReason:v5];

  if (([a1[5] isApplicationEntity] & 1) != 0
    || [a1[5] isProxiedApplicationEntity])
  {
    objc_opt_class();
    id v7 = a1[6];
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    id v9 = [v8 activationSettings];
    uint64_t v10 = [v9 launchSource];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  id v12 = [NSNumber numberWithUnsignedInteger:v10];
  [v11 postNotificationName:@"CARApplicationDidLaunchNotification" object:v12];

  if (a1[7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v13 = a1[7];
      if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      if ([v14 isFloating]) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = 16;
      }
    }
    else
    {
      uint64_t v15 = 128;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  v16 = (void *)*((void *)a1[4] + 4);
  uint64_t v17 = [a1[6] prefersAnimation];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_2;
  v21[3] = &unk_2649B66B8;
  id v18 = a1[4];
  id v22 = v3;
  id v23 = v18;
  uint64_t v26 = v15;
  id v24 = v5;
  id v25 = a1[8];
  id v19 = v5;
  id v20 = v3;
  [v16 presentBaseViewController:v20 animated:v17 launchSource:v10 completion:v21];
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_2(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Presentation of base view controller completed", v4, 2u);
  }

  [*(id *)(a1 + 32) deactivateSceneWithReasonMask:*(void *)(a1 + 64)];
  id v3 = [*(id *)(a1 + 40) notificationSuspender];
  [v3 setSuspended:0 forReason:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_111(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = [*(id *)(a1 + 40) notificationSuspender];
  [v3 setSuspended:isKindOfClass & 1 forReason:@"DBNotificationSuspensionReasonAssistant"];
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_115(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Update for stacked view controller completed", v3, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_116(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Dismissal of stacked view controller completed", v4, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v3 = [*(id *)(a1 + 32) notificationSuspender];
  [v3 setSuspended:0 forReason:*(void *)(a1 + 40)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_117(id *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08C38];
  id v4 = a2;
  id v5 = [v3 UUID];
  id v6 = [v5 UUIDString];

  id v7 = [a1[4] notificationSuspender];
  [v7 setSuspended:1 cancellingCurrent:1 forReason:v6];

  id v8 = (void *)*((void *)a1[4] + 7);
  id v9 = [a1[5] identifier];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 128;
  }
  id v12 = (void *)*((void *)a1[4] + 4);
  uint64_t v13 = [a1[7] prefersAnimation];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_2_118;
  v16[3] = &unk_2649B6BE8;
  id v17 = v10;
  uint64_t v22 = v11;
  id v21 = a1[9];
  id v18 = a1[4];
  id v19 = v6;
  id v20 = a1[8];
  id v14 = v6;
  id v15 = v10;
  [v12 presentStackedViewController:v4 animated:v13 completion:v16];
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_2_118(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Presentation of stacked view controller completed", v4, 2u);
  }

  [*(id *)(a1 + 32) deactivateSceneWithReasonMask:*(void *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v3 = [*(id *)(a1 + 40) notificationSuspender];
  [v3 setSuspended:0 forReason:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_119(uint64_t a1)
{
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Suspended activation completed", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__DBDashboardWorkspaceOwner_session_handleStateChangeRequest___block_invoke_120(id *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1[4] invalidate];
  v2 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = a1[4];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_INFO, "Invalidating display layout publisher transition for workspace change session: %@", (uint8_t *)&v6, 0xCu);
  }

  [a1[5] invalidate];
  id v4 = [a1[6] completionHandler];

  if (v4)
  {
    id v5 = [a1[6] completionHandler];
    v5[2]();
  }
}

- (void)handleEvent:(id)a3
{
  if (!self->_invalidated) {
    [(DBDashboardRootViewController *)self->_rootViewController handleEvent:a3];
  }
}

- (id)_existingViewControllerForEntity:(id)a3
{
  entityIdentifierToViewControllerMap = self->_entityIdentifierToViewControllerMap;
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)entityIdentifierToViewControllerMap objectForKey:v4];

  return v5;
}

- (void)_newViewControllerForEntity:(id)a3 changeItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v43 = a5;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__9;
  v60 = __Block_byref_object_dispose__9;
  id v61 = 0;
  uint64_t v10 = dispatch_group_create();
  if ([v8 isApplicationEntity])
  {
    id WeakRetained = v8;
    id v42 = v9;
    id v12 = v9;
    uint64_t v13 = [DBApplicationViewController alloc];
    id v14 = [(DBDashboardWorkspaceOwner *)self environment];
    id v15 = [(DBApplicationViewController *)v13 initWithEntity:WeakRetained environment:v14];

    v16 = [(DBDashboardWorkspaceOwner *)self environment];
    [v16 statusBarInsets];
    -[DBApplicationViewController setAdditionalSafeAreaInsets:](v15, "setAdditionalSafeAreaInsets:");

    id v17 = [(DBDashboardWorkspaceOwner *)self userAlertServer];
    id v18 = [WeakRetained application];
    id v19 = [v18 bundleIdentifier];
    id v20 = [v17 alertForBundleID:v19];

    if (v20) {
      [(DBApplicationViewController *)v15 setUserAlert:v20];
    }
    dispatch_group_enter(v10);
    id v21 = [v12 activationSettings];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke;
    v52[3] = &unk_2649B6C38;
    v55 = &v56;
    uint64_t v22 = v15;
    id v53 = v22;
    id v54 = v10;
    [(DBApplicationViewController *)v22 foregroundSceneWithSettings:v21 completion:v52];

LABEL_9:
    id v9 = v42;
    goto LABEL_10;
  }
  if ([v8 isProxiedApplicationEntity])
  {
    id WeakRetained = v8;
    id v42 = v9;
    id v41 = v9;
    id v23 = [DBApplicationViewController alloc];
    id v24 = [(DBDashboardWorkspaceOwner *)self environment];
    id v25 = [(DBApplicationViewController *)v23 initWithEntity:WeakRetained environment:v24];

    uint64_t v26 = [(DBDashboardWorkspaceOwner *)self environment];
    [v26 statusBarInsets];
    -[DBApplicationViewController setAdditionalSafeAreaInsets:](v25, "setAdditionalSafeAreaInsets:");

    v27 = [(DBDashboardWorkspaceOwner *)self userAlertServer];
    v28 = [WeakRetained proxyEntity];
    v29 = [v28 application];
    v30 = [v29 bundleIdentifier];
    v31 = [v27 alertForBundleID:v30];

    if (v31) {
      [(DBApplicationViewController *)v25 setUserAlert:v31];
    }
    dispatch_group_enter(v10);
    v32 = [v41 activationSettings];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke_2;
    v48[3] = &unk_2649B6C38;
    v51 = &v56;
    v33 = v25;
    int v49 = v33;
    v50 = v10;
    [(DBApplicationViewController *)v33 foregroundSceneWithSettings:v32 completion:v48];

    goto LABEL_9;
  }
  if ([v8 isSiriEntity])
  {
    v36 = v57;
    v37 = self->_siriViewController;
    id WeakRetained = (id)v36[5];
    v36[5] = (uint64_t)v37;
  }
  else
  {
    if (![v8 isOEMPunchthroughEntity]) {
      goto LABEL_11;
    }
    uint64_t v38 = [DBOEMPunchthroughViewController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    uint64_t v39 = [(DBOEMPunchthroughViewController *)v38 initWithOEMPunchthroughEntity:v8 environment:WeakRetained];
    v40 = (void *)v57[5];
    v57[5] = v39;
  }
LABEL_10:

LABEL_11:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke_3;
  block[3] = &unk_2649B6C60;
  void block[4] = self;
  id v45 = v8;
  v47 = &v56;
  id v46 = v43;
  id v34 = v43;
  id v35 = v8;
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(&v56, 8);
}

void __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

uint64_t __79__DBDashboardWorkspaceOwner__newViewControllerForEntity_changeItem_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

- (void)_updateViewControllerForEntity:(id)a3 changeItem:(id)a4 oldEntity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = dispatch_group_create();
  entityIdentifierToViewControllerMap = self->_entityIdentifierToViewControllerMap;
  v16 = [v13 identifier];

  id v17 = [(NSMutableDictionary *)entityIdentifierToViewControllerMap objectForKeyedSubscript:v16];

  if (([v10 isApplicationEntity] & 1) != 0
    || [v10 isProxiedApplicationEntity])
  {
    id v18 = v17;
    id v19 = v11;
    id v20 = [v19 activationSettings];

    if (v20)
    {
      dispatch_group_enter(v14);
      id v21 = [v19 activationSettings];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __92__DBDashboardWorkspaceOwner__updateViewControllerForEntity_changeItem_oldEntity_completion___block_invoke;
      v29[3] = &unk_2649B3E90;
      v30 = v14;
      [v18 activateSceneWithSettings:v21 completion:v29];
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__DBDashboardWorkspaceOwner__updateViewControllerForEntity_changeItem_oldEntity_completion___block_invoke_2;
  block[3] = &unk_2649B6C88;
  void block[4] = self;
  id v26 = v10;
  id v27 = v17;
  id v28 = v12;
  id v22 = v12;
  id v23 = v17;
  id v24 = v10;
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);
}

void __92__DBDashboardWorkspaceOwner__updateViewControllerForEntity_changeItem_oldEntity_completion___block_invoke(uint64_t a1)
{
}

uint64_t __92__DBDashboardWorkspaceOwner__updateViewControllerForEntity_changeItem_oldEntity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v5();
}

- (void)_handleSuspendedActivationForEntity:(id)a3 changeItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_group_create();
  entityIdentifierToViewControllerMap = self->_entityIdentifierToViewControllerMap;
  id v13 = [v8 identifier];
  id v14 = [(NSMutableDictionary *)entityIdentifierToViewControllerMap objectForKeyedSubscript:v13];

  if (!v14)
  {
    dispatch_group_enter(v11);
    id v19 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Using transient view controlller for suspended activation", buf, 2u);
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke_122;
    v23[3] = &unk_2649B6CB0;
    id v18 = (id *)&v24;
    id v24 = v11;
    [(DBDashboardWorkspaceOwner *)self _newViewControllerForEntity:v8 changeItem:v9 completion:v23];
    goto LABEL_10;
  }
  if (([v8 isApplicationEntity] & 1) != 0
    || [v8 isProxiedApplicationEntity])
  {
    id v15 = v9;
    v16 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "[WorkspaceOwner] Delivering suspended activation to existing view controller", buf, 2u);
    }

    dispatch_group_enter(v11);
    id v17 = [v15 activationSettings];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke;
    v25[3] = &unk_2649B3E90;
    id v18 = (id *)&v26;
    id v26 = v11;
    [v14 foregroundSceneWithSettings:v17 completion:v25];

LABEL_10:
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke_2;
  block[3] = &unk_2649B4EC8;
  id v22 = v10;
  id v20 = v10;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], block);
}

void __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke(uint64_t a1)
{
}

void __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke_122(uint64_t a1)
{
}

uint64_t __87__DBDashboardWorkspaceOwner__handleSuspendedActivationForEntity_changeItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (DBWorkspace)workspace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspace);
  return (DBWorkspace *)WeakRetained;
}

- (void)setWorkspace:(id)a3
{
}

- (DBNotificationSuspending)notificationSuspender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationSuspender);
  return (DBNotificationSuspending *)WeakRetained;
}

- (void)setNotificationSuspender:(id)a3
{
}

- (DBUserAlertServer)userAlertServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userAlertServer);
  return (DBUserAlertServer *)WeakRetained;
}

- (void)setUserAlertServer:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_userAlertServer);
  objc_destroyWeak((id *)&self->_notificationSuspender);
  objc_storeStrong((id *)&self->_entityIdentifierToViewControllerMap, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_siriViewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_stateResolver, 0);
  objc_destroyWeak((id *)&self->_workspace);
}

@end