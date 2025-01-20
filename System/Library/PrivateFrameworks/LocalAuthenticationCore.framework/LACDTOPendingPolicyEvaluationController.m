@interface LACDTOPendingPolicyEvaluationController
- (BOOL)_canFinishPendingEvaluationsForRatchetState:(id)a3;
- (BOOL)_hasPendingEvaluationRecordForRequest:(id)a3;
- (BOOL)_isRatchetRestartRequest:(id)a3;
- (BOOL)_shouldPrunePendingEvaluation:(id)a3 uuid:(id)a4;
- (LACDTONotificationManager)notificationManager;
- (LACDTOPendingPolicyEvaluationController)initWithRatchetStateProvider:(id)a3 ratchetHandler:(id)a4 device:(id)a5 evaluationIdentifierFactory:(id)a6 persistentStore:(id)a7 workQueue:(id)a8;
- (id)_coolOffStartedTimestampForIdentifier:(id)a3 currentState:(id)a4;
- (void)_addPendingEvaluationRecord:(id)a3 currentState:(id)a4;
- (void)_addPendingEvaluationRecordForRequest:(id)a3 currentState:(id)a4;
- (void)_cancelPreviousNotificationForPendingEvaluationRecord:(id)a3 scheduledOnly:(BOOL)a4;
- (void)_cancelPreviousNotificationForRatchetRestartWithRatchetState:(id)a3;
- (void)_checkIsRatchetStateIn:(id)a3 completion:(id)a4;
- (void)_checkShouldAddPendingEvaluationRecordForRequest:(id)a3 completion:(id)a4;
- (void)_checkShouldKeepPendingEvaluationRecordForResult:(id)a3 completion:(id)a4;
- (void)_forEachObserver:(id)a3;
- (void)_handleRatchetStateChanged:(id)a3;
- (void)_handleSwitchToCoolOffState:(id)a3;
- (void)_handleSwitchToFinalState:(id)a3;
- (void)_loadPendingEvaluations;
- (void)_postNotificationForRatchetRestartIfNeeded;
- (void)_pruneInvalidatedEvaluations;
- (void)_prunePendingEvaluationsWithUUID:(id)a3;
- (void)_registerNotificationObservers;
- (void)_removePendingEvaluationRecordForRequest:(id)a3 completion:(id)a4;
- (void)_removePendingEvaluationRecordWithIdentifier:(id)a3 completion:(id)a4;
- (void)_rescheduleNotifications;
- (void)_resetRatchetWithCompletion:(id)a3;
- (void)_restartRatchetForInvalidatedEvaluations;
- (void)_scheduleNotificationForPendingEvaluationRecord:(id)a3 after:(double)a4 validity:(double)a5;
- (void)_scheduleNotificationForRatchetRestart;
- (void)_updatePendingEvaluationsWithBlock:(id)a3;
- (void)_updatePendingEvaluationsWithUpdateBlock:(id)a3 observerFilter:(id)a4;
- (void)addObserver:(id)a3;
- (void)cancelPendingEvaluationForClient:(id)a3 ratchetIdentifier:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleEvent:(id)a3 sender:(id)a4;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)notificationManager:(id)a3 didReceiveUserAction:(id)a4 completionHandler:(id)a5;
- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5;
- (void)policyController:(id)a3 willStartPolicyEvaluation:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)startController;
@end

@implementation LACDTOPendingPolicyEvaluationController

