@interface HFSetupAutomaticDiscoveryPairingController
+ (BOOL)supportsSetupPayloadRetry;
- (HFDiscoveredAccessory)discoveredAccessoryToPair;
- (HFSetupAccessoryResult)setupResult;
- (HFSetupAutomaticDiscoveryPairingController)initWithContext:(id)a3;
- (HFSetupPairingContext)context;
- (HMAccessorySetupCompletedInfo)completedInfo;
- (HMHome)home;
- (NAFuture)pairingFuture;
- (NSDate)phaseStartDate;
- (NSHashTable)pairingObservers;
- (NSSet)pairedAccessories;
- (NSString)description;
- (NSString)statusDescription;
- (NSString)statusTitle;
- (NSTimer)accessoryNotFoundFatalTimeoutTimer;
- (NSTimer)accessoryNotFoundSoftTimeoutTimer;
- (id)_sendCancellationRequestToHomeKit;
- (id)cancel;
- (unint64_t)phase;
- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4;
- (void)_failPairingWithError:(id)a3;
- (void)_finishPairingWithAccessories:(id)a3 completedInfo:(id)a4;
- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3;
- (void)addPairingObserver:(id)a3;
- (void)dealloc;
- (void)removePairingObserver:(id)a3;
- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3;
- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3;
- (void)setCompletedInfo:(id)a3;
- (void)setDiscoveredAccessoryToPair:(id)a3;
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

@implementation HFSetupAutomaticDiscoveryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HFSetupAutomaticDiscoveryPairingController)initWithContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFSetupAutomaticDiscoveryPairingController;
  v6 = [(HFSetupAutomaticDiscoveryPairingController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_phase = 0;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    phaseStartDate = v7->_phaseStartDate;
    v7->_phaseStartDate = (NSDate *)v8;

    v10 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    pairingFuture = v7->_pairingFuture;
    v7->_pairingFuture = v10;
  }
  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_accessoryNotFoundSoftTimeoutTimer invalidate];
  [(NSTimer *)self->_accessoryNotFoundFatalTimeoutTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HFSetupAutomaticDiscoveryPairingController;
  [(HFSetupAutomaticDiscoveryPairingController *)&v3 dealloc];
}

- (void)setPhase:(unint64_t)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  unint64_t phase = self->_phase;
  if (phase != a3)
  {
    [(HFSetupAutomaticDiscoveryPairingController *)self _assertValidTransitionFromPhase:self->_phase toPhase:a3];
    v6 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:phase];
      uint64_t v8 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a3];
      *(_DWORD *)buf = 138412802;
      v47 = self;
      __int16 v48 = 2112;
      v49 = v7;
      __int16 v50 = 2112;
      v51 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@ Transitioning phase: %@ -> %@", buf, 0x20u);
    }
    self->_unint64_t phase = a3;
    v9 = [MEMORY[0x263EFF910] date];
    [(HFSetupAutomaticDiscoveryPairingController *)self setPhaseStartDate:v9];

    v10 = [(HFSetupAutomaticDiscoveryPairingController *)self accessoryNotFoundSoftTimeoutTimer];
    [v10 invalidate];

    [(HFSetupAutomaticDiscoveryPairingController *)self setAccessoryNotFoundSoftTimeoutTimer:0];
    v11 = [(HFSetupAutomaticDiscoveryPairingController *)self accessoryNotFoundFatalTimeoutTimer];
    [v11 invalidate];

    [(HFSetupAutomaticDiscoveryPairingController *)self setAccessoryNotFoundFatalTimeoutTimer:0];
    if (a3 == 2)
    {
      objc_initWeak((id *)buf, self);
      v12 = (void *)MEMORY[0x263EFFA20];
      +[HFSetupPairingControllerUtilities accessoryDiscoverySoftTimeout];
      double v14 = v13;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke;
      v43[3] = &unk_264093C20;
      objc_copyWeak(&v44, (id *)buf);
      v15 = [v12 scheduledTimerWithTimeInterval:0 repeats:v43 block:v14];
      [(HFSetupAutomaticDiscoveryPairingController *)self setAccessoryNotFoundSoftTimeoutTimer:v15];

      v16 = (void *)MEMORY[0x263EFFA20];
      +[HFSetupPairingControllerUtilities accessoryDiscoveryFatalTimeout];
      double v18 = v17;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke_7;
      v41[3] = &unk_264093C20;
      objc_copyWeak(&v42, (id *)buf);
      v19 = [v16 scheduledTimerWithTimeInterval:0 repeats:v41 block:v18];
      [(HFSetupAutomaticDiscoveryPairingController *)self setAccessoryNotFoundFatalTimeoutTimer:v19];

      objc_destroyWeak(&v42);
      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
  }
  v20 = [(HFSetupAutomaticDiscoveryPairingController *)self statusTitle];
  v35 = [(HFSetupAutomaticDiscoveryPairingController *)self statusDescription];
  [(HFSetupAutomaticDiscoveryPairingController *)self _updateStatusTextAndNotifyDelegate:0];
  id v21 = [(HFSetupAutomaticDiscoveryPairingController *)self statusTitle];
  id v22 = v20;
  v36 = v22;
  if (v21 == v22)
  {

    goto LABEL_11;
  }
  if (v21)
  {
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_15;
    }
