@interface AVCaptureProprietaryDefaultsSingleton
+ (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5;
+ (id)cameraHistoryDownplayOverrideList;
+ (id)objectForKey:(id)a3;
+ (id)objectsForWildcardKey:(id)a3;
+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3;
+ (id)proprietaryDefaultsDomainForClient;
+ (id)proprietaryDefaultsSingleton;
+ (int)retryPriorFailedKeyObservationRegistrations;
+ (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6;
+ (void)initialize;
+ (void)removeObserver:(id)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forWildcardKey:(id)a4;
+ (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7;
+ (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5;
+ (void)updateProprietaryDefaultsSource;
- (AVCaptureProprietaryDefaultsSingleton)init;
- (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5;
- (id)cameraHistoryDownplayOverrideList;
- (id)objectForKey:(id)a3;
- (id)objectsForWildcardKey:(id)a3;
- (id)proprietaryDefaultsDomainForAuditToken:(id *)a3;
- (int)_registerWithServerToObserveKey:(id)a3;
- (int)retryPriorFailedKeyObservationRegistrations;
- (void)_handleDefaultChangedNotificationForKey:(id)a3 newValue:(id)a4 handlersForKeyObservers:(id)a5 callHandlersAsync:(BOOL)a6;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_runBlockOnProprietaryDefaultsSourceQueueSync:(id)a3;
- (void)_updateProprietaryDefaultsSource:(BOOL)a3;
- (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6;
- (void)dealloc;
- (void)removeObserver:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forWildcardKey:(id)a4;
- (void)unobserveChangesForKey:(id)a3;
- (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7;
- (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5;
@end

@implementation AVCaptureProprietaryDefaultsSingleton

uint64_t __87__AVCaptureProprietaryDefaultsSingleton__runBlockOnProprietaryDefaultsSourceQueueSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v10 addObserver:a3 forKey:a4 callHandlerForInitialValue:v7 defaultChangedHandler:a6];
}

- (void)addObserver:(id)a3 forKey:(id)a4 callHandlerForInitialValue:(BOOL)a5 defaultChangedHandler:(id)a6
{
  if (!a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"observer must not be nil";
    goto LABEL_8;
  }
  if (!a4)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"key must not be nil";
    goto LABEL_8;
  }
  if (!a6)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"defaultChangedHandler must not be nil";
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0, a6));
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__AVCaptureProprietaryDefaultsSingleton_addObserver_forKey_callHandlerForInitialValue_defaultChangedHandler___block_invoke;
  v9[3] = &unk_1E5A73D88;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  v9[7] = a6;
  BOOL v10 = a5;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v9];
}

- (id)objectForKey:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__4;
  BOOL v10 = __Block_byref_object_dispose__4;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCaptureProprietaryDefaultsSingleton_objectForKey___block_invoke;
  v5[3] = &unk_1E5A73DB0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v5];
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_runBlockOnProprietaryDefaultsSourceQueueSync:(id)a3
{
  label = dispatch_queue_get_label(0);
  if (label
    && !strncmp(label, self->_proprietaryDefaultsSourceQueueLabel, self->_proprietaryDefaultsSourceQueueLabelLength))
  {
    uint64_t v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
  else
  {
    proprietaryDefaultsSourceQueue = self->_proprietaryDefaultsSourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__AVCaptureProprietaryDefaultsSingleton__runBlockOnProprietaryDefaultsSourceQueueSync___block_invoke;
    block[3] = &unk_1E5A737C8;
    block[4] = a3;
    dispatch_sync(proprietaryDefaultsSourceQueue, block);
  }
}

id __54__AVCaptureProprietaryDefaultsSingleton_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 40);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v6 = v5 ? (void *)v5 : 0;
    if (*v6 >= 2uLL)
    {
      uint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t))v6[4];
      if (v7) {
        v7(v2, v3, v4 + 40);
      }
    }
  }
  uint64_t v8 = *(void **)(*(void *)(a1[6] + 8) + 40);

  return v8;
}

+ (id)objectForKey:(id)a3
{
  id v4 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  return (id)[v4 objectForKey:a3];
}