- (LACDTOPendingPolicyEvaluationController)initWithRatchetStateProvider:(id)a3 ratchetHandler:(id)a4 device:(id)a5 evaluationIdentifierFactory:(id)a6 persistentStore:(id)a7 workQueue:(id)a8
{
  id v28 = a3;
  id v27 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)LACDTOPendingPolicyEvaluationController;
  v19 = [(LACDTOPendingPolicyEvaluationController *)&v29 init];
  if (v19)
  {
    v20 = -[LACDTONotificationManager initWithReplyQueue:]([LACDTONotificationManager alloc], "initWithReplyQueue:", v18, v27, v28);
    notificationManager = v19->_notificationManager;
    v19->_notificationManager = v20;

    [(LACDTONotificationManager *)v19->_notificationManager setDelegate:v19];
    v22 = [[_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore alloc] initWithPersistentStore:v17 workQueue:v18];
    evaluationStore = v19->_evaluationStore;
    v19->_evaluationStore = (_TtP23LocalAuthenticationCore38LACDTOPendingPolicyEvaluationStoreType_ *)v22;

    uint64_t v24 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v24;

    v19->_shouldPostRestartRatchetPrompt = 0;
    objc_storeStrong((id *)&v19->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v19->_ratchetHandler, a4);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeStrong((id *)&v19->_evaluationIdentifierFactory, a6);
    objc_storeStrong((id *)&v19->_workQueue, a8);
  }

  return v19;
}

- (void)dealloc
{
  v3 = +[LACDarwinNotificationCenter sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)LACDTOPendingPolicyEvaluationController;
  [(LACDTOPendingPolicyEvaluationController *)&v4 dealloc];
}

- (void)startController
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(LACDTOPendingPolicyEvaluationController *)self _loadPendingEvaluations];
  [(LACDTOPendingPolicyEvaluationController *)self _registerNotificationObservers];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_observers addObject:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2;
  v6[3] = &unk_2653B6D60;
  id v7 = v4;
  id v5 = v4;
  [(LACDTOPendingPolicyEvaluationController *)self _updatePendingEvaluationsWithUpdateBlock:&__block_literal_global_18 observerFilter:v6];
}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke()
{
  return 1;
}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
}

- (void)cancelPendingEvaluationForClient:(id)a3 ratchetIdentifier:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a5;
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  v12 = (void (**)(id, void))a6;
  v13 = [(LACDTOPolicyEvaluationIdentifierFactory *)evaluationIdentifierFactory evaluationIdentifierForClient:a3 ratchetIdentifier:a4];
  v14 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluationWithIdentifier:v13];
  id v15 = LACLogDTOEvaluation();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v17 = 138412802;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "Canceling pending evaluation with reason: %@, identifier: %@, did find instance: %@", (uint8_t *)&v17, 0x20u);
    }

    [(LACDTOPendingPolicyEvaluationController *)self _removePendingEvaluationRecordWithIdentifier:v13 completion:v12];
  }
  else
  {
    if (v16)
    {
      int v17 = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "Skipping cancellation of pending evaluation with reason: %@, identifier: %@", (uint8_t *)&v17, 0x16u);
    }

    v12[2](v12, 0);
  }
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  id v8 = a3;
  if (![v8 rawValue])
  {
    id v5 = [v8 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [v8 value];
      [(LACDTOPendingPolicyEvaluationController *)self _handleRatchetStateChanged:v7];
    }
  }
}

- (void)policyController:(id)a3 willStartPolicyEvaluation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isInteractiveRatchetEvaluation])
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke;
    v8[3] = &unk_2653B6D88;
    objc_copyWeak(&v10, &location);
    id v9 = v7;
    [(LACDTOPendingPolicyEvaluationController *)self _checkShouldAddPendingEvaluationRecordForRequest:v9 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && a2) {
    [WeakRetained _addPendingEvaluationRecordForRequest:*(void *)(a1 + 32) currentState:v7];
  }
}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isInteractiveRatchetEvaluation])
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke;
    v11[3] = &unk_2653B6D88;
    objc_copyWeak(&v13, &location);
    id v12 = v9;
    [(LACDTOPendingPolicyEvaluationController *)self _checkShouldKeepPendingEvaluationRecordForResult:v10 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (a2)
    {
      if (([WeakRetained _hasPendingEvaluationRecordForRequest:v7] & 1) == 0) {
        [v6 _addPendingEvaluationRecordForRequest:*(void *)(a1 + 32) currentState:v8];
      }
    }
    else
    {
      [WeakRetained _removePendingEvaluationRecordForRequest:v7 completion:0];
    }
  }
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  if (LACDarwinNotificationsEqual(a4, @"SignificantTimeChangeNotification"))
  {
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke;
    v12[3] = &unk_2653B59C8;
    id v8 = &v13;
    objc_copyWeak(&v13, &location);
    id v9 = v12;
LABEL_5:
    dispatch_async(workQueue, v9);
    objc_destroyWeak(v8);
    goto LABEL_6;
  }
  if (LACDarwinNotificationsEqual(a4, @"com.apple.springboard.lockstate"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2;
    block[3] = &unk_2653B59C8;
    id v8 = &v11;
    objc_copyWeak(&v11, &location);
    id v9 = block;
    goto LABEL_5;
  }
LABEL_6:
  objc_destroyWeak(&location);
}

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _rescheduleNotifications];
    id WeakRetained = v2;
  }
}

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _postNotificationForRatchetRestartIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)_registerNotificationObservers
{
  v3 = +[LACDarwinNotificationCenter sharedInstance];
  [v3 addObserver:self notification:@"SignificantTimeChangeNotification"];

  id v4 = +[LACDarwinNotificationCenter sharedInstance];
  [v4 addObserver:self notification:@"com.apple.springboard.lockstate"];
}