LABEL_11:
    id v24 = [(HFSetupAutomaticDiscoveryPairingController *)self statusDescription];
    id v25 = v35;
    if (v24 == v25)
    {
      int v26 = 0;
    }
    else if (v24)
    {
      int v26 = [v24 isEqual:v25] ^ 1;
    }
    else
    {
      int v26 = 1;
    }

    if (((phase != a3) | v26) != 1) {
      goto LABEL_29;
    }
    goto LABEL_19;
  }

LABEL_15:
LABEL_19:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v27 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingObservers];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          unint64_t v32 = self->_phase;
          v33 = [(HFSetupAutomaticDiscoveryPairingController *)self statusTitle];
          v34 = [(HFSetupAutomaticDiscoveryPairingController *)self statusDescription];
          [v31 pairingController:self didTransitionToPhase:v32 statusTitle:v33 statusDescription:v34];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v28);
  }

LABEL_29:
}

void __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = WeakRetained;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "Accessory not found soft timeout timer fired %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    if ([WeakRetained phase] == 2)
    {
      [WeakRetained _updateStatusTextAndNotifyDelegate:1];
    }
    else
    {
      objc_super v3 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [WeakRetained phase]);
      NSLog(&cfstr_TheAccessoryNo.isa, v3);
    }
  }
}

void __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "Accessory not found fatal timeout timer fired", buf, 2u);
  }

  if (WeakRetained)
  {
    if ([WeakRetained phase] == 2)
    {
      objc_super v3 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 6);
      v4 = objc_msgSend(MEMORY[0x263F087E8], "hf_mappedHMError:", v3);
      id v5 = [WeakRetained context];
      uint64_t v6 = [v5 setupAccessoryDescription];
      [v6 setCancellationReason:v4];

      id v7 = (id)[WeakRetained _sendCancellationRequestToHomeKit];
      [WeakRetained _failPairingWithError:v3];
    }
    else
    {
      objc_super v3 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [WeakRetained phase]);
      NSLog(&cfstr_TheAccessoryNo_0.isa, v3);
    }
  }
}

