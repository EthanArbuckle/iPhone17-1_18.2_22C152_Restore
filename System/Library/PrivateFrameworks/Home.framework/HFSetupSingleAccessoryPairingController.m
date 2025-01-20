@interface HFSetupSingleAccessoryPairingController
+ (BOOL)supportsSetupPayloadRetry;
- (BOOL)accessoryRequiresCode;
- (HFDiscoveredAccessory)discoveredAccessoryToPair;
- (HFSetupAccessoryResult)setupResult;
- (HFSetupPairingContext)context;
- (HFSetupSingleAccessoryPairingController)initWithContext:(id)a3 discoveredAccessory:(id)a4;
- (HMAccessorySetupCompletedInfo)completedInfo;
- (HMHome)home;
- (NAFuture)pairingFuture;
- (NSDate)phaseStartDate;
- (NSHashTable)pairingObservers;
- (NSSet)pairedAccessories;
- (NSString)statusDescription;
- (NSString)statusTitle;
- (id)cancel;
- (unint64_t)phase;
- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4;
- (void)_failPairingWithDiscoveredAccessory:(id)a3 error:(id)a4;
- (void)_finishPairingWithAccessories:(id)a3 completedInfo:(id)a4;
- (void)_tryPairing;
- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3;
- (void)addPairingObserver:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)removePairingObserver:(id)a3;
- (void)setAccessoryRequiresCode:(BOOL)a3;
- (void)setCompletedInfo:(id)a3;
- (void)setHome:(id)a3;
- (void)setPairedAccessories:(id)a3;
- (void)setPairingFuture:(id)a3;
- (void)setPairingObservers:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPhaseStartDate:(id)a3;
- (void)setSetupResult:(id)a3;
- (void)setStatusDescription:(id)a3;
- (void)setStatusTitle:(id)a3;
- (void)startWithHome:(id)a3;
@end

@implementation HFSetupSingleAccessoryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 1;
}

- (HFSetupSingleAccessoryPairingController)initWithContext:(id)a3 discoveredAccessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFSetupSingleAccessoryPairingController;
  v9 = [(HFSetupSingleAccessoryPairingController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_discoveredAccessoryToPair, a4);
    v11 = [(HFSetupSingleAccessoryPairingController *)v10 discoveredAccessoryToPair];
    v10->_accessoryRequiresCode = [v11 requiresSetupCode];

    v10->_phase = 0;
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    phaseStartDate = v10->_phaseStartDate;
    v10->_phaseStartDate = (NSDate *)v12;

    v14 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    pairingFuture = v10->_pairingFuture;
    v10->_pairingFuture = v14;

    v16 = +[HFHomeKitDispatcher sharedDispatcher];
    [v16 addHomeObserver:v10];
  }
  return v10;
}

- (void)setPhase:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unint64_t phase = self->_phase;
  if (phase != a3)
  {
    [(HFSetupSingleAccessoryPairingController *)self _assertValidTransitionFromPhase:self->_phase toPhase:a3];
    v6 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:phase];
      id v8 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a3];
      *(_DWORD *)buf = 138412802;
      v36 = self;
      __int16 v37 = 2112;
      v38 = v7;
      __int16 v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@ Transitioning phase: %@ -> %@", buf, 0x20u);
    }
    self->_unint64_t phase = a3;
    v9 = [MEMORY[0x263EFF910] date];
    [(HFSetupSingleAccessoryPairingController *)self setPhaseStartDate:v9];
  }
  v10 = [(HFSetupSingleAccessoryPairingController *)self statusTitle];
  v11 = [(HFSetupSingleAccessoryPairingController *)self statusDescription];
  [(HFSetupSingleAccessoryPairingController *)self _updateStatusTextAndNotifyDelegate:0];
  id v12 = [(HFSetupSingleAccessoryPairingController *)self statusTitle];
  id v13 = v10;
  v14 = v13;
  v29 = v11;
  if (v12 == v13)
  {

    goto LABEL_10;
  }
  if (v12)
  {
    int v15 = [v12 isEqual:v13];

    if (!v15) {
      goto LABEL_14;
    }
LABEL_10:
    id v16 = [(HFSetupSingleAccessoryPairingController *)self statusDescription];
    id v17 = v11;
    if (v16 == v17)
    {
      int v18 = 0;
    }
    else if (v16)
    {
      int v18 = [v16 isEqual:v17] ^ 1;
    }
    else
    {
      int v18 = 1;
    }

    if (phase == a3 && !v18) {
      goto LABEL_29;
    }
    goto LABEL_19;
  }

