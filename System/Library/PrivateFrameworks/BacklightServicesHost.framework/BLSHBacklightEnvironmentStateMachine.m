@interface BLSHBacklightEnvironmentStateMachine
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHBacklightEnvironmentStateMachine)initWithPresentation:(id)a3 backlightState:(int64_t)a4 delegate:(id)a5 inactiveBudgetPolicy:(id)a6 osTimerProvider:(id)a7;
- (BLSHBacklightEnvironmentStateMachineDelegate)delegate;
- (BLSHInactiveBudgetPolicing_Private)inactiveBudgetPolicy;
- (BLSHOSTimerProviding)osTimerProvider;
- (BOOL)isUpdatingPresentation;
- (BOOL)isUpdatingState;
- (BOOL)pendingNotifyBeganUpdatingState;
- (BOOL)transitionCompleteAfterCompletingTransitionState:(uint64_t)a1;
- (NSSet)updatingDateSpecifierTransitionStates;
- (NSSet)updatingVisualStateTransitionStates;
- (NSString)debugDescription;
- (NSString)description;
- (id)withLock_transitionStateForEnvironment:(uint64_t)a1;
- (int)_lock_debugDescription;
- (os_unfair_lock_s)allTransitionsDidBeginUpdateBacklightState:(os_unfair_lock_s *)result;
- (os_unfair_lock_s)isInvalid;
- (os_unfair_lock_s)isTransitionComplete;
- (os_unfair_lock_s)transitionStateForEnvironment:(os_unfair_lock_s *)a1;
- (uint64_t)_lock_isActiveTransitionState:(uint64_t)a1;
- (uint64_t)_lock_isSetPresentationOperationComplete:(uint64_t)a1;
- (uint64_t)isSetPresentationOperationComplete:(os_unfair_lock_s *)a1;
- (uint64_t)withLock_allTransitionsDidBeginUpdateBacklightState:(void *)a3 environmentFilter:;
- (uint64_t)withLock_numTransitionsDidNotBeginUpdateBacklightState:(uint64_t)a1;
- (void)_lock_ifPossibleStopTrackingTransitionState:(uint64_t)a1;
- (void)completedOperation:(uint64_t)a1;
- (void)dealloc;
- (void)endAddingEnvironments;
- (void)enumerateRemoteEnvironmentsFirstFromSource:(void *)a3 environmentTransformer:(void *)a4 block:;
- (void)invalidate;
- (void)onMain_performEvent:(void *)a3 withInitialSpecifier:(void *)a4 performBacklightRamp:;
- (void)onMain_setPresentation:(uint64_t)a3 withTargetBacklightState:;
- (void)onMain_updateEnvironment:(uint64_t)a1;
- (void)onMain_updateToSpecifier:(uint64_t)a1;
- (void)performEvent:(id)a3 withInitialSpecifier:(id)a4 performBacklightRamp:(id)a5;
- (void)populateEnvironmentStateMachineStruct:(id *)a3;
- (void)populateOperationCompletedMismatchedBacklightStatesStruct:(uint64_t)a3 backlightState:(uint64_t)a4 targetBacklightState:(void *)a5 performEventHistory:(void *)a6 didBeginUpdateHistory:(void *)a7 didCompleteUpdateHistory:;
- (void)setPresentation:(id)a3 withTargetBacklightState:(int64_t)a4;
- (void)transitionState:(id)a3 didBeginUpdateToBacklightState:(int64_t)a4 visualState:(id)a5;
- (void)transitionState:(id)a3 didCompleteUpdateToBacklightState:(int64_t)a4 visualState:(id)a5;
- (void)transitionState:(id)a3 didUpdateToDateSpecifier:(id)a4;
- (void)updateAllEnvironmentsInPresentation;
- (void)updateEnvironment:(id)a3;
- (void)updateRemovedEnvironmentsToActiveOn;
- (void)updateToSpecifier:(id)a3;
- (void)updateTransitionStatesForEnvironments:(uint64_t)a3 toBacklightState:(void *)a4 forEvent:(void *)a5 withInitialSpecifier:(void *)a6 forReason:(void *)a7 performBacklightRamp:(void *)a8 environmentTransformer:;
@end

@implementation BLSHBacklightEnvironmentStateMachine

- (BLSHBacklightEnvironmentStateMachine)initWithPresentation:(id)a3 backlightState:(int64_t)a4 delegate:(id)a5 inactiveBudgetPolicy:(id)a6 osTimerProvider:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)BLSHBacklightEnvironmentStateMachine;
  v17 = [(BLSHBacklightEnvironmentStateMachine *)&v35 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_4;
  }
  if (v13)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_lock_presentation, a3);
    v18->_lock_targetBacklightState = a4;
    v18->_lock_performEventTargetBacklightState = a4;
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    performEventHistory = v18->_performEventHistory;
    v18->_performEventHistory = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] array];
    didBeginUpdateHistory = v18->_didBeginUpdateHistory;
    v18->_didBeginUpdateHistory = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] array];
    didCompleteUpdateHistory = v18->_didCompleteUpdateHistory;
    v18->_didCompleteUpdateHistory = (NSMutableArray *)v23;

    objc_storeWeak((id *)&v18->_delegate, v14);
    objc_storeStrong((id *)&v18->_inactiveBudgetPolicy, a6);
    objc_storeStrong((id *)&v18->_osTimerProvider, a7);
    uint64_t v25 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:517 capacity:4];
    transitionStates = v18->_transitionStates;
    v18->_transitionStates = (NSMapTable *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9C0] set];
    lock_updatingVisualStateTransitionStates = v18->_lock_updatingVisualStateTransitionStates;
    v18->_lock_updatingVisualStateTransitionStates = (NSMutableSet *)v27;

    objc_initWeak(&location, v18);
    objc_copyWeak(&v33, &location);
    v18->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
LABEL_4:

    return v18;
  }
  v30 = NSString;
  v31 = -[BLSHBacklightEnvironmentStateMachine _lock_debugDescription]((int *)v17);
  v32 = [v30 stringWithFormat:@"%p cannot initialize with nil presentation, %@", v18, v31];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHBacklightEnvironmentStateMachine initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:]();
  }
  [v32 UTF8String];
  result = (BLSHBacklightEnvironmentStateMachine *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (int)_lock_debugDescription
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
    v3 = v2;
    if (v1[32] >= 1) {
      id v4 = (id)objc_msgSend(v2, "appendInt:withName:");
    }
    id v5 = (id)[v3 appendObject:*((void *)v1 + 6) withName:@"updatingVisualState"];
    id v6 = (id)[v3 appendObject:*((void *)v1 + 7) withName:@"updatingDateSpecifier" skipIfNil:1];
    id v7 = (id)[v3 appendObject:*((void *)v1 + 2) withName:@"presentation"];
    id v8 = (id)[v3 appendObject:*((void *)v1 + 8) withName:@"updatingSpecifier"];
    v9 = NSStringFromBLSBacklightState();
    [v3 appendString:v9 withName:@"target"];

    if (*((void *)v1 + 13) != *((void *)v1 + 14))
    {
      v10 = NSStringFromBLSBacklightState();
      [v3 appendString:v10 withName:@"performEventTarget"];
    }
    id v11 = (id)[v3 appendBool:*((unsigned __int8 *)v1 + 132) withName:@"pendingNotifyBeganUpdatingState"];
    id v12 = (id)[v3 appendBool:*((unsigned __int8 *)v1 + 133) withName:@"updatingState"];
    id v13 = (id)[v3 appendObject:*((void *)v1 + 12) withName:@"updatingPresentation" skipIfNil:1];
    [v3 appendArraySection:*((void *)v1 + 9) withName:@"performEventHistory" skipIfEmpty:1];
    [v3 appendArraySection:*((void *)v1 + 10) withName:@"didBeginUpdateHistory" skipIfEmpty:1];
    [v3 appendArraySection:*((void *)v1 + 11) withName:@"didCompleteUpdateHistory" skipIfEmpty:1];
    v1 = [v3 build];
  }

  return v1;
}