- (void)setSetupResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = (HFSetupAccessoryResult *)a3;
  uint64_t v6 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", buf, 0xCu);
  }

  if ([(HFSetupAutomaticDiscoveryPairingController *)self phase])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    double v17 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:[(HFSetupAutomaticDiscoveryPairingController *)self phase]];
    [v16 handleFailureInMethod:a2, self, @"HFSetupAutomaticDiscoveryPairingController.m", 128, @"HFSetupAutomaticDiscoveryPairingController can't handle changing the setup result (payload) after pairing has already started. Set the setup result before calling -startWithHome:, and create a new pairing controller if you need to change it later. Current unint64_t phase = %@", v17 object file lineNumber description];
  }
  if (![(HFSetupAccessoryResult *)v5 isValidForPairing])
  {
    double v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFSetupAutomaticDiscoveryPairingController.m", 130, @"HFSetupAutomaticDiscoveryPairingController only works with setup results (payloads) containing a setup ID or an error, not old ones that only have a setup code." object file lineNumber description];
  }
  setupResult = self->_setupResult;
  self->_setupResult = v5;
  uint64_t v8 = v5;

  v9 = [HFDiscoveredAccessory alloc];
  v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [(HFSetupAccessoryResult *)v8 setupPayload];
  v12 = [v11 accessoryName];
  double v13 = [(HFSetupAccessoryResult *)v8 setupPayload];

  double v14 = [v13 category];
  v15 = [(HFDiscoveredAccessory *)v9 initWithAccessoryUUID:v10 accessoryName:v12 accessoryCategory:v14];
  [(HFSetupAutomaticDiscoveryPairingController *)self setDiscoveredAccessoryToPair:v15];
}

- (void)addPairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingObservers];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFSetupAutomaticDiscoveryPairingController *)self setPairingObservers:v6];
  }
  id v7 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingObservers];
  [v7 addObject:v4];
}

- (void)removePairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingObservers];
  [v5 removeObject:v4];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:[(HFSetupAutomaticDiscoveryPairingController *)self phase]];
  id v5 = (id)[v3 appendObject:v4 withName:@"phase"];

  uint64_t v6 = [(HFSetupAutomaticDiscoveryPairingController *)self setupResult];
  id v7 = (id)[v3 appendObject:v6 withName:@"setupResult"];

  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

- (void)startWithHome:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v26 = self;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFSetupAutomaticDiscoveryPairingController.m", 163, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  id v7 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
  uint64_t v8 = [v7 setupAccessoryDescription];

  if (!v8)
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HFSetupAutomaticDiscoveryPairingController.m", 164, @"Invalid parameter not satisfying: %@", @"self.context.setupAccessoryDescription" object file lineNumber description];
  }
  [(HFSetupAutomaticDiscoveryPairingController *)self setHome:v5];
  v9 = [(HFSetupAutomaticDiscoveryPairingController *)self setupResult];
  v10 = [v9 error];

  if (v10)
  {
    [(HFSetupAutomaticDiscoveryPairingController *)self setPhase:9];
  }
  else
  {
    v11 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
    v12 = [v11 setupAccessoryDescription];
    double v13 = [(HFSetupAutomaticDiscoveryPairingController *)self setupResult];
    double v14 = [v13 setupPayload];
    [v12 updateWithSetupAccessoryPayload:v14];

    [(HFSetupAutomaticDiscoveryPairingController *)self setPhase:2];
    v15 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
      double v17 = [v16 setupAccessoryDescription];
      *(_DWORD *)buf = 138412290;
      int v26 = v17;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "HFSetupAutomaticDiscoveryPairingController startPairing with description: %@", buf, 0xCu);
    }
    double v18 = [(HFSetupAutomaticDiscoveryPairingController *)self home];
    v19 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
    v20 = [v19 setupAccessoryDescription];
    v23[4] = self;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke;
    v24[3] = &unk_26408D8C8;
    v24[4] = self;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_45;
    v23[3] = &unk_264093C48;
    [v18 startPairingWithAccessoryDescription:v20 progress:v24 completion:v23];
  }
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_26408D8A0;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2(uint64_t a1)
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

  v11 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    double v13 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:v2];
    uint64_t v14 = [*(id *)(a1 + 32) phase];
    v15 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [*(id *)(a1 + 32) phase]);
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413570;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v2;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    int v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ pairing phase transition %ld (%@) -> %ld (%@).  Progress: %ld", buf, 0x3Eu);
  }
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2_46;
  v13[3] = &unk_26408D478;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2_46(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) phase] == 9)
  {
    uint64_t v2 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v12 = *(void **)(a1 + 40);
      int v14 = 138412290;
      id v15 = v12;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", (uint8_t *)&v14, 0xCu);
    }
