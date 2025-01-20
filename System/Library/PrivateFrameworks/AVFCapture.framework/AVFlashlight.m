@interface AVFlashlight
+ (BOOL)hasFlashlight;
+ (void)initialize;
- (AVFlashlight)init;
- (BOOL)beamWidthControlSupported;
- (BOOL)isAvailable;
- (BOOL)isOverheated;
- (BOOL)setFlashlightLevel:(float)a3 withError:(id *)a4;
- (BOOL)turnPowerOnWithError:(id *)a3;
- (float)beamWidth;
- (float)flashlightLevel;
- (float)maxBeamWidth;
- (float)minBeamWidth;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_reconnectToServer;
- (void)_setupFlashlight;
- (void)_teardownFlashlight;
- (void)dealloc;
- (void)setBeamWidth:(float)a3;
- (void)turnPowerOff;
@end

@implementation AVFlashlight

- (BOOL)isOverheated
{
  v2 = self;
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = v2->_internal;
  LOBYTE(v2) = internal->overheated;
  MEMORY[0x1A6234340](internal->lock);
  return (char)v2;
}

- (BOOL)isAvailable
{
  v2 = self;
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = v2->_internal;
  LOBYTE(v2) = internal->available;
  MEMORY[0x1A6234340](internal->lock);
  return (char)v2;
}

- (void)turnPowerOff
{
  if (dword_1EB4C91A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  flashlight = self->_internal->flashlight;
  if (flashlight)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(void (**)(OpaqueFigFlashlight *))(v6 + 32);
    if (v7) {
      v7(flashlight);
    }
  }
  MEMORY[0x1A6234340](self->_internal->lock);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = self->_internal;
  int available = internal->available;
  int overheated = internal->overheated;
  float flashlightLevel = internal->flashlightLevel;
  float beamWidth = internal->beamWidth;
  if ([a3 isEqualToString:*MEMORY[0x1E4F52730]])
  {
    int v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52728]), "BOOLValue");
    int v13 = overheated != 0;
    if (v12) {
      float v14 = flashlightLevel;
    }
    else {
      float v14 = 0.0;
    }
    goto LABEL_12;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F52748]])
  {
    int v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52728]), "BOOLValue");
    int v12 = available != 0;
LABEL_11:
    float v14 = flashlightLevel;
    goto LABEL_12;
  }
  if (![a3 isEqualToString:*MEMORY[0x1E4F52740]])
  {
    int v16 = [a3 isEqualToString:*MEMORY[0x1E4F52738]];
    int v12 = available != 0;
    int v13 = overheated != 0;
    if (v16)
    {
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52728]), "floatValue");
      float v18 = self->_internal->minBeamWidth
          + (float)(v17 * (float)(self->_internal->maxBeamWidth - self->_internal->minBeamWidth));
      float v14 = flashlightLevel;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52728]), "floatValue");
  float v14 = v15;
  int v12 = available != 0;
  int v13 = overheated != 0;
LABEL_12:
  float v18 = beamWidth;
LABEL_13:
  MEMORY[0x1A6234340](self->_internal->lock);
  if (v14 != flashlightLevel) {
    [(AVFlashlight *)self willChangeValueForKey:@"flashlightLevel"];
  }
  if (v18 != beamWidth) {
    [(AVFlashlight *)self willChangeValueForKey:@"beamWidth"];
  }
  if (available != v12) {
    [(AVFlashlight *)self willChangeValueForKey:@"available"];
  }
  if (overheated != v13) {
    [(AVFlashlight *)self willChangeValueForKey:@"overheated"];
  }
  MEMORY[0x1A6234330](self->_internal->lock);
  self->_internal->float flashlightLevel = v14;
  self->_internal->float beamWidth = v18;
  self->_internal->int available = v12;
  self->_internal->int overheated = v13;
  MEMORY[0x1A6234340](self->_internal->lock);
  if (overheated != v13) {
    [(AVFlashlight *)self didChangeValueForKey:@"overheated"];
  }
  if (available != v12) {
    [(AVFlashlight *)self didChangeValueForKey:@"available"];
  }
  if (v14 != flashlightLevel) {
    [(AVFlashlight *)self didChangeValueForKey:@"flashlightLevel"];
  }
  if (v18 != beamWidth)
  {
    [(AVFlashlight *)self didChangeValueForKey:@"BeamWidth"];
  }
}

