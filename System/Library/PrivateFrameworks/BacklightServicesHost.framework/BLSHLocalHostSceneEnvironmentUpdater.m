@interface BLSHLocalHostSceneEnvironmentUpdater
- (BLSHLocalHostSceneEnvironmentUpdater)initWithSessionProvider:(id)a3 localHostEnvironment:(id)a4 osTimerProvider:(id)a5;
- (BOOL)ensureAlwaysOnSessionCreated;
- (NSString)description;
- (id)subHostedHostEnvironments;
- (int64_t)backlightState;
- (void)aggregateDesiredFidelityForBacklightState:(int64_t)a3 withCompletion:(id)a4;
- (void)destroyInactiveEnvSession;
- (void)ensureInactiveEnvSessionCreated;
- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4;
- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4;
- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4;
- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4;
- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4;
- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4;
- (void)onMain_ensureInactiveEnvSessionCreated;
- (void)performBlockWithSubhostedEnvironments:(id)a3;
- (void)performDesiredFidelityRequest:(id)a3;
- (void)performFrameSpecifiersRequest:(id)a3;
- (void)performWithSubhostedEnvironmentsFromPresentationEntries:(id)a3 block:(id)a4;
- (void)timelinesForDateInterval:(id)a3 previousPresentationDate:(id)a4 localHostEnvironment:(id)a5 shouldReset:(BOOL)a6 completion:(id)a7;
- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4;
@end

@implementation BLSHLocalHostSceneEnvironmentUpdater

- (BLSHLocalHostSceneEnvironmentUpdater)initWithSessionProvider:(id)a3 localHostEnvironment:(id)a4 osTimerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BLSHLocalHostSceneEnvironmentUpdater;
  v12 = [(BLSHLocalHostSceneEnvironmentUpdater *)&v25 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_lock_nextEventID = 0x8000000000000000;
    objc_storeStrong((id *)&v12->_sessionProvider, a3);
    objc_storeStrong((id *)&v13->_osTimerProvider, a5);
    objc_storeStrong((id *)&v13->_localHostEnvironment, a4);
    v14 = [[BLSHInactiveBudgetPolicy alloc] initWithOSTimerProvider:v13->_osTimerProvider];
    inactiveBudgetPolicy = v13->_inactiveBudgetPolicy;
    v13->_inactiveBudgetPolicy = (BLSHInactiveBudgetPolicing_Private *)v14;

    v16 = [v10 visualState];
    uint64_t v17 = BLSBacklightStateForVisuaState();

    if (v17 == 1) {
      [(BLSHLocalHostSceneEnvironmentUpdater *)v13 ensureInactiveEnvSessionCreated];
    }
    if (os_variant_has_internal_diagnostics())
    {
      v18 = NSString;
      v19 = [MEMORY[0x263F08AB0] processInfo];
      v20 = [v19 processName];
      v21 = [v18 stringWithFormat:@"com.apple.BacklightServices.BLSHBacklightSceneEnvironmentHosting.%@.criticalasserttest", v20];

      v22 = [[BLSHCriticalAssertTester alloc] initWithNotificationName:v21];
      criticalAssertTester = v13->_criticalAssertTester;
      v13->_criticalAssertTester = v22;
    }
  }

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self->_sessionProvider];
  [v3 appendString:v4 withName:@"sessionProvider"];

  id v5 = (id)[v3 appendObject:self->_localHostEnvironment withName:@"localHostEnvironment"];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)ensureInactiveEnvSessionCreated
{
}

uint64_t __71__BLSHLocalHostSceneEnvironmentUpdater_ensureInactiveEnvSessionCreated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onMain_ensureInactiveEnvSessionCreated");
}

- (void)destroyInactiveEnvSession
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a2;
  v6 = [*(id *)(a1 + 64) presentation];
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) destroy session:%p with current presentation:%{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)onMain_ensureInactiveEnvSessionCreated
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_lock_inactiveEnvSession;
  os_unfair_lock_unlock(&self->_lock);
  if (!v3)
  {
    v3 = [(BLSHBacklightEnvironmentSessionProviding *)self->_sessionProvider createInactiveEnvironmentSession];
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_inactiveEnvSession, v3);
    [(BLSHBacklightInactiveEnvironmentSession *)v3 setUpdater:self];
    v4 = [(BLSHBacklightInactiveEnvironmentSession *)v3 presentation];
    uint64_t v5 = bls_backlight_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218498;
      __int16 v9 = self;
      __int16 v10 = 2048;
      __int16 v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v4;
      _os_log_debug_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) createdSession:%p with presentation:%{public}@", (uint8_t *)&v8, 0x20u);
    }

    v6 = [[BLSHBacklightEnvironmentStateMachine alloc] initWithPresentation:v4 backlightState:self->_backlightState delegate:self inactiveBudgetPolicy:self->_inactiveBudgetPolicy osTimerProvider:self->_osTimerProvider];
    environmentStateMachine = self->_environmentStateMachine;
    self->_environmentStateMachine = v6;

    os_unfair_lock_unlock(&self->_lock);
    [(BLSHBacklightInactiveEnvironmentSession *)v3 addEnvironmentsObserver:self];
  }
}

