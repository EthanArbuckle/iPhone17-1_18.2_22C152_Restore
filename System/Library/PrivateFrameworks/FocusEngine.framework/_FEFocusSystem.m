@interface _FEFocusSystem
+ (BOOL)environment:(id)a3 containsEnvironment:(id)a4;
+ (NSArray)_allFocusSystems;
+ (id)_focusSystemForEnvironment:(id)a3;
+ (id)focusSystemForEnvironment:(id)a3;
- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4;
- (BOOL)_focusSystemIsValid;
- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4;
- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4;
- (BOOL)_hasValidItemForCurrentDeferralState;
- (BOOL)_isEnabled;
- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5;
- (BOOL)_isEnvironmentLocked:(id)a3;
- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4;
- (BOOL)_performDeferredFocusUpdateIfAvailable;
- (BOOL)_performFocusMovement:(id)a3;
- (BOOL)_postsFocusUpdateNotifications;
- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3;
- (BOOL)_prefersFocusContainment;
- (BOOL)_requiresFocusedItemToBeInHierarchy;
- (BOOL)_shouldRestoreFocusInContext:(id)a3;
- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3;
- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3;
- (BOOL)_shouldUpdateFocusInContext:(id)a3;
- (BOOL)_uiktest_updateFocusToItem:(id)a3;
- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3;
- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5;
- (BOOL)_updateFocusImmediatelyWithContext:(id)a3;
- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4;
- (BOOL)waitingForFocusMovementAction;
- (CGRect)_clippingRectInCoordinateSpace:(id)a3;
- (NSNumber)_overrideFocusDeferralBehavior;
- (NSString)description;
- (_FEFocusBehavior)behavior;
- (_FEFocusCastingController)_focusCastingController;
- (_FEFocusEnvironment)_deepestPreferredFocusEnvironment;
- (_FEFocusEnvironment)_disappearingFocusEnvironment;
- (_FEFocusEnvironment)_parentFocusEnvironment;
- (_FEFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate;
- (_FEFocusGroupHistory)_focusGroupHistory;
- (_FEFocusItem)_focusedItemOrDeferralTarget;
- (_FEFocusItem)_previousFocusedItem;
- (_FEFocusItem)focusedItem;
- (_FEFocusItemContainer)_focusItemContainer;
- (_FEFocusLinearMovementCache)_focusMovementCache;
- (_FEFocusMovementAction)pendingFocusMovementAction;
- (_FEFocusMovementPerformer)_movementPerformer;
- (_FEFocusRegionContainer)_focusMapContainer;
- (_FEFocusSystem)_hostFocusSystem;
- (_FEFocusSystem)init;
- (_FEFocusSystem)initWithFocusBehavior:(id)a3;
- (_FEFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4;
- (_FEFocusSystemDelegate)delegate;
- (_FEFocusUpdateThrottle)updateThrottle;
- (_FETreeLock)treeLock;
- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4;
- (id)_contextForUpdateToEnvironment:(id)a3;
- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5;
- (id)_focusItemForValidation;
- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3;
- (id)_topEnvironment;
- (id)_validatedAppearingFocusEnvironmentRequest;
- (id)_validatedPendingFocusUpdateRequest;
- (id)preferredFocusEnvironments;
- (int64_t)_effectiveFocusDeferralBehavior;
- (void)_buildFocusItemAncestorCacheIfNecessary;
- (void)_cancelPendingFocusRestoration;
- (void)_clearDeferredFocusUpdateTarget;
- (void)_clearFocusItemAncestorCache;
- (void)_didFinishUpdatingFocusInContext:(id)a3;
- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4;
- (void)_focusBehaviorDidChange;
- (void)_focusEnvironmentDidAppear:(id)a3;
- (void)_focusEnvironmentDidBecomeVisible:(id)a3;
- (void)_focusEnvironmentWillBecomeInvisible:(id)a3;
- (void)_focusEnvironmentWillDisappear:(id)a3;
- (void)_handleFocusMovementAction:(id)a3;
- (void)_lockEnvironment:(id)a3;
- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4;
- (void)_performWithoutFocusUpdates:(id)a3;
- (void)_prepareForTeardown;
- (void)_reevaluateLockedEnvironments;
- (void)_requestFocusUpdate:(id)a3;
- (void)_resetFocusDeferral;
- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3;
- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4;
- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3;
- (void)_setDeferredFocusUpdateTarget:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setFocusCastingController:(id)a3;
- (void)_setFocusMovementCache:(id)a3;
- (void)_setNeedsFocusRestoration;
- (void)_setOverrideFocusDeferralBehavior:(id)a3;
- (void)_startDeferringFocusIfSupported;
- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3;
- (void)_uiktest_disableFocusDeferral;
- (void)_uiktest_disableThrottle;
- (void)_uiktest_setPreviousFocusedItem:(id)a3;
- (void)_unlockEnvironment:(id)a3;
- (void)_updateFocusUpdateThrottle;
- (void)_updateWantsTreeLocking;
- (void)invalidateFocusItemContainer:(id)a3;
- (void)requestFocusUpdateToEnvironment:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setPendingFocusMovementAction:(id)a3;
- (void)setWaitingForFocusMovementAction:(BOOL)a3;
- (void)updateFocusIfNeeded;
@end

@implementation _FEFocusSystem

- (_FEFocusSystem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:112 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_FEFocusSystem)initWithFocusBehavior:(id)a3
{
  return [(_FEFocusSystem *)self initWithFocusBehavior:a3 enabled:1];
}

- (_FEFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusSystem;
  v8 = [(_FEFocusSystem *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_behavior, a3);
    v9->_enabled = a4;
    v10 = (_FEFocusMovementPerformer *)objc_opt_new();
    [(_FEFocusMovementPerformer *)v10 setDelegate:v9];
    movementPerformer = v9->_movementPerformer;
    v9->_movementPerformer = v10;
    v12 = v10;

    uint64_t v13 = qword_269A11C18;
    v14 = v9;
    if (v13 != -1) {
      dispatch_once(&qword_269A11C18, &__block_literal_global_0);
    }
    [(id)_MergedGlobals_4 addObject:v14];

    [(_FEFocusSystem *)v14 _focusBehaviorDidChange];
  }

  return v9;
}

- (void)_prepareForTeardown
{
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a3)
  {
LABEL_10:
    [(_FEFocusSystem *)self setWaitingForFocusMovementAction:0];
    if (self->_enabled == v3) {
      return;
    }
    v9 = [(_FEFocusSystem *)self _hostFocusSystem];

    if (!v9)
    {
      v10 = logger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = @"disabled";
        if (v3) {
          v11 = @"enabled";
        }
        int v23 = 138543362;
        v24 = v11;
        _os_log_impl(&dword_24F3F0000, v10, OS_LOG_TYPE_INFO, "Focus system %{public}@", (uint8_t *)&v23, 0xCu);
      }
    }
    self->_enabled = v3;
    if (!v3)
    {
      objc_super v16 = [(_FEFocusSystem *)self focusedItem];

      if (v16) {
        [(_FEFocusSystem *)self _setNeedsFocusRestoration];
      }
      v17 = [(_FEFocusSystem *)self _contextForUpdateToEnvironment:0];
      [(_FEFocusSystem *)self _updateFocusWithContext:v17 report:0];
      [(_FEFocusSystem *)self setPendingFocusMovementAction:0];
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      goto LABEL_30;
    }
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFFB);
      uint64_t v13 = [(_FEFocusSystem *)self _previousFocusedItem];
      v14 = [(_FEFocusSystem *)self _contextForUpdateToEnvironment:v13];

      if ([(_FEFocusSystem *)self _shouldRestoreFocusInContext:v14])
      {
        v15 = [(_FEFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v14 report:0];

        [(_FEFocusSystem *)self _updateFocusWithContext:v15 report:0];
        if (!self->_pendingFocusUpdateRequest) {
          goto LABEL_29;
        }
        goto LABEL_27;
      }
    }
    if (!self->_pendingFocusUpdateRequest)
    {
      v21 = [[_FEFocusUpdateRequest alloc] initWithEnvironment:self];
      [(_FEFocusSystem *)self _requestFocusUpdate:v21];
      [(_FEFocusSystem *)self updateFocusIfNeeded];

      goto LABEL_29;
    }
LABEL_27:
    [(_FEFocusSystem *)self updateFocusIfNeeded];
LABEL_29:
    [(_FEFocusSystem *)self _tickHasSeenFocusedItemTimer:0];
LABEL_30:
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 postNotificationName:@"_FEFocusSystemEnabledStateDidChangeNotification" object:self];

    return;
  }
  v5 = [(_FEFocusSystem *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v6 = [(_FEFocusSystem *)self delegate];
  if (([v6 _shouldWaitForFocusMovementActionToEnableFocusSystem:self] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v7 = [(_FEFocusSystem *)self pendingFocusMovementAction];

  if (v7) {
    goto LABEL_10;
  }
  v8 = logger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_24F3F0000, v8, OS_LOG_TYPE_INFO, "Tried to enable focus system without receiving focus movement action, waiting until action is received to enable", (uint8_t *)&v23, 2u);
  }

  [(_FEFocusSystem *)self setWaitingForFocusMovementAction:1];
}

- (BOOL)_focusSystemIsValid
{
  return (*(unsigned char *)&self->_flags & 1) == 0;
}

- (_FEFocusItem)focusedItem
{
  p_focusedItem = &self->_focusedItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  if (WeakRetained
    && [(_FEFocusSystem *)self _requiresFocusedItemToBeInHierarchy])
  {
    id v5 = objc_loadWeakRetained((id *)p_focusedItem);
    _FEFocusEnvironmentRootAncestorEnvironment(v5);
    v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
    if (v6 == self) {
      id v7 = objc_loadWeakRetained((id *)p_focusedItem);
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_focusedItem);
  }

  return (_FEFocusItem *)v7;
}

- (_FEFocusItem)_focusedItemOrDeferralTarget
{
  BOOL v3 = [(_FEFocusSystem *)self focusedItem];
  v4 = v3;
  if (v3) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  }
  v6 = WeakRetained;

  return (_FEFocusItem *)v6;
}