- (BOOL)setFlashlightLevel:(float)a3 withError:(id *)a4
{
  if (dword_1EB4C91A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3 != 3.4028e38 && (a3 < 0.0 || a3 > 1.0))
  {
    BOOL v9 = 0;
    if (a4) {
      *a4 = (id)AVLocalizedError();
    }
    return v9;
  }
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = self->_internal;
  float flashlightLevel = internal->flashlightLevel;
  BOOL v12 = flashlightLevel != 1.0 || a3 != 3.4028e38;
  BOOL v13 = flashlightLevel != a3 && v12;
  if (!v13)
  {
LABEL_29:
    BOOL v9 = !v13;
    MEMORY[0x1A6234340](self->_internal->lock);
    return v9;
  }
  flashlight = internal->flashlight;
  if (!flashlight
    || ((uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0 ? (v16 = 0) : (v16 = v15),
        (float v17 = *(unsigned int (**)(OpaqueFigFlashlight *, float))(v16 + 40)) == 0 || v17(flashlight, a3)))
  {
    if (a4) {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
    }
    goto LABEL_29;
  }
  if (a3 == 3.4028e38)
  {
    v19 = self->_internal->flashlight;
    if (v19 && (uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    v22 = *(float (**)(OpaqueFigFlashlight *))(v21 + 48);
    a3 = 0.0;
    if (v22) {
      a3 = v22(v19);
    }
  }
  MEMORY[0x1A6234340](self->_internal->lock);
  [(AVFlashlight *)self willChangeValueForKey:@"flashlightLevel"];
  MEMORY[0x1A6234330](self->_internal->lock);
  self->_internal->float flashlightLevel = a3;
  MEMORY[0x1A6234340](self->_internal->lock);
  [(AVFlashlight *)self didChangeValueForKey:@"flashlightLevel"];
  return 1;
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

+ (BOOL)hasFlashlight
{
  if (hasFlashlight_onceToken != -1) {
    dispatch_once(&hasFlashlight_onceToken, &__block_literal_global_1);
  }
  return hasFlashlight_hasFlashlight;
}

uint64_t __29__AVFlashlight_hasFlashlight__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasFlashlight_hasFlashlight = result;
  return result;
}

- (void)_setupFlashlight
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (AVCaptureIsRunningInMediaserverd())
  {
    if (FigFlashlightCreate())
    {
LABEL_8:
      FigDebugAssert3();
      return;
    }
  }
  else if (FigFlashlightRemoteCreate())
  {
    int v3 = 2;
    while (1)
    {
      usleep(0x3D090u);
      if (!FigFlashlightRemoteCreate()) {
        break;
      }
      if (!--v3) {
        goto LABEL_8;
      }
    }
  }
  v4 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v4 addListenerWithWeakReference:self->_internal->weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52730] object:self->_internal->flashlight flags:0];
  [v4 addListenerWithWeakReference:self->_internal->weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52748] object:self->_internal->flashlight flags:0];
  [v4 addListenerWithWeakReference:self->_internal->weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52740] object:self->_internal->flashlight flags:0];
  [v4 addListenerWithWeakReference:self->_internal->weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52738] object:self->_internal->flashlight flags:0];
  internal = self->_internal;
  uint64_t v6 = *MEMORY[0x1E4F52750];
  weakReference = internal->weakReference;
  flashlight = internal->flashlight;

  [v4 addListenerWithWeakReference:weakReference callback:avflashlightNotification name:v6 object:flashlight flags:0];
}

- (void)_teardownFlashlight
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (self->_internal->flashlight)
  {
    int v3 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    internal = self->_internal;
    weakReference = internal->weakReference;
    [v3 removeListenerWithWeakReference:weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52730] object:internal->flashlight];
    [v3 removeListenerWithWeakReference:weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52748] object:self->_internal->flashlight];
    [v3 removeListenerWithWeakReference:weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52740] object:self->_internal->flashlight];
    [v3 removeListenerWithWeakReference:weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52738] object:self->_internal->flashlight];
    [v3 removeListenerWithWeakReference:weakReference callback:avflashlightNotification name:*MEMORY[0x1E4F52750] object:self->_internal->flashlight];
    flashlight = self->_internal->flashlight;
    if (flashlight)
    {
      CFRelease(flashlight);
      self->_internal->flashlight = 0;
    }
  }
}

- (AVFlashlight)init
{
  if (!+[AVFlashlight hasFlashlight])
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AVFlashlight;
  int v3 = [(AVFlashlight *)&v15 init];
  if (v3)
  {
    v3->_internal = objc_alloc_init(AVFlashlightInternal);
    v3->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v3];
    v3->_internal->lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_internal->serverReconnectQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avflashlight-server-reconnect", v4);
    MEMORY[0x1A6234330](v3->_internal->lock);
    [(AVFlashlight *)v3 _setupFlashlight];
    *(_WORD *)&v3->_internal->int available = 1;
    flashlight = v3->_internal->flashlight;
    if (flashlight)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v7 = v6 ? v6 : 0;
      BOOL v9 = *(void (**)(OpaqueFigFlashlight *))(v7 + 72);
      if (v9) {
        v9(flashlight);
      }
    }
    v3->_internal->float flashlightLevel = 0.0;
    v3->_internal->minBeamWidth = AVGestaltGetFloatAnswer(@"AVGQTorchMinBeamWidth");
    float FloatAnswer = AVGestaltGetFloatAnswer(@"AVGQTorchMaxBeamWidth");
    BOOL v11 = 0;
    v3->_internal->maxBeamWidth = FloatAnswer;
    internal = v3->_internal;
    if (internal->minBeamWidth > 0.0) {
      BOOL v11 = internal->maxBeamWidth > 0.0;
    }
    internal->beamWidthControlSupported = v11;
    BOOL v13 = v3->_internal;
    if (v13->beamWidthControlSupported && v13->minBeamWidth > v13->maxBeamWidth)
    {
      v13->beamWidthControlSupported = 0;
      BOOL v13 = v3->_internal;
    }
    v13->float beamWidth = v13->minBeamWidth;
    MEMORY[0x1A6234340](v3->_internal->lock);
    if (!v3->_internal->flashlight)
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    MEMORY[0x1A6234330](internal->lock, a2);
    [(AVFlashlight *)self _teardownFlashlight];
    MEMORY[0x1A6234340](self->_internal->lock);
    FigSimpleMutexDestroy();
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFlashlight;
  [(AVFlashlight *)&v4 dealloc];
}

