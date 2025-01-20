@interface FBSDisplaySource
- (FBSDisplaySource)init;
- (NSString)debugDescription;
- (id)_transformDisplaysIfNecessaryFromDisplayConfiguration:(uint64_t)a1;
- (id)connectedConfigurations;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithDisplay:(char)a3 alwaysConnected:(uint64_t)a4 triggers:(void *)a5 monitor:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)displayID;
- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 connected:;
- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 disconnected:;
- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 updated:;
- (void)_lock_noteConnected;
- (void)_lock_noteDisconnecting;
- (void)_lock_noteUpdatedForTransformInvalidation:(uint64_t)a1;
- (void)_lock_setAttachment:(const os_unfair_lock *)a1;
- (void)_lock_setRawConfiguration:(uint64_t)a1;
- (void)_lock_setRawReportedConfiguration:(void *)a3 effectiveReportedConfigurations:;
- (void)_updateForInitialization:(int)a3 forTransformInvalidation:;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowsUnknown:(uint64_t)a1;
- (void)updateTransforms;
@end

@implementation FBSDisplaySource

- (id)connectedConfigurations
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 23;
    os_unfair_lock_lock(a1 + 23);
    v1 = (id *)v1[10];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_updateTransformsLock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    objc_storeWeak((id *)&self->_lock_monitor, 0);
    os_unfair_lock_unlock(&self->_lock);
    if (self->_observing)
    {
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"tag" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"availableModes" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"connectionSeed" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"uniqueId" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"name" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"deviceName" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"processId" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"currentMode" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"preferredMode" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"cloningSupported" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"overscanned" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"overscanAdjustment" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"overscanAmounts" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"supportsExtendedColors" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"currentOrientation" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"latency" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"frame" context:self];
      [(CADisplay *)self->_display removeObserver:self forKeyPath:@"bounds" context:self];
    }
    v3 = BKLogDisplay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int displayID = self->_displayID;
      unsigned int instanceID = self->_instanceID;
      v6[0] = 67109376;
      v6[1] = displayID;
      __int16 v7 = 1024;
      unsigned int v8 = instanceID;
      _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] did invalidate", (uint8_t *)v6, 0xEu);
    }
  }
}

- (id)initWithDisplay:(char)a3 alwaysConnected:(uint64_t)a4 triggers:(void *)a5 monitor:
{
  id v10 = a2;
  id v11 = a5;
  v12 = v11;
  if (a1)
  {
    if (!v10)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"display"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]();
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v11)
    {
      v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"monitor"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]();
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v13 = [v11 callOutQueue];
    if (!v13)
    {
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"callOutQueue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
    }
    v14 = (void *)v13;
    v21.receiver = a1;
    v21.super_class = (Class)FBSDisplaySource;
    v15 = (id *)[super init];
    uint64_t v16 = (uint64_t)v15;
    if (v15)
    {
      objc_storeStrong(v15 + 1, a2);
      *(unsigned char *)(v16 + 120) = a3;
      *(_DWORD *)(v16 + 100) = [v10 displayId];
      objc_storeStrong((id *)(v16 + 24), v14);
      *(_DWORD *)(v16 + 104) = atomic_fetch_add_explicit(initWithDisplay_alwaysConnected_triggers_monitor____instanceCounter, 1u, memory_order_relaxed)+ 1;
      *(_DWORD *)(v16 + 88) = 0;
      objc_storeWeak((id *)(v16 + 16), v12);
      *(_DWORD *)(v16 + 92) = 0;
      *(_DWORD *)(v16 + 96) = 0;
      *(unsigned char *)(v16 + 121) = a4 != 0;
      *(unsigned char *)(v16 + 122) = a4 & 1;
      if (a4)
      {
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"tag" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"availableModes" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"connectionSeed" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"uniqueId" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"name" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"deviceName" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"processId" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"currentMode" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"preferredMode" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"cloningSupported" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"overscanned" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"overscanAdjustment" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"overscanAmounts" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"supportsExtendedColors" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"currentOrientation" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"latency" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"frame" options:0 context:v16];
        [*(id *)(v16 + 8) addObserver:v16 forKeyPath:@"bounds" options:0 context:v16];
      }
      -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](v16, 1, 0);
    }
    a1 = (id)v16;
  }
  return a1;
}