LABEL_14:
LABEL_19:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v19 = [(HFSetupSingleAccessoryPairingController *)self pairingObservers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          unint64_t v25 = self->_phase;
          v26 = [(HFSetupSingleAccessoryPairingController *)self statusTitle];
          v27 = [(HFSetupSingleAccessoryPairingController *)self statusDescription];
          [v24 pairingController:self didTransitionToPhase:v25 statusTitle:v26 statusDescription:v27];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  v14 = v28;
LABEL_29:
}

- (void)setSetupResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_setupResult = &self->_setupResult;
  setupResult = self->_setupResult;
  id v8 = (HFSetupAccessoryResult *)v5;
  v9 = setupResult;
  if (v9 == v8)
  {
  }
  else
  {
    v10 = v9;
    if (v8)
    {
      char v11 = [(HFSetupAccessoryResult *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_setupResult, a3);
    id v12 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", (uint8_t *)&v18, 0xCu);
    }

    if (*p_setupResult)
    {
      if ([(HFSetupSingleAccessoryPairingController *)self phase] == 1)
      {
        id v13 = [(HFSetupAccessoryResult *)*p_setupResult error];

        v14 = self;
        if (!v13)
        {
          [(HFSetupSingleAccessoryPairingController *)self _tryPairing];
          goto LABEL_20;
        }
        uint64_t v15 = 9;
        goto LABEL_15;
      }
      id v16 = HFLogForCategory(0x3BuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:[(HFSetupSingleAccessoryPairingController *)self phase]];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Received setup code, but we're still in the %@ phase. Waiting until we're ready to handle the setup code before calling -_tryPairing", (uint8_t *)&v18, 0xCu);
      }
    }
    else if (!+[HFSetupPairingControllerUtilities isPairingPhaseIdle:[(HFSetupSingleAccessoryPairingController *)self phase]])
    {
      v14 = self;
      uint64_t v15 = 1;
LABEL_15:
      [(HFSetupSingleAccessoryPairingController *)v14 setPhase:v15];
    }
  }
LABEL_20:
}

- (void)addPairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSetupSingleAccessoryPairingController *)self pairingObservers];

  if (!v5)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFSetupSingleAccessoryPairingController *)self setPairingObservers:v6];
  }
  id v7 = [(HFSetupSingleAccessoryPairingController *)self pairingObservers];
  [v7 addObject:v4];
}

- (void)removePairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSetupSingleAccessoryPairingController *)self pairingObservers];
  [v5 removeObject:v4];
}