- (BOOL)turnPowerOnWithError:(id *)a3
{
  if (dword_1EB4C91A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  flashlight = self->_internal->flashlight;
  if (flashlight)
  {
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v10 = *(uint64_t (**)(OpaqueFigFlashlight *))(v8 + 24);
    if (v10) {
      int v9 = v10(flashlight);
    }
    else {
      int v9 = -12782;
    }
  }
  else
  {
    int v9 = -16450;
  }
  MEMORY[0x1A6234340](self->_internal->lock);
  if (a3 && v9) {
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
  }
  return v9 == 0;
}

- (float)flashlightLevel
{
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = self->_internal;
  float flashlightLevel = internal->flashlightLevel;
  MEMORY[0x1A6234340](internal->lock);
  return flashlightLevel;
}

- (BOOL)beamWidthControlSupported
{
  return self->_internal->beamWidthControlSupported;
}

- (float)minBeamWidth
{
  return self->_internal->minBeamWidth;
}

- (float)maxBeamWidth
{
  return self->_internal->maxBeamWidth;
}

- (void)setBeamWidth:(float)a3
{
  internal = self->_internal;
  if (internal->beamWidthControlSupported)
  {
    if (internal->minBeamWidth <= a3 && internal->maxBeamWidth >= a3)
    {
      if (dword_1EB4C91A0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        internal = self->_internal;
      }
      MEMORY[0x1A6234330](internal->lock, a2);
      BOOL v11 = self->_internal;
      if (v11->beamWidth != a3)
      {
        flashlight = v11->flashlight;
        if (flashlight)
        {
          float minBeamWidth = v11->minBeamWidth;
          float maxBeamWidth = v11->maxBeamWidth;
          uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v15) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = 0;
          }
          float v17 = *(uint64_t (**)(OpaqueFigFlashlight *, float))(v16 + 56);
          if (v17)
          {
            int v18 = v17(flashlight, (float)(a3 - minBeamWidth) / (float)(maxBeamWidth - minBeamWidth));
            MEMORY[0x1A6234340](self->_internal->lock);
            if (!v18)
            {
              [(AVFlashlight *)self willChangeValueForKey:@"beamWidth"];
              MEMORY[0x1A6234330](self->_internal->lock);
              self->_internal->float beamWidth = a3;
              MEMORY[0x1A6234340](self->_internal->lock);
              [(AVFlashlight *)self didChangeValueForKey:@"beamWidth"];
            }
            return;
          }
          BOOL v11 = self->_internal;
        }
      }
      MEMORY[0x1A6234340](v11->lock);
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
  }
  int v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v9);
  }
  NSLog(&cfstr_SuppressingExc.isa, v9);
}

- (float)beamWidth
{
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = self->_internal;
  float beamWidth = internal->beamWidth;
  MEMORY[0x1A6234340](internal->lock);
  return beamWidth;
}

- (void)_reconnectToServer
{
  MEMORY[0x1A6234330](self->_internal->lock, a2);
  internal = self->_internal;
  float flashlightLevel = internal->flashlightLevel;
  MEMORY[0x1A6234340](internal->lock);
  uint64_t v5 = block;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVFlashlight__reconnectToServer__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  if (flashlightLevel <= 0.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    uint64_t v6 = v5;
  }
  dispatch_async((dispatch_queue_t)self->_internal->serverReconnectQueue, v5);
}

void __34__AVFlashlight__reconnectToServer__block_invoke(uint64_t a1)
{
  MEMORY[0x1A6234330](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
  [*(id *)(a1 + 32) _teardownFlashlight];
  [*(id *)(a1 + 32) _setupFlashlight];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    float v4 = *(float *)(v2 + 44);
    if (v4 > 0.0)
    {
      float v5 = *(float *)(v2 + 36);
      float v6 = *(float *)(v2 + 40);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v8 = v7 ? v7 : 0;
      int v9 = *(void (**)(uint64_t, float))(v8 + 56);
      if (v9) {
        v9(v3, (float)(v4 - v5) / (float)(v6 - v5));
      }
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    float v11 = *(float *)(v10 + 28);
    if (v11 > 0.0)
    {
      uint64_t v12 = *(void *)(v10 + 16);
      if (v12 && (uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      uint64_t v15 = *(void (**)(uint64_t, float))(v14 + 40);
      if (v15) {
        v15(v12, v11);
      }
    }
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
    if (v16 && (uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    v19 = *(void (**)(uint64_t))(v18 + 72);
    if (v19) {
      v19(v16);
    }
  }

  JUMPOUT(0x1A6234340);
}

@end