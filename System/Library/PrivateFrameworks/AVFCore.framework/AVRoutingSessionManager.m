@interface AVRoutingSessionManager
+ (BOOL)longFormVideoManagerCanHaveCurrentSessionWithDestinationOfType:(int64_t)a3 subType:(int64_t)a4;
+ (id)longFormVideoRoutingSessionManager;
+ (void)initialize;
- (AVRoutingSession)currentRoutingSession;
- (AVRoutingSessionManager)init;
- (AVRoutingSessionManager)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3;
- (BOOL)prefersLikelyDestinationsOverCurrentRoutingSession;
- (BOOL)startRoutingSessionWithOutputDeviceDescriptions:(id)a3 error:(id *)a4;
- (BOOL)startSuppressingLikelyDestinationsUntilNextPlayEventAndReturnError:(id *)a3;
- (BOOL)stopSuppressingLikelyDestinationsAndReturnError:(id *)a3;
- (NSArray)allLikelyDestinations;
- (NSArray)likelyExternalDestinations;
- (id)description;
- (void)dealloc;
- (void)startRoutingSessionForHighConfidenceExternalDestinationIfPresentWithCompletionHandler:(id)a3;
- (void)updateCurrentRoutingSessionFromLikelyDestinationsWithCompletionHandler:(id)a3;
@end

@implementation AVRoutingSessionManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)longFormVideoRoutingSessionManager
{
  if (FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager()) {
    v3 = 0;
  }
  else {
    v3 = (void *)[objc_alloc((Class)a1) initWithFigRoutingSessionManager:0];
  }
  return v3;
}

+ (BOOL)longFormVideoManagerCanHaveCurrentSessionWithDestinationOfType:(int64_t)a3 subType:(int64_t)a4
{
  unsigned int v4 = (0x32800u >> a4) & 1;
  if ((unint64_t)a4 > 0x11) {
    LOBYTE(v4) = 0;
  }
  if (a3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (AVRoutingSessionManager)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  v10.receiver = self;
  v10.super_class = (Class)AVRoutingSessionManager;
  v5 = [(AVRoutingSessionManager *)&v10 init];
  if (v5
    && (ivars = objc_alloc_init(AVRoutingSessionManagerInternal), (v5->_ivars = ivars) != 0)
    && (!a3
      ? (v7 = 0)
      : (OpaqueFigRoutingSessionManager *)(v7 = (OpaqueFigRoutingSessionManager *)CFRetain(a3), ivars = v5->_ivars),
        (ivars->figRoutingSessionManager = v7, v5->_ivars->figRoutingSessionManager)
     && !FigNotificationCenterAddWeakListener()
     && !FigNotificationCenterAddWeakListener()))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVRoutingSessionManager)init
{
  return [(AVRoutingSessionManager *)self initWithFigRoutingSessionManager:0];
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {
    if (ivars->figRoutingSessionManager)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
      ivars = self->_ivars;
      figRoutingSessionManager = ivars->figRoutingSessionManager;
      if (figRoutingSessionManager)
      {
        CFRelease(figRoutingSessionManager);
        ivars = self->_ivars;
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSessionManager;
  [(AVRoutingSessionManager *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  unsigned int v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, currentRoutingSession=%@, likelyExternalDestinations=%@, allLikelyDestinations=%@, prefersLikelyDestinationsOverCurrentRoutingSession=%d>", NSStringFromClass(v4), self, -[AVRoutingSessionManager currentRoutingSession](self, "currentRoutingSession"), -[AVRoutingSessionManager likelyExternalDestinations](self, "likelyExternalDestinations"), -[AVRoutingSessionManager allLikelyDestinations](self, "allLikelyDestinations"), -[AVRoutingSessionManager prefersLikelyDestinationsOverCurrentRoutingSession](self, "prefersLikelyDestinationsOverCurrentRoutingSession")];
}

- (AVRoutingSession)currentRoutingSession
{
  CFTypeRef cf = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, CFTypeRef *))(v4 + 8);
  if (!v5)
  {
    objc_super v10 = 0;
    return v10;
  }
  int v6 = v5(figRoutingSessionManager, &cf);
  CFTypeRef v7 = cf;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = cf == 0;
  }
  if (v8)
  {
    objc_super v10 = 0;
    if (!cf) {
      return v10;
    }
    goto LABEL_10;
  }
  v9 = [AVRoutingSession alloc];
  objc_super v10 = [(AVRoutingSession *)v9 initWithFigRoutingSession:cf];
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_10:
  }
    CFRelease(v7);
  return v10;
}

- (NSArray)likelyExternalDestinations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v15 = 0.0;
  FigRoutingSessionManagerGetConfidenceThresholds();
  LikelyDestinationsFromFig = (NSArray *)AVRoutingSessionManagerGetLikelyDestinationsFromFig((uint64_t)self->_ivars->figRoutingSessionManager, (uint64_t)&__block_literal_global_11);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSArray *)LikelyDestinationsFromFig countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(LikelyDestinationsFromFig);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) probability];
        float v7 = v7 + v9;
      }
      uint64_t v5 = [(NSArray *)LikelyDestinationsFromFig countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }
  if (v7 >= v15) {
    return LikelyDestinationsFromFig;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __53__AVRoutingSessionManager_likelyExternalDestinations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 providesExternalVideoPlayback];
}

