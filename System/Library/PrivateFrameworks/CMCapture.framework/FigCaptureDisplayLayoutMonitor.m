@interface FigCaptureDisplayLayoutMonitor
+ (id)sharedContinuityDisplayLayoutMonitor;
+ (id)sharedDisplayLayoutMonitor;
+ (id)sharedExternalDisplayLayoutMonitor;
+ (void)initialize;
- (BOOL)isDisplayConnected;
- (BOOL)isOnHomeScreen;
- (BOOL)isOnLockScreen;
- (FigCaptureDisplayLayout)currentLayout;
- (FigCaptureDisplayLayoutMonitor)initWithFBSDisplayLayoutMonitorCreateFunction:(void *)a3 displayType:(int64_t)a4;
- (NSString)debugDescription;
- (NSString)description;
- (id)osStatePropertyList;
- (int64_t)displayType;
- (uint64_t)_addLayoutObserver:(int)a3 withImmediateCallback:;
- (uint64_t)_displayIdentityForDisplayInfo:(uint64_t)a1;
- (uint64_t)_isFBSDisplayLayoutOnHomeScreen:(uint64_t)result;
- (uint64_t)_isFBSDisplayLayoutOnLockScreen:(uint64_t)result;
- (uint64_t)_parseFBSDisplayLayout:(uint64_t)result;
- (uint64_t)_stopMonitoringDisplayWithIdentity:(uint64_t)result;
- (void)_startMonitoringDisplayWithIdentity:(uint64_t)a1;
- (void)_updateObserversWithLayout:(uint64_t)a1;
- (void)addLayoutObserver:(id)a3;
- (void)addLayoutObserverWithoutImmediateCallback:(id)a3;
- (void)dealloc;
- (void)externalDisplayDidConnect:(id)a3;
- (void)externalDisplayWillDisconnect:(id)a3;
- (void)removeLayoutObserver:(id)a3;
@end

@implementation FigCaptureDisplayLayoutMonitor

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureDisplayLayoutMonitor debugDescription](self, "debugDescription")];
}

- (NSString)debugDescription
{
  unint64_t displayType = self->_displayType;
  if (displayType > 2) {
    return 0;
  }
  else {
    return &off_1E5C29288[displayType]->isa;
  }
}

NSObject *__92__FigCaptureDisplayLayoutMonitor_initWithFBSDisplayLayoutMonitorCreateFunction_displayType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[FigCaptureDisplayLayoutMonitor _parseFBSDisplayLayout:](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  result = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    result = dispatch_semaphore_signal(result);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  return result;
}

- (uint64_t)_parseFBSDisplayLayout:(uint64_t)result
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  v58 = (void *)[MEMORY[0x1E4F1CA48] array];
  v57 = (void *)[MEMORY[0x1E4F1CA48] array];
  v62 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
  result = [MEMORY[0x1E4F1CA48] array];
  v50 = (void *)result;
  if (dword_1EB4C50D0)
  {
    int v72 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a2)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    if (!v5)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isMainDisplay");
      if (result) {
        goto LABEL_13;
      }
      uint64_t v5 = *(void *)(v3 + 8);
    }
    if (v5 == 1)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isExternal");
      if (result) {
        goto LABEL_13;
      }
      uint64_t v5 = *(void *)(v3 + 8);
    }
    if (v5 != 2) {
      return result;
    }
    result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isExternal");
    if (!result) {
      return result;
    }
  }
