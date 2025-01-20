@interface FigScreenCaptureController
+ (id)screenCaptureControllerWithCaptureConfiguration:(id)a3;
+ (id)screenCaptureControllerWithDisplayConfiguration:(id)a3;
+ (id)screenCaptureControllerWithFigVirtualDisplayOptions:(id)a3;
+ (id)screenCaptureControllerWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minIntervalBetweenFrames;
- (CGSize)size;
- (FigDisplayConfiguration)displayConfiguration;
- (FigScreenCaptureConfiguration)screenCaptureConfiguration;
- (FigScreenCaptureController)initWithDisplayConfiguration:(id)a3;
- (FigScreenCaptureController)initWithFigVirtualDisplayOptions:(id)a3;
- (FigScreenCaptureController)initWithScreenCaptureConfiguration:(id)a3;
- (FigScreenCaptureController)initWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4;
- (FigScreenCaptureFrameHandlerDelegate)delegate;
- (OpaqueFigSimpleMutex)lock;
- (OpaqueFigVirtualDisplaySession)session;
- (__CFDictionary)getFVDOptions;
- (__CFDictionary)options;
- (id)description;
- (void)dealloc;
- (void)resumeCapture;
- (void)setDelegate:(id)a3;
- (void)setFigVirtualDisplayOption:(id)a3 forKey:(id)a4;
- (void)setLock:(OpaqueFigSimpleMutex *)a3;
- (void)setOptions:(__CFDictionary *)a3;
- (void)setSession:(OpaqueFigVirtualDisplaySession *)a3;
- (void)startCapture;
- (void)stopCapture;
- (void)suspendCapture;
@end

@implementation FigScreenCaptureController

+ (id)screenCaptureControllerWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [FigScreenCaptureController alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  return -[FigScreenCaptureController initWithSize:minIntervalBetweenFrames:](v7, "initWithSize:minIntervalBetweenFrames:", &v9, width, height);
}

+ (id)screenCaptureControllerWithFigVirtualDisplayOptions:(id)a3
{
  v3 = [[FigScreenCaptureController alloc] initWithFigVirtualDisplayOptions:a3];

  return v3;
}

+ (id)screenCaptureControllerWithCaptureConfiguration:(id)a3
{
  v3 = [[FigScreenCaptureController alloc] initWithScreenCaptureConfiguration:a3];

  return v3;
}

+ (id)screenCaptureControllerWithDisplayConfiguration:(id)a3
{
  v3 = [[FigScreenCaptureController alloc] initWithDisplayConfiguration:a3];

  return v3;
}

- (FigScreenCaptureController)initWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)FigScreenCaptureController;
  v7 = [(FigScreenCaptureController *)&v11 init];
  if (v7)
  {
    v7->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v7->_options = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
    v12 = @"displaySizeInPixels";
    v13[0] = DictionaryRepresentation;
    CFDictionarySetValue(v7->_options, @"deviceInfo", (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1]);
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
    CMTimeGetSeconds((CMTime *)&v10);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v7->_options, @"usage", @"Uncompressed");
    CFDictionarySetValue(v7->_options, @"ScreenRecording", (const void *)*MEMORY[0x1E4F1CFD0]);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v7->_options, @"DisplayLabel", @"ScreenCapture");
    v7->_mode = 0;
  }
  return v7;
}

- (FigScreenCaptureController)initWithFigVirtualDisplayOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigScreenCaptureController;
  v4 = [(FigScreenCaptureController *)&v8 init];
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (a3) {
      MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, (CFDictionaryRef)a3);
    }
    else {
      MutableCopy = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    v4->_options = MutableCopy;
    CFDictionaryAddValue(MutableCopy, @"DisplayLabel", @"AirPlay");
    v4->_mode = 0;
  }
  return v4;
}

- (FigScreenCaptureController)initWithScreenCaptureConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  v4 = [(FigScreenCaptureController *)&v6 init];
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)[a3 getLock];
    v4->_screenCaptureConfiguration = (FigScreenCaptureConfiguration *)a3;
    v4->_mode = 1;
  }
  return v4;
}

- (FigScreenCaptureController)initWithDisplayConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  v4 = [(FigScreenCaptureController *)&v6 init];
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)[a3 getLock];
    v4->_displayConfiguration = (FigDisplayConfiguration *)a3;
    v4->_mode = 2;
  }
  return v4;
}

