@interface AVFigCommChannelUUIDCommunicationChannelManager
- (AVFigCommChannelUUIDCommunicationChannelManager)init;
- (AVFigCommChannelUUIDCommunicationChannelManager)initWithRoutingContext:(OpaqueFigRoutingContext *)a3;
- (AVFigRoutingContextOutputContextImpl)parentOutputContextImpl;
- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel;
- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4;
- (void)_didReceiveData:(__CFData *)a3 fromCommChannelUUID:(__CFString *)a4;
- (void)dealloc;
- (void)didCloseCommChannelUUID:(__CFString *)a3;
- (void)setParentOutputContextImpl:(id)a3;
@end

@implementation AVFigCommChannelUUIDCommunicationChannelManager

- (void).cxx_destruct
{
}

- (void)dealloc
{
  weakObserver = self->_weakObserver;
  if (weakObserver)
  {
    id v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVCommChannelDidReceiveData name:*MEMORY[0x1E4F756C8] object:self->_routingContext];
    [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVCommChannelDidClose name:*MEMORY[0x1E4F756B0] object:self->_routingContext];
    weakObserver = self->_weakObserver;
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }
  outgoingCommChannelUUID = self->_outgoingCommChannelUUID;
  if (outgoingCommChannelUUID) {
    CFRelease(outgoingCommChannelUUID);
  }
  communicationChannelsForUUIDs = self->_communicationChannelsForUUIDs;
  if (communicationChannelsForUUIDs) {
    CFRelease(communicationChannelsForUUIDs);
  }
  v9.receiver = self;
  v9.super_class = (Class)AVFigCommChannelUUIDCommunicationChannelManager;
  [(AVFigCommChannelUUIDCommunicationChannelManager *)&v9 dealloc];
}

- (void)setParentOutputContextImpl:(id)a3
{
}

- (AVFigCommChannelUUIDCommunicationChannelManager)initWithRoutingContext:(OpaqueFigRoutingContext *)a3
{
  id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v12.receiver = self;
  v12.super_class = (Class)AVFigCommChannelUUIDCommunicationChannelManager;
  v6 = [(AVFigCommChannelUUIDCommunicationChannelManager *)&v12 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (!a3)
  {
    v10 = 0;
    v6->_routingContext = 0;
    goto LABEL_6;
  }
  v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v7->_routingContext = v8;
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_6;
  }
  v7->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.communication-channel-manager");
  v7->_communicationChannelsForUUIDs = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  objc_super v9 = [[AVWeakReference alloc] initWithReferencedObject:v7];
  v7->_weakObserver = v9;
  [v5 addListenerWithWeakReference:v9 callback:AVCommChannelDidReceiveData name:*MEMORY[0x1E4F756C8] object:v7->_routingContext flags:0];
  [v5 addListenerWithWeakReference:v7->_weakObserver callback:AVCommChannelDidClose name:*MEMORY[0x1E4F756B0] object:v7->_routingContext flags:0];
  v10 = v7;
LABEL_6:

  return v10;
}

- (AVFigCommChannelUUIDCommunicationChannelManager)init
{
  return [(AVFigCommChannelUUIDCommunicationChannelManager *)self initWithRoutingContext:0];
}

- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__44;
  v22 = __Block_byref_object_dispose__44;
  uint64_t v23 = 0;
  CFTypeRef cf = 0;
  uint64_t v24 = *MEMORY[0x1E4F204C0];
  v25[0] = *MEMORY[0x1E4F204B0];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  routingContext = self->_routingContext;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigRoutingContext *, uint64_t, CFTypeRef *))(v6 + 112);
  if (v7)
  {
    int v8 = v7(routingContext, v3, &cf);
    objc_super v9 = 0;
    CFTypeRef v10 = cf;
    v11 = 0;
    if (!v8 && cf)
    {
      objc_super v12 = [AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc];
      v11 = [(AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)v12 initWithRoutingContext:self->_routingContext commChannelUUID:cf];
      objc_super v9 = [[AVOutputContextCommunicationChannel alloc] initWithOutputContextCommunicationChannelImpl:v11];
      ivarAccessQueue = self->_ivarAccessQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__AVFigCommChannelUUIDCommunicationChannelManager_outgoingCommunicationChannel__block_invoke;
      v16[3] = &unk_1E57B6FE0;
      v16[6] = &v18;
      v16[7] = cf;
      v16[4] = self;
      v16[5] = v9;
      av_readwrite_dispatch_queue_write(ivarAccessQueue, v16);
      CFTypeRef v10 = cf;
    }
    if (v10) {
      CFRelease(v10);
    }
  }
  else
  {
    v11 = 0;
    objc_super v9 = 0;
  }

  v14 = (AVOutputContextCommunicationChannel *)(id)v19[5];
  _Block_object_dispose(&v18, 8);
  return v14;
}