- (BOOL)ensureAlwaysOnSessionCreated
{
  v2 = self->_localHostEnvironment;
  uint64_t v3 = [(BLSBacklightSceneEnvironment_Private *)v2 alwaysOnSession];
  v4 = (void *)v3;
  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F29948]) initWithEnvironment:v2];
    [(BLSBacklightSceneEnvironment_Private *)v2 setAlwaysOnSession:v4];
  }

  return v3 == 0;
}

- (void)timelinesForDateInterval:(id)a3 previousPresentationDate:(id)a4 localHostEnvironment:(id)a5 shouldReset:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator alloc];
  uint64_t v17 = [(BLSHLocalHostSceneEnvironmentUpdater *)self subHostedHostEnvironments];
  v18 = -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator initWithDateInterval:previousPresentationDate:localHostEnvironment:subHostedHostEnvironments:shouldReset:osTimerProvider:]((id *)&v16->super.isa, v12, v13, v14, v17, a6, self->_osTimerProvider);

  os_unfair_lock_lock(&self->_lock);
  lock_timelinesCalculators = self->_lock_timelinesCalculators;
  if (!lock_timelinesCalculators)
  {
    v20 = [MEMORY[0x263EFF9C0] set];
    v21 = self->_lock_timelinesCalculators;
    self->_lock_timelinesCalculators = v20;

    lock_timelinesCalculators = self->_lock_timelinesCalculators;
  }
  [(NSMutableSet *)lock_timelinesCalculators addObject:v18];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, v18);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __134__BLSHLocalHostSceneEnvironmentUpdater_timelinesForDateInterval_previousPresentationDate_localHostEnvironment_shouldReset_completion___block_invoke;
  v23[3] = &unk_264533F70;
  objc_copyWeak(&v25, &location);
  v23[4] = self;
  id v22 = v15;
  id v24 = v22;
  [v18 calculateWithCompletion:v23];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __134__BLSHLocalHostSceneEnvironmentUpdater_timelinesForDateInterval_previousPresentationDate_localHostEnvironment_shouldReset_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:WeakRetained];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)aggregateDesiredFidelityForBacklightState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  int v7 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveEnvSession presentation];
  int v8 = [v7 presentationEntries];

  os_unfair_lock_unlock(&self->_lock);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2810000000;
  v35[3] = &unk_21FDA3FC6;
  int v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v34 = [v8 count];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke;
  v27[3] = &unk_264533F98;
  v29 = v35;
  v30 = v32;
  v31 = v33;
  id v9 = v6;
  id v28 = v9;
  __int16 v10 = (void *)MEMORY[0x223C5E2B0](v27);
  __int16 v11 = self->_localHostEnvironment;
  id v12 = objc_alloc(MEMORY[0x263F08798]);
  id v13 = [(BLSHOSTimerProviding *)self->_osTimerProvider now];
  id v14 = (void *)[v12 initWithStartDate:v13 duration:60.0];

  id v15 = [(BLSBacklightSceneEnvironment_Private *)v11 delegate];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_2;
  v23[3] = &unk_264533FC0;
  v16 = v11;
  id v24 = v16;
  id v17 = v14;
  id v25 = v17;
  id v18 = v10;
  id v26 = v18;
  [v15 environment:v16 timelinesForDateInterval:v17 previousSpecifier:0 completion:v23];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_3;
  v20[3] = &unk_264533FE8;
  int64_t v22 = a3;
  id v19 = v18;
  id v21 = v19;
  [(BLSHLocalHostSceneEnvironmentUpdater *)self performWithSubhostedEnvironmentsFromPresentationEntries:v8 block:v20];

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke(void *a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 <= a2) {
    uint64_t v5 = a2;
  }
  *(void *)(v4 + 24) = v5;
  uint64_t v6 = --*(void *)(*(void *)(a1[7] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  if (!v6)
  {
    int v7 = *(void (**)(void))(a1[4] + 16);
    v7();
  }
}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 alwaysOnSession];
  [v5 desiredFidelityForDateInterval:a1[5] timelines:v4 withCompletion:a1[6]];
}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)performBlockWithSubhostedEnvironments:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveEnvSession presentation];
  id v7 = [v6 presentationEntries];

  os_unfair_lock_unlock(p_lock);
  [(BLSHLocalHostSceneEnvironmentUpdater *)self performWithSubhostedEnvironmentsFromPresentationEntries:v7 block:v5];
}

