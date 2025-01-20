@interface AVRouteDetector
+ (void)initialize;
- (AVRouteDetector)init;
- (BOOL)_isAirPlayDevicePresenceDetected;
- (BOOL)_isCustomRoutePresenceDetected;
- (BOOL)detectsCustomRoutes;
- (BOOL)isRouteDetectionEnabled;
- (BOOL)multipleRoutesDetected;
- (void)_didEnterBackground;
- (void)_didEnterForeground;
- (void)_updateMultipleRoutesDetected;
- (void)_updateRouteDetectionEnabled;
- (void)dealloc;
- (void)setDetectsCustomRoutes:(BOOL)detectsCustomRoutes;
- (void)setRouteDetectionEnabled:(BOOL)routeDetectionEnabled;
@end

@implementation AVRouteDetector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVRouteDetector)init
{
  v19.receiver = self;
  v19.super_class = (Class)AVRouteDetector;
  v2 = [(AVRouteDetector *)&v19 init];
  if (v2
    && (v3 = objc_alloc_init(AVRouteDetectorInternal), (v2->_routeDetectorInternal = v3) != 0)
    && (v3->multipleRoutesDetected = 0,
        v2->_routeDetectorInternal->detectsCustomRoutes = 0,
        v2->_routeDetectorInternal->routeDetectionEnabled = 0,
        v2->_routeDetectorInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avroutedetector.ivars"), (v2->_routeDetectorInternal->outputDeviceDiscoverySession = [[AVOutputDeviceDiscoverySession alloc] initWithDeviceFeatures:1]) != 0))
  {
    objc_initWeak(&location, v2);
    v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    outputDeviceDiscoverySession = v2->_routeDetectorInternal->outputDeviceDiscoverySession;
    uint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __23__AVRouteDetector_init__block_invoke;
    v16[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v17, &location);
    v2->_routeDetectorInternal->outputDevicesChangeNotificationToken = (id)[v4 addObserverForName:@"AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification" object:outputDeviceDiscoverySession queue:v6 usingBlock:v16];
    v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __23__AVRouteDetector_init__block_invoke_2;
    v14[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v15, &location);
    v2->_routeDetectorInternal->didEnterBackgroundNotificationToken = (id)[v7 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v14];
    v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __23__AVRouteDetector_init__block_invoke_3;
    v12[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v13, &location);
    v2->_routeDetectorInternal->didEnterForegroundNotificationToken = (id)[v8 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:v12];
    v9 = v2;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __23__AVRouteDetector_init__block_invoke_4;
    v11[3] = &unk_1E57B1E80;
    v11[4] = v2;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __23__AVRouteDetector_init__block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _updateMultipleRoutesDetected];
}

uint64_t __23__AVRouteDetector_init__block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didEnterBackground];
}

uint64_t __23__AVRouteDetector_init__block_invoke_3(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didEnterForeground];
}

uint64_t __23__AVRouteDetector_init__block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (AVRouteDetectorShouldAppBeConsideredForeground_sniffUIApplicationOnce != -1) {
    dispatch_once(&AVRouteDetectorShouldAppBeConsideredForeground_sniffUIApplicationOnce, &__block_literal_global_43);
  }
  BOOL v3 = AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v2 = (void *)[(id)AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass performSelector:AVRouteDetectorShouldAppBeConsideredForeground_sharedApplicationSelector], (objc_opt_respondsToSelector() & 1) != 0)&& (unint64_t)objc_msgSend(v2, "performSelector:", AVRouteDetectorShouldAppBeConsideredForeground_applicationStateSelector) > 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 65) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 65))
  {
    if (dword_1E9356A70) {
      goto LABEL_12;
    }
  }
  else if (dword_1E9356A70)
  {
LABEL_12:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateRouteDetectionEnabled", v6, v7);
}

- (void)dealloc
{
  routeDetectorInternal = self->_routeDetectorInternal;
  if (routeDetectorInternal)
  {
    if (routeDetectorInternal->outputDevicesChangeNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->outputDevicesChangeNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }
    if (routeDetectorInternal->didEnterBackgroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->didEnterBackgroundNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }
    if (routeDetectorInternal->didEnterForegroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->didEnterForegroundNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }

    routeDetectorInternal = self->_routeDetectorInternal;
    ivarAccessQueue = routeDetectorInternal->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      routeDetectorInternal = self->_routeDetectorInternal;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRouteDetector;
  [(AVRouteDetector *)&v5 dealloc];
}

- (BOOL)isRouteDetectionEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVRouteDetector_isRouteDetectionEnabled__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVRouteDetector_isRouteDetectionEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 8);
  return result;
}

- (void)setRouteDetectionEnabled:(BOOL)routeDetectionEnabled
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v7 = routeDetectionEnabled;
  block[4] = self;
  block[5] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke_2;
    v5[3] = &unk_1E57B1E80;
    v5[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v5);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRouteDetectionEnabled];
  int v2 = *(void **)(a1 + 32);
  return [v2 _updateMultipleRoutesDetected];
}

- (BOOL)detectsCustomRoutes
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVRouteDetector_detectsCustomRoutes__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVRouteDetector_detectsCustomRoutes__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 10);
  return result;
}

