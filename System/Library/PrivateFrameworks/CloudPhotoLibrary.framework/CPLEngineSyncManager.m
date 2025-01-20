@interface CPLEngineSyncManager
+ (id)descriptionForState:(unint64_t)a3;
+ (id)platformImplementationProtocol;
+ (id)shortDescriptionForState:(unint64_t)a3;
+ (id)stepForState:(unint64_t)a3 syncManager:(id)a4 session:(id)a5;
+ (unsigned)qualityOfServiceForForcedTasks;
+ (unsigned)qualityOfServiceForSyncSessions;
- (BOOL)_checkForegroundAtLaunchForForceSyncTask;
- (BOOL)_didFinishSetupTaskWithError:(id)a3 shouldStop:(BOOL *)a4;
- (BOOL)_launchNecessaryTasksForCurrentStateLocked;
- (BOOL)_launchSetupTask;
- (BOOL)hasBrokenScopes;
- (BOOL)prepareAndLaunchSyncTaskUnlocked:(id)a3;
- (BOOL)shouldTryToMingleImmediately;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineSyncManager)initWithEngineLibrary:(id)a3;
- (CPLPlatformObject)platformObject;
- (NSArray)brokenScopes;
- (NSError)lastError;
- (id)_descriptionForCurrentState;
- (id)_descriptionForLaunchedTasks;
- (id)_descriptionForSetupTasks;
- (id)_dropDerivativeRulesFromUserDefaults;
- (id)_setupTaskWithCompletionHandler:(id)a3;
- (id)_shortDescriptionForCurrentState;
- (id)_transportUserIdentifier;
- (id)componentName;
- (id)lastErrorUnlocked;
- (unint64_t)state;
- (void)_addRuleToUserDefaults:(id)a3;
- (void)_advanceToNextStateLocked;
- (void)_advanceToNextStateLockedMinimalState:(unint64_t)a3;
- (void)_cancelAllTasksForSetup;
- (void)_cancelAllTasksLocked;
- (void)_cancelAllTasksLockedDeferringPushTaskCancellationIfCurrentlyUploadingForeground:(BOOL)a3;
- (void)_cancelCurrentSyncSession;
- (void)_disableSchedulerForForceSyncTaskIfNecessary;
- (void)_discardPendingForceSyncTaskWithError:(id)a3;
- (void)_dispatchAfter:(double)a3 block:(id)a4;
- (void)_dispatchCancellerBlocksIfNecessary;
- (void)_forceSyncTaskDidFinishWithError:(id)a3;
- (void)_launchForceSetupTask;
- (void)_launchForceSyncTaskIfNecessary;
- (void)_moveAllTasksToBackgroundLocked;
- (void)_notifyEndOfSyncSession;
- (void)_overrideBudgetsIfNeeded;
- (void)_recordForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5;
- (void)_reenableSchedulerForForceSyncTaskIfNecessary;
- (void)_resetErrorForSyncSession;
- (void)_restartSyncSessionFromStateLocked:(unint64_t)a3 session:(id)a4 cancelIfNecessary:(BOOL)a5;
- (void)_setState:(unint64_t)a3;
- (void)_setTransportUserIdentifier:(id)a3;
- (void)addBrokenScope:(id)a3;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)beginClientWork:(id)a3;
- (void)cancelAndBlockAllSyncSessionsWithReason:(id)a3 block:(id)a4;
- (void)cancelCurrentSyncSession;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)configureDirectTransportTask:(id)a3;
- (void)discardTransportUserIdentifier;
- (void)dispatchForcedTaskBlock:(id)a3;
- (void)dispatchSyncBlock:(id)a3;
- (void)endClientWork:(id)a3;
- (void)forceSyncTaskHasBeenCancelled:(id)a3;
- (void)forceSyncTaskHasBeenLaunched:(id)a3;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)removeBrokenScope:(id)a3;
- (void)requestDisabledFeaturesUpdate;
- (void)resetTransportUserIdentifier;
- (void)setBoostPriority:(BOOL)a3;
- (void)setErrorForSyncSessionUnlocked:(id)a3;
- (void)setShouldTryToMingleImmediately:(BOOL)a3;
- (void)setSyncSessionShouldBeForeground:(BOOL)a3;
- (void)startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5;
- (void)unblockSyncSessionWithReason:(id)a3;
@end

@implementation CPLEngineSyncManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_blockedReasons, 0);
  objc_storeStrong((id *)&self->_cancellerBlocks, 0);
  objc_storeStrong((id *)&self->_forcedSyncHistory, 0);
  objc_storeStrong((id *)&self->_lastErrors, 0);
  objc_storeStrong((id *)&self->_pendingForceSyncTask, 0);
  objc_storeStrong((id *)&self->_currentForceSyncTask, 0);
  objc_storeStrong((id *)&self->_forcedSetupTask, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_closingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setupTask, 0);
  objc_storeStrong((id *)&self->_derivativesFilter, 0);
  objc_storeStrong((id *)&self->_brokenScopes, 0);
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
}

- (void)setShouldTryToMingleImmediately:(BOOL)a3
{
  self->_shouldTryToMingleImmediately = a3;
}

- (BOOL)shouldTryToMingleImmediately
{
  return self->_shouldTryToMingleImmediately;
}

- (unint64_t)state
{
  return self->_state;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CPLDerivativesFilter *)self->_derivativesFilter addServerDropDerivativesRecipe:v8])
  {
    v10 = [(CPLEngineSyncManager *)self engineLibrary];
    v11 = [v10 store];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E60AB550;
    id v21 = v11;
    v22 = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E60AA9D0;
    BOOL v19 = a4;
    id v18 = v9;
    v16[4] = self;
    id v17 = v8;
    id v12 = v11;
    id v13 = (id)[v12 performWriteTransactionWithBlock:v20 completionHandler:v16];
  }
  else
  {
    v14 = [v8 description];
    v15 = +[CPLErrors incorrectParametersErrorForParameter:v14];
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }
}

void __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E60AB750;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 do:v6];
}

void __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = [v3 error];
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Unable to save derivativesFilter: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [v3 error];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 32) _addRuleToUserDefaults:*(void *)(a1 + 40)];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __91__CPLEngineSyncManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) storeDerivativesFilter:*(void *)(*(void *)(a1 + 40) + 32) error:a2];
}

- (id)_dropDerivativeRulesFromUserDefaults
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"CPLDropDerivativesTestRules"];

  if (v3)
  {
    id v4 = +[CPLDropDerivativesRecipe unarchiveArrayOfCPLDropDerivativeRecipesFrom:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_addRuleToUserDefaults:(id)a3
{
  id v9 = a3;
  id v4 = [(CPLEngineSyncManager *)self _dropDerivativeRulesFromUserDefaults];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = v5;
  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
  [v6 addObject:v9];
  uint64_t v7 = +[CPLDropDerivativesRecipe archiveArrayOfCPLDropDerivativeRecipes:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setObject:v7 forKey:@"CPLDropDerivativesTestRules"];
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CPLEngineSyncManager_getStatusDictionaryWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = lock;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __65__CPLEngineSyncManager_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = @"state";
  v2 = [*(id *)(a1 + 32) _descriptionForCurrentState];
  v33[1] = @"tasks";
  v34[0] = v2;
  id v3 = [*(id *)(v1 + 32) _descriptionForLaunchedTasks];
  v34[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  id v5 = (void *)[v4 mutableCopy];

  if ([*(id *)(*(void *)(v1 + 32) + 128) count])
  {
    v23 = v5;
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v5, "setObject:forKey:");
    v6 = [*(id *)(v1 + 32) engineLibrary];
    v27 = [v6 transport];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v24 = v1;
    id obj = *(id *)(*(void *)(v1 + 32) + 128);
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      uint64_t v10 = *MEMORY[0x1E4F28A50];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
          if (v12) {
            id v12 = (void *)v12[3];
          }
          id v13 = v12;
          v14 = [v13 userInfo];
          v15 = [v14 objectForKey:v10];

          if (v15)
          {
            v16 = v15;

            id v13 = v16;
          }
          id v17 = [v27 bestErrorForUnderlyingError:v13];

          if (v17)
          {
            id v18 = NSString;
            BOOL v19 = [v17 domain];
            uint64_t v20 = [v17 code];
            id v21 = [v17 localizedDescription];
            v22 = [v18 stringWithFormat:@"%@ %ld %@", v19, v20, v21];
            [v26 addObject:v22];
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }

    id v5 = v23;
    uint64_t v1 = v24;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = lock;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28E78];
  v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) _shortDescriptionForCurrentState];
  id v4 = [*v2 _descriptionForLaunchedTasks];
  v65 = [v1 stringWithFormat:@"%@ (%@)", v3, v4];

  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__19911;
  v84 = __Block_byref_object_dispose__19912;
  id v85 = 0;
  id v5 = *v2;
  v6 = (os_unfair_lock_s *)((char *)*v2 + 20);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v76 = __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke_2;
  v77 = &unk_1E60AA7E0;
  id v78 = v5;
  v79 = &v80;
  uint64_t v7 = v75;
  os_unfair_lock_lock(v6);
  v76((uint64_t)v7);
  os_unfair_lock_unlock(v6);

  uint64_t v8 = [(id)v81[5] count];
  dispatch_block_t v9 = (void *)v81[5];
  if (v8 == 1)
  {
    uint64_t v10 = [v9 firstObject];
    [v65 appendFormat:@"\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@", v10];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v11 = [v9 count];
  id v12 = (void *)v81[5];
  if (v11 == 2)
  {
    uint64_t v10 = [v12 firstObject];
    id v13 = [(id)v81[5] lastObject];
    [v65 appendFormat:@"\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@ OR %@", v10, v13];
LABEL_7:

    goto LABEL_8;
  }
  if ((unint64_t)[v12 count] >= 3)
  {
    uint64_t v10 = [(id)v81[5] array];
    id v13 = objc_msgSend(v10, "subarrayWithRange:", 0, objc_msgSend((id)v81[5], "count") - 1);
    v14 = [v13 componentsJoinedByString:@", "];
    v15 = [(id)v81[5] lastObject];
    [v65 appendFormat:@"\nMETADATA SYNCHRONIZATION IS DISABLED UNTIL %@ OR %@", v14, v15];

    goto LABEL_7;
  }
LABEL_9:
  v64 = [MEMORY[0x1E4F1C9C8] date];
  if (![*(id *)(*(void *)(a1 + 32) + 128) count]) {
    goto LABEL_37;
  }
  [v65 appendString:@"\nlast errors:"];
  v16 = [*(id *)(a1 + 32) engineLibrary];
  v61 = [v16 transport];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v62 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (!v62) {
    goto LABEL_36;
  }
  uint64_t v60 = *(void *)v72;
  uint64_t v63 = *MEMORY[0x1E4F28A50];
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v72 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v71 + 1) + 8 * v17);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 8);
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v20 = +[CPLEngineSyncManager shortDescriptionForState:v19];
      if (v18)
      {
        id v66 = *(id *)(v18 + 16);
        id v21 = *(void **)(v18 + 24);
      }
      else
      {
        id v66 = 0;
        id v21 = 0;
      }
      id v22 = v21;
      int v23 = [v22 isCPLOperationDeferredError];
      uint64_t v24 = [v22 userInfo];
      v25 = [v24 objectForKey:@"CPLErrorRequestUUIDs"];

      id v26 = [v22 userInfo];
      v27 = [v26 objectForKey:v63];

      if (v27)
      {
        id v28 = v27;

        id v22 = v28;
      }
      long long v29 = [v61 bestErrorForUnderlyingError:v22];

      if (v23)
      {
        long long v30 = +[CPLDateFormatter stringFromDateAgo:v66 now:v64];
        long long v31 = [v29 domain];
        uint64_t v32 = [v29 code];
        v33 = [v29 localizedDescription];
        [v65 appendFormat:@"\n\t%@ (%@): [DEFER] %@ %ld %@", v30, v20, v31, v32, v33];
LABEL_28:

        v35 = v27;
        goto LABEL_29;
      }
      v34 = [v29 userInfo];
      v35 = [v34 objectForKey:v63];

      if (v35)
      {
        v36 = NSString;
        v37 = [v35 domain];
        uint64_t v38 = [v35 code];
        v39 = [v35 localizedDescription];
        long long v30 = [v36 stringWithFormat:@" - [%@ %ld %@]", v37, v38, v39];
      }
      else
      {
        long long v30 = &stru_1F0D5F858;
      }
      v40 = +[CPLDateFormatter stringFromDateAgo:v66 now:v64];
      v41 = [v29 domain];
      uint64_t v42 = [v29 code];
      v43 = [v29 localizedDescription];
      [v65 appendFormat:@"\n\t%@ (%@): %@ %ld %@%@", v40, v20, v41, v42, v43, v30];

      v44 = [v35 userInfo];
      long long v31 = [v44 objectForKey:v63];

      if (v31)
      {
        v33 = [v31 domain];
        uint64_t v45 = [v31 code];
        v46 = [v31 localizedDescription];
        [v65 appendFormat:@" (%@ %ld %@)", v33, v45, v46];

        v27 = v35;
        goto LABEL_28;
      }
