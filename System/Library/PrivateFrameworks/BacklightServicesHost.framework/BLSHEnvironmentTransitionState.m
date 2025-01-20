@interface BLSHEnvironmentTransitionState
+ (id)createStateForEnvironment:(id)a3 delegate:(id)a4;
- (BLSHBacklightSceneHostEnvironment)environment;
- (BOOL)isAnimating;
- (BOOL)isUpdatedToBacklightState:(int64_t)a3;
- (BOOL)isUpdatingInitialState;
- (BOOL)isUpdatingVisualState;
- (BOOL)performBacklightRampIfPendingForReason:(id)a3;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (id)debugDescription;
- (id)description;
- (id)descriptionAbbreviated:(uint64_t)a1;
- (id)initWithEnvironment:(void *)a3 delegate:;
- (id)visualStateForBacklightState:(uint64_t)a3 requestedFidelity:;
- (void)animationCompleteToTarget:(void *)a3 forEvent:(int)a4 animated:;
- (void)dealloc;
- (void)sceneContentsUpdatedToTarget:(void *)a3 forEvent:(int)a4 animated:;
- (void)updateToBacklightState:(int64_t)a3 forEvent:(id)a4 touchTargetable:(BOOL)a5 presentationDate:(id)a6 sceneUpdate:(id)a7 performBacklightRamp:(id)a8;
- (void)updateToDateSpecifier:(id)a3;
- (void)updateToTarget:(unsigned int)a3 touchTargetable:(void *)a4 presentationDate:(void *)a5 sceneUpdate:(uint64_t)a6 requestedFidelity:;
@end

@implementation BLSHEnvironmentTransitionState

+ (id)createStateForEnvironment:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[BLSHEnvironmentTransitionState initWithEnvironment:delegate:]((id *)[BLSHEnvironmentTransitionState alloc], v6, v5);

  return v7;
}

- (id)initWithEnvironment:(void *)a3 delegate:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)BLSHEnvironmentTransitionState;
    v8 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 0;
      objc_storeStrong(v8 + 9, a2);
      objc_storeStrong(a1 + 2, a3);
      v9 = bls_scenes_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BLSHEnvironmentTransitionState initWithEnvironment:delegate:]((uint64_t)a1, a1 + 9);
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  v1 = [*(id *)(a1 + 72) identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v2, v3, "ETS:%p:%{public}@ transitionState dealloc", v4, v5, v6, v7, 2u);
}

- (id)bls_loggingString
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 0);
}

- (id)descriptionAbbreviated:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = objc_opt_new();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__BLSHEnvironmentTransitionState_descriptionAbbreviated___block_invoke;
    v8[3] = &unk_2645326F8;
    id v9 = v4;
    uint64_t v10 = a1;
    char v11 = a2;
    id v5 = v4;
    [v5 appendProem:0 block:v8];
    uint64_t v6 = [v5 description];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)bls_shortLoggingString
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 1);
}

- (id)description
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 0);
}