- (void)performWithSubhostedEnvironmentsFromPresentationEntries:(id)a3 block:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(BLSBacklightSceneEnvironment_Private *)self->_localHostEnvironment identifier];
  os_unfair_lock_unlock(p_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "environment", (void)v18);
        v16 = [v15 identifier];
        char v17 = [v16 isEqualToString:v9];

        if ((v17 & 1) == 0) {
          v7[2](v7, v15);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (id)subHostedHostEnvironments
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BLSBacklightSceneEnvironment_Private *)self->_localHostEnvironment identifier];
  id v5 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveEnvSession presentation];
  id v6 = [v5 presentationEntries];

  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__BLSHLocalHostSceneEnvironmentUpdater_subHostedHostEnvironments__block_invoke;
  v10[3] = &unk_2645331A0;
  id v11 = v4;
  id v7 = v4;
  int v8 = objc_msgSend(v6, "bs_compactMap:", v10);

  return v8;
}

id __65__BLSHLocalHostSceneEnvironmentUpdater_subHostedHostEnvironments__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 environment];
  id v4 = [v3 identifier];
  LOBYTE(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4
{
  char v4 = (char)a3;
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = self->_localHostEnvironment;
  v75 = v6;
  if (v6) {
    int v72 = [v6 isUpdateToDateSpecifier] ^ 1;
  }
  else {
    int v72 = 0;
  }
  v73 = v7;
  v74 = [(BLSBacklightSceneEnvironment_Private *)v7 alwaysOnSession];
  if ((v4 & 8) == 0) {
    goto LABEL_5;
  }
  int v8 = [(BLSBacklightSceneEnvironment_Private *)v7 visualState];
  uint64_t v9 = [v8 updateFidelity];
  uint64_t v10 = [v8 adjustedLuminance];
  if (v10 == 2) {
    char v11 = v72;
  }
  else {
    char v11 = 0;
  }
  if (v10 != 1 && (v11 & 1) == 0 && (unint64_t)(v9 - 1) > 1)
  {
    if (v74)
    {
      int v12 = BLSDeviceSupports1HzFlipbook();
      uint64_t v13 = bls_environment_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          id v15 = [(BLSBacklightSceneEnvironment_Private *)v73 identifier];
          v16 = BLSBacklightFBSSceneEnvironmentDeltaDescription();
          *(_DWORD *)buf = 134218754;
          v96 = self;
          __int16 v97 = 2114;
          *(void *)v98 = v74;
          *(_WORD *)&v98[8] = 2112;
          *(void *)&v98[10] = v15;
          *(_WORD *)&v98[18] = 2112;
          *(void *)&v98[20] = v16;
          _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "%p (localHostUpdater) (rdar://133418257)  keeping alwaysOnSession:%{public}@ for updatedEnvironment:%@ withDelta:%@", buf, 0x2Au);
        }
        if (!v6) {
          goto LABEL_33;
        }
      }
      else
      {
        if (v14)
        {
          long long v21 = [(BLSBacklightSceneEnvironment_Private *)v73 identifier];
          int64_t v22 = BLSBacklightFBSSceneEnvironmentDeltaDescription();
          *(_DWORD *)buf = 134218754;
          v96 = self;
          __int16 v97 = 2114;
          *(void *)v98 = v74;
          *(_WORD *)&v98[8] = 2114;
          *(void *)&v98[10] = v21;
          *(_WORD *)&v98[18] = 2114;
          *(void *)&v98[20] = v22;
          _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "%p (localHostUpdater) destroying alwaysOnSession:%{public}@ for updatedEnvironment:%{public}@ withDelta:%{public}@", buf, 0x2Au);
        }
        [v74 invalidate];
        [(BLSBacklightSceneEnvironment_Private *)v73 setAlwaysOnSession:0];

        v74 = 0;
        if (!v6) {
          goto LABEL_33;
        }
      }