- (void)_rescheduleNotifications
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke;
  v3[3] = &unk_2653B6DB0;
  objc_copyWeak(&v4, &location);
  [(LACDTOPendingPolicyEvaluationController *)self _checkIsRatchetStateIn:&unk_270432160 completion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = objc_msgSend(WeakRetained[3], "pendingEvaluations", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            [v7 _cancelPreviousNotificationForPendingEvaluationRecord:v13 scheduledOnly:0];
            double v14 = 0.0;
            if ([v5 rawValue] == 1)
            {
              [v5 duration];
              double v14 = v15;
            }
            [v5 resetDuration];
            [v7 _scheduleNotificationForPendingEvaluationRecord:v13 after:v14 validity:v16];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v10);
      }

      [v7[3] persistEvaluations];
      int v17 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v7[3] pendingEvaluations];
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v18;
        _os_log_impl(&dword_254F14000, v17, OS_LOG_TYPE_DEFAULT, "Updated pending evaluations after significant time change: %@", buf, 0xCu);
      }
    }
    else
    {
      int v17 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_254F14000, v17, OS_LOG_TYPE_DEFAULT, "Did not update pending evaluations after significant time change because we are not in the state of interest", buf, 2u);
      }
    }
  }
}

- (void)notificationManager:(id)a3 didReceiveUserAction:(id)a4 completionHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  uint64_t v9 = LACLogDTONotifications();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - will handle notification action %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ([v7 isEqualToString:@"com.apple.coreauthd.notifications.action.securityDelay.dismiss"])
  {
    [(LACDTOPendingPolicyEvaluationController *)self _pruneInvalidatedEvaluations];
  }
  else if ([v7 isEqualToString:@"com.apple.coreauthd.notifications.action.securityDelay.start"])
  {
    [(LACDTOPendingPolicyEvaluationController *)self _restartRatchetForInvalidatedEvaluations];
  }
  v8[2](v8);
}

- (void)_checkShouldAddPendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke;
  v10[3] = &unk_2653B6DD8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(LACDTOPendingPolicyEvaluationController *)self _checkIsRatchetStateIn:&unk_270432178 completion:v10];
}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Does not need pending evaluation record for '%@' for current ratchet state: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_checkShouldKeepPendingEvaluationRecordForResult:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSuccess])
  {
    int v8 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      long long v19 = v9;
      __int16 v10 = "Does not need pending evaluation record for '%@' after success";
LABEL_8:
      _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = [v6 error];
    if (!v11
      || (uint64_t v12 = (void *)v11,
          [v6 error],
          id v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = +[LACError error:v13 hasCode:-2],
          v13,
          v12,
          !v14))
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke;
      v15[3] = &unk_2653B6DD8;
      id v16 = v6;
      id v17 = v7;
      [(LACDTOPendingPolicyEvaluationController *)self _checkIsRatchetStateIn:&unk_270432190 completion:v15];

      goto LABEL_11;
    }
    int v8 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      long long v19 = v9;
      __int16 v10 = "Does not need pending evaluation record for '%@' after user cancel";
      goto LABEL_8;
    }
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_11:
}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = LACLogDTOEvaluation();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) identifier];
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      id v9 = "Does need pending evaluation record for '%@' for current ratchet state: %@";
LABEL_6:
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v7)
  {
    int v8 = [*(id *)(a1 + 32) identifier];
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    id v9 = "Does not need pending evaluation record for '%@' for current ratchet state: %@";
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v10);
}

