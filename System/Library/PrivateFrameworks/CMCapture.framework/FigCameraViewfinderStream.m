@interface FigCameraViewfinderStream
+ (void)initialize;
- (FigCameraViewfinderStream)init;
- (int)enqueueVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (uint64_t)_setupStateMachine;
- (void)_handleEndpointsChanged:(uint64_t)a1;
- (void)_handleStreamsChanged:(uint64_t)a1;
- (void)_setEndpoint:(uint64_t)a1;
- (void)close;
- (void)dealloc;
- (void)openWithDestination:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation FigCameraViewfinderStream

- (void)setDelegate:(id)a3 queue:(id)a4
{
}

- (FigCameraViewfinderStream)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigCameraViewfinderStream;
  v2 = [(FigCameraViewfinderStream *)&v4 init];
  if (v2)
  {
    v2->_delegateStorage = objc_alloc_init(FigDelegateStorage);
    -[FigCameraViewfinderStream _setupStateMachine]((uint64_t)v2);
    if (init_sEndpointManagerOnceToken != -1) {
      dispatch_once(&init_sEndpointManagerOnceToken, &__block_literal_global_19);
    }
  }
  return v2;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"FigCameraViewfinderStreamStateMachine" stateCount:4 initialState:1 owner:result];
    *(void *)(v1 + 16) = v2;
    [(FigStateMachine *)v2 setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 16) setLabel:@"Activating" forState:2];
    [*(id *)(v1 + 16) setLabel:@"Active" forState:4];
    [*(id *)(v1 + 16) setLabel:@"Deactivating" forState:8];
    [*(id *)(v1 + 16) whenTransitioningToState:4 callHandler:&__block_literal_global_44];
    v3 = *(void **)(v1 + 16);
    return [v3 whenTransitioningToState:1 callHandler:&__block_literal_global_49];
  }
  return result;
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

const void *__33__FigCameraViewfinderStream_init__block_invoke()
{
  result = (const void *)FigEndpointManagerForCameraPreviewGetShared();
  if (result) {
    result = CFRetain(result);
  }
  gEndpointManager = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  unsigned int v4 = [(FigStateMachine *)self->_stateMachine currentState];

  self->_delegateStorage = 0;
  if (v4 >= 2)
  {
    if (v4 != 8) {
      [(FigCameraViewfinderStream *)self close];
    }
    [(FigStateMachine *)self->_stateMachine transitionToState:1];
  }

  if (self->_displaySource)
  {
    uint64_t v6 = v2;
    int v5 = 0;
    FigDebugAssert3();
  }
  if (self->_endpoint)
  {
    uint64_t v6 = v2;
    int v5 = 0;
    FigDebugAssert3();
  }
  if (self->_stream)
  {
    uint64_t v6 = v2;
    int v5 = 0;
    FigDebugAssert3();
  }
  v7.receiver = self;
  v7.super_class = (Class)FigCameraViewfinderStream;
  [(FigCameraViewfinderStream *)&v7 dealloc];
}

- (void)openWithDestination:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5130)
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1, v21, v23))
  {
    if (!gEndpointManager)
    {
      uint64_t v24 = v3;
      LODWORD(v22) = 0;
      FigDebugAssert3();
      uint64_t v11 = FigSignalErrorAt();
      if (!v11) {
        return;
      }
      goto LABEL_6;
    }
    id v7 = +[FigWeakReference weakReferenceToObject:self];
    v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F205F0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__FigCameraViewfinderStream_openWithDestination___block_invoke;
    v25[3] = &unk_1E5C247D8;
    v25[4] = v7;
    self->_endpointsChangedNotificationToken = (id)[v8 addObserverForName:v9 object:gEndpointManager queue:0 usingBlock:v25];
    p_displaySource = &self->_displaySource;
    uint64_t v11 = FigVirtualDisplaySourceCameraViewfinderStreamCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], &self->_displaySource);
    if (v11)
    {
LABEL_6:
      -[FigStateMachine transitionToState:errorStatus:](self->_stateMachine, "transitionToState:errorStatus:", 1, v11, v22, v24);
      return;
    }
    uint64_t CMBaseObject = FigVirtualDisplaySourceGetCMBaseObject();
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = *(void (**)(uint64_t, uint64_t, id))(v14 + 56);
    if (v15) {
      v15(CMBaseObject, 0x1EFA66520, a3);
    }
    v16 = *p_displaySource;
    uint64_t v17 = FigEndpointManagerGetCMBaseObject();
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = *(void (**)(uint64_t, __CFString *, OpaqueFigVirtualDisplaySource *))(v19 + 56);
    if (v20) {
      v20(v17, @"CustomEndpoint", v16);
    }
  }
}

void __49__FigCameraViewfinderStream_openWithDestination___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  -[FigCameraViewfinderStream _handleEndpointsChanged:]([*(id *)(a1 + 32) referencedObject]);
}

- (void)_handleEndpointsChanged:(uint64_t)a1
{
  theArray[22] = *(CFArrayRef *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    theArray[0] = 0;
    if (dword_1EB4C5130)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v5 + 48);
    if (!v6 || v6(CMBaseObject, *MEMORY[0x1E4F20600], *MEMORY[0x1E4F1CF80], theArray))
    {
      FigDebugAssert3();
    }
    else
    {
      if (dword_1EB4C5130)
      {
        id v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (theArray[0] && CFArrayGetCount(theArray[0]) >= 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray[0], 0);
        -[FigCameraViewfinderStream _setEndpoint:](a1, ValueAtIndex);
      }
      else
      {
        -[FigCameraViewfinderStream _setEndpoint:](a1, 0);
        [*(id *)(a1 + 16) transitionToState:1 fromStates:14];
      }
    }
    if (theArray[0]) {
      CFRelease(theArray[0]);
    }
  }
}