+ (id)proprietaryDefaultsSingleton
{
  if (proprietaryDefaultsSingleton_onceToken != -1) {
    dispatch_once(&proprietaryDefaultsSingleton_onceToken, &__block_literal_global_13);
  }
  return (id)proprietaryDefaultsSingleton_sProprietaryDefaults;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__AVCaptureProprietaryDefaultsSingleton_setObject_forKey___block_invoke;
  v8[3] = &unk_1E5A73DD8;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  v8[7] = &v9;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v8];
  uint64_t v7 = v10[5];
  if (v7)
  {
    [(AVCaptureProprietaryDefaultsSingleton *)self _handleDefaultChangedNotificationForKey:a4 newValue:a3 handlersForKeyObservers:v7 callHandlersAsync:0];
  }
  _Block_object_dispose(&v9, 8);
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v6 setObject:a3 forKey:a4];
}

uint64_t __109__AVCaptureProprietaryDefaultsSingleton_addObserver_forKey_callHandlerForInitialValue_defaultChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)v2;
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = (id)[*(id *)(a1 + 56) copy];
  uint64_t result = [v3 objectForKey:*(void *)(a1 + 48)];
  uint64_t v6 = result;
  if (result)
  {
    if (v2) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t result = [v3 setObject:v4 forKey:*(void *)(a1 + 48)];
    if (v2) {
      goto LABEL_9;
    }
  }
  uint64_t result = [*(id *)(a1 + 32) _registerWithServerToObserveKey:*(void *)(a1 + 40)];
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  }
LABEL_9:
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *(unsigned char *)(a1 + 64) == 0;
  }
  if (!v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = (uint64_t (*)(void *, uint64_t, uint64_t))v4[2];
    return v10(v4, v9, v8);
  }
  return result;
}

- (int)_registerWithServerToObserveKey:(id)a3
{
  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (!proprietaryDefaultsSource) {
    return -12780;
  }
  uint64_t v5 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (*v6 < 2uLL) {
    return -12782;
  }
  uint64_t v8 = (uint64_t (*)(OpaqueFigCaptureSource *, id))v6[6];
  if (!v8) {
    return -12782;
  }

  return v8(proprietaryDefaultsSource, a3);
}

- (id)cameraHistoryDownplayOverrideList
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__4;
  uint64_t v9 = __Block_byref_object_dispose__4;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__AVCaptureProprietaryDefaultsSingleton_cameraHistoryDownplayOverrideList__block_invoke;
  v4[3] = &unk_1E5A73EF0;
  v4[4] = self;
  v4[5] = &v5;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __74__AVCaptureProprietaryDefaultsSingleton_cameraHistoryDownplayOverrideList__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = getpid();
    uint64_t v4 = *(void *)(*(void *)(v2 + 40) + 8);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? (void *)v6 : 0;
    if (*v8 >= 3uLL && v8[8])
    {
      uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v8[10];
      return v9(v1, v3, v4 + 40);
    }
  }
  return result;
}

+ (id)cameraHistoryDownplayOverrideList
{
  id v2 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  return (id)[v2 cameraHistoryDownplayOverrideList];
}

void *__74__AVCaptureProprietaryDefaultsSingleton__updateProprietaryDefaultsSource___block_invoke(void *result)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result[4] + 40);
  if (result[5] != v1)
  {
    id v2 = result;
    if (v1)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(void *)(result[4] + 48), avpds_proprietaryDefaultsSourceNotificationHandler, 0, *(void *)(result[4] + 40));
      uint64_t v3 = *(const void **)(v2[4] + 40);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(v2[4] + 40) = 0;
      }
    }
    uint64_t result = (void *)v2[5];
    if (result)
    {
      *(void *)(v2[4] + 40) = CFRetain(result);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(void *)(v2[4] + 48), avpds_proprietaryDefaultsSourceNotificationHandler, 0, *(void *)(v2[4] + 40), 0);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(v2[4] + 56), "allKeys", 0);
      uint64_t result = (void *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v14;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v14 != v6) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
            uint64_t v9 = *(void *)(v2[4] + 40);
            if (v9 && (uint64_t v10 = *(void **)(CMBaseObjectGetVTable() + 16)) != 0) {
              uint64_t v11 = v10;
            }
            else {
              uint64_t v11 = 0;
            }
            if (*v11 >= 2uLL)
            {
              v12 = (void (*)(uint64_t, uint64_t))v11[6];
              if (v12) {
                v12(v9, v8);
              }
            }
            uint64_t v7 = (void *)((char *)v7 + 1);
          }
          while (v5 != v7);
          uint64_t result = (void *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          uint64_t v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

void __58__AVCaptureProprietaryDefaultsSingleton_setObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v1)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if (*v6 >= 2uLL)
    {
      uint64_t v7 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v6[5];
      if (v7)
      {
        if (!v7(v1, v3, v4))
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32)+ 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
          uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (v8)
          {
            if (![v8 count])
            {
              [*(id *)(a1 + 32) unobserveChangesForKey:*(void *)(a1 + 40)];

              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
            }
          }
        }
      }
    }
  }
}

