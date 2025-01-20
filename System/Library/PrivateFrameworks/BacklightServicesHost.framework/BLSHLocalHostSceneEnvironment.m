@interface BLSHLocalHostSceneEnvironment
- (BLSHLocalHostSceneEnvironment)initWithBacklightSceneEnvironment:(id)a3;
- (BOOL)clientHasDelegate;
- (BOOL)clientSupportsAlwaysOn;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)hasVisualStateMistmach;
- (BOOL)isClientActive;
- (BOOL)isLiveUpdating;
- (id)presentationDate;
- (id)visualState;
- (void)clearPresentationDate;
- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6;
- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3;
- (void)setLiveUpdating:(BOOL)a3;
- (void)setUnrestrictedFramerateUpdates:(BOOL)a3;
- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4;
- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10;
@end

@implementation BLSHLocalHostSceneEnvironment

- (BLSHLocalHostSceneEnvironment)initWithBacklightSceneEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v12.receiver = self;
  v12.super_class = (Class)BLSHLocalHostSceneEnvironment;
  v6 = [(BLSHBaseSceneHostEnvironment *)&v12 initWithIdentifier:v5];

  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v6->_clientEnvironment, v4);
    uint64_t v7 = [v4 visualState];
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v7;

    uint64_t v9 = [v4 presentationDate];
    lock_presentationDate = v6->_lock_presentationDate;
    v6->_lock_presentationDate = (NSDate *)v9;

    [(BLSHBaseSceneHostEnvironment *)v6 setAlwaysOnEnabledForEnvironment:1];
  }

  return v6;
}

- (BOOL)hasVisualStateMistmach
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_visualStateMismatchStartTime != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)clientHasDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v3 = [WeakRetained delegate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isClientActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  char v3 = [WeakRetained isDelegateActive];

  return v3;
}

- (id)visualState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  char v3 = [WeakRetained supportsAlwaysOn];

  return v3;
}

- (BOOL)isLiveUpdating
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  char v3 = [WeakRetained isLiveUpdating];

  return v3;
}