- (__CFDictionary)getFVDOptions
{
  int mode = self->_mode;
  if (mode == 2)
  {
    displayConfiguration = self->_displayConfiguration;
    return (__CFDictionary *)[displayConfiguration getFVDOptions];
  }
  if (mode == 1)
  {
    displayConfiguration = self->_screenCaptureConfiguration;
    return (__CFDictionary *)[displayConfiguration getFVDOptions];
  }
  return self->_options;
}

- (void)setFigVirtualDisplayOption:(id)a3 forKey:(id)a4
{
  v7 = [(FigScreenCaptureController *)self getFVDOptions];
  MEMORY[0x19970E910](self->_lock);
  CFDictionarySetValue(v7, a4, a3);

  JUMPOUT(0x19970E930);
}

- (CGSize)size
{
  int mode = self->_mode;
  if (mode == 2)
  {
    [(FigDisplayConfiguration *)self->_displayConfiguration maxDisplaySize];
  }
  else if (mode == 1)
  {
    [(FigScreenCaptureConfiguration *)self->_screenCaptureConfiguration size];
  }
  else if (mode)
  {
    double v4 = 1920.0;
    double v5 = 1080.0;
  }
  else
  {
    MEMORY[0x19970E910](self->_lock, a2);
    if (CFDictionaryGetValue(self->_options, @"deviceInfo")) {
      FigCFDictionaryGetCGSizeIfPresent();
    }
    MEMORY[0x19970E930](self->_lock);
    double v5 = 1080.0;
    double v4 = 1920.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minIntervalBetweenFrames
{
  int v9 = 60;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 60);
  int mode = self->_mode;
  if (mode == 2)
  {
    int32_t v7 = [(FigDisplayConfiguration *)self->_displayConfiguration refreshRate];
  }
  else
  {
    if (mode == 1)
    {
      CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_screenCaptureConfiguration;
      if (result) {
        CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result minFrameInterval];
      }
      else {
        memset(&v8, 0, sizeof(v8));
      }
      goto LABEL_10;
    }
    if (mode) {
      return result;
    }
    MEMORY[0x19970E910](self->_lock);
    FigCFDictionaryGetInt32IfPresent();
    MEMORY[0x19970E930](self->_lock);
    int32_t v7 = v9;
  }
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v8, 1, v7);
LABEL_10:
  *(CMTime *)retstr = v8;
  return result;
}

- (void)dealloc
{
  [(FigScreenCaptureController *)self stopCapture];
  if (!self->_mode)
  {
    options = self->_options;
    if (options)
    {
      CFRelease(options);
      self->_options = 0;
    }
    FigSimpleMutexDestroy();
    self->_lock = 0;
  }
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration) {

  }
  screenCaptureConfiguration = self->_screenCaptureConfiguration;
  if (screenCaptureConfiguration) {

  }
  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  [(FigScreenCaptureController *)&v6 dealloc];
}

- (id)description
{
  uint64_t mode = self->_mode;
  if (mode > 2) {
    double v4 = @"Invalid";
  }
  else {
    double v4 = off_1E578C760[mode];
  }
  double v5 = NSString;
  objc_super v6 = (objc_class *)objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@: %p, uint64_t mode = %@, options = %p>", NSStringFromClass(v6), self, v4, -[FigScreenCaptureController getFVDOptions](self, "getFVDOptions")];
}