- (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __152__AVCaptureProprietaryDefaultsSingleton_updateCameraHistory_withCameraInfo_maxLength_updateCameraHistoryDownplayOverrideList_cameraCanBeInOverrideList___block_invoke;
  v10[3] = &unk_1E5A73EA0;
  v10[4] = self;
  v10[5] = a3;
  BOOL v11 = a6;
  BOOL v12 = a7;
  v10[6] = a4;
  v10[7] = &v13;
  v10[8] = &v19;
  v10[9] = a5;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v10];
  uint64_t v9 = v20[5];
  if (v9)
  {
    [(AVCaptureProprietaryDefaultsSingleton *)self _handleDefaultChangedNotificationForKey:a3 newValue:v14[5] handlersForKeyObservers:v9 callHandlersAsync:0];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

+ (void)updateCameraHistory:(id)a3 withCameraInfo:(id)a4 maxLength:(unint64_t)a5 updateCameraHistoryDownplayOverrideList:(BOOL)a6 cameraCanBeInOverrideList:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v12 updateCameraHistory:a3 withCameraInfo:a4 maxLength:a5 updateCameraHistoryDownplayOverrideList:v8 cameraCanBeInOverrideList:v7];
}

AVCaptureProprietaryDefaultsSingleton *__69__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsSingleton__block_invoke()
{
  uint64_t result = objc_alloc_init(AVCaptureProprietaryDefaultsSingleton);
  proprietaryDefaultsSingleton_sProprietaryDefaults = (uint64_t)result;
  return result;
}

- (AVCaptureProprietaryDefaultsSingleton)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureProprietaryDefaultsSingleton;
  id v2 = [(AVCaptureProprietaryDefaultsSingleton *)&v7 init];
  if (v2)
  {
    uint64_t v3 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avfoundation.proprietarydefaults.singleton.source_queue.%p", AVCPDS_DefaultsSourceQueueContext), "UTF8String");
    size_t v4 = strlen(v3) + 1;
    v2->_proprietaryDefaultsSourceQueueLabelLength = v4;
    uint64_t v5 = (char *)malloc_type_malloc(v4, 0x824E09D8uLL);
    v2->_proprietaryDefaultsSourceQueueLabel = v5;
    memcpy(v5, v3, v2->_proprietaryDefaultsSourceQueueLabelLength);
    v2->_proprietaryDefaultsSourceQueue = (OS_dispatch_queue *)dispatch_queue_create(v2->_proprietaryDefaultsSourceQueueLabel, 0);
    v2->_proprietaryDefaultChangeNotificationCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.proprietarydefaults.singleton.callback", 0);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0) {
      +[AVCaptureDevice _registerOnceForServerConnectionDiedNotification];
    }
    v2->_weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    v2->_defaultChangedHandlersForObserversForKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_keyObservationsThatFailedToRegisterWithServer = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(AVCaptureProprietaryDefaultsSingleton *)v2 _updateProprietaryDefaultsSource:1];
  }
  return v2;
}