- (void)close
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5130)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[FigStateMachine transitionToState:fromStates:](self->_stateMachine, "transitionToState:fromStates:", 8, 6, v10, v11)&& self->_endpoint)
  {
    displaySource = self->_displaySource;
    if (displaySource)
    {
      CFRelease(displaySource);
      self->_displaySource = 0;
    }
    uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t, __CFString *, void))(v7 + 56);
    if (v8) {
      v8(CMBaseObject, @"CustomEndpoint", 0);
    }
    -[FigCameraViewfinderStream _setEndpoint:]((uint64_t)self, 0);
    stream = self->_stream;
    if (stream)
    {
      CFRelease(stream);
      self->_stream = 0;
    }
  }
}

- (void)_setEndpoint:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(const void **)(a1 + 24);
    if (v4 != a2)
    {
      if (v4)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(a1 + 56));
        *(void *)(a1 + 56) = 0;
        uint64_t v5 = *(const void **)(a1 + 24);
      }
      else
      {
        uint64_t v5 = 0;
      }
      *(void *)(a1 + 24) = a2;
      if (a2) {
        CFRetain(a2);
      }
      if (v5) {
        CFRelease(v5);
      }
      if (a2)
      {
        id v6 = +[FigWeakReference weakReferenceToObject:a1];
        uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v8 = *MEMORY[0x1E4F206F0];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __42__FigCameraViewfinderStream__setEndpoint___block_invoke;
        v9[3] = &unk_1E5C247D8;
        v9[4] = v6;
        *(void *)(a1 + 56) = [v7 addObserverForName:v8 object:a2 queue:0 usingBlock:v9];
        -[FigCameraViewfinderStream _handleStreamsChanged:](a1);
      }
    }
  }
}

- (int)enqueueVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3 && [(FigStateMachine *)self->_stateMachine currentState] == 4)
  {
    if (self->_displaySource)
    {
      CFDictionaryRef v5 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
      memset(&rect, 0, sizeof(rect));
      if (v5)
      {
        CGRectMakeWithDictionaryRepresentation(v5, &rect);
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        CVPixelBufferGetWidth(ImageBuffer);
        CVPixelBufferGetHeight(ImageBuffer);
        FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        double Width = v10;
      }
      else
      {
        uint64_t v12 = CMSampleBufferGetImageBuffer(a3);
        double Width = (double)CVPixelBufferGetWidth(v12);
        double Height = (double)CVPixelBufferGetHeight(v12);
        double v7 = 0.0;
        double v8 = 0.0;
      }
      rect.origin.x = v7;
      rect.origin.y = v8;
      rect.size.width = Width;
      rect.size.height = Height;
      FigVirtualDisplaySourceCameraViewfinderStreamEnqueueFrame(v7, v8, Width, Height, (uint64_t)self->_displaySource, a3);
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_2;
  v4[3] = &unk_1E5C250B0;
  v4[4] = a2;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 cameraViewfinderStreamDidOpen:v5];
  }
  return result;
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(a2 + 48));
  *(void *)(a2 + 48) = 0;
  double v7 = *(void **)(a2 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_4;
  v9[3] = &unk_1E5C250D8;
  v9[4] = a2;
  int v10 = a5;
  return [v7 invokeDelegateCallbackWithBlock:v9];
}

uint64_t __47__FigCameraViewfinderStream__setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    return [a2 cameraViewfinderStream:v5 didCloseWithStatus:v6];
  }
  return result;
}

void __42__FigCameraViewfinderStream__setEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  -[FigCameraViewfinderStream _handleStreamsChanged:]([*(id *)(a1 + 32) referencedObject]);
}

- (void)_handleStreamsChanged:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFTypeRef cf = 0;
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
    if (!v5 || (uint64_t v6 = *MEMORY[0x1E4F1CF80], v5(CMBaseObject, *MEMORY[0x1E4F20FA8], *MEMORY[0x1E4F1CF80], &cf)))
    {
      FigDebugAssert3();
      goto LABEL_37;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v7 = (void *)cf;
    uint64_t v8 = [(id)cf countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      uint64_t v11 = *MEMORY[0x1E4F21408];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(const void **)(*((void *)&v21 + 1) + 8 * i);
          v26[0] = 0;
          uint64_t v14 = FigEndpointStreamGetCMBaseObject();
          uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v15) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = 0;
          }
          uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v16 + 48);
          if (v17) {
            v17(v14, v11, v6, v26);
          }
          if (FigCFEqual())
          {
            if (v26[0]) {
              CFRelease(v26[0]);
            }
            goto LABEL_28;
          }
          if (v26[0]) {
            CFRelease(v26[0]);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_28:
    if (dword_1EB4C5130)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v19 = *(const void **)(a1 + 32);
    if (!v13 || v19)
    {
      *(void *)(a1 + 32) = v13;
      if (!v13)
      {
        if (!v19) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    else
    {
      [*(id *)(a1 + 16) transitionToState:4 fromState:2];
      if (dword_1EB4C5130)
      {
        v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v19 = *(const void **)(a1 + 32);
      *(void *)(a1 + 32) = v13;
    }
    CFRetain(v13);
    if (!v19)
    {
LABEL_37:
      if (cf) {
        CFRelease(cf);
      }
      return;
    }
LABEL_36:
    CFRelease(v19);
    goto LABEL_37;
  }
}

@end