- (id)_focusItemForValidation
{
  BOOL v3 = [(_FEFocusSystem *)self _focusedItemOrDeferralTarget];
  if (v3 || [(_FEFocusSystem *)self _isEnabled]) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  }
  id v5 = WeakRetained;

  return v5;
}

- (BOOL)_hasValidItemForCurrentDeferralState
{
  int64_t v4 = [(_FEFocusSystem *)self _effectiveFocusDeferralBehavior];
  if ((unint64_t)(v4 - 1) < 4)
  {
    id v5 = [(_FEFocusSystem *)self _focusedItemOrDeferralTarget];
LABEL_5:
    BOOL v2 = v5 != 0;

    return v2;
  }
  if (!v4)
  {
    id v5 = [(_FEFocusSystem *)self focusedItem];
    goto LABEL_5;
  }
  return v2;
}

- (void)_setFocusCastingController:(id)a3
{
  id v5 = (_FEFocusCastingController *)a3;
  focusCastingController = self->_focusCastingController;
  if (focusCastingController != v5)
  {
    id v7 = v5;
    if (focusCastingController)
    {
      [(_FEFocusCastingController *)focusCastingController setFocusSystem:0];
      [(_FEFocusCastingController *)self->_focusCastingController teardown];
      id v5 = v7;
    }
    [(_FEFocusCastingController *)v5 setFocusSystem:self];
    objc_storeStrong((id *)&self->_focusCastingController, a3);
  }
  MEMORY[0x270F9A758]();
}

- (_FEFocusGroupHistory)_focusGroupHistory
{
  focusGroupHistory = self->_focusGroupHistory;
  if (!focusGroupHistory)
  {
    int64_t v4 = (_FEFocusGroupHistory *)objc_opt_new();
    id v5 = self->_focusGroupHistory;
    self->_focusGroupHistory = v4;

    focusGroupHistory = self->_focusGroupHistory;
  }
  return focusGroupHistory;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 309, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  switch([(_FEFocusSystem *)self _effectiveFocusDeferralBehavior])
  {
    case 1:
    case 4:
      v6 = [v5 _request];
      char v7 = [v6 allowsDeferral];
      goto LABEL_5;
    case 2:
      char v7 = 1;
      break;
    case 3:
      v6 = [v5 _request];
      if ([v6 allowsDeferral])
      {
        v9 = [v5 nextFocusedItem];
        if (_FEFocusDeferralModeForItem(v9) == 1)
        {
          char v7 = 1;
        }
        else if ((*(unsigned char *)&self->_flags & 0x10) != 0)
        {
          char v7 = 0;
        }
        else
        {
          v10 = [v5 nextFocusedItem];
          char v7 = _FEFocusDeferralModeForItem(v10) != 2;
        }
      }
      else
      {
        char v7 = 0;
      }
LABEL_5:

      break;
    default:
      char v7 = 0;
      break;
  }

  return v7;
}

- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 nextFocusedItem];
  if (!v9
    || (v10 = (void *)v9,
        BOOL v11 = [(_FEFocusSystem *)self _prefersDeferralForFocusUpdateInContext:v8], v10, !v11))
  {
    [(_FEFocusSystem *)self _setDeferredFocusUpdateTarget:0];
    v20 = v8;
    goto LABEL_17;
  }
  int v12 = [v7 shouldLog];
  uint64_t v13 = logger();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      v15 = [v8 nextFocusedItem];
      if (v15)
      {
        objc_super v16 = NSString;
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
      }
      else
      {
        v19 = @"(nil)";
      }
      uint64_t v25 = +[_FEDebugReportFormatter defaultFormatter];
      v26 = [v25 stringFromReport:v7];
      *(_DWORD *)buf = 138543618;
      v30 = v19;
      __int16 v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_24F3F0000, v13, OS_LOG_TYPE_INFO, "Deferring focus update to item %{public}@:\n%{public}@", buf, 0x16u);

LABEL_15:
    }
  }
  else if (v14)
  {
    v21 = [v8 nextFocusedItem];
    if (v21)
    {
      v22 = NSString;
      int v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v19 = [v22 stringWithFormat:@"<%@: %p>", v24, v21];
    }
    else
    {
      v19 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    _os_log_impl(&dword_24F3F0000, v13, OS_LOG_TYPE_INFO, "Deferring focus update to item %{public}@. No additional info available.", buf, 0xCu);

    goto LABEL_15;
  }

  v27 = [v8 nextFocusedItem];
  [(_FEFocusSystem *)self _setDeferredFocusUpdateTarget:v27];

  v20 = [(_FEFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:0];

LABEL_17:
  return v20;
}

- (BOOL)_performDeferredFocusUpdateIfAvailable
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(_FEFocusSystem *)self _isEnabled]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  if (WeakRetained && [(_FEFocusSystem *)self _effectiveFocusDeferralBehavior] != 2)
  {
    id v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v8 = NSString;
      id v9 = WeakRetained;
      v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      int v12 = [v8 stringWithFormat:@"<%@: %p>", v11, v9];

      *(_DWORD *)buf = 138543362;
      BOOL v14 = v12;
      _os_log_debug_impl(&dword_24F3F0000, v5, OS_LOG_TYPE_DEBUG, "Executing previously deferred focus update to item %{public}@", buf, 0xCu);
    }
    [(_FEFocusSystem *)self _setDeferredFocusUpdateTarget:0];
    id v6 = [(_FEFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:WeakRetained];
    [v6 _setDeferredUpdate:1];
    BOOL v4 = [(_FEFocusSystem *)self _updateFocusImmediatelyWithContext:v6];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  int64_t v5 = [(_FEFocusSystem *)self _effectiveFocusDeferralBehavior];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  [WeakRetained invalidate];

  id v7 = [(_FEFocusSystem *)self focusedItem];

  if (v7 && v5 == 3)
  {
    if (v3)
    {
      id v8 = logger();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

      v10 = logger();
      BOOL v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v12 = [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 138543362;
          v18 = v12;
          _os_log_debug_impl(&dword_24F3F0000, v11, OS_LOG_TYPE_DEBUG, "Disabling focus deferral.\n%{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24F3F0000, v11, OS_LOG_TYPE_INFO, "Disabling focus deferral.", buf, 2u);
      }

      *(_DWORD *)&self->_flags |= 0x10u;
    }
    objc_initWeak((id *)buf, self);
    uint64_t v13 = (void *)MEMORY[0x263EFFA20];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47___FEFocusSystem__tickHasSeenFocusedItemTimer___block_invoke;
    v15[3] = &unk_265328038;
    objc_copyWeak(&v16, (id *)buf);
    BOOL v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:v15 block:60.0];
    objc_storeWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_resetFocusDeferral
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    BOOL v3 = logger();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    int64_t v5 = logger();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [MEMORY[0x263F08B88] callStackSymbols];
        int v11 = 138543362;
        int v12 = v7;
        _os_log_debug_impl(&dword_24F3F0000, v6, OS_LOG_TYPE_DEBUG, "Starting to defer focus updates.\n%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_24F3F0000, v6, OS_LOG_TYPE_INFO, "Starting to defer focus updates.", (uint8_t *)&v11, 2u);
    }
  }
  [MEMORY[0x263F08B88] cancelPreviousPerformRequestsWithTarget:self selector:sel__hasSeenFocusedItemDidExpire object:0];
  *(_DWORD *)&self->_flags &= ~0x10u;
  id v8 = [(_FEFocusSystem *)self behavior];
  uint64_t v9 = [v8 focusCastingMode];

  if (v9 == 2)
  {
    v10 = [(_FEFocusSystem *)self _focusCastingController];
    [v10 forgetEntryPoint];
  }
}

- (void)_startDeferringFocusIfSupported
{
  [(_FEFocusSystem *)self _resetFocusDeferral];
  int64_t v3 = [(_FEFocusSystem *)self _effectiveFocusDeferralBehavior];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 != 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
      goto LABEL_10;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_focusedItem);
    BOOL v4 = _FEFocusDeferralModeForItem(v5) != 2;
  }
  else
  {
    BOOL v4 = 1;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_focusedItem);

  if (!v6 || !v4) {
    return;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
  [(_FEFocusSystem *)self _dropFocusAndStartDeferring:0 suppressUpdate:1];
  [(_FEFocusSystem *)self _setDeferredFocusUpdateTarget:v8];
  id WeakRetained = v8;
LABEL_10:
}

- (void)_clearDeferredFocusUpdateTarget
{
}

- (void)_setDeferredFocusUpdateTarget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_deferredFocusUpdateTarget, obj);
    if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
    {
      id v5 = [(_FEFocusSystem *)self delegate];
      [v5 _focusSystem:self didUpdateDeferralTarget:obj];
    }
  }
}