- (void)_updateProprietaryDefaultsSource:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (AVCaptureIsRunningInMediaserverd()) {
    size_t v4 = (void *)FigCaptureSourceCopySources();
  }
  else {
    size_t v4 = (void *)FigCaptureSourceRemoteCopyCaptureSources();
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 firstObject];
  if (!v6)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v5, "count", v8, v9);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__AVCaptureProprietaryDefaultsSingleton__updateProprietaryDefaultsSource___block_invoke;
  v10[3] = &unk_1E5A72F98;
  v10[4] = self;
  v10[5] = v6;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v10];
  if (v5) {
    CFRelease(v5);
  }
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

+ (id)proprietaryDefaultsDomainForClient
{
  return (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton](AVCaptureProprietaryDefaultsSingleton, "proprietaryDefaultsSingleton", 0, 0, 0, 0), "proprietaryDefaultsDomainForAuditToken:", &v3);
}

- (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = __Block_byref_object_copy__4;
  uint64_t v13 = __Block_byref_object_dispose__4;
  uint64_t v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsDomainForAuditToken___block_invoke;
  v6[3] = &unk_1E5A73E78;
  long long v3 = *(_OWORD *)&a3->var0[4];
  long long v7 = *(_OWORD *)a3->var0;
  long long v8 = v3;
  v6[4] = self;
  v6[5] = &v9;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v6];
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __152__AVCaptureProprietaryDefaultsSingleton_updateCameraHistory_withCameraInfo_maxLength_updateCameraHistoryDownplayOverrideList_cameraCanBeInOverrideList___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v1)
  {
    uint64_t v3 = getpid();
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned int *)(a1 + 72);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    if (*v11 >= 3uLL)
    {
      int v12 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v11[8];
      if (v12)
      {
        if (!v12(v1, v3, v4, v5, v6, v7, v8, v9 + 40))
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32)+ 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
            uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            if (v13)
            {
              if (![v13 count])
              {
                [*(id *)(a1 + 32) unobserveChangesForKey:*(void *)(a1 + 40)];

                *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t __80__AVCaptureProprietaryDefaultsSingleton_proprietaryDefaultsDomainForAuditToken___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
    long long v3 = *(_OWORD *)(result + 64);
    long long v10 = *(_OWORD *)(result + 48);
    long long v11 = v3;
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void **)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v5 = v6;
    if (v6) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    if (*v7 >= 5uLL)
    {
      uint64_t v8 = (uint64_t (*)(uint64_t, _OWORD *, uint64_t))v7[12];
      if (v8)
      {
        v9[0] = v10;
        v9[1] = v11;
        return v8(v1, v9, v2 + 40);
      }
    }
  }
  return result;
}

+ (void)removeObserver:(id)a3 forKey:(id)a4
{
  id v6 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v6 removeObserver:a3 forKey:a4];
}

+ (id)objectsForWildcardKey:(id)a3
{
  id v4 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  return (id)[v4 objectsForWildcardKey:a3];
}

+ (void)setObject:(id)a3 forWildcardKey:(id)a4
{
  id v6 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v6 setObject:a3 forWildcardKey:a4];
}

+ (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  return (__CVBuffer *)[v8 imageForKey:a3 fillWidth:v6 fillHeight:v5];
}

+ (int)retryPriorFailedKeyObservationRegistrations
{
  id v2 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  return [v2 retryPriorFailedKeyObservationRegistrations];
}

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  id v4 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (id)[v4 proprietaryDefaultsDomainForAuditToken:v7];
}

+ (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v8 updateCameraOverrideHistory:a3 withCameraInfo:a4 setOverride:v5];
}

- (void)dealloc
{
  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (proprietaryDefaultsSource) {
    CFRelease(proprietaryDefaultsSource);
  }

  free(self->_proprietaryDefaultsSourceQueueLabel);
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureProprietaryDefaultsSingleton;
  [(AVCaptureProprietaryDefaultsSingleton *)&v4 dealloc];
}

- (void)removeObserver:(id)a3 forKey:(id)a4
{
  if (!a3)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = @"observer must not be nil";
    goto LABEL_6;
  }
  if (!a4)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = @"key must not be nil";
LABEL_6:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __63__AVCaptureProprietaryDefaultsSingleton_removeObserver_forKey___block_invoke;
  v7[3] = &unk_1E5A731E0;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v7];
}

