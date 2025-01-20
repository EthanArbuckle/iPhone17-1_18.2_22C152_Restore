@interface _UIKeyboardArbiter
+ (BOOL)unitTestEnvironment;
+ (void)configureEncodedClassesForXPCConnection:(id)a3;
- (BOOL)activateHandle:(id)a3;
- (BOOL)deactivateHandle:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FBSSceneLayer)sceneLayer;
- (NSString)description;
- (_UIKeyboardArbiter)initWithLink:(id)a3;
- (_UIKeyboardArbiterClientHandle)activeInputDestinationHandle;
- (_UIKeyboardArbiterClientHandle)focusRequestedHandle;
- (_UIKeyboardArbiterClientHandle)keyboardUIHandle;
- (_UIKeyboardArbiterLink)sceneLink;
- (_UIKeyboardArbiterOmniscientDelegate)omniscientDelegate;
- (_UIKeyboardArbiterSceneDelegate)sceneDelegate;
- (_UIKeyboardChangedInformation)lastUpdate;
- (id)_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:(id *)a3;
- (id)_activeHandleForFocusEvaluation;
- (id)_currentFocusedHandle;
- (id)_descriptionWithScene:(BOOL)a3;
- (id)_handleForSceneIdentity:(id)a3;
- (id)_previouslyFocusedHostHandle;
- (id)focusContext;
- (id)handlerForBundleID:(id)a3;
- (id)handlerForPID:(int)a3;
- (id)handlerForToken:(id)a3;
- (id)hostBundleIdentifierForHandle:(id)a3 hosts:(id)a4;
- (id)hostForHandle:(id)a3 hosts:(id)a4;
- (id)lastActivatedHandle;
- (id)preferredSceneIdentityForKeyboardFocusWithChangeInformation:(id)a3;
- (id)remoteFocusContext;
- (int)presentingKeyboardProcessIdentifier;
- (unint64_t)keyboardScenePresentationMode;
- (void)_applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:(unint64_t)a3;
- (void)_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:(unint64_t)a3 pid:(int)a4 sceneIdentity:(id)a5;
- (void)_cullRecentlyActiveSceneIdentities;
- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4;
- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4 checklist:(id)a5;
- (void)_focusSceneHandle:(id)a3 previousHostFocusHandle:(id)a4 previousLeafFocusHandle:(id)a5 shouldStealKeyboardOnSuccess:(BOOL)a6;
- (void)_invalidateFocus;
- (void)_trackRecentlyActiveArbiterHandle:(id)a3;
- (void)_updateCurrentKeyboardFocusToPID:(int)a3 sceneIdentity:(id)a4;
- (void)activateClients;
- (void)applySceneFocusChange:(id)a3 forRequest:(id)a4;
- (void)attemptConnection;
- (void)captureStateForDebug;
- (void)checkHostingState;
- (void)completeKeyboardStatusChangedFromHandler:(id)a3;
- (void)dealloc;
- (void)handleUnexpectedDeallocForHandler:(id)a3;
- (void)handlerRequestedFocus:(id)a3 shouldStealKeyboard:(BOOL)a4;
- (void)handlerRequestedForcedClientSceneIdentityUpdate:(id)a3;
- (void)keyboardFocusDidChangeWithoutAdvisorInputToPid:(int)a3 sceneIdentity:(id)a4;
- (void)newClientConnected:(id)a3 withExpectedState:(id)a4 onConnected:(id)a5;
- (void)notifyHeightUpdated:(id)a3;
- (void)prewarmFocusContext;
- (void)processWithPID:(int)a3 foreground:(BOOL)a4 suspended:(BOOL)a5;
- (void)reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:(BOOL)a3;
- (void)reevaluateSceneClientSettings;
- (void)resume;
- (void)retrieveClientDebugInformationWithCompletion:(id)a3;
- (void)retrieveDebugInformationWithCompletion:(id)a3;
- (void)runOperations:(id)a3 onHandler:(id)a4 fromFunction:(const char *)a5;
- (void)scheduleWindowTimeout;
- (void)setKeyboardScenePresentationMode:(unint64_t)a3;
- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 fromHandler:(id)a5 completionHandler:(id)a6;
- (void)setKeyboardUIHandle:(id)a3;
- (void)setLastUpdate:(id)a3;
- (void)setOmniscientDelegate:(id)a3;
- (void)setSceneDelegate:(id)a3;
- (void)setSuppressionCount:(int)a3 ofPIDs:(id)a4;
- (void)signalEventSourceChanged:(int64_t)a3 fromHandler:(id)a4 completionHandler:(id)a5;
- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5 fromHandler:(id)a6;
- (void)updateInterestedBundleIDs;
- (void)updateKeyboardSceneSettings;
- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4;
- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4 fromFocus:(BOOL)a5;
- (void)updateKeyboardUIStatus:(id)a3 fromHandler:(id)a4;
- (void)updateSceneClientSettings:(id)a3;
- (void)updateSuppression:(BOOL)a3 ofPID:(id)a4 active:(BOOL)a5;
- (void)updateSuppression:(BOOL)a3 ofPIDs:(id)a4 active:(BOOL)a5;
@end

@implementation _UIKeyboardArbiter

- (void)applySceneFocusChange:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55___UIKeyboardArbiter_applySceneFocusChange_forRequest___block_invoke;
  block[3] = &unk_264721700;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)processWithPID:(int)a3 foreground:(BOOL)a4 suspended:(BOOL)a5
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke;
  v10[3] = &unk_2647215E8;
  v10[4] = self;
  int v11 = a3;
  BOOL v12 = a5;
  BOOL v13 = a4;
  dispatch_async(queue, v10);
}

- (void)setSuppressionCount:(int)a3 ofPIDs:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v11 = -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", [v10 intValue]);
        if ([v11 suppressionCount] != a3)
        {
          int v12 = [v11 suppressionCount];
          int v13 = a3 - v12;
          if (a3 != v12)
          {
            if (v13 >= 0) {
              unsigned int v14 = a3 - v12;
            }
            else {
              unsigned int v14 = v12 - a3;
            }
            if (v14 <= 1) {
              int v15 = 1;
            }
            else {
              int v15 = v14;
            }
            do
            {
              -[_UIKeyboardArbiter updateSuppression:ofPID:active:](self, "updateSuppression:ofPID:active:", v13 > 0, v10, [v11 active]);
              --v15;
            }
            while (v15);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (id)_handleForSceneIdentity:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_clients;
    id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "remoteFocusContext", (void)v14);
          int v11 = [v10 sceneIdentity];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v79 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_omniscientDelegate);

  if (WeakRetained)
  {
    os_unfair_lock_lock(&self->_pendingFocusLock);
    unint64_t pendingFocusLock_generation = self->_pendingFocusLock_generation;
    os_unfair_lock_unlock(&self->_pendingFocusLock);
    [(_UIKeyboardArbiter *)self _applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:pendingFocusLock_generation];
    id v44 = 0;
    uint64_t v7 = [(_UIKeyboardArbiter *)self _activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:&v44];
    id v8 = v44;
    id v9 = [v7 remoteFocusContext];
    id v10 = [v9 sceneIdentity];

    if (BSEqualObjects())
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      int v11 = _UIArbiterLog();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      char v12 = [v7 sceneDescription];
      int v45 = 138543362;
      v46 = v12;
      LODWORD(v42) = 12;
      int v13 = (long long *)_os_log_send_and_compose_impl();

      long long v14 = +[_UIKeyboardArbiterDebug sharedInstance];
      long long v15 = (void *)[[NSString alloc] initWithUTF8String:&v47];
      [v14 debugWithMessage:v15];

      if (v13 != &v47) {
        free(v13);
      }
    }
    else
    {
      id v16 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        long long v18 = [[_UIKeyboardArbiterSceneFocusRequest alloc] initWithShouldStealKeyboardOnSuccess:v3];
        if (v7)
        {
          uint64_t v19 = [_UIKeyboardArbiterSceneFocusChange alloc];
          long long v20 = [v7 remoteFocusContext];
          v21 = [v20 sceneIdentity];
          uint64_t v22 = -[_UIKeyboardArbiterSceneFocusChange initWithSceneIdentity:pid:](v19, "initWithSceneIdentity:pid:", v21, [v7 processIdentifier]);
        }
        else
        {
          uint64_t v22 = +[_UIKeyboardArbiterSceneFocusChange focusNothingChange];
        }
        id v37 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
        [v37 keyboardArbiterAdvisor:self request:v18 sceneFocusChange:v22];

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v47 = 0u;
        v38 = _UIArbiterLog();
        os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
        int v45 = 138543362;
        v46 = v22;
        LODWORD(v42) = 12;
        v39 = (long long *)_os_log_send_and_compose_impl();

        v40 = +[_UIKeyboardArbiterDebug sharedInstance];
        v41 = (void *)[[NSString alloc] initWithUTF8String:&v47];
        [v40 debugWithMessage:v41];

        if (v39 != &v47) {
          free(v39);
        }
      }
      else
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v47 = 0u;
        v23 = _UIArbiterLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
        v24 = [v7 sceneDescription];
        int v45 = 138543362;
        v46 = v24;
        LODWORD(v42) = 12;
        v25 = (long long *)_os_log_send_and_compose_impl();

        v26 = +[_UIKeyboardArbiterDebug sharedInstance];
        v27 = (void *)[[NSString alloc] initWithUTF8String:&v47];
        [v26 debugWithMessage:v27];

        if (v25 != &v47) {
          free(v25);
        }
        uint64_t v28 = [v7 processIdentifier];
        id v29 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
        v30 = [v29 keyboardArbiterAdvisor:self requestedSceneFocusDeliberationForFocusedPid:v28];

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v47 = 0u;
        v31 = _UIArbiterLog();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
        v32 = [v30 stringRepresentation];
        int v45 = 138412290;
        v46 = v32;
        LODWORD(v43) = 12;
        v33 = (long long *)_os_log_send_and_compose_impl();

        v34 = +[_UIKeyboardArbiterDebug sharedInstance];
        v35 = (void *)[[NSString alloc] initWithUTF8String:&v47];
        [v34 debugWithMessage:v35];

        if (v33 != &v47) {
          free(v33);
        }
        v36 = [(_UIKeyboardArbiter *)self _handleForSceneIdentity:v30];
        if (v36) {
          [(_UIKeyboardArbiter *)self _focusSceneHandle:v36 previousHostFocusHandle:v7 previousLeafFocusHandle:v8 shouldStealKeyboardOnSuccess:v3];
        }
        else {
          [(_UIKeyboardArbiter *)self _invalidateFocus];
        }
      }
    }
  }
}

- (id)_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:(id *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v5 = [(_UIKeyboardArbiter *)self _activeHandleForFocusEvaluation];
  id v6 = v5;
  if (a3) {
    *a3 = v5;
  }
  uint64_t v7 = [v6 remoteFocusContext];
  id v8 = [v7 sceneIdentity];

  id v9 = v6;
  id v10 = v9;
  int v11 = v9;
  if (v9)
  {
    int v11 = v9;
    if (!v8)
    {
      char v12 = [MEMORY[0x263EFF980] array];
      int v11 = [(_UIKeyboardArbiter *)self hostForHandle:v10 hosts:v12];
    }
  }
  int v13 = [v11 remoteFocusContext];
  long long v14 = [v13 sceneIdentity];

  if (v14)
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    long long v15 = _UIArbiterLog();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    int v26 = 138412290;
    v27 = v11;
    LODWORD(v25) = 12;
    id v16 = (long long *)_os_log_send_and_compose_impl();

    char v17 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v18 = (void *)[[NSString alloc] initWithUTF8String:&v28];
    [v17 debugWithMessage:v18];

    if (v16 != &v28) {
      free(v16);
    }
    id v19 = v11;
  }
  else
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    long long v20 = _UIArbiterLog();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    LOWORD(v26) = 0;
    LODWORD(v25) = 2;
    v21 = (long long *)_os_log_send_and_compose_impl();

    uint64_t v22 = +[_UIKeyboardArbiterDebug sharedInstance];
    v23 = (void *)[[NSString alloc] initWithUTF8String:&v28];
    [v22 debugWithMessage:v23];

    if (v21 != &v28) {
      free(v21);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)_activeHandleForFocusEvaluation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
  id v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = WeakRetained;
  }
  else {
    id v5 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
  }
  id v6 = v5;

  return v6;
}