void __79__AVFigCommChannelUUIDCommunicationChannelManager_outgoingCommunicationChannel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 40), v3);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(v2 + 40));
    CFTypeRef v5 = *(CFTypeRef *)(a1 + 56);
    if (v5) {
      CFTypeRef v5 = CFRetain(v5);
    }
    *(void *)(*(void *)(a1 + 32) + 32) = v5;
    CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 56), *(const void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(const void **)(v6 + 40);
    *(void *)(v6 + 40) = MutableCopy;
    if (MutableCopy) {
      CFRetain(MutableCopy);
    }
    if (v7) {
      CFRelease(v7);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(id *)(a1 + 40);
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  cf[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  int v8 = (const void *)*MEMORY[0x1E4F204B0];
  objc_super v9 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextCommunicationChannelOptionControlType"];
  CFTypeRef v10 = v9;
  if (v9)
  {
    if ([v9 isEqualToString:@"AVOutputContextCommunicationChannelControlTypeDirect"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      if (![v10 isEqualToString:@"AVOutputContextCommunicationChannelControlTypeRelayed"])goto LABEL_7; {
      uint64_t v11 = 1;
      }
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204C8], (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v11]);
  }
LABEL_7:
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F204C0], v8);
  if (dword_1EB2D3A60)
  {
    int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = *(uint64_t (**)(OpaqueFigRoutingContext *, __CFDictionary *, CFTypeRef *))(v15 + 112);
  if (!v16)
  {
    signed int v17 = -12782;
    goto LABEL_18;
  }
  signed int v17 = v16(routingContext, Mutable, cf);
  if (v17)
  {
LABEL_18:
    v22 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v17, 0);
    goto LABEL_19;
  }
  if (cf[0])
  {
    uint64_t v18 = [AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc];
    v19 = [(AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)v18 initWithRoutingContext:self->_routingContext commChannelUUID:cf[0]];
    uint64_t v20 = [[AVOutputContextCommunicationChannel alloc] initWithOutputContextCommunicationChannelImpl:v19];
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__AVFigCommChannelUUIDCommunicationChannelManager_openCommunicationChannelWithOptions_error___block_invoke;
    block[3] = &unk_1E57B2270;
    block[5] = v20;
    block[6] = cf[0];
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    v22 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  v22 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
LABEL_19:
  v19 = 0;
  uint64_t v20 = 0;
  if (!a4) {
    goto LABEL_22;
  }
LABEL_20:
  if (!v20) {
    *a4 = v22;
  }
LABEL_22:
  if (cf[0]) {
    CFRelease(cf[0]);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  return v20;
}

void __93__AVFigCommChannelUUIDCommunicationChannelManager_openCommunicationChannelWithOptions_error___block_invoke(uint64_t a1)
{
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
  CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(const void **)(v3 + 40);
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

- (void)_didReceiveData:(__CFData *)a3 fromCommChannelUUID:(__CFString *)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__44;
  uint64_t v14 = __Block_byref_object_dispose__44;
  uint64_t v15 = 0;
  if (a4)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__AVFigCommChannelUUIDCommunicationChannelManager__didReceiveData_fromCommChannelUUID___block_invoke;
    block[3] = &unk_1E57B3B20;
    block[4] = self;
    block[5] = &v10;
    block[6] = a4;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    v7 = [(AVFigCommChannelUUIDCommunicationChannelManager *)self parentOutputContextImpl];
    [(AVFigRoutingContextOutputContextImpl *)v7 communicationChannelManager:self didReceiveData:a3 fromCommunicationChannel:v11[5]];
    int v8 = (void *)v11[5];
  }
  else
  {
    int v8 = 0;
  }

  _Block_object_dispose(&v10, 8);
}

void __87__AVFigCommChannelUUIDCommunicationChannelManager__didReceiveData_fromCommChannelUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    CFTypeRef v5 = [[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc] initWithRoutingContext:*(void *)(*(void *)(a1 + 32) + 16) commChannelUUID:*(void *)(a1 + 48)];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[AVOutputContextCommunicationChannel alloc] initWithOutputContextCommunicationChannelImpl:v5];
    CFDictionarySetValue(MutableCopy, *(const void **)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(const void **)(v3 + 40);
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

- (void)didCloseCommChannelUUID:(__CFString *)a3
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__44;
  uint64_t v12 = __Block_byref_object_dispose__44;
  uint64_t v13 = 0;
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__AVFigCommChannelUUIDCommunicationChannelManager_didCloseCommChannelUUID___block_invoke;
    block[3] = &unk_1E57B3B20;
    block[4] = self;
    block[5] = &v8;
    block[6] = a3;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    CFTypeRef v5 = [(AVFigCommChannelUUIDCommunicationChannelManager *)self parentOutputContextImpl];
    [(AVFigRoutingContextOutputContextImpl *)v5 communicationChannelManager:self didCloseCommunicationChannel:v9[5]];
    uint64_t v6 = (void *)v9[5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  _Block_object_dispose(&v8, 8);
}

void __75__AVFigCommChannelUUIDCommunicationChannelManager_didCloseCommChannelUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 48));
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(*(void *)(a1 + 32) + 40));
    CFDictionaryRemoveValue(MutableCopy, *(const void **)(a1 + 48));
    uint64_t v3 = *(const void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    CFTypeRef v5 = *(const void **)(v4 + 32);
    if (v3 == v5 && v5 != 0)
    {
      CFRelease(v3);
      *(void *)(*(void *)(a1 + 32) + 32) = 0;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    v7 = *(const void **)(v4 + 40);
    *(void *)(v4 + 40) = MutableCopy;
    if (MutableCopy) {
      CFRetain(MutableCopy);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
  else
  {
    uint64_t v8 = [[AVFigCommChannelUUIDOutputContextCommunicationChannelImpl alloc] initWithRoutingContext:*(void *)(*(void *)(a1 + 32) + 16) commChannelUUID:*(void *)(a1 + 48)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[AVOutputContextCommunicationChannel alloc] initWithOutputContextCommunicationChannelImpl:v8];
  }
}

- (AVFigRoutingContextOutputContextImpl)parentOutputContextImpl
{
  return (AVFigRoutingContextOutputContextImpl *)objc_loadWeak((id *)&self->_parentOutputContextImpl);
}

@end