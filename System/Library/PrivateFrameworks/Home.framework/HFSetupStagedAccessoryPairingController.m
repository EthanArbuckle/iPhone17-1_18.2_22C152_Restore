@interface HFSetupStagedAccessoryPairingController
+ (BOOL)supportsSetupPayloadRetry;
- (HFDiscoveredAccessory)discoveredAccessoryToPair;
- (HFSetupAccessoryResult)setupResult;
- (HFSetupPairingContext)context;
- (HFSetupStagedAccessoryPairingController)initWithContext:(id)a3;
- (HMAccessorySetupCompletedInfo)completedInfo;
- (HMHome)home;
- (NSHashTable)pairingObservers;
- (NSSet)pairedAccessories;
- (NSString)statusDescription;
- (NSString)statusTitle;
- (id)cancel;
- (unint64_t)phase;
- (void)addPairingObserver:(id)a3;
- (void)removePairingObserver:(id)a3;
- (void)setCompletedInfo:(id)a3;
- (void)setDiscoveredAccessoryToPair:(id)a3;
- (void)setHome:(id)a3;
- (void)setPairedAccessories:(id)a3;
- (void)setPairingObservers:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setSetupResult:(id)a3;
- (void)setStatusDescription:(id)a3;
- (void)setStatusTitle:(id)a3;
- (void)startWithHome:(id)a3;
@end

@implementation HFSetupStagedAccessoryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HFSetupStagedAccessoryPairingController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSetupStagedAccessoryPairingController;
  v6 = [(HFSetupStagedAccessoryPairingController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_phase = 0;
  }

  return v7;
}

- (void)setPhase:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_phase != a3)
  {
    self->_unint64_t phase = a3;
    v4 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = [(HFSetupStagedAccessoryPairingController *)self phase];
      v6 = [(HFSetupStagedAccessoryPairingController *)self pairingObservers];
      *(_DWORD *)buf = 136315650;
      v22 = "-[HFSetupStagedAccessoryPairingController setPhase:]";
      __int16 v23 = 2048;
      unint64_t v24 = v5;
      __int16 v25 = 2048;
      uint64_t v26 = [v6 count];
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%s phaseDidChange to %ld.  Notifying %ld observers", buf, 0x20u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = [(HFSetupStagedAccessoryPairingController *)self pairingObservers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector())
          {
            unint64_t phase = self->_phase;
            v14 = [(HFSetupStagedAccessoryPairingController *)self statusTitle];
            v15 = [(HFSetupStagedAccessoryPairingController *)self statusDescription];
            [v12 pairingController:self didTransitionToPhase:phase statusTitle:v14 statusDescription:v15];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)addPairingObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFSetupStagedAccessoryPairingController *)self pairingObservers];

  if (!v5)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFSetupStagedAccessoryPairingController *)self setPairingObservers:v6];
  }
  id v7 = [(HFSetupStagedAccessoryPairingController *)self pairingObservers];
  [v7 addObject:v4];
}

- (void)removePairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSetupStagedAccessoryPairingController *)self pairingObservers];
  [v5 removeObject:v4];
}

- (void)startWithHome:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(HFSetupStagedAccessoryPairingController *)self context];
  id v7 = [v6 setupAccessoryDescription];

  uint64_t v8 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v16 = self;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (v5)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HFSetupStagedAccessoryPairingController.m", 96, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
  }
  v12 = [MEMORY[0x263F08690] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"HFSetupStagedAccessoryPairingController.m", 97, @"Invalid parameter not satisfying: %@", @"setupDescription" object file lineNumber description];

