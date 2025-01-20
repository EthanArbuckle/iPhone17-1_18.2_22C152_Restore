@interface AudioRemixSubscriber
- (AudioRemixSubscriber)init;
- (AudioRemixSubscriber)initWithSession:(id)a3 andNodeMetadataOutput:(id)a4 completionHandler:(id)a5;
- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4;
- (int)handleReceiveCompletion:(id)a3;
- (int)handleReceiveResult:(id)a3;
- (void)activate;
- (void)cancelSubscription;
- (void)dealloc;
@end

@implementation AudioRemixSubscriber

- (AudioRemixSubscriber)init
{
  return 0;
}

- (AudioRemixSubscriber)initWithSession:(id)a3 andNodeMetadataOutput:(id)a4 completionHandler:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AudioRemixSubscriber;
  v8 = [(AudioRemixSubscriber *)&v17 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cameracapture.audioremixanalysis.subscriber", v9);
    v8[24] = 0;
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = v10;
    *((void *)v8 + 5) = a3;
    if (a4) {
      CFTypeRef v11 = CFRetain(a4);
    }
    else {
      CFTypeRef v11 = 0;
    }
    *((void *)v8 + 6) = v11;
    *((void *)v8 + 4) = _Block_copy(a5);
    *((void *)v8 + 7) = 0;
    *((void *)v8 + 8) = 0;
    CFTypeRef v12 = (CFTypeRef)objc_msgSend((id)objc_msgSend(*((id *)v8 + 6), "format"), "formatDescription");
    if (v12) {
      CFTypeRef v12 = CFRetain(v12);
    }
    *((void *)v8 + 9) = v12;
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    long long v14 = *MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v8 + 5) = *MEMORY[0x1E4F1F9F8];
    uint64_t v15 = *(void *)(v13 + 16);
    *((void *)v8 + 12) = v15;
    *(_OWORD *)(v8 + 104) = v14;
    *((void *)v8 + 15) = v15;
  }
  return (AudioRemixSubscriber *)v8;
}

- (void)dealloc
{
  subscription = self->_subscription;
  if (subscription)
  {
    [(SNMovieRemixSubscriptionProtocol *)subscription cancel];

    self->_subscription = 0;
  }

  self->_session = 0;
  dispatch_release((dispatch_object_t)self->_workQueue);
  self->_workQueue = 0;
  _Block_release(self->_subscriptionCompletionHandler);
  self->_subscriptionCompletionHandler = 0;

  self->_nodeMetadataOutput = 0;
  audioMetadataFormatDescription = self->_audioMetadataFormatDescription;
  if (audioMetadataFormatDescription) {
    CFRelease(audioMetadataFormatDescription);
  }
  self->_audioMetadataFormatDescription = 0;
  v5.receiver = self;
  v5.super_class = (Class)AudioRemixSubscriber;
  [(AudioRemixSubscriber *)&v5 dealloc];
}

- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4
{
  if (self->_resultHandlerSemaphore || self->_completionHandlerSemaphore)
  {
    return FigSignalErrorAt();
  }
  else if ((a3->var2 & 1) != 0 {
         && (a4->var2 & 1) != 0
  }
         && (time1 = *(CMTime *)a3, CMTime v16 = *(CMTime *)a4, CMTimeCompare(&time1, &v16) < 0))
  {
    long long v7 = *(_OWORD *)&a3->var0;
    self->_startingPTS.epoch = a3->var3;
    *(_OWORD *)&self->_startingPTS.value = v7;
    long long v8 = *(_OWORD *)&a4->var0;
    self->_endingPTS.epoch = a4->var3;
    *(_OWORD *)&self->_endingPTS.value = v8;
    self->_resultHandlerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    self->_completionHandlerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    [(SNMovieRemixSession *)self->_session finishWithError:0];
    resultHandlerSemaphore = self->_resultHandlerSemaphore;
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    intptr_t v11 = dispatch_semaphore_wait(resultHandlerSemaphore, v10);
    dispatch_release((dispatch_object_t)self->_resultHandlerSemaphore);
    self->_resultHandlerSemaphore = 0;
    if (v11) {
      return FigSignalErrorAt();
    }
    completionHandlerSemaphore = self->_completionHandlerSemaphore;
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    intptr_t v14 = dispatch_semaphore_wait(completionHandlerSemaphore, v13);
    dispatch_release((dispatch_object_t)self->_completionHandlerSemaphore);
    self->_completionHandlerSemaphore = 0;
    if (v14) {
      return FigSignalErrorAt();
    }
    else {
      return 0;
    }
  }
  else
  {
    return -16992;
  }
}