uint64_t __122__BLSHBacklightEnvironmentStateMachine_initWithPresentation_backlightState_delegate_inactiveBudgetPolicy_osTimerProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)dealloc
{
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightEnvironmentStateMachine;
  [(BLSHBacklightEnvironmentStateMachine *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  if (self->_lock_addingEnvironmentsCount >= 1) {
    id v6 = (id)objc_msgSend(v4, "appendInt:withName:");
  }
  id v7 = (id)[v4 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  id v8 = (id)[v4 appendObject:self->_lock_updatingVisualStateTransitionStates withName:@"updatingVisualState"];
  id v9 = (id)[v4 appendObject:self->_lock_updatingDateSpecifierTransitionStates withName:@"updatingDateSpecifier" skipIfNil:1];
  id v10 = (id)[v4 appendObject:self->_lock_presentation withName:@"presentation"];
  id v11 = (id)[v4 appendObject:self->_updatingSpecifier withName:@"updatingSpecifier"];
  id v12 = NSStringFromBLSBacklightState();
  [v4 appendString:v12 withName:@"target"];

  if (self->_lock_targetBacklightState != self->_lock_performEventTargetBacklightState)
  {
    id v13 = NSStringFromBLSBacklightState();
    [v4 appendString:v13 withName:@"performEventTarget"];
  }
  id v14 = (id)[v4 appendBool:self->_pendingNotifyBeganUpdatingState withName:@"pendingNotifyBeganUpdatingState"];
  id v15 = (id)[v4 appendBool:self->_updatingState withName:@"updatingState"];
  id v16 = (id)[v4 appendBool:self->_lock_setPresentationOperation != 0 withName:@"updatingPresentation"];
  if ([(NSMutableSet *)self->_lock_staleEnvironmentsThatNeedDeferredUpdate count])
  {
    v17 = [(NSMutableSet *)self->_lock_staleEnvironmentsThatNeedDeferredUpdate allObjects];
    v18 = [v17 valueForKey:@"identifier"];
    uint64_t v19 = [v18 componentsJoinedByString:@","];
    [v4 appendString:v19 withName:@"removedEnvsForStateUpdateLater"];
  }
  os_unfair_lock_unlock(p_lock);
  v20 = [v4 build];

  return (NSString *)v20;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = -[BLSHBacklightEnvironmentStateMachine _lock_debugDescription]((int *)self);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BLSHBacklightEnvironmentPresentation *)self->_lock_presentation presentationEntries];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) environment];
        [v9 deactivateClient];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  lock_presentation = self->_lock_presentation;
  self->_lock_presentation = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  [(NSMutableSet *)self->_lock_updatingVisualStateTransitionStates removeAllObjects];
  lock_updatingVisualStateTransitionStates = self->_lock_updatingVisualStateTransitionStates;
  self->_lock_updatingVisualStateTransitionStates = 0;

  [(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates removeAllObjects];
  lock_updatingDateSpecifierTransitionStates = self->_lock_updatingDateSpecifierTransitionStates;
  self->_lock_updatingDateSpecifierTransitionStates = 0;

  transitionStates = self->_transitionStates;
  self->_transitionStates = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  -[BLSHBacklightEnvironmentStateMachine updateRemovedEnvironmentsToActiveOn]((uint64_t)self);
}

- (void)updateRemovedEnvironmentsToActiveOn
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (os_unfair_lock_s)isInvalid
{
  SEL v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    SEL v1 = (os_unfair_lock_s *)(BYTE2(v1[33]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_presentation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPresentation:(id)a3 withTargetBacklightState:(int64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  BSDispatchMain();
}

void __81__BLSHBacklightEnvironmentStateMachine_setPresentation_withTargetBacklightState___block_invoke(uint64_t a1)
{
}

- (void)onMain_setPresentation:(uint64_t)a3 withTargetBacklightState:
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (a1)
  {
    if (-[BLSHBacklightEnvironmentStateMachine isInvalid]((os_unfair_lock_s *)a1))
    {
      uint64_t v7 = bls_backlight_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:]();
      }
LABEL_80:

      goto LABEL_81;
    }
    if (!v6)
    {
      v65 = NSString;
      v66 = [(id)a1 debugDescription];
      v67 = [v65 stringWithFormat:@"%p cannot set nil presentation, %@", a1, v66];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:]();
      }
      [v67 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD2B4D4);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(void *)(a1 + 104) = a3;
    uint64_t v8 = *(id *)(a1 + 16);
    objc_storeStrong((id *)(a1 + 16), a2);
    v72 = v8;
    uint8_t v9 = [v6 differenceFromPresentation:v8];
    id v10 = [v9 insertions];
    id v11 = *(id *)(a1 + 96);
    id v12 = v11;
    v77 = v9;
    v75 = v11;
    if (v11)
    {
      id v13 = [v11 additions];
      id v70 = v6;
      long long v14 = [v6 presentationEntries];
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke;
      v84[3] = &unk_264533098;
      id v85 = v10;
      id v15 = v13;
      id v86 = v15;
      long long v16 = objc_msgSend(v14, "bs_compactMap:", v84);

      uint64_t v17 = [v12 backlightState];
      uint64_t v18 = a3;
      LOBYTE(v12) = v17 != a3;
      if (v17 == a3)
      {
        uint64_t v19 = v16;
      }
      else
      {
        uint64_t v19 = v16;
        id v20 = v16;

        id v10 = v20;
      }

      id v21 = v19;
      a3 = v18;
      id v6 = v70;
      uint8_t v9 = v77;
    }
    else
    {
      id v21 = v10;
    }
    v74 = v21;
    v73 = [[BLSSetPresentationOperation alloc] initWithBacklightState:a3 additions:v21];
    objc_storeStrong((id *)(a1 + 96), v73);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    int v22 = [v9 hasChanges];
    char v23 = v22;
    v76 = v10;
    if ((v12 & 1) == 0 && !v22)
    {
      v24 = bls_backlight_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = NSStringFromBLSBacklightState();
        *(_DWORD *)buf = 134218242;
        uint64_t v89 = a1;
        __int16 v90 = 2114;
        v91 = v25;
        _os_log_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_INFO, "ESM:%p setPresentation (redundant) targetBacklightState:%{public}@", buf, 0x16u);
      }
      v26 = 0;