- (void)startWithHome:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HFSetupSingleAccessoryPairingController.m", 141, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  [(HFSetupSingleAccessoryPairingController *)self setHome:v5];
  id v7 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
  id v8 = [v7 accessory];

  if (v8)
  {
    v9 = [(HFSetupSingleAccessoryPairingController *)self context];
    v10 = [v9 setupAccessoryDescription];
    [v10 updateWithAccessory:v8];

    char v11 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(HFSetupSingleAccessoryPairingController *)self context];
      id v13 = [v12 setupAccessoryDescription];
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFSetupSingleAccessoryPairingController startPairing with description: %@", buf, 0xCu);
    }
    v14 = [(HFSetupSingleAccessoryPairingController *)self home];
    uint64_t v15 = [(HFSetupSingleAccessoryPairingController *)self context];
    id v16 = [v15 setupAccessoryDescription];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke;
    v25[3] = &unk_26408D8C8;
    v25[4] = self;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_16;
    v23[3] = &unk_26408D918;
    v23[4] = self;
    id v24 = v8;
    [v14 startPairingWithAccessoryDescription:v16 progress:v25 completion:v23];
  }
  id v17 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
  if (v17)
  {
  }
  else if ([(HFSetupSingleAccessoryPairingController *)self accessoryRequiresCode])
  {
    int v18 = self;
    uint64_t v19 = 1;
    goto LABEL_15;
  }
  uint64_t v20 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
  uint64_t v21 = [v20 error];

  int v18 = self;
  if (!v21)
  {
    [(HFSetupSingleAccessoryPairingController *)self _tryPairing];
    goto LABEL_17;
  }
  uint64_t v19 = 9;
LABEL_15:
  [(HFSetupSingleAccessoryPairingController *)v18 setPhase:v19];
LABEL_17:
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_26408D8A0;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) phase];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) context];
  [v4 setSetupAccessoryDescription:v3];

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) phase];
  id v7 = [*(id *)(a1 + 32) context];
  id v8 = [*(id *)(a1 + 32) discoveredAccessoryToPair];
  uint64_t v9 = [*(id *)(a1 + 32) setupResult];
  v10 = [*(id *)(a1 + 32) home];
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", +[HFSetupPairingControllerUtilities processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:](HFSetupPairingControllerUtilities, "processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:", v5, v6, v7, v8, v9, v10, objc_opt_class()));

  char v11 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:v2];
    uint64_t v14 = [*(id *)(a1 + 32) phase];
    uint64_t v15 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [*(id *)(a1 + 32) phase]);
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413570;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v2;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ pairing phase transition %ld (%@) -> %ld (%@).  Progress: %ld", buf, 0x3Eu);
  }
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2_17;
  block[3] = &unk_26408D360;
  v10 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v15 = v9;
  id v16 = v7;
  id v17 = v8;
  id v18 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2_17(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) phase] == 9)
  {
    uint64_t v2 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v3;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", buf, 0xCu);
    }
LABEL_8:

    return;
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v19;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: %@", buf, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 discoveredAccessoryToPair];
    [v5 _failPairingWithDiscoveredAccessory:v6 error:*(void *)(a1 + 40)];

    uint64_t v2 = [*(id *)(a1 + 32) pairingFuture];
    [v2 finishWithError:*(void *)(a1 + 40)];
    goto LABEL_8;
  }
  uint64_t v7 = [*(id *)(a1 + 48) count];
  id v8 = HFLogForCategory(0x3BuLL);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
      uint64_t v11 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFSetupSingleAccessoryPairingController startPairing finished with accessories: %@ info: %@", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 32);
    id v13 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 48)];
    [v12 _finishPairingWithAccessories:v13 completedInfo:*(void *)(a1 + 56)];

    uint64_t v14 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_20;
    __int16 v23 = &unk_26408D8F0;
    uint64_t v24 = *(void *)(a1 + 32);
    id v25 = *(id *)(a1 + 64);
    [v14 dispatchHomeObserverMessage:&v20 sender:*(void *)(a1 + 32)];

    id v15 = objc_msgSend(*(id *)(a1 + 32), "pairingFuture", v20, v21, v22, v23, v24);
    id v16 = NAEmptyResult();
    [v15 finishWithResult:v16];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: nil but no paired accessories; treating as a failure",
        buf,
        2u);
    }

    id v17 = [*(id *)(a1 + 32) pairingFuture];
    id v18 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
    [v17 finishWithError:v18];
  }
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_20(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didAddAccessory:*(void *)(a1 + 40)];
  }
}

