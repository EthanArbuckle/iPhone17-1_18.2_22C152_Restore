@interface AVSampleBufferGeneratorBatch
+ (void)initialize;
- (AVSampleBufferGenerator)_generator;
- (AVSampleBufferGeneratorBatch)init;
- (AVSampleBufferGeneratorBatch)initWithGenerator:(id)a3;
- (BOOL)isOpenToRequests;
- (id)_completionHandler;
- (opaqueCMSampleBuffer)createAndAddSampleBufferForRequest:(id)a3 error:(id *)a4;
- (void)cancel;
- (void)dealloc;
- (void)makeDataReadyWithCompletionHandler:(void *)completionHandler;
@end

@implementation AVSampleBufferGeneratorBatch

+ (void)initialize
{
}

- (AVSampleBufferGeneratorBatch)initWithGenerator:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVSampleBufferGeneratorBatch;
  v5 = [(AVSampleBufferGeneratorBatch *)&v18 init];
  v11 = v5;
  if (v5)
  {
    if (!a3)
    {
      v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"generator != nil"), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    v5->_sampleGenerator = (AVSampleBufferGenerator *)a3;
    uint64_t v12 = [a3 _figSampleGenerator];
    v13 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    if (*v14 >= 2uLL)
    {
      v15 = (void (*)(uint64_t, void, OpaqueFigSampleGeneratorBatch **))v14[4];
      if (v15) {
        v15(v12, *MEMORY[0x1E4F1CF80], &v11->_sampleGeneratorBatch);
      }
    }
    v11->_openToRequests = 1;
    v11->_completionHandler = 0;
    v11->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v11;
}

- (AVSampleBufferGeneratorBatch)init
{
  return [(AVSampleBufferGeneratorBatch *)self initWithGenerator:0];
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListener();
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  if (sampleGeneratorBatch) {
    CFRelease(sampleGeneratorBatch);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferGeneratorBatch;
  [(AVSampleBufferGeneratorBatch *)&v4 dealloc];
}

- (AVSampleBufferGenerator)_generator
{
  return self->_sampleGenerator;
}

- (id)_completionHandler
{
  return self->_completionHandler;
}

- (BOOL)isOpenToRequests
{
  MEMORY[0x199715030](self->_stateMutex, a2);
  BOOL openToRequests = self->_openToRequests;
  MEMORY[0x199715040](self->_stateMutex);
  return openToRequests;
}

- (opaqueCMSampleBuffer)createAndAddSampleBufferForRequest:(id)a3 error:(id *)a4
{
  v19 = 0;
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "startCursor"), "_figSampleCursor");
  uint64_t v8 = [a3 preferredMinSampleCount];
  uint64_t v9 = [a3 maxSampleCount];
  uint64_t v10 = [a3 direction];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "limitCursor"), "_figSampleCursor");
  uint64_t v12 = [a3 _figSampleGeneratorReadPolicy];
  uint64_t v13 = [a3 _figSampleGeneratorReadFlags];
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = *(uint64_t (**)(OpaqueFigSampleGeneratorBatch *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), id, void, opaqueCMSampleBuffer **))(v15 + 8);
  if (v16)
  {
    signed int v17 = v16(sampleGeneratorBatch, v7, v8, v9, v10, v11, v12, v13, AVSampleBufferGenerator_remapSampleBufferTiming, a3, 0, &v19);
    if (!a4) {
      return v19;
    }
  }
  else
  {
    signed int v17 = -12782;
    if (!a4) {
      return v19;
    }
  }
  if (v17) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v17, 0);
  }
  return v19;
}

- (void)makeDataReadyWithCompletionHandler:(void *)completionHandler
{
  MEMORY[0x199715030](self->_stateMutex);
  if (!self->_openToRequests)
  {
    signed int v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"makeDataReadyWithCompletionHandler should only be called once.", v6, v7, v8, v9, v10, v18[0]), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  self->_BOOL openToRequests = 0;
  MEMORY[0x199715040](self->_stateMutex);
  self->_completionHandler = (id)[completionHandler copy];
  if (sAVSampleBufferGeneratorBatch_SetupOnce != -1) {
    dispatch_once(&sAVSampleBufferGeneratorBatch_SetupOnce, &__block_literal_global_105);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, block);
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(OpaqueFigSampleGeneratorBatch *))(v13 + 16);
  if (!v14)
  {
    signed int v15 = -12782;
    goto LABEL_11;
  }
  signed int v15 = v14(sampleGeneratorBatch);
  if (v15)
  {
LABEL_11:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = (uint64_t)__67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_3;
    v18[3] = (uint64_t)&unk_1E57B1E80;
    v18[4] = (uint64_t)self;
    dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, v18);
    uint64_t v16 = AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
    (*((void (**)(void *, uint64_t))completionHandler + 2))(completionHandler, v16);
  }
}

dispatch_queue_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke()
{
  sAVSampleBufferGeneratorBatch_PendingCompletion = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.avfoundation.avsamplebuffergenerator.batch-ready-notifications", v0);
  sAVSampleBufferGeneratorBatch_DispatchQueue = (uint64_t)result;
  return result;
}

uint64_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [(id)sAVSampleBufferGeneratorBatch_PendingCompletion addObject:*(void *)(a1 + 32)];
}

uint64_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [(id)sAVSampleBufferGeneratorBatch_PendingCompletion removeObject:*(void *)(a1 + 32)];
}

- (void)cancel
{
  MEMORY[0x199715030](self->_stateMutex, a2);
  self->_BOOL openToRequests = 0;
  MEMORY[0x199715040](self->_stateMutex);
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(OpaqueFigSampleGeneratorBatch *))(v5 + 24);
  if (v6)
  {
    v6(sampleGeneratorBatch);
  }
}

uint64_t __AVSampleBufferGeneratorBatch_BatchCompleted_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _completionHandler];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
  if (v7) {
    v7(v3, v4 + 24);
  }
  uint64_t v8 = (void *)sAVSampleBufferGeneratorBatch_PendingCompletion;
  uint64_t v9 = *(void *)(a1 + 32);
  return [v8 removeObject:v9];
}

@end