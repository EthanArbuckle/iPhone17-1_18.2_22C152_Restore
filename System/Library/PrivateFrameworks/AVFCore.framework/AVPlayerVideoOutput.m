@interface AVPlayerVideoOutput
- (AVPlayerVideoOutput)initWithSpecification:(id)a3;
- (BOOL)_attachToPlayer:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_setupWithOutputSpecification:(id)a3 exceptionReasonOut:(id *)a4;
- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3;
- (OpaqueCMTaggedBufferGroup)_copyTaggedBufferGroupForHostTimeInternal:(id *)a3 doNotConsume:(BOOL)a4 presentationTimeStamp:(id *)a5 activeConfiguration:(id *)a6 lastSeenTaggedBufferGroup:(OpaqueCMTaggedBufferGroup *)a7;
- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4 activeConfiguration:(id *)a5;
- (id)_playerItemWithIdentifier:(id)a3;
- (id)attachedPlayer;
- (id)resourceLifeCycleHandler;
- (int)_createAndConfigureVideoReceiverIfNecessaryOnStateQueue;
- (int)_setUpVideoReceiverEventHandlers:(OpaqueFigVideoReceiver *)a3;
- (void)_detachFromPlayer:(id)a3;
- (void)_handleVideoReceiverActiveConfigurationChanged:(FigVideoReceiverConfigurationInfo *)a3;
- (void)_setResourceLifeCycleHandler:(id)a3;
- (void)dealloc;
@end

@implementation AVPlayerVideoOutput

- (BOOL)_setupWithOutputSpecification:(id)a3 exceptionReasonOut:(id *)a4
{
  if (a3)
  {
    if ([a3 preferredTagCollections]
      && objc_msgSend((id)objc_msgSend(a3, "preferredTagCollections"), "count"))
    {
      self->_outputSpecification = (AVVideoOutputSpecification *)[a3 copy];
      self->_receiverState.stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avplayervideooutput.state", 0);
      self->_iVarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avplayervideooutput.ivars");
      return 1;
    }
    if (a4)
    {
      v13 = @"AVPlayerVideoOutput: Received malformed outputSpecification";
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    v13 = @"AVPlayerVideoOutput: outputSpecification cannot be nil.";
LABEL_9:
    v14 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, (uint64_t)a4, v4, v5, v6, v7, v15);
    BOOL result = 0;
    *a4 = v14;
    return result;
  }
  return 0;
}

- (AVPlayerVideoOutput)initWithSpecification:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AVPlayerVideoOutput;
  uint64_t v5 = [(AVPlayerVideoOutput *)&v17 init];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v16 = 0;
    if (![(AVPlayerVideoOutput *)v5 _setupWithOutputSpecification:a3 exceptionReasonOut:&v16])
    {
      uint64_t v7 = v6;
      if (v16)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v16, v8, v9, v10, v11, v12, v15), 0);
        objc_exception_throw(v14);
      }
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  videoReceiver = self->_receiverState.videoReceiver;
  if (videoReceiver)
  {
    CFRelease(videoReceiver);
    self->_receiverState.videoReceiver = 0;
  }
  videoTarget = self->_receiverState.videoTarget;
  if (videoTarget)
  {
    CFRelease(videoTarget);
    self->_receiverState.videoTarget = 0;
  }

  stateQueue = self->_receiverState.stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_receiverState.stateQueue = 0;
  }
  iVarAccessQueue = self->_iVarAccessQueue;
  if (iVarAccessQueue)
  {
    dispatch_release(iVarAccessQueue);
    self->_iVarAccessQueue = 0;
  }
  lastSeenTaggedBufferGroup = self->_receiverState.lastSeenTaggedBufferGroup;
  if (lastSeenTaggedBufferGroup)
  {
    CFRelease(lastSeenTaggedBufferGroup);
    self->_receiverState.lastSeenTaggedBufferGroup = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerVideoOutput;
  [(AVPlayerVideoOutput *)&v8 dealloc];
}