- (id)cancel
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = +[HFSetupPairingControllerUtilities isPairingPhaseIdle:[(HFSetupSingleAccessoryPairingController *)self phase]];
  id v4 = HFLogForCategory(0x3BuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Cancel requested for accessory: (%@)", buf, 0xCu);
    }
    uint64_t v6 = [MEMORY[0x263F58190] futureWithNoResult];
    id v8 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "na_cancelledError");
    [v8 updateStatus:3 error:v9];

    v10 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    uint64_t v11 = [v10 uniqueIdentifier];

    if (v11)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke;
      v23[3] = &unk_26408CD50;
      v23[4] = self;
      id v12 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v23];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_2;
      v22[3] = &unk_26408CDF0;
      v22[4] = self;
      id v13 = (id)[v12 addFailureBlock:v22];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_27;
      v21[3] = &unk_26408C8A0;
      v21[4] = self;
      id v14 = (id)[v12 addSuccessBlock:v21];
      id v15 = (void *)MEMORY[0x263F58190];
      id v16 = [(HFSetupSingleAccessoryPairingController *)self pairingFuture];
      v24[0] = v16;
      v24[1] = v12;
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      id v18 = [MEMORY[0x263F581B8] mainThreadScheduler];
      uint64_t v19 = [v15 combineAllFutures:v17 ignoringErrors:1 scheduler:v18];

      uint64_t v6 = (void *)v19;
    }
    [(HFSetupSingleAccessoryPairingController *)self setPhase:9];
  }
  return v6;
}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 home];
  BOOL v5 = [*(id *)(a1 + 32) discoveredAccessoryToPair];
  uint64_t v6 = [v5 uniqueIdentifier];
  [v7 cancelPairingForAccessoryWithUUID:v6 completionHandler:v4];
}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 32) discoveredAccessoryToPair];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel pairing for accessory: (%@). Error: %@", (uint8_t *)&v7, 0x16u);
  }
  BOOL v5 = [*(id *)(a1 + 32) pairingFuture];
  [v5 finishWithNoResult];
}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_27(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) discoveredAccessoryToPair];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Cancel done for accessory: (%@)", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) pairingFuture];
  [v4 finishWithNoResult];
}

- (void)_tryPairing
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    if ([(HFSetupSingleAccessoryPairingController *)self accessoryRequiresCode]) {
      uint64_t v6 = @"requires";
    }
    else {
      uint64_t v6 = @"does not require";
    }
    uint64_t v7 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
    id v8 = [v7 setupPayload];
    *(_DWORD *)buf = 138412802;
    __int16 v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v6;
    __int16 v31 = 2112;
    long long v32 = v8;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Trying to pair with accessory: %@ (%@ code) payload: %@", buf, 0x20u);
  }
  __int16 v9 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
  if ([v9 isValidForPairing]) {
    goto LABEL_7;
  }
  BOOL v10 = [(HFSetupSingleAccessoryPairingController *)self accessoryRequiresCode];

  if (v10)
  {
    __int16 v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HFSetupSingleAccessoryPairingController.m", 269, @"Invalid parameter not satisfying: %@", @"self.setupResult.isValidForPairing || !self.accessoryRequiresCode" object file lineNumber description];
LABEL_7:
  }
  uint64_t v11 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HFSetupSingleAccessoryPairingController.m", 270, @"Invalid parameter not satisfying: %@", @"self.discoveredAccessoryToPair" object file lineNumber description];
  }
  id v13 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
  [v13 updateStatus:1 error:0];

  [(HFSetupSingleAccessoryPairingController *)self setPhase:4];
  id v14 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    *(_DWORD *)buf = 138412290;
    __int16 v28 = v15;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Trying to pair with accessory: %@. Calling -continuePairing.", buf, 0xCu);
  }
  if ([(HFSetupSingleAccessoryPairingController *)self accessoryRequiresCode])
  {
    objc_initWeak((id *)buf, self);
    id v16 = [(HFSetupSingleAccessoryPairingController *)self home];
    id v17 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    id v18 = [v17 uniqueIdentifier];
    uint64_t v19 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
    uint64_t v20 = [v19 setupPayload];
    uint64_t v21 = [v20 setupCode];
    uint64_t v22 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    __int16 v23 = [v22 rawSetupPayloadString];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __54__HFSetupSingleAccessoryPairingController__tryPairing__block_invoke;
    v25[3] = &unk_26408D940;
    objc_copyWeak(&v26, (id *)buf);
    [v16 continuePairingForAccessoryWithUUID:v18 setupCode:v21 onboardingSetupPayloadString:v23 completionHandler:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __54__HFSetupSingleAccessoryPairingController__tryPairing__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    id v4 = [WeakRetained discoveredAccessoryToPair];
    [WeakRetained _failPairingWithDiscoveredAccessory:v4 error:v5];
  }
}

- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v37 = 0;
  id v38 = 0;
  unint64_t v5 = [(HFSetupSingleAccessoryPairingController *)self phase];
  uint64_t v6 = [(HFSetupSingleAccessoryPairingController *)self phaseStartDate];
  uint64_t v7 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
  id v8 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
  __int16 v9 = [(HFSetupSingleAccessoryPairingController *)self context];
  +[HFSetupPairingControllerUtilities getStatusTitle:&v38 statusDescription:&v37 forPairingPhase:v5 phaseStartDate:v6 discoveredAccessory:v7 setupResult:v8 context:v9 setupError:0];
  id v10 = v38;
  id v11 = v37;

  BOOL v12 = [(HFSetupSingleAccessoryPairingController *)self statusTitle];
  id v13 = v10;
  id v14 = v12;
  id v15 = v14;
  if (v13 == v14)
  {
  }
  else
  {
    id v16 = v14;
    if (!v13)
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    int v17 = [v13 isEqual:v14];

    if (!v17) {
      goto LABEL_13;
    }
  }
  id v18 = [(HFSetupSingleAccessoryPairingController *)self statusDescription];
  id v19 = v11;
  id v20 = v18;
  if (v19 == v20)
  {

LABEL_27:
    goto LABEL_28;
  }
  id v16 = v20;
  if (!v19)
  {

    goto LABEL_12;
  }
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_28;
  }
LABEL_14:
  [(HFSetupSingleAccessoryPairingController *)self setStatusTitle:v13];
  [(HFSetupSingleAccessoryPairingController *)self setStatusDescription:v11];
  uint64_t v22 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v13;
    __int16 v42 = 2112;
    id v43 = v11;
    _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\"", buf, 0x16u);
  }

  if (v3)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = [(HFSetupSingleAccessoryPairingController *)self pairingObservers];
    uint64_t v23 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v31 = v13;
      id v32 = v11;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v15);
          }
          uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            unint64_t v28 = [(HFSetupSingleAccessoryPairingController *)self phase];
            __int16 v29 = [(HFSetupSingleAccessoryPairingController *)self statusTitle];
            uint64_t v30 = [(HFSetupSingleAccessoryPairingController *)self statusDescription];
            [v27 pairingController:self didTransitionToPhase:v28 statusTitle:v29 statusDescription:v30];
          }
        }
        uint64_t v24 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v24);
      id v13 = v31;
      id v11 = v32;
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFSetupSingleAccessoryPairingController *)self home];

  if (v8 == v7)
  {
    __int16 v9 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Notified that an accessory (%@) was added to the home. Our accessory to pair is: %@", buf, 0x16u);
    }
    id v11 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    BOOL v12 = [v11 uniqueIdentifier];
    id v13 = [v6 uuid];
    if (![v12 isEqual:v13])
    {

      goto LABEL_8;
    }
    BOOL v14 = +[HFSetupPairingControllerUtilities isPairingPhaseIdle:[(HFSetupSingleAccessoryPairingController *)self phase]];

    if (!v14)
    {
      id v15 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
      [v15 setAccessory:v6];

      id v16 = [MEMORY[0x263EFFA08] setWithObject:v6];
      int v17 = (void *)MEMORY[0x263EFFA08];
      id v18 = [v6 uniqueIdentifiersForBridgedAccessories];
      id v19 = [v17 setWithArray:v18];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke;
      v21[3] = &unk_26408D990;
      v21[4] = self;
      id v20 = objc_msgSend(v19, "na_map:", v21);
      id v11 = [v16 setByAddingObjectsFromSet:v20];

      [(HFSetupSingleAccessoryPairingController *)self _finishPairingWithAccessories:v11 completedInfo:0];
LABEL_8:
    }
  }
}