- (void)_applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_pendingFocusLock);
  unint64_t pendingFocusLock_generation = self->_pendingFocusLock_generation;
  uint64_t pendingFocusLock_PID = self->_pendingFocusLock_PID;
  uint64_t v7 = self->_pendingFocusLock_sceneIdentity;
  if (pendingFocusLock_PID != -1 && pendingFocusLock_generation == a3)
  {
    self->_uint64_t pendingFocusLock_PID = -1;
    pendingFocusLock_sceneIdentity = self->_pendingFocusLock_sceneIdentity;
    self->_pendingFocusLock_sceneIdentity = 0;

    os_unfair_lock_unlock(&self->_pendingFocusLock);
    memset(v20, 0, sizeof(v20));
    id v10 = _UIArbiterLog();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    *(_DWORD *)long long v15 = 134218498;
    *(void *)&v15[4] = a3;
    __int16 v16 = 1024;
    int v17 = pendingFocusLock_PID;
    __int16 v18 = 2112;
    id v19 = v7;
    LODWORD(v14) = 28;
    int v11 = (_OWORD *)_os_log_send_and_compose_impl();

    char v12 = +[_UIKeyboardArbiterDebug sharedInstance];
    int v13 = (void *)[[NSString alloc] initWithUTF8String:v20];
    [v12 debugWithMessage:v13];

    if (v11 != v20) {
      free(v11);
    }
    [(_UIKeyboardArbiter *)self _updateCurrentKeyboardFocusToPID:pendingFocusLock_PID sceneIdentity:v7];
  }
  else
  {
    os_unfair_lock_unlock(&self->_pendingFocusLock);
  }
}

- (id)hostForHandle:(id)a3 hosts:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 remoteFocusContext];
  id v9 = [v8 sceneIdentity];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v11 = self->_clients;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          __int16 v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v16, (void)v21) & 1) == 0
            && (objc_msgSend(v16, "isHostingPID:", objc_msgSend(v6, "processIdentifier")) & 1) != 0)
          {
            [v7 addObject:v16];
            uint64_t v17 = [(_UIKeyboardArbiter *)self hostForHandle:v16 hosts:v7];
            __int16 v18 = (void *)v17;
            if (v17) {
              id v19 = (void *)v17;
            }
            else {
              id v19 = v16;
            }
            id v10 = v19;

            goto LABEL_17;
          }
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_17:
  }
  return v10;
}

- (id)handlerForPID:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "processIdentifier", (void)v13) == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)_focusSceneHandle:(id)a3 previousHostFocusHandle:(id)a4 previousLeafFocusHandle:(id)a5 shouldStealKeyboardOnSuccess:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v27 = [NSString stringWithFormat:@"must have a handle here"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v28 = NSStringFromSelector(a2);
      long long v29 = (objc_class *)objc_opt_class();
      long long v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = self;
      LOWORD(v35) = 2114;
      *(void *)((char *)&v35 + 2) = @"_UIKeyboardArbiter.m";
      WORD5(v35) = 1024;
      HIDWORD(v35) = 1806;
      LOWORD(v36) = 2114;
      *(void *)((char *)&v36 + 2) = v27;
      _os_log_error_impl(&dword_225660000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x225664764);
  }
  id v14 = v13;
  uint64_t v15 = [v11 processIdentifier];
  long long v16 = [v11 remoteFocusContext];
  uint64_t v17 = [v16 sceneIdentity];
  [(_UIKeyboardArbiter *)self _updateCurrentKeyboardFocusToPID:v15 sceneIdentity:v17];

  [v11 beginAcquiringFocusOnQueue:self->_queue];
  BOOL v18 = v11 == v14 || v11 == v12;
  if (v18 && v6)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    memset(buf, 0, sizeof(buf));
    id v19 = _UIArbiterLog();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    int v32 = 138412290;
    id v33 = v14;
    LODWORD(v31) = 12;
    long long v20 = (uint8_t *)_os_log_send_and_compose_impl();

    long long v21 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v22 = (void *)[[NSString alloc] initWithUTF8String:buf];
    [v21 debugWithMessage:v22];

    if (v20 != buf) {
      free(v20);
    }
    long long v23 = [MEMORY[0x263F83020] informationForKeyboardDown];
    long long v24 = [v14 remoteFocusContext];
    uint64_t v25 = [v24 sceneIdentity];
    uint64_t v26 = [v25 stringRepresentation];
    [v23 setSourceSceneIdentityString:v26];

    [(_UIKeyboardArbiter *)self updateKeyboardStatus:v23 fromHandler:v14 fromFocus:1];
  }
}

- (void)_updateCurrentKeyboardFocusToPID:(int)a3 sceneIdentity:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v6 = (FBSSceneIdentityToken *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v22, 0, sizeof(v22));
  uint64_t v7 = _UIArbiterLog();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  v19[0] = 67109378;
  v19[1] = a3;
  __int16 v20 = 2112;
  long long v21 = v6;
  LODWORD(v18) = 18;
  uint64_t v8 = (_OWORD *)_os_log_send_and_compose_impl();

  id v9 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v10 = (void *)[[NSString alloc] initWithUTF8String:v22];
  [v9 debugWithMessage:v10];

  if (v8 != v22) {
    free(v8);
  }
  id v11 = [(_UIKeyboardArbiter *)self _currentFocusedHandle];
  id v12 = v11;
  if (v11)
  {
    int v13 = [v11 processIdentifier];
    id v14 = [v12 remoteFocusContext];
    uint64_t v15 = [v14 sceneIdentity];
    char v16 = BSEqualObjects();

    if (v13 != a3 && (v16 & 1) == 0) {
      [v12 clearAcquiringFocus];
    }
  }
  self->_currentFocusPID = a3;
  currentFocusSceneIdentity = self->_currentFocusSceneIdentity;
  self->_currentFocusSceneIdentity = v6;
}

- (id)_currentFocusedHandle
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_currentFocusPID != -1)
  {
    BOOL v3 = -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:");
    if (v3) {
      goto LABEL_6;
    }
    memset(v15, 0, sizeof(v15));
    id v4 = _UIArbiterLog();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    int currentFocusPID = self->_currentFocusPID;
    currentFocusSceneIdentity = self->_currentFocusSceneIdentity;
    v12[0] = 67240450;
    v12[1] = currentFocusPID;
    __int16 v13 = 2114;
    id v14 = currentFocusSceneIdentity;
    LODWORD(v11) = 18;
    uint64_t v7 = (_OWORD *)_os_log_send_and_compose_impl();

    uint64_t v8 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v9 = (void *)[[NSString alloc] initWithUTF8String:v15];
    [v8 errorWithMessage:v9];

    if (v7 != v15) {
      free(v7);
    }
  }
  BOOL v3 = 0;
LABEL_6:
  return v3;
}

- (void)updateKeyboardSceneSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(_UIKeyboardArbiter *)self remoteFocusContext];
  id v4 = [v3 sceneIdentity];

  id v5 = v4;
  BSDispatchMain();
}

- (id)remoteFocusContext
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  id v5 = [WeakRetained remoteFocusContext];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = self->_clients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    p_keyboardUIHandle = &self->_keyboardUIHandle;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "active", (void)v19))
        {
          id v13 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
          if (v12 == v13) {
            goto LABEL_11;
          }
          id v14 = v13;
          id v15 = objc_loadWeakRetained((id *)p_keyboardUIHandle);

          if (v12 != v15)
          {
            id v16 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
            int v17 = [v12 isHandlerShowableWithHandler:v16];

            if (v17)
            {
              [v12 remoteFocusContext];
              v5 = id v12 = v5;
LABEL_11:

              continue;
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)reevaluateSceneClientSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(_UIKeyboardArbiter *)self sceneLink];
  int v4 = [v3 isAvailable];

  if (v4)
  {
    id v5 = [(_UIKeyboardArbiter *)self sceneLink];
    [v5 updateSceneSettings];
  }
}

- (_UIKeyboardArbiterLink)sceneLink
{
  return self->_sceneLink;
}

- (void)updateSceneClientSettings:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    [v7 level];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }

  id v10 = [(_UIKeyboardArbiter *)self focusContext];
  if (v9 < 2.0) {
    double v9 = 2.0;
  }
  [v5 setPreferredLevel:v9];
  uint64_t v11 = [v10 sceneIdentity];
  [v5 setPreferredSceneHostIdentity:v11];

  if (([MEMORY[0x263F828A0] inputUIOOP] & 1) == 0)
  {
    if (![MEMORY[0x263F828A0] usesInputSystemUIForAutoFillOnly]) {
      goto LABEL_12;
    }
    id v12 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    if (![v12 requiresInputUIForAutofillUIOnly])
    {
LABEL_11:

LABEL_12:
      if (v10) {
        goto LABEL_30;
      }
      goto LABEL_15;
    }
    id v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    if ([v13 deactivating])
    {

      goto LABEL_11;
    }
  }
LABEL_15:
  id v14 = _UIArbiterLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[_UIKeyboardArbiter updateSceneClientSettings:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = objc_opt_class();
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v10;
    LOWORD(v41) = 2048;
    *(double *)((char *)&v41 + 2) = v9;
    id v34 = *(id *)&buf[14];
    _os_log_debug_impl(&dword_225660000, v14, OS_LOG_TYPE_DEBUG, "%s  [%@] Updating focus context to %@ level %f", buf, 0x2Au);
  }
  id v15 = [(_UIKeyboardArbiter *)self sceneDelegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    int v17 = [(_UIKeyboardArbiter *)self sceneDelegate];
    uint64_t v18 = [v10 sceneIdentity];
    [v17 focusedSceneIdentityDidChange:v18];
  }
  long long v19 = [(_UIKeyboardArbiter *)self sceneDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v21 = [v10 sceneIdentity];
    if (v21 && (long long v22 = (void *)v21, v23 = [v10 contextID], v22, !v23))
    {
      uint64_t v24 = _UIArbiterLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[_UIKeyboardArbiter updateSceneClientSettings:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_debug_impl(&dword_225660000, v24, OS_LOG_TYPE_DEBUG, "%s  skipping updating focustContext = %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v24 = [(_UIKeyboardArbiter *)self sceneDelegate];
      [v24 focusContextDidChange:v10];
    }
  }
  uint64_t v25 = [(_UIKeyboardArbiter *)self sceneDelegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    memset(buf, 0, sizeof(buf));
    v27 = _UIArbiterLog();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    long long v28 = objc_opt_class();
    id v29 = v28;
    int v36 = 138412546;
    long long v37 = v28;
    __int16 v38 = 2048;
    unint64_t v39 = [(_UIKeyboardArbiter *)self keyboardScenePresentationMode];
    LODWORD(v35) = 22;
    long long v30 = (uint8_t *)_os_log_send_and_compose_impl();

    uint64_t v31 = +[_UIKeyboardArbiterDebug sharedInstance];
    int v32 = (void *)[[NSString alloc] initWithUTF8String:buf];
    [v31 debugWithMessage:v32];

    if (v30 != buf) {
      free(v30);
    }
    id v33 = [(_UIKeyboardArbiter *)self sceneDelegate];
    objc_msgSend(v33, "focusContext:didChangeKeyboardScenePresentationMode:", v10, -[_UIKeyboardArbiter keyboardScenePresentationMode](self, "keyboardScenePresentationMode"));
  }
LABEL_30:
}

- (_UIKeyboardArbiterSceneDelegate)sceneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  return (_UIKeyboardArbiterSceneDelegate *)WeakRetained;
}

- (_UIKeyboardArbiterOmniscientDelegate)omniscientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
  return (_UIKeyboardArbiterOmniscientDelegate *)WeakRetained;
}