LABEL_29:

      if (v25) {
        [v65 appendFormat:@" (requests: %@)", v25];
      }

      ++v17;
    }
    while (v62 != v17);
    uint64_t v47 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
    uint64_t v62 = v47;
  }
  while (v47);
LABEL_36:

LABEL_37:
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    v48 = [*(id *)(*(void *)(a1 + 32) + 160) allObjects];
    v49 = [v48 componentsJoinedByString:@", "];
    [v65 appendFormat:@"\nForced sync tasks are blocked. Reasons: %@", v49];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 144) count])
  {
    [v65 appendString:@"\nlast forced syncs:"];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v50 = *(id *)(*(void *)(a1 + 32) + 144);
    uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v86 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v68;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v68 != v52) {
            objc_enumerationMutation(v50);
          }
          v54 = [*(id *)(*((void *)&v67 + 1) + 8 * v53) descriptionWithNow:v64];
          [v65 appendFormat:@"\n\t%@", v54];

          ++v53;
        }
        while (v51 != v53);
        uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v86 count:16];
      }
      while (v51);
    }
  }
  uint64_t v55 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v55 + 137))
  {
    if (*(unsigned char *)(v55 + 138)) {
      v56 = @"\nboosting priority - currently overriding system budgets";
    }
    else {
      v56 = @"\nboosting priority if necessary";
    }
    [v65 appendString:v56];
    uint64_t v55 = *(void *)(a1 + 32);
  }
  if (*(void *)(v55 + 104))
  {
    [v65 appendFormat:@"\nrunning %@", *(void *)(v55 + 104)];
    uint64_t v55 = *(void *)(a1 + 32);
  }
  if (*(void *)(v55 + 96))
  {
    [v65 appendFormat:@"\nrunning forced setup %@", *(void *)(v55 + 96)];
    uint64_t v55 = *(void *)(a1 + 32);
  }
  if (*(void *)(v55 + 112))
  {
    [v65 appendFormat:@"\npending %@", *(void *)(v55 + 112)];
    uint64_t v55 = *(void *)(a1 + 32);
  }
  uint64_t v57 = *(void *)(v55 + 64);
  if (v57) {
    [v65 appendFormat:@"\ncurrent session tracked as %@", v57];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(&v80, 8);
}

void __55__CPLEngineSyncManager_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:@"LIBRARY ZONES ARE CLEANED-UP"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "alternateRecoverDescription", (void)v12);
          uint64_t v11 = [v10 uppercaseString];

          if (v11) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (id)componentName
{
  return @"syncmanager";
}

- (NSError)lastError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__19911;
  uint64_t v10 = __Block_byref_object_dispose__19912;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CPLEngineSyncManager_lastError__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __33__CPLEngineSyncManager_lastError__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) lastObject];
  id v4 = (id)v2;
  if (v2) {
    id v3 = *(void **)(v2 + 24);
  }
  else {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (id)lastErrorUnlocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  lastError = self->_lastError;
  return lastError;
}

- (void)endClientWork:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineSyncManager *)self platformObject];
  [v5 endClientWork:v4];
}

- (void)beginClientWork:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineSyncManager *)self platformObject];
  [v5 beginClientWork:v4];
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__CPLEngineSyncManager_closeAndDeactivate_completionHandler___block_invoke;
  v12[3] = &unk_1E60A5F60;
  id v13 = v6;
  SEL v14 = a2;
  v12[4] = self;
  uint64_t v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  uint64_t v9 = lock;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

uint64_t __61__CPLEngineSyncManager_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v20 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Trying to close %@ twice", buf, 0xCu);
      }
    }
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    [v22 handleFailureInMethod:v23, v24, v25, 1334, @"Trying to close %@ twice", *(void *)(a1 + 32) object file lineNumber description];

    abort();
  }
  *(unsigned char *)(v2 + 42) = 1;
  id v3 = [*(id *)(a1 + 32) platformObject];
  [v3 prepareForClose];

  id v4 = *(void **)(a1 + 32);
  if (v4[14])
  {
    id v5 = +[CPLErrors libraryClosedError];
    [v4 _discardPendingForceSyncTaskWithError:v5];

    [*(id *)(a1 + 32) _reenableSchedulerForForceSyncTaskIfNecessary];
    id v4 = *(void **)(a1 + 32);
  }
  if (v4[24] || v4[13] || v4[12])
  {
    uint64_t v6 = [*(id *)(a1 + 40) copy];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 104);
    if (v10)
    {
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v11 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling current forced sync task", buf, 2u);
        }

        id v10 = *(void **)(*(void *)(a1 + 32) + 104);
      }
      [v10 cancelTask];
    }
    else
    {
      long long v12 = *(void **)(v9 + 96);
      if (v12)
      {
        [v12 cancel];
      }
      else
      {
        id v13 = (void *)MEMORY[0x1E4F28E78];
        SEL v14 = [*(id *)(a1 + 32) _shortDescriptionForCurrentState];
        long long v15 = [*(id *)(a1 + 32) _descriptionForLaunchedTasks];
        id v16 = [v13 stringWithFormat:@"%@ (%@)", v14, v15];

        if (!_CPLSilentLogging)
        {
          uint64_t v17 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v16;
            _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling current sync session in state: %@", buf, 0xCu);
          }
        }
      }
    }
    return [*(id *)(a1 + 32) _cancelAllTasksLocked];
  }
  else
  {
    uint64_t v19 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v19();
  }
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineSyncManager *)self engineLibrary];
  uint64_t v6 = [v5 store];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CPLEngineSyncManager_openWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60AA9A0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = (id)[v8 performReadTransactionWithBlock:v10];
}

void __50__CPLEngineSyncManager_openWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 userIdentifier];
  [v3 _setTransportUserIdentifier:v6];

  uint64_t v7 = [*(id *)(a1 + 40) derivativesFilter];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  *(unsigned char *)(*(void *)(a1 + 32) + 41) = [*(id *)(a1 + 40) shouldUpdateDisabledFeatures];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 41)) {
    BOOL v10 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Will update list of disabled features on setup", v15, 2u);
    }
  }
  id v12 = [*(id *)(a1 + 40) scopes];
  *(unsigned char *)(*(void *)(a1 + 32) + 137) = [v12 hasScopesNeedingToPushHighPriorityChangesToTransport];

  uint64_t v13 = *(void *)(a1 + 48);
  SEL v14 = [v5 error];

  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

- (void)task:(id)a3 didProgress:(float)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CPLEngineSyncManager_task_didProgress_userInfo___block_invoke;
  v13[3] = &unk_1E60AA978;
  v13[4] = self;
  id v14 = v9;
  float v17 = a4;
  id v15 = v10;
  SEL v16 = a2;
  id v11 = v10;
  id v12 = v9;
  [(CPLEngineSyncManager *)self dispatchSyncBlock:v13];
}

void __50__CPLEngineSyncManager_task_didProgress_userInfo___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 192);
  switch(v4)
  {
    case 14:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      id v12 = [(id)objc_opt_class() shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 192)];
      [v8 handleFailureInMethod:v9, v10, v11, 1304, @"Should not be in state %@", v12 object file lineNumber description];

      goto LABEL_14;
    case 1:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      SEL v16 = @"Should not be in setup state with some running task";
      float v17 = v8;
      uint64_t v18 = v13;
      uint64_t v19 = v14;
      uint64_t v20 = v15;
      uint64_t v21 = 1301;
LABEL_13:
      [v17 handleFailureInMethod:v18 object:v19 file:v20 lineNumber:v21 description:v16];

LABEL_14:
      abort();
    case 0:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(a1 + 32);
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      SEL v16 = @"Should not be quiet with some running task";
      float v17 = v8;
      uint64_t v18 = v22;
      uint64_t v19 = v23;
      uint64_t v20 = v15;
      uint64_t v21 = 1298;
      goto LABEL_13;
  }
  if (*(void *)(v3 + 88))
  {
    LODWORD(a2) = *(_DWORD *)(a1 + 64);
    [*(id *)(v3 + 88) progressForTask:*(void *)(a1 + 40) progress:a2];
    int v6 = v5;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    int v6 = 0;
  }
  id v24 = [(id)v3 platformObject];
  LODWORD(v7) = v6;
  [v24 didProgress:*(void *)(a1 + 48) userInfo:*(void *)(*(void *)(a1 + 32) + 192) forState:v7];
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    uint64_t v9 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
      *(_DWORD *)buf = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Task %@ did finish with error %@ in state %@", buf, 0x20u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__CPLEngineSyncManager_task_didFinishWithError___block_invoke;
  v13[3] = &unk_1E60A67C8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  SEL v16 = a2;
  id v11 = v8;
  id v12 = v7;
  [(CPLEngineSyncManager *)self dispatchSyncBlock:v13];
}

void __48__CPLEngineSyncManager_task_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  if (v3)
  {
    if ([v3 containsTask:*(void *)(a1 + 40)]) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 48);
    if (!v4)
    {
      if (!_CPLSilentLogging)
      {
        v40 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v41;
          _os_log_impl(&dword_1B4CAC000, v40, OS_LOG_TYPE_ERROR, "Task completion called for %@ with no step currently running", buf, 0xCu);
        }
      }
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v42 = *(void *)(a1 + 56);
      uint64_t v43 = *(void *)(a1 + 32);
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      [v34 handleFailureInMethod:v42, v43, v37, 1222, @"Task completion called for %@ with no step currently running", *(void *)(a1 + 40) object file lineNumber description];
      goto LABEL_72;
    }
  }
  if (v4 != *(void *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      long long v31 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void **)(a1 + 40);
        v33 = [*(id *)(*(void *)(a1 + 32) + 88) descriptionForTasks];
        *(_DWORD *)buf = 138412546;
        uint64_t v52 = v32;
        __int16 v53 = 2112;
        v54 = v33;
        _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_ERROR, "Task completion called for %@ but current step (%@) does not manage it", buf, 0x16u);
      }
    }
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v35 = *(void *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 32);
    v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    uint64_t v38 = *(void *)(a1 + 40);
    v39 = [*(id *)(*(void *)(a1 + 32) + 88) descriptionForTasks];
    [v34 handleFailureInMethod:v35, v36, v37, 1223, @"Task completion called for %@ but current step (%@) does not manage it", v38, v39 object file lineNumber description];
    goto LABEL_66;
  }
LABEL_6:
  id v5 = *(id *)(a1 + 48);
  if (!*(void *)(a1 + 40) && !*(void *)(a1 + 48) && *(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v6 = +[CPLErrors operationCancelledError];

    id v5 = (id)v6;
  }
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Looking for next step of sync session", buf, 2u);
    }
  }
  unsigned __int8 v50 = 0;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[24];
  switch(v9)
  {
    case 1:
      if (![v8 _didFinishSetupTaskWithError:v5 shouldStop:&v50]) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 14:
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v44 = *(void *)(a1 + 56);
      uint64_t v45 = *(void *)(a1 + 32);
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      v39 = [(id)objc_opt_class() shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 192)];
      [v34 handleFailureInMethod:v44, v45, v37, 1240, @"Should not be in state %@", v39, v49 object file lineNumber description];