id __57__BLSHEnvironmentTransitionState_descriptionAbbreviated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 72) identifier];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = @"<NULL>";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 40));
  [v2 appendString:v5 withName:v6];

  uint64_t v7 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v7 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"animating" withName:0];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8)
  {
    id v9 = (id)[*(id *)(a1 + 32) appendObject:v8 withName:@"->"];
    uint64_t v7 = *(void *)(a1 + 40);
  }
  id result = *(id *)(v7 + 32);
  if (result)
  {
    int v11 = [result didUpdateInitialState];
    int v12 = [*(id *)(*(void *)(a1 + 40) + 32) didCompleteAnimation];
    v13 = @"-->";
    if ((v11 & v12) != 0) {
      v13 = @"->|";
    }
    if ((v11 | v12 ^ 1) == 1) {
      v14 = v13;
    }
    else {
      v14 = @"-()->";
    }
    if (v11) {
      BOOL v15 = v12 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15) {
      v16 = @"-•->";
    }
    else {
      v16 = v14;
    }
    id result = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:v16];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v17)
    {
      id v18 = (id)[*(id *)(a1 + 32) appendObject:v17 withName:@"completedOld"];
      if (*(void *)(*(void *)(a1 + 40) + 48)) {
        v19 = *(__CFString **)(*(void *)(a1 + 40) + 48);
      }
      else {
        v19 = @"<NULL>";
      }
      return (id)[*(id *)(a1 + 32) appendObject:v19 withName:@"newPending"];
    }
  }
  return result;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_lock_animating withName:@"animating"];
  id v5 = (id)[v3 appendObject:self->_lock_requestingFidelityTarget withName:@"requestingFidelityTarget" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_lock_inProgressUpdateTarget withName:@"inProgressUpdateTarget" skipIfNil:1];
  uint64_t v7 = [(BLSHBacklightSceneHostEnvironment *)self->_environment debugDescription];
  id v8 = (id)[v3 appendObject:v7 withName:@"environment"];

  id v9 = [NSString stringWithFormat:@"<%p:%@>", self->_delegate, objc_opt_class()];
  [v3 appendString:v9 withName:@"delegate"];

  uint64_t v10 = [(BLSHEnvironmentTransitionStateTarget *)self->_lock_animationCompletedForOldTarget debugDescription];
  id v11 = (id)[v3 appendObject:v10 withName:@"completed" skipIfNil:1];

  int v12 = [(BLSHEnvironmentTransitionStateTarget *)self->_lock_animationCompletedWithNewTarget debugDescription];
  id v13 = (id)[v3 appendObject:v12 withName:@"wasPending" skipIfNil:1];

  v14 = [v3 build];

  return v14;
}

- (BOOL)isUpdatingInitialState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_requestingFidelityTarget)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    lock_inProgressUpdateTarget = self->_lock_inProgressUpdateTarget;
    if (lock_inProgressUpdateTarget) {
      BOOL v4 = ![(BLSHEnvironmentTransitionStateTarget *)lock_inProgressUpdateTarget didUpdateInitialState];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isUpdatingVisualState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_inProgressUpdateTarget) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = self->_lock_requestingFidelityTarget != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isAnimating
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_animating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatedToBacklightState:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(BLSHBacklightSceneHostEnvironment *)self->_environment clientHasDelegate])
  {
    id v5 = [(BLSHBacklightSceneHostEnvironment *)self->_environment visualState];
    id v6 = -[BLSHEnvironmentTransitionState visualStateForBacklightState:requestedFidelity:]((uint64_t)self, a3, [v5 updateFidelity]);
    char v7 = [v6 isEqual:v5];

    return v7;
  }
  else
  {
    id v9 = bls_scenes_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      environment = self->_environment;
      id v11 = NSStringFromBLSBacklightState();
      int v12 = 134218498;
      id v13 = self;
      __int16 v14 = 2114;
      BOOL v15 = environment;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, "ETS:%p: client is disabled for %{public}@, so considering updated to state:%{public}@", (uint8_t *)&v12, 0x20u);
    }
    return 1;
  }
}