LABEL_29:
      [(BLSHLocalHostSceneEnvironmentUpdater *)self ensureInactiveEnvSessionCreated];
      goto LABEL_30;
    }

    v74 = 0;
LABEL_5:
    if (!v6)
    {
LABEL_33:
      uint64_t v23 = bls_environment_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v96 = self;
        _os_log_impl(&dword_21FCFC000, v23, OS_LOG_TYPE_INFO, "%p (localHostUpdater) updatedEnvironmentWithDelta: backlightSceneUpdate=nil", buf, 0xCu);
      }
      goto LABEL_58;
    }
    goto LABEL_29;
  }
  if ([(BLSHLocalHostSceneEnvironmentUpdater *)self ensureAlwaysOnSessionCreated])
  {
    uint64_t v17 = [(BLSBacklightSceneEnvironment_Private *)v73 alwaysOnSession];

    long long v18 = bls_environment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = [(BLSBacklightSceneEnvironment_Private *)v73 identifier];
      long long v20 = BLSBacklightFBSSceneEnvironmentDeltaDescription();
      *(_DWORD *)buf = 134218754;
      v96 = self;
      __int16 v97 = 2114;
      *(void *)v98 = v17;
      *(_WORD *)&v98[8] = 2114;
      *(void *)&v98[10] = v19;
      *(_WORD *)&v98[18] = 2114;
      *(void *)&v98[20] = v20;
      _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, "%p (localHostUpdater) created alwaysOnSession:%{public}@ for updatedEnvironment:%{public}@ withDelta:%{public}@", buf, 0x2Au);
    }
    v74 = (void *)v17;
  }

  [(BLSHLocalHostSceneEnvironmentUpdater *)self ensureInactiveEnvSessionCreated];
  if (!v6) {
    goto LABEL_33;
  }