- (id)attachedPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  stateQueue = self->_receiverState.stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerVideoOutput_attachedPlayer__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__AVPlayerVideoOutput_attachedPlayer__block_invoke(uint64_t a1)
{
  id result = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (OpaqueCMTaggedBufferGroup)_copyTaggedBufferGroupForHostTimeInternal:(id *)a3 doNotConsume:(BOOL)a4 presentationTimeStamp:(id *)a5 activeConfiguration:(id *)a6 lastSeenTaggedBufferGroup:(OpaqueCMTaggedBufferGroup *)a7
{
  uint64_t v12 = 0;
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  int v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3810000000;
  v42 = &unk_194C75EBF;
  long long v43 = *MEMORY[0x1E4F1F9F8];
  uint64_t v44 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3052000000;
  v36 = __Block_byref_object_copy__22;
  v37 = __Block_byref_object_dispose__22;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (a4)
  {
    uint64_t v49 = *MEMORY[0x1E4F34D60];
    v50[0] = MEMORY[0x1E4F1CC38];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  }
  stateQueue = self->_receiverState.stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__AVPlayerVideoOutput__copyTaggedBufferGroupForHostTimeInternal_doNotConsume_presentationTimeStamp_activeConfiguration_lastSeenTaggedBufferGroup___block_invoke;
  block[3] = &unk_1E57B5BA8;
  long long v22 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  block[4] = self;
  block[5] = v12;
  block[6] = &v45;
  block[7] = &v29;
  block[8] = &v39;
  block[9] = &v33;
  block[10] = &v25;
  BOOL v24 = a4;
  dispatch_sync(stateQueue, block);
  if (v30[3] && !*((_DWORD *)v46 + 6))
  {
    if (a5)
    {
      int64_t v14 = v40[6];
      *(_OWORD *)&a5->var0 = *((_OWORD *)v40 + 2);
      a5->int64_t var3 = v14;
    }
    if (a6) {
      *a6 = (id)v34[5];
    }
    if (a7)
    {
      uint64_t v15 = v26;
      *a7 = (OpaqueCMTaggedBufferGroup *)v26[3];
      v15[3] = 0;
    }
  }
  id v16 = (id)v34[5];
  objc_super v17 = (const void *)v26[3];
  if (v17) {
    CFRelease(v17);
  }
  v18 = (OpaqueCMTaggedBufferGroup *)v30[3];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  return v18;
}

void __146__AVPlayerVideoOutput__copyTaggedBufferGroupForHostTimeInternal_doNotConsume_presentationTimeStamp_activeConfiguration_lastSeenTaggedBufferGroup___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v1)
  {
    if ((*(_DWORD *)(a1 + 100) & 0x1D) == 1)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v15 = *(_OWORD *)(a1 + 88);
      uint64_t v16 = *(void *)(a1 + 104);
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t, uint64_t))(v7 + 88);
      if (v8)
      {
        long long v17 = v15;
        uint64_t v18 = v16;
        int v9 = v8(v1, &v17, v3, v4 + 24, v5 + 32);
      }
      else
      {
        int v9 = -12782;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
      if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 48);
        CFTypeRef v10 = *(CFTypeRef *)(*(void *)(a1 + 32) + 40);
        if (v10) {
          CFTypeRef v10 = CFRetain(v10);
        }
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v10;
        if (!*(unsigned char *)(a1 + 112))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(const void **)(v11 + 40);
          v13 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          *(void *)(v11 + 40) = v13;
          if (v13) {
            CFRetain(v13);
          }
          if (v12) {
            CFRelease(v12);
          }
        }
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  CFTypeRef cf = 0;
  uint64_t v3 = [(AVPlayerVideoOutput *)self _copyTaggedBufferGroupForHostTimeInternal:&v7 doNotConsume:1 presentationTimeStamp:0 activeConfiguration:0 lastSeenTaggedBufferGroup:&cf];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = FigCFEqual() == 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4 activeConfiguration:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return [(AVPlayerVideoOutput *)self _copyTaggedBufferGroupForHostTimeInternal:&v6 doNotConsume:0 presentationTimeStamp:a4 activeConfiguration:a5 lastSeenTaggedBufferGroup:0];
}

- (id)_playerItemWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)&self->_receiverState.weakPlayer);
  BOOL v5 = 0;
  if (a3 && Weak)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = objc_msgSend(Weak, "_items", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v5 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_msgSend(v5, "identifier"), "isEqual:", a3)) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v5 = 0;
          if (v8) {
            goto LABEL_5;
          }
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (void)_handleVideoReceiverActiveConfigurationChanged:(FigVideoReceiverConfigurationInfo *)a3
{
  uint64_t v19 = 0;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v16 = *MEMORY[0x1E4F1DAB8];
  long long v17 = v5;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v6 = [(AVPlayerVideoOutput *)self _playerItemWithIdentifier:a3->var0];
  CFArrayRef v7 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  CFIndex v8 = 0;
  while (1)
  {
    CFIndex v9 = v7 ? CFArrayGetCount(v7) : 0;
    if (v8 >= v9) {
      break;
    }
    CFArrayGetValueAtIndex(v7, v8++);
    if (FigCFDictionaryGetValueIfPresent())
    {
      FigGetCGAffineTransformFrom3x3MatrixArray();
      break;
    }
  }
  if (v7) {
    CFRelease(v7);
  }

  if (v6)
  {
    uint64_t v10 = [AVPlayerVideoOutputConfiguration alloc];
    var1 = a3->var1;
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    long long v13 = *(_OWORD *)&a3->var3.var0;
    int64_t var3 = a3->var3.var3;
    long long v12 = [(AVPlayerVideoOutputConfiguration *)v10 initWithSourcePlayerItem:v6 dataChannelDescriptions:var1 transform:v15 activationTime:&v13];
  }
  else
  {
    long long v12 = 0;
  }
  self->_receiverState.activeConfiguration = v12;
}