LABEL_66:

LABEL_72:
      goto LABEL_73;
    case 0:
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v46 = *(void *)(a1 + 56);
      uint64_t v47 = *(void *)(a1 + 32);
      v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      [v34 handleFailureInMethod:v46 object:v47 file:v48 lineNumber:1234 description:@"Should not be quiet with some running task"];

LABEL_73:
      abort();
  }
  uint64_t v10 = (void *)v8[11];
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      if (([v10 didFinishTask:v11 withError:*(void *)(a1 + 48) shouldStop:&v50] & 1) == 0)
      {
LABEL_20:
        if (!_CPLSilentLogging)
        {
          id v12 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v13 = [*(id *)(a1 + 32) _shortDescriptionForCurrentState];
            id v14 = [*(id *)(a1 + 32) _descriptionForLaunchedTasks];
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = v13;
            __int16 v53 = 2112;
            v54 = v14;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "There is more work to do for %@ (%@)", buf, 0x16u);
          }
        }
        goto LABEL_60;
      }
    }
  }
LABEL_25:
  if (!_CPLSilentLogging)
  {
    id v15 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      SEL v16 = [*(id *)(a1 + 32) _shortDescriptionForCurrentState];
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = v16;
      _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEBUG, "%@ is finished now", buf, 0xCu);
    }
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(void *)(v17 + 56))
  {
    if (!_CPLSilentLogging)
    {
      id v18 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Library is closing. Stopping now", buf, 2u);
      }

      uint64_t v17 = *(void *)(a1 + 32);
    }
    [(id)v17 _notifyEndOfSyncSession];
    [*(id *)(a1 + 32) _setState:0];
    [*(id *)(a1 + 32) _overrideBudgetsIfNeeded];
    [*(id *)(a1 + 32) _resetErrorForSyncSession];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(void **)(v19 + 56);
    *(void *)(v19 + 56) = 0;

    goto LABEL_60;
  }
  int v21 = v50;
  if (*(void *)(v17 + 120) > 0xDuLL)
  {
LABEL_44:
    if (v21)
    {
      if (*(void *)(v17 + 120) > 0xDuLL)
      {
LABEL_59:
        [(id)v17 _notifyEndOfSyncSession];
        [*(id *)(a1 + 32) _setState:0];
        [*(id *)(a1 + 32) _overrideBudgetsIfNeeded];
        goto LABEL_60;
      }
      if (!_CPLSilentLogging)
      {
        id v24 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = +[CPLEngineSyncManager shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 120)];
          id v26 = *(void **)(*(void *)(a1 + 32) + 80);
          *(_DWORD *)buf = 138412546;
          uint64_t v52 = v25;
          __int16 v53 = 2112;
          v54 = v26;
          _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Not rewinding to %@ as we were required to stop (last error: %@)", buf, 0x16u);
        }
        uint64_t v17 = *(void *)(a1 + 32);
      }
      *(void *)(v17 + 120) = 14;
    }
    else
    {
      v27 = [(id)v17 _transportUserIdentifier];

      if (v27)
      {
        [*(id *)(a1 + 32) _advanceToNextStateLocked];
        goto LABEL_60;
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v28 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEBUG, "Lost the transport user identifier, restarting from setup", buf, 2u);
        }
      }
      long long v29 = *(void **)(a1 + 32);
      long long v30 = +[CPLErrors cplErrorWithCode:28 description:@"Lost the user identifier during the sync session"];
      [v29 setErrorForSyncSessionUnlocked:v30];
    }
    uint64_t v17 = *(void *)(a1 + 32);
    goto LABEL_59;
  }
  if (v50 && ([*(id *)(v17 + 80) isCPLOperationCancelledError] & 1) == 0)
  {
    int v21 = v50;
    uint64_t v17 = *(void *)(a1 + 32);
    goto LABEL_44;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v22 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = [(id)objc_opt_class() shortDescriptionForState:*(void *)(*(void *)(a1 + 32) + 120) - 1];
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = v23;
      _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEBUG, "Restarting sync session from %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _resetErrorForSyncSession];
  [*(id *)(a1 + 32) _setState:*(void *)(*(void *)(a1 + 32) + 120) - 1];
  [*(id *)(a1 + 32) _advanceToNextStateLocked];
  *(void *)(*(void *)(a1 + 32) + 120) = 14;
LABEL_60:
}

- (BOOL)_didFinishSetupTaskWithError:(id)a3 shouldStop:(BOOL *)a4
{
  id v6 = a3;
  setupTask = self->_setupTask;
  self->_setupTask = 0;

  if (v6)
  {
    [(CPLEngineSyncManager *)self setErrorForSyncSessionUnlocked:v6];
    *a4 = 1;
  }

  return 1;
}

- (void)_cancelAllTasksForSetup
{
}

- (BOOL)_launchSetupTask
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_setupTask)
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Trying to launch a setup task twice", buf, 2u);
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    [v13 handleFailureInMethod:a2 object:self file:v14 lineNumber:1188 description:@"Trying to launch a setup task twice"];

    abort();
  }
  if (self->_setupIsDone) {
    return 0;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Launching setup task", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__CPLEngineSyncManager__launchSetupTask__block_invoke;
  v15[3] = &unk_1E60AB8A0;
  v15[4] = self;
  id v5 = [(CPLEngineSyncManager *)self _setupTaskWithCompletionHandler:v15];
  setupTask = self->_setupTask;
  self->_setupTask = v5;

  if (self->_foreground) {
    [(CPLEngineTransportSetupTask *)self->_setupTask setForeground:1];
  }
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = self->_setupTask;
      int v9 = [(CPLEngineTransportSetupTask *)v8 foreground];
      uint64_t v10 = " with background priority";
      if (v9) {
        uint64_t v10 = " with foreground priority";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
    }
  }
  [(CPLEngineTransportSetupTask *)self->_setupTask runWithinSyncSession:self->_session];
  return self->_setupTask != 0;
}

uint64_t __40__CPLEngineSyncManager__launchSetupTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) task:*(void *)(*(void *)(a1 + 32) + 48) didFinishWithError:a2];
}

- (id)_setupTaskWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  id v7 = [WeakRetained transport];

  BOOL shouldUpdateDisabledFeatures = self->_shouldUpdateDisabledFeatures;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60AA950;
  v12[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v9 = v5;
  uint64_t v10 = [v7 setupTaskUpdateDisabledFeatures:shouldUpdateDisabledFeatures completionHandler:v12];

  return v10;
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2;
  v20[3] = &unk_1E60AA928;
  id v21 = v12;
  uint64_t v22 = v13;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v26 = v14;
  uint64_t v27 = v15;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  id v19 = v12;
  [v13 dispatchSyncBlock:v20];
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (!*(void *)(*(void *)(a1 + 40) + 56)
      || (+[CPLErrors operationCancelledError],
          (id v2 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!*(void *)(a1 + 48))
      {
        if (!_CPLSilentLogging)
        {
          id v21 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Did not get a user identifier from the transport", (uint8_t *)&buf, 2u);
          }
        }
        uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = *(void *)(a1 + 80);
        uint64_t v24 = *(void *)(a1 + 40);
        id v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
        [v22 handleFailureInMethod:v23 object:v24 file:v25 lineNumber:1093 description:@"Did not get a user identifier from the transport"];

        abort();
      }
      if (*(unsigned char *)(*(void *)(a1 + 40) + 41))
      {
        if ([*(id *)(a1 + 56) count])
        {
          if (_CPLSilentLogging) {
            goto LABEL_19;
          }
          uint64_t v4 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            id v5 = [*(id *)(a1 + 56) componentsJoinedByString:@", "];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updated list of disabled features: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          if (_CPLSilentLogging) {
            goto LABEL_19;
          }
          uint64_t v4 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updated list of disabled features: none", (uint8_t *)&buf, 2u);
          }
        }
      }
LABEL_19:
      id v6 = [*(id *)(a1 + 40) engineLibrary];
      id v2 = [v6 store];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v49 = 0x2020000000;
      char v50 = 1;
      id v7 = [*(id *)(a1 + 40) _transportUserIdentifier];
      if (v7)
      {
        if (([*(id *)(a1 + 48) isEqual:v7] & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v8 = __CPLSyncOSLogDomain();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              uint64_t v9 = *(void *)(a1 + 48);
              *(_DWORD *)uint64_t v44 = 138412546;
              uint64_t v45 = v7;
              __int16 v46 = 2112;
              uint64_t v47 = v9;
              _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Transport user changed from %@ to %@, we will need to wipe everything and start from scratch", v44, 0x16u);
            }
          }
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_279;
          v43[3] = &unk_1E60A5DD8;
          v43[4] = *(void *)(a1 + 40);
          [v2 wipeStoreAtNextOpeningWithReason:@"user has changed without CPL being disabled and re-enabled" completionBlock:v43];
        }
        if (!*(void *)(a1 + 64))
        {
LABEL_34:
          uint64_t v16 = *(void *)(a1 + 40);
          if (!*(unsigned char *)(v16 + 41))
          {
            if (!_CPLSilentLogging)
            {
              uint64_t v20 = __CPLSyncOSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)uint64_t v44 = 0;
                _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEBUG, "Setup is done", v44, 2u);
              }

              uint64_t v16 = *(void *)(a1 + 40);
            }
            *(unsigned char *)(v16 + 40) = 1;
            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
            goto LABEL_42;
          }
          goto LABEL_35;
        }
      }
      else if (!*(void *)(a1 + 64))
      {
LABEL_35:
        LOBYTE(v15) = 0;
LABEL_36:
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        void v33[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2_281;
        v33[3] = &unk_1E60AA8B0;
        BOOL v40 = v7 == 0;
        char v41 = 0;
        id v34 = v2;
        p_long long buf = &buf;
        id v17 = *(id *)(a1 + 48);
        uint64_t v18 = *(void *)(a1 + 40);
        id v35 = v17;
        uint64_t v36 = v18;
        char v42 = v15 & 1;
        id v37 = *(id *)(a1 + 64);
        id v38 = *(id *)(a1 + 56);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_6;
        v26[3] = &unk_1E60AA900;
        v26[4] = *(void *)(a1 + 40);
        id v29 = *(id *)(a1 + 72);
        BOOL v31 = v7 == 0;
        id v27 = *(id *)(a1 + 48);
        char v32 = v15 & 1;
        id v28 = *(id *)(a1 + 64);
        long long v30 = &buf;
        id v19 = (id)[v34 performWriteTransactionWithBlock:v33 completionHandler:v26];

LABEL_42:
        _Block_object_dispose(&buf, 8);
        goto LABEL_43;
      }
      unint64_t v10 = (unint64_t)*(id *)(*(void *)(a1 + 40) + 32);
      unint64_t v11 = (unint64_t)*(id *)(a1 + 64);
      id v12 = (void *)v11;
      if (v10 && v11)
      {
        int v13 = [(id)v10 isEqual:v11];
        BOOL v14 = v7 == 0;

        int v15 = v13 ^ 1;
      }
      else
      {
        BOOL v14 = v7 == 0;
        int v15 = (v10 | v11) != 0;
      }
      if ((v14 | v15)) {
        goto LABEL_36;
      }
      goto LABEL_34;
    }
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Setup of transport did fail: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_43:
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_279(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = [*(id *)(a1 + 32) engineLibrary];
  [v3 postNotificationName:@"CPLLibraryMustBeWipedNotificationName" object:v2];
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_2_281(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 80))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E60AA888;
    char v22 = *(unsigned char *)(a1 + 81);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    id v18 = v4;
    uint64_t v21 = v5;
    char v23 = *(unsigned char *)(a1 + 80);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v19 = v6;
    uint64_t v20 = v7;
    [v3 do:v17];
  }
  if (*(unsigned char *)(a1 + 82))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E60AB750;
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    [v3 do:v14];
  }
  if (*(unsigned char *)(*(void *)(a1 + 48) + 41))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_5;
    v10[3] = &unk_1E60AB850;
    id v11 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v13 = v9;
    [v3 do:v10];
  }
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_7;
  v11[3] = &unk_1E60AA8D8;
  id v12 = v3;
  id v5 = *(id *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v16 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  char v19 = *(unsigned char *)(a1 + 73);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  id v15 = v8;
  uint64_t v17 = v9;
  id v10 = v3;
  [v4 dispatchSyncBlock:v11];
}