LABEL_57:

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      v50 = v26;
      if ([v26 count])
      {
        v51 = *(void **)(a1 + 120);
        if (v51) {
          [v51 unionSet:v26];
        }
        else {
          objc_storeStrong((id *)(a1 + 120), v26);
        }
        v52 = [MEMORY[0x263EFFA08] setWithArray:v10];
        [*(id *)(a1 + 120) minusSet:v52];
        v53 = bls_backlight_log();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = [*(id *)(a1 + 120) valueForKey:@"identifier"];
          *(_DWORD *)buf = 134218242;
          uint64_t v89 = a1;
          __int16 v90 = 2114;
          v91 = v54;
          _os_log_impl(&dword_21FCFC000, v53, OS_LOG_TYPE_INFO, "ESM:%p setPresentation: staleEnvironmentsThatNeedDeferredUpdate:%{public}@", buf, 0x16u);
        }
      }
      uint64_t v55 = [*(id *)(a1 + 56) count];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
      id v57 = *(id *)(a1 + 64);
      if (v55)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }
      else
      {
        v58 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = 0;

        v59 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        if (v57) {
          [WeakRetained environmentStateMachine:a1 didUpdateToSpecifier:v57];
        }
      }
      if (-[BLSHBacklightEnvironmentStateMachine isTransitionComplete]((os_unfair_lock_s *)a1))
      {
        v60 = bls_backlight_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:]();
        }

        v61 = +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:a3];
        -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v61);

        uint64_t v7 = v72;
        v62 = v73;
      }
      else
      {
        v62 = v73;
        if (-[BLSHBacklightEnvironmentStateMachine isSetPresentationOperationComplete:]((os_unfair_lock_s *)a1, v73))
        {
          v63 = bls_backlight_log();
          uint64_t v7 = v72;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.4();
          }

          -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v73);
        }
        else
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          v64 = bls_backlight_log();
          uint64_t v7 = v72;
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
            -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.5(a1, (uint64_t)v6, v64);
          }

          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        }
      }

      goto LABEL_80;
    }
    v68 = [v9 removals];
    uint64_t v69 = [v10 count];
    uint64_t v27 = [v68 count];
    v28 = bls_backlight_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

    if (v29)
    {
      log = bls_backlight_log();
      BOOL v30 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
      if (v23)
      {
        v31 = v77;
        if (!v27)
        {
          if (v30)
          {
            v38 = objc_msgSend(v10, "bs_map:", &__block_literal_global_115);
            v39 = NSStringFromBLSBacklightState();
            *(_DWORD *)buf = 134218498;
            uint64_t v89 = a1;
            __int16 v90 = 2114;
            v91 = v38;
            __int16 v92 = 2114;
            v93 = v39;
            _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by adding:%{public}@ targetBacklightState:%{public}@", buf, 0x20u);
          }
          goto LABEL_50;
        }
        if (v69)
        {
          if (v30)
          {
            v32 = objc_msgSend(v10, "bs_map:", &__block_literal_global_121);
            id v33 = [v68 bs_map:&__block_literal_global_124];
            v34 = NSStringFromBLSBacklightState();
            *(_DWORD *)buf = 134218754;
            uint64_t v89 = a1;
            __int16 v90 = 2114;
            v91 = v32;
            __int16 v92 = 2114;
            v93 = v33;
            __int16 v94 = 2114;
            v95 = v34;
            _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by adding:%{public}@ and removing:%{public}@ targetBacklightState:%{public}@", buf, 0x2Au);

LABEL_32:
            v31 = v77;
          }
        }
        else if (v30)
        {
          v32 = [v68 bs_map:&__block_literal_global_118];
          id v33 = NSStringFromBLSBacklightState();
          *(_DWORD *)buf = 134218498;
          uint64_t v89 = a1;
          __int16 v90 = 2114;
          v91 = v32;
          __int16 v92 = 2114;
          v93 = v33;
          _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by removing:%{public}@ targetBacklightState:%{public}@", buf, 0x20u);
          goto LABEL_32;
        }

        goto LABEL_34;
      }
      if (v30)
      {
        [v75 backlightState];
        objc_super v35 = NSStringFromBLSBacklightState();
        v36 = NSStringFromBLSBacklightState();
        v37 = objc_msgSend(v10, "bs_map:", &__block_literal_global_8);
        *(_DWORD *)buf = 134218754;
        uint64_t v89 = a1;
        __int16 v90 = 2114;
        v91 = v35;
        __int16 v92 = 2114;
        v93 = v36;
        __int16 v94 = 2114;
        v95 = v37;
        _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation (redundant) targetBacklightState:%{public}@->%{public}@ additions:%{public}@", buf, 0x2Au);
      }
    }
    v31 = v77;
    if (!v27)
    {
      v78 = 0;
      v24 = v68;
LABEL_52:
      if (v69)
      {
        v49 = bls_backlight_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.6(a3, v10);
        }

        -[BLSHBacklightEnvironmentStateMachine updateTransitionStatesForEnvironments:toBacklightState:forEvent:withInitialSpecifier:forReason:performBacklightRamp:environmentTransformer:]((os_unfair_lock_s *)a1, v10, a3, 0, 0, @"setPresentation", 0, &__block_literal_global_136);
      }
      v26 = v78;
      goto LABEL_57;
    }
LABEL_34:
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    log = [v31 removals];
    uint64_t v40 = [log countByEnumeratingWithState:&v80 objects:v87 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = a3;
      id v71 = v6;
      v78 = 0;
      uint64_t v43 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v81 != v43) {
            objc_enumerationMutation(log);
          }
          v45 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          v46 = [*(id *)(a1 + 40) objectForKey:v45];
          v47 = v46;
          if (v46)
          {
            [v46 performBacklightRampIfPendingForReason:@"removed"];
            [*(id *)(a1 + 48) removeObject:v47];
            [*(id *)(a1 + 56) removeObject:v47];
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          [v45 deactivateClient];
          if (v42 != 2
            && (objc_opt_respondsToSelector() & 1) != 0
            && [v45 wantsStateUpdateToActiveAfterRemovalFromPresentation])
          {
            v48 = v78;
            if (!v78)
            {
              v48 = [MEMORY[0x263EFF9C0] set];
            }
            v78 = v48;
            [v48 addObject:v45];
          }
        }
        uint64_t v41 = [log countByEnumeratingWithState:&v80 objects:v87 count:16];
      }
      while (v41);
      id v6 = v71;
      a3 = v42;
      goto LABEL_51;
    }
LABEL_50:
    v78 = 0;
LABEL_51:
    v24 = v68;

    id v10 = v76;
    goto LABEL_52;
  }
LABEL_81:
}

- (NSSet)updatingVisualStateTransitionStates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableSet *)self->_lock_updatingVisualStateTransitionStates copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (NSSet)updatingDateSpecifierTransitionStates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (BOOL)pendingNotifyBeganUpdatingState
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_pendingNotifyBeganUpdatingState;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatingState
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_updatingState;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatingPresentation
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_setPresentationOperation != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 environment];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || [*(id *)(a1 + 40) containsObject:v3])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 visualState];
  BLSBacklightStateForVisuaState();
  id v6 = NSStringFromBLSBacklightState();
  uint64_t v7 = [v2 stringWithFormat:@"%p:%@(%@)", v3, v4, v6];

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_113(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 visualState];
  BLSBacklightStateForVisuaState();
  id v6 = NSStringFromBLSBacklightState();
  uint64_t v7 = [v2 stringWithFormat:@"%p:%@(%@)", v3, v4, v6];

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_116(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 visualState];
  BLSBacklightStateForVisuaState();
  id v6 = NSStringFromBLSBacklightState();
  uint64_t v7 = [v2 stringWithFormat:@"%p:%@(%@)", v3, v4, v6];

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_119(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 visualState];
  BLSBacklightStateForVisuaState();
  id v6 = NSStringFromBLSBacklightState();
  uint64_t v7 = [v2 stringWithFormat:@"%p:%@(%@)", v3, v4, v6];

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_2_122(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 visualState];
  BLSBacklightStateForVisuaState();
  id v6 = NSStringFromBLSBacklightState();
  uint64_t v7 = [v2 stringWithFormat:@"%p:%@(%@)", v3, v4, v6];

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_133(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (void)updateTransitionStatesForEnvironments:(uint64_t)a3 toBacklightState:(void *)a4 forEvent:(void *)a5 withInitialSpecifier:(void *)a6 forReason:(void *)a7 performBacklightRamp:(void *)a8 environmentTransformer:
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = v17;
  if (a1)
  {
    uint64_t v19 = v17;
    id v20 = v15;
    id v21 = a8;
    id v22 = a2;
    os_unfair_lock_lock(a1 + 2);
    ++a1[32]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(a1 + 2);
    char v23 = [v22 firstObject];
    v24 = v21[2](v21, v23);

    id v15 = v20;
    uint64_t v18 = v19;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke;
    v27[3] = &unk_264533100;
    v27[4] = a1;
    uint64_t v33 = a3;
    id v28 = v15;
    id v29 = v24;
    id v30 = v14;
    BOOL v34 = v14 != 0;
    id v32 = v19;
    id v31 = v16;
    id v25 = v24;
    -[BLSHBacklightEnvironmentStateMachine enumerateRemoteEnvironmentsFirstFromSource:environmentTransformer:block:]((uint64_t)a1, v22, v21, v27);

    -[BLSHBacklightEnvironmentStateMachine endAddingEnvironments](a1);
  }
}

- (os_unfair_lock_s)isTransitionComplete
{
  SEL v1 = a1;
  if (a1)
  {
    id v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    if ((int)v1[32]._os_unfair_lock_opaque <= 0) {
      SEL v1 = (os_unfair_lock_s *)([*(id *)&v1[12]._os_unfair_lock_opaque count] == 0);
    }
    else {
      SEL v1 = 0;
    }
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)completedOperation:(uint64_t)a1
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1) {
    goto LABEL_37;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v4 = [v3 backlightState];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v6 = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v7 = objc_opt_isKindOfClass();
  int v43 = *(unsigned __int8 *)(a1 + 133);
  int v44 = v6 & (v43 != 0);
  if (v44 == 1)
  {
    *(unsigned char *)(a1 + 133) = 0;
    uint64_t v8 = *(void *)(a1 + 104);
    if (v8 != v4 && *(void *)(a1 + 112) != v4)
    {
      uint8_t v9 = malloc_type_calloc(1uLL, 0x290uLL, 0xB4BB8F40uLL);
      -[BLSHBacklightEnvironmentStateMachine populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:](a1, (uint64_t)v9, v8, v4, *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88));
      id v10 = NSString;
      uint64_t v11 = v4;
      id v12 = NSStringFromBLSBacklightState();
      id v13 = NSStringFromBLSBacklightState();
      id v14 = NSStringFromBLSBacklightState();
      id v15 = [v10 stringWithFormat:@"no more transitionStates but state:%@ != target:%@ and != performEventTarget:%@ eventHistory:%@ didBeginUpdateHistory:%@ didCompleteHistory:%@", v12, v13, v14, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88)];

      BLSHRecordCriticalAssertFailure(v15);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __59__BLSHBacklightEnvironmentStateMachine_completedOperation___block_invoke;
      v47[3] = &unk_264533210;
      int v50 = 656;
      id v48 = v15;
      v49 = v9;
      id v16 = v15;
      id v17 = (void (**)(void))MEMORY[0x223C5E2B0](v47);
      if (BLSHIsUnitTestRunning())
      {
        v17[2](v17);
      }
      else
      {
        dispatch_time_t v20 = dispatch_time(0, 1000000000);
        dispatch_after(v20, MEMORY[0x263EF83A0], v17);
      }

      uint64_t v4 = v11;
    }
    uint64_t v18 = (unsigned char *)(a1 + 132);
    if (*(unsigned char *)(a1 + 132)) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v18 = (unsigned char *)(a1 + 132);
    if (((*(unsigned char *)(a1 + 132) != 0) & isKindOfClass) == 1 && v4 == *(void *)(a1 + 112))
    {
LABEL_13:
      unsigned char *v18 = 0;
      int v19 = 1;
      goto LABEL_14;
    }
  }
  int v19 = 0;
