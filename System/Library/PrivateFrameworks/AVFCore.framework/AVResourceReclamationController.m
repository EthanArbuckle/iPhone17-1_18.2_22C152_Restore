@interface AVResourceReclamationController
+ (id)defaultController;
- (AVResourceReclamationController)init;
- (AVResourceReclamationEvent)mostRecentReclamationEvent;
- (BOOL)ensureIntegrityOfResourcesCreatedSince:(id)a3;
- (BOOL)isEnrolled;
- (id)addReclamationEventObserver:(id)a3;
- (id)registerForPurgeNotification;
- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3;
- (void)_releaseResourceReclamationAssertion:(id)a3;
- (void)_removeObserverToken:(id)a3;
- (void)_resetEnrollmentTestOnly;
- (void)dealloc;
- (void)ensureIntegrityOfResourcesCreatedSince:(id)a3 completionHandler:(id)a4;
- (void)handlePurgedNotification:(id)a3;
- (void)informReclamationEvent:(id)a3 toObservers:(id)a4;
- (void)permitReclamationWhileSuspended;
@end

@implementation AVResourceReclamationController

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = *(void *)(result + 40);
  return result;
}

uint64_t __68__AVResourceReclamationController_AVResourceReclamation__isEnrolled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56) ^ 1;
  *(unsigned char *)(*(void *)(result + 32) + 56) = 1;
  return result;
}

+ (id)defaultController
{
  if (defaultController_sCreateControllerOnce != -1) {
    dispatch_once(&defaultController_sCreateControllerOnce, &__block_literal_global_15);
  }
  return (id)defaultController_sController;
}

uint64_t __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke(uint64_t a1)
{
  uint64_t result = FigProcessStateMonitorEnrollEligibleConnectionsInPurge();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

AVResourceReclamationController *__52__AVResourceReclamationController_defaultController__block_invoke()
{
  uint64_t result = objc_alloc_init(AVResourceReclamationController);
  defaultController_sController = (uint64_t)result;
  return result;
}

- (AVResourceReclamationController)init
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v8.receiver = self;
  v8.super_class = (Class)AVResourceReclamationController;
  v3 = [(AVResourceReclamationController *)&v8 self];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControllerSQ", v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControllerCBQ", v5);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_figSetterQueue = (OS_dispatch_queue *)dispatch_queue_create("AVResourceReclamationControlleFSQ", v6);
    v3->_resourceReclamationObservers = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v3->_assertionReasons = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v3->_assertionId = 0;
    v3->_isEnrolled = 0;
  }
  return v3;
}

AVResourceReclamationEventObserverToken *__86__AVResourceReclamationController_AVResourceReclamation__addReclamationEventObserver___block_invoke(void *a1)
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"T@%lld", FigGetContinuousUpTimeNanoseconds());
  [*(id *)(a1[4] + 32) setObject:a1[5] forKey:v2];
  uint64_t result = [[AVResourceReclamationEventObserverToken alloc] initWithDetails:v2];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)permitReclamationWhileSuspended
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (![(AVResourceReclamationController *)self isEnrolled])
  {
    figSetterQueue = self->_figSetterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke;
    block[3] = &unk_1E57B3D90;
    block[4] = &v14;
    dispatch_sync(figSetterQueue, block);
    if (!*((_DWORD *)v15 + 6))
    {
      stateQueue = self->_stateQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_2;
      v8[3] = &unk_1E57B2110;
      v8[4] = self;
      v8[5] = &v10;
      dispatch_sync(stateQueue, v8);
      if (*((unsigned char *)v11 + 24))
      {
        id v5 = [(AVResourceReclamationController *)self registerForPurgeNotification];
        v6 = self->_stateQueue;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __89__AVResourceReclamationController_AVResourceReclamation__permitReclamationWhileSuspended__block_invoke_3;
        v7[3] = &unk_1E57B2098;
        v7[4] = self;
        v7[5] = v5;
        dispatch_sync(v6, v7);
      }
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (id)registerForPurgeNotification
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F22078];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__AVResourceReclamationController_AVResourceReclamation__registerForPurgeNotification__block_invoke;
  v6[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v7, &location);
  v4 = (void *)[v2 addObserverForName:v3 object:0 queue:0 usingBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (BOOL)isEnrolled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVResourceReclamationController_AVResourceReclamation__isEnrolled__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)addReclamationEventObserver:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  uint64_t v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVResourceReclamationController_AVResourceReclamation__addReclamationEventObserver___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(stateQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_stateQueue);
  dispatch_release((dispatch_object_t)self->_figSetterQueue);
  dispatch_release((dispatch_object_t)self->_callbackQueue);

  if (self->_notificationToken) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_notificationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationController;
  [(AVResourceReclamationController *)&v3 dealloc];
}

- (void)_resetEnrollmentTestOnly
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVResourceReclamationController__resetEnrollmentTestOnly__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __59__AVResourceReclamationController__resetEnrollmentTestOnly__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(*(void *)(a1 + 32) + 64));
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
  return result;
}