- (int64_t)_effectiveFocusDeferralBehavior
{
  int64_t v3 = [(_FEFocusSystem *)self _overrideFocusDeferralBehavior];
  BOOL v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    id v6 = [(_FEFocusSystem *)self behavior];
    int64_t v5 = [v6 focusDeferral];
  }
  return v5;
}

- (void)_setOverrideFocusDeferralBehavior:(id)a3
{
  int64_t v5 = (NSNumber *)a3;
  uint64_t p_overrideFocusDeferralBehavior = (uint64_t)&self->_overrideFocusDeferralBehavior;
  if (self->_overrideFocusDeferralBehavior != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_overrideFocusDeferralBehavior, a3);
    if ([(_FEFocusSystem *)self _effectiveFocusDeferralBehavior])
    {
      uint64_t p_overrideFocusDeferralBehavior = [(_FEFocusSystem *)self _startDeferringFocusIfSupported];
    }
    else
    {
      uint64_t p_overrideFocusDeferralBehavior = [(_FEFocusSystem *)self _performDeferredFocusUpdateIfAvailable];
      int64_t v5 = v7;
      if (p_overrideFocusDeferralBehavior) {
        goto LABEL_7;
      }
      [(_FEFocusSystem *)self requestFocusUpdateToEnvironment:self];
      uint64_t p_overrideFocusDeferralBehavior = [(_FEFocusSystem *)self updateFocusIfNeeded];
    }
    int64_t v5 = v7;
  }
LABEL_7:
  MEMORY[0x270F9A758](p_overrideFocusDeferralBehavior, v5);
}

+ (id)focusSystemForEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_FEFocusSystem.m", 531, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  id v6 = (id)_MergedGlobals_4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = _FEFocusEnvironmentRootAncestorEnvironment(v5);
    if ([v7 containsObject:v8])
    {
      if ([v8 _focusSystemIsValid]) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_focusSystemForEnvironment:(id)a3
{
  return +[_FEFocusSystem focusSystemForEnvironment:a3];
}

+ (NSArray)_allFocusSystems
{
  BOOL v2 = [(id)_MergedGlobals_4 allObjects];
  int64_t v3 = v2;
  if (!v2) {
    BOOL v2 = (void *)MEMORY[0x263EFFA68];
  }
  BOOL v4 = v2;

  return v4;
}

- (_FEFocusEnvironment)_parentFocusEnvironment
{
  return 0;
}

- (_FEFocusRegionContainer)_focusMapContainer
{
  int64_t v3 = [_FEFocusRegionContainerProxy alloc];
  BOOL v4 = [(_FEFocusSystem *)self _focusItemContainer];
  id v5 = [(_FEFocusRegionContainerProxy *)v3 initWithOwningEnvironment:self itemContainer:v4];

  [(_FEFocusRegionContainerProxy *)v5 setAllowsLazyLoading:0];
  [(_FEFocusRegionContainerProxy *)v5 setShouldCreateRegionForOwningItem:0];
  [(_FEFocusRegionContainerProxy *)v5 setShouldCreateRegionForGuideBehavior:0];
  return (_FEFocusRegionContainer *)v5;
}

- (_FEFocusItemContainer)_focusItemContainer
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && ($C26450B17F84A6D740AC00827B43141C flags = self->_flags, WeakRetained, (*(_DWORD *)&flags & 0x10000) != 0))
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [v7 _focusItemContainerForFocusSystem:self];
  }
  else
  {
    id v6 = 0;
  }
  return (_FEFocusItemContainer *)v6;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    id v8 = a3;
    uint64_t v9 = [(_FEFocusSystem *)self delegate];
    [v9 _clippingRectForFocusSystem:self inCoordinateSpace:v8];
    double v3 = v10;
    double v4 = v11;
    double v5 = v12;
    double v6 = v13;
  }
  else
  {
    double v3 = *MEMORY[0x263F001A0];
    double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)preferredFocusEnvironments
{
  double v4 = [(_FEFocusSystem *)self delegate];
  double v5 = v4;
  if (!v4 || (*(unsigned char *)&self->_flags & 0x80) == 0) {
    goto LABEL_3;
  }
  double v6 = [v4 _preferredFocusEnvironmentsForFocusSystem:self];
  if (!v6)
  {
    double v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:607 description:@"Returning nil for a focus system's preferred focus environments is not allowed."];

LABEL_3:
    double v6 = 0;
  }
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v8 = v7;

  return v8;
}

- (void)setNeedsFocusUpdate
{
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_prefersFocusContainment
{
  return 1;
}

+ (BOOL)environment:(id)a3 containsEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    double v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_FEFocusSystem.m", 639, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    double v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_FEFocusSystem.m", 640, @"Invalid parameter not satisfying: %@", @"otherEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(v7, v9);

  return IsAncestorOfEnvironment;
}

- (void)requestFocusUpdateToEnvironment:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    double v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 649, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  double v5 = [[_FEFocusUpdateRequest alloc] initWithEnvironment:v7];
  [(_FEFocusSystem *)self _requestFocusUpdate:v5];
}

- (void)_requestFocusUpdate:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 656, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  if (([v5 isFocusRemovalRequest] & 1) == 0)
  {
    double v6 = (void *)[v5 copy];

    [v6 cacheCurrentFocusSystem];
    if (![v6 isValidInFocusSystem:self]) {
      goto LABEL_33;
    }
    id v7 = [(_FEFocusSystem *)self _validatedPendingFocusUpdateRequest];
    id v8 = v7;
    if (v7 && [v7 canMergeWithRequest:v6])
    {
      uint64_t v9 = [v8 requestByMergingWithRequest:v6];

      BOOL v10 = 1;
      double v6 = (void *)v9;
    }
    else
    {
      id v11 = [v6 environment];
      double v12 = logger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        double v13 = objc_opt_new();
      }
      else {
        double v13 = 0;
      }

      id v46 = 0;
      BOOL v14 = [(_FEFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:v11 fallbackToEnvironment:&v46 debugReport:v13];
      id v15 = v46;
      if (!v14)
      {
        double v16 = logger();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
        if (!v15 || v11 == v15)
        {
          if (v17)
          {
            id v24 = v11;
            if (v24)
            {
              v34 = NSString;
              v35 = (objc_class *)objc_opt_class();
              v36 = NSStringFromClass(v35);
              uint64_t v25 = [v34 stringWithFormat:@"<%@: %p>", v36, v24];
            }
            else
            {
              uint64_t v25 = @"(nil)";
            }

            v37 = objc_opt_new();
            v38 = [v37 stringFromReport:v13];
            *(_DWORD *)location = 138543618;
            *(void *)&location[4] = v25;
            __int16 v48 = 2114;
            v49 = v38;
            _os_log_debug_impl(&dword_24F3F0000, v16, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for ineligible environment %{public}@.\n%{public}@", location, 0x16u);
          }
        }
        else
        {
          if (v17)
          {
            id v23 = v11;
            if (v23)
            {
              v43 = NSString;
              v26 = (objc_class *)objc_opt_class();
              v27 = NSStringFromClass(v26);
              v42 = [v43 stringWithFormat:@"<%@: %p>", v27, v23];
            }
            else
            {
              v42 = @"(nil)";
            }

            v28 = NSString;
            id v29 = v15;
            v41 = v42;
            v30 = (objc_class *)objc_opt_class();
            __int16 v31 = NSStringFromClass(v30);
            v40 = [v28 stringWithFormat:@"<%@: %p>", v31, v29];

            v32 = objc_opt_new();
            uint64_t v33 = [v32 stringFromReport:v13];
            *(_DWORD *)location = 138543874;
            *(void *)&location[4] = v42;
            __int16 v48 = 2114;
            v49 = v40;
            __int16 v50 = 2114;
            v51 = v33;
            _os_log_debug_impl(&dword_24F3F0000, v16, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for ineligible environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", location, 0x20u);
          }
          double v16 = [v6 requestByRedirectingRequestToEnvironment:v15];
          [(_FEFocusSystem *)self _requestFocusUpdate:v16];
        }

        goto LABEL_32;
      }

      if (v8) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = self->_appearingFocusEnvironment != 0;
      }
    }
    objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, v6);
    v18 = [(_FEFocusSystem *)self updateThrottle];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      if (!v10)
      {
        objc_initWeak((id *)location, self);
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __38___FEFocusSystem__requestFocusUpdate___block_invoke;
        v44[3] = &unk_265328060;
        objc_copyWeak(&v45, (id *)location);
        v22 = v44;
        if (UIKitCoreLibraryCore())
        {
          if (qword_269A11C28 != -1) {
            dispatch_once(&qword_269A11C28, &__block_literal_global_470);
          }
          [(id)qword_269A11C20 _performBlockAfterCATransactionCommits:v22];
        }
        else
        {
          dispatch_async(MEMORY[0x263EF83A0], v22);
        }

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)location);
      }
    }
    else
    {
      v20 = [(_FEFocusSystem *)self updateThrottle];
      [v20 scheduleProgrammaticFocusUpdate];

      if ([v6 resetsUpdateThrottle])
      {
        v21 = [(_FEFocusSystem *)self updateThrottle];
        [v21 reset];
      }
    }
LABEL_32:

    goto LABEL_33;
  }
  double v6 = v5;
LABEL_33:
}