- (void)_handleRatchetStateChanged:(id)a3
{
  id v5 = a3;
  id v4 = [v5 uuid];
  [(LACDTOPendingPolicyEvaluationController *)self _prunePendingEvaluationsWithUUID:v4];

  [(LACDTOPendingPolicyEvaluationController *)self _handleSwitchToCoolOffState:v5];
  [(LACDTOPendingPolicyEvaluationController *)self _handleSwitchToFinalState:v5];
  [(LACDTOPendingPolicyEvaluationController *)self _cancelPreviousNotificationForRatchetRestartWithRatchetState:v5];
}

- (void)_handleSwitchToCoolOffState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 rawValue] == 1)
  {
    id v5 = [MEMORY[0x263EFF910] now];
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    int v11 = __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke;
    uint64_t v12 = &unk_2653B6E00;
    objc_copyWeak(&v15, &location);
    id v13 = v4;
    id v6 = v5;
    id v14 = v6;
    [(LACDTOPendingPolicyEvaluationController *)self _updatePendingEvaluationsWithBlock:&v9];
    BOOL v7 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Updated pending evaluations after switch to cool off state: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

BOOL __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) duration];
  double v6 = v5;
  [*(id *)(a1 + 32) resetDuration];
  [WeakRetained _scheduleNotificationForPendingEvaluationRecord:v3 after:v6 validity:v7];

  int v8 = [v3 coolOffStarted];

  if (!v8) {
    [v3 setCoolOffStarted:*(void *)(a1 + 40)];
  }

  return v8 == 0;
}