LABEL_14:
  id v21 = *(id *)(a1 + 96);
  if ((v7 & (v21 == v3)) != 0
    || -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:](a1, v21))
  {
    id v22 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    int v45 = 1;
  }
  else
  {
    int v45 = 0;
  }
  id v23 = *(id *)(a1 + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
  lock = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  id v25 = bls_backlight_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v39 = NSStringFromBLSBacklightState();
    uint64_t v42 = NSStringFromBLSBacklightState();
    uint64_t v40 = *(void *)(a1 + 72);
    uint64_t v41 = *(void *)(a1 + 88);
    *(_DWORD *)buf = 134220546;
    uint64_t v52 = a1;
    __int16 v53 = 2114;
    id v54 = v3;
    __int16 v55 = 2114;
    v56 = v39;
    __int16 v57 = 2114;
    v58 = v42;
    __int16 v59 = 1024;
    int v60 = v43;
    __int16 v61 = 1024;
    int v62 = v45;
    __int16 v63 = 1024;
    int v64 = v19;
    __int16 v65 = 1024;
    int v66 = v44;
    __int16 v67 = 2114;
    id v68 = v21;
    __int16 v69 = 2114;
    uint64_t v70 = v40;
    __int16 v71 = 2114;
    uint64_t v72 = v41;
    _os_log_debug_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_DEBUG, "ESM:%p completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u, setPresentationOperation:%{public}@ eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x60u);
  }
  if (v45) {
    [WeakRetained environmentStateMachine:a1 didUpdateToPresentation:v23];
  }
  v26 = (os_unfair_lock_s *)(a1 + 8);
  if (v19)
  {
    os_unfair_lock_lock(lock);
    if (!*v18)
    {
      uint64_t v27 = v23;
      os_unfair_lock_unlock(lock);
      [WeakRetained environmentStateMachine:a1 didBeginUpdateToState:v4];
      int v33 = 1;
      goto LABEL_29;
    }
    uint64_t v27 = v23;
    id v28 = bls_backlight_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = NSStringFromBLSBacklightState();
      id v30 = NSStringFromBLSBacklightState();
      id v31 = *(void **)(a1 + 72);
      uint64_t v32 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 134220290;
      uint64_t v52 = a1;
      __int16 v53 = 2114;
      id v54 = v3;
      __int16 v55 = 2114;
      v56 = v29;
      __int16 v57 = 2114;
      v58 = v30;
      __int16 v59 = 1024;
      int v60 = v43;
      __int16 v61 = 1024;
      int v62 = v45;
      __int16 v63 = 1024;
      int v64 = 0;
      __int16 v65 = 1024;
      int v66 = v44;
      __int16 v67 = 2114;
      id v68 = v31;
      __int16 v69 = 2114;
      uint64_t v70 = v32;
      _os_log_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_INFO, "ESM:%p (dropping didBeginUpdateToState callback) completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x56u);
    }
    v26 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_unlock(lock);
  }
  else
  {
    uint64_t v27 = v23;
  }
  int v33 = 0;
LABEL_29:
  if (v44)
  {
    os_unfair_lock_lock(v26);
    if (*(void *)(a1 + 104) == v4 && *(void *)(a1 + 112) == v4)
    {
      os_unfair_lock_unlock(v26);
      [WeakRetained environmentStateMachine:a1 didCompleteUpdateToState:v4];
    }
    else
    {
      BOOL v34 = bls_backlight_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_super v35 = NSStringFromBLSBacklightState();
        v36 = NSStringFromBLSBacklightState();
        v37 = *(void **)(a1 + 72);
        uint64_t v38 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 134220290;
        uint64_t v52 = a1;
        __int16 v53 = 2114;
        id v54 = v3;
        __int16 v55 = 2114;
        v56 = v35;
        __int16 v57 = 2114;
        v58 = v36;
        __int16 v59 = 1024;
        int v60 = 1;
        __int16 v61 = 1024;
        int v62 = v45;
        __int16 v63 = 1024;
        int v64 = v33;
        __int16 v65 = 1024;
        int v66 = 0;
        __int16 v67 = 2114;
        id v68 = v37;
        __int16 v69 = 2114;
        uint64_t v70 = v38;
        _os_log_impl(&dword_21FCFC000, v34, OS_LOG_TYPE_INFO, "ESM:%p (dropping didCompleteUpdateToState callback) completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x56u);

        v26 = (os_unfair_lock_s *)(a1 + 8);
      }

      os_unfair_lock_unlock(v26);
    }
  }

LABEL_37:
}

- (uint64_t)isSetPresentationOperationComplete:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    os_unfair_lock_lock(a1 + 2);
    uint64_t v5 = -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:]((uint64_t)a1, v4);
    os_unfair_lock_unlock(a1 + 2);
  }

  return v5;
}

void __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = bls_backlight_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke_cold_1(a1, v3);
  }

  int v5 = [*(id *)(*(void *)(a1 + 32) + 16) containsEnvironment:v3];
  unsigned __int8 v6 = *(os_unfair_lock_s **)(a1 + 32);
  if (v5)
  {
    unsigned __int8 v7 = -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:]((uint64_t)v6, v3);
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v8 = *(void **)(a1 + 40);
    if (v8)
    {
      uint8_t v9 = [v8 dateSpecifierForEnvironment:v3];
    }
    else
    {
      uint8_t v9 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 80);
    id v15 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    BOOL v16 = v15 == v3 && *(unsigned char *)(a1 + 88) != 0;
    id v17 = [v9 date];
    uint64_t v18 = [v9 userObject];
    if (v15 == v3) {
      uint64_t v19 = *(void *)(a1 + 72);
    }
    else {
      uint64_t v19 = 0;
    }
    [v7 updateToBacklightState:v13 forEvent:v14 touchTargetable:v16 presentationDate:v17 sceneUpdate:v18 performBacklightRamp:v19];
  }
  else
  {
    os_unfair_lock_unlock(v6 + 2);
    unsigned __int8 v7 = bls_backlight_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 64);
      id v12 = [v3 identifier];
      int v20 = 134218754;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      id v25 = v3;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "ESM:%p will skip environment update, no longer in presentation — updateTransitionStatesForReason:%{public}@ environment:%p:%{public}@", (uint8_t *)&v20, 0x2Au);
    }
  }
}

- (id)withLock_transitionStateForEnvironment:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:v3];
    if (!v4)
    {
      uint64_t v4 = +[BLSHEnvironmentTransitionState createStateForEnvironment:v3 delegate:a1];
      [*(id *)(a1 + 40) setObject:v4 forKey:v3];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)enumerateRemoteEnvironmentsFirstFromSource:(void *)a3 environmentTransformer:(void *)a4 block:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke;
    v15[3] = &unk_264533128;
    id v16 = v7;
    uint8_t v9 = objc_msgSend(a2, "bs_map:", v15);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke_2;
    v12[3] = &unk_264533150;
    id v13 = v9;
    id v14 = v8;
    id v10 = v9;
    uint64_t v11 = (void (**)(void, void))MEMORY[0x223C5E2B0](v12);
    v11[2](v11, 0);
    v11[2](v11, 1);
  }
}

