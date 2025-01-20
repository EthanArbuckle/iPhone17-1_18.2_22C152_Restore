@interface AVSystemRemotePoolOutputDeviceCommunicationChannelManager
+ (id)sharedSystemRemotePool;
+ (id)sharedSystemRemotePoolImpl;
- (AVOutputDevice)parentOutputDevice;
- (AVSystemRemotePoolOutputDeviceCommunicationChannelManager)initWithDeviceID:(id)a3;
- (id)_initializeIfNeededAndGetSystemRemotePool;
- (void)_didCloseCommChannelWithUUID:(__CFString *)a3 forDeviceWithID:(__CFString *)a4;
- (void)_didReceiveData:(__CFData *)a3 fromDeviceWithID:(__CFString *)a4 fromChannelWithUUID:(__CFString *)a5;
- (void)dealloc;
- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setParentOutputDevice:(id)a3;
@end

@implementation AVSystemRemotePoolOutputDeviceCommunicationChannelManager

- (void)setParentOutputDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

- (AVSystemRemotePoolOutputDeviceCommunicationChannelManager)initWithDeviceID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelManager;
  v4 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)&v8 init];
  if (v4 && (uint64_t v5 = [a3 copy], (v4->_deviceID = (NSString *)v5) != 0))
  {
    v4->_outputContext = 0;
    v4->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.device-comm-channel-manager");
    v4->_communicationChannelsForUUIDs = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  outputContext = self->_outputContext;
  if (outputContext && [(AVOutputContext *)outputContext figRoutingContext])
  {
    CMNotificationCenterGetDefaultLocalCenter();
    [(AVOutputContext *)self->_outputContext figRoutingContext];
    FigNotificationCenterRemoveWeakListener();
    [(AVOutputContext *)self->_outputContext figRoutingContext];
    FigNotificationCenterRemoveWeakListener();
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  communicationChannelsForUUIDs = self->_communicationChannelsForUUIDs;
  if (communicationChannelsForUUIDs) {
    CFRelease(communicationChannelsForUUIDs);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelManager;
  [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)&v6 dealloc];
}

+ (id)sharedSystemRemotePoolImpl
{
  uint64_t v2 = AVDefaultRoutingContextFactory();
  v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_sharedSystemRemotePoolImpl__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __87__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_sharedSystemRemotePoolImpl__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemRemotePoolContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)sharedSystemRemotePool
{
  uint64_t v2 = [[AVOutputContext alloc] initWithOutputContextImpl:+[AVSystemRemotePoolOutputDeviceCommunicationChannelManager sharedSystemRemotePoolImpl]];
  return v2;
}

- (id)_initializeIfNeededAndGetSystemRemotePool
{
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__initializeIfNeededAndGetSystemRemotePool__block_invoke;
  block[3] = &unk_1E57B3BB8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v4 = (void *)v9[5];
  if (v4)
  {
    if ([v4 figRoutingContext])
    {
      if (*((unsigned char *)v15 + 24))
      {
        [(AVOutputContext *)self->_outputContext figRoutingContext];
        if (!FigNotificationCenterAddWeakListener())
        {
          [(AVOutputContext *)self->_outputContext figRoutingContext];
          FigNotificationCenterAddWeakListener();
        }
      }
    }
  }
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

void *__102__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__initializeIfNeededAndGetSystemRemotePool__block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = *(void *)(result[4] + 24);
  if (!v2)
  {
    result = +[AVSystemRemotePoolOutputDeviceCommunicationChannelManager sharedSystemRemotePool];
    *(void *)(v1[4] + 24) = result;
    *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(v1[4] + 24);
  }
  *(void *)(*(void *)(v1[6] + 8) + 40) = v2;
  return result;
}

- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)self parentOutputDevice];
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired"];
  uint64_t v9 = [a3 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionCorrelationID"];
  uint64_t v10 = [a3 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionInitiator"];
  if (dword_1EB2D3A40)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v7
    && (id v12 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)self _initializeIfNeededAndGetSystemRemotePool]) != 0)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    v15 = v14;
    if (v9) {
      [v14 setObject:v9 forKeyedSubscript:0x1EE5A1FD8];
    }
    if (v10) {
      [v15 setObject:v10 forKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionInitiator"];
    }
    if (objc_msgSend(v8, "BOOLValue", v17, v18)) {
      [v15 setObject:v8 forKeyedSubscript:@"AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke;
    v19[3] = &unk_1E57B62A0;
    v19[4] = a3;
    v19[5] = v9;
    v19[6] = v13;
    v19[7] = self;
    v19[8] = a4;
    [v13 addOutputDevice:v7 options:v15 completionHandler:v19];
  }
  else
  {
    uint64_t v16 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
    (*((void (**)(id, void, uint64_t, void))a4 + 2))(a4, 0, v16, 0);
  }
}

void __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if ([a2 status] != 2)
  {
    [a2 cancellationReason];
    signed int v9 = 0;
    Mutable = 0;
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v5 = (const void **)MEMORY[0x1E4F204B0];
  objc_super v6 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionControlType"];
  v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToString:@"AVOutputDeviceCommunicationChannelControlTypeDirect"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      if (![v7 isEqualToString:@"AVOutputDeviceCommunicationChannelControlTypeRelayed"])goto LABEL_9; {
      uint64_t v8 = 1;
      }
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204C8], (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v8]);
  }