- (void)_handleSwitchToFinalState:(id)a3
{
  id v4 = a3;
  if ([(LACDTOPendingPolicyEvaluationController *)self _canFinishPendingEvaluationsForRatchetState:v4])
  {
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke;
    v7[3] = &unk_2653B5AB0;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    id v8 = v4;
    dispatch_after(v5, workQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[3] pendingEvaluations];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          uint64_t v10 = *(void **)(a1 + 32);
          [*(id *)(a1 + 40) resetDuration];
          [v10 _scheduleNotificationForPendingEvaluationRecord:v9 after:0.0 validity:v11];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_isRatchetRestartRequest:(id)a3
{
  id v3 = [a3 identifier];
  char v4 = [v3 hasSuffix:@"com.apple.coreauthd.dto.request.identifier.restart"];

  return v4;
}

- (BOOL)_hasPendingEvaluationRecordForRequest:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(LACDTOPendingPolicyEvaluationController *)self _isRatchetRestartRequest:v4])
  {
    uint64_t v5 = [v4 payload];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
  }
  else
  {
    uint64_t v5 = [v4 identifier];
    v21[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  }
  uint64_t v7 = (void *)v6;

  if ([v7 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      char v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:](self->_evaluationStore, "pendingEvaluationWithIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          v12 &= v14 != 0;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_addPendingEvaluationRecordForRequest:(id)a3 currentState:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  uint64_t v9 = [v7 uuid];
  v37 = v6;
  v38 = v9;
  v39 = v7;
  if ([(LACDTOPendingPolicyEvaluationController *)self _isRatchetRestartRequest:v6])
  {
    id v10 = (id)objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v11 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (objc_msgSend(v16, "isInvalidated", v37))
          {
            [v16 identifier];
            long long v17 = v10;
            v19 = long long v18 = v8;
            uint64_t v20 = [(LACDTOPendingPolicyEvaluationController *)self _coolOffStartedTimestampForIdentifier:v19 currentState:v39];

            id v8 = v18;
            id v10 = v17;
            [v16 setNotificationScheduledAt:0];
            [v16 setRatchetUUID:v38];
            [v16 setCoolOffStarted:v20];
            [v16 setIsInvalidated:0];
            [v8 addObject:v16];
            long long v21 = [v16 identifier];
            [v17 addObject:v21];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v13);
    }

    long long v22 = [v37 payload];
    uint64_t v23 = (void *)[v22 mutableCopy];
    uint64_t v24 = v23;
    if (v23) {
      id v25 = v23;
    }
    else {
      id v25 = (id)objc_opt_new();
    }
    id v28 = v25;

    [v28 setObject:v10 forKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
    [v37 updatePayload:v28];
  }
  else
  {
    uint64_t v26 = [v6 identifier];
    id v27 = [(LACDTOPendingPolicyEvaluationController *)self _coolOffStartedTimestampForIdentifier:v26 currentState:v7];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke;
    v45[3] = &unk_2653B6E28;
    id v46 = v26;
    id v47 = v6;
    id v48 = v9;
    id v49 = v27;
    id v28 = v27;
    id v10 = v26;
    objc_super v29 = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke((uint64_t)v45);
    [v8 addObject:v29];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v30 = v8;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        -[LACDTOPendingPolicyEvaluationController _addPendingEvaluationRecord:currentState:](self, "_addPendingEvaluationRecord:currentState:", v35, v39, v37);
        v36 = [v35 coolOffStarted];

        if (v36)
        {
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2;
          v40[3] = &unk_2653B6E50;
          v40[4] = v35;
          [(LACDTOPendingPolicyEvaluationController *)self _updatePendingEvaluationsWithBlock:v40];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v32);
  }

  [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore persistEvaluations];
}

_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *__94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke(uint64_t a1)
{
  id v2 = [[_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation alloc] initWithIdentifier:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) options];
  id v4 = [NSNumber numberWithInteger:1063];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  [(LACDTOMutablePendingPolicyEvaluation *)v2 setCallbackReason:v5];

  id v6 = [*(id *)(a1 + 40) options];
  id v7 = [NSNumber numberWithInteger:1064];
  id v8 = [v6 objectForKeyedSubscript:v7];
  [(LACDTOMutablePendingPolicyEvaluation *)v2 setCallbackURL:v8];

  [(LACDTOMutablePendingPolicyEvaluation *)v2 setNotificationScheduledAt:0];
  [(LACDTOMutablePendingPolicyEvaluation *)v2 setRatchetUUID:*(void *)(a1 + 48)];
  [(LACDTOMutablePendingPolicyEvaluation *)v2 setCoolOffStarted:*(void *)(a1 + 56)];
  return v2;
}

uint64_t __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (id)_coolOffStartedTimestampForIdentifier:(id)a3 currentState:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluationWithIdentifier:v6];
  if (v8)
  {
    uint64_t v9 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)MEMORY[0x263F08790];
      uint64_t v11 = [v8 coolOffStarted];
      uint64_t v12 = [v10 localizedStringFromDate:v11 dateStyle:0 timeStyle:3];
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      long long v21 = v12;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ is using the existing cool off timestamp: %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v13 = [v8 coolOffStarted];
  }
  else if ([v7 rawValue] == 1)
  {
    uint64_t v13 = [MEMORY[0x263EFF910] now];
    uint64_t v14 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [MEMORY[0x263F08790] localizedStringFromDate:v13 dateStyle:0 timeStyle:3];
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      long long v21 = v15;
      _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ will use the current time for cool off timestamp: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    long long v16 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_254F14000, v16, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ has no cool off timestamp yet", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_addPendingEvaluationRecord:(id)a3 currentState:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isInvalidated];
  uint64_t v9 = LACLogDTOEvaluation();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      int v18 = v11;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Not adding new pending evaluation with identifier: %@, the evaluation is invalidated", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      uint64_t v12 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      int v18 = v12;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Will add new pending evaluation with identifier: %@", buf, 0xCu);
    }
    if ([v7 rawValue] != 1 && objc_msgSend(v7, "rawValue") != 2) {
      [(LACDTOPendingPolicyEvaluationController *)self _cancelPreviousNotificationForPendingEvaluationRecord:v6 scheduledOnly:0];
    }
    if ([v7 rawValue] == 1)
    {
      [v7 duration];
      double v14 = v13;
      [v7 resetDuration];
      [(LACDTOPendingPolicyEvaluationController *)self _scheduleNotificationForPendingEvaluationRecord:v6 after:v14 validity:v15];
    }
    [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore addPendingEvaluation:v6];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke;
    v16[3] = &unk_2653B6E78;
    v16[4] = self;
    [(LACDTOPendingPolicyEvaluationController *)self _forEachObserver:v16];
  }
}