- (id)focusContext
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    [v5 level];
  }
  id v6 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
  id v7 = [v6 remoteFocusContext];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v8 = self->_clients;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "active", (void)v20))
        {
          id v14 = [v13 remoteFocusContext];
          id v15 = [v14 sceneIdentity];

          if (v15)
          {
            id v16 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
            int v17 = [v13 isHandlerShowableWithHandler:v16];

            if (v17)
            {
              [v13 level];
              uint64_t v18 = [v13 remoteFocusContext];

              id v7 = (void *)v18;
            }
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)updateInterestedBundleIDs
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v18 = self;
  int v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "processHandle", v18);

        if (v10)
        {
          uint64_t v11 = (void *)MEMORY[0x263F645D8];
          id v12 = [v9 processHandle];
          uint64_t v13 = [v11 predicateMatchingHandle:v12];
        }
        else
        {
          if (![v9 processIdentifier]) {
            continue;
          }
          id v14 = (void *)MEMORY[0x263F645D8];
          id v12 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", objc_msgSend(v9, "processIdentifier"));
          uint64_t v13 = [v14 predicateMatchingIdentifier:v12];
        }
        id v15 = (void *)v13;

        [v3 addObject:v15];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  processMonitor = v18->_processMonitor;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  _DWORD v19[2] = __47___UIKeyboardArbiter_updateInterestedBundleIDs__block_invoke;
  v19[3] = &unk_264721598;
  id v20 = v3;
  id v17 = v3;
  [(RBSProcessMonitor *)processMonitor updateConfiguration:v19];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = +[_UIKeyboardArbiterClientHandle handlerWithArbiter:self forConnection:v5];
  [v5 setExportedObject:v6];
  uint64_t v7 = [v6 bundleIdentifier];
  if ([v7 isEqualToString:@"com.apple.TapToRadar"])
  {

LABEL_4:
    uint64_t v10 = +[_UIKeyboardArbiterDebug sharedInstance];
    char v11 = 1;
    [v10 setPause:1];

    goto LABEL_6;
  }
  double v8 = [v6 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.appleseed.FeedbackAssistant"];

  if (v9) {
    goto LABEL_4;
  }
  char v11 = 0;
LABEL_6:
  memset(v40, 0, 512);
  id v12 = _UIArbiterLog();
  os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  int v36 = 138412546;
  id v37 = (id)objc_opt_class();
  __int16 v38 = 2112;
  unint64_t v39 = v6;
  id v13 = v37;
  LODWORD(v30) = 22;
  id v14 = (unsigned char *)_os_log_send_and_compose_impl();

  id v15 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v16 = (void *)[[NSString alloc] initWithUTF8String:v40];
  [v15 debugWithMessage:v16];

  if (v14 != v40) {
    free(v14);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke;
  v34[3] = &unk_264721750;
  v34[4] = self;
  v34[5] = v5;
  v34[6] = v6;
  char v35 = v11;
  [v5 setInvalidationHandler:v34];
  if ([(id)objc_opt_class() unitTestEnvironment])
  {
    id v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89CF48];
    [v5 setExportedInterface:v17];

    uint64_t v18 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89D048];
    [v5 setRemoteObjectInterface:v18];

    +[_UIKeyboardArbiter configureEncodedClassesForXPCConnection:v5];
  }
  else
  {
    long long v19 = [v5 valueForEntitlement:@"com.apple.KeyboardArbiter.client.inputuihost"];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      long long v21 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89CF48];
      [v5 setExportedInterface:v21];

      long long v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89BD88];
      [v5 setRemoteObjectInterface:v22];

      [v6 setInputUIHost:1];
      objc_storeWeak((id *)&self->_keyboardUIHandle, v6);
    }
    else
    {
      if ([MEMORY[0x263F828A0] inputUIOOP])
      {
        long long v23 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89BA98];
        [v5 setExportedInterface:v23];

        [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D89D048];
      }
      else
      {
        long long v24 = _UIKeyboardArbitration_Interface();
        [v5 setExportedInterface:v24];

        _UIKeyboardArbitrationClient_Interface();
      uint64_t v25 = };
      [v5 setRemoteObjectInterface:v25];
    }
  }
  [v5 _setQueue:self->_queue];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_264721700;
  void block[4] = self;
  id v32 = v6;
  id v33 = v5;
  id v27 = v5;
  id v28 = v6;
  dispatch_async(queue, block);

  return 1;
}

- (void)newClientConnected:(id)a3 withExpectedState:(id)a4 onConnected:(id)a5
{
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 keyboardOnScreen]
    && (id v10 = objc_loadWeakRetained((id *)&self->_disablingHandle), v10, !v10))
  {
    id v17 = v8;
    if (self->_pidOnDeviceLocked >= 1
      && [v41 processIdentifier] == self->_pidOnDeviceLocked)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);

      if (WeakRetained)
      {
        uint64_t v19 = [MEMORY[0x263F83020] informationForKeyboardDown];

        id v17 = (id)v19;
      }
      else
      {
        self->_pidOnDeviceLocked = 0;
      }
    }
    [(_UIKeyboardArbiter *)self updateKeyboardStatus:v17 fromHandler:v41];
    (*((void (**)(id, void, void, int64_t, void))v9 + 2))(v9, 0, 0, self->_lastEventSource, 0);
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    char v12 = [v11 deactivating];

    if (v12)
    {
      int v13 = 1;
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
      id v15 = [v14 remoteFocusContext];
      id v16 = [v15 sceneIdentity];

      if (v16)
      {
        int v13 = 0;
      }
      else
      {
        id v20 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
        long long v21 = [MEMORY[0x263EFF980] array];
        long long v22 = [(_UIKeyboardArbiter *)self hostForHandle:v20 hosts:v21];

        int v13 = [v22 deactivating];
      }
    }
    long long v23 = [(_UIKeyboardArbiter *)self lastUpdate];

    if (!v23 || v13)
    {
      uint64_t v24 = [MEMORY[0x263F83020] informationForKeyboardDown];
    }
    else
    {
      uint64_t v24 = [(_UIKeyboardArbiter *)self lastUpdate];
    }
    id v17 = (id)v24;
    lastUIInformation = self->_lastUIInformation;
    if (lastUIInformation) {
      char v26 = v13;
    }
    else {
      char v26 = 1;
    }
    if (v26)
    {
      id v27 = objc_alloc(MEMORY[0x263F83028]);
      id v28 = (_UIKeyboardUIInformation *)objc_msgSend(v27, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    }
    else
    {
      id v28 = lastUIInformation;
    }
    id v29 = v28;
    int64_t lastEventSource = self->_lastEventSource;
    id v31 = objc_loadWeakRetained((id *)&self->_disablingHandle);
    (*((void (**)(id, id, _UIKeyboardUIInformation *, int64_t, BOOL))v9 + 2))(v9, v17, v29, lastEventSource, v31 != 0);
  }
  id v32 = [v41 bundleIdentifier];
  int v33 = [v32 isEqualToString:@"com.apple.Spotlight"];

  id v34 = [v41 bundleIdentifier];
  int v35 = [v34 isEqualToString:@"com.apple.CoreAuthUI"];

  id v36 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (!v36
    || ((id v37 = v36, v38 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle), v38 == v41)
      ? (int v39 = 1)
      : (int v39 = v33),
        int v40 = v39 | v35,
        v38,
        v37,
        v40 == 1))
  {
    [(_UIKeyboardArbiter *)self handlerRequestedFocus:v41 shouldStealKeyboard:0];
  }
}

- (_UIKeyboardChangedInformation)lastUpdate
{
  return self->_lastUpdate;
}

- (void)handlerRequestedFocus:(id)a3 shouldStealKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 inputUIHost])
  {
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
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v7 = _UIArbiterLog();
    os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    id v8 = objc_opt_class();
    id v9 = @"NO";
    *(_DWORD *)long long v46 = 138543874;
    *(void *)&v46[4] = v8;
    *(_WORD *)&v46[12] = 2114;
    if (v4) {
      id v9 = @"YES";
    }
    *(void *)&v46[14] = v6;
    *(_WORD *)&v46[22] = 2114;
    long long v47 = v9;
    id v10 = v8;
    LODWORD(v44) = 32;
    id v11 = (long long *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v46, v44, *(_OWORD *)v46, *(void *)&v46[16], v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
    char v12 = (void)v75);
    int v13 = (void *)[[NSString alloc] initWithUTF8String:&v48];
    [v12 errorWithMessage:v13];

    if (v11 != &v48) {
      free(v11);
    }
  }
  else
  {
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
      BOOL v4 = WeakRetained != v6;
    }
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
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v15 = _UIArbiterLog();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    id v16 = objc_opt_class();
    id v17 = @"NO";
    *(_DWORD *)long long v46 = 138543874;
    *(void *)&v46[4] = v16;
    *(_WORD *)&v46[12] = 2114;
    if (v4) {
      id v17 = @"YES";
    }
    *(void *)&v46[14] = v6;
    *(_WORD *)&v46[22] = 2114;
    long long v47 = v17;
    id v18 = v16;
    LODWORD(v44) = 32;
    uint64_t v19 = (long long *)_os_log_send_and_compose_impl();

    unint64_t v20 = 0x26AC12000uLL;
    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v46, v44, *(void *)v46, *(_OWORD *)&v46[8], v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
    long long v21 = (void)v75);
    unint64_t v22 = 0x263F08000uLL;
    long long v23 = (void *)[[NSString alloc] initWithUTF8String:&v48];
    [v21 debugWithMessage:v23];

    if (v19 != &v48) {
      free(v19);
    }
    id v24 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    char v25 = BSEqualObjects();

    if ((v25 & 1) == 0)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      id v27 = v26;
      if (v26 && ([v26 inputUIHost] & 1) == 0) {
        -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", &__block_literal_global_160, v27, "-[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:]");
      }
      id v28 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      [v28 clearAcquiringFocus];

      objc_storeWeak((id *)&self->_focusRequestedHandle, v6);
      id v29 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);

      char v30 = !v4;
      if (v29) {
        char v30 = 1;
      }
      if (v30)
      {
        id v37 = @"NO";
      }
      else
      {
        id v31 = [MEMORY[0x263F83020] informationForKeyboardDown];
        id v32 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
        int v33 = [v32 remoteFocusContext];
        id v34 = [v33 sceneIdentity];
        int v35 = [v34 stringRepresentation];
        [v31 setSourceSceneIdentityString:v35];

        unint64_t v22 = 0x263F08000;
        unint64_t v20 = 0x26AC12000;

        id v36 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
        [(_UIKeyboardArbiter *)self updateKeyboardStatus:v31 fromHandler:v36 fromFocus:1];

        id v37 = @"YES";
      }
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
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v38 = _UIArbiterLog();
      os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      int v39 = objc_opt_class();
      *(_DWORD *)long long v46 = 138412802;
      *(void *)&v46[4] = v39;
      *(_WORD *)&v46[12] = 2114;
      *(void *)&v46[14] = v6;
      *(_WORD *)&v46[22] = 2114;
      long long v47 = v37;
      id v40 = v39;
      LODWORD(v45) = 32;
      id v41 = (long long *)_os_log_send_and_compose_impl();

      long long v42 = objc_msgSend((id)(v20 + 1880), "sharedInstance", v46, v45);
      long long v43 = (void *)[objc_alloc(*(Class *)(v22 + 2880)) initWithUTF8String:&v48];
      [v42 debugWithMessage:v43];

      if (v41 != &v48) {
        free(v41);
      }
    }
    [(_UIKeyboardArbiter *)self reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:v4];
  }
}

+ (BOOL)unitTestEnvironment
{
  if (qword_26AC12AC0 != -1) {
    dispatch_once(&qword_26AC12AC0, &__block_literal_global_309);
  }
  return _MergedGlobals_2;
}

- (void)_invalidateFocus
{
}