void *__63__AVCaptureProprietaryDefaultsSingleton_removeObserver_forKey___block_invoke(void *a1)
{
  uint64_t result = (void *)[*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  if (result)
  {
    long long v3 = result;
    uint64_t result = (void *)[result objectForKey:a1[6]];
    if (result)
    {
      [v3 removeObjectForKey:a1[6]];
      uint64_t result = (void *)[v3 count];
      if (!result)
      {
        [*(id *)(a1[4] + 56) setObject:0 forKeyedSubscript:a1[5]];
        uint64_t result = (void *)[*(id *)(a1[4] + 64) removeObject:a1[5]];
        uint64_t v4 = *(void *)(a1[4] + 40);
        if (v4)
        {
          uint64_t v5 = a1[5];
          uint64_t VTable = CMBaseObjectGetVTable();
          uint64_t v8 = *(void *)(VTable + 16);
          uint64_t result = (void *)(VTable + 16);
          uint64_t v7 = v8;
          uint64_t v9 = v8 ? (void *)v7 : 0;
          if (*v9 >= 2uLL)
          {
            long long v10 = (uint64_t (*)(uint64_t, uint64_t))v9[7];
            if (v10)
            {
              return (void *)v10(v4, v5);
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)objectsForWildcardKey:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  long long v10 = __Block_byref_object_dispose__4;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVCaptureProprietaryDefaultsSingleton_objectsForWildcardKey___block_invoke;
  v5[3] = &unk_1E5A73DB0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v5];
  long long v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__63__AVCaptureProprietaryDefaultsSingleton_objectsForWildcardKey___block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 40);
  if (v1)
  {
    id v2 = result;
    uint64_t v3 = result[5];
    uint64_t v4 = *(void *)(result[6] + 8);
    uint64_t v5 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if (*v6 >= 7uLL)
    {
      uint64_t v7 = (void (*)(uint64_t, uint64_t, uint64_t))v6[14];
      if (v7) {
        v7(v1, v3, v4 + 40);
      }
    }
    uint64_t v8 = *(void **)(*(void *)(v2[6] + 8) + 40);
    return v8;
  }
  return result;
}

- (void)setObject:(id)a3 forWildcardKey:(id)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  uint64_t v15 = 0;
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke;
  v9[3] = &unk_1E5A73DD8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  v9[7] = &v10;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v9];
  uint64_t v7 = (void *)v11[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke_2;
  v8[3] = &unk_1E5A73E00;
  v8[4] = self;
  v8[5] = a3;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];

  _Block_object_dispose(&v10, 8);
}

id __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if (*v6 >= 7uLL && (uint64_t v8 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, id *))v6[15]) != 0)
    {
      LOBYTE(v2) = v8(v2, v3, v4, &v21) != 0;
      id v7 = v21;
    }
    else
    {
      id v7 = 0;
      LOBYTE(v2) = 1;
    }
  }
  else
  {
    id v7 = 0;
  }
  id result = v7;
  if ((v2 & 1) == 0)
  {
    id v10 = v21;
    if (v21)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id result = (id)[v21 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (result)
      {
        id v11 = result;
        uint64_t v12 = *(void *)v18;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
            uint64_t v15 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v14];
            long long v16 = v15;
            if (v15 && ![v15 count]) {
              [*(id *)(a1 + 32) unobserveChangesForKey:v14];
            }
            else {
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v16 forKeyedSubscript:v14];
            }
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id result = (id)[v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
          id v11 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t __66__AVCaptureProprietaryDefaultsSingleton_setObject_forWildcardKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleDefaultChangedNotificationForKey:a2 newValue:*(void *)(a1 + 40) handlersForKeyObservers:a3 callHandlersAsync:0];
}