void __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = [*(id *)(a1 + 32) error];
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Unable to save user identifier: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Setup is done", (uint8_t *)&v11, 2u);
      }
    }
    if (*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 40) _setTransportUserIdentifier:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 81)) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 56));
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 41) = 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 40) = 1;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Setup detected significant changes, will need to retry", (uint8_t *)&v11, 2u);
        }
      }
      uint64_t v9 = *(void *)(a1 + 64);
      id v10 = +[CPLErrors operationCancelledError];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 64)
    || (int v4 = [*(id *)(a1 + 32) resetCompleteSyncStateWithCause:@"user change" error:a2],
        uint64_t result = 0,
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0,
        v4))
  {
    if (*(unsigned char *)(a1 + 65))
    {
      uint64_t result = [*(id *)(a1 + 32) storeUserIdentifier:*(void *)(a1 + 40) error:a2];
      if (!result) {
        return result;
      }
      if (*(unsigned char *)(a1 + 65))
      {
        uint64_t v6 = [*(id *)(a1 + 48) engineLibrary];
        [v6 notifyAttachedObjectsPullQueueIsFull];
      }
    }
    return 1;
  }
  return result;
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) storeDerivativesFilter:*(void *)(a1 + 40) error:a2];
}

uint64_t __56__CPLEngineSyncManager__setupTaskWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  char v5 = 0;
  uint64_t result = [*(id *)(a1 + 32) updateDisabledFeatures:*(void *)(a1 + 40) didReset:&v5 error:a2];
  if (result) {
    BOOL v4 = v5 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (id)_descriptionForSetupTasks
{
  setupTask = self->_setupTask;
  if (setupTask)
  {
    id v3 = [NSString stringWithFormat:@"%@", setupTask];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_launchForceSyncTaskIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!self->_closed && !self->_state)
  {
    p_currentForceSyncTask = (id *)&self->_currentForceSyncTask;
    if (!self->_currentForceSyncTask
      && !self->_forcedSetupTask
      && self->_pendingForceSyncTask
      && ![(NSCountedSet *)self->_blockedReasons count])
    {
      BOOL v4 = [(CPLEngineSyncManager *)self _transportUserIdentifier];
      if (v4)
      {
        objc_storeStrong((id *)&self->_currentForceSyncTask, self->_pendingForceSyncTask);
        pendingForceSyncTask = self->_pendingForceSyncTask;
        self->_pendingForceSyncTask = 0;

        if (!_CPLSilentLogging)
        {
          id v15 = __CPLForceSyncOSLogDomain_20044();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = (CPLEngineForceSyncTask *)*p_currentForceSyncTask;
            *(_DWORD *)long long buf = 138412290;
            id v25 = v16;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "Launching %@", buf, 0xCu);
          }
        }
        uint64_t v17 = [(CPLEngineForceSyncTask *)self->_currentForceSyncTask taskDidFinishWithErrorBlock];
        objc_initWeak((id *)buf, self);
        currentForceSyncTask = self->_currentForceSyncTask;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke;
        v21[3] = &unk_1E60AA858;
        objc_copyWeak(&v23, (id *)buf);
        v21[4] = self;
        id v19 = v17;
        id v22 = v19;
        [(CPLEngineForceSyncTask *)currentForceSyncTask setTaskDidFinishWithErrorBlock:v21];
        [*p_currentForceSyncTask setTransportUserIdentifier:v4];
        [*p_currentForceSyncTask reallyLaunch];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v20 = __CPLForceSyncOSLogDomain_20044();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Setup needs to be done before launching any forced sync task", buf, 2u);
          }
        }
        [(CPLEngineSyncManager *)self _launchForceSetupTask];
        BOOL v4 = 0;
      }
      goto LABEL_23;
    }
  }
  if (!self->_pendingForceSyncTask) {
    return;
  }
  if (self->_state)
  {
    if (_CPLSilentLogging) {
      return;
    }
    BOOL v4 = __CPLForceSyncOSLogDomain_20044();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = +[CPLEngineSyncManager shortDescriptionForState:self->_state];
      uint64_t v6 = self->_pendingForceSyncTask;
      *(_DWORD *)long long buf = 138412546;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for sync manager to be quiet (currently in %@) before launching pending %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if (self->_currentForceSyncTask)
  {
    if (_CPLSilentLogging) {
      return;
    }
    BOOL v4 = __CPLForceSyncOSLogDomain_20044();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v7 = self->_currentForceSyncTask;
    id v8 = self->_pendingForceSyncTask;
    *(_DWORD *)long long buf = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    uint64_t v9 = "Waiting for sync manager to drop previous force sync %@ before launching pending %@";
    id v10 = v4;
    uint32_t v11 = 22;
    goto LABEL_22;
  }
  if (self->_forcedSetupTask)
  {
    if (_CPLSilentLogging) {
      return;
    }
    BOOL v4 = __CPLForceSyncOSLogDomain_20044();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    id v12 = self->_pendingForceSyncTask;
    *(_DWORD *)long long buf = 138412290;
    id v25 = v12;
    uint64_t v9 = "Waiting for sync manager to finish forced setup before launching pending %@";
    goto LABEL_21;
  }
  if (_CPLSilentLogging) {
    return;
  }
  BOOL v4 = __CPLForceSyncOSLogDomain_20044();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = self->_pendingForceSyncTask;
    *(_DWORD *)long long buf = 138412290;
    id v25 = v13;
    uint64_t v9 = "Waiting for better conditions before launching pending %@";
LABEL_21:
    id v10 = v4;
    uint32_t v11 = 12;
LABEL_22:
    _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  }
LABEL_23:
}

void __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLForceSyncOSLogDomain_20044();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "%@ did finish with error %@", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke_265;
    v11[3] = &unk_1E60A6840;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = WeakRetained;
    id v15 = v6;
    id v16 = *(id *)(a1 + 40);
    [WeakRetained dispatchForcedTaskBlock:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __55__CPLEngineSyncManager__launchForceSyncTaskIfNecessary__block_invoke_265(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 104))
  {
    [*(id *)(a1 + 48) _forceSyncTaskDidFinishWithError:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) _launchForceSyncTaskIfNecessary];
    [*(id *)(a1 + 48) _reenableSchedulerForForceSyncTaskIfNecessary];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)_launchForceSetupTask
{
  if (self->_forcedSetupTask)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to launch a forced setup twice", buf, 2u);
      }
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    [v7 handleFailureInMethod:a2 object:self file:v8 lineNumber:989 description:@"Trying to launch a forced setup twice"];

    abort();
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke;
  v9[3] = &unk_1E60AB8A0;
  v9[4] = self;
  id v3 = [(CPLEngineSyncManager *)self _setupTaskWithCompletionHandler:v9];
  forcedSetupTask = self->_forcedSetupTask;
  self->_forcedSetupTask = v3;

  [(CPLEngineTransportSetupTask *)self->_forcedSetupTask setForeground:1];
  [(CPLEngineTransportSetupTask *)self->_forcedSetupTask setForcedTask:1];
  [(CPLEngineTransportSetupTask *)self->_forcedSetupTask runWithNoSyncSession];
}

void __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke_2;
  v6[3] = &unk_1E60A6728;
  void v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 dispatchForcedTaskBlock:v6];
}

void __45__CPLEngineSyncManager__launchForceSetupTask__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  id v4 = *(id *)(a1 + 40);
  if (v4) {
    goto LABEL_2;
  }
  id v6 = [*(id *)(a1 + 32) _transportUserIdentifier];

  if (v6) {
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    id v9 = __CPLForceSyncOSLogDomain_20044();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Setup finished successfully but has no transport user identifier", (uint8_t *)&v10, 2u);
    }
  }
  id v4 = +[CPLErrors unknownError];
  if (v4)
  {
LABEL_2:
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLForceSyncOSLogDomain_20044();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Forced setup failed with error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _discardPendingForceSyncTaskWithError:v4];
    [*(id *)(a1 + 32) _reenableSchedulerForForceSyncTaskIfNecessary];
  }
  else
  {
LABEL_8:
    id v7 = *(void **)(a1 + 32);
    if (v7[14])
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLForceSyncOSLogDomain_20044();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Forced setup finished successfully", (uint8_t *)&v10, 2u);
        }

        id v7 = *(void **)(a1 + 32);
      }
      [v7 _launchForceSyncTaskIfNecessary];
    }
    else
    {
      [v7 _reenableSchedulerForForceSyncTaskIfNecessary];
    }
  }
}

- (void)forceSyncTaskHasBeenCancelled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CPLEngineSyncManager_forceSyncTaskHasBeenCancelled___block_invoke;
  v6[3] = &unk_1E60A6728;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CPLEngineSyncManager *)self dispatchForcedTaskBlock:v6];
}

uint64_t __54__CPLEngineSyncManager_forceSyncTaskHasBeenCancelled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[12];
  if (v3)
  {
    [v3 cancel];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    if (v4 == (void *)v2[14])
    {
      id v5 = +[CPLErrors operationCancelledError];
      [v2 _discardPendingForceSyncTaskWithError:v5];
    }
    else
    {
      [v4 reallyCancel];
    }
  }
  id v6 = *(void **)(a1 + 32);
  return [v6 _reenableSchedulerForForceSyncTaskIfNecessary];
}

- (void)forceSyncTaskHasBeenLaunched:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CPLEngineSyncManager_forceSyncTaskHasBeenLaunched___block_invoke;
  v6[3] = &unk_1E60A6728;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CPLEngineSyncManager *)self dispatchForcedTaskBlock:v6];
}

void __53__CPLEngineSyncManager_forceSyncTaskHasBeenLaunched___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasBrokenScopes])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLForceSyncOSLogDomain_20044();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v29 = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "All forced syncs are disabled until library is cleaned", v29, 2u);
      }
    }
    id v3 = [*(id *)(a1 + 40) taskDidFinishWithErrorBlock];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = +[CPLErrors unknownError];
    goto LABEL_20;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    if (_CPLSilentLogging)
    {
LABEL_13:
      objc_msgSend(*(id *)(a1 + 40), "taskDidFinishWithErrorBlock", *(_OWORD *)v29);
      id v3 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = _willDownloadInBackgroundErrorForTask(v4);
LABEL_20:
      id v11 = (void *)v5;
      ((void (**)(void, void *, uint64_t))v3)[2](v3, v4, v5);

LABEL_21:
      return;
    }
    id v6 = __CPLForceSyncOSLogDomain_20044();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)id v29 = 138412290;
    *(void *)&v29[4] = v7;
    id v8 = "Ignoring %@ because we are blocked";