- (void)setLiveUpdating:(BOOL)a3
{
  v5 = [NSString stringWithFormat:@"Shouldn't be called on this subclass"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v6 = NSStringFromSelector(a2);
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 138544642;
    v10 = v6;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BLSHLocalHostSceneEnvironment.m";
    __int16 v17 = 1024;
    int v18 = 67;
    __int16 v19 = 2114;
    v20 = v5;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v5 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  char v3 = [WeakRetained hasUnrestrictedFramerateUpdates];

  return v3;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  v5 = [NSString stringWithFormat:@"Shouldn't be called on this subclass"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v6 = NSStringFromSelector(a2);
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 138544642;
    v10 = v6;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BLSHLocalHostSceneEnvironment.m";
    __int16 v17 = 1024;
    int v18 = 75;
    __int16 v19 = 2114;
    v20 = v5;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v5 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)presentationDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)clearPresentationDate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = bls_environment_log();
  v5 = v4;
  lock_presentationDate = self->_lock_presentationDate;
  if (lock_presentationDate) {
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v4, v7))
  {
    v8 = [(NSDate *)lock_presentationDate bls_shortLoggingString];
    int v9 = 134218242;
    v10 = self;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    _os_log_impl(&dword_21FCFC000, v5, v7, "%p (localHostEnv) not clearing cached presentation date:%{public}@ (should be cleared later by host)", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  uint64_t v13 = [WeakRetained delegate];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke;
  v18[3] = &unk_2645340F8;
  id v19 = v10;
  id v20 = WeakRetained;
  id v21 = v9;
  id v22 = v11;
  id v14 = v11;
  id v15 = v9;
  id v16 = WeakRetained;
  id v17 = v10;
  [v13 environment:v16 timelinesForDateInterval:v15 previousSpecifier:0 completion:v18];
}

void __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(void *)(a1 + 32))
  {
    char v3 = [*(id *)(a1 + 40) alwaysOnSession];
    BOOL v4 = [v3 specifierForPresentationDate:*(void *)(a1 + 32)];
  }
  else
  {
    BOOL v4 = 0;
  }
  v5 = [MEMORY[0x263F29950] constructFrameSpecifiersForTimelines:v7 dateInterval:*(void *)(a1 + 48) shouldConstructStartSpecifier:1 framesPerSecond:v4 previousSpecifier:30.0];
  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_24);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F29940];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 presentationInterval];
  v6 = [v5 startDate];
  uint64_t v7 = [v3 requestedFidelity];

  v8 = (void *)[v4 initWithDate:v6 fidelity:v7];

  return v8;
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  p_clientEnvironment = &self->_clientEnvironment;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_clientEnvironment);
  v6 = [WeakRetained visualState];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 updateFidelity]);
}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v79 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  id v9 = [WeakRetained visualState];
  id v10 = [v7 userObject];
  SEL v76 = a2;
  v78 = v10;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = NSString;
      v46 = [(BLSHBaseSceneHostEnvironment *)self identifier];
      v47 = [v45 stringWithFormat:@"%p %@: userObject on %@ is not a BLSBacklightSceneUpdate", self, v46, v7];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.5();
      }
      [v47 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD646D0);
    }
    id v11 = [v10 context];
    id v10 = (void *)[v11 isAnimated];
    char v12 = [v11 isTouchTargetable];
    id v81 = [v11 previousVisualState];
    uint64_t v13 = [v11 triggerEvent];

    if (v13)
    {
      v48 = NSString;
      v49 = [(BLSHBaseSceneHostEnvironment *)self identifier];
      v50 = [v48 stringWithFormat:@"%p %@: trigger event should be nil", self, v49];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.4();
      }
      [v50 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD64744);
    }
    id v14 = [v11 visualState];
    char v15 = [v14 isEqual:v9];

    if ((v15 & 1) == 0)
    {
      v51 = NSString;
      v52 = [(BLSHBaseSceneHostEnvironment *)self identifier];
      v53 = [v11 visualState];
      v54 = [v51 stringWithFormat:@"%p %@: scene update visual state and clientEnvironment's visual state don't match: %@, %@", self, v52, v53, v9];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:]();
      }
      [v54 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD647D0);
    }
  }
  else
  {
    id v81 = v9;
    char v12 = 0;
  }
  id v16 = [WeakRetained alwaysOnSession];
  id v17 = [v7 date];
  int v18 = [v16 specifierForPresentationDate:v17];

  if (v18)
  {
    uint64_t v19 = [v18 grantedFidelity];
    if (v19 != [v7 fidelity])
    {
      v55 = NSString;
      v56 = [(BLSHBaseSceneHostEnvironment *)self identifier];
      [v18 grantedFidelity];
      v57 = NSStringFromBLSUpdateFidelity();
      [v7 fidelity];
      v58 = NSStringFromBLSUpdateFidelity();
      v59 = [v55 stringWithFormat:@"%p %@:frameSpecifier %@ grantedFidelity (%@) doesn't match dateSpecifier %@ fidelity (%@)", self, v56, v18, v57, v7, v58];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:]();
      }
      [v59 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD6487CLL);
    }
  }
  v77 = v16;
  id v20 = v79;
  BYTE1(v64) = 1;
  LOBYTE(v64) = v12;
  v80 = objc_msgSend(objc_alloc(MEMORY[0x263F29998]), "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", WeakRetained, v9, v81, v18, v10, 0, v64, v79, 0, 0);
  os_unfair_lock_lock(&self->_lock);
  id v21 = [v18 presentationInterval];
  id v22 = v21;
  v82 = v9;
  if (v21)
  {
    v23 = [v21 startDate];
    lock_presentationDate = self->_lock_presentationDate;
    self->_lock_presentationDate = v23;

    double v89 = 0.0;
    v25 = [WeakRetained presentationDate];
    char v26 = objc_msgSend(v22, "bls_containsDate:withEpsilon:outDelta:", v25, &v89, 0.0001);

    if ((v26 & 1) == 0)
    {
      v27 = bls_environment_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v74 = [WeakRetained identifier];
        v43 = @"early";
        if (v89 > 0.0) {
          v43 = @"late";
        }
        v68 = v43;
        if (v89 >= 0.0) {
          double v44 = v89;
        }
        else {
          double v44 = -v89;
        }
        v71 = objc_msgSend(v7, "bls_shortLoggingString");
        v67 = [WeakRetained frameSpecifier];
        v66 = objc_msgSend(v82, "bls_shortLoggingString");
        v65 = objc_msgSend(v82, "bls_shortLoggingString");
        *(_DWORD *)buf = 138544898;
        v91 = v74;
        __int16 v92 = 2112;
        v93 = v68;
        __int16 v94 = 2048;
        double v95 = v44;
        __int16 v96 = 2114;
        v97 = v71;
        __int16 v98 = 2114;
        v99 = v67;
        __int16 v100 = 2114;
        v101 = v66;
        __int16 v102 = 2114;
        v103 = v65;
        _os_log_fault_impl(&dword_21FCFC000, v27, OS_LOG_TYPE_FAULT, "updateToDateSpecifier: %{public}@ clientEnv.presentationDate too %@ for presentationInterval by %0.4fs dateSpecifier:%{public}@ clientEnv.frameSpecifier:%{public}@ visualState:%{public}@ clientEnv.visualState:%{public}@", buf, 0x48u);
      }
    }
    if (v7) {
      goto LABEL_14;
    }
  }
  else
  {
    v31 = [WeakRetained presentationDate];
    v32 = self->_lock_presentationDate;
    self->_lock_presentationDate = v31;

    if (v7)
    {
LABEL_14:
      uint64_t v28 = [v7 fidelity];
      if ([(BLSBacklightSceneVisualState *)self->_lock_visualState updateFidelity] != v28)
      {
        v29 = (BLSBacklightSceneVisualState *)[(BLSBacklightSceneVisualState *)self->_lock_visualState newVisualStateWithUpdateFidelity:v28];
        lock_visualState = self->_lock_visualState;
        self->_lock_visualState = v29;
      }
      goto LABEL_20;
    }
  }
  v33 = bls_environment_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
    -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:](self, (uint64_t)v80, v33);
  }