LABEL_30:
  uint64_t v23 = [v6 context];
  id v24 = [v23 triggerEvent];
  id v25 = [v23 frameSpecifier];
  os_unfair_lock_lock(&self->_lock);
  id v26 = [(BLSBacklightSceneEnvironment_Private *)self->_localHostEnvironment identifier];
  v69 = self->_lock_inactiveEnvSession;
  v71 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveEnvSession presentation];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__9;
  v89 = __Block_byref_object_dispose__9;
  id v90 = 0;
  v27 = [v71 presentationEntries];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke;
  v79[3] = &unk_264534010;
  id v65 = v26;
  id v80 = v65;
  v83 = &v91;
  v84 = &v85;
  id v28 = v25;
  id v81 = v28;
  id v68 = v75;
  id v82 = v68;
  v66 = v27;
  v70 = objc_msgSend(v27, "bs_map:", v79);
  v29 = bls_environment_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = v28;
    objc_msgSend(v71, "bls_shortLoggingString");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    int v32 = *((unsigned __int8 *)v92 + 24);
    if (*((unsigned char *)v92 + 24))
    {
      objc_msgSend((id)v86[5], "bls_shortLoggingString");
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = @"(n/a)";
    }
    uint64_t v34 = [v30 description];
    *(_DWORD *)buf = 134219266;
    v96 = self;
    __int16 v97 = 1024;
    *(_DWORD *)v98 = v72;
    *(_WORD *)&v98[4] = 2048;
    *(void *)&v98[6] = v69;
    *(_WORD *)&v98[14] = 2114;
    *(void *)&v98[16] = v31;
    *(_WORD *)&v98[24] = 2114;
    *(void *)&v98[26] = v33;
    __int16 v99 = 2114;
    v100 = v34;
    _os_log_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_INFO, "%p (localHostUpdater) updatedEnvironmentWithDelta: doPerformEvent:%{BOOL}u inactiveEnvSession:%p presentation:%{public}@ %{public}@ -> %{public}@", buf, 0x3Au);
    if (v32) {

    }
    id v28 = v30;
  }

  v35 = [v28 presentationInterval];
  int v36 = [v35 startDate];
  v37 = +[BLSHPresentationDateSpecifier specifierWithPresentationDate:v36 specifiers:v70];

  os_unfair_lock_lock(&self->_lock);
  if (v72)
  {
    if (!v24)
    {
      unint64_t lock_nextEventID = self->_lock_nextEventID;
      self->_unint64_t lock_nextEventID = lock_nextEventID + 1;
      v39 = [v23 visualState];
      uint64_t v40 = BLSBacklightStateForVisuaState();

      uint64_t v41 = BLSBacklightActivityStateForBLSBacklightState();
      id v42 = objc_alloc(MEMORY[0x263F29978]);
      v43 = (void *)[objc_alloc(MEMORY[0x263F29980]) initWithRequestedActivityState:v41 explanation:@"createdLocalEvent — just added to presentation?" timestamp:mach_continuous_time() sourceEvent:10 sourceEventMetadata:0];
      id v24 = (id)[v42 initWithEventID:lock_nextEventID state:v40 previousState:v40 changeRequest:v43];

      v44 = bls_backlight_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v96 = self;
        __int16 v97 = 2114;
        *(void *)v98 = v24;
        *(_WORD *)&v98[8] = 2114;
        *(void *)&v98[10] = v68;
        _os_log_impl(&dword_21FCFC000, v44, OS_LOG_TYPE_INFO, "%p (localHostUpdater) created new triggerEvent:%{public}@ sceneUpdate:%{public}@", buf, 0x20u);
      }
    }
    v45 = self->_lock_sceneUpdateForPerformingEvent;
    objc_storeStrong((id *)&self->_lock_localTriggerEventForPerformingEvent, v24);
    objc_storeStrong((id *)&self->_lock_sceneUpdateForPerformingEvent, a4);
    v46 = self->_environmentStateMachine;
    os_unfair_lock_unlock(&self->_lock);
    v47 = bls_environment_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v96 = self;
      __int16 v97 = 2114;
      *(void *)v98 = v24;
      *(_WORD *)&v98[8] = 2114;
      *(void *)&v98[10] = v37;
      _os_log_debug_impl(&dword_21FCFC000, v47, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) calling [environmentStateMachine performEvent:withInitialSpecifier:performBacklightRamp:], event:%{public}@, dateSpecifier:%{public}@", buf, 0x20u);
    }

    if (v45)
    {
      [v68 setReplacedSceneUpdate:v45];
      v48 = bls_backlight_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v96 = self;
        __int16 v97 = 2114;
        *(void *)v98 = v45;
        *(_WORD *)&v98[8] = 2114;
        *(void *)&v98[10] = v68;
        _os_log_impl(&dword_21FCFC000, v48, OS_LOG_TYPE_INFO, "%p (localHostUpdater) replaced sceneUpdateForPerformingEvent:%{public}@ with new sceneUpdate:%{public}@", buf, 0x20u);
      }
    }
    else
    {
      v48 = bls_backlight_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:]();
      }
    }

    if (!v46)
    {
      v57 = [NSString stringWithFormat:@"Unexpected nil environmentStateMachine doPerformEvent=YES backlightSceneUpdate:%@", v68];
      v58 = &_os_log_internal;
      id v59 = &_os_log_internal;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v60 = (BLSHLocalHostSceneEnvironmentUpdater *)(id)objc_claimAutoreleasedReturnValue();
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        *(_DWORD *)buf = 138544642;
        v96 = v60;
        __int16 v97 = 2114;
        *(void *)v98 = v62;
        *(_WORD *)&v98[8] = 2048;
        *(void *)&v98[10] = self;
        *(_WORD *)&v98[18] = 2114;
        *(void *)&v98[20] = @"BLSHLocalHostSceneEnvironmentUpdater.m";
        *(_WORD *)&v98[28] = 1024;
        *(_DWORD *)&v98[30] = 535;
        __int16 v99 = 2114;
        v100 = v57;
        _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v57 UTF8String];
      uint64_t v63 = _bs_set_crash_log_message();
      -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:](v63);
    }
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_169;
    v76[3] = &unk_264532770;
    v76[4] = self;
    id v24 = v24;
    id v77 = v24;
    id v78 = v68;
    [(BLSHBacklightEnvironmentStateMachine *)v46 performEvent:v24 withInitialSpecifier:v37 performBacklightRamp:v76];
  }
  else
  {
    v45 = self->_environmentStateMachine;
    os_unfair_lock_unlock(&self->_lock);
    v49 = bls_environment_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.4();
    }

    if (!v45)
    {
      v50 = [NSString stringWithFormat:@"Unexpected nil environmentStateMachine doPerformEvent=NO backlightSceneUpdate:%@", v68];
      v51 = &_os_log_internal;
      id v52 = &_os_log_internal;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v53 = (BLSHLocalHostSceneEnvironmentUpdater *)(id)objc_claimAutoreleasedReturnValue();
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        *(_DWORD *)buf = 138544642;
        v96 = v53;
        __int16 v97 = 2114;
        *(void *)v98 = v55;
        *(_WORD *)&v98[8] = 2048;
        *(void *)&v98[10] = self;
        *(_WORD *)&v98[18] = 2114;
        *(void *)&v98[20] = @"BLSHLocalHostSceneEnvironmentUpdater.m";
        *(_WORD *)&v98[28] = 1024;
        *(_DWORD *)&v98[30] = 545;
        __int16 v99 = 2114;
        v100 = v50;
        _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v50 UTF8String];
      uint64_t v56 = _bs_set_crash_log_message();
      -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:](v56);
    }
    [(BLSBacklightSceneUpdate *)v45 updateToSpecifier:v37];
  }

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);