LABEL_11:
    _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, v8, v29, 0xCu);
    goto LABEL_12;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 42))
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLForceSyncOSLogDomain_20044();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)id v29 = 138412290;
        *(void *)&v29[4] = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring %@ because we are closed", v29, 0xCu);
      }
    }
    id v3 = [*(id *)(a1 + 40) taskDidFinishWithErrorBlock];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = +[CPLErrors libraryClosedError];
    goto LABEL_20;
  }
  char v12 = [*(id *)(a1 + 40) bypassForceSyncLimitations];
  uint64_t v13 = *(void *)(a1 + 32);
  if ((v12 & 1) == 0 && !*(unsigned char *)(v13 + 136))
  {
    if ([(id)v13 _checkForegroundAtLaunchForForceSyncTask])
    {
      if (_CPLSilentLogging) {
        goto LABEL_13;
      }
      id v6 = __CPLForceSyncOSLogDomain_20044();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)id v29 = 138412290;
      *(void *)&v29[4] = v14;
      id v8 = "Ignoring %@ because we are in background";
      goto LABEL_11;
    }
    uint64_t v13 = *(void *)(a1 + 32);
  }
  id v15 = *(void **)(v13 + 104);
  if (v15)
  {
    if ([v15 bypassForceSyncLimitations])
    {
      int v16 = 0;
      goto LABEL_39;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v17 = __CPLForceSyncOSLogDomain_20044();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 104);
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v19;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v18;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling %@ because we must launch %@", v29, 0x16u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 104) cancelTask];
  }
  int v16 = 1;
LABEL_39:
  id v20 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v20)
  {
    if ([v20 bypassForceSyncLimitations])
    {
LABEL_52:
      id v3 = +[CPLErrors cplErrorWithCode:10 description:@"A more important force sync task is running"];
      uint64_t v28 = [*(id *)(a1 + 40) taskDidFinishWithErrorBlock];
      v28[2](v28, *(void *)(a1 + 40), v3);

      [*(id *)(a1 + 32) _recordForcedSyncTask:*(void *)(a1 + 40) discarded:1 error:v3];
      goto LABEL_21;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v21 = __CPLForceSyncOSLogDomain_20044();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 112);
        *(_DWORD *)id v29 = 138412546;
        *(void *)&v29[4] = v23;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v22;
        _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@ because we must launch %@", v29, 0x16u);
      }
    }
    uint64_t v24 = +[CPLErrors operationCancelledError];
    id v25 = [*(id *)(*(void *)(a1 + 32) + 112) taskDidFinishWithErrorBlock];
    ((void (**)(void, void, void *))v25)[2](v25, *(void *)(a1 + 40), v24);

    [*(id *)(a1 + 32) _recordForcedSyncTask:*(void *)(*(void *)(a1 + 32) + 112) discarded:1 error:v24];
  }
  if (!v16) {
    goto LABEL_52;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 40));
  if (!_CPLSilentLogging)
  {
    __int16 v26 = __CPLForceSyncOSLogDomain_20044();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)id v29 = 138412290;
      *(void *)&v29[4] = v27;
      _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "Enqueuing %@", v29, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _disableSchedulerForForceSyncTaskIfNecessary];
  [*(id *)(a1 + 32) _launchForceSyncTaskIfNecessary];
}

- (void)_forceSyncTaskDidFinishWithError:(id)a3
{
  currentForceSyncTask = self->_currentForceSyncTask;
  if (currentForceSyncTask)
  {
    [(CPLEngineSyncManager *)self _recordForcedSyncTask:currentForceSyncTask discarded:0 error:a3];
    id v6 = self->_currentForceSyncTask;
    self->_currentForceSyncTask = 0;
  }
}

- (void)_discardPendingForceSyncTaskWithError:(id)a3
{
  pendingForceSyncTask = self->_pendingForceSyncTask;
  if (pendingForceSyncTask)
  {
    id v5 = a3;
    id v6 = [(CPLEngineForceSyncTask *)pendingForceSyncTask taskDidFinishWithErrorBlock];
    ((void (**)(void, CPLEngineForceSyncTask *, id))v6)[2](v6, self->_pendingForceSyncTask, v5);

    [(CPLEngineSyncManager *)self _recordForcedSyncTask:self->_pendingForceSyncTask discarded:1 error:v5];
    uint64_t v7 = self->_pendingForceSyncTask;
    self->_pendingForceSyncTask = 0;
  }
}

- (BOOL)_checkForegroundAtLaunchForForceSyncTask
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"CPLForceForegroundAtLaunchForForceSyncTask"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v5 = [v4 BOOLForKey:@"CPLForceForegroundAtLaunchForForceSyncTask"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_reenableSchedulerForForceSyncTaskIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (*(_OWORD *)&self->_currentForceSyncTask == 0
    && !self->_forcedSetupTask
    && self->_disabledSchedulerForForceSyncTask)
  {
    id v3 = [(CPLEngineSyncManager *)self engineLibrary];
    id v4 = [v3 scheduler];
    [v4 enableSynchronizationWithReason:@"performing a forced sync session"];

    self->_disabledSchedulerForForceSyncTask = 0;
    closingCompletionHandler = (void (**)(id, void))self->_closingCompletionHandler;
    if (closingCompletionHandler)
    {
      closingCompletionHandler[2](closingCompletionHandler, 0);
      id v6 = self->_closingCompletionHandler;
      self->_closingCompletionHandler = 0;
    }
  }
  [(CPLEngineSyncManager *)self _dispatchCancellerBlocksIfNecessary];
}

- (void)_disableSchedulerForForceSyncTaskIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!self->_closed
    && (self->_pendingForceSyncTask || self->_currentForceSyncTask || self->_forcedSetupTask)
    && !self->_disabledSchedulerForForceSyncTask)
  {
    id v3 = [(CPLEngineSyncManager *)self engineLibrary];
    id v4 = [v3 scheduler];
    [v4 disableSynchronizationWithReason:@"performing a forced sync session"];

    [(CPLEngineSyncManager *)self _cancelAllTasksLocked];
    self->_disabledSchedulerForForceSyncTask = 1;
  }
}

- (void)removeBrokenScope:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  char v12 = __42__CPLEngineSyncManager_removeBrokenScope___block_invoke;
  uint64_t v13 = &unk_1E60AA830;
  uint64_t v14 = self;
  id v5 = v4;
  id v15 = v5;
  int v16 = &v17;
  id v6 = v11;
  os_unfair_lock_lock(&self->_brokenScopesLock);
  v12((uint64_t)v6);
  os_unfair_lock_unlock(&self->_brokenScopesLock);

  if (*((unsigned char *)v18 + 24))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "All broken scopes have been fixed. Starting a sync session", v10, 2u);
      }
    }
    id v8 = [(CPLEngineSyncManager *)self engineLibrary];
    id v9 = [v8 scheduler];
    [v9 kickOffSyncSession];
  }
  _Block_object_dispose(&v17, 8);
}

void __42__CPLEngineSyncManager_removeBrokenScope___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CPLEngineSyncManager_removeBrokenScope___block_invoke_2;
  v4[3] = &unk_1E60AA808;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 indexesOfObjectsPassingTest:v4];
  if ([v3 count])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectsAtIndexes:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) count] == 0;
  }
}

uint64_t __42__CPLEngineSyncManager_removeBrokenScope___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 engineScope];
  id v4 = [v3 scopeIdentifier];
  id v5 = [*(id *)(a1 + 32) scopeIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (void)addBrokenScope:(id)a3
{
  id v4 = a3;
  id v5 = [CPLBrokenScope alloc];
  uint64_t v6 = [(CPLEngineSyncManager *)self engineLibrary];
  uint64_t v7 = [(CPLBrokenScope *)v5 initWithEngineScope:v4 engineLibrary:v6];

  p_brokenScopesLock = &self->_brokenScopesLock;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __39__CPLEngineSyncManager_addBrokenScope___block_invoke;
  uint64_t v14 = &unk_1E60A6728;
  id v15 = self;
  id v9 = v7;
  int v16 = v9;
  uint64_t v10 = &v11;
  os_unfair_lock_lock(p_brokenScopesLock);
  v13((uint64_t)v10);
  os_unfair_lock_unlock(p_brokenScopesLock);

  [(CPLBrokenScope *)v9 showAlertToUser];
}

uint64_t __39__CPLEngineSyncManager_addBrokenScope___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (NSArray)brokenScopes
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19911;
  uint64_t v18 = __Block_byref_object_dispose__19912;
  id v19 = 0;
  p_brokenScopesLock = &self->_brokenScopesLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __36__CPLEngineSyncManager_brokenScopes__block_invoke;
  uint64_t v11 = &unk_1E60AA7E0;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  id v3 = v9;
  os_unfair_lock_lock(p_brokenScopesLock);
  v10((uint64_t)v3);
  os_unfair_lock_unlock(p_brokenScopesLock);

  uint64_t v4 = [(id)v15[5] copy];
  id v5 = (void *)v4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  id v7 = v6;

  _Block_object_dispose(&v14, 8);
  return (NSArray *)v7;
}

void __36__CPLEngineSyncManager_brokenScopes__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "engineScope", (void)v12);
          [v10 addObject:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)hasBrokenScopes
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_brokenScopesLock = &self->_brokenScopesLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  uint64_t v6 = __39__CPLEngineSyncManager_hasBrokenScopes__block_invoke;
  uint64_t v7 = &unk_1E60A5CE8;
  uint64_t v8 = self;
  uint64_t v9 = &v10;
  uint64_t v3 = v5;
  os_unfair_lock_lock(p_brokenScopesLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_brokenScopesLock);

  LOBYTE(p_brokenScopesLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_brokenScopesLock;
}

uint64_t __39__CPLEngineSyncManager_hasBrokenScopes__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)configureDirectTransportTask:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineSyncManager *)self _transportUserIdentifier];
  [v4 setTransportUserIdentifier:v5];
}

- (BOOL)prepareAndLaunchSyncTaskUnlocked:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v22 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "Asked to launch a task without providing a task", buf, 2u);
      }
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    [v23 handleFailureInMethod:a2 object:self file:v24 lineNumber:767 description:@"Asked to launch a task without providing a task"];

    abort();
  }
  uint64_t v6 = [(CPLEngineSyncManager *)self _transportUserIdentifier];
  if (v6)
  {
    uint64_t v7 = [(CPLEngineSyncManager *)self engineLibrary];
    uint64_t v8 = [v7 scheduler];
    id v25 = 0;
    int v9 = [v8 isSynchronizationDisabledWithReasonError:&v25];
    uint64_t v10 = v25;

    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = v10;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Synchronization is disabled (error: %@)", buf, 0xCu);
        }
      }
      [(CPLEngineSyncManager *)self setErrorForSyncSessionUnlocked:v10];
    }
    else
    {
      if (self->_state < 3) {
        goto LABEL_17;
      }
      uint64_t v12 = [(CPLEngineSyncManager *)self engineLibrary];
      char v13 = [v12 systemMonitor];

      uint64_t v14 = [v13 diskPressureState];
      BOOL v15 = self->_state >= 9 ? v14 == 0 : v14 != 2;

      if (v15)
      {
LABEL_17:
        [v5 setTransportUserIdentifier:v6];
        [v5 setDelegate:self];
        if (!_CPLSilentLogging)
        {
          uint64_t v16 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = " with foreground priority";
            if (!self->_foreground) {
              uint64_t v17 = " with background priority";
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v27 = v5;
            __int16 v28 = 2080;
            id v29 = v17;
            _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
          }
        }
        [v5 setForeground:self->_foreground];
        [v5 launch];
        BOOL v18 = 1;
        goto LABEL_29;
      }
      if (!_CPLSilentLogging)
      {
        id v19 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          char v20 = [(id)objc_opt_class() shortDescriptionForState:self->_state];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = v20;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "System does not have enough space on disk to do %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v18 = 0;
      goto LABEL_30;
    }
    uint64_t v10 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v5;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Can't launch %@ as there is no transport user identifier", buf, 0xCu);
    }
  }
  BOOL v18 = 0;
LABEL_29:

LABEL_30:
  return v18;
}

- (void)setBoostPriority:(BOOL)a3
{
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CPLEngineSyncManager_setBoostPriority___block_invoke;
  v7[3] = &unk_1E60AA7B8;
  v7[4] = self;
  BOOL v8 = a3;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  id v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __41__CPLEngineSyncManager_setBoostPriority___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 137) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 137) = v2;
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(v3 + 32) + 137)) {
          id v5 = @"Start";
        }
        else {
          id v5 = @"Stop";
        }
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@ boosting priority", (uint8_t *)&v6, 0xCu);
      }
    }
    return [*(id *)(v3 + 32) _overrideBudgetsIfNeeded];
  }
  return result;
}