uint64_t __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pendingEvaluationControllerDidStartTrackingPendingEvaluations:*(void *)(a1 + 32)];
}

- (void)_removePendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v17 = a4;
  if ([(LACDTOPendingPolicyEvaluationController *)self _isRatchetRestartRequest:v6])
  {
    id v7 = objc_msgSend(v6, "payload", v6);
    int v18 = [v7 objectForKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
  }
  else
  {
    int v8 = objc_msgSend(v6, "identifier", v6);
    v32[0] = v8;
    int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  }
  if ([v18 count])
  {
    uint64_t v9 = dispatch_group_create();
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__6;
    v29[4] = __Block_byref_object_dispose__6;
    id v30 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v18;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          dispatch_group_enter(v9);
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke;
          v22[3] = &unk_2653B6EA0;
          uint64_t v24 = v29;
          uint64_t v23 = v9;
          [(LACDTOPendingPolicyEvaluationController *)self _removePendingEvaluationRecordWithIdentifier:v14 completion:v22];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v11);
    }

    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2;
    block[3] = &unk_2653B6EC8;
    id v20 = v17;
    long long v21 = v29;
    dispatch_group_notify(v9, workQueue, block);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
}

void __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)_removePendingEvaluationRecordWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_2653B5838;
  id v8 = v7;
  id v19 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluationWithIdentifier:v6];
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v11 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "Will remove pending evaluation with identifier: %@", buf, 0xCu);
  }

  [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore removePendingEvaluationWith:v6];
  [(LACDTOPendingPolicyEvaluationController *)self _cancelPreviousNotificationForPendingEvaluationRecord:v10 scheduledOnly:1];
  uint64_t v12 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_31;
    v17[3] = &unk_2653B6E78;
    v17[4] = self;
    [(LACDTOPendingPolicyEvaluationController *)self _forEachObserver:v17];
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_2653B6EF0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v9;
    [(LACDTOPendingPolicyEvaluationController *)self _checkIsRatchetStateIn:&unk_2704321A8 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_5:
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
  }
}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 pendingEvaluationControllerDidStopTrackingPendingEvaluations:*(void *)(a1 + 32)];
}

void __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained
    && a2
    && ([WeakRetained[3] pendingEvaluations],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    id v8 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "Reseting Ratchet as there are no pending evaluations", (uint8_t *)v9, 2u);
    }

    [v5 _resetRatchetWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_updatePendingEvaluationsWithBlock:(id)a3
{
}

uint64_t __78__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithBlock___block_invoke()
{
  return 1;
}

- (void)_updatePendingEvaluationsWithUpdateBlock:(id)a3 observerFilter:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void))a3;
  id v12 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v6[2](v6, v11))
        {
          objc_initWeak(&location, self);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke;
          v14[3] = &unk_2653B6F38;
          id v15 = v12;
          objc_copyWeak(&v16, &location);
          void v14[4] = v11;
          [(LACDTOPendingPolicyEvaluationController *)self _forEachObserver:v14];
          objc_destroyWeak(&v16);

          objc_destroyWeak(&location);
          char v8 = 1;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);

    if (v8) {
      [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore persistEvaluations];
    }
  }
  else
  {
  }
}

void __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v4 pendingEvaluationController:WeakRetained updatedPendingEvaluation:*(void *)(a1 + 32)];
  }
}