- (void)endAddingEnvironments
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

BLSHEnvironmentAndSource *__112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  uint64_t v5 = v3(v2, v4);
  uint64_t v6 = [[BLSHEnvironmentAndSource alloc] initWithEnvironment:v5 environmentSource:v4];

  return v6;
}

void __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint8_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "environment", (void)v13);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((a2 & 1) == 0) {
            goto LABEL_11;
          }
LABEL_10:
          uint64_t v11 = *(void *)(a1 + 40);
          id v12 = [v9 environmentSource];
          (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v10, v12);

          goto LABEL_11;
        }
        if ([v10 isLocal] == a2) {
          goto LABEL_10;
        }
LABEL_11:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)performEvent:(id)a3 withInitialSpecifier:(id)a4 performBacklightRamp:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  BSDispatchMain();
}

void __95__BLSHBacklightEnvironmentStateMachine_performEvent_withInitialSpecifier_performBacklightRamp___block_invoke(uint64_t a1)
{
}

- (void)onMain_performEvent:(void *)a3 withInitialSpecifier:(void *)a4 performBacklightRamp:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    int v10 = *(unsigned __int8 *)(a1 + 134);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v10)
    {
      id v11 = bls_backlight_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      id v12 = [(id)a1 debugDescription];
      *(_DWORD *)buf = 134218754;
      uint64_t v30 = a1;
      __int16 v31 = 2114;
      uint64_t v32 = v12;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v7;
      __int16 v35 = 2114;
      id v36 = v8;
      _os_log_fault_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_FAULT, "ESM:%p calling performEvent on invalidated state machine:%{public}@ event:%{public}@ initialSpecifier:%{public}@", buf, 0x2Au);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      uint64_t v13 = [v7 previousState];
      uint64_t v14 = [v7 state];
      long long v15 = *(void **)(a1 + 72);
      long long v16 = [[BLSHEnvironmentPerformEventData alloc] initWithStateMachineOldBacklightState:*(void *)(a1 + 104) eventPreviousBacklightState:v13 eventNewBacklightState:v14];
      [v15 addObject:v16];

      unint64_t v17 = [*(id *)(a1 + 72) count];
      if (v17 >= 6) {
        objc_msgSend(*(id *)(a1 + 72), "removeObjectsInRange:", 0, v17 - 5);
      }
      *(void *)(a1 + 104) = v14;
      *(void *)(a1 + 112) = v14;
      *(_WORD *)(a1 + 132) = 257;
      id v11 = *(id *)(a1 + 16);
      id v12 = [v11 presentationEntries];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if ([v12 count])
      {
        uint64_t v18 = bls_backlight_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = NSStringFromBLSBacklightState();
          uint64_t v27 = [v12 valueForKeyPath:@"environment.identifier"];
          objc_msgSend(v7, "bls_shortLoggingString");
          *(_DWORD *)buf = 138412802;
          uint64_t v30 = (uint64_t)v28;
          __int16 v31 = 2112;
          uint64_t v32 = v27;
          v34 = __int16 v33 = 2112;
          __int16 v26 = (void *)v34;
          _os_log_debug_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_DEBUG, "ESM: performEvent: -> %@ environments:%@ event:%@", buf, 0x20u);
        }
        -[BLSHBacklightEnvironmentStateMachine updateTransitionStatesForEnvironments:toBacklightState:forEvent:withInitialSpecifier:forReason:performBacklightRamp:environmentTransformer:]((os_unfair_lock_s *)a1, v12, v14, v7, v8, @"performEvent", v9, &__block_literal_global_153);
      }
      else if (v9)
      {
        int v19 = [v7 isEnvironmentTransitionAnimated];
        v20.n128_u64[0] = 0;
        if (v19) {
          v20.n128_f64[0] = 0.5;
        }
        v9[2](v9, v20);
      }
      if (-[BLSHBacklightEnvironmentStateMachine isTransitionComplete]((os_unfair_lock_s *)a1))
      {
        uint64_t v21 = bls_backlight_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:](a1, v7);
        }

        __int16 v22 = +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:v14];
      }
      else
      {
        if (!-[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)a1, v14))
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          id v25 = bls_backlight_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:](a1, v7);
          }

          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          goto LABEL_27;
        }
        uint64_t v23 = bls_backlight_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:](a1, v7);
        }

        __int16 v22 = +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:v14];
      }
      __int16 v24 = v22;
      -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v22);
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:
}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_onMain_performEvent_withInitialSpecifier_performBacklightRamp___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment];
}

- (os_unfair_lock_s)allTransitionsDidBeginUpdateBacklightState:(os_unfair_lock_s *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    id v4 = result + 2;
    os_unfair_lock_lock(result + 2);
    uint64_t v5 = -[BLSHBacklightEnvironmentStateMachine withLock_allTransitionsDidBeginUpdateBacklightState:environmentFilter:](v3, a2, 0);
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)v5;
  }
  return result;
}

- (void)updateAllEnvironmentsInPresentation
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_13();
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "ESM:%p calling updateAllEnvironmentsInPresentation on invalidated state machine:%{public}@", v4, 0x16u);
}

void __75__BLSHBacklightEnvironmentStateMachine_updateAllEnvironmentsInPresentation__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "environment", (void)v9);
        -[BLSHBacklightEnvironmentStateMachine onMain_updateEnvironment:](v7, v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)onMain_updateEnvironment:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    int v4 = *(unsigned __int8 *)(a1 + 134);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      uint64_t v5 = bls_backlight_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BLSHBacklightEnvironmentStateMachine onMain_updateEnvironment:]();
      }
      goto LABEL_17;
    }
    id v6 = (id)[(id)a1 presentation];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v7 = *(void *)(a1 + 104);
    int v8 = [*(id *)(a1 + 16) containsEnvironment:v3];
    long long v9 = [*(id *)(a1 + 16) presentationEntries];
    long long v10 = [v9 firstObject];
    id v11 = [v10 environment];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (!v8)
    {
      uint64_t v5 = bls_backlight_log();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        goto LABEL_18;
      }
      long long v12 = [v3 identifier];
      long long v16 = NSStringFromBLSBacklightState();
      int v21 = 134218498;
      uint64_t v22 = a1;
      __int16 v23 = 2114;
      __int16 v24 = v12;
      __int16 v25 = 2114;
      __int16 v26 = v16;
      _os_log_debug_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEBUG, "ESM:%p will not update environment:%{public}@ (not in presentation) to backlightState:%{public}@", (uint8_t *)&v21, 0x20u);

LABEL_16:
      goto LABEL_17;
    }
    uint64_t v5 = [v3 visualState];
    long long v12 = BLSVisualStateForBacklightState(v7, [v5 updateFidelity], v3, *(void **)(a1 + 24), *(void **)(a1 + 32));
    if ([v5 isEqual:v12])
    {
      uint64_t v13 = bls_backlight_log();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v14 = [v3 identifier];
      long long v15 = NSStringFromBLSBacklightState();
      int v21 = 134218754;
      uint64_t v22 = a1;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      __int16 v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "ESM:%p not will update environment:%{public}@ (unchanged) to backlightState:%{public}@ visualState:%{public}@", (uint8_t *)&v21, 0x2Au);
    }
    else
    {
      uint64_t v13 = -[BLSHBacklightEnvironmentStateMachine transitionStateForEnvironment:]((os_unfair_lock_s *)a1, v3);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      [*(id *)(a1 + 48) addObject:v13];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      unint64_t v17 = bls_backlight_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v3 identifier];
        int v19 = NSStringFromBLSBacklightState();
        int v21 = 134218754;
        uint64_t v22 = a1;
        __int16 v23 = 2114;
        __int16 v24 = v18;
        __int16 v25 = 2114;
        __int16 v26 = v19;
        __int16 v27 = 2114;
        uint64_t v28 = v12;
        _os_log_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_INFO, "ESM:%p will update environment:%{public}@ to backlightState:%{public}@ visualState:%{public}@", (uint8_t *)&v21, 0x2Au);
      }
      BOOL v20 = v11 == v3;

      uint64_t v14 = [v3 presentationDate];
      [v13 updateToBacklightState:v7 forEvent:0 touchTargetable:v20 presentationDate:v14 sceneUpdate:0 performBacklightRamp:0];
    }

    goto LABEL_15;
  }
LABEL_18:
}