- (void)_overrideBudgetsIfNeeded
{
  if (self->_boostPriority && self->_state - 1 <= 6)
  {
    if (!self->_hasOverridenBudgets)
    {
      uint64_t v3 = [(CPLEngineSyncManager *)self engineLibrary];
      id v4 = [v3 systemMonitor];
      [v4 startOverridingSystemBudgets:18487 reason:3];

      self->_hasOverridenBudgets = 1;
    }
  }
  else if (self->_hasOverridenBudgets)
  {
    id v5 = [(CPLEngineSyncManager *)self engineLibrary];
    int v6 = [v5 systemMonitor];
    [v6 stopOverridingSystemBudgets:18487 reason:3];

    self->_hasOverridenBudgets = 0;
  }
}

- (void)setSyncSessionShouldBeForeground:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke;
  v3[3] = &unk_1E60AA7B8;
  BOOL v4 = a3;
  v3[4] = self;
  [(CPLEngineSyncManager *)self dispatchSyncBlock:v3];
}

void __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(v3 + 136))
  {
    *(unsigned char *)(v3 + 136) = v2;
    if (*(unsigned char *)(a1 + 40))
    {
      if (!_CPLSilentLogging)
      {
        BOOL v4 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Moving to foreground operations", buf, 2u);
        }
      }
      +[CPLTransaction beginTransactionWithIdentifier:@"cpl.foreground" description:@"client is foreground" keepPower:0];
    }
    else
    {
      +[CPLTransaction endTransactionWithIdentifier:@"cpl.foreground"];
      if (!_CPLSilentLogging)
      {
        id v5 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Moving to background operations", buf, 2u);
        }
      }
      [*(id *)(a1 + 32) _moveAllTasksToBackgroundLocked];
    }
    int v6 = [*(id *)(a1 + 32) platformObject];
    [v6 setSyncSessionShouldBeForeground:*(unsigned __int8 *)(a1 + 40)];

    uint64_t v3 = *(void *)(a1 + 32);
    int v2 = *(unsigned __int8 *)(v3 + 136);
  }
  if (!v2)
  {
    uint64_t v7 = *(void **)(v3 + 104);
    if (v7)
    {
      char v8 = [v7 bypassForceSyncLimitations];
      uint64_t v3 = *(void *)(a1 + 32);
      if ((v8 & 1) == 0)
      {
        id v9 = *(id *)(v3 + 104);
        id v10 = *(void **)(a1 + 32);
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        id v19 = __57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke_237;
        char v20 = &unk_1E60A6728;
        uint64_t v21 = v10;
        id v22 = v9;
        id v11 = v9;
        [v10 _dispatchAfter:&v17 block:60.0];

        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
    uint64_t v12 = *(void **)(v3 + 112);
    if (v12 && ([v12 bypassForceSyncLimitations] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        char v13 = __CPLForceSyncOSLogDomain_20044();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 112);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v24 = v14;
          _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@ because we moved to background", buf, 0xCu);
        }
      }
      BOOL v15 = *(void ***)(a1 + 32);
      uint64_t v16 = _willDownloadInBackgroundErrorForTask(v15[14]);
      [v15 _discardPendingForceSyncTaskWithError:v16];
    }
    objc_msgSend(*(id *)(a1 + 32), "_reenableSchedulerForForceSyncTaskIfNecessary", v17, v18, v19, v20, v21);
  }
}

void *__57__CPLEngineSyncManager_setSyncSessionShouldBeForeground___block_invoke_237(void *result)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 136))
  {
    int v2 = result;
    uint64_t result = *(void **)(v1 + 104);
    if (result == (void *)v2[5])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v3 = __CPLForceSyncOSLogDomain_20044();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v4 = v2[5];
          int v5 = 138412290;
          uint64_t v6 = v4;
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling %@ because we moved to background", (uint8_t *)&v5, 0xCu);
        }

        uint64_t result = (void *)v2[5];
      }
      return (void *)[result cancelTask];
    }
  }
  return result;
}

- (void)requestDisabledFeaturesUpdate
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CPLEngineSyncManager_requestDisabledFeaturesUpdate__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __53__CPLEngineSyncManager_requestDisabledFeaturesUpdate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = 1;
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)discardTransportUserIdentifier
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CPLEngineSyncManager_discardTransportUserIdentifier__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __54__CPLEngineSyncManager_discardTransportUserIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setTransportUserIdentifier:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return result;
}

- (void)resetTransportUserIdentifier
{
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Resetting transport user identifier", buf, 2u);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke;
  v4[3] = &unk_1E60A5DD8;
  void v4[4] = self;
  [(CPLEngineSyncManager *)self dispatchSyncBlock:v4];
}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTransportUserIdentifier:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
  int v2 = [*(id *)(a1 + 32) engineLibrary];
  uint64_t v3 = [v2 store];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2;
  v7[3] = &unk_1E60AB578;
  id v8 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2_229;
  v6[3] = &unk_1E60AB578;
  void v6[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v5 = (id)[v4 performWriteTransactionWithBlock:v7 completionHandler:v6];
}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Restting stored user identifier", buf, 2u);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_226;
  v5[3] = &unk_1E60AB410;
  id v6 = *(id *)(a1 + 32);
  [v3 do:v5];
}

void __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_2_229(uint64_t a1)
{
}

uint64_t __52__CPLEngineSyncManager_resetTransportUserIdentifier__block_invoke_226(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) storeUserIdentifier:0 error:a2];
}

- (id)_transportUserIdentifier
{
  p_transportUserIdentifierLock = &self->_transportUserIdentifierLock;
  os_unfair_lock_lock(&self->_transportUserIdentifierLock);
  id v4 = self->_transportUserIdentifier;
  os_unfair_lock_unlock(p_transportUserIdentifierLock);
  return v4;
}

- (void)_setTransportUserIdentifier:(id)a3
{
  id v4 = (CPLEngineStoreUserIdentifier *)a3;
  os_unfair_lock_lock(&self->_transportUserIdentifierLock);
  transportUserIdentifier = self->_transportUserIdentifier;
  self->_transportUserIdentifier = v4;

  os_unfair_lock_unlock(&self->_transportUserIdentifierLock);
}

- (void)unblockSyncSessionWithReason:(id)a3
{
  id v5 = a3;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__CPLEngineSyncManager_unblockSyncSessionWithReason___block_invoke;
  v11[3] = &unk_1E60A65C0;
  void v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v15 = v7;
  id v8 = lock;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

uint64_t __53__CPLEngineSyncManager_unblockSyncSessionWithReason___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1[4] + 160) countForObject:a1[5]])
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = a1[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Sync manager unblocked for reason '%@' too many times", buf, 0xCu);
      }
    }
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    [v6 handleFailureInMethod:v7, v8, v9, 648, @"Sync manager unblocked for reason '%@' too many times", a1[5] object file lineNumber description];

    abort();
  }
  [*(id *)(a1[4] + 160) removeObject:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 160) count];
  if (result)
  {
    id v3 = (void *)a1[4];
    return [v3 _launchForceSyncTaskIfNecessary];
  }
  return result;
}

- (void)cancelAndBlockAllSyncSessionsWithReason:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CPLEngineSyncManager_cancelAndBlockAllSyncSessionsWithReason_block___block_invoke;
  v14[3] = &unk_1E60A6868;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  dispatch_block_t v10 = lock;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __70__CPLEngineSyncManager_cancelAndBlockAllSyncSessionsWithReason_block___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(*(void *)(a1 + 32) + 160);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;

    int v2 = *(void **)(*(void *)(a1 + 32) + 160);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)v6[19];
  if (v7)
  {
    id v18 = (id)MEMORY[0x1BA994060](*(void *)(a1 + 48));
    objc_msgSend(v7, "addObject:");
  }
  else
  {
    uint64_t v8 = (void *)v6[14];
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        id v9 = __CPLForceSyncOSLogDomain_20044();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 112);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v20 = v10;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling pending %@", buf, 0xCu);
        }

        id v6 = *(void **)(a1 + 32);
        uint64_t v8 = (void *)v6[14];
      }
      id v11 = _willDownloadInBackgroundErrorForTask(v8);
      [v6 _discardPendingForceSyncTaskWithError:v11];

      id v6 = *(void **)(a1 + 32);
    }
    if (v6[13] || v6[24])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
      dispatch_block_t v13 = (void *)MEMORY[0x1BA994060](*(void *)(a1 + 48));
      uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 152);
      *(void *)(v15 + 152) = v14;

      [*(id *)(*(void *)(a1 + 32) + 104) cancelTask];
      [*(id *)(a1 + 32) _cancelCurrentSyncSession];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v17 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "No sync session is currently running - no need to cancel anything", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_dispatchCancellerBlocksIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  cancellerBlocks = self->_cancellerBlocks;
  if (cancellerBlocks)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = cancellerBlocks;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    id v9 = self->_cancellerBlocks;
    self->_cancellerBlocks = 0;
  }
}

- (void)cancelCurrentSyncSession
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CPLEngineSyncManager_cancelCurrentSyncSession__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __48__CPLEngineSyncManager_cancelCurrentSyncSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelCurrentSyncSession];
}

- (void)_cancelCurrentSyncSession
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_shouldRestartSessionFromState = 14;
  if (self->_state <= 0xD)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        dispatch_block_t v5 = [(CPLEngineSyncManager *)self _descriptionForLaunchedTasks];
        int v8 = 138412546;
        id v9 = v4;
        __int16 v10 = 2112;
        long long v11 = v5;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Cancelling %@ (%@)", (uint8_t *)&v8, 0x16u);
      }
    }
    [(CPLEngineSyncManager *)self _cancelAllTasksLocked];
    uint64_t v6 = [(CPLEngineSyncManager *)self engineLibrary];
    uint64_t v7 = [v6 store];
    [v7 performBarrier];
  }
}

- (void)startSyncSession:(id)a3 withMinimalPhase:(unint64_t)a4 rewind:(BOOL)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CPLEngineSyncManager_startSyncSession_withMinimalPhase_rewind___block_invoke;
  v10[3] = &unk_1E60A6610;
  void v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a4;
  BOOL v13 = a5;
  id v9 = v8;
  [(CPLEngineSyncManager *)self dispatchSyncBlock:v10];
}

