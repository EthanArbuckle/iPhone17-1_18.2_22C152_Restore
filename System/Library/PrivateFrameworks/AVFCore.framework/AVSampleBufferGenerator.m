@interface AVSampleBufferGenerator
+ (void)initialize;
+ (void)notifyOfDataReadyForSampleBuffer:(CMSampleBufferRef)sbuf completionHandler:(void *)completionHandler;
- (AVSampleBufferGenerator)init;
- (AVSampleBufferGenerator)initWithAsset:(AVAsset *)asset timebase:(CMTimebaseRef)timebase;
- (AVSampleBufferGeneratorBatch)makeBatch;
- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request;
- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request addingToBatch:(AVSampleBufferGeneratorBatch *)batch error:(NSError *)outError;
- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request error:(NSError *)outError;
- (OpaqueFigSampleGenerator)_figSampleGenerator;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation AVSampleBufferGenerator

+ (void)initialize
{
}

- (AVSampleBufferGenerator)initWithAsset:(AVAsset *)asset timebase:(CMTimebaseRef)timebase
{
  v13.receiver = self;
  v13.super_class = (Class)AVSampleBufferGenerator;
  result = [(AVSampleBufferGenerator *)&v13 init];
  if (result)
  {
    v7 = result;
    v8 = [(AVAsset *)asset _figAsset];
    v9 = [(AVAsset *)asset _copyFormatReader];
    v10 = objc_alloc_init(AVSampleBufferGeneratorInternal);
    v7->_generator = v10;
    if (v10
      && (CFRetain(v10), asset)
      && (v7->_generator ? (BOOL v11 = v8 == 0) : (BOOL v11 = 1), !v11 ? (v12 = v9 == 0) : (v12 = 1), !v12))
    {
      v7->_generator->weakReferenceToAsset = (AVWeakReference *)[(AVAsset *)asset _weakReference];
      if (timebase) {
        CFRetain(timebase);
      }
      v7->_generator->timebase = timebase;
      FigSampleGeneratorRemoteCreateForFormatReader();
      if (!v7->_generator->figSampleGenerator)
      {

        v7 = 0;
      }
    }
    else
    {

      v7 = 0;
      result = 0;
      if (!v9) {
        return result;
      }
    }
    CFRelease(v9);
    return v7;
  }
  return result;
}

- (AVSampleBufferGenerator)init
{
  return [(AVSampleBufferGenerator *)self initWithAsset:0 timebase:0];
}

- (void)dealloc
{
  generator = self->_generator;
  if (generator)
  {

    v4 = self->_generator;
    if (v4->timebase)
    {
      CFRelease(v4->timebase);
      v4 = self->_generator;
    }
    if (v4->figSampleGenerator)
    {
      CFRelease(v4->figSampleGenerator);
      v4 = self->_generator;
    }
    CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferGenerator;
  [(AVSampleBufferGenerator *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVSampleBufferGenerator alloc];
  id v5 = [(AVWeakReference *)self->_generator->weakReferenceToAsset referencedObject];
  timebase = self->_generator->timebase;
  return [(AVSampleBufferGenerator *)v4 initWithAsset:v5 timebase:timebase];
}

- (OpaqueFigSampleGenerator)_figSampleGenerator
{
  return self->_generator->figSampleGenerator;
}

- (AVSampleBufferGeneratorBatch)makeBatch
{
  v2 = [[AVSampleBufferGeneratorBatch alloc] initWithGenerator:self];
  return v2;
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request error:(NSError *)outError
{
  if (!request)
  {
    v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)outError, v4, v5, v6, v7, (uint64_t)"request != nil"), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  v24 = 0;
  figSampleGenerator = self->_generator->figSampleGenerator;
  BOOL v11 = [(AVSampleCursor *)[(AVSampleBufferRequest *)request startCursor] _figSampleCursor];
  NSInteger v12 = [(AVSampleBufferRequest *)request preferredMinSampleCount];
  NSInteger v13 = [(AVSampleBufferRequest *)request maxSampleCount];
  AVSampleBufferRequestDirection v14 = [(AVSampleBufferRequest *)request direction];
  v15 = [(AVSampleCursor *)[(AVSampleBufferRequest *)request limitCursor] _figSampleCursor];
  uint64_t v16 = [(AVSampleBufferRequest *)request _figSampleGeneratorReadPolicy];
  uint64_t v17 = [(AVSampleBufferRequest *)request _figSampleGeneratorReadFlags];
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = *(uint64_t (**)(OpaqueFigSampleGenerator *, OpaqueFigSampleCursor *, NSInteger, NSInteger, AVSampleBufferRequestDirection, OpaqueFigSampleCursor *, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), AVSampleBufferRequest *, void, opaqueCMSampleBuffer **))(v19 + 8);
  if (v20)
  {
    signed int v21 = v20(figSampleGenerator, v11, v12, v13, v14, v15, v16, v17, AVSampleBufferGenerator_remapSampleBufferTiming, request, 0, &v24);
    if (!outError) {
      return v24;
    }
  }
  else
  {
    signed int v21 = -12782;
    if (!outError) {
      return v24;
    }
  }
  if (v21) {
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v21, 0);
  }
  return v24;
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request
{
  return [(AVSampleBufferGenerator *)self createSampleBufferForRequest:request error:0];
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request addingToBatch:(AVSampleBufferGeneratorBatch *)batch error:(NSError *)outError
{
  if (!request)
  {
    AVSampleBufferRequestDirection v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)batch, (uint64_t)outError, v5, v6, v7, (uint64_t)"request != nil");
    goto LABEL_13;
  }
  if (!batch)
  {
    AVSampleBufferRequestDirection v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"batch cannot be nil";
LABEL_12:
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, (uint64_t)batch, (uint64_t)outError, v5, v6, v7, v18);
LABEL_13:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v16 userInfo:0]);
  }
  if ([(AVSampleBufferGeneratorBatch *)batch _generator] != self)
  {
    AVSampleBufferRequestDirection v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"batch does not belong to this generator";
    goto LABEL_12;
  }
  if (![(AVSampleBufferGeneratorBatch *)batch isOpenToRequests])
  {
    AVSampleBufferRequestDirection v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"createSampleBufferForRequest must only be called before makeDataReadyWithCompletionHandler.";
    goto LABEL_12;
  }
  return [(AVSampleBufferGeneratorBatch *)batch createAndAddSampleBufferForRequest:request error:outError];
}