- (__CVBuffer)imageForKey:(id)a3 fillWidth:(int)a4 fillHeight:(int)a5
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __74__AVCaptureProprietaryDefaultsSingleton_imageForKey_fillWidth_fillHeight___block_invoke;
  v7[3] = &unk_1E5A73E28;
  v7[4] = self;
  v7[5] = a3;
  int v8 = a5;
  int v9 = a4;
  v7[6] = &v10;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v7];
  uint64_t v5 = (__CVBuffer *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void __74__AVCaptureProprietaryDefaultsSingleton_imageForKey_fillWidth_fillHeight___block_invoke(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_16;
  }
  uint64_t v19 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v2 options:256 relativeToURL:0 bookmarkDataIsStale:0 error:&v19];
  if (v19) {
    goto LABEL_16;
  }
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1E050] imageWithContentsOfURL:v3];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  [v4 extent];
  double v7 = v6;
  [v5 extent];
  double v9 = v8;
  int v10 = *(_DWORD *)(a1 + 56);
  int v11 = *(_DWORD *)(a1 + 60);
  if ((double)v11 / v8 <= (double)v10 / v7) {
    double v12 = (double)v10 / v7;
  }
  else {
    double v12 = (double)v11 / v8;
  }
  if (v12 >= 1.0) {
    goto LABEL_11;
  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v12, v12);
  CGAffineTransform v17 = v18;
  uint64_t v13 = [v5 imageByApplyingTransform:&v17];
  if (!v13)
  {
LABEL_16:
    FigDebugAssert3();
    return;
  }
  uint64_t v5 = (void *)v13;
  double v9 = v9 * v12;
  double v7 = v7 * v12;
LABEL_11:
  uint64_t v14 = *MEMORY[0x1E4F24D20];
  v20[0] = *MEMORY[0x1E4F24D18];
  v20[1] = v14;
  v21[0] = MEMORY[0x1E4F1CC38];
  v21[1] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v9, (unint64_t)v7, 0x34323076u, v15, (CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    long long v16 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1E018], "contextWithOptions:", MEMORY[0x1E4F1CC08]), "render:toCVPixelBuffer:", v5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    CFAutorelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
}

- (int)retryPriorFailedKeyObservationRegistrations
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  uint64_t v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  CGAffineTransform v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  long long v20 = __Block_byref_object_dispose__4;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__AVCaptureProprietaryDefaultsSingleton_retryPriorFailedKeyObservationRegistrations__block_invoke;
  v11[3] = &unk_1E5A73E50;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v28;
  v11[7] = &v22;
  v11[8] = &v16;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v11];
  uint64_t v3 = [(id)v29[5] count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = [(id)v29[5] objectAtIndexedSubscript:i];
      uint64_t v6 = [(id)v23[5] objectAtIndexedSubscript:i];
      uint64_t v7 = [(id)v17[5] objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v7;
      }
      [(AVCaptureProprietaryDefaultsSingleton *)self _handleDefaultChangedNotificationForKey:v6 newValue:v8 handlersForKeyObservers:v5 callHandlersAsync:0];
    }
  }

  int v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v9;
}

uint64_t __84__AVCaptureProprietaryDefaultsSingleton_retryPriorFailedKeyObservationRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (result)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _registerWithServerToObserveKey:v9];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          break;
        }
        [v3 addObject:v9];
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (result)
    {
      uint64_t v10 = result;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v3);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v13];
          uint64_t v14 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v13];
          if (v14)
          {
            int v15 = v14;
            if ([v14 count])
            {
              if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
              {
                *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              uint64_t v16 = [*(id *)(a1 + 32) objectForKey:v13];
              if (!v16) {
                uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
              }
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v15];
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v16];
            }
            else
            {
              [*(id *)(a1 + 32) unobserveChangesForKey:v13];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        uint64_t v10 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)updateCameraOverrideHistory:(id)a3 withCameraInfo:(id)a4 setOverride:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3052000000;
  long long v22 = __Block_byref_object_copy__4;
  long long v23 = __Block_byref_object_dispose__4;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  long long v17 = __Block_byref_object_dispose__4;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__AVCaptureProprietaryDefaultsSingleton_updateCameraOverrideHistory_withCameraInfo_setOverride___block_invoke;
  v11[3] = &unk_1E5A73EC8;
  v11[4] = self;
  v11[5] = a3;
  BOOL v12 = a5;
  v11[6] = a4;
  v11[7] = &v13;
  v11[8] = &v19;
  [(AVCaptureProprietaryDefaultsSingleton *)self _runBlockOnProprietaryDefaultsSourceQueueSync:v11];
  uint64_t v7 = v20[5];
  if (v7)
  {
    if (dword_1EB4C92A0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v7 = v20[5];
    }
    -[AVCaptureProprietaryDefaultsSingleton _handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:](self, "_handleDefaultChangedNotificationForKey:newValue:handlersForKeyObservers:callHandlersAsync:", a3, v14[5], v7, 0, v9, v10);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __96__AVCaptureProprietaryDefaultsSingleton_updateCameraOverrideHistory_withCameraInfo_setOverride___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v1)
  {
    v15[0] = 0;
    uint64_t v3 = getpid();
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v9 = v8 ? v8 : 0;
    if (*(void *)v9 >= 3uLL
      && *(void *)(v9 + 64)
      && !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t))(v9 + 72))(v1, v3, v4, v5, v6, v15, v7 + 40)&& v15[0] != 0)
    {
      if (dword_1EB4C92A0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(void *)(a1 + 40), v13, v14);
      BOOL v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (v12)
      {
        if (![v12 count])
        {
          [*(id *)(a1 + 32) unobserveChangesForKey:*(void *)(a1 + 40)];

          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
        }
      }
    }
  }
}

