@interface AVCoreImageFilterCustomVideoCompositor
+ (void)initialize;
- (AVCoreImageFilterCustomVideoCompositor)init;
- (BOOL)shouldCancelAllRequests;
- (BOOL)supportsHDRSourceFrames;
- (BOOL)supportsWideColorSourceFrames;
- (NSDictionary)requiredPixelBufferAttributesForRenderContext;
- (NSDictionary)sourcePixelBufferAttributes;
- (OS_dispatch_group)filteringRequestsInFlight;
- (id)defaultCIContext;
- (void)_willDeallocOrFinalize;
- (void)cancelAllPendingVideoCompositionRequests;
- (void)dealloc;
- (void)renderContextChanged:(id)a3;
- (void)setShouldCancelAllRequests:(BOOL)a3;
- (void)startVideoCompositionRequest:(id)a3;
@end

@implementation AVCoreImageFilterCustomVideoCompositor

+ (void)initialize
{
}

- (AVCoreImageFilterCustomVideoCompositor)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCoreImageFilterCustomVideoCompositor;
  v2 = [(AVCoreImageFilterCustomVideoCompositor *)&v5 init];
  if (v2)
  {
    v2->_filteringRequestsInFlight = (OS_dispatch_group *)dispatch_group_create();
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_defaultCIContextThreadSafety = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVStorylineCustomVideoCompositor._renderContextQ", v3);
  }
  return v2;
}

- (void)_willDeallocOrFinalize
{
  filteringRequestsInFlight = self->_filteringRequestsInFlight;
  if (filteringRequestsInFlight) {
    dispatch_release(filteringRequestsInFlight);
  }
  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  if (defaultCIContextThreadSafety)
  {
    dispatch_release(defaultCIContextThreadSafety);
  }
}

- (void)dealloc
{
  [(AVCoreImageFilterCustomVideoCompositor *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVCoreImageFilterCustomVideoCompositor;
  [(AVCoreImageFilterCustomVideoCompositor *)&v3 dealloc];
}

- (NSDictionary)sourcePixelBufferAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F24D58];
  v4[0] = *MEMORY[0x1E4F24D70];
  v4[1] = v2;
  v5[0] = &unk_1EE5E1B60;
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = *MEMORY[0x1E4F24D20];
  v5[2] = MEMORY[0x1E4F1CC08];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F24D58];
  v4[0] = *MEMORY[0x1E4F24D70];
  v4[1] = v2;
  v5[0] = &unk_1EE5E1B78;
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = *MEMORY[0x1E4F24D20];
  v5[2] = MEMORY[0x1E4F1CC08];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (void)renderContextChanged:(id)a3
{
  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVCoreImageFilterCustomVideoCompositor_renderContextChanged___block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(defaultCIContextThreadSafety, block);
}

void __63__AVCoreImageFilterCustomVideoCompositor_renderContextChanged___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
}

- (OS_dispatch_group)filteringRequestsInFlight
{
  return self->_filteringRequestsInFlight;
}

- (id)defaultCIContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  uint64_t v11 = 0;
  defaultCIContextThreadSafety = self->_defaultCIContextThreadSafety;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVCoreImageFilterCustomVideoCompositor_defaultCIContext__block_invoke;
  v5[3] = &unk_1E57B2160;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(defaultCIContextThreadSafety, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __58__AVCoreImageFilterCustomVideoCompositor_defaultCIContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E4F1E018]);
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)startVideoCompositionRequest:(id)a3
{
  if ([(AVCoreImageFilterCustomVideoCompositor *)self shouldCancelAllRequests])
  {
    [a3 finishCancelledRequest];
  }
  else
  {
    uint64_t v6 = (void *)[a3 videoCompositionInstruction];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Expecting video composition to contain only AVCoreImageFilterVideoCompositionInstruction", v7, v8, v9, v10, v11, v18), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    v12 = objc_msgSend((id)objc_msgSend(a3, "sourceTrackIDs"), "firstObject");
    if (v12) {
      uint64_t v13 = objc_msgSend(a3, "sourceFrameByTrackID:", objc_msgSend(v12, "intValue"));
    }
    else {
      uint64_t v13 = 0;
    }
    dispatch_group_enter((dispatch_group_t)self->_filteringRequestsInFlight);
    v14 = [AVAsynchronousCIImageFilteringRequest alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke;
    v21[3] = &unk_1E57B7368;
    v21[4] = self;
    v19[4] = self;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_2;
    v20[3] = &unk_1E57B7390;
    v20[4] = self;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_3;
    v19[3] = &unk_1E57B1E80;
    id v15 = [(AVAsynchronousCIImageFilteringRequest *)v14 initUsingCompositingRequest:a3 sourceFrame:v13 cancellationTest:v21 defaultCIContextProvider:v20 completionHandler:v19];
    uint64_t v16 = [v6 handler];
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v15);
  }
}

uint64_t __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldCancelAllRequests];
}

uint64_t __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultCIContext];
}

void __71__AVCoreImageFilterCustomVideoCompositor_startVideoCompositionRequest___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) filteringRequestsInFlight];
  dispatch_group_leave(v1);
}

- (void)cancelAllPendingVideoCompositionRequests
{
  [(AVCoreImageFilterCustomVideoCompositor *)self setShouldCancelAllRequests:1];
  dispatch_group_wait((dispatch_group_t)self->_filteringRequestsInFlight, 0xFFFFFFFFFFFFFFFFLL);
  [(AVCoreImageFilterCustomVideoCompositor *)self setShouldCancelAllRequests:0];
}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (BOOL)shouldCancelAllRequests
{
  return self->_shouldCancelAllRequests;
}

- (void)setShouldCancelAllRequests:(BOOL)a3
{
  self->_shouldCancelAllRequests = a3;
}

@end