- (id)visualStateForBacklightState:(uint64_t)a3 requestedFidelity:
{
  if (a1)
  {
    id v6 = *(void **)(a1 + 72);
    char v7 = [*(id *)(a1 + 16) inactiveBudgetPolicy];
    id v8 = [*(id *)(a1 + 16) osTimerProvider];
    id v9 = BLSVisualStateForBacklightState(a2, a3, v6, v7, v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)updateToBacklightState:(int64_t)a3 forEvent:(id)a4 touchTargetable:(BOOL)a5 presentationDate:(id)a6 sceneUpdate:(id)a7 performBacklightRamp:(id)a8
{
  id v26 = a6;
  id v13 = a7;
  id v14 = a8;
  id v15 = a4;
  os_unfair_lock_lock(&self->_lock);
  __int16 v16 = [BLSHEnvironmentTransitionStateTarget alloc];
  unint64_t v17 = self->_lock_nextSequenceID + 1;
  self->_lock_nextSequenceID = v17;
  uint64_t v18 = [(BLSHBacklightSceneHostEnvironment *)self->_environment identifier];
  unint64_t v19 = v17;
  int64_t v20 = a3;
  v21 = [(BLSHEnvironmentTransitionStateTarget *)v16 initWithSequenceID:v19 backlightState:a3 triggerEvent:v15 backlightRampBlock:v14 forIdentifier:v18 previousTarget:self->_lock_requestingFidelityTarget];

  objc_storeStrong((id *)&self->_lock_requestingFidelityTarget, v21);
  os_unfair_lock_unlock(&self->_lock);
  environment = self->_environment;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __132__BLSHEnvironmentTransitionState_updateToBacklightState_forEvent_touchTargetable_presentationDate_sceneUpdate_performBacklightRamp___block_invoke;
  v28[3] = &unk_264532720;
  v28[4] = self;
  v29 = v21;
  BOOL v32 = a5;
  id v30 = v26;
  id v31 = v13;
  id v23 = v13;
  id v24 = v26;
  v25 = v21;
  BLSHGetRequestedFidelityForBacklightState(v20, environment, v28);
}

void __132__BLSHEnvironmentTransitionState_updateToBacklightState_forEvent_touchTargetable_presentationDate_sceneUpdate_performBacklightRamp___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)updateToTarget:(unsigned int)a3 touchTargetable:(void *)a4 presentationDate:(void *)a5 sceneUpdate:(uint64_t)a6 requestedFidelity:
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v67 = a4;
  id v65 = a5;
  if (a1)
  {
    v70 = [v10 triggerEvent];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v68 = *(id *)(a1 + 24);
    if (v68 == v10)
    {
      id v11 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
    v69 = -[BLSHEnvironmentTransitionState visualStateForBacklightState:requestedFidelity:](a1, [v10 backlightState], a6);
    obj = [[BLSHEnvironmentTransitionStateTarget alloc] initWithTarget:v10 visualState:v69 presentationDate:v67];
    int v12 = [*(id *)(a1 + 72) visualState];
    id v13 = [*(id *)(a1 + 72) presentationDate];
    BOOL v14 = [(BLSHEnvironmentTransitionStateTarget *)obj isEqualToVisualState:v12 presentationDate:v13];

    id v15 = *(id *)(a1 + 32);
    if (v70)
    {
      int v16 = [v70 isEnvironmentTransitionAnimated];
      if (v15)
      {
LABEL_6:
        unint64_t v17 = [v15 visualState];
        uint64_t v18 = [v15 presentationDate];
        int v19 = [(BLSHEnvironmentTransitionStateTarget *)obj isEqualToVisualState:v17 presentationDate:v18];

        goto LABEL_9;
      }
    }
    else
    {
      int v16 = 0;
      if (v15) {
        goto LABEL_6;
      }
    }
    int v19 = 0;
LABEL_9:
    int v20 = *(unsigned __int8 *)(a1 + 64);
    if (*(unsigned char *)(a1 + 64))
    {
      if (v70)
      {
        uint64_t v21 = [v70 previousState];
        BOOL v22 = v21 == [(BLSHEnvironmentTransitionStateTarget *)obj backlightState];
        int v23 = v22;
        if (v22 || ((v16 ^ 1) & 1) != 0) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      int v23 = 1;
    }
    else
    {
      if (v16)
      {
LABEL_15:
        int v23 = [*(id *)(a1 + 72) isAlwaysOnEnabledForEnvironment];
        goto LABEL_18;
      }
      int v23 = 0;
    }
LABEL_18:
    if (v15) {
      int v24 = v19;
    }
    else {
      int v24 = 1;
    }
    unsigned int v64 = v23;
    if ((v14 & v24) == 1)
    {
      if (v20) {
        int v25 = v23 ^ 1;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 1;
    }
    v66 = [*(id *)(a1 + 72) identifier];
    if (v68 != v10)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      id v26 = bls_scenes_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = [(BLSHEnvironmentTransitionStateTarget *)obj pendingBacklightRamp];
        *(_DWORD *)buf = 134219522;
        uint64_t v88 = a1;
        __int16 v89 = 2114;
        v90 = v66;
        __int16 v91 = 2114;
        v92 = obj;
        __int16 v93 = 2114;
        *(void *)v94 = v68;
        *(_WORD *)&v94[8] = 1024;
        *(_DWORD *)v95 = [v27 hasPendingRamp];
        *(_WORD *)&v95[4] = 2114;
        *(void *)v96 = v70;
        *(_WORD *)&v96[8] = 1024;
        *(_DWORD *)v97 = v25;
        _os_log_impl(&dword_21FCFC000, v26, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ will skip update to oldTarget:%{public}@ was replaced with newPartialTarget:%{public}@ hadBacklightRamp:%{BOOL}u oldEvent:%{public}@ wouldTransitionHaveBeenNeeded:%{BOOL}U", buf, 0x40u);
      }
      goto LABEL_61;
    }
    if (v25)
    {
      objc_storeStrong((id *)(a1 + 32), obj);
      *(unsigned char *)(a1 + 64) = v64;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v28 = bls_scenes_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v51 = [(BLSHEnvironmentTransitionStateTarget *)obj pendingBacklightRamp];
        int v52 = [v51 hasPendingRamp];
        v53 = objc_msgSend(v70, "bls_shortLoggingString");
        *(_DWORD *)buf = 134219778;
        uint64_t v88 = a1;
        __int16 v89 = 2114;
        v90 = v66;
        __int16 v91 = 2114;
        v92 = obj;
        __int16 v93 = 1024;
        *(_DWORD *)v94 = v15 != 0;
        *(_WORD *)&v94[4] = 1024;
        *(_DWORD *)&v94[6] = v64;
        *(_WORD *)v95 = 1024;
        *(_DWORD *)&v95[2] = v52;
        *(_WORD *)v96 = 2114;
        *(void *)&v96[2] = v53;
        *(_WORD *)v97 = 1024;
        *(_DWORD *)&v97[2] = a3;
        _os_log_debug_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ will update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u", buf, 0x42u);
      }
      objc_initWeak((id *)buf, (id)a1);
      v62 = objc_msgSend(objc_alloc(MEMORY[0x263F29940]), "initWithDate:fidelity:userObject:", v67, objc_msgSend(v69, "updateFidelity"), v65);
      id v29 = v70;
      [v29 eventID];
      [v29 state];
      BLSEncode4Chars();
      BLSEncode4Chars();
      kdebug_trace();

      id v30 = *(void **)(a1 + 72);
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke;
      v81[3] = &unk_264532748;
      id v31 = v29;
      id v82 = v31;
      BOOL v32 = v66;
      v83 = v32;
      char v86 = v64;
      v33 = obj;
      v84 = v33;
      objc_copyWeak(&v85, (id *)buf);
      v34 = (id *)v64;
      if (v64)
      {
        v60 = [(BLSHEnvironmentTransitionStateTarget *)v33 pendingBacklightRamp];
        int v61 = [v60 hasPendingRamp];
        if (v61)
        {
          v35 = v77;
          v77[0] = MEMORY[0x263EF8330];
          v77[1] = 3221225472;
          v77[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_2;
          v77[3] = &unk_264532770;
          v55 = &v78;
          id v78 = v31;
          v56 = (id *)&v79;
          v79 = v32;
          v57 = (id *)&v80;
          v80 = v33;
        }
        else
        {
          v35 = 0;
        }
        v38 = v72;
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_3;
        v72[3] = &unk_264532798;
        id v73 = v31;
        v74 = v32;
        v34 = &v76;
        objc_copyWeak(&v76, (id *)buf);
        v58 = &v73;
        v59 = (id *)&v74;
        BOOL v32 = (id *)v75;
        v75[0] = v33;
        v75[1] = a1;
      }
      else
      {
        v35 = 0;
        int v61 = 0;
        v38 = 0;
      }
      [v30 updateToVisualState:v69 presentationDateSpecifier:v62 animated:v64 triggerEvent:v31 touchTargetable:a3 sceneContentsUpdated:v81 performBacklightRamp:v35 animationComplete:v38];
      if (v64)
      {

        objc_destroyWeak(v34);
      }
      if (v61)
      {
      }
      objc_destroyWeak(&v85);

      objc_destroyWeak((id *)buf);
      goto LABEL_61;
    }
    v36 = bls_scenes_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = [(BLSHEnvironmentTransitionStateTarget *)obj pendingBacklightRamp];
      *(_DWORD *)buf = 134220034;
      uint64_t v88 = a1;
      __int16 v89 = 2114;
      v90 = v66;
      __int16 v91 = 2114;
      v92 = obj;
      __int16 v93 = 1024;
      *(_DWORD *)v94 = v15 != 0;
      *(_WORD *)&v94[4] = 1024;
      *(_DWORD *)&v94[6] = v64;
      *(_WORD *)v95 = 1024;
      *(_DWORD *)&v95[2] = [v37 hasPendingRamp];
      *(_WORD *)v96 = 2114;
      *(void *)&v96[2] = v70;
      *(_WORD *)v97 = 1024;
      *(_DWORD *)&v97[2] = a3;
      __int16 v98 = 2114;
      id v99 = v15;
      _os_log_impl(&dword_21FCFC000, v36, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ redundant update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u existingInProgress:%{public}@", buf, 0x4Cu);
    }
    if (v15)
    {
      if ((v19 & 1) == 0)
      {
        v54 = [NSString stringWithFormat:@"ETS:%p:%@ targetMatchesInProgress=NO — redundant update to target:%@ wasUpdating:%u animated:%u event:%@ touchTarget:%u existingInProgress:%@", a1, v66, obj, 1, v64, v70, a3, v15];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHEnvironmentTransitionState updateToTarget:touchTargetable:presentationDate:sceneUpdate:requestedFidelity:](sel_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity_, a1, (uint64_t)v54);
        }
        [v54 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD0D9D4);
      }
      objc_msgSend(v15, "setBacklightState:", -[BLSHEnvironmentTransitionStateTarget backlightState](obj, "backlightState"));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (![v15 didUpdateInitialState])
      {
LABEL_45:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        id v42 = *(id *)(a1 + 32);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        if (v42 == v15)
        {
          v46 = [(BLSHEnvironmentTransitionStateTarget *)obj pendingBacklightRamp];
          v47 = v46;
          double v48 = 0.0;
          if (v64) {
            double v48 = 0.5;
          }
          [v46 performBacklightRampIfNeededWithDuration:v48];

          if (v15) {
            goto LABEL_53;
          }
          [(BLSHEnvironmentTransitionStateTarget *)obj setDidCompleteAnimation:1];
          v49 = *(void **)(a1 + 16);
          uint64_t v50 = [(BLSHEnvironmentTransitionStateTarget *)obj backlightState];
          v43 = [(BLSHEnvironmentTransitionStateTarget *)obj visualState];
          [v49 transitionState:a1 didCompleteUpdateToBacklightState:v50 visualState:v43];
        }
        else
        {
          v43 = bls_scenes_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = [(BLSHEnvironmentTransitionStateTarget *)obj pendingBacklightRamp];
            int v45 = [v44 hasPendingRamp];
            *(_DWORD *)buf = 134220290;
            uint64_t v88 = a1;
            __int16 v89 = 2114;
            v90 = v66;
            __int16 v91 = 2114;
            v92 = obj;
            __int16 v93 = 1024;
            *(_DWORD *)v94 = v15 != 0;
            *(_WORD *)&v94[4] = 1024;
            *(_DWORD *)&v94[6] = v64;
            *(_WORD *)v95 = 1024;
            *(_DWORD *)&v95[2] = v45;
            *(_WORD *)v96 = 2114;
            *(void *)&v96[2] = v70;
            *(_WORD *)v97 = 1024;
            *(_DWORD *)&v97[2] = a3;
            __int16 v98 = 2114;
            id v99 = v15;
            __int16 v100 = 2114;
            id v101 = v42;
            _os_log_impl(&dword_21FCFC000, v43, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ (now obsolete - will not call backlight ramp or animation completion) redundant update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u oldInProgress:%{public}@ currentInProgress:%{public}@", buf, 0x56u);
          }
        }

LABEL_53:
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    [(BLSHEnvironmentTransitionStateTarget *)obj setDidUpdateInitialState:1];
    v39 = *(void **)(a1 + 16);
    uint64_t v40 = [(BLSHEnvironmentTransitionStateTarget *)obj backlightState];
    v41 = [(BLSHEnvironmentTransitionStateTarget *)obj visualState];
    [v39 transitionState:a1 didBeginUpdateToBacklightState:v40 visualState:v41];

    goto LABEL_45;
  }
LABEL_62:
}

- (BOOL)performBacklightRampIfPendingForReason:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_lock_inProgressUpdateTarget;
  id v6 = [(BLSHEnvironmentTransitionStateTarget *)v5 pendingBacklightRamp];
  char v7 = [v6 hasPendingRamp];

  if ((v7 & 1) == 0)
  {
    id v8 = self->_lock_requestingFidelityTarget;

    id v5 = v8;
  }
  id v9 = [(BLSHEnvironmentTransitionStateTarget *)v5 triggerEvent];
  int v10 = [v9 isEnvironmentTransitionAnimated];

  os_unfair_lock_unlock(&self->_lock);
  if (v10) {
    double v11 = 0.5;
  }
  else {
    double v11 = 0.0;
  }
  int v12 = [(BLSHEnvironmentTransitionStateTarget *)v5 pendingBacklightRamp];
  int v13 = [v12 performBacklightRampIfNeededWithDuration:v11];

  if (v13)
  {
    BOOL v14 = bls_scenes_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [(BLSHBacklightSceneHostEnvironment *)self->_environment identifier];
      int v17 = 134219010;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      int v20 = v15;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = v11;
      __int16 v25 = 2114;
      id v26 = v5;
      _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ (%@) did perform backlightRamp duration:%.2f to target:%{public}@ ", (uint8_t *)&v17, 0x34u);
    }
  }

  return v13;
}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  [v2 eventID];
  [v2 state];
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = [*(id *)(a1 + 48) pendingBacklightRamp];
    [v3 performBacklightRampIfNeededWithDuration:0.0];
  }
  [*(id *)(a1 + 48) setDidUpdateInitialState:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[BLSHEnvironmentTransitionState sceneContentsUpdatedToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
  if (*(unsigned char *)(a1 + 64))
  {
    if (![*(id *)(a1 + 48) didCompleteAnimation]) {
      goto LABEL_8;
    }
    BOOL v4 = *(unsigned char *)(a1 + 64) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  -[BLSHEnvironmentTransitionState animationCompleteToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), v4);
LABEL_8:
}

- (void)sceneContentsUpdatedToTarget:(void *)a3 forEvent:(int)a4 animated:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 24);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    double v11 = bls_scenes_log();
    int v12 = v11;
    BOOL v13 = v9 == v7 && v10 == 0;
    if (v13) {
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    }
    else {
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
    }
    if (os_log_type_enabled(v11, v14))
    {
      [(id)a1 environment];
      v16 = int v15 = a4;
      int v17 = [v16 identifier];
      *(_DWORD *)buf = 134219522;
      uint64_t v22 = a1;
      __int16 v23 = 2114;
      double v24 = v17;
      __int16 v25 = 2114;
      id v26 = v7;
      __int16 v27 = 2114;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = v15;
      BOOL v13 = v9 == v7 && v10 == 0;
      __int16 v31 = 2114;
      id v32 = v9;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_21FCFC000, v12, v14, "ETS:%p:%{public}@ scene contents updated to target:%{public}@ event:%{public}@ animated:%{BOOL}u inProgressUpdateTarget:%{public}@ requestingFidelityTarget:%{public}@", buf, 0x44u);
    }
    if (v13)
    {
      uint64_t v18 = *(void **)(a1 + 16);
      uint64_t v19 = [v7 backlightState];
      int v20 = [v7 visualState];
      [v18 transitionState:a1 didBeginUpdateToBacklightState:v19 visualState:v20];
    }
  }
}