- (int)_setUpVideoReceiverEventHandlers:(OpaqueFigVideoReceiver *)a3
{
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AVPlayerVideoOutput__setUpVideoReceiverEventHandlers___block_invoke;
  v9[3] = &unk_1E57B5BD0;
  objc_copyWeak(&v10, &location);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(uint64_t (**)(OpaqueFigVideoReceiver *, void *))(v5 + 192);
  if (v6) {
    int v7 = v6(a3, v9);
  }
  else {
    int v7 = -12782;
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void *__56__AVPlayerVideoOutput__setUpVideoReceiverEventHandlers___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    if (result[4] == a2)
    {
      long long v6 = a3[1];
      v7[0] = *a3;
      v7[1] = v6;
      v7[2] = a3[2];
      return (void *)[result _handleVideoReceiverActiveConfigurationChanged:v7];
    }
  }
  return result;
}

- (int)_createAndConfigureVideoReceiverIfNecessaryOnStateQueue
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFTypeRef v52 = 0;
  if (self->_receiverState.videoReceiver)
  {
    int v35 = 0;
    goto LABEL_48;
  }
  int v3 = MEMORY[0x199715340](*MEMORY[0x1E4F1CF80], 0, &v52);
  if (v3) {
    goto LABEL_47;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(AVVideoOutputSpecification *)self->_outputSpecification preferredTagCollections];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v48 != v8) {
        objc_enumerationMutation(v5);
      }
      int v3 = FigDataChannelGroupCreate();
      if (v3) {
        goto LABEL_47;
      }
      int v3 = FigDataChannelGroupAddDataChannel();
      if (v3) {
        goto LABEL_47;
      }
      [v4 addObject:cf];
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  CFTypeRef v10 = v52;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  long long v13 = *(uint64_t (**)(CFTypeRef, void *, void))(v12 + 72);
  if (!v13)
  {
LABEL_46:
    int v35 = -12782;
    goto LABEL_48;
  }
  int v3 = v13(v10, v4, 0);
  if (v3) {
    goto LABEL_47;
  }
  v46 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)v5 count])
  {
    unint64_t v14 = 0;
    uint64_t v45 = *MEMORY[0x1E4F34D48];
    uint64_t v44 = *MEMORY[0x1E4F34D50];
    uint64_t v43 = *MEMORY[0x1E4F34D58];
    uint64_t v42 = *MEMORY[0x1E4F34D30];
    uint64_t v41 = *MEMORY[0x1E4F1CFD0];
    uint64_t v40 = *MEMORY[0x1E4F1CFC8];
    uint64_t v39 = *MEMORY[0x1E4F34D28];
    uint64_t v38 = *MEMORY[0x1E4F34D38];
    uint64_t v37 = *MEMORY[0x1E4F34D18];
    uint64_t v15 = *MEMORY[0x1E4F34D20];
    do
    {
      uint64_t v16 = [(NSArray *)v5 objectAtIndex:v14];
      long long v17 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
      id v18 = [(AVVideoOutputSpecification *)self->_outputSpecification _videoColorPropertiesForTagCollection:v16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = [v18 objectForKeyedSubscript:@"ColorPrimaries"];
        uint64_t v21 = [v19 objectForKeyedSubscript:@"TransferFunction"];
        uint64_t v22 = [v19 objectForKeyedSubscript:@"YCbCrMatrix"];
        v53[0] = v45;
        v53[1] = v44;
        v54[0] = v20;
        v54[1] = v21;
        v53[2] = v43;
        v54[2] = v22;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 3), v42);
      }
      id v23 = [(AVVideoOutputSpecification *)self->_outputSpecification _allowWideColorForTagCollection:v16];
      if (v23)
      {
        if ([v23 BOOLValue]) {
          uint64_t v24 = v41;
        }
        else {
          uint64_t v24 = v40;
        }
        [v17 setObject:v24 forKeyedSubscript:v39];
      }
      id v25 = [(AVVideoOutputSpecification *)self->_outputSpecification _pixelBufferAttributesForTagCollection:v16];
      if (v25) {
        [v17 setObject:v25 forKeyedSubscript:v38];
      }
      if ([v17 count])
      {
        v26 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        [v26 setObject:v16 forKeyedSubscript:v37];
        [v26 setObject:v17 forKeyedSubscript:v15];
        [v46 addObject:v26];
      }
      ++v14;
    }
    while (v14 < [(NSArray *)v5 count]);
  }
  if ([v46 count])
  {
    CFTypeRef v27 = v52;
    uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 0;
    }
    v30 = *(uint64_t (**)(CFTypeRef, void *, void))(v29 + 80);
    if (!v30) {
      goto LABEL_46;
    }
    int v3 = v30(v27, v46, 0);
    if (v3)
    {
LABEL_47:
      int v35 = v3;
      goto LABEL_48;
    }
  }
  CFTypeRef v31 = v52;
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  v34 = *(uint64_t (**)(CFTypeRef, void, AVPlayerVideoOutput *))(v33 + 144);
  if (!v34) {
    goto LABEL_46;
  }
  int v3 = v34(v31, metadataSupplierResourceLifeCycleCallback, self);
  if (v3) {
    goto LABEL_47;
  }
  int v35 = [(AVPlayerVideoOutput *)self _setUpVideoReceiverEventHandlers:v52];
  if (!v35)
  {
    self->_receiverState.videoReceiver = (OpaqueFigVideoReceiver *)v52;
    CFTypeRef v52 = 0;
    goto LABEL_50;
  }