LABEL_9:
  v11 = *v5;
  id v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204B8], v12);
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204C0], v11);
  FigCFDictionarySetInt32();
  if (dword_1EB2D3A40)
  {
    unsigned int v31 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v14 = objc_msgSend(*(id *)(a1 + 48), "figRoutingContext", v27, v28);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 16);
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, __CFDictionary *, CFTypeRef *))(v17 + 152);
  if (!v18)
  {
    signed int v9 = -12782;
LABEL_21:
    AVLocalizedErrorWithUnderlyingOSStatus(v9, 0);
    goto LABEL_22;
  }
  signed int v19 = v18(v14, v15, Mutable, &cf);
  if (v19)
  {
    signed int v9 = v19;
    goto LABEL_21;
  }
  if (cf)
  {
    v20 = [AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc];
    int v21 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *)v20 initWithDeviceID:*(void *)(*(void *)(a1 + 56) + 16) channelUUID:cf outputContext:*(void *)(a1 + 48)];
    uint64_t v10 = [[AVOutputDeviceCommunicationChannel alloc] initWithOutputDeviceCommunicationChannelImpl:v21];

    uint64_t v22 = *(void *)(a1 + 56);
    v23 = *(NSObject **)(v22 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke_11;
    block[3] = &unk_1E57B2270;
    block[5] = v10;
    block[6] = cf;
    block[4] = v22;
    av_readwrite_dispatch_queue_write(v23, block);
    signed int v9 = 0;
    goto LABEL_23;
  }
  AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
  signed int v9 = 0;
LABEL_22:
  uint64_t v10 = 0;
LABEL_23:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }

  if (dword_1EB2D3A40)
  {
    unsigned int v31 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v25 = v31;
    if (os_log_type_enabled(v24, type)) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = v25 & 0xFFFFFFFE;
    }
    if (v26)
    {
      int v33 = 136315650;
      v34 = "-[AVSystemRemotePoolOutputDeviceCommunicationChannelManager openCommunicationChannelWithOptions:completionHa"
            "ndler:]_block_invoke_2";
      __int16 v35 = 2114;
      CFTypeRef v36 = cf;
      __int16 v37 = 1024;
      signed int v38 = v9;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __115__AVSystemRemotePoolOutputDeviceCommunicationChannelManager_openCommunicationChannelWithOptions_completionHandler___block_invoke_11(uint64_t a1)
{
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
  CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(const void **)(v3 + 40);
  *(void *)(v3 + 40) = MutableCopy;
  if (MutableCopy) {
    CFRetain(MutableCopy);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
  }
}

- (void)_didReceiveData:(__CFData *)a3 fromDeviceWithID:(__CFString *)a4 fromChannelWithUUID:(__CFString *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__25;
  uint64_t v18 = __Block_byref_object_dispose__25;
  uint64_t v19 = 0;
  if (a5 && [(NSString *)self->_deviceID isEqualToString:a4])
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didReceiveData_fromDeviceWithID_fromChannelWithUUID___block_invoke;
    block[3] = &unk_1E57B3B20;
    block[4] = self;
    block[5] = &v14;
    block[6] = a5;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v10 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)self parentOutputDevice];
    [(AVOutputDevice *)v10 communicationChannelManager:self didReceiveData:a3 fromCommunicationChannel:v15[5]];
  }

  _Block_object_dispose(&v14, 8);
}

void __114__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didReceiveData_fromDeviceWithID_fromChannelWithUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc] initWithDeviceID:*(void *)(*(void *)(a1 + 32) + 16) channelUUID:*(void *)(a1 + 48) outputContext:*(void *)(*(void *)(a1 + 32) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[AVOutputDeviceCommunicationChannel alloc] initWithOutputDeviceCommunicationChannelImpl:v5];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
    CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(const void **)(v3 + 40);
    *(void *)(v3 + 40) = MutableCopy;
    if (MutableCopy) {
      CFRetain(MutableCopy);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
}

- (void)_didCloseCommChannelWithUUID:(__CFString *)a3 forDeviceWithID:(__CFString *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__25;
  uint64_t v16 = __Block_byref_object_dispose__25;
  uint64_t v17 = 0;
  if (a3 && [(NSString *)self->_deviceID isEqualToString:a4])
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didCloseCommChannelWithUUID_forDeviceWithID___block_invoke;
    block[3] = &unk_1E57B3B20;
    block[4] = self;
    block[5] = &v12;
    block[6] = a3;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v8 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelManager *)self parentOutputDevice];
    [(AVOutputDevice *)v8 communicationChannelManager:self didCloseCommunicationChannel:v13[5]];
  }

  _Block_object_dispose(&v12, 8);
}

void __106__AVSystemRemotePoolOutputDeviceCommunicationChannelManager__didCloseCommChannelWithUUID_forDeviceWithID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
    CFDictionaryRemoveValue(MutableCopy, *(const void **)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(const void **)(v3 + 40);
    *(void *)(v3 + 40) = MutableCopy;
    if (MutableCopy) {
      CFRetain(MutableCopy);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
  else
  {
    uint64_t v5 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelImpl alloc] initWithDeviceID:*(void *)(*(void *)(a1 + 32) + 16) channelUUID:*(void *)(a1 + 48) outputContext:*(void *)(*(void *)(a1 + 32) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[AVOutputDeviceCommunicationChannel alloc] initWithOutputDeviceCommunicationChannelImpl:v5];
  }
}

- (AVOutputDevice)parentOutputDevice
{
  return (AVOutputDevice *)objc_loadWeak((id *)&self->_parentOutputDevice);
}

@end