- (void)animationCompleteToTarget:(void *)a3 forEvent:(int)a4 animated:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    id v10 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v11 = *(id *)(a1 + 32);
    int v12 = [v8 isEqual:v11];
    id v13 = *(id *)(a1 + 24);
    if (v13) {
      int v14 = 0;
    }
    else {
      int v14 = v12;
    }
    if (v12)
    {
      *(unsigned char *)(a1 + 64) = 0;
      int v15 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      int v16 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      int v17 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    else
    {
      objc_storeStrong((id *)(a1 + 40), a2);
      id v18 = v11;
      int v17 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v18;
    }

    uint64_t v19 = bls_scenes_log();
    int v20 = v19;
    if (v14) {
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    }
    else {
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
    }
    if (os_log_type_enabled(v19, v21))
    {
      [(id)a1 environment];
      __int16 v23 = v22 = v13;
      [v23 identifier];
      int v32 = v14;
      v25 = id v24 = v11;
      objc_msgSend(v9, "bls_shortLoggingString");
      id v26 = v33 = v9;
      *(_DWORD *)buf = 134219522;
      uint64_t v35 = a1;
      __int16 v36 = 2114;
      v37 = v25;
      __int16 v38 = 2114;
      id v39 = v8;
      __int16 v40 = 2114;
      v41 = v26;
      __int16 v42 = 1024;
      int v43 = a4;
      __int16 v44 = 2114;
      id v45 = v24;
      __int16 v46 = 2114;
      id v47 = v22;
      _os_log_impl(&dword_21FCFC000, v20, v21, "ETS:%p:%{public}@ animationComplete to target:%{public}@ event:%{public}@ animated:%{BOOL}u inProgressUpdateTarget:%{public}@ requestingFidelityTarget:%{public}@", buf, 0x44u);

      id v13 = v22;
      id v10 = (os_unfair_lock_s *)(a1 + 8);

      id v9 = v33;
      id v11 = v24;
      int v14 = v32;
    }

    os_unfair_lock_unlock(v10);
    if (v14)
    {
      id v27 = v9;
      [v8 backlightState];
      if (BLSBacklightStateIsActive())
      {
        id v28 = [*(id *)(a1 + 72) presentationDate];

        if (v28) {
          [*(id *)(a1 + 72) clearPresentationDate];
        }
      }
      __int16 v29 = *(void **)(a1 + 16);
      uint64_t v30 = [v8 backlightState];
      __int16 v31 = [v8 visualState];
      [v29 transitionState:a1 didCompleteUpdateToBacklightState:v30 visualState:v31];

      id v9 = v27;
    }
  }
}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_2(uint64_t a1, double a2)
{
  id v4 = *(id *)(a1 + 32);
  [v4 eventID];
  [v4 state];
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  id v5 = [*(id *)(a1 + 48) pendingBacklightRamp];
  [v5 performBacklightRampIfNeededWithDuration:a2];
}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  [v2 eventID];
  [v2 state];
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [*(id *)(a1 + 48) pendingBacklightRamp];
  int v5 = [v4 performBacklightRampIfNeededWithDuration:0.0];

  if (v5)
  {
    id v6 = bls_scenes_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 134218754;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_error_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_ERROR, "ETS:%p:%{public}@ target:%{public}@ snapped because client failed to perform backlight ramp for event:%{public}@", (uint8_t *)&v11, 0x2Au);
    }
  }
  [*(id *)(a1 + 48) setDidCompleteAnimation:1];
  if ([*(id *)(a1 + 48) didUpdateInitialState]) {
    -[BLSHEnvironmentTransitionState animationCompleteToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), 1);
  }
}