- (NSArray)allLikelyDestinations
{
  return (NSArray *)AVRoutingSessionManagerGetLikelyDestinationsFromFig((uint64_t)self->_ivars->figRoutingSessionManager, (uint64_t)&__block_literal_global_23);
}

uint64_t __48__AVRoutingSessionManager_allLikelyDestinations__block_invoke()
{
  return 1;
}

- (BOOL)prefersLikelyDestinationsOverCurrentRoutingSession
{
  char v8 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(OpaqueFigRoutingSessionManager *, char *))(v4 + 64);
  if (!v5) {
    return 0;
  }
  if (v5(figRoutingSessionManager, &v8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v8 == 0;
  }
  return !v6;
}

- (void)updateCurrentRoutingSessionFromLikelyDestinationsWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 copy];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  objc_super v10 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *))(v9 + 56);
  if (v10)
  {
    signed int v11 = v10(figRoutingSessionManager, AVRoutingSessionManagerStartHighConfidenceDestinationComplete, v5);
    if (!v11) {
      return;
    }
    signed int v12 = v11;
    if (v11 == -15395)
    {

      v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allows-set-output-device", v13, v14, v15, v16, v17, v19), 0 reason userInfo];
      objc_exception_throw(v18);
    }
  }
  else
  {
    signed int v12 = -12782;
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)v5, v12);
}

- (void)startRoutingSessionForHighConfidenceExternalDestinationIfPresentWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 copy];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  objc_super v10 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, void (*)(void *, signed int), void *))(v9 + 16);
  if (v10)
  {
    signed int v11 = v10(figRoutingSessionManager, AVRoutingSessionManagerStartHighConfidenceDestinationComplete, v5);
    if (!v11) {
      return;
    }
    signed int v12 = v11;
    if (v11 == -15395)
    {

      v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allows-set-output-device", v13, v14, v15, v16, v17, v19), 0 reason userInfo];
      objc_exception_throw(v18);
    }
  }
  else
  {
    signed int v12 = -12782;
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)v5, v12);
}

- (BOOL)startRoutingSessionWithOutputDeviceDescriptions:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (dword_1E9356A50)
  {
    unsigned int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16, v30, v32);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = AVCreateFigRouteDescriptorFromOutputDeviceDescription(*(void **)(*((void *)&v34 + 1) + 8 * i));
        CFArrayAppendValue(Mutable, v13);
        if (v13) {
          CFRelease(v13);
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }
  if (dword_1E9356A50)
  {
    unsigned int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v15 = v39;
    if (os_log_type_enabled(v14, type)) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = v15 & 0xFFFFFFFE;
    }
    if (v16)
    {
      uint64_t v17 = AVSuccinctRouteDescriptorsDescription(Mutable);
      int v41 = 136315395;
      v42 = "-[AVRoutingSessionManager startRoutingSessionWithOutputDeviceDescriptions:error:]";
      __int16 v43 = 2113;
      uint64_t v44 = v17;
      v31 = &v41;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *, __CFArray *))(v25 + 72);
  if (v26)
  {
    signed int v27 = v26(figRoutingSessionManager, Mutable);
    if (!v27)
    {
      if (Mutable) {
        CFRelease(Mutable);
      }
      return 1;
    }
  }
  else
  {
    signed int v27 = -12782;
  }
  if (a4 && v27 != -15395) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v27, 0);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v27 == -15395)
  {
    v29 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allows-set-output-device", v19, v20, v21, v22, v23, (uint64_t)v31), 0 reason userInfo];
    objc_exception_throw(v29);
  }
  return 0;
}

- (BOOL)startSuppressingLikelyDestinationsUntilNextPlayEventAndReturnError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  unsigned int v15 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *))(v14 + 80);
  if (v15)
  {
    signed int v16 = v15(figRoutingSessionManager);
    if (!v16) {
      return 1;
    }
  }
  else
  {
    signed int v16 = -12782;
  }
  if (a3 && v16 != -15395) {
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v16, 0);
  }
  if (v16 == -15395)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allows-set-output-device", v8, v9, v10, v11, v12, v19), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  return 0;
}

- (BOOL)stopSuppressingLikelyDestinationsAndReturnError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  unsigned int v15 = *(uint64_t (**)(OpaqueFigRoutingSessionManager *))(v14 + 88);
  if (v15)
  {
    signed int v16 = v15(figRoutingSessionManager);
    if (!v16) {
      return 1;
    }
  }
  else
  {
    signed int v16 = -12782;
  }
  if (a3 && v16 != -15395) {
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v16, 0);
  }
  if (v16 == -15395)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Missing required entitlement com.apple.avfoundation.allows-set-output-device", v8, v9, v10, v11, v12, v19), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  return 0;
}

@end