- (_UIKeyboardArbiter)initWithLink:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIKeyboardArbiter;
  id v6 = [(_UIKeyboardArbiter *)&v29 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.UIKit.keyboard-arbiter", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    clients = v6->_clients;
    v6->_clients = (NSMutableArray *)v10;

    v6->_int currentFocusPID = -1;
    v6->_pendingFocusLock._os_unfair_lock_opaque = 0;
    v6->_uint64_t pendingFocusLock_PID = -1;
    objc_storeStrong((id *)&v6->_sceneLink, a3);
    [(_UIKeyboardArbiterLink *)v6->_sceneLink setOwner:v6];
    uint64_t v12 = [MEMORY[0x263EFF9B0] orderedSet];
    recentlyActiveSceneIdentities = v6->_recentlyActiveSceneIdentities;
    v6->_recentlyActiveSceneIdentities = (NSMutableOrderedSet *)v12;

    id v14 = v6->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke;
    block[3] = &unk_2647211F0;
    id v15 = v6;
    id v28 = v15;
    dispatch_sync(v14, block);
    id v16 = [(_UIKeyboardArbiter *)v15 sceneLink];
    id v17 = [v16 serviceName];

    if (v17)
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v17];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x263F08D88] serviceListener];
    }
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v18;

    [(NSXPCListener *)v15->_listener setDelegate:v15];
    objc_initWeak(&location, v15);
    unint64_t v20 = (void *)MEMORY[0x263F645C0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke_2;
    v24[3] = &unk_264721240;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [v20 monitorWithConfiguration:v24];
    processMonitor = v15->_processMonitor;
    v15->_processMonitor = (RBSProcessMonitor *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)resume
{
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiter;
  [(_UIKeyboardArbiter *)&v3 dealloc];
}

- (id)_descriptionWithScene:(BOOL)a3
{
  BOOL v4 = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(v4);
  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardArbiter;
  id v5 = [(_UIKeyboardArbiter *)&v12 description];
  id v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  [v6 appendString:@"; "];
  [v6 appendString:@"scene data omitted;\n"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disablingHandle);
  [v6 appendFormat:@"disabler = %@;\n", WeakRetained];

  objc_msgSend(v6, "appendFormat:", @"int64_t lastEventSource = %ld;\n", self->_lastEventSource);
  lastUIInformation = self->_lastUIInformation;
  id v9 = lastUIInformation;
  if (!lastUIInformation)
  {
    id v9 = [(_UIKeyboardArbiter *)self lastUpdate];
  }
  [v6 appendFormat:@"current state = %@;\n", v9];
  if (!lastUIInformation) {

  }
  id v10 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  [v6 appendFormat:@"active handle = %@;\n", v10];

  [v6 appendFormat:@"handles = %@>", self->_clients];
  objc_sync_exit(v4);

  return v6;
}

- (NSString)description
{
  return (NSString *)[(_UIKeyboardArbiter *)self _descriptionWithScene:1];
}

- (void)retrieveDebugInformationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  dispatch_group_enter(v5);
  id v6 = +[_UIKeyboardArbiterDebug sharedInstance];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke;
  v20[3] = &unk_264721268;
  unint64_t v22 = v23;
  uint64_t v7 = v5;
  uint64_t v21 = v7;
  [v6 getDebugInfoDictionariesWithCompletionHandler:v20];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  id v19 = 0;
  dispatch_group_enter(v7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_70;
  v15[3] = &unk_264721268;
  id v17 = v18;
  dispatch_queue_t v8 = v7;
  id v16 = v8;
  [(_UIKeyboardArbiter *)self retrieveClientDebugInformationWithCompletion:v15];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_2;
  block[3] = &unk_264721290;
  id v12 = v4;
  int v13 = v23;
  id v14 = v18;
  id v10 = v4;
  dispatch_group_notify(v8, queue, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v23, 8);
}

- (void)captureStateForDebug
{
  objc_super v3 = +[_UIKeyboardArbiterDebug sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42___UIKeyboardArbiter_captureStateForDebug__block_invoke;
  v4[3] = &unk_2647212B8;
  v4[4] = self;
  [v3 addAsynchronousData:v4];
}

- (void)retrieveClientDebugInformationWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v27 = v4;
    id v6 = [MEMORY[0x263EFF980] array];
    dispatch_group_t v7 = dispatch_group_create();
    queue = self->_queue;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke;
    v46[3] = &unk_264721308;
    v46[4] = self;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_3;
    v43[3] = &unk_264721330;
    id v30 = v6;
    id v44 = v30;
    uint64_t v45 = self;
    dispatch_group_t group = v7;
    AsyncTaskWithTimeout(v7, queue, v46, v43);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = self->_clients;
    uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          id v14 = [MEMORY[0x263EFF9A0] dictionary];
          id v15 = [v13 description];
          [v14 setObject:v15 forKey:@"Description"];

          id v16 = NSNumber;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
          uint64_t v18 = [v16 numberWithInt:WeakRetained == v13];
          [v14 setObject:v18 forKey:@"Active"];

          id v19 = NSNumber;
          id v20 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
          uint64_t v21 = [v19 numberWithInt:v20 == v13];
          [v14 setObject:v21 forKey:@"LastActivated"];

          unint64_t v22 = NSNumber;
          id v23 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
          id v24 = [v22 numberWithInt:v23 == v13];
          [v14 setObject:v24 forKey:@"FocusRequested"];

          if ([v13 running])
          {
            v34[0] = MEMORY[0x263EF8330];
            v34[1] = 3221225472;
            v34[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_4;
            v34[3] = &unk_2647213A8;
            int v35 = group;
            id v36 = self;
            id v37 = v14;
            id v38 = v30;
            -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v34, v13, "-[_UIKeyboardArbiter retrieveClientDebugInformationWithCompletion:]");
          }
          else
          {
            [v14 setObject:@"Suspended" forKey:@"Process"];
            [v30 addObject:v14];
          }
        }
        uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v10);
    }

    id v25 = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_8;
    block[3] = &unk_2647212E0;
    id v5 = v27;
    id v32 = v30;
    id v33 = v27;
    id v26 = v30;
    dispatch_group_notify(group, v25, block);
  }
}

- (void)attemptConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v3 = [(_UIKeyboardArbiter *)self sceneLink];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___UIKeyboardArbiter_attemptConnection__block_invoke;
  v4[3] = &unk_2647213D0;
  v4[4] = self;
  [v3 createSceneWithCompletion:v4];
}

- (void)runOperations:(id)a3 onHandler:(id)a4 fromFunction:(const char *)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  dispatch_queue_t v8 = (void (**)(id, void *, void *))a3;
  id v9 = a4;
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
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v10 = _UIArbiterLog();
  os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  int v32 = 136315394;
  id v33 = a5;
  __int16 v34 = 2112;
  id v35 = v9;
  LODWORD(v25) = 22;
  uint64_t v11 = (long long *)_os_log_send_and_compose_impl();

  id v12 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v13 = (void *)[[NSString alloc] initWithUTF8String:&v36];
  [v12 debugWithMessage:v13];

  if (v11 != &v36) {
    free(v11);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v9 running])
  {
    id v14 = [v9 connection];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke;
    v29[3] = &unk_2647213F8;
    id v31 = a5;
    id v15 = v9;
    id v30 = v15;
    id v16 = [v14 remoteObjectProxyWithErrorHandler:v29];

    if (v16)
    {
      if ([v15 takeProcessAssertionOnRemoteWithQueue:self->_queue])
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke_118;
        v27[3] = &unk_2647211A0;
        v27[4] = self;
        id v28 = v15;
        v8[2](v8, v16, v27);
      }
      else
      {
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
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v21 = _UIArbiterLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        int v32 = 138412290;
        id v33 = (const char *)v9;
        LODWORD(v26) = 12;
        unint64_t v22 = (long long *)_os_log_send_and_compose_impl();

        id v23 = +[_UIKeyboardArbiterDebug sharedInstance];
        id v24 = (void *)[[NSString alloc] initWithUTF8String:&v36];
        [v23 errorWithMessage:v24];

        if (v22 != &v36) {
          free(v22);
        }
        [v15 releaseProcessAssertion];
      }
    }
    else
    {
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
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = _UIArbiterLog();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      int v32 = 136315394;
      id v33 = a5;
      __int16 v34 = 2112;
      id v35 = v9;
      LODWORD(v26) = 22;
      uint64_t v18 = (long long *)_os_log_send_and_compose_impl();

      id v19 = +[_UIKeyboardArbiterDebug sharedInstance];
      id v20 = (void *)[[NSString alloc] initWithUTF8String:&v36];
      [v19 errorWithMessage:v20];

      if (v18 != &v36) {
        free(v18);
      }
    }
  }
}

- (void)scheduleWindowTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = self->_updateCounter + 1;
  self->_updateCounter = v3;
  dispatch_time_t v4 = dispatch_time(0, 4000000000);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke;
  v6[3] = &unk_264721440;
  v6[4] = self;
  int v7 = v3;
  dispatch_after(v4, queue, v6);
}

- (id)hostBundleIdentifierForHandle:(id)a3 hosts:(id)a4
{
  dispatch_time_t v4 = [(_UIKeyboardArbiter *)self hostForHandle:a3 hosts:a4];
  id v5 = [v4 bundleIdentifier];

  return v5;
}

- (void)_cullRecentlyActiveSceneIdentities
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_recentlyActiveSceneIdentities count];
  if ((unint64_t)[(NSMutableOrderedSet *)self->_recentlyActiveSceneIdentities count] >= 7)
  {
    recentlyActiveSceneIdentities = self->_recentlyActiveSceneIdentities;
    -[NSMutableOrderedSet removeObjectsInRange:](recentlyActiveSceneIdentities, "removeObjectsInRange:", 0, v3 - 6);
  }
}

- (void)_trackRecentlyActiveArbiterHandle:(id)a3
{
  id v12 = a3;
  dispatch_time_t v4 = [v12 remoteFocusContext];
  uint64_t v5 = [v4 sceneIdentity];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = [v12 isKeyboardOnScreen];

    if (v7)
    {
      recentlyActiveSceneIdentities = self->_recentlyActiveSceneIdentities;
      id v9 = [v12 remoteFocusContext];
      uint64_t v10 = [v9 sceneIdentity];
      uint64_t v11 = [v10 stringRepresentation];
      [(NSMutableOrderedSet *)recentlyActiveSceneIdentities addObject:v11];

      [(_UIKeyboardArbiter *)self _cullRecentlyActiveSceneIdentities];
    }
  }
  else
  {
  }
}

- (void)updateKeyboardUIStatus:(id)a3 fromHandler:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v44 = a4;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  int v7 = _UIArbiterLog();
  os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  int v57 = 138412802;
  id v58 = (id)objc_opt_class();
  __int16 v59 = 2112;
  id v60 = v6;
  __int16 v61 = 2112;
  id v62 = v44;
  id v8 = v58;
  LODWORD(v40) = 32;
  id v9 = (long long *)_os_log_send_and_compose_impl();

  uint64_t v10 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v11 = (void *)[[NSString alloc] initWithUTF8String:&v63];
  [v10 infoWithMessage:v11];

  if (v9 != &v63) {
    free(v9);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id obj = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(obj);
  if (([v6 hasValidNotification] & 1) == 0)
  {
    id v12 = (_UIKeyboardUIInformation *)[v6 copy];
    lastUIInformation = self->_lastUIInformation;
    self->_lastUIInformation = v12;
  }
  id v14 = (void *)[v6 copy];
  id v15 = (void *)[v14 copyWithoutFence];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke;
  v53[3] = &unk_264721468;
  v53[4] = self;
  id v43 = v14;
  id v54 = v43;
  id v42 = v15;
  id v55 = v42;
  long long v46 = (void (**)(void, void))MEMORY[0x22A631F50](v53);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = self->_clients;
  uint64_t v16 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (!v16)
  {

LABEL_27:
    long long v37 = [v6 bundleIdentifier];
    pendingBundleIdentifier = self->_pendingBundleIdentifier;
    self->_pendingBundleIdentifier = v37;

    long long v39 = (void *)MEMORY[0x22A631F50](v46);
    id pendingNotifyKeyboardChanged = self->_pendingNotifyKeyboardChanged;
    self->_id pendingNotifyKeyboardChanged = v39;
    goto LABEL_28;
  }
  char v17 = 0;
  uint64_t v48 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v50 != v48) {
        objc_enumerationMutation(v47);
      }
      id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (([v19 inputUIHost] & 1) == 0)
      {
        if (v17)
        {
          char v20 = 0;
        }
        else
        {
          uint64_t v21 = [v19 bundleIdentifier];
          unint64_t v22 = [v6 bundleIdentifier];
          char v20 = [v21 isEqualToString:v22];
        }
        v17 |= v20;
        if ([v19 deactivating])
        {
          [v19 setPendingNotifyKeyboardChanged:v46];
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v23 = _UIArbiterLog();
          os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          id v24 = objc_opt_class();
          int v57 = 138412546;
          id v58 = v24;
          __int16 v59 = 2112;
          id v60 = v19;
          id v25 = v24;
          LODWORD(v41) = 22;
          uint64_t v26 = (long long *)_os_log_send_and_compose_impl();

          id v27 = +[_UIKeyboardArbiterDebug sharedInstance];
          id v28 = (void *)[[NSString alloc] initWithUTF8String:&v63];
          [v27 infoWithMessage:v28];

          if (v26 != &v63) {
            free(v26);
          }
        }
        else if (![v6 resizing] || objc_msgSend(v19, "active"))
        {
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          objc_super v29 = _UIArbiterLog();
          os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
          id v30 = objc_opt_class();
          int v57 = 138412546;
          id v58 = v30;
          __int16 v59 = 2112;
          id v60 = v19;
          id v31 = v30;
          LODWORD(v41) = 22;
          int v32 = (long long *)_os_log_send_and_compose_impl();

          id v33 = +[_UIKeyboardArbiterDebug sharedInstance];
          __int16 v34 = (void *)[[NSString alloc] initWithUTF8String:&v63];
          [v33 infoWithMessage:v34];

          if (v32 != &v63) {
            free(v32);
          }
          ((void (**)(void, void *))v46)[2](v46, v19);
        }
      }
    }
    uint64_t v16 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v49 objects:v56 count:16];
  }
  while (v16);

  if ((v17 & 1) == 0) {
    goto LABEL_27;
  }
  id v35 = self->_pendingBundleIdentifier;
  self->_pendingBundleIdentifier = 0;

  id pendingNotifyKeyboardChanged = self->_pendingNotifyKeyboardChanged;
  self->_id pendingNotifyKeyboardChanged = 0;
LABEL_28:

  [v6 resetAnimationFencing];
  [v43 resetAnimationFencing];

  objc_sync_exit(obj);
}

- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4
{
}

- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4 fromFocus:(BOOL)a5
{
  uint64_t v206 = *MEMORY[0x263EF8340];
  id v154 = a3;
  id v155 = a4;
  v153 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [MEMORY[0x263EFF980] array];
  v150 = [(_UIKeyboardArbiter *)v153 hostForHandle:v155 hosts:v8];

  id v9 = v154;
  if (!a5 && ([v154 keyboardOnScreen] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v153->_activeInputDestinationHandle);

    if (WeakRetained != v155)
    {
      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      memset(buf, 0, sizeof(buf));
      uint64_t v11 = _UIArbiterLog();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      id v12 = objc_opt_class();
      id v13 = v12;
      id v14 = [v155 bundleIdentifier];
      id v15 = objc_loadWeakRetained((id *)&v153->_activeInputDestinationHandle);
      int v169 = 138412802;
      id v170 = v12;
      __int16 v171 = 2112;
      id v172 = v14;
      __int16 v173 = 2112;
      id v174 = v15;
      LODWORD(v145) = 32;
      uint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl();

      char v17 = +[_UIKeyboardArbiterDebug sharedInstance];
      uint64_t v18 = (void *)[[NSString alloc] initWithUTF8String:buf];
      [v17 debugWithMessage:v18];

      goto LABEL_11;
    }
  }
  p_activeInputDestinationHandle = (id *)&v153->_activeInputDestinationHandle;
  id v20 = objc_loadWeakRetained((id *)&v153->_activeInputDestinationHandle);
  if (!v20)
  {
LABEL_14:
    if (([v9 keyboardOnScreen] & 1) == 0) {
      v153->_int pidOnDeviceLocked = 0;
    }
    id v35 = [v150 bundleIdentifier];
    int v147 = [v35 isEqualToString:@"com.apple.InputUI"];

    id v36 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if (v36 == v155)
    {
      long long v37 = v154;
      char v38 = [v154 keyboardOnScreen];

      if ((v38 & 1) == 0)
      {
        p_previouslyActiveHandle = (id *)&v153->_previouslyActiveHandle;
        id v42 = v155;
        goto LABEL_26;
      }
    }
    else
    {

      long long v37 = v154;
    }
    id v39 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if (v39 && [v37 keyboardOnScreen])
    {

      if (v147)
      {
        id v40 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        objc_storeWeak((id *)&v153->_previouslyActiveHandle, v40);

        goto LABEL_27;
      }
    }
    else
    {
    }
    p_previouslyActiveHandle = (id *)&v153->_previouslyActiveHandle;
    id v42 = 0;
LABEL_26:
    objc_storeWeak(p_previouslyActiveHandle, v42);
LABEL_27:
    id v43 = [v150 bundleIdentifier];
    [v154 setHostBundleIdentifier:v43];

    objc_msgSend(v154, "setHostProcessIdentifier:", objc_msgSend(v150, "processIdentifier"));
    objc_msgSend(v154, "setProcessIdentifier:", objc_msgSend(v155, "processIdentifier"));
    id v44 = [v154 sourceBundleIdentifier];

    if (!v44)
    {
      long long v45 = [v155 bundleIdentifier];
      [v154 setSourceBundleIdentifier:v45];
    }
    long long v46 = v154;
    if ([v154 keyboardOnScreen])
    {
      long long v47 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v48 = [v47 userInterfaceIdiom];

      long long v46 = v154;
      if ((v48 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        id v49 = objc_loadWeakRetained((id *)&v153->_omniscientDelegate);
        if (objc_opt_respondsToSelector())
        {
          id v50 = objc_loadWeakRetained((id *)&v153->_omniscientDelegate);
          long long v51 = [v155 remoteFocusContext];
          long long v52 = [v51 sceneIdentity];
          int v53 = [v50 shouldKeyboardBeWindowSizedForHostWithIdentity:v52];

          long long v46 = v154;
          if (v53)
          {
            v152 = objc_msgSend(v154, "copyWithoutIAVKeyboardRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
            goto LABEL_37;
          }
        }
        else
        {
        }
      }
    }
    [v46 keyboardPosition];
    id v54 = objc_msgSend(v46, "copyWithoutIAVKeyboardRect:");
    [v46 keyboardPosition];
    double v56 = v55;
    [v46 keyboardPositionWithIAV];
    v152 = v54;
    if (vabdd_f64(v56, v57) > 0.00000011920929)
    {
      [v46 keyboardPositionWithIAV];
      objc_msgSend(v54, "setKeyboardPositionWithRemoteIAV:");
    }
LABEL_37:
    id obj = +[_UIKeyboardArbiterDebug sharedInstance];
    objc_sync_enter(obj);
    id v58 = objc_loadWeakRetained(p_activeInputDestinationHandle);

    if (v58 == v155) {
      goto LABEL_46;
    }
    __int16 v59 = [MEMORY[0x263EFF980] array];
    id v60 = [(_UIKeyboardArbiter *)v153 hostForHandle:v155 hosts:v59];

    id v61 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if ([v61 running])
    {
      id v62 = objc_loadWeakRetained(p_activeInputDestinationHandle);
      if ([v62 isKeyboardOnScreen])
      {
        long long v63 = [(_UIKeyboardArbiter *)v153 lastUpdate];
        long long v64 = [v63 hostBundleIdentifier];
        if (![v64 isEqualToString:@"com.apple.springboard"])
        {

LABEL_120:
          id v144 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          objc_msgSend(v155, "setPrevActiveIdentifier:", objc_msgSend(v144, "processIdentifier"));

          objc_msgSend(v60, "setPrevActiveIdentifier:", objc_msgSend(v155, "prevActiveIdentifier"));
          goto LABEL_45;
        }
        long long v65 = [v60 bundleIdentifier];
        char v66 = [v65 isEqualToString:@"com.apple.springboard"];

        if (v66) {
          goto LABEL_120;
        }
LABEL_45:

LABEL_46:
        if ([v154 keyboardOnScreen]) {
          long long v67 = v155;
        }
        else {
          long long v67 = 0;
        }
        id v149 = v67;
        int v68 = v147;
        if (v149) {
          int v68 = 0;
        }
        if (v68 == 1) {
          id v149 = objc_loadWeakRetained((id *)&v153->_previouslyActiveHandle);
        }
        id v146 = objc_loadWeakRetained(p_activeInputDestinationHandle);

        int v69 = [MEMORY[0x263F828A0] inputUIOOP];
        if (v149) {
          int v70 = 0;
        }
        else {
          int v70 = v69;
        }
        if (v70 == 1)
        {
          id v71 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          if (v71
            && ([v155 bundleIdentifier],
                long long v72 = objc_claimAutoreleasedReturnValue(),
                int v73 = [v72 isEqualToString:@"com.apple.Spotlight"],
                v72,
                v73))
          {
            id v74 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            long long v75 = [v74 bundleIdentifier];
            char v76 = [v75 isEqualToString:@"com.apple.Spotlight"];

            if ((v76 & 1) == 0)
            {
              id v149 = objc_loadWeakRetained(p_activeInputDestinationHandle);
              long long v204 = 0u;
              long long v205 = 0u;
              long long v202 = 0u;
              long long v203 = 0u;
              long long v200 = 0u;
              long long v201 = 0u;
              long long v198 = 0u;
              long long v199 = 0u;
              long long v196 = 0u;
              long long v197 = 0u;
              long long v194 = 0u;
              long long v195 = 0u;
              long long v192 = 0u;
              long long v193 = 0u;
              long long v190 = 0u;
              long long v191 = 0u;
              long long v188 = 0u;
              long long v189 = 0u;
              long long v186 = 0u;
              long long v187 = 0u;
              long long v184 = 0u;
              long long v185 = 0u;
              long long v182 = 0u;
              long long v183 = 0u;
              long long v180 = 0u;
              long long v181 = 0u;
              long long v178 = 0u;
              long long v179 = 0u;
              long long v176 = 0u;
              long long v177 = 0u;
              memset(buf, 0, sizeof(buf));
              long long v77 = _UIArbiterLog();
              os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG);
              long long v78 = objc_opt_class();
              id v79 = v78;
              id v80 = objc_loadWeakRetained(p_activeInputDestinationHandle);
              int v169 = 138412546;
              id v170 = v78;
              __int16 v171 = 2112;
              id v172 = v80;
              LODWORD(v145) = 22;
              long long v81 = (uint8_t *)_os_log_send_and_compose_impl();

              long long v82 = +[_UIKeyboardArbiterDebug sharedInstance];
              long long v83 = (void *)[[NSString alloc] initWithUTF8String:buf];
              [v82 debugWithMessage:v83];

              if (v81 != buf) {
                free(v81);
              }
              [v154 resetAnimationFencing];
              [v152 resetAnimationFencing];
LABEL_117:

              objc_sync_exit(obj);
              goto LABEL_118;
            }
          }
          else
          {
          }
        }
        id v84 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        int v85 = [v84 prevActiveIdentifier];
        if (v85 == [v155 processIdentifier])
        {
          id v86 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          long long v87 = [v86 bundleIdentifier];
          if ([v87 isEqualToString:@"com.apple.siri"])
          {

            goto LABEL_111;
          }
          id v133 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          v134 = [v133 bundleIdentifier];
          int v135 = [v134 isEqualToString:@"com.apple.WritingToolsUIService"];

          if (v135)
          {
LABEL_111:
            long long v204 = 0u;
            long long v205 = 0u;
            long long v202 = 0u;
            long long v203 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            long long v198 = 0u;
            long long v199 = 0u;
            long long v196 = 0u;
            long long v197 = 0u;
            long long v194 = 0u;
            long long v195 = 0u;
            long long v192 = 0u;
            long long v193 = 0u;
            long long v190 = 0u;
            long long v191 = 0u;
            long long v188 = 0u;
            long long v189 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            long long v184 = 0u;
            long long v185 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            long long v180 = 0u;
            long long v181 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            long long v176 = 0u;
            long long v177 = 0u;
            memset(buf, 0, sizeof(buf));
            v136 = _UIArbiterLog();
            os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG);
            id v137 = (id)objc_opt_class();
            v138 = [v155 bundleIdentifier];
            id v139 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            v140 = [v139 bundleIdentifier];
            int v169 = 138412802;
            id v170 = v137;
            __int16 v171 = 2112;
            id v172 = v138;
            __int16 v173 = 2112;
            id v174 = v140;
            LODWORD(v145) = 32;
            v141 = (uint8_t *)_os_log_send_and_compose_impl();

            v142 = +[_UIKeyboardArbiterDebug sharedInstance];
            v143 = (void *)[[NSString alloc] initWithUTF8String:buf];
            [v142 debugWithMessage:v143];

            if (v141 != buf) {
              free(v141);
            }
            goto LABEL_117;
          }
        }
        else
        {
        }
        id v88 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        long long v89 = [v88 bundleIdentifier];
        int v90 = [v89 isEqualToString:@"com.apple.CoreAuthUI"];

        if (v90 && [v154 keyboardOnScreen])
        {
          id v91 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          int v92 = [v91 isKeyboardOnScreen];

          if (v92)
          {
            long long v204 = 0u;
            long long v205 = 0u;
            long long v202 = 0u;
            long long v203 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            long long v198 = 0u;
            long long v199 = 0u;
            long long v196 = 0u;
            long long v197 = 0u;
            long long v194 = 0u;
            long long v195 = 0u;
            long long v192 = 0u;
            long long v193 = 0u;
            long long v190 = 0u;
            long long v191 = 0u;
            long long v188 = 0u;
            long long v189 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            long long v184 = 0u;
            long long v185 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            long long v180 = 0u;
            long long v181 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            long long v176 = 0u;
            long long v177 = 0u;
            memset(buf, 0, sizeof(buf));
            long long v93 = _UIArbiterLog();
            os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG);
            id v94 = (id)objc_opt_class();
            uint64_t v95 = [v155 bundleIdentifier];
            id v96 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            v97 = [v96 bundleIdentifier];
            int v169 = 138412802;
            id v170 = v94;
            __int16 v171 = 2112;
            id v172 = v95;
            __int16 v173 = 2112;
            id v174 = v97;
            LODWORD(v145) = 32;
            v98 = (uint8_t *)_os_log_send_and_compose_impl();

            v99 = +[_UIKeyboardArbiterDebug sharedInstance];
            v100 = (void *)[[NSString alloc] initWithUTF8String:buf];
            [v99 debugWithMessage:v100];

            if (v98 != buf) {
              free(v98);
            }
            uint64_t v101 = [v155 processIdentifier];
            id v102 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            [v102 setPrevActiveIdentifier:v101];

            goto LABEL_117;
          }
        }
        else
        {
        }
        if (([v154 keyboardOnScreen] & 1) == 0)
        {
          id v103 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          v104 = [v103 bundleIdentifier];
          int v105 = [v104 isEqualToString:@"com.apple.CoreAuthUI"];

          if (!v105)
          {
LABEL_79:

            goto LABEL_80;
          }
          id v106 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          int v107 = [v106 prevActiveIdentifier];

          if (v107)
          {
            id v108 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            [v108 activeProcessResign];

            id v103 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            [v103 setPrevActiveIdentifier:0];
            goto LABEL_79;
          }
        }
LABEL_80:
        objc_storeWeak(p_activeInputDestinationHandle, v149);
        v109 = _UIArbiterLog();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          id v110 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          *(_DWORD *)buf = 138478083;
          *(void *)&buf[4] = v110;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v154;
          _os_log_impl(&dword_225660000, v109, OS_LOG_TYPE_DEFAULT, "active input destination is now %{private}@; information: %{private}@",
            buf,
            0x16u);
        }
        if ([v154 keyboardOnScreen]) {
          v111 = v152;
        }
        else {
          v111 = 0;
        }
        [(_UIKeyboardArbiter *)v153 setLastUpdate:v111];
        id v112 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        [(_UIKeyboardArbiter *)v153 _trackRecentlyActiveArbiterHandle:v112];

        long long v166 = 0u;
        long long v167 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        v151 = v153->_clients;
        uint64_t v113 = [(NSMutableArray *)v151 countByEnumeratingWithState:&v164 objects:v168 count:16];
        v114 = v155;
        if (v113)
        {
          uint64_t v115 = *(void *)v165;
          do
          {
            for (uint64_t i = 0; i != v113; ++i)
            {
              if (*(void *)v165 != v115) {
                objc_enumerationMutation(v151);
              }
              v117 = *(void **)(*((void *)&v164 + 1) + 8 * i);
              id v118 = v152;
              if ([v117 isHandlerShowableWithHandler:v114])
              {
                id v119 = v154;

                v114 = v155;
                if ([v117 wantedState] && (objc_msgSend(v117, "active") & 1) == 0)
                {
                  v120 = [v117 sceneLayer];
                  uint64_t v121 = [v120 contextID];
                  v122 = [v117 remoteFocusContext];
                  [v117 level];
                  objc_msgSend(v117, "setWindowContextID:focusContext:windowState:withLevel:", v121, v122, 1);

                  v114 = v155;
                }
              }
              else
              {
                id v119 = v118;
              }
              if (v117 != v114 || [v114 multipleScenes])
              {
                v123 = (void *)[v119 copyWithoutFence];
                v158[0] = MEMORY[0x263EF8330];
                v158[1] = 3221225472;
                v158[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke;
                v158[3] = &unk_2647214B8;
                v158[4] = v117;
                id v159 = v119;
                v160 = v153;
                id v161 = v154;
                id v124 = v114;
                id v162 = v124;
                id v125 = v123;
                id v163 = v125;
                v126 = (void (**)(void))MEMORY[0x22A631F50](v158);
                if ([v117 active] && objc_msgSend(v117, "deactivating"))
                {
                  v127 = [v124 bundleIdentifier];
                  char v128 = [v127 isEqualToString:@"com.apple.Spotlight"];

                  if ((v128 & 1) == 0)
                  {
                    v129 = [v124 bundleIdentifier];
                    char v130 = [v129 isEqualToString:@"com.apple.CoreAuthUI"];

                    if ((v130 & 1) == 0) {
                      -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](v153, "runOperations:onHandler:fromFunction:", &__block_literal_global_137, v117, "-[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:]");
                    }
                  }
                  dispatch_time_t v131 = dispatch_time(0, 500000000);
                  queue = v153->_queue;
                  block[0] = MEMORY[0x263EF8330];
                  block[1] = 3221225472;
                  block[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_4;
                  block[3] = &unk_2647214E0;
                  void block[4] = v117;
                  void block[5] = v153;
                  v157 = v126;
                  dispatch_after(v131, queue, block);
                }
                else
                {
                  v126[2](v126);
                }
              }
              v114 = v155;
            }
            uint64_t v113 = [(NSMutableArray *)v151 countByEnumeratingWithState:&v164 objects:v168 count:16];
          }
          while (v113);
        }

        [v154 resetAnimationFencing];
        [v152 resetAnimationFencing];
        if (v149 != v146
          && (([MEMORY[0x263F828A0] inputUIOOP] & 1) != 0
           || v147 && [MEMORY[0x263F828A0] usesInputSystemUIForAutoFillOnly]))
        {
          [(_UIKeyboardArbiter *)v153 reevaluateSceneClientSettings];
        }
        [(_UIKeyboardArbiter *)v153 scheduleWindowTimeout];
        if (([v154 resizing] & 1) == 0) {
          [(_UIKeyboardArbiter *)v153 captureStateForDebug];
        }
        goto LABEL_117;
      }
    }
    goto LABEL_45;
  }
  uint64_t v21 = v20;
  id v22 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  if (v22 == v155
    || (int pidOnDeviceLocked = v153->_pidOnDeviceLocked,
        BOOL v24 = pidOnDeviceLocked == [v155 processIdentifier],
        id v9 = v154,
        !v24))
  {

    goto LABEL_14;
  }
  id v25 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  uint64_t v26 = [v25 bundleIdentifier];
  char v27 = [v26 isEqualToString:@"com.apple.Spotlight"];

  id v9 = v154;
  if (v27) {
    goto LABEL_14;
  }
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  memset(buf, 0, sizeof(buf));
  id v28 = _UIArbiterLog();
  os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
  objc_super v29 = objc_opt_class();
  id v30 = v29;
  id v31 = [v155 bundleIdentifier];
  id v32 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  int v169 = 138412802;
  id v170 = v29;
  __int16 v171 = 2112;
  id v172 = v31;
  __int16 v173 = 2112;
  id v174 = v32;
  LODWORD(v145) = 32;
  uint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl();

  id v33 = +[_UIKeyboardArbiterDebug sharedInstance];
  __int16 v34 = (void *)[[NSString alloc] initWithUTF8String:buf];
  [v33 debugWithMessage:v34];

