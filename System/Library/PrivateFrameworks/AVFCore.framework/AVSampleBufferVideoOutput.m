@interface AVSampleBufferVideoOutput
- (AVSampleBufferVideoOutput)init;
- (AVSampleBufferVideoOutputPullDelegate)outputDelegate;
- (BOOL)_configureWithVideoQueue:(OpaqueFigVideoQueue *)a3;
- (BOOL)hasNewPixelBufferForSourceTime:(id *)a3;
- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5;
- (OS_dispatch_queue)delegateQueue;
- (OpaqueFigVisualContext)_visualContext;
- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5;
- (__CVBuffer)copyLastPixelBuffer:(id *)a3;
- (__CVBuffer)copyPixelBufferForSourceTime:(id *)a3 sourceTimeForDisplay:(id *)a4;
- (id)_weakReference;
- (void)_dispatchOutputSequenceWasFlushed;
- (void)_resetLastImageTime;
- (void)dealloc;
- (void)setOutputDelegate:(id)a3 queue:(id)a4;
@end

@implementation AVSampleBufferVideoOutput

- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5
{
  self->_videoOutputInternal->lastImageTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (VTPixelBufferConformerCreateWithAttributes()) {
    return 0;
  }
  if (!self->_videoOutputInternal->pixelBufferConformer) {
    return 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.015];
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E4F35018], 0);
  id v8 = [(AVSampleBufferVideoOutput *)self _weakReference];
  if (FigVisualContextCreateRemote()) {
    return 0;
  }
  vc = self->_videoOutputInternal->vc;
  if (!vc) {
    return 0;
  }
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v11 = v10 ? v10 : 0;
  v12 = *(unsigned int (**)(OpaqueFigVisualContext *, void (*)(uint64_t, long long *, char, void *), id))(v11 + 8);
  if (!v12 || v12(vc, AVSampleBufferVideoOutput_figVCAvailableImmediate, v8)) {
    return 0;
  }
  self->_videoOutputInternal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebuffervideooutput", 0);
  return 1;
}

- (AVSampleBufferVideoOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferVideoOutput;
  v2 = [(AVSampleBufferVideoOutput *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVSampleBufferVideoOutputInternal);
    v2->_videoOutputInternal = v3;
    if (!v3
      || (v2->_videoOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage),
          v2->_videoOutputInternal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2], ![(AVSampleBufferVideoOutput *)v2 setUpWithOutputSettings:0 outputSettingsArePixelBufferAttributes:1 withExceptionReason:0]))
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  videoOutputInternal = self->_videoOutputInternal;
  if (videoOutputInternal)
  {
    pixelBufferConformer = videoOutputInternal->pixelBufferConformer;
    if (pixelBufferConformer)
    {
      CFRelease(pixelBufferConformer);
      videoOutputInternal = self->_videoOutputInternal;
    }
    vc = videoOutputInternal->vc;
    if (vc)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = *(void (**)(OpaqueFigVisualContext *, void, void))(v7 + 8);
      if (v8) {
        v8(vc, 0, 0);
      }
      v9 = self->_videoOutputInternal->vc;
      if (v9)
      {
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v11 = v10 ? v10 : 0;
        v12 = *(void (**)(OpaqueFigVisualContext *))(v11 + 24);
        if (v12) {
          v12(v9);
        }
      }
      videoOutputInternal = self->_videoOutputInternal;
      v13 = videoOutputInternal->vc;
      if (v13)
      {
        CFRelease(v13);
        videoOutputInternal = self->_videoOutputInternal;
      }
    }

    v14 = self->_videoOutputInternal;
    stateQueue = v14->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      v14 = self->_videoOutputInternal;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVSampleBufferVideoOutput;
  [(AVSampleBufferVideoOutput *)&v16 dealloc];
}

- (id)_weakReference
{
  videoOutputInternal = self->_videoOutputInternal;
  if (videoOutputInternal) {
    return videoOutputInternal->weakReference;
  }
  else {
    return 0;
  }
}