- (BOOL)_canFinishPendingEvaluationsForRatchetState:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke;
  v7[3] = &unk_2653B6F60;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [&unk_2704321C0 indexOfObjectPassingTest:v7] != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

BOOL __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 integerValue];
  BOOL result = v6 == [*(id *)(a1 + 32) rawValue];
  *a4 = result;
  return result;
}

- (void)_cancelPreviousNotificationForPendingEvaluationRecord:(id)a3 scheduledOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setNotificationScheduledAt:0];
  [(LACDTONotificationManager *)self->_notificationManager cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:v6 scheduledOnly:v4 completion:&__block_literal_global_48];
}

- (void)_cancelPreviousNotificationForRatchetRestartWithRatchetState:(id)a3
{
  if ([a3 rawValue] >= 1)
  {
    notificationManager = self->_notificationManager;
    [(LACDTONotificationManager *)notificationManager cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:&__block_literal_global_50];
  }
}

- (void)_scheduleNotificationForRatchetRestart
{
  self->_shouldPostRestartRatchetPrompt = 1;
  [(LACDTOPendingPolicyEvaluationController *)self _postNotificationForRatchetRestartIfNeeded];
}

- (void)_postNotificationForRatchetRestartIfNeeded
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = [*a1 hasCompletedSetup];
  int v5 = [*a1 hasBeenUnlockedSinceBoot];
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Skipping notification for security delay restart migration: %d, unlock: %d", (uint8_t *)v6, 0xEu);
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = LACLogDTOEvaluation();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
      }

      WeakRetained[48] = 1;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v13 = 0;
        _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Posted notification for security delay restart", v13, 2u);
      }
    }
  }
}

- (void)_scheduleNotificationForPendingEvaluationRecord:(id)a3 after:(double)a4 validity:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a4];
  if (([v8 isNotificationScheduledForDate:v9] & 1) == 0
    && ([v8 hasNotifiedUserAboutCompletion] & 1) == 0)
  {
    [v8 setNotificationScheduledAt:v9];
    objc_initWeak(&location, self);
    notificationManager = self->_notificationManager;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke;
    v11[3] = &unk_2653B6FB0;
    objc_copyWeak(v13, &location);
    id v12 = v8;
    v13[1] = *(id *)&a4;
    [(LACDTONotificationManager *)notificationManager scheduleSecurityDelayFinishedNotificationForPendingEvaluation:v12 after:v11 validity:a4 completion:a5];

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = *(void **)(a1 + 32);
      int v5 = (uint64_t *)(a1 + 32);
      [v6 setNotificationScheduledAt:0];
      uint64_t v7 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1(v5, (uint64_t)v3, v7);
      }
    }
    else
    {
      uint64_t v7 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 48);
        int v10 = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = v9;
        _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Scheduled notification for evaluation: %{public}@ after: %.2f secs", (uint8_t *)&v10, 0x16u);
      }
    }

    [WeakRetained[3] persistEvaluations];
  }
}

- (void)_checkIsRatchetStateIn:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ratchetStateProvider = self->_ratchetStateProvider;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke;
  v11[3] = &unk_2653B6FD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(LACDTORatchetStateProvider *)ratchetStateProvider ratchetStateWithCompletion:v11];
}

void __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "rawValue"));
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) containsObject:v6], v7);
  }
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [(NSHashTable *)self->_observers allObjects];
  id v7 = [v5 arrayWithArray:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_resetRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  ratchetHandler = self->_ratchetHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke;
  v7[3] = &unk_2653B5FB0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTORatchetHandler *)ratchetHandler resetRatchetWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (!v4) {
      [WeakRetained[4] ratchetStateWithCompletion:&__block_literal_global_53];
    }
  }
}

- (void)_restartRatchetForInvalidatedEvaluations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) isInvalidated])
        {

          id v9 = LACLogDTOEvaluation();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v10 = 0;
            _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Restarting security delay for invalidated evaluations", v10, 2u);
          }

          [(LACDTORatchetHandler *)self->_ratchetHandler restartRatchetWithIdentifier:@"com.apple.coreauthd.dto.request.identifier.restart"];
          return;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "Not restarting security delay - no invalidated evaluations", v10, 2u);
  }
}