LABEL_13:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v6 = objc_msgSend(a2, "elements", v44, v45);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v75 count:16];
  v8 = (uint64_t *)MEMORY[0x1E4F625B0];
  v9 = (uint64_t *)MEMORY[0x1E4FA6F30];
  if (!v7)
  {
    uint64_t v11 = 0;
LABEL_27:
    uint64_t v18 = v3;
    pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 32));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v19 = (void *)[a2 elements];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (!v20)
    {
      char v48 = 0;
      char v46 = 0;
      uint64_t v47 = 0;
      uint64_t v59 = 0;
      uint64_t v61 = 0;
      goto LABEL_64;
    }
    uint64_t v21 = v20;
    char v48 = 0;
    char v46 = 0;
    uint64_t v47 = 0;
    uint64_t v59 = 0;
    uint64_t v61 = 0;
    uint64_t v22 = *(void *)v64;
    uint64_t v23 = *MEMORY[0x1E4F625C0];
    uint64_t v55 = *v8;
    uint64_t v56 = *MEMORY[0x1E4F625B8];
    uint64_t v54 = *MEMORY[0x1E4F625A8];
    uint64_t v53 = *v9;
    uint64_t v52 = *MEMORY[0x1E4FA6F70];
    uint64_t v51 = *MEMORY[0x1E4FA6F80];
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v64 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        [v25 frame];
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        [a2 bounds];
        v78.origin.x = v34;
        v78.origin.y = v35;
        v78.size.width = v36;
        v78.size.height = v37;
        v77.origin.x = v27;
        v77.origin.y = v29;
        v77.size.width = v31;
        v77.size.height = v33;
        BOOL v38 = CGRectEqualToRect(v77, v78);
        if ([v25 isUIApplicationElement])
        {
          if ([v25 level] < v11)
          {
            uint64_t v39 = [v25 bundleIdentifier];
            v40 = v62;
LABEL_35:
            [v40 addObject:v39];
            continue;
          }
          if ([v25 layoutRole] == 5)
          {
            if ((objc_msgSend(v25, "sb_isStashedPIP") & 1) == 0)
            {
              uint64_t v39 = [v25 bundleIdentifier];
              v40 = v50;
              goto LABEL_35;
            }
          }
          else
          {
            if ((objc_msgSend(v58, "containsObject:", objc_msgSend(v25, "bundleIdentifier")) & 1) == 0
              && (objc_msgSend(v57, "containsObject:", objc_msgSend(v25, "bundleIdentifier")) & 1) == 0)
            {
              uint64_t v42 = [v25 bundleIdentifier];
              if (v38) {
                v43 = v58;
              }
              else {
                v43 = v57;
              }
              [v43 addObject:v42];
            }
            if ([v25 level] > v59) {
              uint64_t v59 = [v25 level];
            }
            if (objc_msgSend(v25, "sb_isTransitioning"))
            {
              uint64_t v39 = [v25 bundleIdentifier];
              v40 = (void *)v49;
              goto LABEL_35;
            }
          }
        }
        else if (v38)
        {
          id v41 = *(id *)(v18 + 56);
          if (!v41)
          {
            v73[0] = v23;
            v73[1] = v56;
            v73[2] = v55;
            v73[3] = v54;
            v73[4] = @"com.apple.CMViewSrvc";
            v73[5] = v53;
            v73[6] = v52;
            v73[7] = v51;
            v73[8] = @"SBControlCenterModuleTransientOverlayViewController";
            v73[9] = 0x1EFA558A0;
            v73[10] = 0x1EFA55AA0;
            v73[11] = 0x1EFA55AC0;
            id v41 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:12];
            *(void *)(v18 + 56) = v41;
          }
          if (objc_msgSend(v41, "containsObject:", objc_msgSend(v25, "identifier")))
          {
            if (objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", v23))
            {
              char v48 = 1;
            }
            else if ((objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", 0x1EFA558A0) & 1) != 0 {
                   || objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", 0x1EFA55AA0))
            }
            {
              char v46 = 1;
            }
          }
          else if ([v25 level] > v61)
          {
            uint64_t v61 = [v25 level];
            uint64_t v47 = [v25 identifier];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v74 count:16];
      if (!v21)
      {
LABEL_64:
        if (v61 > v59 || (v46 & 1) != 0)
        {
          [v62 addObjectsFromArray:v58];
          [v62 addObjectsFromArray:v57];
          [v62 addObjectsFromArray:v50];
          [v58 removeAllObjects];
          [v57 removeAllObjects];
          [v50 removeAllObjects];
          if (!((v47 == 0) | v46 & 1)) {
            [v58 addObject:v47];
          }
        }
        [v58 count];
        [v57 count];

        *(void *)(v18 + 48) = [[FigCaptureDisplayLayout alloc] _init];
        objc_msgSend(*(id *)(v18 + 48), "setTimestamp:", objc_msgSend(a2, "timestamp"));
        [*(id *)(v18 + 48) setDisplayType:*(void *)(v18 + 8)];
        objc_msgSend(*(id *)(v18 + 48), "setForegroundApps:", objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v57));
        objc_msgSend(*(id *)(v18 + 48), "setObscuredApps:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v62));
        objc_msgSend(*(id *)(v18 + 48), "setTransitioningApps:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v49));
        objc_msgSend(*(id *)(v18 + 48), "setPipApps:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v50));
        objc_msgSend(*(id *)(v18 + 48), "setOnHomeScreen:", -[FigCaptureDisplayLayoutMonitor _isFBSDisplayLayoutOnHomeScreen:](v18, a2));
        objc_msgSend(*(id *)(v18 + 48), "setOnLockScreen:", -[FigCaptureDisplayLayoutMonitor _isFBSDisplayLayoutOnLockScreen:](v18, a2));
        [*(id *)(v18 + 48) setSiriVisible:v48 & 1];
        [*(id *)(v18 + 48) setPaymentServiceVisible:v46 & 1];
        if (*(void *)(v18 + 8) == 2) {
          *(unsigned char *)(v18 + 40) = a2 != 0;
        }
        -[FigCaptureDisplayLayoutMonitor _updateObserversWithLayout:](v18, *(void *)(v18 + 48));
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v18 + 32));
      }
    }
  }
  uint64_t v10 = v7;
  uint64_t v60 = v3;
  uint64_t v11 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v68;
  uint64_t v14 = *MEMORY[0x1E4FA6F30];
  uint64_t v15 = *MEMORY[0x1E4F625B0];
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v68 != v13) {
        objc_enumerationMutation(v6);
      }
      v17 = *(void **)(*((void *)&v67 + 1) + 8 * v16);
      if (objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqualToString:", v14))
      {
        char v12 = 1;
      }
      else if (objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqualToString:", v15))
      {
        uint64_t v11 = [v17 level];
      }
      ++v16;
    }
    while (v10 != v16);
    result = [v6 countByEnumeratingWithState:&v67 objects:v75 count:16];
    uint64_t v10 = result;
  }
  while (result);
  uint64_t v3 = v60;
  v9 = (uint64_t *)MEMORY[0x1E4FA6F30];
  v8 = (uint64_t *)MEMORY[0x1E4F625B0];
  if ((v12 & 1) == 0) {
    goto LABEL_27;
  }
  return result;
}