- (void)setOutputDelegate:(id)a3 queue:(id)a4
{
  if (a3)
  {
    if (!a4)
    {
      id v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = "delegateQueue != NULL";
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "delegateQueue == NULL";
LABEL_9:
    v12 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  delegateStorage = self->_videoOutputInternal->delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (AVSampleBufferVideoOutputPullDelegate)outputDelegate
{
  return (AVSampleBufferVideoOutputPullDelegate *)[(AVWeakReferencingDelegateStorage *)self->_videoOutputInternal->delegateStorage delegate];
}

- (OS_dispatch_queue)delegateQueue
{
  return [(AVWeakReferencingDelegateStorage *)self->_videoOutputInternal->delegateStorage delegateQueue];
}

- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_super v16 = 0;
  CFTypeRef cf = 0;
  int64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v14 = *MEMORY[0x1E4F1F9F8];
  vc = self->_videoOutputInternal->vc;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(unsigned int (**)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, void, long long *))(v9 + 48);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F1CF80];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = v13;
    if (!v10(vc, v11, &v18, v5, &cf, 0, &v14))
    {
      if (a4)
      {
        if ((BYTE12(v14) & 0x1D) != 1) {
          goto LABEL_11;
        }
        *(_OWORD *)&a4->var0 = v14;
        a4->var3 = v15;
      }
      if (VTPixelBufferConformerCopyConformedPixelBuffer()) {
        objc_super v16 = 0;
      }
    }
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

- (BOOL)hasNewPixelBufferForSourceTime:(id *)a3
{
  if ((a3->var2 & 0x1D) != 1) {
    return 0;
  }
  vc = self->_videoOutputInternal->vc;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(unsigned int (**)(OpaqueFigVisualContext *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v5 + 40);
  if (!v6) {
    return 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = v8;
  return v6(vc, &v9) != 0;
}

- (__CVBuffer)copyPixelBufferForSourceTime:(id *)a3 sourceTimeForDisplay:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(AVSampleBufferVideoOutput *)self _copyPixelBufferForItemTimeWithOptions:&v5 itemTimeForDisplay:a4 options:1];
}

- (__CVBuffer)copyLastPixelBuffer:(id *)a3
{
  long long v18 = *MEMORY[0x1E4F1F9F8];
  int64_t v19 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v12 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = &v12;
  uint64_t v14 = 0x3810000000;
  int64_t v15 = &unk_194C75EBF;
  long long v16 = v18;
  int64_t v17 = v19;
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVSampleBufferVideoOutput_copyLastPixelBuffer___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateQueue, block);
  uint64_t v6 = 0;
  if ((*((_DWORD *)v13 + 11) & 0x1D) == 1)
  {
    long long v9 = *((_OWORD *)v13 + 2);
    uint64_t v10 = v13[6];
    uint64_t v7 = [(AVSampleBufferVideoOutput *)self copyPixelBufferForSourceTime:&v9 sourceTimeForDisplay:&v18];
    uint64_t v6 = v7;
    if (a3)
    {
      if (v7 && (BYTE12(v18) & 0x1D) == 1)
      {
        *(_OWORD *)&a3->var0 = v18;
        a3->var3 = v19;
      }
    }
  }
  _Block_object_dispose(&v12, 8);
  return v6;
}

__n128 __49__AVSampleBufferVideoOutput_copyLastPixelBuffer___block_invoke(uint64_t a1)
{
  v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = v2[3];
  v1[3].n128_u64[0] = v2[4].n128_u64[0];
  v1[2] = result;
  return result;
}

- (BOOL)_configureWithVideoQueue:(OpaqueFigVideoQueue *)a3
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v4 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&self->_videoOutputInternal->vc, 1, MEMORY[0x1E4F1D510]);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *(uint64_t (**)(uint64_t, void, CFArrayRef))(v7 + 56);
  if (!v8) {
    goto LABEL_12;
  }
  int v9 = v8(CMBaseObject, *MEMORY[0x1E4F34D00], v4);
  CFRelease(v4);
  if (!v9)
  {
    CFArrayRef v4 = CFArrayCreate(v3, MEMORY[0x1E4F1D260], 1, MEMORY[0x1E4F1D510]);
    uint64_t v11 = FigVideoQueueGetCMBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(unsigned int (**)(uint64_t, void, CFArrayRef))(v13 + 56);
    if (v14)
    {
      BOOL v10 = v14(v11, *MEMORY[0x1E4F34D08], v4) == 0;
LABEL_13:
      CFRelease(v4);
      return v10;
    }
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  return 0;
}

- (void)_resetLastImageTime
{
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVSampleBufferVideoOutput__resetLastImageTime__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

__n128 __48__AVSampleBufferVideoOutput__resetLastImageTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = MEMORY[0x1E4F1F9F8];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(v1 + 48) = *MEMORY[0x1E4F1F9F8];
  *(void *)(v1 + 64) = *(void *)(v2 + 16);
  return result;
}

- (OpaqueFigVisualContext)_visualContext
{
  return self->_videoOutputInternal->vc;
}

- (void)_dispatchOutputSequenceWasFlushed
{
  delegateStorage = self->_videoOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__AVSampleBufferVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke;
  v3[3] = &unk_1E57B4B88;
  v3[4] = self;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

uint64_t __62__AVSampleBufferVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    __n128 result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 outputSequenceWasFlushed:v4];
    }
  }
  return result;
}

__n128 __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 60))
  {
    CMTime time1 = *(CMTime *)(a1 + 40);
    CMTime v4 = *(CMTime *)(v2 + 48);
    if (CMTimeCompare(&time1, &v4) < 1) {
      return result;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v2 + 64) = *(void *)(a1 + 56);
  *(__n128 *)(v2 + 48) = result;
  return result;
}

uint64_t __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchOutputSequenceWasFlushed];
}

@end