LABEL_48:
  if (v52) {
    CFRelease(v52);
  }
LABEL_50:
  if (cf) {
    CFRelease(cf);
  }
  return v35;
}

- (BOOL)_attachToPlayer:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  stateQueue = self->_receiverState.stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AVPlayerVideoOutput__attachToPlayer_exceptionReason___block_invoke;
  block[3] = &unk_1E57B5BF8;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  block[7] = a4;
  block[8] = a2;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__AVPlayerVideoOutput__attachToPlayer_exceptionReason___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 16));
  if (!Weak)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    uint64_t result = [*(id *)(a1 + 32) _createAndConfigureVideoReceiverIfNecessaryOnStateQueue];
    if (result
      || !*(void *)(*(void *)(a1 + 32) + 24)
      && (uint64_t v11 = *MEMORY[0x1E4F34D68],
          v12[0] = *MEMORY[0x1E4F1CFD0],
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1],
          uint64_t result = FigVideoTargetCreateWithVideoReceiver(),
          result))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_12;
    }
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "videoTargets"), "containsObject:", *(void *)(*(void *)(a1 + 32) + 24));
    if ((result & 1) == 0) {
      uint64_t result = [*(id *)(a1 + 40) addVideoTarget:*(void *)(*(void *)(a1 + 32) + 24)];
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_11:
    *(unsigned char *)(v9 + 24) = 1;
    goto LABEL_12;
  }
  uint64_t result = [Weak isEqual:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  if (result) {
    goto LABEL_11;
  }
  *(unsigned char *)(v9 + 24) = 0;
  if (*(void *)(a1 + 56))
  {
    uint64_t result = AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 64), @"This output is already attached to a player, and AVPlayerVideoOutput cannot be attached to more than one player at a time", v4, v5, v6, v7, v8, v10);
    **(void **)(a1 + 56) = result;
  }
LABEL_12:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return (uint64_t)objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), 0);
  }
  return result;
}

- (void)_detachFromPlayer:(id)a3
{
  stateQueue = self->_receiverState.stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AVPlayerVideoOutput__detachFromPlayer___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

void __41__AVPlayerVideoOutput__detachFromPlayer___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 16));
  if (Weak)
  {
    int v3 = Weak;
    if ([*(id *)(a1 + 40) isEqual:Weak])
    {
      [v3 removeVideoTarget:*(void *)(*(void *)(a1 + 32) + 24) synchronously:1];
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), 0);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(const void **)(v4 + 40);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(*(void *)(a1 + 32) + 40) = 0;
        uint64_t v4 = *(void *)(a1 + 32);
      }

      *(void *)(*(void *)(a1 + 32) + 48) = 0;
    }
  }
}

- (void)_setResourceLifeCycleHandler:(id)a3
{
  uint64_t v4 = [a3 copy];
  iVarAccessQueue = self->_iVarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AVPlayerVideoOutput__setResourceLifeCycleHandler___block_invoke;
  v6[3] = &unk_1E57B3748;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(iVarAccessQueue, v6);
}

void __52__AVPlayerVideoOutput__setResourceLifeCycleHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 40);
}

- (id)resourceLifeCycleHandler
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__102;
  uint64_t v10 = __Block_byref_object_dispose__103;
  uint64_t v11 = 0;
  iVarAccessQueue = self->_iVarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerVideoOutput_resourceLifeCycleHandler__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(iVarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerVideoOutput_resourceLifeCycleHandler__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void).cxx_destruct
{
}

@end