- (void)_focusEnvironmentWillBecomeInvisible:(id)a3
{
  id v4 = a3;
  if ([(_FEFocusSystem *)self _focusSystemIsValid])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55___FEFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke;
    v5[3] = &unk_265328088;
    v5[4] = self;
    id v6 = v4;
    if (UIKitCoreLibraryCore())
    {
      if (qword_269A11C28 != -1) {
        dispatch_once(&qword_269A11C28, &__block_literal_global_470);
      }
      [(id)qword_269A11C20 _performBlockAfterCATransactionCommits:v5];
    }
    else
    {
      dispatch_async(MEMORY[0x263EF83A0], v5);
    }
  }
}

- (void)_focusEnvironmentWillDisappear:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(_FEFocusSystem *)self _focusSystemIsValid])
  {
    id v6 = [(_FEFocusSystem *)self focusedItem];
    if (v6) {
      BOOL v7 = [(_FEFocusSystem *)self _focusedItemIsContainedInEnvironment:v5 includeSelf:1];
    }
    else {
      BOOL v7 = 0;
    }

    id v8 = logger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      uint64_t v9 = objc_opt_new();
    }
    else {
      uint64_t v9 = 0;
    }

    id v41 = 0;
    BOOL v10 = [(_FEFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:v5 fallbackToEnvironment:&v41 debugReport:v9];
    id v11 = v41;
    if (v10)
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __49___FEFocusSystem__focusEnvironmentWillDisappear___block_invoke;
      v38[3] = &unk_2653280B0;
      id v39 = v5;
      v40 = self;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v39, v38);
      objc_storeStrong((id *)&self->_disappearingFocusEnvironment, a3);
    }
    else
    {
      double v12 = logger();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
        {
          id v17 = v5;
          if (v17)
          {
            v21 = NSString;
            v22 = (objc_class *)objc_opt_class();
            id v23 = NSStringFromClass(v22);
            v18 = [v21 stringWithFormat:@"<%@: %p>", v23, v17];
          }
          else
          {
            v18 = @"(nil)";
          }
          v37 = v18;

          id v24 = NSString;
          id v25 = v11;
          v26 = v18;
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          id v29 = [v24 stringWithFormat:@"<%@: %p>", v28, v25];

          v30 = objc_opt_new();
          __int16 v31 = [v30 stringFromReport:v9];
          *(_DWORD *)buf = 138543874;
          v43 = v37;
          __int16 v44 = 2114;
          id v45 = v29;
          __int16 v46 = 2114;
          v47 = v31;
          _os_log_debug_impl(&dword_24F3F0000, v12, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for disappearing focus environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", buf, 0x20u);
        }
        [(_FEFocusSystem *)self requestFocusUpdateToEnvironment:v11];
      }
      else
      {
        if (v13)
        {
          id v19 = v5;
          if (v19)
          {
            v32 = NSString;
            uint64_t v33 = (objc_class *)objc_opt_class();
            v34 = NSStringFromClass(v33);
            v20 = [v32 stringWithFormat:@"<%@: %p>", v34, v19];
          }
          else
          {
            v20 = @"(nil)";
          }

          v35 = objc_opt_new();
          v36 = [v35 stringFromReport:v9];
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          __int16 v44 = 2114;
          id v45 = v36;
          _os_log_debug_impl(&dword_24F3F0000, v12, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for disappearing focus environment %{public}@.\n%{public}@", buf, 0x16u);
        }
      }
    }
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    if (v7
      && [(_FEFocusSystem *)self _isEnabled]
      && ![(_FEFocusSystem *)self _isEnvironmentLocked:v5]
      && (*(unsigned char *)&self->_flags & 2) == 0)
    {
      BOOL v14 = self->_pendingFocusUpdateRequest;
      [(_FEFocusSystem *)self _dropFocusAndStartDeferring:0 suppressUpdate:1];
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = v14;
    }
    double v16 = [(_FEFocusSystem *)self _focusMovementCache];
    [v16 environmentWillDisappear:v5];
  }
}

- (void)_focusEnvironmentDidBecomeVisible:(id)a3
{
  id v6 = a3;
  if ([(_FEFocusSystem *)self _focusSystemIsValid])
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0
      || ([(_FEFocusSystem *)self _focusedItemOrDeferralTarget],
          id v4 = objc_claimAutoreleasedReturnValue(),
          BOOL HaveCommonHierarchy = _FEFocusEnvironmentsHaveCommonHierarchy(v6, v4),
          v4,
          !HaveCommonHierarchy))
    {
      [(_FEFocusSystem *)self _focusEnvironmentDidAppear:v6];
    }
  }
}

- (void)_focusEnvironmentDidAppear:(id)a3
{
  id v4 = a3;
  if ([(_FEFocusSystem *)self _focusSystemIsValid])
  {
    id v5 = [(_FEFocusSystem *)self _focusMovementCache];
    [v5 environmentDidAppear:v4];

    if ([(_FEFocusSystem *)self _effectiveFocusDeferralBehavior])
    {
      if ((*(unsigned char *)&self->_flags & 2) == 0)
      {
        if (v4)
        {
          _FEFocusEnvironmentRootAncestorEnvironment(v4);
          id v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v6 = 0;
        }
        if (v6 != self) {
          goto LABEL_28;
        }
        objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
        BOOL v7 = [(_FEFocusSystem *)self _focusItemForValidation];
        id v8 = v7;
        if (!v7)
        {
          if (!self->_pendingFocusUpdateRequest && [(_FEFocusSystem *)self _isEnabled]) {
            [(_FEFocusSystem *)self requestFocusUpdateToEnvironment:self];
          }
          goto LABEL_27;
        }
        uint64_t v9 = _FEFocusEnvironmentFirstCommonAncestor(v7, v4);
        BOOL v10 = (void *)v9;
        if (v9 && (void *)v9 != v8)
        {
          if (!_FEFocusItemIsViewOrRespondsToSelector(v4)) {
            goto LABEL_16;
          }
          id v11 = [v10 _focusItemContainer];
          double v12 = [v11 _focusCoordinateSpace];

          double v13 = _FEFocusItemFrameInCoordinateSpace(v4, v12);
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          double v20 = _FEFocusItemFrameInCoordinateSpace(v8, v12);
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          v35.origin.x = v13;
          v35.origin.y = v15;
          v35.size.width = v17;
          v35.size.height = v19;
          if (!CGRectIsNull(v35))
          {
            v36.origin.x = v20;
            v36.origin.y = v22;
            v36.size.width = v24;
            v36.size.height = v26;
            if (!CGRectIsNull(v36))
            {
              if (_FERectSmartIntersectsRect(v13, v15, v17, v19, v20, v22, v24, v26))
              {

LABEL_16:
                p_appearingFocusEnvironment = &self->_appearingFocusEnvironment;
                appearingFocusEnvironment = self->_appearingFocusEnvironment;
                if (appearingFocusEnvironment)
                {
                  id v29 = _FEFocusEnvironmentFirstCommonAncestor(appearingFocusEnvironment, v10);

                  objc_storeStrong((id *)p_appearingFocusEnvironment, v29);
                  BOOL v10 = v29;
                }
                else
                {
                  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
                  objc_storeStrong((id *)&self->_appearingFocusEnvironment, v10);
                  if (!pendingFocusUpdateRequest)
                  {
                    __int16 v31 = logger();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    {
                      LOWORD(location[0]) = 0;
                      _os_log_debug_impl(&dword_24F3F0000, v31, OS_LOG_TYPE_DEBUG, "Scheduling focused item validation for appearing environment.", (uint8_t *)location, 2u);
                    }

                    objc_initWeak(location, self);
                    v32[0] = MEMORY[0x263EF8330];
                    v32[1] = 3221225472;
                    v32[2] = __45___FEFocusSystem__focusEnvironmentDidAppear___block_invoke;
                    v32[3] = &unk_265328060;
                    objc_copyWeak(&v33, location);
                    _FEPerformDelayed(v32);
                    objc_destroyWeak(&v33);
                    objc_destroyWeak(location);
                  }
                }
                goto LABEL_26;
              }
            }
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
      }
    }
  }
}

- (id)_validatedAppearingFocusEnvironmentRequest
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v3 = self->_appearingFocusEnvironment;
  if (v3)
  {
    id v4 = logger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v12 = NSString;
      double v13 = v3;
      double v14 = (objc_class *)objc_opt_class();
      CGFloat v15 = NSStringFromClass(v14);
      double v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];

      *(_DWORD *)buf = 138543362;
      CGFloat v19 = v16;
      _os_log_debug_impl(&dword_24F3F0000, v4, OS_LOG_TYPE_DEBUG, "Validating focused item for appearing environment %{public}@.", buf, 0xCu);
    }
    id v5 = [(_FEFocusSystem *)self _focusedItemOrDeferralTarget];
    if (v5
      && (_FEFocusEnvironmentRootAncestorEnvironment(v3),
          id v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 == self))
    {
      id v8 = _FEFocusEnvironmentPreferredFocusMapContainer(v3);
      if (v8)
      {
        uint64_t v9 = [[_FEFocusMap alloc] initWithFocusSystem:self rootContainer:v8 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];
        if ([(_FEFocusMap *)v9 verifyFocusabilityForItem:v5])
        {
          appearingFocusEnvironment = self->_appearingFocusEnvironment;
          self->_appearingFocusEnvironment = 0;

          BOOL v7 = 0;
        }
        else
        {
          BOOL v7 = [[_FEFocusUpdateRequest alloc] initWithFocusSystem:self environment:v3];
        }
      }
      else
      {
        CGFloat v17 = logger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_24F3F0000, v17, OS_LOG_TYPE_FAULT, "Unable to find a focus map container. This should never happen.", buf, 2u);
        }

        BOOL v7 = 0;
        uint64_t v9 = (_FEFocusMap *)self->_appearingFocusEnvironment;
        self->_appearingFocusEnvironment = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
      id v8 = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_validatedPendingFocusUpdateRequest
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v3 = self->_pendingFocusUpdateRequest;
  id v4 = v3;
  if (v3 && ![(_FEFocusUpdateRequest *)v3 isValidInFocusSystem:self])
  {
    id v6 = logger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(_FEFocusUpdateRequest *)v4 environment];
      if (v9)
      {
        id v11 = NSString;
        double v12 = (objc_class *)objc_opt_class();
        double v13 = NSStringFromClass(v12);
        BOOL v10 = [v11 stringWithFormat:@"<%@: %p>", v13, v9];
      }
      else
      {
        BOOL v10 = @"(nil)";
      }
      double v14 = NSString;
      CGFloat v15 = self;
      double v16 = v10;
      CGFloat v17 = (objc_class *)objc_opt_class();
      double v18 = NSStringFromClass(v17);
      CGFloat v19 = [v14 stringWithFormat:@"<%@: %p>", v18, v15];

      *(_DWORD *)buf = 138543618;
      double v21 = v10;
      __int16 v22 = 2114;
      double v23 = v19;
      _os_log_error_impl(&dword_24F3F0000, v6, OS_LOG_TYPE_ERROR, "Found invalid pending focus update request for environment %{public}@ in focus system %{public}@.", buf, 0x16u);
    }
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_topEnvironment
{
  BOOL v2 = self;
  double v3 = v2;
  id v4 = v2;
  if ((*(unsigned char *)&v2->_flags & 0x40) == 0
    || ([(_FEFocusSystem *)v2 delegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 _topEnvironmentForFocusSystem:v3],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v6,
        v4)
    && (disappearingFocusEnvironment = v3->_disappearingFocusEnvironment) != 0
    && _FEFocusEnvironmentIsAncestorOfEnvironment(disappearingFocusEnvironment, v4))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = v4;
    id v4 = v5;
  }

  return v5;
}

- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4
{
  return [(_FEFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:a3 fallbackToEnvironment:0 debugReport:a4];
}

- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5
{
  id v8 = (_FEFocusSystem *)a3;
  id v9 = a5;
  if (![(_FEFocusSystem *)self _isEnabled])
  {
    BOOL v10 = +[_FEDebugIssue issueWithDescription:@"Focus is not currently enabled in this environment's focus system, updates will be delayed."];
    [v9 addIssue:v10];
  }
  id v11 = [(_FEFocusSystem *)self _topEnvironment];
  double v12 = v11;
  if (!v11)
  {
    CGFloat v15 = +[_FEDebugIssue issueWithDescription:@"The current first responder is not a focus environment, no focus updates are allowed as that would force the first responder to change."];
    [v9 addIssue:v15];
    BOOL v23 = 0;
LABEL_25:

    goto LABEL_26;
  }
  BOOL IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(v11, v8);
  if (v12 != v8)
  {
    BOOL v14 = IsAncestorOfEnvironment;
    CGFloat v15 = [(_FEFocusSystem *)self _focusItemForValidation];
    double v16 = self->_pendingFocusUpdateRequest;
    CGFloat v17 = v16;
    if (v16)
    {
      if (v15) {
        int v18 = 1;
      }
      else {
        int v18 = v14;
      }
      if (v18 != 1
        || ([(_FEFocusUpdateRequest *)v16 environment],
            CGFloat v19 = objc_claimAutoreleasedReturnValue(),
            BOOL v20 = _FEFocusEnvironmentIsAncestorOfEnvironment(v8, v19),
            v19,
            !v20))
      {
        double v21 = @"An ancestor of this environment has already requested a focus update, which takes priority.";
LABEL_12:
        __int16 v22 = +[_FEDebugIssue issueWithDescription:v21];
        [v9 addIssue:v22];

LABEL_13:
        BOOL v23 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (v15)
    {
      if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v8, v15))
      {
        double v21 = @"This environment does not contain the currently focused item.";
        goto LABEL_12;
      }
    }
    else if (v12 == self || !v14)
    {
      if (v12 == self) {
        CGFloat v26 = @"Nothing is currently focused, so this environment's request will be ignored and focus will be reset to the focus system's preferred focused item.";
      }
      else {
        CGFloat v26 = @"This environment is not inside the current first responder.";
      }
      v27 = +[_FEDebugIssue issueWithDescription:v26];
      [v9 addIssue:v27];

      if (a4)
      {
        BOOL v23 = 0;
        *a4 = v12;
        goto LABEL_24;
      }
      goto LABEL_13;
    }
    BOOL v23 = 1;
    goto LABEL_24;
  }
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (void)_updateWantsTreeLocking
{
  double v3 = [(_FEFocusSystem *)self behavior];
  int v4 = [v3 wantsTreeLocking];

  treeLock = self->_treeLock;
  if (v4)
  {
    if (!treeLock)
    {
      id v6 = (_FETreeLock *)objc_opt_new();
      BOOL v7 = self->_treeLock;
      self->_treeLock = v6;
      MEMORY[0x270F9A758](v6, v7);
    }
  }
  else if (treeLock)
  {
    self->_treeLock = 0;

    [(_FEFocusSystem *)self _reevaluateLockedEnvironments];
  }
}

- (BOOL)_isEnvironmentLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(_FEFocusSystem *)self treeLock];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 isEnvironmentLocked:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)_lockEnvironment:(id)a3
{
  id v6 = a3;
  id v4 = [(_FEFocusSystem *)self treeLock];
  id v5 = v4;
  if (v4) {
    [v4 lockEnvironmentTree:v6];
  }
}

- (void)_unlockEnvironment:(id)a3
{
  id v6 = a3;
  id v4 = [(_FEFocusSystem *)self treeLock];
  id v5 = v4;
  if (!v4 || [v4 unlockEnvironmentTree:v6]) {
    [(_FEFocusSystem *)self _reevaluateLockedEnvironments];
  }
}