LABEL_58:
}

BLSHEnvironmentDateSpecifier *__89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 environment];
  char v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v6 = [v3 presentationDate];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [*(id *)(a1 + 40) presentationInterval];
    uint64_t v10 = [v9 startDate];

    char v11 = [*(id *)(a1 + 48) context];
    int v12 = [v11 visualState];
    uint64_t v13 = [v12 updateFidelity];

    BOOL v14 = [[BLSHEnvironmentDateSpecifier alloc] initWithPresentationDate:v10 fidelity:v13 environment:v3 userObject:*(void *)(a1 + 48)];
  }
  else
  {
    id v15 = *(void **)(a1 + 40);
    v16 = BLSHSubhostedEnvironmentIdentifierForEnvironment(v3);
    uint64_t v10 = [v15 entrySpecifierForTimelineIdentifier:v16];

    uint64_t v17 = [v10 timelineEntry];
    long long v18 = [v17 presentationTime];

    BOOL v14 = -[BLSHEnvironmentDateSpecifier initWithPresentationDate:fidelity:environment:userObject:]([BLSHEnvironmentDateSpecifier alloc], "initWithPresentationDate:fidelity:environment:userObject:", v18, [v10 grantedFidelity], v3, *(void *)(a1 + 48));
  }

  return v14;
}

uint64_t __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_169(uint64_t a1, double a2)
{
  char v4 = bls_environment_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_169_cold_1(a1, v4, a2);
  }

  return [*(id *)(a1 + 48) performBacklightRampWithDuration:a2];
}

- (void)performDesiredFidelityRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BLSHLocalHostSceneEnvironmentUpdater *)self ensureInactiveEnvSessionCreated];
  BOOL v5 = [(BLSHLocalHostSceneEnvironmentUpdater *)self ensureAlwaysOnSessionCreated];
  uint64_t v6 = self->_localHostEnvironment;
  uint64_t v7 = [(BLSBacklightSceneEnvironment_Private *)v6 alwaysOnSession];
  int v8 = bls_environment_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(BLSBacklightSceneEnvironment_Private *)v6 identifier];
    *(_DWORD *)buf = 134219266;
    BOOL v14 = self;
    __int16 v15 = 2114;
    id v16 = v4;
    __int16 v17 = 2114;
    long long v18 = v7;
    __int16 v19 = 2048;
    long long v20 = v6;
    __int16 v21 = 2114;
    int64_t v22 = v9;
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_INFO, "%p (localHostUpdater) performDesiredFidelityRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>, createdSession=%{BOOL}u", buf, 0x3Au);
  }
  uint64_t v10 = [(BLSBacklightSceneEnvironment_Private *)v6 delegate];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__BLSHLocalHostSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke;
    v11[3] = &unk_264534038;
    id v12 = v4;
    [(BLSHLocalHostSceneEnvironmentUpdater *)self aggregateDesiredFidelityForBacklightState:1 withCompletion:v11];
  }
  else
  {
    [v4 completeWithDesiredFidelity:1];
  }
}

uint64_t __70__BLSHLocalHostSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeWithDesiredFidelity:a2];
}