- (void)setDetectsCustomRoutes:(BOOL)detectsCustomRoutes
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v7 = detectsCustomRoutes;
  block[4] = self;
  block[5] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke_2;
    v5[3] = &unk_1E57B1E80;
    v5[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v5);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 10) != v2)
  {
    *(unsigned char *)(v1 + 10) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRouteDetectionEnabled];
  int v2 = *(void **)(a1 + 32);
  return [v2 _updateMultipleRoutesDetected];
}

- (BOOL)multipleRoutesDetected
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVRouteDetector_multipleRoutesDetected__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVRouteDetector_multipleRoutesDetected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 9);
  return result;
}

- (void)_updateMultipleRoutesDetected
{
  BOOL v3 = [(AVRouteDetector *)self isRouteDetectionEnabled];
  if (v3)
  {
    BOOL v4 = [(AVRouteDetector *)self _isAirPlayDevicePresenceDetected];
    BOOL v5 = [(AVRouteDetector *)self detectsCustomRoutes];
    LOBYTE(v3) = v5 || v4;
    if (v5 && !v4) {
      LOBYTE(v3) = [(AVRouteDetector *)self _isCustomRoutePresenceDetected];
    }
  }
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVRouteDetector__updateMultipleRoutesDetected__block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v9 = v3;
  block[4] = self;
  block[5] = &v10;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v7 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVRouteDetectorMultipleRoutesDetectedDidChangeNotification" object:self userInfo:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v7);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __48__AVRouteDetector__updateMultipleRoutesDetected__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateRouteDetectionEnabled
{
  BOOL v3 = [(AVRouteDetector *)self isRouteDetectionEnabled];
  routeDetectorInternal = self->_routeDetectorInternal;
  if (!v3 || routeDetectorInternal->routeDetectionSuspended)
  {
    [(AVOutputDeviceDiscoverySession *)routeDetectorInternal->outputDeviceDiscoverySession setDiscoveryMode:0];
    customRouteDiscoverySession = self->_routeDetectorInternal->customRouteDiscoverySession;
LABEL_4:
    [(DADiscovery *)customRouteDiscoverySession invalidate];

    self->_routeDetectorInternal->customRouteDiscoverySession = 0;
    self->_routeDetectorInternal->customRoutesPresent = 0;
    return;
  }
  [(AVOutputDeviceDiscoverySession *)routeDetectorInternal->outputDeviceDiscoverySession setDiscoveryMode:1];
  BOOL v6 = [(AVRouteDetector *)self detectsCustomRoutes];
  customRouteDiscoverySession = self->_routeDetectorInternal->customRouteDiscoverySession;
  if (!v6) {
    goto LABEL_4;
  }
  if (!customRouteDiscoverySession)
  {
    id v8 = objc_alloc_init(getDADiscoveryConfigurationClass());
    objc_msgSend(v8, "setBundleID:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"));
    [v8 setBluetoothServices:0];
    [v8 setBluetoothCompanyIdentifiers:0];
    [v8 setBonjourServiceTypes:0];
    [v8 setPresenceOnly:1];
    self->_routeDetectorInternal->customRouteDiscoverySession = (DADiscovery *)[objc_alloc((Class)getDADiscoveryClass[0]()) initWithConfiguration:v8 error:0];
    if (self->_routeDetectorInternal->customRouteDiscoverySession)
    {
      objc_initWeak(&location, self);
      [(DADiscovery *)self->_routeDetectorInternal->customRouteDiscoverySession setDispatchQueue:MEMORY[0x1E4F14428]];
      uint64_t v7 = self->_routeDetectorInternal->customRouteDiscoverySession;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__AVRouteDetector__updateRouteDetectionEnabled__block_invoke;
      v9[3] = &unk_1E57B79D0;
      objc_copyWeak(&v10, &location);
      [(DADiscovery *)v7 setEventHandler:v9];
      [(DADiscovery *)self->_routeDetectorInternal->customRouteDiscoverySession activate];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
    }
  }
}

void *__47__AVRouteDetector__updateRouteDetectionEnabled__block_invoke(uint64_t a1, void *a2)
{
  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    BOOL v4 = result;
    result = (void *)[result detectsCustomRoutes];
    if (result)
    {
      result = (void *)[a2 eventType];
      if (result == (void *)50)
      {
        *(unsigned char *)(v4[1] + 64) = [a2 devicesPresent];
        return (void *)[v4 _updateMultipleRoutesDetected];
      }
    }
  }
  return result;
}

- (BOOL)_isAirPlayDevicePresenceDetected
{
  return [(AVOutputDeviceDiscoverySession *)self->_routeDetectorInternal->outputDeviceDiscoverySession devicePresenceDetected];
}

- (BOOL)_isCustomRoutePresenceDetected
{
  return self->_routeDetectorInternal->customRoutesPresent;
}

- (void)_didEnterBackground
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A70)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_routeDetectorInternal->routeDetectionSuspended = 1;
  [(AVRouteDetector *)self _updateRouteDetectionEnabled];
}

- (void)_didEnterForeground
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A70)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_routeDetectorInternal->routeDetectionSuspended = 0;
  [(AVRouteDetector *)self _updateRouteDetectionEnabled];
}

@end