void __65__CPLEngineSyncManager_startSyncSession_withMinimalPhase_rewind___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    int v2 = (id *)(*(void *)(a1 + 32) + 184);
LABEL_3:
    id WeakRetained = objc_loadWeakRetained(v2);
    id v3 = [WeakRetained scheduler];
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 48) >= *(void *)(*(void *)(a1 + 32) + 192)) {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 192);
    }
    else {
      uint64_t v5 = *(void *)(a1 + 48);
    }
    uint64_t v6 = +[CPLErrors operationCancelledError];
    [v3 noteSyncSession:v4 failedDuringPhase:v5 withError:v6];

    return;
  }
  uint64_t v7 = *(id **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    id v8 = v7[8];
    if (v8 != *(id *)(a1 + 40))
    {
      int v2 = v7 + 23;
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = *(id *)(a1 + 40);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  [v7 _restartSyncSessionFromStateLocked:v9 session:v8 cancelIfNecessary:1];
}

- (void)_restartSyncSessionFromStateLocked:(unint64_t)a3 session:(id)a4 cancelIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (CPLSyncSession *)a4;
  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      id v22 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        __int16 v28 = v23;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "%@ called with no sync session to attach to", buf, 0xCu);
      }
    }
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    __int16 v26 = NSStringFromSelector(a2);
    [v24 handleFailureInMethod:a2, self, v25, 530, @"%@ called with no sync session to attach to", v26 object file lineNumber description];

    abort();
  }
  __int16 v10 = v9;
  session = v9;
  if (self->_session != v9)
  {
    [(CPLSyncSession *)v9 sessionWillStart];
    session = self->_session;
  }
  self->_session = v10;

  if (a3 <= 1) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = a3;
  }
  if (self->_shouldRestartSessionFromState >= v12)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v13 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [(id)objc_opt_class() shortDescriptionForState:v12];
        uint64_t v15 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        id v16 = [(CPLEngineSyncManager *)self _descriptionForLaunchedTasks];
        *(_DWORD *)long long buf = 138412802;
        __int16 v28 = v14;
        __int16 v29 = 2112;
        uint64_t v30 = v15;
        __int16 v31 = 2112;
        char v32 = v16;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEBUG, "Will try to restart a sync session from %@ (current state is %@ / current tasks are: %@)", buf, 0x20u);
      }
    }
    [(CPLEngineSyncManager *)self _resetErrorForSyncSession];
    unint64_t state = self->_state;
    if (!state)
    {
      if (self->_setupIsDone) {
        [(CPLEngineSyncManager *)self _advanceToNextStateLockedMinimalState:v12 - 1];
      }
      else {
        [(CPLEngineSyncManager *)self _advanceToNextStateLocked];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
      uint64_t v20 = [WeakRetained feedback];
      [v20 sendFeedbackToServerIfNecessary];

      return;
    }
    if (state == v12)
    {
      if (!_CPLSilentLogging)
      {
        id v18 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Finishing the current state, and starting over", buf, 2u);
        }
LABEL_31:
      }
    }
    else
    {
      if (state <= v12) {
        return;
      }
      if (v5)
      {
        [(CPLEngineSyncManager *)self _cancelAllTasksLocked];
      }
      else if (!_CPLSilentLogging)
      {
        id v18 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [(CPLEngineSyncManager *)self _descriptionForLaunchedTasks];
          *(_DWORD *)long long buf = 138412290;
          __int16 v28 = v21;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Not cancelling current tasks: %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
    self->_shouldRestartSessionFromState = v12;
    return;
  }
  if (v5)
  {
    [(CPLEngineSyncManager *)self _cancelAllTasksLocked];
  }
}

- (void)_advanceToNextStateLockedMinimalState:(unint64_t)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (self->_pendingForceSyncTask)
  {
    if (_CPLSilentLogging)
    {
LABEL_16:
      unint64_t state = self->_state;
      id v11 = +[CPLErrors operationCancelledError];
      [(CPLEngineSyncManager *)self setErrorForSyncSessionUnlocked:v11];

      [(CPLEngineSyncManager *)self _setState:14];
      [(CPLEngineSyncManager *)self _launchNecessaryTasksForCurrentStateLocked];
      goto LABEL_17;
    }
    BOOL v5 = __CPLForceSyncOSLogDomain_20044();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:

      goto LABEL_16;
    }
    pendingForceSyncTask = self->_pendingForceSyncTask;
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = pendingForceSyncTask;
    uint64_t v7 = "Stopping current sync session because of pending %@";
LABEL_14:
    _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    goto LABEL_15;
  }
  if (self->_disabledSchedulerForForceSyncTask || self->_closed)
  {
    if (self->_currentForceSyncTask) {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8) {
      goto LABEL_16;
    }
    BOOL v5 = __CPLForceSyncOSLogDomain_20044();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    currentForceSyncTask = self->_currentForceSyncTask;
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = currentForceSyncTask;
    uint64_t v7 = "Stopping current sync session because of %@";
    goto LABEL_14;
  }
  unint64_t v25 = a3;
  if ([(CPLSyncSession *)self->_session shouldDefer])
  {
    if (!_CPLSilentLogging)
    {
      __int16 v26 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "Sync session has been deferred. Stopping now", buf, 2u);
      }
    }
    unint64_t state = self->_state;
    uint64_t v27 = +[CPLErrors sessionHasBeenDeferredError];
    [(CPLEngineSyncManager *)self setErrorForSyncSessionUnlocked:v27];

    [(CPLEngineSyncManager *)self _setState:14];
    [(CPLEngineSyncManager *)self _launchNecessaryTasksForCurrentStateLocked];
    goto LABEL_17;
  }
  if (self->_state && !self->_setupIsDone)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v28 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        __int16 v29 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEBUG, "Looking for next steps after %@ but setup must be done first", buf, 0xCu);
      }
    }
    [(CPLEngineSyncManager *)self _setState:0];
    uint64_t v30 = [(CPLEngineSyncManager *)self platformObject];
    [v30 didMoveToState:self->_state];

    unint64_t v25 = 0;
  }
  if (!_CPLSilentLogging)
  {
    __int16 v31 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      char v32 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_DEBUG, "Looking for next state after %@", buf, 0xCu);
    }
  }
  unint64_t state = self->_state;
  if (v25 <= state) {
    unint64_t v33 = self->_state;
  }
  else {
    unint64_t v33 = v25;
  }
  [(CPLEngineSyncManager *)self _setState:v33];
  while (1)
  {
    unint64_t v34 = self->_state;
    if (v34 > 0xD) {
      goto LABEL_17;
    }
    if (v34 >= 3)
    {
      id v35 = [(CPLEngineSyncManager *)self engineLibrary];
      uint64_t v36 = [v35 store];
      char v37 = [v36 isClientInSyncWithClientCache];

      if ((v37 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v43 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B4CAC000, v43, OS_LOG_TYPE_DEBUG, "Client is not yet in sync with the client cache, we are not going any further", buf, 2u);
          }
        }
        goto LABEL_78;
      }
    }
    BOOL v38 = [(CPLEngineSyncManager *)self hasBrokenScopes];
    unint64_t v39 = self->_state;
    if (v38) {
      break;
    }
    if (v39 >= 9)
    {
      BOOL v40 = [(CPLEngineSyncManager *)self engineLibrary];
      char v41 = [v40 scheduler];
      int v42 = [v41 isMinglingEnabled];

      if (!v42)
      {
        if (!_CPLSilentLogging)
        {
          __int16 v46 = __CPLSyncOSLogDomain();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_DEBUG, "Client still needs to push more records, we are not going any further", buf, 2u);
          }
        }
LABEL_78:
        [(CPLEngineSyncManager *)self _setState:14];
        [(CPLEngineSyncManager *)self _launchNecessaryTasksForCurrentStateLocked];
        goto LABEL_17;
      }
      unint64_t v39 = self->_state;
    }
LABEL_72:
    [(CPLEngineSyncManager *)self _setState:v39 + 1];
    if ([(CPLEngineSyncManager *)self _launchNecessaryTasksForCurrentStateLocked])
    {
      goto LABEL_17;
    }
  }
  if (v39 < 7) {
    goto LABEL_72;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v44 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v44, OS_LOG_TYPE_ERROR, "Metadata sync is disabled until the library is cleaned-up", buf, 2u);
    }
  }
  [(CPLEngineSyncManager *)self _setState:14];
  [(CPLEngineSyncManager *)self _launchNecessaryTasksForCurrentStateLocked];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__19911;
  uint64_t v57 = __Block_byref_object_dispose__19912;
  id v58 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  uint64_t v51 = __62__CPLEngineSyncManager__advanceToNextStateLockedMinimalState___block_invoke;
  uint64_t v52 = &unk_1E60A5CE8;
  __int16 v53 = self;
  v54 = buf;
  uint64_t v45 = v50;
  os_unfair_lock_lock(&self->_brokenScopesLock);
  v51((uint64_t)v45);
  os_unfair_lock_unlock(&self->_brokenScopesLock);

  [*(id *)(*(void *)&buf[8] + 40) makeObjectsPerformSelector:sel_showAlertToUser];
  _Block_object_dispose(buf, 8);

LABEL_17:
  if (state != self->_state)
  {
    unint64_t v12 = [(CPLEngineSyncManager *)self platformObject];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
          id v16 = [(CPLEngineSyncManager *)self _descriptionForLaunchedTasks];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Moving to state %@ with current tasks: %@", buf, 0x16u);
        }
      }
      uint64_t v17 = [(CPLEngineSyncManager *)self platformObject];
      [v17 didMoveToState:self->_state];
    }
  }
  [(CPLEngineSyncManager *)self _overrideBudgetsIfNeeded];
  unint64_t v18 = self->_state;
  if (v18 == 14)
  {
    if (!_CPLSilentLogging)
    {
      id v19 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = [(id)objc_opt_class() shortDescriptionForState:state];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEBUG, "No task to launch after %@", buf, 0xCu);
      }
    }
    if (self->_session) {
      [(CPLEngineSyncManager *)self _notifyEndOfSyncSession];
    }
    else {
      [(CPLEngineSyncManager *)self _setState:0];
    }
  }
  else
  {
    if (!v18)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v47 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_ERROR, "State should not be quiet here", buf, 2u);
        }
      }
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      [v48 handleFailureInMethod:a2 object:self file:v49 lineNumber:518 description:@"State should not be quiet here"];

      abort();
    }
    if (!state && self->_shouldRestartSessionFromState == 14)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v21 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEBUG, "Starting sync session", buf, 2u);
        }
      }
      id v22 = [(CPLEngineSyncManager *)self platformObject];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        uint64_t v24 = [(CPLEngineSyncManager *)self platformObject];
        [v24 willStartSyncSession];
      }
    }
  }
}

uint64_t __62__CPLEngineSyncManager__advanceToNextStateLockedMinimalState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  currentStep = self->_currentStep;
  if (currentStep && [(CPLSyncStep *)currentStep hasTasks])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = +[CPLEngineSyncManager descriptionForState:a3];
        id v16 = [(CPLSyncStep *)self->_currentStep descriptionForTasks];
        *(_DWORD *)long long buf = 138412546;
        id v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Trying to move to %@ while still having running tasks for %@", buf, 0x16u);
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
    id v19 = +[CPLEngineSyncManager descriptionForState:a3];
    uint64_t v20 = [(CPLSyncStep *)self->_currentStep descriptionForTasks];
    [v17 handleFailureInMethod:a2, self, v18, 430, @"Trying to move to %@ while still having running tasks for %@", v19, v20 object file lineNumber description];

    abort();
  }
  if (self->_session)
  {
    BOOL v7 = self->_state == a3 || a3 == 0;
    BOOL v8 = v7 || a3 == 14;
    if (!v8 && !_CPLSilentLogging)
    {
      id v11 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        char v13 = +[CPLEngineSyncManager shortDescriptionForState:a3];
        *(_DWORD *)long long buf = 138412546;
        id v22 = session;
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "%@ moved to %@", buf, 0x16u);
      }
    }
  }
  self->_unint64_t state = a3;
  uint64_t v9 = [(id)objc_opt_class() stepForState:self->_state syncManager:self session:self->_session];
  __int16 v10 = self->_currentStep;
  self->_currentStep = v9;
}

- (void)_advanceToNextStateLocked
{
}

- (void)_notifyEndOfSyncSession
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastError = self->_lastError;
      int v22 = 138412290;
      __int16 v23 = lastError;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Did finish sync session with error: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  BOOL v5 = self->_lastError;
  uint64_t v6 = [(CPLEngineSyncManager *)self engineLibrary];
  BOOL v7 = [v6 scheduler];
  BOOL v8 = v7;
  session = self->_session;
  if (v5)
  {
    [v7 noteSyncSession:session failedDuringPhase:self->_state withError:self->_lastError];

    __int16 v10 = [(CPLEngineSyncManager *)self platformObject];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v12 = [(CPLEngineSyncManager *)self platformObject];
    [v12 syncSessionDidFailWithError:self->_lastError];
  }
  else
  {
    [v7 noteSyncSessionSucceeded:session];

    char v13 = [(CPLEngineSyncManager *)self platformObject];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v12 = [(CPLEngineSyncManager *)self platformObject];
    [v12 syncSessionDidSucceed];
  }