- (void)updateEnvironment:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __58__BLSHBacklightEnvironmentStateMachine_updateEnvironment___block_invoke(uint64_t a1)
{
}

- (os_unfair_lock_s)transitionStateForEnvironment:(os_unfair_lock_s *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a1 + 2;
    id v4 = a2;
    os_unfair_lock_lock(v2 + 2);
    -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:]((uint64_t)v2, v4);
    id v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }

  return v2;
}

- (void)updateToSpecifier:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __58__BLSHBacklightEnvironmentStateMachine_updateToSpecifier___block_invoke(uint64_t a1)
{
}

- (void)onMain_updateToSpecifier:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v5 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    id v6 = *(id *)(a1 + 16);
    uint64_t v7 = [v6 presentationEntries];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke;
    v14[3] = &unk_2645331A0;
    v14[4] = a1;
    int v8 = objc_msgSend(v7, "bs_map:", v14);
    uint64_t v9 = [v8 mutableCopy];
    long long v10 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v9;

    objc_storeStrong((id *)(a1 + 64), a2);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if ([v8 count])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_3;
      v12[3] = &unk_2645331E8;
      id v13 = v4;
      -[BLSHBacklightEnvironmentStateMachine enumerateRemoteEnvironmentsFirstFromSource:environmentTransformer:block:](a1, v8, &__block_literal_global_157, v12);
    }
    else
    {
      [WeakRetained environmentStateMachine:a1 didUpdateToSpecifier:v4];
    }
  }
}

id __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 environment];
  id v4 = -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:](v2, v3);

  return v4;
}

uint64_t __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 environment];
}

void __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 dateSpecifierForEnvironment:a2];
  [v5 updateToDateSpecifier:v6];
}

- (void)populateEnvironmentStateMachineStruct:(id *)a3
{
  lock_presentation = self->_lock_presentation;
  uint64_t lock_addingEnvironmentsCount = self->_lock_addingEnvironmentsCount;
  id v9 = [(NSMutableSet *)self->_lock_updatingVisualStateTransitionStates allObjects];
  uint64_t v7 = [(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates allObjects];
  BYTE2(v8) = self->_lock_setPresentationOperation != 0;
  LOWORD(v8) = *(_WORD *)&self->_pendingNotifyBeganUpdatingState;
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:", a3, 0, lock_presentation, lock_addingEnvironmentsCount, v9, v7, self->_lock_targetBacklightState, self->_lock_performEventTargetBacklightState, v8);
}

- (void)populateOperationCompletedMismatchedBacklightStatesStruct:(uint64_t)a3 backlightState:(uint64_t)a4 targetBacklightState:(void *)a5 performEventHistory:(void *)a6 didBeginUpdateHistory:(void *)a7 didCompleteUpdateHistory:
{
  if (a1)
  {
    uint64_t v12 = *(void *)(a1 + 16);
    int v13 = *(_DWORD *)(a1 + 128);
    uint64_t v14 = *(void **)(a1 + 48);
    id v15 = a7;
    id v16 = a6;
    id v17 = a5;
    id v23 = [v14 allObjects];
    uint64_t v18 = [*(id *)(a1 + 56) allObjects];
    BYTE2(v21) = *(void *)(a1 + 96) != 0;
    LOWORD(v21) = *(_WORD *)(a1 + 132);
    LODWORD(v20) = v13;
    LOBYTE(v19) = 0;
    +[BLSHBacklightEnvironmentStateMachineAbortPayload populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:envStateMachineIsNil:envStateMachinePresentation:addingEnvironmentsCount:envStateMachineUpdatingVisualStateTransitionStates:envStateMachineUpdatingDateSpecifierTransitionStates:envStateMachineBacklightState:envStateMachinePreviousBacklightState:envStateMachinePendingNotifyBeganUpdatingState:envStateMachineUpdatingState:envStateMachineUpdatingPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:envStateMachineIsNil:envStateMachinePresentation:addingEnvironmentsCount:envStateMachineUpdatingVisualStateTransitionStates:envStateMachineUpdatingDateSpecifierTransitionStates:envStateMachineBacklightState:envStateMachinePreviousBacklightState:envStateMachinePendingNotifyBeganUpdatingState:envStateMachineUpdatingState:envStateMachineUpdatingPresentation:", a2, a3, a4, v17, v16, v15, v19, v12, v20, v23, v18, *(void *)(a1 + 104), *(void *)(a1 + 112),
      v21);
  }
}

- (void)transitionState:(id)a3 didBeginUpdateToBacklightState:(int64_t)a4 visualState:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  long long v10 = bls_backlight_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    uint64_t v12 = bls_backlight_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = [v8 environment];
      uint64_t v22 = [v30 identifier];
      lock_updatingVisualStateTransitionStates = self->_lock_updatingVisualStateTransitionStates;
      id v23 = NSStringFromBLSBacklightState();
      __int16 v24 = NSStringFromBLSBacklightState();
      __int16 v25 = NSStringFromBLSBacklightState();
      BOOL pendingNotifyBeganUpdatingState = self->_pendingNotifyBeganUpdatingState;
      BOOL v27 = self->_lock_setPresentationOperation != 0;
      BOOL updatingState = self->_updatingState;
      *(_DWORD *)buf = 134220802;
      uint64_t v32 = self;
      __int16 v33 = 2048;
      id v34 = v8;
      __int16 v35 = 2114;
      id v36 = v22;
      __int16 v37 = 2114;
      uint64_t v38 = lock_updatingVisualStateTransitionStates;
      __int16 v39 = 2114;
      uint64_t v40 = v23;
      __int16 v41 = 2114;
      uint64_t v42 = v24;
      __int16 v43 = 2114;
      int v44 = v25;
      __int16 v45 = 1024;
      BOOL v46 = pendingNotifyBeganUpdatingState;
      __int16 v47 = 1024;
      BOOL v48 = v27;
      __int16 v49 = 1024;
      BOOL v50 = updatingState;
      __int16 v51 = 2114;
      id v52 = v8;
      __int16 v53 = 2114;
      id v54 = v9;
      _os_log_debug_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "ESM:%p (didBeginUpdateToBacklightState:%p:%{public}@), transitionStates:%{public}@, state:%{public}@ target:%{public}@ performEventTarget:%{public}@ pendingNotifyBegan:%{BOOL}u, updatingPres:%{BOOL}u, updating:%{BOOL}u, transitionState:%{public}@, visualState:%{public}@", buf, 0x6Eu);
    }
  }
  didBeginUpdateHistory = self->_didBeginUpdateHistory;
  uint64_t v14 = [BLSHEnvironmentUpdateData alloc];
  id v15 = [v8 environment];
  id v16 = [v15 identifier];
  id v17 = -[BLSHEnvironmentUpdateData initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:](v14, "initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:", v16, a4, -[BLSHBacklightEnvironmentStateMachine withLock_numTransitionsDidNotBeginUpdateBacklightState:]((uint64_t)self, a4));
  [(NSMutableArray *)didBeginUpdateHistory addObject:v17];

  unint64_t v18 = [(NSMutableArray *)self->_didBeginUpdateHistory count];
  if (v18 >= 6) {
    -[NSMutableArray removeObjectsInRange:](self->_didBeginUpdateHistory, "removeObjectsInRange:", 0, v18 - 5);
  }
  uint64_t v19 = self->_lock_setPresentationOperation;
  os_unfair_lock_unlock(&self->_lock);
  if (-[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)self, a4))
  {
    uint64_t v20 = +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:a4];
    -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v20);
  }
  else if (-[BLSHBacklightEnvironmentStateMachine isSetPresentationOperationComplete:]((os_unfair_lock_s *)self, v19))
  {
    -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v19);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v21 = bls_backlight_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightEnvironmentStateMachine transitionState:didBeginUpdateToBacklightState:visualState:]();
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (uint64_t)withLock_numTransitionsDidNotBeginUpdateBacklightState:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__BLSHBacklightEnvironmentStateMachine_withLock_numTransitionsDidNotBeginUpdateBacklightState___block_invoke;
  v6[3] = &__block_descriptor_40_e44_B24__0__BLSHEnvironmentTransitionState_8_B16l;
  v6[4] = a2;
  id v3 = [v2 objectsPassingTest:v6];
  uint64_t v4 = [v3 count];

  return v4;
}

uint64_t __59__BLSHBacklightEnvironmentStateMachine_completedOperation___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  [*(id *)(a1 + 32) UTF8String];
  uint64_t v3 = abort_with_payload();
  return -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:](v3);
}

