@interface IPPublishedIdentityProgress
- (IPPublishedIdentityProgress)initWithAppIdentity:(id)a3 observer:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)personaUniqueString;
- (id)currentProgress;
- (id)lsIdentity;
- (id)miIdentity;
- (unint64_t)completedUnitCountForPhase:(unint64_t)a3;
- (unint64_t)finalPhase;
- (unint64_t)installPhase;
- (unint64_t)totalUnitCountForPhase:(unint64_t)a3;
- (void)finishProgressWithState:(unint64_t)a3;
- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4;
- (void)setFinalPhase:(unint64_t)a3;
- (void)setInstallPhase:(unint64_t)a3;
- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4;
- (void)setTotalUnitCountsForPhases:(id)a3;
@end

@implementation IPPublishedIdentityProgress

- (IPPublishedIdentityProgress)initWithAppIdentity:(id)a3 observer:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IPPublishedIdentityProgress;
  v8 = [(IPPublishedIdentityProgress *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(IPInstallableProgressData);
    progressData = v9->_progressData;
    v9->_progressData = v10;

    uint64_t v12 = [v6 copy];
    miIdentity = v9->_miIdentity;
    v9->_miIdentity = (MIAppIdentity *)v12;

    id v20 = 0;
    uint64_t v14 = IPLSIdentityFromMIIdentity(v6, &v20);
    id v15 = v20;
    lsIdentity = v9->_lsIdentity;
    v9->_lsIdentity = (LSApplicationIdentity *)v14;

    if (!v9->_lsIdentity)
    {
      v17 = _IPServerLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[IPPublishedIdentityProgress initWithAppIdentity:observer:]((uint64_t)v6, (uint64_t)v15, v17);
      }
    }
    objc_storeWeak((id *)&v9->_observer, v7);
    v18 = _IPDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2048;
      id v25 = v7;
      _os_log_impl(&dword_252AA9000, v18, OS_LOG_TYPE_DEFAULT, "Created published identity progress for %@, observer %p", buf, 0x16u);
    }
  }
  return v9;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(MIAppIdentity *)self->_miIdentity bundleID];
}

- (NSString)personaUniqueString
{
  return (NSString *)[(MIAppIdentity *)self->_miIdentity personaUniqueString];
}

- (id)miIdentity
{
  return self->_miIdentity;
}

- (id)lsIdentity
{
  return self->_lsIdentity;
}

- (id)currentProgress
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__IPPublishedIdentityProgress_currentProgress__block_invoke;
  v4[3] = &unk_26538F728;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __46__IPPublishedIdentityProgress_currentProgress__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)completedUnitCountForPhase:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__IPPublishedIdentityProgress_completedUnitCountForPhase___block_invoke;
  v5[3] = &unk_26538F7A0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  IPDoWithLock(&self->_lock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__IPPublishedIdentityProgress_completedUnitCountForPhase___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) completedUnitCountForPhase:IPProgressPhaseForLSInstallPhase(a1[6])];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__IPPublishedIdentityProgress_setCompletedUnitCount_forPhase___block_invoke;
  v6[3] = &unk_26538F7C8;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = self;
  v6[5] = &v7;
  IPDoWithLock(&self->_lock, v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained identityProgress:self didChangeProgressData:v8[5]];

  _Block_object_dispose(&v7, 8);
}

uint64_t __62__IPPublishedIdentityProgress_setCompletedUnitCount_forPhase___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) setCompletedUnitCount:a1[6] forPhase:IPProgressPhaseForLSInstallPhase(a1[7])];
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)totalUnitCountForPhase:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__IPPublishedIdentityProgress_totalUnitCountForPhase___block_invoke;
  v5[3] = &unk_26538F7A0;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  IPDoWithLock(&self->_lock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__IPPublishedIdentityProgress_totalUnitCountForPhase___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) totalUnitCountForPhase:IPProgressPhaseForLSInstallPhase(a1[6])];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = v6;
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v10[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IPPublishedIdentityProgress *)self setTotalUnitCountsForPhases:v8];
}

- (void)setTotalUnitCountsForPhases:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__0;
  uint64_t v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", IPProgressPhaseForLSInstallPhase(objc_msgSend(v10, "unsignedLongLongValue")));
        id v12 = [v6 objectForKeyedSubscript:v10];
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v7);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__IPPublishedIdentityProgress_setTotalUnitCountsForPhases___block_invoke;
  v15[3] = &unk_26538F7F0;
  v15[4] = self;
  id v13 = v5;
  id v16 = v13;
  v17 = &v22;
  IPDoWithLock(&self->_lock, v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained identityProgress:self didChangeProgressData:v23[5]];

  _Block_object_dispose(&v22, 8);
}

uint64_t __59__IPPublishedIdentityProgress_setTotalUnitCountsForPhases___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) setTotalUnitCountsForPhases:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (void)finishProgressWithState:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained identityProgress:self didFinishWithState:a3];
}

- (void)setInstallPhase:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__IPPublishedIdentityProgress_setInstallPhase___block_invoke;
  v5[3] = &unk_26538F818;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  IPDoWithLock(&self->_lock, v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained identityProgress:self didChangeProgressData:v7[5]];

  _Block_object_dispose(&v6, 8);
}

uint64_t __47__IPPublishedIdentityProgress_setInstallPhase___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) setInstallPhase:IPProgressPhaseForLSInstallPhase(a1[6])];
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)installPhase
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__IPPublishedIdentityProgress_installPhase__block_invoke;
  v4[3] = &unk_26538F728;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  unint64_t v2 = LSInstallPhaseForIPProgressPhase(v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__IPPublishedIdentityProgress_installPhase__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) installPhase];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setFinalPhase:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__IPPublishedIdentityProgress_setFinalPhase___block_invoke;
  v5[3] = &unk_26538F818;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  IPDoWithLock(&self->_lock, v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained identityProgress:self didChangeProgressData:v7[5]];

  _Block_object_dispose(&v6, 8);
}

uint64_t __45__IPPublishedIdentityProgress_setFinalPhase___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) setFinalPhase:IPProgressPhaseForLSInstallPhase(a1[6])];
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 16) copy];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)finalPhase
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__IPPublishedIdentityProgress_finalPhase__block_invoke;
  v4[3] = &unk_26538F728;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  unint64_t v2 = LSInstallPhaseForIPProgressPhase(v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__IPPublishedIdentityProgress_finalPhase__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) finalPhase];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_lsIdentity, 0);
  objc_storeStrong((id *)&self->_miIdentity, 0);

  objc_storeStrong((id *)&self->_progressData, 0);
}

- (void)initWithAppIdentity:(os_log_t)log observer:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_252AA9000, log, OS_LOG_TYPE_FAULT, "could not get LS identity from MI identity %@: %@", (uint8_t *)&v3, 0x16u);
}

@end