+ (void)updateProprietaryDefaultsSource
{
  id v2 = +[AVCaptureProprietaryDefaultsSingleton proprietaryDefaultsSingleton];

  [v2 _updateProprietaryDefaultsSource:1];
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F51E68]])
  {
    uint64_t v6 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F52198]];
    uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F521A0]];
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      FigDebugAssert3();
    }
    else
    {
      [(AVCaptureProprietaryDefaultsSingleton *)self _handleDefaultChangedNotificationForKey:v6 newValue:v7 handlersForKeyObservers:0 callHandlersAsync:1];
    }
  }
}

- (void)unobserveChangesForKey:(id)a3
{
  proprietaryDefaultsSource = self->_proprietaryDefaultsSource;
  if (proprietaryDefaultsSource)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v6 = v5 ? (void *)v5 : 0;
    if (*v6 >= 2uLL)
    {
      uint64_t v7 = (void (*)(OpaqueFigCaptureSource *, id))v6[7];
      if (v7)
      {
        v7(proprietaryDefaultsSource, a3);
      }
    }
  }
}

- (void)_handleDefaultChangedNotificationForKey:(id)a3 newValue:(id)a4 handlersForKeyObservers:(id)a5 callHandlersAsync:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1A62348E0](self, a2);
  if (a5) {
    goto LABEL_3;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  uint64_t v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke;
  v24[3] = &unk_1E5A73F18;
  v24[5] = a3;
  v24[6] = &v25;
  v24[4] = self;
  -[AVCaptureProprietaryDefaultsSingleton _runBlockOnProprietaryDefaultsSourceQueueSync:](self, "_runBlockOnProprietaryDefaultsSourceQueueSync:", v24, context);
  a5 = (id)v26[5];
  _Block_object_dispose(&v25, 8);
  if (a5)
  {
LABEL_3:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a4 = 0;
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a5, "keyEnumerator", context), "allObjects");
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [a5 objectForKey:v14];
          if (v15)
          {
            if (v6)
            {
              proprietaryDefaultChangeNotificationCallbackQueue = self->_proprietaryDefaultChangeNotificationCallbackQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke_2;
              block[3] = &unk_1E5A73F40;
              block[4] = v14;
              void block[5] = a3;
              block[6] = a4;
              block[7] = v15;
              dispatch_async(proprietaryDefaultChangeNotificationCallbackQueue, block);
            }
            else
            {
              (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, a3, a4);
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
      }
      while (v11);
    }
  }
}

void __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    if (![v2 count])
    {
      [*(id *)(a1 + 32) unobserveChangesForKey:*(void *)(a1 + 40)];

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

void __132__AVCaptureProprietaryDefaultsSingleton__handleDefaultChangedNotificationForKey_newValue_handlersForKeyObservers_callHandlersAsync___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void **)(a1 + 32);
}

@end