- (uint64_t)_lock_isSetPresentationOperationComplete:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = [v3 backlightState];
    uint64_t v7 = [v4 additions];
    uint64_t v5 = -[BLSHBacklightEnvironmentStateMachine withLock_allTransitionsDidBeginUpdateBacklightState:environmentFilter:](a1, v6, v7);
  }
  return v5;
}

- (void)transitionState:(id)a3 didCompleteUpdateToBacklightState:(int64_t)a4 visualState:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v54 = a5;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  didCompleteUpdateHistory = self->_didCompleteUpdateHistory;
  long long v10 = [BLSHEnvironmentUpdateData alloc];
  BOOL v11 = [v8 environment];
  uint64_t v12 = [v11 identifier];
  int64_t v55 = a4;
  int v13 = [(BLSHEnvironmentUpdateData *)v10 initWithEnvironmentIdentifier:v12 newBacklightState:a4 pendingTransitionStateCount:[(NSMutableSet *)self->_lock_updatingVisualStateTransitionStates count]];
  [(NSMutableArray *)didCompleteUpdateHistory addObject:v13];

  unint64_t v14 = [(NSMutableArray *)self->_didCompleteUpdateHistory count];
  if (v14 >= 6) {
    -[NSMutableArray removeObjectsInRange:](self->_didCompleteUpdateHistory, "removeObjectsInRange:", 0, v14 - 5);
  }
  int64_t lock_targetBacklightState = self->_lock_targetBacklightState;
  BOOL pendingNotifyBeganUpdatingState = self->_pendingNotifyBeganUpdatingState;
  int v52 = -[BLSHBacklightEnvironmentStateMachine _lock_isActiveTransitionState:]((uint64_t)self, v8);
  id v16 = bls_backlight_log();
  id v17 = v16;
  if (lock_targetBacklightState == a4) {
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v16, v18))
  {
    __int16 v49 = [v8 environment];
    uint64_t v19 = [v49 identifier];
    uint64_t v20 = NSStringFromBLSBacklightState();
    uint64_t v21 = objc_msgSend(v54, "bls_shortLoggingString");
    uint64_t v22 = " (mismatch)";
    if (lock_targetBacklightState == v55) {
      uint64_t v22 = "";
    }
    id v23 = -[NSMutableSet bs_compactMap:](self->_lock_updatingVisualStateTransitionStates, "bs_compactMap:", &__block_literal_global_176, v22);
    __int16 v24 = NSStringFromBLSBacklightState();
    NSStringFromBLSBacklightState();
    __int16 v25 = v51 = v8;
    BOOL v26 = self->_pendingNotifyBeganUpdatingState;
    BOOL v27 = self->_lock_setPresentationOperation != 0;
    BOOL updatingState = self->_updatingState;
    *(_DWORD *)buf = 134221058;
    __int16 v57 = self;
    __int16 v58 = 2048;
    id v59 = v51;
    __int16 v60 = 2114;
    __int16 v61 = v19;
    __int16 v62 = 2114;
    __int16 v63 = v20;
    __int16 v64 = 2114;
    id v65 = v21;
    __int16 v66 = 2080;
    uint64_t v67 = v48;
    __int16 v68 = 2114;
    __int16 v69 = v23;
    __int16 v70 = 2114;
    __int16 v71 = v24;
    __int16 v72 = 2114;
    uint64_t v73 = v25;
    __int16 v74 = 1024;
    BOOL v75 = v26;
    __int16 v76 = 1024;
    BOOL v77 = v27;
    __int16 v78 = 1024;
    BOOL v79 = updatingState;
    __int16 v80 = 1024;
    int v81 = v52 ^ 1;
    _os_log_impl(&dword_21FCFC000, v17, v18, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@ — %{public}@)%s, transitionStates:%{public}@, tar:%{public}@ peTar:%{public}@ pendingNB:%{BOOL}u ∂Pres:%{BOOL}u ∂:%{BOOL}u stale:%{BOOL}u", buf, 0x74u);

    id v8 = v51;
  }

  os_unfair_lock_unlock(lock);
  if (lock_targetBacklightState == v55)
  {
    if ([v8 isUpdatingInitialState])
    {
      uint64_t v29 = bls_backlight_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        uint64_t v40 = [v8 environment];
        __int16 v41 = [v40 identifier];
        uint64_t v42 = NSStringFromBLSBacklightState();
        *(_DWORD *)buf = 134219010;
        __int16 v57 = self;
        __int16 v58 = 2048;
        id v59 = v8;
        __int16 v60 = 2114;
        __int16 v61 = v41;
        __int16 v62 = 2114;
        __int16 v63 = v42;
        __int16 v64 = 2114;
        id v65 = v8;
        _os_log_fault_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_FAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed before begun : %{public}@", buf, 0x34u);
      }
    }
    if (!v52)
    {
      __int16 v31 = bls_backlight_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = [v8 environment];
        __int16 v33 = [v32 identifier];
        id v34 = NSStringFromBLSBacklightState();
        *(_DWORD *)buf = 134219010;
        __int16 v57 = self;
        __int16 v58 = 2048;
        id v59 = v8;
        __int16 v60 = 2114;
        __int16 v61 = v33;
        __int16 v62 = 2114;
        __int16 v63 = v34;
        __int16 v64 = 2114;
        id v65 = v8;
        _os_log_impl(&dword_21FCFC000, v31, OS_LOG_TYPE_DEFAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed inactive transitionState : %{public}@", buf, 0x34u);
      }
      goto LABEL_28;
    }
    if (-[BLSHBacklightEnvironmentStateMachine transitionCompleteAfterCompletingTransitionState:]((uint64_t)self, v8))
    {
      uint64_t v30 = +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:v55];
LABEL_27:
      __int16 v31 = v30;
      -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v30);
LABEL_28:

      goto LABEL_29;
    }
    os_unfair_lock_lock(lock);
    __int16 v35 = bls_backlight_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      __int16 v43 = [v8 environment];
      int v44 = [v43 identifier];
      __int16 v45 = NSStringFromBLSBacklightState();
      BOOL v46 = [(NSMutableSet *)self->_lock_updatingVisualStateTransitionStates bs_compactMap:&__block_literal_global_179];
      int lock_addingEnvironmentsCount = self->_lock_addingEnvironmentsCount;
      *(_DWORD *)buf = 134219266;
      __int16 v57 = self;
      __int16 v58 = 2048;
      id v59 = v8;
      __int16 v60 = 2114;
      __int16 v61 = v44;
      __int16 v62 = 2114;
      __int16 v63 = v45;
      __int16 v64 = 2114;
      id v65 = v46;
      __int16 v66 = 1024;
      LODWORD(v67) = lock_addingEnvironmentsCount;
      _os_log_debug_impl(&dword_21FCFC000, v35, OS_LOG_TYPE_DEBUG, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) still waiting transitionStates:%{public}@, addingEnvironmentsCount:%d", buf, 0x3Au);
    }
    os_unfair_lock_unlock(lock);
    if (pendingNotifyBeganUpdatingState
      && -[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)self, v55))
    {
      id v36 = bls_backlight_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v37 = [v8 environment];
        uint64_t v38 = [v37 identifier];
        __int16 v39 = NSStringFromBLSBacklightState();
        *(_DWORD *)buf = 134219010;
        __int16 v57 = self;
        __int16 v58 = 2048;
        id v59 = v8;
        __int16 v60 = 2114;
        __int16 v61 = v38;
        __int16 v62 = 2114;
        __int16 v63 = v39;
        __int16 v64 = 2114;
        id v65 = v8;
        _os_log_impl(&dword_21FCFC000, v36, OS_LOG_TYPE_DEFAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed before begun (only waiter - will send begun) : %{public}@", buf, 0x34u);
      }
      uint64_t v30 = +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:v55];
      goto LABEL_27;
    }
  }
LABEL_29:
}