LABEL_11:
  if (v16 != buf) {
    free(v16);
  }
LABEL_118:
}

- (void)completeKeyboardStatusChangedFromHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
        if (v10 != v4) {
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", &__block_literal_global_139, v10, "-[_UIKeyboardArbiter completeKeyboardStatusChangedFromHandler:]", (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4 checklist:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id))a4;
  id v10 = a5;
  long long v11 = v10;
  if (v8) {
    [v10 addObject:v8];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_clients;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v13)
  {

LABEL_16:
    v9[2](v9, v8);
    goto LABEL_17;
  }
  uint64_t v14 = v13;
  int v15 = 0;
  uint64_t v16 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v20 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ((objc_msgSend(v11, "containsObject:", v18, (void)v19) & 1) == 0
        && objc_msgSend(v18, "isHostingPID:", objc_msgSend(v8, "processIdentifier")))
      {
        ++v15;
        [(_UIKeyboardArbiter *)self _findForHandle:v18 deepestHandleHandler:v9 checklist:v11];
      }
    }
    uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v14);

  if (!v15) {
    goto LABEL_16;
  }
LABEL_17:
}

- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 array];
  [(_UIKeyboardArbiter *)self _findForHandle:v8 deepestHandleHandler:v7 checklist:v9];
}

- (void)notifyHeightUpdated:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke;
  v32[3] = &unk_264721508;
  v32[4] = self;
  id v6 = v5;
  id v33 = v6;
  [(_UIKeyboardArbiter *)self _findForHandle:v4 deepestHandleHandler:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = [v6 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) doubleValue];
        if (v11 < v13) {
          double v11 = v13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = v6;
  uint64_t v14 = [v6 allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        int v20 = [v19 intValue];
        if (v20 != [v4 processIdentifier])
        {
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke_2;
          v23[3] = &__block_descriptor_40_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          *(double *)&v23[4] = v11;
          long long v21 = -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", [v19 intValue]);
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v23, v21, "-[_UIKeyboardArbiter notifyHeightUpdated:]");
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v16);
  }
}

- (FBSSceneLayer)sceneLayer
{
  return self->_sceneLayer;
}

- (id)lastActivatedHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
  return WeakRetained;
}

- (BOOL)activateHandle:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(_UIKeyboardArbiter *)self sceneLink];
  char v6 = [v5 isAvailable];

  if ((v6 & 1) == 0)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v7 = _UIArbiterLog();
    os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    int v41 = 138412290;
    id v42 = v4;
    LODWORD(v40) = 12;
    uint64_t v8 = (long long *)_os_log_send_and_compose_impl();

    uint64_t v9 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:&v47];
    [v9 errorWithMessage:v10];

    if (v8 != &v47) {
      free(v8);
    }
  }
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained
    && (id v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle),
        char v14 = [v4 isHandlerShowableWithHandler:v13],
        v13,
        WeakRetained,
        (v14 & 1) == 0))
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v32 = _UIArbiterLog();
    os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    id v33 = objc_opt_class();
    id v34 = v33;
    id v35 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    int v41 = 138412802;
    id v42 = v33;
    __int16 v43 = 2112;
    id v44 = v4;
    __int16 v45 = 2112;
    id v46 = v35;
    LODWORD(v40) = 32;
    uint64_t v36 = (long long *)_os_log_send_and_compose_impl();

    long long v37 = +[_UIKeyboardArbiterDebug sharedInstance];
    char v38 = (void *)[[NSString alloc] initWithUTF8String:&v47];
    [v37 errorWithMessage:v38];

    if (v36 != &v47) {
      free(v36);
    }
    BOOL v31 = 0;
  }
  else
  {
    uint64_t v15 = [v4 sceneLayer];
    uint64_t v16 = [(_UIKeyboardArbiter *)self sceneLink];
    int v17 = [v16 isAvailable];
    if (v15) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }

    if (v18)
    {
      long long v19 = self;
      objc_sync_enter(v19);
      p_sceneLayer = &v19->_sceneLayer;
      if (v19->_sceneLayer)
      {
        long long v21 = [(_UIKeyboardArbiter *)v19 sceneLink];
        [v21 detach:*p_sceneLayer];

        long long v22 = *p_sceneLayer;
        *p_sceneLayer = 0;
      }
      objc_storeStrong((id *)&v19->_sceneLayer, v15);
      objc_sync_exit(v19);

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v23 = _UIArbiterLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      long long v24 = objc_opt_class();
      int v41 = 138412802;
      id v42 = v24;
      __int16 v43 = 2112;
      id v44 = v4;
      __int16 v45 = 2112;
      id v46 = v15;
      id v25 = v24;
      LODWORD(v40) = 32;
      long long v26 = (long long *)_os_log_send_and_compose_impl();

      long long v27 = +[_UIKeyboardArbiterDebug sharedInstance];
      long long v28 = (void *)[[NSString alloc] initWithUTF8String:&v47];
      [v27 debugWithMessage:v28];

      if (v26 != &v47) {
        free(v26);
      }
      long long v29 = [(_UIKeyboardArbiter *)v19 sceneLink];
      [v29 attach:v15];

      [v4 didAttachLayer];
    }
    if (([v4 inputUIHost] & 1) == 0)
    {
      id v30 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
      [v30 clearAcquiringFocus];

      objc_storeWeak((id *)&self->_lastActivatedHandle, v4);
      [(_UIKeyboardArbiter *)self handlerRequestedFocus:v4 shouldStealKeyboard:0];
    }

    BOOL v31 = 1;
  }

  return v31;
}