- (uint64_t)_isFBSDisplayLayoutOnHomeScreen:(uint64_t)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "elements"), "count") == 1
      || objc_msgSend((id)objc_msgSend(a2, "elements"), "count") == 2)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v3 = objc_msgSend(a2, "elements", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v12;
        uint64_t v7 = *MEMORY[0x1E4FA6F40];
        uint64_t v8 = *MEMORY[0x1E4FA6F38];
LABEL_6:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if ((objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", v7) & 1) == 0)
          {
            result = objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", v8);
            if (!result) {
              break;
            }
          }
          if (v5 == ++v9)
          {
            uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
            if (v5) {
              goto LABEL_6;
            }
            return 1;
          }
        }
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_updateObserversWithLayout:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    FigSimpleMutexCheckIsLockedOnThisThread();
    if (dword_1EB4C50D0)
    {
      int v17 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 16));
    uint64_t v5 = (void *)[*(id *)(a1 + 24) copy];
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 16));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "layoutMonitor:didUpdateLayout:", a1, a2, v10, v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (uint64_t)_isFBSDisplayLayoutOnLockScreen:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    result = [a2 displayBacklightLevel];
    if (result)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v3 = objc_msgSend(a2, "elements", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v15;
        uint64_t v7 = *MEMORY[0x1E4F625B0];
        int64_t v8 = 0x8000000000000000;
        uint64_t v9 = 0x8000000000000000;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v15 != v6) {
              objc_enumerationMutation(v3);
            }
            uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            char v12 = objc_msgSend((id)objc_msgSend(v11, "identifier"), "isEqualToString:", v7);
            uint64_t v13 = [v11 level];
            if (v12)
            {
              int64_t v8 = v13;
            }
            else if (v13 > v9)
            {
              uint64_t v9 = [v11 level];
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v5);
      }
      else
      {
        int64_t v8 = 0x8000000000000000;
        uint64_t v9 = 0x8000000000000000;
      }
      return v8 > v9;
    }
  }
  return result;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (uint64_t)_addLayoutObserver:(int)a3 withImmediateCallback:
{
  if (result)
  {
    uint64_t v5 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 16));
    [*(id *)(v5 + 24) addObject:a2];
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 16));
    if (a3)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 32));
      [a2 layoutMonitor:v5 didUpdateLayout:*(void *)(v5 + 48)];
      uint64_t v6 = *(pthread_mutex_t **)(v5 + 32);
      return pthread_mutex_unlock(v6);
    }
  }
  return result;
}