- (void)_loadPendingEvaluations
{
  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke;
  v4[3] = &unk_2653B59A0;
  objc_copyWeak(&v5, &location);
  [(LACDTORatchetStateProvider *)ratchetStateProvider ratchetStateWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v10 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      uint64_t v17 = (void *)*((void *)WeakRetained + 3);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_54;
      v18[3] = &unk_2653B7000;
      objc_copyWeak(&v20, v7);
      id v19 = v5;
      [v17 loadPersistedEvaluationsWithCompletion:v18];

      objc_destroyWeak(&v20);
    }
  }
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOEvaluation();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_54_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v27 = v5;
        char v18 = 0;
        char v28 = 0;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v15);
            }
            long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if ([v21 isInvalidated])
            {
              [WeakRetained[3] addPendingEvaluation:v21];
            }
            else
            {
              uint64_t v22 = [*(id *)(a1 + 32) uuid];
              int v23 = [WeakRetained _shouldPrunePendingEvaluation:v21 uuid:v22];

              if (v23)
              {
                uint64_t v24 = [*(id *)(a1 + 32) uuid];

                char v18 = 1;
                if (!v24)
                {
                  [v21 setIsInvalidated:1];
                  [WeakRetained[3] addPendingEvaluation:v21];
                  char v28 = 1;
                }
              }
              else
              {
                long long v25 = [v21 ratchetUUID];

                if (!v25)
                {
                  long long v26 = [*(id *)(a1 + 32) uuid];
                  [v21 setRatchetUUID:v26];
                }
                [WeakRetained _addPendingEvaluationRecord:v21 currentState:*(void *)(a1 + 32)];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v17);

        if (v28) {
          [WeakRetained _scheduleNotificationForRatchetRestart];
        }
        id v6 = 0;
        id v5 = v27;
        if (v18) {
          [WeakRetained[3] persistEvaluations];
        }
      }
      else
      {
      }
    }
  }
}

- (void)_pruneInvalidatedEvaluations
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "Pruning invalidated evaluations", buf, 2u);
  }

  uint64_t v4 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
  id v5 = (void *)[v4 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isInvalidated", (void)v15))
        {
          evaluationStore = self->_evaluationStore;
          uint64_t v14 = [v12 identifier];
          [(LACDTOPendingPolicyEvaluationStoreType *)evaluationStore removePendingEvaluationWith:v14];

          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);

    if (v9) {
      [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore persistEvaluations];
    }
  }
  else
  {
  }
}

- (void)_prunePendingEvaluationsWithUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v4;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "Pruning pending evaluations with uuid: %{public}@", buf, 0xCu);
  }

  id v6 = [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore pendingEvaluations];
  uint64_t v7 = (void *)[v6 copy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (-[LACDTOPendingPolicyEvaluationController _shouldPrunePendingEvaluation:uuid:](self, "_shouldPrunePendingEvaluation:uuid:", v14, v4, (void)v17))
        {
          long long v15 = [v14 identifier];
          [(LACDTOPendingPolicyEvaluationController *)self _removePendingEvaluationRecordWithIdentifier:v15 completion:&__block_literal_global_57];
        }
        else
        {
          long long v16 = [v14 ratchetUUID];

          if (!v16)
          {
            [v14 setRatchetUUID:v4];
            char v11 = 1;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);

    if (v11) {
      [(LACDTOPendingPolicyEvaluationStoreType *)self->_evaluationStore persistEvaluations];
    }
  }
  else
  {
  }
}

- (BOOL)_shouldPrunePendingEvaluation:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 ratchetUUID];

  if (v7)
  {
    id v8 = [v5 ratchetUUID];
    int v9 = [v6 isEqualToString:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = v6 == 0;
  }

  return v9;
}

- (LACDTONotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ratchetHandler, 0);
  objc_storeStrong((id *)&self->_evaluationIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
  objc_storeStrong((id *)&self->_evaluationStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "Did not schedule notification for evaluation: %{public}@ due to error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_54_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end