- (void)performFrameSpecifiersRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BLSHLocalHostSceneEnvironmentUpdater *)self ensureInactiveEnvSessionCreated];
  BOOL v5 = self->_localHostEnvironment;
  uint64_t v6 = [(BLSBacklightSceneEnvironment_Private *)v5 alwaysOnSession];
  uint64_t v7 = bls_environment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [v6 model];
    int v9 = [v8 specifierCount];
    uint64_t v10 = [(BLSBacklightSceneEnvironment_Private *)v5 identifier];
    *(_DWORD *)buf = 134219010;
    __int16 v19 = self;
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 1024;
    int v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "%p (localHostUpdater) performFrameSpecifiersRequest:%{public}@ session-model:%d environment:<%p %{public}@>", buf, 0x30u);
  }
  char v11 = [(BLSBacklightSceneEnvironment_Private *)v5 delegate];

  if (v11 && v6)
  {
    id v12 = [v4 dateInterval];
    uint64_t v13 = [v4 previousPresentationDate];
    uint64_t v14 = [v4 shouldReset];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__BLSHLocalHostSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke;
    v15[3] = &unk_264534060;
    id v16 = v6;
    id v17 = v4;
    [(BLSHLocalHostSceneEnvironmentUpdater *)self timelinesForDateInterval:v12 previousPresentationDate:v13 localHostEnvironment:v5 shouldReset:v14 completion:v15];
  }
  else
  {
    [v4 completeWithDateSpecifiers:MEMORY[0x263EFFA68]];
  }
}

uint64_t __70__BLSHLocalHostSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performFrameSpecifiersRequest:*(void *)(a1 + 40) timelines:a2];
}

- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = self->_lock_localTriggerEventForPerformingEvent;
  int v8 = v7;
  if (self->_lock_sceneUpdateForPerformingEvent) {
    BOOL v9 = [(BLSBacklightChangeEvent *)v7 state] == a4;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = bls_backlight_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromBLSBacklightState();
    *(_DWORD *)buf = 134218754;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 1024;
    BOOL v18 = v9;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) didBeginUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@", buf, 0x26u);
  }
  char v11 = self->_lock_sceneUpdateForPerformingEvent;
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    [(BLSBacklightSceneUpdate *)v11 sceneContentsDidUpdate];
    BSDispatchMain();
  }
}

void __86__BLSHLocalHostSceneEnvironmentUpdater_environmentStateMachine_didBeginUpdateToState___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (os_unfair_lock_s *)(v2 + 8);
  id v4 = *(id *)(v2 + 48);
  os_unfair_lock_unlock(v3);
  [v4 updaterDidBeginUpdateToBacklightState:*(void *)(a1 + 40)];
}

- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = self->_lock_localTriggerEventForPerformingEvent;
  int v8 = v7;
  if (self->_lock_sceneUpdateForPerformingEvent) {
    BOOL v9 = [(BLSBacklightChangeEvent *)v7 state] == a4;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = bls_backlight_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = NSStringFromBLSBacklightState();
    int v20 = 134218754;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    int v23 = v19;
    __int16 v24 = 1024;
    BOOL v25 = v9;
    __int16 v26 = 2114;
    v27 = v8;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) didCompleteUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@", (uint8_t *)&v20, 0x26u);
  }
  char v11 = self->_lock_sceneUpdateForPerformingEvent;
  if (v9)
  {
    lock_localTriggerEventForPerformingEvent = self->_lock_localTriggerEventForPerformingEvent;
    self->_lock_localTriggerEventForPerformingEvent = 0;

    lock_sceneUpdateForPerformingEvent = self->_lock_sceneUpdateForPerformingEvent;
    self->_lock_sceneUpdateForPerformingEvent = 0;

    os_unfair_lock_unlock(p_lock);
    uint64_t v14 = [(BLSBacklightSceneUpdate *)v11 context];
    int v15 = [v14 isAnimated];

    if (v15) {
      [(BLSBacklightSceneUpdate *)v11 sceneContentsAnimationDidComplete];
    }
    id v16 = [(BLSBacklightSceneUpdate *)v11 context];
    __int16 v17 = [v16 visualState];
    BLSBacklightStateForVisuaState();
    int IsActive = BLSBacklightStateIsActive();

    if (IsActive) {
      [(BLSHLocalHostSceneEnvironmentUpdater *)self destroyInactiveEnvSession];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_lock_inactiveEnvSession;
  BOOL v7 = [(BLSHBacklightEnvironmentPresentation *)self->_lock_updatingToPresentation isEqual:v5];
  lock_updatingToPresentation = self->_lock_updatingToPresentation;
  self->_lock_updatingToPresentation = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    BOOL v9 = v6;
    id v10 = v5;
    BSDispatchMain();
  }
}