LABEL_4:

    return;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v13 = *(void **)(a1 + 40);
      int v14 = 138412290;
      id v15 = v13;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: %@", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 32) _failPairingWithError:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 48) count];
    uint64_t v5 = HFLogForCategory(0x3BuLL);
    uint64_t v6 = v5;
    if (!v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: nil but no paired accessories; tr"
          "eating as a failure",
          (uint8_t *)&v14,
          2u);
      }

      id v11 = *(void **)(a1 + 32);
      uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
      [v11 _failPairingWithError:v2];
      goto LABEL_4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
      uint64_t v8 = *(void *)(a1 + 56);
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFSetupAutomaticDiscoveryPairingController startPairing finished with accessories: %@ info: %@", (uint8_t *)&v14, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 48)];
    [v9 _finishPairingWithAccessories:v10 completedInfo:*(void *)(a1 + 56)];
  }
}

- (id)cancel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (+[HFSetupPairingControllerUtilities isPairingPhaseIdle:[(HFSetupAutomaticDiscoveryPairingController *)self phase]])
  {
    uint64_t v3 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = self;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "na_cancelledError");
    uint64_t v6 = [(HFSetupAutomaticDiscoveryPairingController *)self discoveredAccessoryToPair];
    [v6 updateStatus:3 error:v5];

    id v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_mappedHMError:", v5);
    uint64_t v8 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
    id v9 = [v8 setupAccessoryDescription];
    [v9 setCancellationReason:v7];

    uint64_t v4 = [(HFSetupAutomaticDiscoveryPairingController *)self _sendCancellationRequestToHomeKit];
    [(HFSetupAutomaticDiscoveryPairingController *)self setPhase:9];
  }
  return v4;
}

- (id)_sendCancellationRequestToHomeKit
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke;
  v15[3] = &unk_26408CD50;
  v15[4] = self;
  uint64_t v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_2;
  v14[3] = &unk_26408CDF0;
  v14[4] = self;
  id v5 = (id)[v4 addFailureBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_51;
  v13[3] = &unk_26408C8A0;
  v13[4] = self;
  id v6 = (id)[v4 addSuccessBlock:v13];
  id v7 = (void *)MEMORY[0x263F58190];
  uint64_t v8 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingFuture];
  v16[0] = v8;
  v16[1] = v4;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v10 = [MEMORY[0x263F581B8] mainThreadScheduler];
  int v11 = [v7 combineAllFutures:v9 ignoringErrors:1 scheduler:v10];

  return v11;
}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 home];
  id v5 = [*(id *)(a1 + 32) context];
  id v6 = [v5 setupAccessoryDescription];
  [v7 cancelPairingForAccessoryWithDescription:v6 completionHandler:v4];
}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel pairing for pairing controller: (%@). Error: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) pairingFuture];
  [v5 finishWithNoResult];
}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_51(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Cancel done for pairing controller: (%@)", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) pairingFuture];
  [v4 finishWithNoResult];
}

- (void)_failPairingWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HFSetupAutomaticDiscoveryPairingController *)self phase] != 9)
  {
    int v5 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = self;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed pairing with error: %@ (%@)", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v6 = [(HFSetupAutomaticDiscoveryPairingController *)self discoveredAccessoryToPair];
    [v6 updateStatus:3 error:v4];

    [(HFSetupAutomaticDiscoveryPairingController *)self setPhase:9];
    uint64_t v7 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingFuture];
    [v7 finishWithError:v4];
  }
}