- (void)_updateForInitialization:(int)a3 forTransformInvalidation:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v6 = (void *)[*(id *)(a1 + 8) immutableCopy];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if (*(unsigned char *)(a1 + 125) || !*(unsigned char *)(a1 + 123) && !a2) {
      goto LABEL_42;
    }
    if (*(unsigned char *)(a1 + 120))
    {
      id v7 = [[FBSDisplayConfiguration alloc] _initWithImmutableDisplay:v6 originalDisplay:*(void *)(a1 + 8) assertIfInvalid:1];
      if (([v7 isMainDisplay] & 1) == 0)
      {
        v25 = [NSString stringWithFormat:@"we failed to make a main display for %@ - created raw configuration=%@", v6, v7];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:]();
        }
        [v25 UTF8String];
        _bs_set_crash_log_message();
      }
      -[FBSDisplaySource _lock_setRawConfiguration:](a1, v7);
      switch(*(_DWORD *)(a1 + 108))
      {
        case 0:
          unsigned int v8 = BKLogDisplay();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = *(_DWORD *)(a1 + 100);
            int v10 = *(_DWORD *)(a1 + 104);
            id v11 = [*(id *)(a1 + 32) succinctDescription];
            *(_DWORD *)buf = 67109634;
            int v32 = v9;
            __int16 v33 = 1024;
            int v34 = v10;
            __int16 v35 = 2114;
            v36 = v11;
            _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] silently connecting raw configuration: %{public}@", buf, 0x18u);
          }
          -[FBSDisplaySource _lock_noteConnected](a1);
          break;
        case 1:
        case 4:
          v27 = NSString;
          v28 = [(id)a1 debugDescription];
          v29 = [v27 stringWithFormat:@"mainDisplay cannot debounce nor disconnect : %@", v28];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:]();
          }
          [v29 UTF8String];
          _bs_set_crash_log_message();
        case 3:
          -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:](a1, a3);
          break;
        default:
          goto LABEL_40;
      }
      goto LABEL_40;
    }
    uint64_t v12 = [v6 tag];
    id v7 = [v6 availableModes];
    id v13 = *(id *)(a1 + 32);
    if (!v12 || ![v7 count])
    {
      -[FBSDisplaySource _lock_setRawConfiguration:](a1, 0);
      goto LABEL_26;
    }
    if (v13)
    {
      id v30 = v7;
      v14 = [v13 identity];
      int v15 = [v14 connectionSeed];
      if (v15 == [v6 connectionSeed]
        && (int v16 = [v13 seed], v16 == [v6 seed]))
      {
        uint64_t v17 = [v13 tags];

        BOOL v18 = v17 == v12;
        id v7 = v30;
        if (v18 && !a3) {
          goto LABEL_26;
        }
      }
      else
      {

        id v7 = v30;
      }
    }
    id v19 = [[FBSDisplayConfiguration alloc] _initWithImmutableDisplay:v6 originalDisplay:*(void *)(a1 + 8) assertIfInvalid:1];
    v20 = v19;
    if (!v19 || [v19 isMainDisplay])
    {
      v26 = [NSString stringWithFormat:@"we failed to make a non-main display for %@ -> created raw configuration: %@", v6, v20];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
    }
    -[FBSDisplaySource _lock_setRawConfiguration:](a1, v20);

LABEL_26:
    objc_super v21 = *(void **)(a1 + 32);
    if (v21 && ([v21 isHiddenDisplay] & 1) == 0)
    {
      int v22 = *(_DWORD *)(a1 + 108);
      if (v22 == 3 || v22 == 1)
      {
        [*(id *)(a1 + 40) identity];
        objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) identity];
        objc_claimAutoreleasedReturnValue();
        BSEqualObjects();
      }
      if (v22 || !*(unsigned char *)(a1 + 124) && [*(id *)(a1 + 32) type] == 7) {
        goto LABEL_39;
      }
      -[FBSDisplaySource _lock_noteConnected](a1);
      id v23 = *(id *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v23;
    }
    else
    {
      if ((*(_DWORD *)(a1 + 108) | 2) != 3) {
        goto LABEL_39;
      }
      -[FBSDisplaySource _lock_noteDisconnecting](a1);
      v24 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }

LABEL_39:
LABEL_40:

    if (a2) {
      *(unsigned char *)(a1 + 123) = 1;
    }
LABEL_42:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)_lock_setRawConfiguration:(uint64_t)a1
{
  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 88);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    uint64_t v5 = [v4 copy];

    v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 92));
    objc_storeStrong((id *)(a1 + 64), *(id *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 92));
    id v7 = BKLogDisplay();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(FBSDisplaySource *)a1 _lock_setRawConfiguration:v7];
    }
  }
}

- (void)setAllowsUnknown:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if (*(unsigned __int8 *)(a1 + 124) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(unsigned char *)(a1 + 124) = a2;
      os_unfair_lock_unlock(v4);
      -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](a1, 0, 0);
    }
  }
}

- (void)_lock_noteConnected
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_setAttachment:(const os_unfair_lock *)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 22);
    a1[27]._os_unfair_lock_opaque = a2;
    os_unfair_lock_lock((os_unfair_lock_t)&a1[23]);
    a1[28]._os_unfair_lock_opaque = a1[27]._os_unfair_lock_opaque;
    os_unfair_lock_unlock((os_unfair_lock_t)&a1[23]);
  }
}

- (id)_transformDisplaysIfNecessaryFromDisplayConfiguration:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    uint64_t v5 = [WeakRetained transformer];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      id v6 = [v5 transformDisplayConfiguration:v3];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      if ([v3 isMainDisplay])
      {
        uint64_t v7 = [v6 objectsPassingTest:&__block_literal_global_32];
        if ([v7 count] != 1)
        {
          uint64_t v8 = [NSString stringWithFormat:@"Transformed display configurations must have one and only one mainRootDisplay."];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:]();
          }
          [v8 UTF8String];
          _bs_set_crash_log_message();
        }
      }
      else
      {
        if (![v6 count])
        {
          objc_super v21 = NSString;
          int v22 = [v3 succinctDescription];
          id v23 = [v21 stringWithFormat:@"Cannot suppress a display currently by transforming display configurations from: %@", v22];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:]();
          }
          [v23 UTF8String];
          _bs_set_crash_log_message();
        }
        uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v6 = v6;
        uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = 0;
          uint64_t v12 = *(void *)v25;
          do
          {
            uint64_t v13 = 0;
            v14 = v11;
            do
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v6);
              }
              int v15 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
              if ([v15 isMainDisplay])
              {
                uint64_t v17 = NSString;
                BOOL v18 = [v3 succinctDescription];
                id v19 = [v17 stringWithFormat:@"May not transform a non-main display (%@) into a main display.", v18];

                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:]();
                }
                [v19 UTF8String];
                _bs_set_crash_log_message();
              }
              id v11 = [v15 identity];

              if ([v7 containsObject:v11])
              {
                v20 = [NSString stringWithFormat:@"Transformed displays may not return the same display identity multiple times: %@", v11];
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:].cold.4();
                }
                [v20 UTF8String];
                _bs_set_crash_log_message();
              }
              [v7 addObject:v11];
              ++v13;
              v14 = v11;
            }
            while (v10 != v13);
            uint64_t v10 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }
      }
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_lock_setRawReportedConfiguration:(void *)a3 effectiveReportedConfigurations:
{
  unint64_t v13 = a2;
  unint64_t v5 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
    id v6 = (void *)v13;
    if (v13 | v5)
    {
      if (!v13 || (uint64_t v7 = [(id)v5 count], v6 = (void *)v13, !v7))
      {
        uint64_t v12 = [NSString stringWithFormat:@"Raw and effective configurations must be consistent with nullability"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:]();
        }
        [v12 UTF8String];
        _bs_set_crash_log_message();
      }
    }
    uint64_t v8 = [v6 copy];
    uint64_t v9 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v8;

    uint64_t v10 = [(id)v5 copy];
    id v11 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v10;

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 92));
    objc_storeStrong((id *)(a1 + 72), *(id *)(a1 + 48));
    objc_storeStrong((id *)(a1 + 80), *(id *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 92));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evlock_reportedEffectiveConfigurations, 0);
  objc_storeStrong((id *)&self->_evlock_reportedRawConfiguration, 0);
  objc_storeStrong((id *)&self->_evlock_rawConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_reportedEffectiveConfigurations, 0);
  objc_storeStrong((id *)&self->_lock_reportedRawConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_rawConfigurationOfLastTransition, 0);
  objc_storeStrong((id *)&self->_lock_rawConfiguration, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_destroyWeak((id *)&self->_lock_monitor);

  objc_storeStrong((id *)&self->_display, 0);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (FBSDisplaySource)init
{
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint8_t v9 = NSStringFromSelector(a2);
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    unint64_t v13 = v9;
    __int16 v14 = 2114;
    int v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = @"FBSDisplaySource.m";
    __int16 v20 = 1024;
    int v21 = 78;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
}

- (id)succinctDescription
{
  v2 = [(FBSDisplaySource *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  p_externallyVisibleLock = &self->_externallyVisibleLock;
  os_unfair_lock_lock(&self->_externallyVisibleLock);
  uint64_t v5 = [NSString stringWithFormat:@"%u-%u", self->_displayID, self->_instanceID];
  [v3 appendString:v5 withName:@"instance"];

  uint64_t v6 = FBSDisplayAttachmentDescription(self->_evlock_attachment);
  [v3 appendString:v6 withName:@"attachment"];

  evlock_rawConfiguration = self->_evlock_rawConfiguration;
  if (evlock_rawConfiguration)
  {
    uint64_t v8 = [(FBSDisplayConfiguration *)evlock_rawConfiguration succinctDescription];
    id v9 = (id)[v3 appendObject:v8 withName:@"rawConfig"];

    NSUInteger v10 = [(NSSet *)self->_evlock_reportedEffectiveConfigurations count];
    evlock_reportedEffectiveConfigurations = self->_evlock_reportedEffectiveConfigurations;
    if (v10 == 1)
    {
      uint64_t v12 = [(NSSet *)evlock_reportedEffectiveConfigurations anyObject];
      unint64_t v13 = [v12 succinctDescription];
      id v14 = (id)[v3 appendObject:v13 withName:@"effectiveConfig"];
    }
    else
    {
      uint64_t v12 = [(NSSet *)evlock_reportedEffectiveConfigurations allObjects];
      [v3 appendArraySection:v12 withName:@"effectiveConfigs" skipIfEmpty:1];
    }
  }
  os_unfair_lock_unlock(p_externallyVisibleLock);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSDisplaySource *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [off_1E58F44F0 builderWithObject:self];
  p_externallyVisibleLock = &self->_externallyVisibleLock;
  os_unfair_lock_lock(&self->_externallyVisibleLock);
  uint64_t v6 = [NSString stringWithFormat:@"%u-%u", self->_displayID, self->_instanceID];
  [v4 appendString:v6 withName:@"instance"];

  uint64_t v7 = FBSDisplayAttachmentDescription(self->_evlock_attachment);
  [v4 appendString:v7 withName:@"attachment"];

  evlock_rawConfiguration = self->_evlock_rawConfiguration;
  if (evlock_rawConfiguration)
  {
    id v9 = (id)[v4 appendObject:evlock_rawConfiguration withName:@"rawConfig"];
    NSUInteger v10 = [(NSSet *)self->_evlock_reportedEffectiveConfigurations count];
    evlock_reportedEffectiveConfigurations = self->_evlock_reportedEffectiveConfigurations;
    if (v10 == 1)
    {
      uint64_t v12 = [(NSSet *)evlock_reportedEffectiveConfigurations anyObject];
      unint64_t v13 = [v12 succinctDescription];
      id v14 = (id)[v4 appendObject:v13 withName:@"effectiveConfig"];
    }
    else
    {
      uint64_t v12 = [(NSSet *)evlock_reportedEffectiveConfigurations allObjects];
      [v4 appendArraySection:v12 withName:@"effectiveConfigs" skipIfEmpty:1];
    }
  }
  os_unfair_lock_unlock(p_externallyVisibleLock);

  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSDisplaySource *)self descriptionWithMultilinePrefix:0];
}

- (void)updateTransforms
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 96));
    if (*(unsigned char *)(a1 + 121))
    {
      -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](a1, 0, 1);
    }
  }
}