- (void)checkHostingState
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)&self->_keyboardUIHandle);

    if (v5)
    {
      char v6 = [MEMORY[0x263EFF980] array];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = self->_clients;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v84 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v44 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if (([v12 inputUIHost] & 1) == 0)
            {
              if ([v12 running])
              {
                if ([v12 wantedState])
                {
                  if (([v12 active] & 1) == 0)
                  {
                    id v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
                    int v14 = [v12 isHandlerShowableWithHandler:v13];

                    if (v14) {
                      [v6 addObject:v12];
                    }
                  }
                }
              }
            }
          }
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v84 count:16];
        }
        while (v9);
      }

      if (![v6 count])
      {
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
        long long v52 = 0u;
        long long v53 = 0u;
        long long v21 = _UIArbiterLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        long long v22 = objc_opt_class();
        int v48 = 138412290;
        long long v49 = v22;
        id v23 = v22;
        LODWORD(v38) = 12;
        long long v24 = (long long *)_os_log_send_and_compose_impl();

        id v25 = +[_UIKeyboardArbiterDebug sharedInstance];
        long long v26 = (void *)[[NSString alloc] initWithUTF8String:&v52];
        [v25 errorWithMessage:v26];

        if (v24 != &v52) {
          free(v24);
        }
        goto LABEL_32;
      }
      if ((unint64_t)[v6 count] < 2)
      {
        long long v82 = 0uLL;
        long long v83 = 0uLL;
        long long v80 = 0uLL;
        long long v81 = 0uLL;
        long long v78 = 0uLL;
        long long v79 = 0uLL;
        long long v76 = 0uLL;
        long long v77 = 0uLL;
        long long v74 = 0uLL;
        long long v75 = 0uLL;
        long long v72 = 0uLL;
        long long v73 = 0uLL;
        long long v70 = 0uLL;
        long long v71 = 0uLL;
        long long v68 = 0uLL;
        long long v69 = 0uLL;
        long long v66 = 0uLL;
        long long v67 = 0uLL;
        long long v64 = 0uLL;
        long long v65 = 0uLL;
        long long v62 = 0uLL;
        long long v63 = 0uLL;
        long long v60 = 0uLL;
        long long v61 = 0uLL;
        long long v58 = 0uLL;
        long long v59 = 0uLL;
        long long v56 = 0uLL;
        long long v57 = 0uLL;
        long long v54 = 0uLL;
        long long v55 = 0uLL;
        long long v52 = 0uLL;
        long long v53 = 0uLL;
        long long v27 = _UIArbiterLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
        long long v28 = objc_opt_class();
        id v29 = v28;
        id v30 = [v6 lastObject];
        int v48 = 138412546;
        long long v49 = v28;
        __int16 v50 = 2112;
        long long v51 = v30;
        LODWORD(v38) = 22;
        int v18 = (long long *)_os_log_send_and_compose_impl();

        BOOL v31 = +[_UIKeyboardArbiterDebug sharedInstance];
        id v32 = (void *)[[NSString alloc] initWithUTF8String:&v52];
        [v31 debugWithMessage:v32];

        if (v18 == &v52)
        {
LABEL_24:
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v33 = v6;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v40 != v36) {
                  objc_enumerationMutation(v33);
                }
                [*(id *)(*((void *)&v39 + 1) + 8 * j) checkActivation:1];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v35);
          }

          [(_UIKeyboardArbiter *)self reevaluateSceneClientSettings];
          [(_UIKeyboardArbiter *)self updateKeyboardSceneSettings];
LABEL_32:

          return;
        }
      }
      else
      {
        long long v82 = 0uLL;
        long long v83 = 0uLL;
        long long v80 = 0uLL;
        long long v81 = 0uLL;
        long long v78 = 0uLL;
        long long v79 = 0uLL;
        long long v76 = 0uLL;
        long long v77 = 0uLL;
        long long v74 = 0uLL;
        long long v75 = 0uLL;
        long long v72 = 0uLL;
        long long v73 = 0uLL;
        long long v70 = 0uLL;
        long long v71 = 0uLL;
        long long v68 = 0uLL;
        long long v69 = 0uLL;
        long long v66 = 0uLL;
        long long v67 = 0uLL;
        long long v64 = 0uLL;
        long long v65 = 0uLL;
        long long v62 = 0uLL;
        long long v63 = 0uLL;
        long long v60 = 0uLL;
        long long v61 = 0uLL;
        long long v58 = 0uLL;
        long long v59 = 0uLL;
        long long v56 = 0uLL;
        long long v57 = 0uLL;
        long long v54 = 0uLL;
        long long v55 = 0uLL;
        long long v52 = 0uLL;
        long long v53 = 0uLL;
        uint64_t v15 = _UIArbiterLog();
        os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        uint64_t v16 = objc_opt_class();
        int v48 = 138412546;
        long long v49 = v16;
        __int16 v50 = 2112;
        long long v51 = v6;
        id v17 = v16;
        LODWORD(v38) = 22;
        int v18 = (long long *)_os_log_send_and_compose_impl();

        long long v19 = +[_UIKeyboardArbiterDebug sharedInstance];
        int v20 = (void *)[[NSString alloc] initWithUTF8String:&v52];
        [v19 errorWithMessage:v20];

        if (v18 == &v52) {
          goto LABEL_24;
        }
      }
      free(v18);
      goto LABEL_24;
    }
  }
}

- (BOOL)deactivateHandle:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v4 clearAcquiringFocus];
  id v5 = [v4 sceneLayer];
  char v6 = [(_UIKeyboardArbiter *)self sceneLink];
  if [v6 isAvailable] && v5 || (objc_msgSend(MEMORY[0x263F828A0], "inputUIOOP"))
  {
  }
  else
  {
    char v21 = [v4 requiresInputUIForAutofillUIOnly];

    if ((v21 & 1) == 0) {
      goto LABEL_18;
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = _UIArbiterLog();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  *(_DWORD *)long long v24 = 138412802;
  *(void *)&void v24[4] = objc_opt_class();
  *(_WORD *)&v24[12] = 2112;
  *(void *)&v24[14] = v4;
  *(_WORD *)&v24[22] = 2112;
  id v25 = v5;
  id v8 = *(id *)&v24[4];
  LODWORD(v23) = 32;
  uint64_t v9 = (long long *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v24, v23, *(_OWORD *)v24, *(void *)&v24[16], v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
  uint64_t v10 = (void)v53);
  double v11 = (void *)[[NSString alloc] initWithUTF8String:&v26];
  [v10 debugWithMessage:v11];

  if (v9 != &v26) {
    free(v9);
  }
  if (v5)
  {
    long long v12 = self;
    objc_sync_enter(v12);
    if (v12->_sceneLayer == v5)
    {
      id v13 = [(_UIKeyboardArbiter *)v12 sceneLink];
      [v13 detach:v5];

      sceneLayer = v12->_sceneLayer;
      v12->_sceneLayer = 0;
    }
    objc_sync_exit(v12);

    [v4 didDetachLayer];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previouslyActiveHandle);
  BOOL v16 = WeakRetained == v4;

  if (v16)
  {
    objc_storeWeak((id *)&self->_previouslyActiveHandle, 0);
    [(_UIKeyboardArbiter *)self scheduleWindowTimeout];
  }
  id v17 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
  BOOL v18 = v17 == v4;

  if (v18) {
    objc_storeWeak((id *)&self->_lastActivatedHandle, 0);
  }
  long long v19 = [(_UIKeyboardArbiter *)self _activeHandleForFocusEvaluation];
  BOOL v20 = v19 == 0;

  if (v20) {
    [(_UIKeyboardArbiter *)self reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:0];
  }
LABEL_18:

  return 0;
}

- (void)handleUnexpectedDeallocForHandler:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56___UIKeyboardArbiter_handleUnexpectedDeallocForHandler___block_invoke;
  v9[3] = &unk_2647211A0;
  id v5 = v4;
  id v10 = v5;
  double v11 = self;
  char v6 = (void (**)(void))MEMORY[0x22A631F50](v9);
  id v7 = dispatch_get_current_queue();
  queue = self->_queue;
  if (v7 == queue) {
    v6[2](v6);
  }
  else {
    dispatch_sync(queue, v6);
  }
}

- (void)prewarmFocusContext
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);

  if (!WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      [v5 level];
    }
    id v6 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    id v7 = [v6 remoteFocusContext];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = self->_clients;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v13, "active", (void)v25))
          {
            int v14 = [v13 remoteFocusContext];
            uint64_t v15 = [v14 sceneIdentity];

            if (v15)
            {
              id v16 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
              int v17 = [v13 isHandlerShowableWithHandler:v16];

              if (v17)
              {
                [v13 level];
                uint64_t v18 = [v13 remoteFocusContext];

                id v7 = (void *)v18;
              }
            }
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v10);
    }

    long long v19 = [(_UIKeyboardArbiter *)self sceneDelegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [v7 sceneIdentity];
      if (v21 && (long long v22 = (void *)v21, v23 = [v7 contextID], v22, !v23))
      {
        long long v24 = _UIArbiterLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          long long v30 = "-[_UIKeyboardArbiter prewarmFocusContext]";
          __int16 v31 = 2112;
          long long v32 = v7;
          _os_log_debug_impl(&dword_225660000, v24, OS_LOG_TYPE_DEBUG, "%s  skipping prewarming focustContext = %@", buf, 0x16u);
        }
      }
      else
      {
        long long v24 = [(_UIKeyboardArbiter *)self sceneDelegate];
        [v24 focusContextDidChange:v7];
      }
    }
  }
}

- (void)updateSuppression:(BOOL)a3 ofPID:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", [a4 intValue]);
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53___UIKeyboardArbiter_updateSuppression_ofPID_active___block_invoke;
    v9[3] = &__block_descriptor_33_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
    BOOL v10 = v6;
    -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v9, v8, "-[_UIKeyboardArbiter updateSuppression:ofPID:active:]");
    [v8 notifyHostedPIDsOfSuppression:v6 active:v5];
  }
}

- (void)updateSuppression:(BOOL)a3 ofPIDs:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v33, 0, sizeof(v33));
  uint64_t v9 = _UIArbiterLog();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  BOOL v10 = objc_opt_class();
  uint64_t v11 = @"NO";
  int v27 = 138412802;
  long long v28 = v10;
  __int16 v29 = 2112;
  if (v6) {
    uint64_t v11 = @"YES";
  }
  long long v30 = v11;
  __int16 v31 = 2112;
  id v32 = v8;
  id v12 = v10;
  LODWORD(v21) = 32;
  id v13 = (_OWORD *)_os_log_send_and_compose_impl();

  int v14 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v15 = (void *)[[NSString alloc] initWithUTF8String:v33];
  [v14 debugWithMessage:v15];

  if (v13 != v33) {
    free(v13);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [(_UIKeyboardArbiter *)self updateSuppression:v6 ofPID:*(void *)(*((void *)&v22 + 1) + 8 * i) active:v5];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
}

- (void)activateClients
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_clients;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "active", (void)v9)) {
          [(_UIKeyboardArbiter *)self activateHandle:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)handlerForBundleID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_26D891F00] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_clients;
    id v6 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v11 = objc_msgSend(v10, "bundleIdentifier", (void)v14);
          char v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            id v6 = v10;
            goto LABEL_14;
          }
        }
        id v6 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)handlerForToken:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v24 = a3;
  if (v24)
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = self;
    id v4 = self->_clients;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v10 = [v9 remoteFocusContext];
          long long v11 = [v10 sceneIdentity];
          char v12 = [v11 stringRepresentation];
          id v13 = [v24 _string];
          char v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            id v17 = v9;

            goto LABEL_16;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

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
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v15 = _UIArbiterLog();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    clients = v23->_clients;
    int v29 = 138543618;
    id v30 = v24;
    __int16 v31 = 2114;
    id v32 = clients;
    LODWORD(v22) = 22;
  }
  else
  {
    long long v64 = 0uLL;
    long long v65 = 0uLL;
    long long v62 = 0uLL;
    long long v63 = 0uLL;
    long long v60 = 0uLL;
    long long v61 = 0uLL;
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v15 = _UIArbiterLog();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    LOWORD(v29) = 0;
    LODWORD(v22) = 2;
  }
  uint64_t v18 = (long long *)_os_log_send_and_compose_impl();

  uint64_t v19 = +[_UIKeyboardArbiterDebug sharedInstance];
  char v20 = (void *)[[NSString alloc] initWithUTF8String:&v34];
  [v19 debugWithMessage:v20];

  if (v18 != &v34) {
    free(v18);
  }
  id v17 = 0;
LABEL_16:

  return v17;
}

- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5 fromHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v25 = a5;
  long long v9 = (NSMutableArray *)a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![MEMORY[0x263F828A0] inputUIOOP]
    || ([(NSMutableArray *)v9 active] & 1) != 0)
  {
LABEL_6:
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = self->_clients;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(NSMutableArray **)(*((void *)&v31 + 1) + 8 * i);
          if (v18 != v9)
          {
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __65___UIKeyboardArbiter_transition_eventStage_withInfo_fromHandler___block_invoke;
            v27[3] = &unk_264721610;
            id v28 = v26;
            unint64_t v30 = a4;
            id v29 = v25;
            -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v27, v18, "-[_UIKeyboardArbiter transition:eventStage:withInfo:fromHandler:]");
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }
    goto LABEL_19;
  }
  long long v10 = [MEMORY[0x263EFF980] array];
  long long v11 = [(_UIKeyboardArbiter *)self hostForHandle:v9 hosts:v10];

  char v12 = v9;
  if (v11)
  {
    char v12 = v11;
    if ([(NSMutableArray *)v11 active])
    {

      goto LABEL_6;
    }
  }
  memset(v38, 0, 512);
  uint64_t v19 = _UIArbiterLog();
  os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  int v36 = 138412290;
  long long v37 = v12;
  LODWORD(v23) = 12;
  char v20 = (unsigned char *)_os_log_send_and_compose_impl();

  uint64_t v21 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v22 = (void *)[[NSString alloc] initWithUTF8String:v38];
  [v21 debugWithMessage:v22];

  if (v20 != v38) {
    free(v20);
  }
  id v13 = v11;