LABEL_20:
  v34 = self->_lock_visualState;
  if (([(BLSBacklightSceneVisualState *)v34 isEqual:v82] & 1) == 0)
  {
    v35 = bls_environment_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      v73 = [(BLSBacklightSceneVisualState *)v34 bls_shortLoggingString];
      v70 = [WeakRetained identifier];
      uint64_t v41 = objc_msgSend(v82, "bls_shortLoggingString");
      *(_DWORD *)buf = 138543874;
      v91 = v73;
      __int16 v92 = 2114;
      v93 = v70;
      __int16 v94 = 2114;
      double v95 = *(double *)&v41;
      v42 = (void *)v41;
      _os_log_fault_impl(&dword_21FCFC000, v35, OS_LOG_TYPE_FAULT, "hostSceneVisualState != clientEnvVisualState. visualState:%{public}@ clientEnvironment:%{public}@ clientEnvVisualState:%{public}@", buf, 0x20u);
    }
    if (os_variant_has_internal_diagnostics()
      && ([(BLSBacklightSceneVisualState *)v34 isEqual:v82] & 1) == 0)
    {
      v72 = NSString;
      v75 = [(BLSBacklightSceneVisualState *)v34 bls_shortLoggingString];
      v69 = [WeakRetained identifier];
      v60 = objc_msgSend(v82, "bls_shortLoggingString");
      v61 = [v72 stringWithFormat:@"visualState:%@ clientEnvironment:%@ clientEnvVisualState:%@", v75, v69, v60];

      BLSHRecordCriticalAssertFailure(v61);
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __76__BLSHLocalHostSceneEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke;
      v83[3] = &unk_264534120;
      v84 = v34;
      id v85 = WeakRetained;
      v87 = self;
      SEL v88 = v76;
      id v86 = v82;
      v62 = (void (**)(void))MEMORY[0x223C5E2B0](v83);
      if (BLSHIsUnitTestRunning())
      {
        v62[2](v62);
      }
      else
      {
        dispatch_time_t v63 = dispatch_time(0, 1000000000);
        dispatch_after(v63, MEMORY[0x263EF83A0], v62);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v36 = bls_environment_log();
  if ([(BLSHLocalHostSceneEnvironment *)self hasVisualStateMistmach]) {
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v36, v37))
  {
    v38 = [(BLSHBaseSceneHostEnvironment *)self identifier];
    v39 = [WeakRetained delegate];
    *(_DWORD *)buf = 134218754;
    v91 = self;
    __int16 v92 = 2114;
    v93 = v38;
    __int16 v94 = 2114;
    double v95 = *(double *)&v39;
    __int16 v96 = 2114;
    v97 = v80;
    _os_log_impl(&dword_21FCFC000, v36, v37, "%p (localHostEnv) updateToDateSpecifier: calling performBacklightSceneUpdate: on delegate for %{public}@ %{public}@ with %{public}@", buf, 0x2Au);

    id v20 = v79;
  }

  v40 = [WeakRetained delegate];
  [v40 environment:WeakRetained performBacklightSceneUpdate:v80];
}

void __76__BLSHLocalHostSceneEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  id v3 = NSString;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
  id v5 = [*(id *)(a1 + 40) identifier];
  v6 = objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
  id v7 = [v3 stringWithFormat:@"visualState:%@ clientEnvironment:%@ clientEnvVisualState:%@", v4, v5, v6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544642;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    char v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = @"BLSHLocalHostSceneEnvironment.m";
    __int16 v20 = 1024;
    int v21 = 168;
    __int16 v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  BOOL v87 = a5;
  uint64_t v107 = *MEMORY[0x263EF8340];
  v91 = (__CFString *)a3;
  id v16 = a4;
  id v89 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v90 = v16;
  int v21 = [v16 userObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v71 = NSString;
    v72 = [WeakRetained identifier];
    v73 = [v71 stringWithFormat:@"%p %@: userObject on %@ is not a BLSBacklightSceneUpdate", self, v72, v90];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHLocalHostSceneEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:]();
    }
    [v73 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD6529CLL);
  }
  id obj = a3;
  v83 = v21;
  [v21 context];
  v23 = id v22 = v17;
  uint64_t v24 = [v23 previousVisualState];

  v25 = [WeakRetained alwaysOnSession];
  char v26 = [v90 date];
  id v81 = v25;
  v27 = [v25 specifierForPresentationDate:v26];

  id v28 = objc_alloc(MEMORY[0x263F29998]);
  id v84 = v18;
  id v86 = v22;
  LOWORD(v74) = a7;
  v82 = (void *)v24;
  uint64_t v29 = v24;
  v30 = v27;
  SEL v88 = objc_msgSend(v28, "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", WeakRetained, v91, v29, v27, v87, v89, v74, v22, v18, v19);
  os_unfair_lock_lock(&self->_lock);
  v31 = [v27 presentationInterval];
  id v79 = v31;
  v80 = v19;
  if (v31)
  {
    v32 = v31;
    v33 = [v31 startDate];
    lock_presentationDate = self->_lock_presentationDate;
    self->_lock_presentationDate = v33;

    double v92 = 0.0;
    v35 = [WeakRetained presentationDate];
    char v36 = objc_msgSend(v32, "bls_containsDate:withEpsilon:outDelta:", v35, &v92, 0.0001);

    if ((v36 & 1) == 0)
    {
      os_log_type_t v37 = bls_environment_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v77 = [WeakRetained identifier];
        if (v92 <= 0.0) {
          v65 = @"early";
        }
        else {
          v65 = @"late";
        }
        if (v92 >= 0.0) {
          double v66 = v92;
        }
        else {
          double v66 = -v92;
        }
        v75 = objc_msgSend(v90, "bls_shortLoggingString");
        v67 = [WeakRetained frameSpecifier];
        v68 = [(__CFString *)v91 bls_shortLoggingString];
        SEL v76 = [WeakRetained visualState];
        uint64_t v69 = objc_msgSend(v76, "bls_shortLoggingString");
        *(_DWORD *)buf = 138544898;
        __int16 v94 = v77;
        __int16 v95 = 2112;
        __int16 v96 = v65;
        __int16 v97 = 2048;
        double v98 = v66;
        __int16 v99 = 2114;
        __int16 v100 = v75;
        __int16 v101 = 2114;
        __int16 v102 = v67;
        __int16 v103 = 2114;
        uint64_t v104 = v68;
        __int16 v105 = 2114;
        uint64_t v106 = v69;
        v70 = (void *)v69;
        _os_log_fault_impl(&dword_21FCFC000, v37, OS_LOG_TYPE_FAULT, "updateToVisualState: %{public}@ clientEnv.presentationDate too %@ for presentationInterval by %0.4fs presentationDateSpecifier:%{public}@ clientEnv.frameSpecifier:%{public}@ visualState:%{public}@ clientEnv.visualState:%{public}@", buf, 0x48u);
      }
    }
  }
  else
  {
    v38 = [WeakRetained presentationDate];
    v39 = self->_lock_presentationDate;
    self->_lock_presentationDate = v38;
  }
  lock_visualStateMismatchStartTime = self->_lock_visualStateMismatchStartTime;
  uint64_t v41 = [WeakRetained visualState];
  int v42 = [(__CFString *)v91 isEssentiallyEqualToVisualState:v41];

  v43 = self->_lock_visualStateMismatchStartTime;
  if (lock_visualStateMismatchStartTime && v42)
  {
    double v44 = self->_lock_visualStateMismatchStartTime;
    self->_lock_visualStateMismatchStartTime = 0;
  }
  else
  {
    if (lock_visualStateMismatchStartTime) {
      char v45 = 1;
    }
    else {
      char v45 = v42;
    }
    if (v45)
    {
      v46 = v83;
      v47 = v84;
      v48 = obj;
      goto LABEL_17;
    }
    [MEMORY[0x263EFF910] now];
    v49 = v30;
    v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v51 = self->_lock_visualStateMismatchStartTime;
    self->_lock_visualStateMismatchStartTime = v50;

    v52 = v50;
    v30 = v49;
    double v44 = v43;
    v43 = v52;
  }
  v47 = v84;
  v48 = obj;

  v46 = v83;