+ (void)notifyOfDataReadyForSampleBuffer:(CMSampleBufferRef)sbuf completionHandler:(void *)completionHandler
{
  OSStatus statusOut = 0;
  if (!CMSampleBufferDataIsReady(sbuf))
  {
    if (CMSampleBufferHasDataFailed(sbuf, &statusOut))
    {
      uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(statusOut, 0);
      (*((void (**)(void *, void, uint64_t))completionHandler + 2))(completionHandler, 0, v7);
      return;
    }
    if (sAVSampleBufferGenerator_SetupOnce != -1) {
      dispatch_once(&sAVSampleBufferGenerator_SetupOnce, &__block_literal_global_26);
    }
    uint64_t v20 = 0;
    signed int v21 = &v20;
    uint64_t v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__26;
    v24 = __Block_byref_object_dispose__26;
    uint64_t v25 = 0;
    uint64_t v25 = [completionHandler copy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_24;
    block[3] = &unk_1E57B4010;
    block[4] = &v20;
    block[5] = sbuf;
    dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, block);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    if (CMSampleBufferDataIsReady(sbuf))
    {
      uint64_t v13 = 0;
      AVSampleBufferRequestDirection v14 = &v13;
      uint64_t v15 = 0x3052000000;
      uint64_t v16 = __Block_byref_object_copy__26;
      uint64_t v17 = __Block_byref_object_dispose__26;
      uint64_t v18 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_2;
      v12[3] = &unk_1E57B4010;
      v12[4] = &v13;
      v12[5] = sbuf;
      dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v12);
      uint64_t v8 = v14[5];
      if (v8)
      {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
      }
    }
    else
    {
      if (!CMSampleBufferHasDataFailed(sbuf, &statusOut))
      {
LABEL_16:

        _Block_object_dispose(&v20, 8);
        return;
      }
      uint64_t v13 = 0;
      AVSampleBufferRequestDirection v14 = &v13;
      uint64_t v15 = 0x3052000000;
      uint64_t v16 = __Block_byref_object_copy__26;
      uint64_t v17 = __Block_byref_object_dispose__26;
      uint64_t v18 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_3;
      v11[3] = &unk_1E57B4010;
      v11[4] = &v13;
      v11[5] = sbuf;
      dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v11);
      uint64_t v9 = v14[5];
      if (v9)
      {
        uint64_t v10 = AVLocalizedErrorWithUnderlyingOSStatus(statusOut, 0);
        (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v10);
      }
    }
    _Block_object_dispose(&v13, 8);
    goto LABEL_16;
  }
  uint64_t v6 = (void (*)(void *, uint64_t, void))*((void *)completionHandler + 2);
  v6(completionHandler, 1, 0);
}

dispatch_queue_t __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke()
{
  sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.avfoundation.avsamplebuffergenerator.data-ready-notifications", v0);
  sAVSampleBufferGenerator_DispatchQueue = (uint64_t)result;
  return result;
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_24(uint64_t a1)
{
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_2(uint64_t a1)
{
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    v3 = (__CFDictionary *)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler;
    uint64_t v4 = *(const void **)(a1 + 40);
    CFDictionaryRemoveValue(v3, v4);
  }
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_3(uint64_t a1)
{
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    v3 = (__CFDictionary *)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler;
    uint64_t v4 = *(const void **)(a1 + 40);
    CFDictionaryRemoveValue(v3, v4);
  }
}

void __AVSampleBufferGenerator_dataBecameReady_block_invoke(uint64_t a1)
{
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    v3 = (__CFDictionary *)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler;
    uint64_t v4 = *(const void **)(a1 + 40);
    CFDictionaryRemoveValue(v3, v4);
  }
}

void __AVSampleBufferGenerator_dataFailed_block_invoke(uint64_t a1)
{
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    v3 = (__CFDictionary *)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler;
    uint64_t v4 = *(const void **)(a1 + 40);
    CFDictionaryRemoveValue(v3, v4);
  }
}

@end