- (void)updateFocusIfNeeded
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  if (![(_FEFocusSystem *)self _focusSystemIsValid]) {
    return;
  }
  if (![(_FEFocusSystem *)self _isEnabled]) {
    return;
  }
  $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
  if ((*(unsigned char *)&flags & 9) != 0) {
    return;
  }
  if (self->_appearingFocusEnvironment)
  {
    BOOL v5 = -[_FEFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:");
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if (v5)
    {
      self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 8);
      return;
    }
  }
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    int v6 = *(unsigned char *)&flags & 0x20;
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 0x20);
    uint64_t v7 = [(_FEFocusSystem *)self _validatedPendingFocusUpdateRequest];
    uint64_t v8 = [(_FEFocusSystem *)self _validatedAppearingFocusEnvironmentRequest];
    if (v7 | v8)
    {
      deepestPreferredFocusableItemCacheForCurrentUpdate = [(_FEFocusSystem *)self _topEnvironment];
      if (v7)
      {
        BOOL v10 = [(id)v7 environment];
        BOOL IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v10);

        if (!IsAncestorOfEnvironment)
        {
          uint64_t v12 = [(id)v7 requestByRedirectingRequestToEnvironment:deepestPreferredFocusableItemCacheForCurrentUpdate];

          uint64_t v7 = v12;
        }
      }
      if (v8)
      {
        double v13 = [(id)v8 environment];
        BOOL v14 = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v13);

        if (!v14)
        {
          uint64_t v15 = [(id)v8 environment];

          deepestPreferredFocusableItemCacheForCurrentUpdate = (void *)v15;
        }
        if (v7)
        {
          double v16 = [(id)v7 environment];
          CGFloat v17 = [(id)v8 environment];
          int v18 = _FEFocusEnvironmentFirstCommonAncestor(v16, v17);

          if (!v18)
          {
            v69 = [MEMORY[0x263F08690] currentHandler];
            [v69 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:1175 description:@"The appearing environment and the requested environment are not part of the same focus system."];
          }
          CGFloat v19 = [(id)v7 environment];

          if (v18 != v19)
          {
            uint64_t v20 = [(id)v7 requestByRedirectingRequestToEnvironment:v18];

            uint64_t v7 = v20;
          }
        }
        else
        {
          uint64_t v7 = (uint64_t)(id)v8;
        }
      }
      __int16 v22 = [(id)v7 environment];
      BOOL v23 = [(_FEFocusSystem *)self _isEnvironmentLocked:v22];

      if (v23)
      {
        uint64_t v24 = logger();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v66 = [(id)v7 environment];
          *(_DWORD *)buf = 138412290;
          v74 = v66;
          _os_log_debug_impl(&dword_24F3F0000, v24, OS_LOG_TYPE_DEBUG, "Postponing update for locked environment %@", buf, 0xCu);
        }
        self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(v6 | *(_DWORD *)&self->_flags & 0xFFFFFFDF | 8);
        goto LABEL_56;
      }
      v70 = self->_appearingFocusEnvironment;
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      v27 = (_FEFocusUpdateRequest *)(id)v7;
      id v28 = [[_FEFocusUpdateContext alloc] _initWithFocusUpdateRequest:v27];
      id v29 = logger();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);

      if (v30)
      {
        __int16 v31 = objc_alloc_init(_FEDebugIssueReport);
        [v28 _setValidationReport:v31];

        v32 = objc_alloc_init(_FEDebugLogReport);
        [v28 _setPreferredFocusReport:v32];
      }
      id v33 = objc_msgSend(v28, "nextFocusedItem", v70);
      v72 = v27;
      int v34 = v6;
      if (v33 || !deepestPreferredFocusableItemCacheForCurrentUpdate)
      {
        id v47 = v28;
LABEL_51:

        id v28 = v47;
        uint64_t v7 = (uint64_t)v27;
      }
      else
      {
        uint64_t v7 = (uint64_t)v27;
        while (1)
        {
          uint64_t v35 = [(id)v7 environment];
          if (!v35) {
            break;
          }
          CGRect v36 = (void *)v35;
          v37 = [(id)v7 environment];

          if (v37 == deepestPreferredFocusableItemCacheForCurrentUpdate) {
            break;
          }
          v38 = [(id)v7 environment];
          if (_FEFocusEnvironmentPrefersFocusContainment(v38))
          {
            int64_t v39 = [(_FEFocusSystem *)self _effectiveFocusDeferralBehavior];

            if (v39 == 3) {
              [(_FEFocusSystem *)self _resetFocusDeferral];
            }
          }
          else
          {
          }
          v40 = [(id)v7 requestByRedirectingRequestToNextContainerEnvironment];
          if (!v40)
          {
            v68 = logger();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_24F3F0000, v68, OS_LOG_TYPE_FAULT, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
            }

            break;
          }
          id v41 = v40;
          v42 = [(_FEFocusUpdateRequest *)v40 environment];
          BOOL v43 = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v42);

          if (!v43)
          {
            uint64_t v44 = [(id)v7 requestByRedirectingRequestToEnvironment:deepestPreferredFocusableItemCacheForCurrentUpdate];

            id v41 = (_FEFocusUpdateRequest *)v44;
            if (!v44) {
              break;
            }
          }
          id v45 = [(_FEFocusUpdateRequest *)v41 environment];
          BOOL v46 = [(_FEFocusSystem *)self _isEnvironmentLocked:v45];

          if (v46)
          {
            v61 = logger();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v67 = [(_FEFocusUpdateRequest *)v41 environment];
              *(_DWORD *)buf = 138412290;
              v74 = v67;
              _os_log_debug_impl(&dword_24F3F0000, v61, OS_LOG_TYPE_DEBUG, "Postponing update for locked environment %@", buf, 0xCu);
            }
            *(_DWORD *)&self->_flags |= 8u;
            v62 = self->_pendingFocusUpdateRequest;
            self->_pendingFocusUpdateRequest = v41;
            v63 = v41;

            v64 = self->_appearingFocusEnvironment;
            self->_appearingFocusEnvironment = v71;
            v65 = v71;

            goto LABEL_56;
          }
          v27 = v41;

          id v47 = [[_FEFocusUpdateContext alloc] _initWithFocusUpdateRequest:v27];
          uint64_t v48 = logger();
          BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);

          if (v49)
          {
            __int16 v50 = [v28 _preferredFocusReport];
            [v50 addLineBreak];

            v51 = [v28 _preferredFocusReport];
            [v51 addMessage:@" === unable to find focused item in context. retrying with updated request. === "];

            uint64_t v52 = [v28 _preferredFocusReport];
            [v52 addLineBreak];

            v53 = [v28 _validationReport];
            [v47 _setValidationReport:v53];

            v54 = [v28 _preferredFocusReport];
            [v47 _setPreferredFocusReport:v54];
          }
          id v33 = [v47 nextFocusedItem];
          uint64_t v7 = (uint64_t)v27;
          id v28 = v47;
          if (v33) {
            goto LABEL_51;
          }
        }
      }
      int v6 = v34;
      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      v56 = [(_FEFocusSystem *)self updateThrottle];
      [v56 didCreateProgrammaticFocusUpdateContext:v28];

      v57 = logger();
      BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);

      v59 = 0;
      if (v58)
      {
        v59 = [[_FEFocusUpdateReport alloc] initWithFocusSystem:self];
        [(_FEFocusUpdateReport *)v59 setContext:v28];
      }
      v60 = [(_FEFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v28 report:v59];

      [(_FEFocusSystem *)self _updateFocusWithContext:v60 report:v59];
    }
    else
    {
      uint64_t v7 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v6);
    deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
    self->_deepestPreferredFocusableItemCacheForCurrentUpdate = 0;
LABEL_56:

    return;
  }
  double v21 = logger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_24F3F0000, v21, OS_LOG_TYPE_ERROR, "Calling updateFocusIfNeeded while a focus update is in progress. This call will be ignored.", buf, 2u);
  }
}

- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:1277 description:@"Attempting to initiate a focus update with a nil context."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  [v7 _willUpdateFocusFromFocusedItem:WeakRetained];
  char v10 = [v7 _isValidInFocusSystem:self];
  int v11 = [v8 shouldLog];
  int v12 = v11;
  if (v10)
  {
    if (v11)
    {
      double v13 = logger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = +[_FEDebugReportFormatter defaultFormatter];
        CGRect v36 = [v35 stringFromReport:v8];
        int v39 = 138543618;
        id v40 = v7;
        __int16 v41 = 2114;
        v42 = v36;
        _os_log_debug_impl(&dword_24F3F0000, v13, OS_LOG_TYPE_DEBUG, "Updating focus with context %{public}@:\n%{public}@", (uint8_t *)&v39, 0x16u);
      }
    }
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      v38 = [MEMORY[0x263F08690] currentHandler];
      [v38 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:1300 description:@"_ignoreFocusUpdateIfNeeded should never be YES at the beginning of a focus update."];

      $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      uint64_t v15 = [(_FEFocusSystem *)self delegate];
      [v15 _focusSystem:self willUpdateFocusInContext:v7];
    }
    [(_FEFocusSystem *)self _sendWillUpdateFocusNotificationsInContext:v7];
    objc_storeWeak((id *)&self->_previousFocusedItem, WeakRetained);
    double v16 = [v7 nextFocusedItem];
    objc_storeWeak((id *)&self->_focusedItem, v16);
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    appearingFocusEnvironment = self->_appearingFocusEnvironment;
    self->_appearingFocusEnvironment = 0;

    [(_FEFocusSystem *)self _clearFocusItemAncestorCache];
    [(_FEFocusSystem *)self _sendDidUpdateFocusNotificationsInContext:v7];
    if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
    {
      CGFloat v19 = [(_FEFocusSystem *)self delegate];
      [v19 _focusSystem:self didUpdateFocusInContext:v7];
    }
    uint64_t v20 = [(_FEFocusSystem *)self _focusCastingController];

    if (v20)
    {
      double v21 = [(_FEFocusSystem *)self _focusCastingController];
      [v21 updateFocusCastingWithContext:v7];
    }
    __int16 v22 = [(_FEFocusSystem *)self _focusMovementCache];

    if (v22)
    {
      BOOL v23 = [(_FEFocusSystem *)self _focusMovementCache];
      [v23 updateCacheWithContext:v7];
    }
    [(_FEFocusSystem *)self _didFinishUpdatingFocusInContext:v7];
    [v7 _didUpdateFocus];
    *(_DWORD *)&self->_flags &= ~2u;
    if (v16 && v16 != WeakRetained)
    {
      uint64_t v24 = [v7 _focusMovement];
      if (v24) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = [v7 _isDeferredUpdate];
      }
      [(_FEFocusSystem *)self _tickHasSeenFocusedItemTimer:v25];
    }
    id v28 = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
    uint64_t v29 = [v7 _previouslyFocusedGroupIdentifier];
    BOOL v30 = (void *)v29;
    if (v28 && v29)
    {
      __int16 v31 = [v7 _nextFocusedGroupIdentifier];
      v32 = v31;
      if (!v31 || ([v31 isEqualToString:v30] & 1) == 0)
      {
        id v33 = [(_FEFocusSystem *)self _focusGroupHistory];
        [v33 setLastFocusedItem:v28 forGroupIdentifier:v30];
      }
    }

    goto LABEL_36;
  }
  double v16 = logger();
  BOOL v26 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v26)
    {
      v27 = +[_FEDebugReportFormatter defaultFormatter];
      id v28 = [v27 stringFromReport:v8];
      int v39 = 138543618;
      id v40 = v7;
      __int16 v41 = 2114;
      v42 = v28;
      _os_log_impl(&dword_24F3F0000, v16, OS_LOG_TYPE_INFO, "Failed to update focus with context %{public}@:\n%{public}@", (uint8_t *)&v39, 0x16u);

LABEL_36:
    }
  }
  else if (v26)
  {
    int v39 = 138543362;
    id v40 = v7;
    _os_log_impl(&dword_24F3F0000, v16, OS_LOG_TYPE_INFO, "Failed to update focus with context %{public}@. No additional info available.", (uint8_t *)&v39, 0xCu);
  }

  return v10;
}

- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v8 _didUpdateFocusInContext:v6];
  }
  else if ((*((unsigned char *)&self->_flags + 1) & 0x40) != 0)
  {
    id v7 = [(_FEFocusSystem *)self delegate];
    [v7 _focusSystem:self environment:v8 didUpdateFocusInContext:v6];
  }
}

- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1393, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61___FEFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_2653280D8;
  id v9 = v5;
  id v6 = v5;
  [(_FEFocusSystem *)self _sendNotificationsForFocusUpdateInContext:v6 usingBlock:v8];
}

- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1404, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60___FEFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_265328100;
  void v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  [(_FEFocusSystem *)self _sendNotificationsForFocusUpdateInContext:v6 usingBlock:v8];
}

- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1414, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1415, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  char v10 = [v7 previouslyFocusedItem];
  int v11 = [v7 nextFocusedItem];
  int v12 = [v7 _commonAncestorEnvironment];
  if (v10)
  {
    if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
    {
      double v13 = [(_FEFocusSystem *)self delegate];
      [v13 _focusSystem:self willMessageOldFocusNodes:v7];
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke;
    v19[3] = &unk_265328128;
    id v20 = v12;
    id v21 = v9;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v10, v19);
  }
  if (v11)
  {
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
    {
      BOOL v14 = [(_FEFocusSystem *)self delegate];
      [v14 _focusSystem:self willMessageNewFocusNodes:v7];
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2;
    v17[3] = &unk_265328150;
    id v18 = v9;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v11, v17);
  }
}

- (_FEFocusEnvironment)_disappearingFocusEnvironment
{
  return self->_disappearingFocusEnvironment;
}

- (void)_performWithoutFocusUpdates:(id)a3
{
  if (a3)
  {
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | (2
                                                                                              * ((*(unsigned int *)&flags >> 1) & 1)));
  }
}

- (BOOL)_updateFocusImmediatelyWithContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1469, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v6 = logger();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {

    goto LABEL_7;
  }
  id v7 = [v5 _focusMovement];

  if (!v7)
  {
LABEL_7:
    id v8 = 0;
    goto LABEL_8;
  }
  id v8 = [[_FEFocusUpdateReport alloc] initWithFocusSystem:self];
  [(_FEFocusUpdateReport *)v8 setContext:v5];
LABEL_8:
  id v9 = [(_FEFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v5 report:v8];

  BOOL v10 = [(_FEFocusSystem *)self _updateFocusWithContext:v9 report:v8];
  return v10;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5
{
  id v8 = a3;
  if ((*(_DWORD *)&self->_flags & 2) != 0)
  {
    id v20 = logger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_24F3F0000, v20, OS_LOG_TYPE_FAULT, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
    }

    if ((*(_DWORD *)&self->_flags & 2) != 0) {
      goto LABEL_12;
    }
  }
  if ([(_FEFocusSystem *)self _isEnabled])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __105___FEFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke;
    v21[3] = &unk_265328178;
    BOOL v22 = a4;
    v21[4] = self;
    BOOL v23 = a5;
    id v9 = (void (**)(void))MEMORY[0x25335DA10](v21);
    BOOL v10 = [(_FEFocusSystem *)self _contextForUpdateToEnvironment:v8 allowsOverridingPreferedFocusEnvironments:0 allowsDeferral:1];
    int v11 = v10;
    if (v8
      && ([v10 nextFocusedItem],
          int v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      double v16 = [(_FEFocusSystem *)self _topEnvironment];
      if (v16 == self)
      {

        double v16 = 0;
      }
      CGFloat v17 = [(_FEFocusSystem *)self _focusedItemOrDeferralTarget];
      id v18 = v17;
      if (v16 && v17 && !_FEFocusEnvironmentIsAncestorOfEnvironment(v16, v17)) {
        v9[2](v9);
      }
    }
    else
    {
      if (![(_FEFocusSystem *)self _isEnabled])
      {
        uint64_t v15 = [v11 nextFocusedItem];
        objc_storeWeak((id *)&self->_previousFocusedItem, v15);

        [(_FEFocusSystem *)self _setNeedsFocusRestoration];
        BOOL v14 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if ([v11 _isValidInFocusSystem:self])
      {
        uint64_t v13 = [(_FEFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v11 report:0];

        if ([(_FEFocusSystem *)self _updateFocusImmediatelyWithContext:v13])
        {
          if (![(_FEFocusSystem *)self _hasValidItemForCurrentDeferralState]) {
            v9[2](v9);
          }
          BOOL v14 = 1;
        }
        else
        {
          BOOL v14 = 0;
        }
        int v11 = (void *)v13;
        goto LABEL_24;
      }
    }
    BOOL v14 = 0;
    goto LABEL_24;
  }
  [(_FEFocusSystem *)self _cancelPendingFocusRestoration];
LABEL_12:
  BOOL v14 = 0;
LABEL_25:

  return v14;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3
{
  return [(_FEFocusSystem *)self _updateFocusImmediatelyToEnvironment:a3 startDeferringOnLostFocus:1 suppressLostFocusUpdate:0];
}

- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4
{
}

- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3
{
  return [(_FEFocusSystem *)self _contextForUpdateToEnvironment:a3 allowsOverridingPreferedFocusEnvironments:0 allowsDeferral:0];
}

- (id)_contextForUpdateToEnvironment:(id)a3
{
  return [(_FEFocusSystem *)self _contextForUpdateToEnvironment:a3 allowsOverridingPreferedFocusEnvironments:1 allowsDeferral:1];
}

- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = [[_FEFocusUpdateRequest alloc] initWithFocusSystem:self environment:v8];
  }
  else
  {
    id v9 = +[_FEFocusUpdateRequest requestForRemovingFocusInFocusSystem:self];
  }
  BOOL v10 = v9;
  [(_FEFocusUpdateRequest *)v9 setAllowsOverridingPreferedFocusEnvironments:v6];
  [(_FEFocusUpdateRequest *)v10 setAllowsDeferral:v5];
  id v11 = [[_FEFocusUpdateContext alloc] _initWithFocusUpdateRequest:v10];

  return v11;
}

- (BOOL)_performFocusMovement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_FEFocusSystem *)self _movementPerformer];
  char v6 = [v5 performFocusMovement:v4];

  return v6;
}

- (void)invalidateFocusItemContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(_FEFocusSystem *)self _focusMovementCache];
  [v5 invalidateFocusItemContainer:v4];
}

- (_FEFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate
{
  if (!self->_deepestPreferredFocusableItemCacheForCurrentUpdate && (*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    double v3 = [(_FEFocusSystem *)self behavior];
    int v4 = [v3 cachesPreferredEnvironmentEnumerationResults];

    if (v4)
    {
      id v5 = (_FEFocusEnvironmentPreferenceCache *)objc_opt_new();
      deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
      self->_deepestPreferredFocusableItemCacheForCurrentUpdate = v5;
    }
  }
  id v7 = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
  return v7;
}

- (void)_buildFocusItemAncestorCacheIfNecessary
{
  p_focusItemAncestorCache = &self->_focusItemAncestorCache;
  if (!self->_focusItemAncestorCache)
  {
    int v4 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __57___FEFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke;
      v6[3] = &unk_2653281A0;
      id v7 = v4;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }
    else
    {
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }
  }
}

- (void)_clearFocusItemAncestorCache
{
  self->_focusItemAncestorCache = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1640, @"Invalid parameter not satisfying: %@", @"environment != nil" object file lineNumber description];
  }
  [(_FEFocusSystem *)self _buildFocusItemAncestorCacheIfNecessary];
  if (a4)
  {
    BOOL v8 = [(NSHashTable *)self->_focusItemAncestorCache containsObject:v7];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    BOOL v8 = WeakRetained != v7 && [(NSHashTable *)self->_focusItemAncestorCache containsObject:v7];
  }
  return v8;
}

- (void)_reevaluateLockedEnvironments
{
  $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
  self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFF7);
  if ((*(unsigned char *)&flags & 8) != 0 && (self->_pendingFocusUpdateRequest || self->_appearingFocusEnvironment))
  {
    int v4 = logger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_24F3F0000, v4, OS_LOG_TYPE_DEBUG, "Trying to execute postponed update...", (uint8_t *)location, 2u);
    }

    objc_initWeak(location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47___FEFocusSystem__reevaluateLockedEnvironments__block_invoke;
    v6[3] = &unk_265328060;
    objc_copyWeak(&v7, location);
    id v5 = v6;
    if (UIKitCoreLibraryCore())
    {
      if (qword_269A11C28 != -1) {
        dispatch_once(&qword_269A11C28, &__block_literal_global_470);
      }
      [(id)qword_269A11C20 _performBlockAfterCATransactionCommits:v5];
    }
    else
    {
      dispatch_async(MEMORY[0x263EF83A0], v5);
    }

    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
}

- (void)_setNeedsFocusRestoration
{
  *(_DWORD *)&self->_flags |= 4u;
}

- (void)_cancelPendingFocusRestoration
{
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)_handleFocusMovementAction:(id)a3
{
  [(_FEFocusSystem *)self setPendingFocusMovementAction:a3];
  if ([(_FEFocusSystem *)self waitingForFocusMovementAction])
  {
    [(_FEFocusSystem *)self _setEnabled:1];
    [(_FEFocusSystem *)self setWaitingForFocusMovementAction:0];
  }
}

- (_FEFocusEnvironment)_deepestPreferredFocusEnvironment
{
  double v3 = [(_FEFocusSystem *)self _focusedItemOrDeferralTarget];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    p_deepestPreferredFocusEnvironment = &self->_deepestPreferredFocusEnvironment;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deepestPreferredFocusEnvironment);

    if (!WeakRetained)
    {
      BOOL v8 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      id v9 = [(_UIDeepestPreferredEnvironmentSearch *)v8 deepestPreferredFocusEnvironmentForEnvironment:self];
      objc_storeWeak((id *)p_deepestPreferredFocusEnvironment, v9);
    }
    id v5 = objc_loadWeakRetained((id *)p_deepestPreferredFocusEnvironment);
  }
  BOOL v10 = v5;

  return (_FEFocusEnvironment *)v10;
}

- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 0x10) == 0) {
    return 0;
  }
  int v4 = self;
  id v5 = a3;
  char v6 = [(_FEFocusSystem *)v4 delegate];
  LOBYTE(v4) = [v6 _focusSystem:v4 shouldReverseLayoutDirectionForEnvironment:v5];

  return (char)v4;
}

- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) == 0) {
    return 0;
  }
  int v4 = self;
  id v5 = a3;
  char v6 = [(_FEFocusSystem *)v4 delegate];
  LOBYTE(v4) = [v6 _focusSystem:v4 shouldReverseLinearWrappingForEnvironment:v5];

  return (char)v4;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  BOOL v2 = [(_FEFocusSystem *)self behavior];
  char v3 = [v2 modernFocusedItemGetterBehavior] ^ 1;

  return v3;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 1;
}

- (_FEFocusSystem)_hostFocusSystem
{
  return 0;
}

- (BOOL)_uiktest_updateFocusToItem:(id)a3
{
  char v3 = self;
  int v4 = [(_FEFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:a3];
  LOBYTE(v3) = [(_FEFocusSystem *)v3 _updateFocusWithContext:v4 report:0];

  return (char)v3;
}

- (void)_uiktest_setPreviousFocusedItem:(id)a3
{
}

- (void)_uiktest_disableFocusDeferral
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusSystem.m" lineNumber:1766 description:@"This method is only to be used during UIKit tests."];
}

- (void)_uiktest_disableThrottle
{
  [(_FEFocusUpdateThrottle *)self->_updateThrottle teardown];
  updateThrottle = self->_updateThrottle;
  self->_updateThrottle = 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      int v5 = 64;
    }
    else {
      int v5 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 128;
    }
    else {
      int v6 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 256;
    }
    else {
      int v7 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 512;
    }
    else {
      int v8 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 1024;
    }
    else {
      int v9 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 2048;
    }
    else {
      int v10 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 4096;
    }
    else {
      int v11 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 0x2000;
    }
    else {
      int v12 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 0x4000;
    }
    else {
      int v13 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 0x8000;
    }
    else {
      int v14 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 0x10000;
    }
    else {
      int v15 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 0x20000;
    }
    else {
      int v16 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 0x40000;
    }
    else {
      int v17 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x80000;
    }
    else {
      int v18 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x100000;
    }
    else {
      int v19 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x200000;
    }
    else {
      int v20 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 0x400000;
    }
    else {
      int v21 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v21);
  }
}

- (BOOL)_shouldRestoreFocusInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1811, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  int v6 = [(_FEFocusSystem *)self delegate];
  int v7 = v6;
  if (v6 && (*((unsigned char *)&self->_flags + 1) & 1) != 0)
  {
    char IsAncestorOfEnvironment = [v6 _focusSystem:self shouldRestoreFocusInContext:v5];
  }
  else
  {
    int v8 = [v5 nextFocusedItem];
    char IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(self, v8);
  }
  return IsAncestorOfEnvironment;
}

- (void)_didFinishUpdatingFocusInContext:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    int v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEFocusSystem.m", 1823, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    id v5 = 0;
  }
  int v6 = [v5 _sourceItemInfo];
  [v6 invalidateFocusedRegion];

  int v7 = [v11 _destinationItemInfo];
  [v7 invalidateFocusedRegion];

  int v8 = [(_FEFocusSystem *)self delegate];
  int v9 = v8;
  if (v8 && (*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    [v8 _focusSystem:self didFinishUpdatingFocusInContext:v11];
  }
}

- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4
{
  id v6 = a3;
  int v7 = [(_FEFocusSystem *)self delegate];
  int v8 = v7;
  if (v7 && (*((unsigned char *)&self->_flags + 2) & 0x40) != 0) {
    char v9 = [v7 _focusSystem:self isScrollingScrollableContainer:v6 targetContentOffset:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4
{
  if ((*((unsigned char *)&self->_flags + 2) & 8) == 0) {
    return 0;
  }
  id v5 = self;
  id v6 = a3;
  int v7 = [(_FEFocusSystem *)v5 delegate];
  LOBYTE(v5) = [v7 _focusSystem:v5 handleFailedMovementRequest:v6];

  return (char)v5;
}

- (void)setBehavior:(id)a3
{
  id v5 = (_FEFocusBehavior *)a3;
  p_behavior = &self->_behavior;
  if (self->_behavior != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_behavior, a3);
    p_behavior = (_FEFocusBehavior **)[(_FEFocusSystem *)self _focusBehaviorDidChange];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_behavior, v5);
}

- (void)_focusBehaviorDidChange
{
  [(_FEFocusSystem *)self _updateFocusUpdateThrottle];
  [(_FEFocusSystem *)self _updateWantsTreeLocking];
}

- (void)_updateFocusUpdateThrottle
{
  char v3 = [(_FEFocusSystem *)self behavior];
  if ([v3 throttlesProgrammaticFocusUpdates])
  {
    updateThrottle = self->_updateThrottle;

    if (!updateThrottle)
    {
      objc_initWeak(&location, self);
      id v5 = [_FEFocusUpdateThrottle alloc];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __44___FEFocusSystem__updateFocusUpdateThrottle__block_invoke;
      v11[3] = &unk_265328060;
      objc_copyWeak(&v12, &location);
      id v6 = [(_FEFocusUpdateThrottle *)v5 initWithUpdateHandler:v11];
      int v7 = self->_updateThrottle;
      self->_updateThrottle = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
  }
  int v10 = [(_FEFocusSystem *)self behavior];
  if ([(_FEFocusUpdateThrottle *)v10 throttlesProgrammaticFocusUpdates])
  {
    int v8 = v10;
  }
  else
  {
    char v9 = self->_updateThrottle;

    if (!v9) {
      return;
    }
    [(_FEFocusUpdateThrottle *)self->_updateThrottle teardown];
    int v8 = self->_updateThrottle;
    self->_updateThrottle = 0;
  }
}

- (NSString)description
{
  char v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  if os_variant_has_internal_diagnostics() && (*(unsigned char *)&self->_flags) {
    id v24 = (id)[v3 appendObject:@"YES" withName:@"TEARDOWN RECEIVED"];
  }
  id v4 = (id)[v3 appendBool:self->_enabled withName:@"enabled"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  id v6 = (id)[v3 appendObject:WeakRetained withName:@"focusedItem"];

  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
  if (pendingFocusUpdateRequest) {
    id v8 = (id)[v3 appendObject:pendingFocusUpdateRequest withName:@"pendingFocusUpdateRequest"];
  }
  char v9 = logger();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
      if (v12)
      {
        int v13 = NSString;
        int v14 = (objc_class *)objc_opt_class();
        int v15 = NSStringFromClass(v14);
        int v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
      }
      else
      {
        int v16 = @"(nil)";
      }

      id v18 = (id)[v3 appendObject:v16 withName:@"deferredFocusUpdateTarget"];
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)&self->_focusedItem);
      if (v17)
      {
      }
      else if ([(_FEFocusSystem *)self _effectiveFocusDeferralBehavior])
      {
        id v23 = (id)[v3 appendObject:@"nil" withName:@"deferredFocusUpdateTarget"];
      }
    }
    treeLock = self->_treeLock;
    if (treeLock) {
      id v20 = (id)[v3 appendObject:treeLock withName:@"treeLock"];
    }
  }
  int v21 = [v3 build];

  return (NSString *)v21;
}

- (_FEFocusMovementPerformer)_movementPerformer
{
  return self->_movementPerformer;
}

- (BOOL)waitingForFocusMovementAction
{
  return self->_waitingForFocusMovementAction;
}

- (void)setWaitingForFocusMovementAction:(BOOL)a3
{
  self->_waitingForFocusMovementAction = a3;
}

- (_FEFocusMovementAction)pendingFocusMovementAction
{
  return self->_pendingFocusMovementAction;
}

- (void)setPendingFocusMovementAction:(id)a3
{
}

- (_FEFocusUpdateThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (_FETreeLock)treeLock
{
  return self->_treeLock;
}

- (_FEFocusItem)_previousFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  return (_FEFocusItem *)WeakRetained;
}

- (_FEFocusCastingController)_focusCastingController
{
  return self->_focusCastingController;
}

- (_FEFocusLinearMovementCache)_focusMovementCache
{
  return self->_focusMovementCache;
}

- (void)_setFocusMovementCache:(id)a3
{
}

- (_FEFocusBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (NSNumber)_overrideFocusDeferralBehavior
{
  return self->_overrideFocusDeferralBehavior;
}

- (_FEFocusSystemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_FEFocusSystemDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_focusMovementCache, 0);
  objc_storeStrong((id *)&self->_focusCastingController, 0);
  objc_destroyWeak((id *)&self->_previousFocusedItem);
  objc_storeStrong((id *)&self->_treeLock, 0);
  objc_storeStrong((id *)&self->_updateThrottle, 0);
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, 0);
  objc_destroyWeak((id *)&self->_deepestPreferredFocusEnvironment);
  objc_storeStrong((id *)&self->_deepestPreferredFocusableItemCacheForCurrentUpdate, 0);
  objc_storeStrong((id *)&self->_focusGroupHistory, 0);
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_movementPerformer, 0);
  objc_destroyWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_storeStrong((id *)&self->_focusItemAncestorCache, 0);
  objc_storeStrong((id *)&self->_disappearingFocusEnvironment, 0);
  objc_storeStrong((id *)&self->_appearingFocusEnvironment, 0);
  objc_destroyWeak((id *)&self->_deferredFocusUpdateTarget);
  objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, 0);
}

@end