- (void)handlePurgedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__18;
  int v17 = __Block_byref_object_dispose__18;
  uint64_t v18 = 0;
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  id v5 = (void *)[a3 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F22068]];
  if (v6)
  {
    if (dword_1EB2D39C0)
    {
      int v12 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v8 = [[AVResourceReclamationEvent alloc] initWithEventIdentifier:v6];
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__AVResourceReclamationController_AVResourceReclamation__handlePurgedNotification___block_invoke;
    block[3] = &unk_1E57B2160;
    block[4] = self;
    void block[5] = &v13;
    dispatch_sync(stateQueue, block);
    [(AVResourceReclamationController *)self informReclamationEvent:v8 toObservers:v14[5]];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __83__AVResourceReclamationController_AVResourceReclamation__handlePurgedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectEnumerator", 0), "allObjects");
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v7 + 1) + 8 * v6)) {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:");
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __86__AVResourceReclamationController_AVResourceReclamation__registerForPurgeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    return [Weak handlePurgedNotification:a2];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_removeObserverToken:(id)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__AVResourceReclamationController_AVResourceReclamation___removeObserverToken___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __79__AVResourceReclamationController_AVResourceReclamation___removeObserverToken___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [*(id *)(a1 + 40) details];
  return [v1 removeObjectForKey:v2];
}

- (void)informReclamationEvent:(id)a3 toObservers:(id)a4
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = a4;
  void block[5] = self;
  void block[6] = a3;
  dispatch_async(callbackQueue, block);
}

uint64_t __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke_2;
  v3[3] = &unk_1E57B4C38;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __93__AVResourceReclamationController_AVResourceReclamation__informReclamationEvent_toObservers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [a2 reclamationController:v5 didReclaimObjectsWithEvent:v6];
  }
  return result;
}

- (AVResourceReclamationEvent)mostRecentReclamationEvent
{
  if ([(AVResourceReclamationController *)self isEnrolled]) {
    FigProcessStateMonitorGetServerPurgeState();
  }
  return (AVResourceReclamationEvent *)0;
}

- (BOOL)ensureIntegrityOfResourcesCreatedSince:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v4 = [(AVResourceReclamationController *)self mostRecentReclamationEvent];
  if (!v4)
  {
    unint64_t v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
    return v5 == 0;
  }
  unint64_t v5 = objc_msgSend(-[AVResourceReclamationEvent eventIdentifier](v4, "eventIdentifier"), "unsignedLongLongValue");
  if (!a3) {
    return v5 == 0;
  }
LABEL_3:
  if (dword_1EB2D39C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5 <= objc_msgSend((id)objc_msgSend(a3, "eventIdentifier", v8, v9), "unsignedLongLongValue");
}

- (void)ensureIntegrityOfResourcesCreatedSince:(id)a3 completionHandler:(id)a4
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__AVResourceReclamationController_AVResourceReclamation__ensureIntegrityOfResourcesCreatedSince_completionHandler___block_invoke;
  block[3] = &unk_1E57B3CA8;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __115__AVResourceReclamationController_AVResourceReclamation__ensureIntegrityOfResourcesCreatedSince_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) ensureIntegrityOfResourcesCreatedSince:*(void *)(a1 + 40)];
  objc_super v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)_releaseResourceReclamationAssertion:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  uint64_t v14 = 0;
  if ([(AVResourceReclamationController *)self isEnrolled])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke;
    block[3] = &unk_1E57B3270;
    void block[5] = a3;
    void block[6] = &v9;
    block[4] = self;
    dispatch_sync(stateQueue, block);
    if (v10[5])
    {
      figSetterQueue = self->_figSetterQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke_2;
      v7[3] = &unk_1E57B3D90;
      v7[4] = &v9;
      dispatch_sync(figSetterQueue, v7);
    }
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "details"));
  uint64_t v2 = *(void **)(a1 + 40);
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [v2 details];
  return [v3 removeObjectForKey:v4];
}

void __95__AVResourceReclamationController_AVResourceReclamation___releaseResourceReclamationAssertion___block_invoke_2(uint64_t a1)
{
  FigProcessStateMonitorMayPurgeClientObjects();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  if (![(AVResourceReclamationController *)self isEnrolled]) {
    goto LABEL_6;
  }
  figSetterQueue = self->_figSetterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = a3;
  void block[5] = &v14;
  dispatch_sync(figSetterQueue, block);
  if (*((_DWORD *)v15 + 6))
  {
LABEL_6:
    uint64_t v8 = 0;
  }
  else
  {
    stateQueue = self->_stateQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke_2;
    v12[3] = &unk_1E57B3270;
    v12[5] = a3;
    v12[6] = &v18;
    v12[4] = self;
    dispatch_sync(stateQueue, v12);
    long long v7 = [AVResourceReclamationAssertion alloc];
    uint64_t v8 = [(AVResourceReclamationAssertion *)v7 initWithDetails:v19[5]];
    if (dword_1EB2D39C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  uint64_t v10 = v8;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

uint64_t __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke(uint64_t a1)
{
  uint64_t result = FigProcessStateMonitorMustNotPurgeClientObjects();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __111__AVResourceReclamationController_AVResourceReclamation__takeAssertionPreventingResourceReclamationWithReason___block_invoke_2(void *a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(v3 + 48) + 1;
  *(void *)(v3 + 48) = v4;
  *(void *)(*(void *)(a1[6] + 8) + 40) = objc_msgSend(v2, "stringWithFormat:", @"A%lld@%lld", v4, FigGetContinuousUpTimeNanoseconds());
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 40);
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v6 setValue:v5 forKey:v7];
}

@end