- (uint64_t)_lock_isActiveTransitionState:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 48) containsObject:v3]) {
      a1 = 1;
    }
    else {
      a1 = [*(id *)(a1 + 56) containsObject:v3];
    }
  }

  return a1;
}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_transitionState_didCompleteUpdateToBacklightState_visualState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (BOOL)transitionCompleteAfterCompletingTransitionState:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    [*(id *)(a1 + 48) removeObject:v3];
    BOOL v4 = *(int *)(a1 + 128) <= 0 && [*(id *)(a1 + 48) count] == 0;
    -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:](a1, v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_transitionState_didCompleteUpdateToBacklightState_visualState___block_invoke_177(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (void)_lock_ifPossibleStopTrackingTransitionState:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    int v4 = -[BLSHBacklightEnvironmentStateMachine _lock_isActiveTransitionState:](a1, v3);
    if ((v4 & 1) != 0
      || ([v3 isUpdatingInitialState] & 1) != 0
      || ([v3 isUpdatingVisualState] & 1) != 0)
    {
      uint64_t v5 = bls_backlight_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 134218498;
        uint64_t v9 = a1;
        __int16 v10 = 2114;
        id v11 = v3;
        __int16 v12 = 1024;
        int v13 = v4;
        _os_log_debug_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEBUG, "ESM:%p will not stop tracking transitionState:%{public}@ (isActiveTransitionState:%{BOOL}u)", (uint8_t *)&v8, 0x1Cu);
      }
    }
    else
    {
      uint64_t v6 = bls_backlight_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:]();
      }

      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v5 = [v3 environment];
      [v7 removeObjectForKey:v5];
    }
  }
}

- (void)transitionState:(id)a3 didUpdateToDateSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  int v8 = self->_updatingSpecifier;
  if (!v8
    || ![(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates containsObject:v6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:]((uint64_t)self, v6);
    goto LABEL_13;
  }
  uint64_t v9 = [v6 environment];
  __int16 v10 = [(BLSHPresentationDateSpecifier *)v8 dateSpecifierForEnvironment:v9];
  id v11 = [v10 date];

  if (!v7)
  {
LABEL_8:
    if (v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  __int16 v12 = [v7 date];
  if (![v12 isEqualToDate:v11])
  {

    goto LABEL_8;
  }

LABEL_9:
  [(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates removeObject:v6];
LABEL_10:
  uint64_t v14 = [(NSMutableSet *)self->_lock_updatingDateSpecifierTransitionStates count];
  if (!v14)
  {
    lock_updatingDateSpecifierTransitionStates = self->_lock_updatingDateSpecifierTransitionStates;
    self->_lock_updatingDateSpecifierTransitionStates = 0;

    updatingSpecifier = self->_updatingSpecifier;
    self->_updatingSpecifier = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:]((uint64_t)self, v6);
  if (!v14)
  {
    os_unfair_lock_unlock(&self->_lock);
    [WeakRetained environmentStateMachine:self didUpdateToSpecifier:v8];
    goto LABEL_16;
  }
LABEL_13:
  id v17 = bls_backlight_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightEnvironmentStateMachine transitionState:didUpdateToDateSpecifier:]();
  }

  os_unfair_lock_unlock(&self->_lock);
LABEL_16:
}

- (uint64_t)withLock_allTransitionsDidBeginUpdateBacklightState:(void *)a3 environmentFilter:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1 && *(int *)(a1 + 128) <= 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          if (!v5
            || (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "environment", (void)v16),
                int v13 = objc_claimAutoreleasedReturnValue(),
                int v14 = [v5 containsObject:v13],
                v13,
                v14))
          {
            if ((objc_msgSend(v12, "isUpdatingInitialState", (void)v16) & 1) != 0
              || ![v12 isUpdatedToBacklightState:a2])
            {
              uint64_t v6 = 0;
              goto LABEL_17;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = 1;
LABEL_17:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __95__BLSHBacklightEnvironmentStateMachine_withLock_numTransitionsDidNotBeginUpdateBacklightState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUpdatingInitialState]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isUpdatedToBacklightState:*(void *)(a1 + 32)] ^ 1;
  }

  return v4;
}

- (BLSHInactiveBudgetPolicing_Private)inactiveBudgetPolicy
{
  return self->_inactiveBudgetPolicy;
}

- (BLSHOSTimerProviding)osTimerProvider
{
  return self->_osTimerProvider;
}

- (BLSHBacklightEnvironmentStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSHBacklightEnvironmentStateMachineDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_staleEnvironmentsThatNeedDeferredUpdate, 0);
  objc_storeStrong((id *)&self->_lock_setPresentationOperation, 0);
  objc_storeStrong((id *)&self->_didCompleteUpdateHistory, 0);
  objc_storeStrong((id *)&self->_didBeginUpdateHistory, 0);
  objc_storeStrong((id *)&self->_performEventHistory, 0);
  objc_storeStrong((id *)&self->_updatingSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_updatingDateSpecifierTransitionStates, 0);
  objc_storeStrong((id *)&self->_lock_updatingVisualStateTransitionStates, 0);
  objc_storeStrong((id *)&self->_transitionStates, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);

  objc_storeStrong((id *)&self->_lock_presentation, 0);
}

- (void)initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)onMain_setPresentation:withTargetBacklightState:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  SEL v1 = [v0 debugDescription];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12(&dword_21FCFC000, v2, v3, "ESM:%p calling setPresentation on invalidated state machine:%{public}@ presentation:%{public}@", v4, v5, v6, v7, 2u);
}

- (void)onMain_setPresentation:withTargetBacklightState:.cold.2()
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

- (void)onMain_setPresentation:withTargetBacklightState:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "ESM:%p finishing (immediate complete - update also) setPresentation:%{public}@");
}

- (void)onMain_setPresentation:withTargetBacklightState:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "ESM:%p finishing (immediate complete) setPresentation:%{public}@");
}

- (void)onMain_setPresentation:(os_log_t)log withTargetBacklightState:.cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 134218498;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEBUG, "ESM:%p (finishing - waiting) setPresentation:%p transitionStates:%{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)onMain_setPresentation:(uint64_t)a1 withTargetBacklightState:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v3 = NSStringFromBLSBacklightState();
  uint64_t v10 = [a2 valueForKeyPath:@"identifier"];
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v4, v5, "ESM: setPresentation: -> %@ environments %@", v6, v7, v8, v9, 2u);
}

void __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = NSStringFromBLSBacklightState();
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v5, v6, "ESM: updateTransitionStatesForEnvironments: -> %@ environment %@: %@", v7, v8, v9, v10, 2u);
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "bls_shortLoggingString");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v3, v4, "ESM:%p finishing (immediate complete) performEvent:%{public}@", v5, v6, v7, v8, v9);
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "bls_shortLoggingString");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_21FCFC000, v3, v4, "ESM:%p finishing (immediate begin update) performEvent:%{public}@", v5, v6, v7, v8, v9);
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v8 = objc_msgSend(a2, "bls_shortLoggingString");
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v2, v3, "ESM:%p (finishing - waiting) performEvent:%{public}@ transitionStates:%{public}@ ", v4, v5, v6, v7, 2u);
}

- (void)onMain_updateEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  os_log_t v1 = [v0 debugDescription];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12(&dword_21FCFC000, v2, v3, "ESM:%p calling updateEnvironment on invalidated state machine:%{public}@ environment:%{public}@", v4, v5, v6, v7, 2u);
}

- (void)transitionState:didBeginUpdateToBacklightState:visualState:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = [v3 environment];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = *(void *)(v2 + 48);
  int v7 = *(_DWORD *)(v2 + 128);
  int v8 = 134219010;
  uint64_t v9 = v2;
  __int16 v10 = 2048;
  uint64_t v11 = v1;
  __int16 v12 = 2114;
  int v13 = v5;
  __int16 v14 = 2114;
  uint64_t v15 = v6;
  __int16 v16 = 1024;
  int v17 = v7;
  _os_log_debug_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_DEBUG, "ESM:%p (didBeginUpdateToBacklightState:%p:%{public}@) still waiting transitionStates:%{public}@, addingEnvironmentsCount:%d", (uint8_t *)&v8, 0x30u);
}

- (void)_lock_ifPossibleStopTrackingTransitionState:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "ESM:%p will stop tracking transitionState:%{public}@");
}

- (void)transitionState:didUpdateToDateSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = [v3 environment];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = *(void *)(v2 + 56);
  int v7 = 134218754;
  uint64_t v8 = v2;
  __int16 v9 = 2048;
  uint64_t v10 = v1;
  __int16 v11 = 2114;
  __int16 v12 = v5;
  __int16 v13 = 2114;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_DEBUG, "ESM:%p (didUpdateToDateSpecifier:%p:%{public}@) still waiting transitionStates:%{public}@", (uint8_t *)&v7, 0x2Au);
}

@end