LABEL_17:
  objc_storeStrong((id *)&self->_lock_visualState, v48);
  os_unfair_lock_unlock(&self->_lock);
  if (v42)
  {
    if (!lock_visualStateMismatchStartTime) {
      goto LABEL_27;
    }
    v53 = bls_environment_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [(NSDate *)v43 bls_loggingString];
      *(_DWORD *)buf = 134218498;
      __int16 v94 = self;
      __int16 v95 = 2114;
      __int16 v96 = v54;
      __int16 v97 = 2114;
      double v98 = *(double *)&v91;
      _os_log_impl(&dword_21FCFC000, v53, OS_LOG_TYPE_DEFAULT, "%p: (localhostEnv) resolved visualStateMismatch from %{public}@ to %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v55 = bls_environment_log();
    v53 = v55;
    if (lock_visualStateMismatchStartTime) {
      os_log_type_t v56 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v56 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v55, v56))
    {
      [WeakRetained visualState];
      v57 = id v85 = v30;
      [WeakRetained identifier];
      v59 = v58 = v43;
      v60 = [(NSDate *)v58 bls_loggingString];
      *(_DWORD *)buf = 134219010;
      __int16 v94 = self;
      __int16 v95 = 2112;
      __int16 v96 = v91;
      __int16 v97 = 2112;
      double v98 = *(double *)&v57;
      __int16 v99 = 2112;
      __int16 v100 = v59;
      __int16 v101 = 2114;
      __int16 v102 = v60;
      _os_log_impl(&dword_21FCFC000, v53, v56, "%p (localHostEnv) new visualState %@ is not the same as visualState from clientEnvironment: %@, %@ mismatch began at %{public}@", buf, 0x34u);

      v43 = v58;
      v30 = v85;
    }
  }

LABEL_27:
  v61 = bls_environment_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    dispatch_time_t v63 = [(BLSHBaseSceneHostEnvironment *)self identifier];
    uint64_t v64 = [WeakRetained delegate];
    *(_DWORD *)buf = 134218754;
    __int16 v94 = self;
    __int16 v95 = 2114;
    __int16 v96 = v63;
    __int16 v97 = 2114;
    double v98 = *(double *)&v64;
    __int16 v99 = 2114;
    __int16 v100 = v88;
    _os_log_debug_impl(&dword_21FCFC000, v61, OS_LOG_TYPE_DEBUG, "%p (localHostEnv) updateToVisualState: calling performBacklightSceneUpdate: on delegate for %{public}@ %{public}@ with %{public}@", buf, 0x2Au);
  }
  v62 = [WeakRetained delegate];
  [v62 environment:WeakRetained performBacklightSceneUpdate:v88];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_visualStateMismatchStartTime, 0);
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);

  objc_destroyWeak((id *)&self->_clientEnvironment);
}

- (void)updateToDateSpecifier:(NSObject *)a3 sceneContentsUpdated:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = [a1 identifier];
  int v7 = 134218498;
  v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_fault_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_FAULT, "%p: (localHostEnv) updateToDateSpecifier: got nil dateSpecifier for %{public}@ sceneUpdate:%{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.5()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end