- (void)startCapture
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFTypeRef v25 = 0;
  CFTypeRef cf = 0;
  v3 = [(FigScreenCaptureController *)self getFVDOptions];
  MEMORY[0x19970E910](self->_lock);
  double v4 = (const void *)objc_msgSend(NSString, "stringWithFormat:", @"[PID%d]", getpid());
  CFDictionarySetValue(v3, @"logPrefix", v4);
  if (self->_session)
  {
    unsigned int v31 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_24;
  }
  unsigned int v31 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  double v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (FVDUtilsSessionServerEnabled())
  {
    *(void *)v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x3052000000;
    *(void *)&long long v28 = __Block_byref_object_copy_;
    *((void *)&v28 + 1) = __Block_byref_object_dispose_;
    v29 = self;
    uint64_t v6 = *MEMORY[0x1E4F1CF80];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__FigScreenCaptureController_startCapture__block_invoke;
    v24[3] = &unk_1E578C718;
    v24[4] = v27;
    if (FigVirtualDisplaySessionRemoteFrameReceiverCreate(v6, (uint64_t)v3, v24, &self->_session))
    {
      *(_DWORD *)type = 0;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      _Block_object_dispose(v27, 8);
      goto LABEL_24;
    }
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    _Block_object_dispose(v27, 8);
  }
  else
  {
    v29 = 0;
    long long v28 = 0u;
    *(_OWORD *)&v27[8] = 0u;
    if (!CFDictionaryContainsKey(v3, @"clientName"))
    {
      int32_t v7 = getprogname();
      if (v7) {
        CFDictionarySetValue(v3, @"clientName", (const void *)[NSString stringWithUTF8String:v7]);
      }
    }
    uint64_t v8 = *MEMORY[0x1E4F1CF80];
    if (FigVirtualDisplayProcessorCreate(*MEMORY[0x1E4F1CF80], (uint64_t)v3, &cf))
    {
      *(_DWORD *)type = 0;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_24;
    }
    *(void *)v27 = self;
    *(void *)&long long v28 = conduitFinalizeCallback;
    *((void *)&v28 + 1) = conduitPushFrameCallback;
    v30 = conduitClearScreenCallback;
    if (FigVirtualDisplaySinkConduitCreate(v8, (long long *)v27, v3, &v25)
      || FigVirtualDisplaySessionCreateWithComponents(v8, 0, cf, v25, v3, (CFTypeRef *)&self->_session))
    {
      *(_DWORD *)type = 0;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_24;
    }
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  session = self->_session;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__FigScreenCaptureController_startCapture__block_invoke_124;
  v21[3] = &unk_1E578C740;
  v21[4] = self;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *, __CFDictionary *, void *))(v11 + 8);
  if (v12)
  {
    int v13 = v12(session, v3, v21);
    if (!v13) {
      goto LABEL_24;
    }
  }
  else
  {
    int v13 = -12782;
  }
  unsigned int v31 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  CGSize v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v15 = v31;
  if (os_log_type_enabled(v14, type[0])) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = v15 & 0xFFFFFFFE;
  }
  if (v16)
  {
    *(_DWORD *)v27 = 136315650;
    *(void *)&v27[4] = "-[FigScreenCaptureController startCapture]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 1224;
    *(_WORD *)&v27[18] = 1024;
    *(_DWORD *)&v27[20] = v13;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_24:
  MEMORY[0x19970E930](self->_lock);
  if (cf) {
    CFRelease(cf);
  }
  if (v25) {
    CFRelease(v25);
  }
}

uint64_t __42__FigScreenCaptureController_startCapture__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) delegate];
  if (a2)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v6 screenCaptureController:v7 didReceiveSampleBuffer:a2 transformFlags:a3];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      int v9 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) delegate];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return [v9 screenCaptureControllerDidReceiveClearScreen:v10];
    }
  }
  return result;
}

uint64_t __42__FigScreenCaptureController_startCapture__block_invoke_124(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) delegate];
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      double v4 = (void *)[*(id *)(v3 + 32) delegate];
      uint64_t v5 = *(void *)(v3 + 32);
      return [v4 screenCaptureController:v5 didFailWithStatus:a2];
    }
  }
  return result;
}

- (void)stopCapture
{
  MEMORY[0x19970E910](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    session = self->_session;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v6 + 16);
    if (v7) {
      v7(session);
    }
    uint64_t v8 = self->_session;
    if (v8)
    {
      CFRelease(v8);
      self->_session = 0;
    }
  }
  MEMORY[0x19970E930](self->_lock);
}

- (void)suspendCapture
{
  MEMORY[0x19970E910](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    session = self->_session;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v6 + 24);
    if (v7) {
      v7(session);
    }
  }
  else
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x19970E930](self->_lock);
}

- (void)resumeCapture
{
  MEMORY[0x19970E910](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    session = self->_session;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v6 + 32);
    if (v7) {
      v7(session);
    }
  }
  else
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x19970E930](self->_lock);
}

- (FigScreenCaptureFrameHandlerDelegate)delegate
{
  return (FigScreenCaptureFrameHandlerDelegate *)objc_loadWeak((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
}

- (FigScreenCaptureConfiguration)screenCaptureConfiguration
{
  return self->_screenCaptureConfiguration;
}

- (FigDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (OpaqueFigVirtualDisplaySession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueFigVirtualDisplaySession *)a3
{
  self->_session = a3;
}

- (OpaqueFigSimpleMutex)lock
{
  return self->_lock;
}

- (void)setLock:(OpaqueFigSimpleMutex *)a3
{
  self->_lock = a3;
}

- (__CFDictionary)options
{
  return self->_options;
}

- (void)setOptions:(__CFDictionary *)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end