uint64_t __88__BLSHLocalHostSceneEnvironmentUpdater_environmentStateMachine_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updaterDidUpdateToPresentation:*(void *)(a1 + 40)];
}

- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (!v6)
  {
LABEL_6:

    return;
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v7 = [v6 specifiers];
  int v8 = [v7 firstObject];
  BOOL v9 = [v8 userObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_unfair_lock_unlock(&self->_lock);
    id v10 = [v9 context];
    int v11 = [v10 isAnimated];

    if (v11) {
      [v9 sceneContentsAnimationDidComplete];
    }
    [v9 sceneContentsDidUpdate];

    goto LABEL_6;
  }
  id v12 = [NSString stringWithFormat:@"%p (localHostSceneEnvironmentUpdater) didUpdateToSpecifier: specifier %@ userObject %@ isn't a BLSBacklightSceneUpdate", self, v6, v9];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHLocalHostSceneEnvironmentUpdater environmentStateMachine:didUpdateToSpecifier:]();
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4
{
  uint64_t v14 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_inactiveEnvSession = self->_lock_inactiveEnvSession;
  if (lock_inactiveEnvSession != v14)
  {
    id v13 = [NSString stringWithFormat:@"session:%@ does not match _session:%@", v14, lock_inactiveEnvSession];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHLocalHostSceneEnvironmentUpdater inactiveEnvironmentSession:updateToPresentation:]();
    }
LABEL_14:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD5F7A0);
  }
  if (!self->_environmentStateMachine)
  {
    id v13 = [NSString stringWithFormat:@"session:%@ exists but no environment state machine", v14];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHLocalHostSceneEnvironmentUpdater inactiveEnvironmentSession:updateToPresentation:]();
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_lock_updatingToPresentation, a4);
  int v8 = self->_lock_sceneUpdateForPerformingEvent;
  BOOL v9 = [(BLSBacklightSceneUpdate *)v8 context];
  id v10 = [v9 visualState];
  if (v10)
  {
    uint64_t v11 = BLSBacklightStateForVisuaState();
  }
  else
  {
    id v12 = [(BLSBacklightSceneEnvironment_Private *)self->_localHostEnvironment visualState];
    uint64_t v11 = BLSBacklightStateForVisuaState();
  }
  os_unfair_lock_unlock(&self->_lock);
  [(BLSHBacklightEnvironmentStateMachine *)self->_environmentStateMachine setPresentation:v6 withTargetBacklightState:v11];
}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  inactiveBudgetPolicy = self->_inactiveBudgetPolicy;
  BOOL v9 = [(BLSHOSTimerProviding *)self->_osTimerProvider now];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__BLSHLocalHostSceneEnvironmentUpdater_hostEnvironment_invalidateContentForReason___block_invoke;
  v12[3] = &unk_2645327C0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(BLSHInactiveBudgetPolicing_Private *)inactiveBudgetPolicy invalidateAtRequestDate:v9 forEnvironment:v10 invalidationBlock:v12];
}

void __83__BLSHLocalHostSceneEnvironmentUpdater_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = NSString;
  id v5 = [*(id *)(a1 + 48) identifier];
  id v4 = [v3 stringWithFormat:@"%@ (env:%@)", v1, v5];
  [v2 invalidateAllTimelinesForReason:v4];
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAssertTester, 0);
  objc_storeStrong((id *)&self->_lock_localTriggerEventForPerformingEvent, 0);
  objc_storeStrong((id *)&self->_lock_sceneUpdateForPerformingEvent, 0);
  objc_storeStrong((id *)&self->_lock_timelinesCalculators, 0);
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_lock_updatingToPresentation, 0);
  objc_storeStrong((id *)&self->_lock_inactiveEnvSession, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_localHostEnvironment, 0);

  objc_storeStrong((id *)&self->_sessionProvider, 0);
}

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p (localHostUpdater) will start sceneUpdateForPerformingEvent:%{public}@");
}

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p (localHostUpdater) calling [environmentStateMachine updateToSpecifier:], dateSpecifier:%{public}@");
}

void __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_169_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 134218498;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) [environmentStateMachine performEvent:withInitialSpecifier:performBacklightRamp:] finished, event:%{public}@, duration:%1.1f", (uint8_t *)&v5, 0x20u);
}

- (void)environmentStateMachine:didUpdateToSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)inactiveEnvironmentSession:updateToPresentation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)inactiveEnvironmentSession:updateToPresentation:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end