+ (id)sharedContinuityDisplayLayoutMonitor
{
  if (sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitorOnceToken != -1) {
    dispatch_once(&sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitorOnceToken, &__block_literal_global_19);
  }
  return (id)sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitor;
}

- (void)addLayoutObserver:(id)a3
{
}

+ (id)sharedDisplayLayoutMonitor
{
  if (sharedDisplayLayoutMonitor_sLayoutMonitorOnceToken != -1) {
    dispatch_once(&sharedDisplayLayoutMonitor_sLayoutMonitorOnceToken, &__block_literal_global_71);
  }
  return (id)sharedDisplayLayoutMonitor_sLayoutMonitor;
}

- (BOOL)isOnHomeScreen
{
  uint64_t v3 = (void *)[(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
  return -[FigCaptureDisplayLayoutMonitor _isFBSDisplayLayoutOnHomeScreen:]((uint64_t)self, v3);
}

- (BOOL)isDisplayConnected
{
  return self->_displayConnected;
}

- (void)addLayoutObserverWithoutImmediateCallback:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

FigCaptureDisplayLayoutMonitor *__60__FigCaptureDisplayLayoutMonitor_sharedDisplayLayoutMonitor__block_invoke()
{
  result = [[FigCaptureDisplayLayoutMonitor alloc] initWithFBSDisplayLayoutMonitorCreateFunction:fcdlm_createLayoutMonitorForMainDisplay displayType:0];
  sharedDisplayLayoutMonitor_sLayoutMonitor = (uint64_t)result;
  return result;
}

+ (id)sharedExternalDisplayLayoutMonitor
{
  if (sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitorOnceToken != -1) {
    dispatch_once(&sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitorOnceToken, &__block_literal_global_17_0);
  }
  return (id)sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitor;
}

FigCaptureDisplayLayoutMonitor *__68__FigCaptureDisplayLayoutMonitor_sharedExternalDisplayLayoutMonitor__block_invoke()
{
  result = [[FigCaptureDisplayLayoutMonitor alloc] initWithFBSDisplayLayoutMonitorCreateFunction:fcdlm_createLayoutMonitorForExternalDisplay displayType:1];
  sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitor = (uint64_t)result;
  return result;
}

FigCaptureDisplayLayoutMonitor *__70__FigCaptureDisplayLayoutMonitor_sharedContinuityDisplayLayoutMonitor__block_invoke()
{
  result = [[FigCaptureDisplayLayoutMonitor alloc] initWithFBSDisplayLayoutMonitorCreateFunction:fcdlm_createLayoutMonitorForContinuityDisplay displayType:2];
  sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitor = (uint64_t)result;
  return result;
}

- (FigCaptureDisplayLayoutMonitor)initWithFBSDisplayLayoutMonitorCreateFunction:(void *)a3 displayType:(int64_t)a4
{
  v21[16] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)FigCaptureDisplayLayoutMonitor;
  uint64_t v6 = [(FigCaptureDisplayLayoutMonitor *)&v19 init];
  uint64_t v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_unint64_t displayType = a4;
  v6->_layoutObserversLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v7->_layoutObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7->_layoutLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v7->_layout = (FigCaptureDisplayLayout *)[[FigCaptureDisplayLayout alloc] _init];
  -[FigCaptureDisplayLayout setTimestamp:](v7->_layout, "setTimestamp:", [MEMORY[0x1E4F1C9C8] date]);
  [(FigCaptureDisplayLayout *)v7->_layout setDisplayType:v7->_displayType];
  if (dword_1EB4C50D0)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3052000000;
  v21[3] = __Block_byref_object_copy__27;
  v21[4] = __Block_byref_object_dispose__27;
  v21[5] = v7;
  uint64_t v9 = dispatch_semaphore_create(0);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3052000000;
  v20[3] = __Block_byref_object_copy__27;
  v20[4] = __Block_byref_object_dispose__27;
  v20[5] = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__FigCaptureDisplayLayoutMonitor_initWithFBSDisplayLayoutMonitorCreateFunction_displayType___block_invoke;
  v16[3] = &unk_1E5C29240;
  v16[4] = v21;
  v16[5] = v20;
  v7->_displayConnected = v7->_displayType == 0;
  uint64_t v10 = ((uint64_t (*)(void *))a3)(v16);
  v7->_layoutMonitor = (FBSDisplayLayoutMonitor *)v10;
  if (v10)
  {
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v7->_displayType != 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v7->_displayType == 1)
  {
    v7->_displayConnected = 0;
LABEL_9:
    uint64_t v11 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E4FA6A80]);
    v7->_externalDisplayService = v11;
    [(SBSExternalDisplayService *)v11 addObserver:v7];
  }