LABEL_19:
}

- (void)handlerRequestedForcedClientSceneIdentityUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 inputUIHost] & 1) == 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    uint64_t v6 = [v5 remoteFocusContext];
    uint64_t v7 = [v6 sceneIdentity];

    if (!v7)
    {
      uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UIKeyboardArbiter.m", 1436, @"Handler must have a remote scene identity: %@", v5 object file lineNumber description];
    }
    if (([v5 requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus] & 1) == 0)
    {
      memset(v22, 0, sizeof(v22));
      uint64_t v8 = _UIArbiterLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v5;
      id v9 = v19;
      LODWORD(v15) = 22;
      long long v10 = (_OWORD *)_os_log_send_and_compose_impl();

      long long v11 = +[_UIKeyboardArbiterDebug sharedInstance];
      char v12 = (void *)[[NSString alloc] initWithUTF8String:v22];
      [v11 debugWithMessage:v12];

      if (v10 != v22) {
        free(v10);
      }
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __70___UIKeyboardArbiter_handlerRequestedForcedClientSceneIdentityUpdate___block_invoke;
      v16[3] = &unk_264721638;
      id v13 = v5;
      id v17 = v13;
      -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v16, v13, "-[_UIKeyboardArbiter handlerRequestedForcedClientSceneIdentityUpdate:]");
      [v13 setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:1];
    }
  }
}

- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 fromHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id obj = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(obj);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke;
  v44[3] = &unk_264721660;
  id v12 = v9;
  id v45 = v12;
  id v13 = v11;
  id v46 = v13;
  uint64_t v14 = (void *)MEMORY[0x22A631F50](v44);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_2;
  v42[3] = &unk_264721688;
  id v15 = v14;
  id v43 = v15;
  long long v31 = (void (**)(void, void))MEMORY[0x22A631F50](v42);
  id location = (id *)&self->_disablingHandle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disablingHandle);
  LODWORD(a6) = WeakRetained == 0;

  if ((a6 ^ v8))
  {
    uint64_t v17 = 1;
LABEL_11:
    v31[2](v31, v17);
    goto LABEL_25;
  }
  if (v8)
  {
    if (v12) {
      +[_UIKeyboardChangedInformationWithManualFence pushFence:v12];
    }
    int v18 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
    [(_UIKeyboardArbiter *)self updateKeyboardStatus:v18 fromHandler:v10];

    if (v12) {
      +[_UIKeyboardChangedInformationWithManualFence popFence];
    }
    dispatch_time_t v19 = dispatch_time(0, 500000000);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_3;
    block[3] = &unk_2647211A0;
    void block[4] = self;
    id v41 = v10;
    dispatch_after(v19, queue, block);
  }
  else
  {
    id v21 = objc_loadWeakRetained(location);
    BOOL v22 = v21 == v10;

    if (!v22)
    {
      uint64_t v17 = 2;
      goto LABEL_11;
    }
  }
  id v29 = v10;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v23 = self->_clients;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (([v27 inputUIHost] & 1) == 0)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_4;
          v34[3] = &__block_descriptor_33_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          BOOL v35 = v8;
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v34, v27, "-[_UIKeyboardArbiter setKeyboardTotalDisable:withFence:fromHandler:completionHandler:]");
        }
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v24);
  }

  id v10 = v29;
  if (v8) {
    id v28 = v29;
  }
  else {
    id v28 = 0;
  }
  objc_storeWeak(location, v28);
  (*((void (**)(id, void))v15 + 2))(v15, 0);
LABEL_25:

  objc_sync_exit(obj);
}

- (void)signalEventSourceChanged:(int64_t)a3 fromHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v15 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_int64_t lastEventSource = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = self->_clients;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if (v14 != v8)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __77___UIKeyboardArbiter_signalEventSourceChanged_fromHandler_completionHandler___block_invoke;
          v16[3] = &__block_descriptor_40_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          void v16[4] = a3;
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v16, v14, "-[_UIKeyboardArbiter signalEventSourceChanged:fromHandler:completionHandler:]");
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (v15) {
    v15[2](v15);
  }
}

- (id)preferredSceneIdentityForKeyboardFocusWithChangeInformation:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(_UIKeyboardArbiter *)self _activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:0];
  if (!v4)
  {
    id v4 = [(_UIKeyboardArbiter *)self _previouslyFocusedHostHandle];
  }
  id v5 = [v4 remoteFocusContext];
  uint64_t v6 = [v5 sceneIdentity];

  return v6;
}

- (id)_previouslyFocusedHostHandle
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_previouslyActiveHandle = &self->_previouslyActiveHandle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previouslyActiveHandle);

  if (WeakRetained)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v5 = _UIArbiterLog();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    id v6 = objc_loadWeakRetained((id *)p_previouslyActiveHandle);
    int v49 = 138412290;
    id v50 = v6;
    LODWORD(v37) = 12;
    uint64_t v7 = (long long *)_os_log_send_and_compose_impl();

    id v8 = +[_UIKeyboardArbiterDebug sharedInstance];
    id v9 = (void *)[[NSString alloc] initWithUTF8String:&v51];
    [v8 debugWithMessage:v9];

    if (v7 != &v51) {
      free(v7);
    }
    id v10 = objc_loadWeakRetained((id *)p_previouslyActiveHandle);
  }
  else
  {
    if ([(NSMutableOrderedSet *)self->_recentlyActiveSceneIdentities count])
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v11 = [(NSMutableOrderedSet *)self->_recentlyActiveSceneIdentities reverseObjectEnumerator];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            clients = self->_clients;
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = __50___UIKeyboardArbiter__previouslyFocusedHostHandle__block_invoke;
            v42[3] = &unk_2647216B0;
            void v42[4] = v16;
            uint64_t v18 = [(NSMutableArray *)clients indexOfObjectPassingTest:v42];
            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v10 = [(NSMutableArray *)self->_clients objectAtIndex:v18];
              long long v81 = 0u;
              long long v82 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              id v28 = _UIArbiterLog();
              os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
              int v49 = 138412290;
              id v50 = v10;
              LODWORD(v37) = 12;
              id v29 = (long long *)_os_log_send_and_compose_impl();

              unint64_t v30 = +[_UIKeyboardArbiterDebug sharedInstance];
              long long v31 = (void *)[[NSString alloc] initWithUTF8String:&v51];
              [v30 debugWithMessage:v31];

              if (v29 != &v51) {
                free(v29);
              }
LABEL_31:

              goto LABEL_32;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v11 = [(NSMutableArray *)self->_clients reverseObjectEnumerator];
    uint64_t v19 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v11);
          }
          uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          if ([v23 active])
          {
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v32 = _UIArbiterLog();
            os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
            int v49 = 138412290;
            id v50 = v23;
            LODWORD(v37) = 12;
            long long v33 = (long long *)_os_log_send_and_compose_impl();

            long long v34 = +[_UIKeyboardArbiterDebug sharedInstance];
            BOOL v35 = (void *)[[NSString alloc] initWithUTF8String:&v51];
            [v34 debugWithMessage:v35];

            if (v33 != &v51) {
              free(v33);
            }
            id v10 = v23;
            goto LABEL_31;
          }
        }
        uint64_t v20 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v24 = _UIArbiterLog();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    LOWORD(v49) = 0;
    LODWORD(v37) = 2;
    uint64_t v25 = (long long *)_os_log_send_and_compose_impl();

    id v26 = +[_UIKeyboardArbiterDebug sharedInstance];
    long long v27 = (void *)[[NSString alloc] initWithUTF8String:&v51];
    [v26 debugWithMessage:v27];

    if (v25 != &v51) {
      free(v25);
    }
    id v10 = 0;
  }
LABEL_32:
  return v10;
}

- (void)keyboardFocusDidChangeWithoutAdvisorInputToPid:(int)a3 sceneIdentity:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  os_unfair_lock_lock(&self->_pendingFocusLock);
  unint64_t v8 = self->_pendingFocusLock_generation + 1;
  self->_unint64_t pendingFocusLock_generation = v8;
  self->_uint64_t pendingFocusLock_PID = v5;
  objc_storeStrong((id *)&self->_pendingFocusLock_sceneIdentity, a4);
  os_unfair_lock_unlock(&self->_pendingFocusLock);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    memset(v26, 0, sizeof(v26));
    id v9 = _UIArbiterLog();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    id v10 = [v7 stringRepresentation];
    int v20 = 134218498;
    unint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    LODWORD(v15) = 28;
    uint64_t v11 = (_OWORD *)_os_log_send_and_compose_impl();

    uint64_t v12 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v26];
    [v12 debugWithMessage:v13];

    if (v11 != v26) {
      free(v11);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83___UIKeyboardArbiter_keyboardFocusDidChangeWithoutAdvisorInputToPid_sceneIdentity___block_invoke;
    block[3] = &unk_2647216D8;
    void block[4] = self;
    unint64_t v18 = v8;
    int v19 = v5;
    id v17 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    [(_UIKeyboardArbiter *)self _arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:v8 pid:v5 sceneIdentity:v7];
  }
}

- (void)_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:(unint64_t)a3 pid:(int)a4 sceneIdentity:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v9 = a5;
  dispatch_assert_queue_V2(queue);
  memset(v22, 0, sizeof(v22));
  id v10 = _UIArbiterLog();
  os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  uint64_t v11 = [v9 stringRepresentation];

  int v16 = 134218498;
  unint64_t v17 = a3;
  __int16 v18 = 1024;
  int v19 = a4;
  __int16 v20 = 2112;
  unint64_t v21 = v11;
  LODWORD(v15) = 28;
  uint64_t v12 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v13 = +[_UIKeyboardArbiterDebug sharedInstance];
  uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:v22];
  [v13 debugWithMessage:v14];

  if (v12 != v22) {
    free(v12);
  }
  [(_UIKeyboardArbiter *)self _applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:a3];
}

- (int)presentingKeyboardProcessIdentifier
{
  uint64_t v3 = +[_UIKeyboardArbiterDebug sharedInstance];
  objc_sync_enter(v3);
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    int v7 = [v6 processIdentifier];
  }
  else
  {
    int v7 = -1;
  }
  objc_sync_exit(v3);

  return v7;
}

+ (void)configureEncodedClassesForXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 remoteObjectInterface];
  uint64_t v5 = _UIKBArbiterSetForPlacements();
  [v4 setClasses:v5 forSelector:sel_queue_keyboardTransition_event_withInfo_onComplete_ argumentIndex:2 ofReply:0];

  id v7 = [v3 exportedInterface];

  id v6 = _UIKBArbiterSetForPlacements();
  [v7 setClasses:v6 forSelector:sel_transition_eventStage_withInfo_ argumentIndex:2 ofReply:0];
}

- (void)setOmniscientDelegate:(id)a3
{
}

- (void)setSceneDelegate:(id)a3
{
}

- (void)setLastUpdate:(id)a3
{
}

- (_UIKeyboardArbiterClientHandle)activeInputDestinationHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  return (_UIKeyboardArbiterClientHandle *)WeakRetained;
}

- (_UIKeyboardArbiterClientHandle)focusRequestedHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
  return (_UIKeyboardArbiterClientHandle *)WeakRetained;
}

- (_UIKeyboardArbiterClientHandle)keyboardUIHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardUIHandle);
  return (_UIKeyboardArbiterClientHandle *)WeakRetained;
}

- (void)setKeyboardUIHandle:(id)a3
{
}

- (unint64_t)keyboardScenePresentationMode
{
  return self->_keyboardScenePresentationMode;
}

- (void)setKeyboardScenePresentationMode:(unint64_t)a3
{
  self->_keyboardScenePresentationMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardUIHandle);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_destroyWeak((id *)&self->_omniscientDelegate);
  objc_storeStrong((id *)&self->_sceneLink, 0);
  objc_storeStrong(&self->_pendingNotifyKeyboardChanged, 0);
  objc_storeStrong((id *)&self->_pendingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUIInformation, 0);
  objc_destroyWeak((id *)&self->_disablingHandle);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_recentlyActiveSceneIdentities, 0);
  objc_destroyWeak((id *)&self->_focusRequestedHandle);
  objc_destroyWeak((id *)&self->_lastActivatedHandle);
  objc_storeStrong((id *)&self->_pendingFocusLock_sceneIdentity, 0);
  objc_storeStrong((id *)&self->_currentFocusSceneIdentity, 0);
  objc_destroyWeak((id *)&self->_previouslyActiveHandle);
  objc_destroyWeak((id *)&self->_activeInputDestinationHandle);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end