- (void)_finishPairingWithAccessories:(id)a3 completedInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v6, "hf_prettyDescription");
    int v11 = 138412802;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Finished pairing with accessories: %@ & info: %@ (%@)", (uint8_t *)&v11, 0x20u);
  }
  __int16 v10 = [(HFSetupAutomaticDiscoveryPairingController *)self discoveredAccessoryToPair];
  [v10 updateStatus:2 error:0];

  [(HFSetupAutomaticDiscoveryPairingController *)self setPairedAccessories:v6];
  [(HFSetupAutomaticDiscoveryPairingController *)self setCompletedInfo:v7];
  [(HFSetupAutomaticDiscoveryPairingController *)self setPhase:10];
}

- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v28 = 0;
  id v29 = 0;
  unint64_t v5 = [(HFSetupAutomaticDiscoveryPairingController *)self phase];
  id v6 = [(HFSetupAutomaticDiscoveryPairingController *)self phaseStartDate];
  id v7 = [(HFSetupAutomaticDiscoveryPairingController *)self discoveredAccessoryToPair];
  int v8 = [(HFSetupAutomaticDiscoveryPairingController *)self setupResult];
  id v9 = [(HFSetupAutomaticDiscoveryPairingController *)self context];
  +[HFSetupPairingControllerUtilities getStatusTitle:&v29 statusDescription:&v28 forPairingPhase:v5 phaseStartDate:v6 discoveredAccessory:v7 setupResult:v8 context:v9 setupError:0];
  id v10 = v29;
  id v11 = v28;

  [(HFSetupAutomaticDiscoveryPairingController *)self setStatusTitle:v10];
  [(HFSetupAutomaticDiscoveryPairingController *)self setStatusDescription:v11];
  uint64_t v12 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\"", buf, 0x16u);
  }

  if (v3)
  {
    id v22 = v11;
    id v23 = v10;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    __int16 v13 = [(HFSetupAutomaticDiscoveryPairingController *)self pairingObservers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector())
          {
            unint64_t v19 = [(HFSetupAutomaticDiscoveryPairingController *)self phase];
            uint64_t v20 = [(HFSetupAutomaticDiscoveryPairingController *)self statusTitle];
            __int16 v21 = [(HFSetupAutomaticDiscoveryPairingController *)self statusDescription];
            [v18 pairingController:self didTransitionToPhase:v19 statusTitle:v20 statusDescription:v21];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v15);
    }

    id v11 = v22;
    id v10 = v23;
  }
}

- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4
{
  if (a4 - 6 >= 4)
  {
    switch(a3)
    {
      case 0uLL:
        if (a4 != 2) {
          goto LABEL_11;
        }
        return;
      case 2uLL:
        if (a4 > 0xA) {
          goto LABEL_11;
        }
        uint64_t v8 = 1 << a4;
        uint64_t v9 = 1048;
        goto LABEL_9;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        if (a4 <= 0xA)
        {
          uint64_t v8 = 1 << a4;
          uint64_t v9 = 1060;
LABEL_9:
          if ((v8 & v9) != 0) {
            return;
          }
        }
        goto LABEL_11;
      default:
LABEL_11:
        id v12 = [MEMORY[0x263F08690] currentHandler];
        id v10 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a3];
        id v11 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a4];
        [v12 handleFailureInMethod:a2, self, @"HFSetupAutomaticDiscoveryPairingController.m", 344, @"Invalid phase transition: %@ -> %@", v10, v11 object file lineNumber description];

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

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
}

- (void)setDiscoveredAccessoryToPair:(id)a3
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

- (NSTimer)accessoryNotFoundFatalTimeoutTimer
{
  return self->_accessoryNotFoundFatalTimeoutTimer;
}

- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3
{
}

- (NSTimer)accessoryNotFoundSoftTimeoutTimer
{
  return self->_accessoryNotFoundSoftTimeoutTimer;
}

- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end