LABEL_11:
  uint64_t v15 = [(CPLEngineSyncManager *)self platformObject];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [(CPLEngineSyncManager *)self platformObject];
    [v17 didFinishSyncSession];
  }
  [(CPLEngineSyncManager *)self _setState:0];
  [(CPLEngineSyncManager *)self _overrideBudgetsIfNeeded];
  unint64_t v18 = [(CPLEngineSyncManager *)self platformObject];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(CPLEngineSyncManager *)self platformObject];
    [v20 didMoveToState:0];
  }
  uint64_t v21 = self->_session;
  self->_session = 0;

  [(CPLEngineSyncManager *)self _launchForceSyncTaskIfNecessary];
  [(CPLEngineSyncManager *)self _dispatchCancellerBlocksIfNecessary];
}

- (BOOL)_launchNecessaryTasksForCurrentStateLocked
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  lastError = self->_lastError;
  BOOL v4 = lastError == 0;
  if (lastError)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v5 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        BOOL v7 = self->_lastError;
        int v14 = 138412546;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Stopping launch tasks (current state: %@) as we have an error to report: %@", (uint8_t *)&v14, 0x16u);
      }
LABEL_5:

      LOBYTE(currentStep) = v4;
      return (char)currentStep;
    }
    LOBYTE(currentStep) = 0;
  }
  else
  {
    [(CPLSyncSession *)self->_session noteSyncSessionMovedToState:self->_state];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    __int16 v10 = [WeakRetained scheduler];
    [v10 noteSyncSession:self->_session stateWillBeAttempted:self->_state];

    LOBYTE(currentStep) = 0;
    unint64_t state = self->_state;
    if (state && state != 14)
    {
      if (state == 1)
      {
        LODWORD(currentStep) = [(CPLEngineSyncManager *)self _launchSetupTask];
        if (!currentStep) {
          return (char)currentStep;
        }
      }
      else
      {
        currentStep = self->_currentStep;
        if (!currentStep) {
          return (char)currentStep;
        }
        LODWORD(currentStep) = [(CPLSyncStep *)currentStep launchNecessaryTasks];
        if (!currentStep) {
          return (char)currentStep;
        }
      }
      if (_CPLSilentLogging) {
        return (char)currentStep;
      }
      BOOL v5 = __CPLSyncOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v12 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        int v14 = 138412290;
        uint64_t v15 = v12;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Launched some necessary tasks for %@", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_5;
    }
  }
  return (char)currentStep;
}

- (id)_descriptionForLaunchedTasks
{
  unint64_t state = self->_state;
  if (state) {
    BOOL v3 = state == 14;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (state == 1)
    {
      BOOL v4 = [(CPLEngineSyncManager *)self _descriptionForSetupTasks];
      if (v4) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v4 = [(CPLSyncStep *)self->_currentStep descriptionForTasks];
      if (v4) {
        goto LABEL_10;
      }
    }
  }
  BOOL v4 = @"No current tasks";
LABEL_10:
  return v4;
}

- (id)_shortDescriptionForCurrentState
{
  BOOL v3 = objc_opt_class();
  unint64_t state = self->_state;
  return (id)[v3 shortDescriptionForState:state];
}

- (id)_descriptionForCurrentState
{
  BOOL v3 = objc_opt_class();
  unint64_t state = self->_state;
  return (id)[v3 descriptionForState:state];
}

- (void)_moveAllTasksToBackgroundLocked
{
}

- (void)_cancelAllTasksLockedDeferringPushTaskCancellationIfCurrentlyUploadingForeground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    BOOL v5 = __CPLSyncOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CPLEngineSyncManager *)self _descriptionForLaunchedTasks];
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling all current sync manager tasks: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CPLEngineSyncManager *)self _cancelAllTasksForSetup];
  [(CPLSyncStep *)self->_currentStep cancelAllTasks:v3];
}

- (void)_cancelAllTasksLocked
{
}

- (void)_resetErrorForSyncSession
{
  if (!_CPLSilentLogging)
  {
    BOOL v3 = __CPLLastSyncErrorOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Resetting error for sync session", v5, 2u);
    }
  }
  lastError = self->_lastError;
  self->_lastError = 0;
}

- (void)setErrorForSyncSessionUnlocked:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSError *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if ([(NSError *)v4 isCPLOperationCancelledError])
  {
    if (!_CPLSilentLogging)
    {
      BOOL v5 = __CPLLastSyncErrorOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        int v22 = 138412290;
        __int16 v23 = v6;
        int v7 = "Sync session in %@ got cancelled";
LABEL_9:
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v22, 0xCu);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ([(NSError *)v4 isCPLErrorWithCode:10000])
  {
    if (!_CPLSilentLogging)
    {
      BOOL v5 = __CPLLastSyncErrorOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        int v22 = 138412290;
        __int16 v23 = v6;
        int v7 = "Sync session in %@ is requesting a retry";
        goto LABEL_9;
      }
LABEL_10:
    }
LABEL_11:
    p_lastError = &self->_lastError;
    goto LABEL_12;
  }
  if (![(NSError *)v4 isCPLOperationDeferredError])
  {
    unint64_t v12 = [(CPLEngineSyncManager *)self engineLibrary];
    __int16 v10 = [v12 transport];

    char v13 = [(NSError *)v4 userInfo];
    char v11 = [v13 objectForKey:*MEMORY[0x1E4F28A50]];

    if (!_CPLSilentLogging)
    {
      int v14 = __CPLLastSyncErrorOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
        __int16 v16 = [v10 bestErrorForUnderlyingError:v11];
        int v22 = 138412802;
        __int16 v23 = v15;
        __int16 v24 = 2112;
        uint64_t v25 = v4;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Sync session in %@ got error: %@, underlying error: %@", (uint8_t *)&v22, 0x20u);
      }
    }
    goto LABEL_21;
  }
  if (!_CPLSilentLogging)
  {
    __int16 v10 = __CPLLastSyncErrorOSLogDomain();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
LABEL_22:

      goto LABEL_23;
    }
    char v11 = [(CPLEngineSyncManager *)self _shortDescriptionForCurrentState];
    int v22 = 138412290;
    __int16 v23 = v11;
    _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Sync session in %@ got deferred", (uint8_t *)&v22, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:
  p_lastError = &self->_lastError;
  if (v4 && !self->_lastError)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v18 = objc_alloc_init(_CPLEngineSyncLastError);
    uint64_t v20 = v18;
    if (v18)
    {
      v18->_unint64_t state = self->_state;
      objc_setProperty_nonatomic_copy(v18, v19, v17, 16);
      objc_setProperty_nonatomic_copy(v20, v21, v4, 24);
    }
    [(NSMutableArray *)self->_lastErrors addObject:v20];
    if ((unint64_t)[(NSMutableArray *)self->_lastErrors count] >= 6) {
      [(NSMutableArray *)self->_lastErrors removeObjectAtIndex:0];
    }
  }
LABEL_12:
  uint64_t v9 = *p_lastError;
  *p_lastError = v4;
}

- (void)_recordForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  if (!self->_forcedSyncHistory)
  {
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    forcedSyncHistory = self->_forcedSyncHistory;
    self->_forcedSyncHistory = v9;
  }
  char v11 = [[_CPLForcedSyncHistory alloc] initWithForcedSyncTask:v12 discarded:v6 error:v8];
  [(NSMutableArray *)self->_forcedSyncHistory addObject:v11];
  if ((unint64_t)[(NSMutableArray *)self->_forcedSyncHistory count] >= 4) {
    -[NSMutableArray removeObjectsInRange:](self->_forcedSyncHistory, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_forcedSyncHistory count] - 3);
  }
}

- (CPLEngineSyncManager)initWithEngineLibrary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLEngineSyncManager;
  BOOL v6 = [(CPLEngineSyncManager *)&v22 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForSyncSessions], 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.syncmanager", v8);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_queue *)v9;

    v7->_shouldRestartSessionFromState = 14;
    v7->_shouldTryToMingleImmediately = 1;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
    lastErrors = v7->_lastErrors;
    v7->_lastErrors = (NSMutableArray *)v11;

    *(void *)&v7->_transportUserIdentifierLock._os_unfair_lock_opaque = 0;
    char v13 = +[CPLPlatform currentPlatform];
    uint64_t v14 = [v13 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v14;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v17 = __CPLSyncOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          __int16 v24 = v18;
          id v19 = v18;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      SEL v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncManager.m"];
      [v20 handleFailureInMethod:a2, v7, v21, 277, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
  }

  return v7;
}

- (void)_dispatchAfter:(double)a3 block:(id)a4
{
  int64_t v5 = 1000000000 * (uint64_t)a3;
  dispatch_block_t block = a4;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)self->_lock, block);
}

- (void)dispatchForcedTaskBlock:(id)a3
{
  lock = self->_lock;
  id v4 = a3;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForForcedTasks], 0, v4);

  id v6 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v10 = v6;
  int v7 = lock;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

- (void)dispatchSyncBlock:(id)a3
{
  lock = self->_lock;
  id v4 = a3;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)+[CPLEngineSyncManager qualityOfServiceForSyncSessions], 0, v4);

  id v6 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_19894;
  block[3] = &unk_1E60A6978;
  id v10 = v6;
  int v7 = lock;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

+ (id)platformImplementationProtocol
{
  uint64_t v2 = [(id)objc_opt_class() description];
  BOOL v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

+ (id)stepForState:(unint64_t)a3 syncManager:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_queue_t v9 = v8;
  if (stepForState_syncManager_session__onceToken == -1)
  {
    if (v8)
    {
LABEL_3:
      id v10 = (void *)stepForState_syncManager_session__constructors;
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
      id v12 = [v10 objectForKeyedSubscript:v11];

      if (v12)
      {
        char v13 = ((void (**)(void, id, void *))v12)[2](v12, v7, v9);
      }
      else
      {
        char v13 = 0;
      }

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&stepForState_syncManager_session__onceToken, &__block_literal_global_20203);
    if (v9) {
      goto LABEL_3;
    }
  }
  char v13 = 0;
LABEL_9:

  return v13;
}

void __57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0D914A8;
  v2[1] = &unk_1F0D914C0;
  v3[0] = &__block_literal_global_110_20207;
  v3[1] = &__block_literal_global_117;
  v2[2] = &unk_1F0D914D8;
  v2[3] = &unk_1F0D914F0;
  v3[2] = &__block_literal_global_123;
  v3[3] = &__block_literal_global_129;
  v2[4] = &unk_1F0D91508;
  v2[5] = &unk_1F0D91520;
  v3[4] = &__block_literal_global_135;
  void v3[5] = &__block_literal_global_142_20210;
  v2[6] = &unk_1F0D91538;
  v2[7] = &unk_1F0D91550;
  v3[6] = &__block_literal_global_148_20211;
  v3[7] = &__block_literal_global_153;
  v2[8] = &unk_1F0D91568;
  v2[9] = &unk_1F0D91580;
  v3[8] = &__block_literal_global_159_20212;
  v3[9] = &__block_literal_global_165;
  v2[10] = &unk_1F0D91598;
  v2[11] = &unk_1F0D915B0;
  v3[10] = &__block_literal_global_171_20213;
  v3[11] = &__block_literal_global_177;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  uint64_t v1 = (void *)stepForState_syncManager_session__constructors;
  stepForState_syncManager_session__constructors = v0;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLPushToTransportSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLPushToTransportSyncStep alloc] initWithSyncManager:v5 syncSession:v4 highPriority:0];

  return v6;
}

CPLPushToTransportSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLPushToTransportSyncStep alloc] initWithSyncManager:v5 syncSession:v4 highPriority:1];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

CPLSimpleTaskSyncStep *__57__CPLEngineSyncManager_stepForState_syncManager_session___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[CPLSimpleTaskSyncStep alloc] initWithSyncManager:v5 syncSession:v4 taskClass:objc_opt_class()];

  return v6;
}

+ (unsigned)qualityOfServiceForForcedTasks
{
  return 25;
}

+ (unsigned)qualityOfServiceForSyncSessions
{
  return 9;
}

+ (id)shortDescriptionForState:(unint64_t)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"state-%lu", a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E60AAA68[a3];
  }
  return v3;
}

+ (id)descriptionForState:(unint64_t)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"CPLEngineSyncManagerState unknown %lu", a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E60AA9F0[a3];
  }
  return v3;
}

@end