LABEL_5:
  [(HFSetupStagedAccessoryPairingController *)self setHome:v5];
  uint64_t v9 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = v7;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFSetupStagedAccessoryPairingController startPairing with description: %@", buf, 0xCu);
  }

  uint64_t v10 = [(HFSetupStagedAccessoryPairingController *)self home];
  v13[4] = self;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke;
  v14[3] = &unk_26408D8C8;
  v14[4] = self;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_16;
  v13[3] = &unk_264093C48;
  [v10 startPairingWithAccessoryDescription:v7 progress:v14 completion:v13];
}

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_26408D8A0;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2(uint64_t a1)
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
  uint64_t v10 = [*(id *)(a1 + 32) home];
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", +[HFSetupPairingControllerUtilities processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:](HFSetupPairingControllerUtilities, "processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:", v5, v6, v7, v8, v9, v10, objc_opt_class()));

  uint64_t v11 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    v13 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:v2];
    uint64_t v14 = [*(id *)(a1 + 32) phase];
    v15 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [*(id *)(a1 + 32) phase]);
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413570;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v2;
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ pairing phase transition %ld (%@) -> %ld (%@).  Progress: %ld", buf, 0x3Eu);
  }
}

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2_17;
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

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2_17(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) phase] != 9)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v3 = HFLogForCategory(0x3BuLL);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)id v16 = 138412290;
      *(void *)&v16[4] = v15;
      id v11 = "HFSetupStagedAccessoryPairingController startPairing finished with error: %@";
      id v12 = v3;
      uint32_t v13 = 12;
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 48) count];
      id v7 = HFLogForCategory(0x3BuLL);
      uint64_t v3 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
          uint64_t v9 = *(void *)(a1 + 56);
          *(_DWORD *)id v16 = 138412546;
          *(void *)&v16[4] = v8;
          *(_WORD *)&v16[12] = 2112;
          *(void *)&v16[14] = v9;
          _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFSetupStagedAccessoryPairingController startPairing finished with accessories: %@ info: %@", v16, 0x16u);
        }
        id v10 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) setPairedAccessories:v10];

        [*(id *)(a1 + 32) setCompletedInfo:*(void *)(a1 + 56)];
        id v4 = *(void **)(a1 + 32);
        uint64_t v5 = 10;
        goto LABEL_12;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        id v4 = *(void **)(a1 + 32);
        uint64_t v5 = 9;
LABEL_12:
        objc_msgSend(v4, "setPhase:", v5, *(_OWORD *)v16);
        return;
      }
      *(_WORD *)id v16 = 0;
      id v11 = "HFSetupStagedAccessoryPairingController startPairing finished with error: nil but no paired accessories; tre"
            "ating as a failure";
      id v12 = v3;
      uint32_t v13 = 2;
    }
    _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, v11, v16, v13);
    goto LABEL_7;
  }
  uint64_t v2 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)id v16 = 138412290;
    *(void *)&v16[4] = v14;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "HFSetupStagedAccessoryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", v16, 0xCu);
  }
}

- (id)cancel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (+[HFSetupPairingControllerUtilities isPairingPhaseIdle:[(HFSetupStagedAccessoryPairingController *)self phase]]|| ([(HFSetupStagedAccessoryPairingController *)self home], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    uint64_t v9 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint32_t v13 = self;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", buf, 0xCu);
    }

    id v8 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x263F087E8], "na_cancelledError");
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "hf_mappedHMError:", v4);
    uint64_t v6 = [(HFSetupStagedAccessoryPairingController *)self context];
    id v7 = [v6 setupAccessoryDescription];
    [v7 setCancellationReason:v5];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__HFSetupStagedAccessoryPairingController_cancel__block_invoke;
    v11[3] = &unk_26408CD50;
    v11[4] = self;
    id v8 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v11];
    [(HFSetupStagedAccessoryPairingController *)self setPhase:9];
  }
  return v8;
}

void __49__HFSetupStagedAccessoryPairingController_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 home];
  uint64_t v5 = [*(id *)(a1 + 32) context];
  uint64_t v6 = [v5 setupAccessoryDescription];
  [v7 cancelPairingForAccessoryWithDescription:v6 completionHandler:v4];
}

- (HFSetupPairingContext)context
{
  return self->_context;
}

- (HFSetupAccessoryResult)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
}

- (NSSet)pairedAccessories
{
  return self->_pairedAccessories;
}

- (void)setPairedAccessories:(id)a3
{
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

- (void)setDiscoveredAccessoryToPair:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end