- (void)updateToDateSpecifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = self->_environment;
  id v6 = bls_scenes_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = v5;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_debug_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ update to dateSpecifier:%{public}@", buf, 0x20u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke;
  v9[3] = &unk_2645327C0;
  v9[4] = self;
  uint64_t v10 = v5;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = v5;
  [(BLSHBacklightSceneHostEnvironment *)v8 updateToDateSpecifier:v7 sceneContentsUpdated:v9];
}

uint64_t __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke(uint64_t a1)
{
  id v2 = bls_scenes_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke_cold_1(a1, v2);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) transitionState:*(void *)(a1 + 32) didUpdateToDateSpecifier:*(void *)(a1 + 48)];
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_lock_animationCompletedWithNewTarget, 0);
  objc_storeStrong((id *)&self->_lock_animationCompletedForOldTarget, 0);
  objc_storeStrong((id *)&self->_lock_inProgressUpdateTarget, 0);
  objc_storeStrong((id *)&self->_lock_requestingFidelityTarget, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithEnvironment:(uint64_t)a1 delegate:(id *)a2 .cold.1(uint64_t a1, id *a2)
{
  id v2 = [*a2 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v3, v4, "ETS:%p:%{public}@ transitionState init", v5, v6, v7, v8, 2u);
}

- (void)updateToTarget:(uint64_t)a3 touchTargetable:presentationDate:sceneUpdate:requestedFidelity:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v9 = 138544642;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_0_1();
  __int16 v11 = 2048;
  uint64_t v12 = a2;
  __int16 v13 = v8;
  __int16 v14 = @"BLSHEnvironmentTransitionState.m";
  __int16 v15 = 1024;
  int v16 = 248;
  __int16 v17 = v8;
  uint64_t v18 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

void __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) identifier];
  uint64_t v6 = *(void *)(a1 + 48);
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ did update to dateSpecifier:%{public}@", (uint8_t *)&v7, 0x20u);
}

@end