LABEL_10:

  unint64_t displayType = v7->_displayType;
  if (displayType > 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = off_1E5C29288[displayType];
  }
  v7->_osStateHandle = -[FigCaptureOSStateHandle initWithTitle:queue:dataProvider:]([FigCaptureOSStateHandle alloc], "initWithTitle:queue:dataProvider:", [NSString stringWithFormat:@"LayoutMonitor - %@", v13, v15], 0, v7);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  return v7;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  FigSimpleMutexDestroy();
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDisplayLayoutMonitor;
  [(FigCaptureDisplayLayoutMonitor *)&v3 dealloc];
}

- (void)removeLayoutObserver:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutObserversLock);
  [(NSMutableArray *)self->_layoutObservers removeObject:a3];
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutObserversLock);
  layoutLock = self->_layoutLock;
  pthread_mutex_unlock((pthread_mutex_t *)layoutLock);
}

- (FigCaptureDisplayLayout)currentLayout
{
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  objc_super v3 = self->_layout;
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutLock);
  return v3;
}

- (BOOL)isOnLockScreen
{
  objc_super v3 = (void *)[(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
  return -[FigCaptureDisplayLayoutMonitor _isFBSDisplayLayoutOnLockScreen:]((uint64_t)self, v3);
}

- (void)_startMonitoringDisplayWithIdentity:(uint64_t)a1
{
  v14[27] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = __Block_byref_object_copy__27;
    v14[4] = __Block_byref_object_dispose__27;
    v14[5] = a1;
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4 == 1)
    {
      char v5 = [a2 isExternal];
    }
    else
    {
      if (v4)
      {
LABEL_12:
        _Block_object_dispose(v14, 8);
        return;
      }
      char v5 = [a2 isMainDisplay];
    }
    if (v5)
    {
      if ([a2 isExternal])
      {
        uint64_t v6 = SBSCreateLayoutServiceEndpointForExternalDisplay();
        if (v6)
        {
          if (dword_1EB4C50D0)
          {
            int v13 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          int64_t v8 = objc_msgSend(MEMORY[0x1E4F62958], "configurationWithEndpoint:", v6, v9, v10, MEMORY[0x1E4F143A8], 3221225472, __70__FigCaptureDisplayLayoutMonitor__startMonitoringDisplayWithIdentity___block_invoke, &unk_1E5C29268, v14);
          [v8 setNeedsUserInteractivePriority:1];
          [v8 setTransitionHandler:&v11];
          pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 32));
          *(unsigned char *)(a1 + 40) = 1;
          [*(id *)(a1 + 64) invalidate];

          *(void *)(a1 + 64) = (id)[MEMORY[0x1E4F62940] monitorWithConfiguration:v8];
          pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 32));
        }
      }
    }
    goto LABEL_12;
  }
}

uint64_t __70__FigCaptureDisplayLayoutMonitor__startMonitoringDisplayWithIdentity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return -[FigCaptureDisplayLayoutMonitor _parseFBSDisplayLayout:](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
}