- (void)_lock_noteUpdatedForTransformInvalidation:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
    uint64_t v4 = *(void **)(a1 + 32);
    if (!v4)
    {
      id v11 = NSString;
      uint64_t v12 = [(id)a1 debugDescription];
      unint64_t v13 = [v11 stringWithFormat:@"raw configuration cannot be nil : %@", v12];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }
    id v5 = v4;
    uint64_t v6 = [v5 identity];
    int v7 = *(_DWORD *)(a1 + 100);
    if (v7 != [v6 displayID])
    {
      id v14 = [NSString stringWithFormat:@"displayID must be consistent : expected=%u rawConfiguration=%@", *(unsigned int *)(a1 + 100), *(void *)(a1 + 32)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    if (*(_DWORD *)(a1 + 108) != 3)
    {
      int v15 = NSString;
      __int16 v16 = [(id)a1 debugDescription];
      uint64_t v17 = [v15 stringWithFormat:@"attachment must be connected : %@", v16];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplaySource _lock_noteUpdatedForTransformInvalidation:]();
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v8 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke;
    block[3] = &unk_1E58F7810;
    block[4] = a1;
    id v19 = v6;
    id v20 = v5;
    int v21 = sel__lock_noteUpdatedForTransformInvalidation_;
    char v22 = a2;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

- (void)_lock_noteDisconnecting
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __74__FBSDisplaySource__transformDisplaysIfNecessaryFromDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainRootDisplay];
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke(uint64_t a1)
{
  v2 = (const os_unfair_lock **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  id v3 = *v2;
  if ((*v2)[27]._os_unfair_lock_opaque == 1 && *(_DWORD *)(a1 + 56) == v3[29]._os_unfair_lock_opaque)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)&v3[8]._os_unfair_lock_opaque identity];
    LOBYTE(v4) = [v4 isEqual:v5];

    if ((v4 & 1) == 0)
    {
      id v10 = [NSString stringWithFormat:@"identity of debounced raw configuration must be consistent : configuration=%@ original=%@", *(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __39__FBSDisplaySource__lock_noteConnected__block_invoke_cold_1();
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
    }
    -[FBSDisplaySource _lock_setAttachment:](*v2, 2u);
    id v11 = *(id *)&(*v2)[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock((os_unfair_lock_t)&(*v2)[22]);
    if (v11)
    {
      uint64_t v6 = -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:]((uint64_t)*v2, v11);
      os_unfair_lock_lock((os_unfair_lock_t)&(*v2)[22]);
      -[FBSDisplaySource _lock_setAttachment:](*v2, 3u);
      -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:]((uint64_t)*v2, v11, v6);
      id WeakRetained = objc_loadWeakRetained((id *)&(*v2)[4]);
      uint64_t v8 = [WeakRetained canPostToBookendObserver];
      id v9 = *(id *)&(*v2)[8]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&(*v2)[22]);
      if (!LOBYTE((*v2)[30]._os_unfair_lock_opaque)) {
        -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:]((uint64_t)*v2, WeakRetained, v8, v6);
      }
      if (v11 != v9) {
        -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*v2, 0, 0);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&v3[22]);
  }
}

- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 connected:
{
  id v6 = a2;
  id v7 = a4;
  if (a1) {
    BSDispatchQueueAssert();
  }
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_148(uint64_t a1)
{
  -[FBSDisplaySource _transformDisplaysIfNecessaryFromDisplayConfiguration:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  -[FBSDisplaySource _lock_setAttachment:](*(const os_unfair_lock **)(a1 + 32), 3u);
  -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:](*(void *)(a1 + 32), *(void **)(a1 + 40), v8);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = [WeakRetained canPostToBookendObserver];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 88));
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 120)) {
    -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:](v7, WeakRetained, v3, v8);
  }
  if (v5 != v6) {
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*(void *)(a1 + 32), 0, 0);
  }
}

uint64_t __39__FBSDisplaySource__lock_noteConnected__block_invoke_2(uint64_t a1)
{
  return -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*(void *)(a1 + 32), 0, 0);
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_3(uint64_t a1)
{
  -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:connected:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 48));
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](v2, 0, 0);
  }
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  [*(id *)(*(void *)v1 + 48) identity];
  objc_claimAutoreleasedReturnValue();
  BSEqualObjects();
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_161(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identity];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identity];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 disconnected:
{
  id v6 = a2;
  id v7 = a4;
  if (a1) {
    BSDispatchQueueAssert();
  }
}