- (int)handleReceiveResult:(id)a3
{
  uint64_t v9 = 0;
  dispatch_time_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AudioRemixSubscriber_handleReceiveResult___block_invoke;
  block[3] = &unk_1E5C25120;
  block[4] = self;
  block[5] = a3;
  block[6] = &v9;
  dispatch_sync(workQueue, block);
  int v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __44__AudioRemixSubscriber_handleReceiveResult___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CMBlockBufferRef theBuffer = 0;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dspParameters"), "count");
    unsigned int v3 = v2;
    int v4 = 8 * v2;
    uint64_t v5 = ((8 * v2) & 0x7FFFFFFF8) + 50;
    int v6 = (char *)malloc_type_malloc(v5, 0x9BA81644uLL);
    *(_DWORD *)int v6 = bswap32(v5);
    *((_DWORD *)v6 + 1) = 0x1000000;
    *((_DWORD *)v6 + 2) = bswap32(v4 + 42);
    *(_OWORD *)(v6 + 12) = xmmword_1A5EFDBC0;
    *((_DWORD *)v6 + 7) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_DWORD *)v6 + 9) = bswap32(v4 + 14);
    *((void *)v6 + 5) = *(void *)"cnpm";
    *((_WORD *)v6 + 24) = bswap32(v3) >> 16;
    uint64_t v7 = v3;
    if (v3)
    {
      uint64_t v8 = 0;
      do
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dspParameters"), "objectAtIndexedSubscript:", v8);
        uint64_t v10 = [v9 key];
        [v9 value];
        *(void *)&v6[8 * v8++ + 50] = bswap64(v11 | (unint64_t)(v10 << 32));
      }
      while (v7 != v8);
    }
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v5, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v5, 0, &theBuffer);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_18;
    }
    if (!theBuffer) {
      goto LABEL_13;
    }
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&v23.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&v23.decodeTimeStamp.value = v13;
    CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&v23.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&v23.duration.epoch = v15;
    uint64_t v16 = *(void *)(a1 + 32);
    *(_OWORD *)&v23.presentationTimeStamp.value = *(_OWORD *)(v16 + 80);
    CMTimeEpoch v17 = *(void *)(v16 + 96);
    v23.decodeTimeStamp.epoch = v14;
    v23.presentationTimeStamp.epoch = v17;
    CMTime lhs = *(CMTime *)(v16 + 104);
    CMTime rhs = *(CMTime *)(v16 + 80);
    CMTimeSubtract(&v23.duration, &lhs, &rhs);
    size_t sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CMSampleBufferCreate(v12, theBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(*(void *)(a1 + 32)+ 72), 1, 1, &v23, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
LABEL_18:
      FigDebugAssert3();
    }
    else
    {
      if (!cf) {
        goto LABEL_15;
      }
      v18 = *(void **)(*(void *)(a1 + 32) + 48);
      if (v18)
      {
        if (dword_1E96B6C88)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v18 = *(void **)(*(void *)(a1 + 32) + 48);
        }
        objc_msgSend(v18, "emitSampleBuffer:", blockBufferOut, v21);
      }
    }
  }
LABEL_13:
  if (cf) {
    CFRelease(cf);
  }
LABEL_15:
  if (theBuffer) {
    CFRelease(theBuffer);
  }
}

- (int)handleReceiveCompletion:(id)a3
{
  uint64_t v13 = 0;
  CMTimeEpoch v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AudioRemixSubscriber_handleReceiveCompletion___block_invoke;
  block[3] = &unk_1E5C25148;
  block[4] = self;
  block[5] = a3;
  block[6] = &v9;
  void block[7] = &v13;
  dispatch_sync(workQueue, block);
  if (*((unsigned char *)v10 + 24)) {
    (*((void (**)(id, void))self->_subscriptionCompletionHandler + 2))(self->_subscriptionCompletionHandler, 0);
  }
  int v6 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void *__48__AudioRemixSubscriber_handleReceiveCompletion___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    if (result[5])
    {
      result = (void *)FigSignalErrorAt();
      *(_DWORD *)(*(void *)(v2[7] + 8) + 24) = result;
    }
  }
  return result;
}

- (void)cancelSubscription
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AudioRemixSubscriber_cancelSubscription__block_invoke;
  block[3] = &unk_1E5C24F58;
  block[4] = self;
  block[5] = &v5;
  dispatch_sync(workQueue, block);
  if (*((unsigned char *)v6 + 24)) {
    (*((void (**)(id, uint64_t))self->_subscriptionCompletionHandler + 2))(self->_subscriptionCompletionHandler, 1);
  }
  _Block_object_dispose(&v5, 8);
}

void __42__AudioRemixSubscriber_cancelSubscription__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    unsigned int v3 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v3)
    {
      [v3 cancel];

      *(void *)(*(void *)(a1 + 32) + 8) = 0;
    }
  }
}

- (void)activate
{
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AudioRemixSubscriber_activate__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __32__AudioRemixSubscriber_activate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 8) && !*(unsigned char *)(v1 + 24))
  {
    objc_initWeak(&location, (id)v1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__AudioRemixSubscriber_activate__block_invoke_2;
    v7[3] = &unk_1E5C25170;
    objc_copyWeak(&v8, &location);
    v7[4] = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __32__AudioRemixSubscriber_activate__block_invoke_3;
    v4[3] = &unk_1E5C25198;
    objc_copyWeak(&v6, &location);
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(v5 + 40) subscribeWithFinalResultHandler:v7 completionHandler:v4];
    id v3 = *(id *)(*(void *)(a1 + 32) + 8);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

NSObject *__32__AudioRemixSubscriber_activate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    if ([Weak handleReceiveResult:a2]) {
      FigDebugAssert3();
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  result = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

NSObject *__32__AudioRemixSubscriber_activate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    if ([Weak handleReceiveCompletion:a2]) {
      FigDebugAssert3();
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  result = *(NSObject **)(*(void *)(a1 + 32) + 64);
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

@end