- (uint64_t)_stopMonitoringDisplayWithIdentity:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 8);
    if (v3 == 1)
    {
      result = [a2 isExternal];
      if (!result) {
        return result;
      }
    }
    else
    {
      if (v3) {
        return result;
      }
      result = [a2 isMainDisplay];
      if ((result & 1) == 0) {
        return result;
      }
    }
    if (dword_1EB4C50D0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v2 + 32));
    *(unsigned char *)(v2 + 40) = 0;
    [*(id *)(v2 + 64) invalidate];

    *(void *)(v2 + 64) = 0;
    *(void *)(v2 + 48) = [[FigCaptureDisplayLayout alloc] _init];
    objc_msgSend(*(id *)(v2 + 48), "setTimestamp:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
    [*(id *)(v2 + 48) setDisplayType:*(void *)(v2 + 8)];
    -[FigCaptureDisplayLayoutMonitor _updateObserversWithLayout:](v2, *(void *)(v2 + 48));
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 32));
  }
  return result;
}

- (uint64_t)_displayIdentityForDisplayInfo:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F62970]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = objc_msgSend(v4, "connectedIdentities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = *(void *)(a1 + 8);
        if (v11 == 1)
        {
          if (![*(id *)(*((void *)&v13 + 1) + 8 * v9) isExternal]) {
            goto LABEL_13;
          }
        }
        else if (v11 || ([*(id *)(*((void *)&v13 + 1) + 8 * v9) isMainDisplay] & 1) == 0)
        {
          goto LABEL_13;
        }
        if (objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "configurationForIdentity:", v10), "hardwareIdentifier")))goto LABEL_16; {
LABEL_13:
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v10 = 0;
LABEL_16:
  [v4 invalidate];

  return v10;
}

- (void)externalDisplayDidConnect:(id)a3
{
  if (dword_1EB4C50D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = (void *)-[FigCaptureDisplayLayoutMonitor _displayIdentityForDisplayInfo:]((uint64_t)self, a3);
  if (self)
  {
    uint64_t v7 = v6;
    int64_t displayType = self->_displayType;
    if (displayType == 1)
    {
      if (![v6 isExternal]) {
        return;
      }
    }
    else if (displayType || ([v6 isMainDisplay] & 1) == 0)
    {
      return;
    }
    -[FigCaptureDisplayLayoutMonitor _startMonitoringDisplayWithIdentity:]((uint64_t)self, v7);
  }
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  if (dword_1EB4C50D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = (void *)-[FigCaptureDisplayLayoutMonitor _displayIdentityForDisplayInfo:]((uint64_t)self, a3);
  if (self)
  {
    uint64_t v7 = v6;
    int64_t displayType = self->_displayType;
    if (displayType == 1)
    {
      if (![v6 isExternal]) {
        return;
      }
    }
    else if (displayType || ([v6 isMainDisplay] & 1) == 0)
    {
      return;
    }
    -[FigCaptureDisplayLayoutMonitor _stopMonitoringDisplayWithIdentity:]((uint64_t)self, v7);
  }
}

- (id)osStatePropertyList
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  BOOL displayConnected = self->_displayConnected;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  layoutObservers = self->_layoutObservers;
  uint64_t v6 = [(NSMutableArray *)layoutObservers countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(layoutObservers);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "description"));
      }
      uint64_t v7 = [(NSMutableArray *)layoutObservers countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
  id v10 = [(FigCaptureDisplayLayout *)self->_layout description];
  if ([(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout]) {
    uint64_t v11 = (__CFString *)objc_msgSend((id)objc_msgSend((id)-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout"), "description"), "stringByReplacingOccurrencesOfString:withString:", @"\n", &stru_1EFA403E0);
  }
  else {
    uint64_t v11 = @"nil";
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutLock);
  v17[0] = @"connected";
  v18[0] = [NSNumber numberWithBool:displayConnected];
  v18[1] = v3;
  v17[1] = @"observers";
  v17[2] = @"layout";
  v17[3] = @"FBSDisplayLayout";
  v18[2] = v10;
  v18[3] = v11;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
}

@end