- (void)_callOutQueue_postToObservers:(uint64_t)a3 includeBookendObserver:(void *)a4 updated:
{
  id v6 = a2;
  id v7 = a4;
  if (a1) {
    BSDispatchQueueAssert();
  }
}

void __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = (id *)*v1;
  if (!*(void *)(*v1 + 48))
  {
    uint64_t v5 = NSString;
    id v6 = [v2 debugDescription];
    id v7 = [v5 stringWithFormat:@"reported configuration cannot be nil : %@", v6];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke_cold_1();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id v3 = v2 + 2;
  id v4 = v2[7];
  id WeakRetained = objc_loadWeakRetained(v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*v1 + 88));
  -[FBSDisplaySource _callOutQueue_postToObservers:includeBookendObserver:disconnected:](*v1, WeakRetained, [WeakRetained canPostToBookendObserver], v4);
  os_unfair_lock_lock((os_unfair_lock_t)(*v1 + 88));
  -[FBSDisplaySource _lock_setAttachment:]((const os_unfair_lock *)*v1, 0);
  -[FBSDisplaySource _lock_setRawReportedConfiguration:effectiveReportedConfigurations:](*v1, 0, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*v1 + 88));
  -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:](*v1, 0, 0);
}

uint64_t __86__FBSDisplaySource__callOutQueue_postToObservers_includeBookendObserver_disconnected___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identity];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = BKLogDisplay();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int displayID = self->_displayID;
    unsigned int instanceID = self->_instanceID;
    v11[0] = 67109634;
    v11[1] = displayID;
    __int16 v12 = 1024;
    unsigned int v13 = instanceID;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "[FBSDisplaySource %u-%u] KVO: did change %@", (uint8_t *)v11, 0x18u);
  }

  -[FBSDisplaySource _updateForInitialization:forTransformInvalidation:]((uint64_t)self, 0, 0);
}

- (uint64_t)displayID
{
  if (result) {
    return *(unsigned int *)(result + 100);
  }
  return result;
}

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplay:alwaysConnected:triggers:monitor:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateForInitialization:forTransformInvalidation:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateForInitialization:forTransformInvalidation:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateForInitialization:forTransformInvalidation:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_setRawConfiguration:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a1 + 100);
  int v5 = *(_DWORD *)(a1 + 104);
  uint64_t v6 = [*a2 debugDescription];
  v7[0] = 67109634;
  v7[1] = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  __int16 v10 = 2112;
  id v11 = v6;
  _os_log_debug_impl(&dword_19C680000, a3, OS_LOG_TYPE_DEBUG, "[FBSDisplaySource %u-%u] raw config updated to %@", (uint8_t *)v7, 0x18u);
}

- (void)_lock_setRawReportedConfiguration:effectiveReportedConfigurations:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_noteUpdatedForTransformInvalidation:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_transformDisplaysIfNecessaryFromDisplayConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __39__FBSDisplaySource__lock_noteConnected__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __62__FBSDisplaySource__lock_noteUpdatedForTransformInvalidation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 56));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __43__FBSDisplaySource__lock_noteDisconnecting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end