id __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  unint64_t v5 = [v4 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke_2;
  v9[3] = &unk_26408D968;
  id v10 = v3;
  id v6 = v3;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_finishPairingWithAccessories:(id)a3 completedInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = objc_msgSend(v6, "hf_prettyDescription");
    int v11 = 138412546;
    BOOL v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Finished pairing with accessories: %@, info: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
  [v10 updateStatus:2 error:0];

  [(HFSetupSingleAccessoryPairingController *)self setPairedAccessories:v6];
  [(HFSetupSingleAccessoryPairingController *)self setCompletedInfo:v7];
  [(HFSetupSingleAccessoryPairingController *)self setPhase:10];
}

- (void)_failPairingWithDiscoveredAccessory:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(HFSetupSingleAccessoryPairingController *)self phase] != 9)
  {
    id v6 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
    [v6 updateStatus:3 error:v5];

    id v7 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(HFSetupSingleAccessoryPairingController *)self discoveredAccessoryToPair];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Failed pairing with accessory: %@ error: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HFSetupSingleAccessoryPairingController *)self setPhase:9];
  }
}

- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4
{
  if (a4 - 6 >= 4)
  {
    switch(a3)
    {
      case 0uLL:
        if (a4 != 1 && a4 != 4) {
          goto LABEL_20;
        }
        break;
      case 1uLL:
        if (a4 == 4)
        {
          id v8 = [(HFSetupSingleAccessoryPairingController *)self setupResult];
          BOOL v9 = v8 != 0;
        }
        else
        {
          BOOL v9 = 0;
        }
        if (a4 != 3 && a4 != 10 && !v9) {
          goto LABEL_20;
        }
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        if (a4 > 0xA || ((1 << a4) & 0x422) == 0) {
          goto LABEL_20;
        }
        break;
      default:
LABEL_20:
        id v14 = [MEMORY[0x263F08690] currentHandler];
        id v12 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a3];
        uint64_t v13 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a4];
        [v14 handleFailureInMethod:a2, self, @"HFSetupSingleAccessoryPairingController.m", 412, @"Invalid phase transition: %@ -> %@", v12, v13 object file lineNumber description];

        break;
    }
  }
}

- (HFSetupPairingContext)context
{
  return self->_context;
}

- (HFSetupAccessoryResult)setupResult
{
  return self->_setupResult;
}

- (HMAccessorySetupCompletedInfo)completedInfo
{
  return self->_completedInfo;
}

- (void)setCompletedInfo:(id)a3
{
}

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSString)statusTitle
{
  return self->_statusTitle;
}

- (void)setStatusTitle:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSSet)pairedAccessories
{
  return self->_pairedAccessories;
}

- (void)setPairedAccessories:(id)a3
{
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
}

- (NAFuture)pairingFuture
{
  return self->_pairingFuture;
}

- (void)setPairingFuture:(id)a3
{
}

- (NSDate)phaseStartDate
{
  return self->_phaseStartDate;
}

- (void)setPhaseStartDate:(id)a3
{
}

- (BOOL)accessoryRequiresCode
{
  return self->_accessoryRequiresCode;
}

- (void)setAccessoryRequiresCode:(BOOL)a3
{
  self->_accessoryRequiresCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end