@interface BWRenderListProcessor
+ (id)filterRendererResultToString:(unint64_t)a3;
+ (void)initialize;
- (BOOL)alwaysEmitsOriginalResult;
- (BWPixelBufferPool)renderingPool;
- (BWRenderListProcessor)initWithRenderingPool:(id)a3;
- (void)_continueRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(uint64_t)a5 resultError:(uint64_t *)a6 fromRendererNode:(uint64_t *)a7 parameterNode:(opaqueCMSampleBuffer *)a8 inputSampleBuffer:(__CVBuffer *)a9 inputPixelBuffer:(uint64_t)a10 finalResultHandler:;
- (void)_emitProcessedSampleBufferFromRenderList:(uint64_t)a3 result:(int)a4 resultError:(opaqueCMSampleBuffer *)cf inputSampleBuffer:(__CVBuffer *)a6 processedPixelBuffer:(uint64_t)a7 finalResultHandler:;
- (void)_finishRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(int)a5 resultError:(opaqueCMSampleBuffer *)a6 inputSampleBuffer:(__CVBuffer *)a7 processedPixelBuffer:(uint64_t)a8 finalResultHandler:;
- (void)_processRenderList:(void *)a3 parameterListProvider:(void *)a4 inputPixelBuffer:(void *)a5 inputSampleBuffer:(uint64_t)a6 resultHandler:;
- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3 usingRenderList:(id)a4;
- (void)dealloc;
- (void)processRenderList:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 resultHandler:(id)a6;
- (void)processRenderList:(id)a3 withParameters:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 inputSampleBuffer:(opaqueCMSampleBuffer *)a6 resultHandler:(id)a7;
- (void)setAlwaysEmitsOriginalResult:(BOOL)a3;
- (void)waitForAllProcessingToComplete;
@end

@implementation BWRenderListProcessor

uint64_t __50__BWRenderListProcessor_alwaysEmitsOriginalResult__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BWRenderListProcessor)initWithRenderingPool:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWRenderListProcessor;
  v4 = [(BWRenderListProcessor *)&v6 init];
  if (v4)
  {
    v4->_configurationMutexQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.render-list-processor.configuration-queue", 0);
    v4->_renderingPool = (BWPixelBufferPool *)a3;
    v4->_renderingGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v4;
}

- (void)_finishRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(int)a5 resultError:(opaqueCMSampleBuffer *)a6 inputSampleBuffer:(__CVBuffer *)a7 processedPixelBuffer:(uint64_t)a8 finalResultHandler:
{
  if (a1)
  {
    -[BWRenderListProcessor _emitProcessedSampleBufferFromRenderList:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](a1, (int)a2, a4, a5, a6, a7, a8);
    if (a6) {
      CFRelease(a6);
    }

    v12 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v12);
  }
}

- (void)processRenderList:(id)a3 withParameters:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 inputSampleBuffer:(opaqueCMSampleBuffer *)a6 resultHandler:(id)a7
{
  id v7 = a3;
  if (a4) {
    a3 = a4;
  }
  -[BWRenderListProcessor _processRenderList:parameterListProvider:inputPixelBuffer:inputSampleBuffer:resultHandler:]((dispatch_group_t *)self, v7, a3, a5, a6, (uint64_t)a7);
}

- (void)_processRenderList:(void *)a3 parameterListProvider:(void *)a4 inputPixelBuffer:(void *)a5 inputSampleBuffer:(uint64_t)a6 resultHandler:
{
  if (!a1) {
    return;
  }
  dispatch_group_wait(a1[4], 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter(a1[4]);
  if (a5) {
    CFRetain(a5);
  }
  if (a4) {
    CFRetain(a4);
  }
  id v12 = a2;
  id v13 = a3;
  if (a6
    && [(dispatch_group_t *)a1 alwaysEmitsOriginalResult]
    && ([a2 producesOriginalRender] & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void))(a6 + 16))(a6, 1, a5, 0);
  }
  if (a2)
  {
    v14 = *(uint64_t **)[a2 rendererList];
    if (!a3) {
      goto LABEL_18;
    }
LABEL_14:
    v15 = (uint64_t **)[a3 parameterList];
    if (v14 && *v15)
    {
      -[BWRenderListProcessor _continueRenderingUsingRenderList:parameterListProvider:result:resultError:fromRendererNode:parameterNode:inputSampleBuffer:inputPixelBuffer:finalResultHandler:]((uint64_t)a1, a2, a3, 0, v16, v14, *v15, (opaqueCMSampleBuffer *)a5, (__CVBuffer *)a4, a6);
      return;
    }
    goto LABEL_18;
  }
  v14 = 0;
  if (a3) {
    goto LABEL_14;
  }
LABEL_18:
  -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:]((uint64_t)a1, a2, a3, 0, 0, (opaqueCMSampleBuffer *)a5, (__CVBuffer *)a4, a6);
}

- (BOOL)alwaysEmitsOriginalResult
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  configurationMutexQueue = self->_configurationMutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__BWRenderListProcessor_alwaysEmitsOriginalResult__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(configurationMutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_emitProcessedSampleBufferFromRenderList:(uint64_t)a3 result:(int)a4 resultError:(opaqueCMSampleBuffer *)cf inputSampleBuffer:(__CVBuffer *)a6 processedPixelBuffer:(uint64_t)a7 finalResultHandler:
{
  if (a1)
  {
    CFTypeRef cfa = 0;
    if ((a3 & 3) != 0)
    {
      if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(cf, a6, (CFTypeRef *)(a1 + 40), (CMSampleBufferRef *)&cfa)&& cfa)
      {
LABEL_5:
        if (a7) {
          (*(void (**)(uint64_t, uint64_t))(a7 + 16))(a7, a3);
        }
        if (!a6) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else
    {
      if (cf) {
        CFTypeRef v10 = CFRetain(cf);
      }
      else {
        CFTypeRef v10 = 0;
      }
      CFTypeRef cfa = v10;
      if (v10) {
        goto LABEL_5;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!a6)
    {
LABEL_9:
      if (cfa) {
        CFRelease(cfa);
      }
      return;
    }
LABEL_8:
    CFRelease(a6);
    goto LABEL_9;
  }
}

- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3 usingRenderList:(id)a4
{
  if ([a4 affectsMetadata])
  {
    if (a3) {
      CFRetain(a3);
    }
    id v5 = a4;
    for (i = *(void **)[a4 rendererList]; i; i = (void *)*i)
    {
      id v7 = (void *)i[1];
      if ([v7 adjustsMetadata]) {
        [v7 adjustMetadataOfSampleBuffer:a3];
      }
    }
    if (a3) {
      CFRelease(a3);
    }
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  mostRecentFormatDescription = self->_mostRecentFormatDescription;
  if (mostRecentFormatDescription) {
    CFRelease(mostRecentFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWRenderListProcessor;
  [(BWRenderListProcessor *)&v4 dealloc];
}

- (void)setAlwaysEmitsOriginalResult:(BOOL)a3
{
  configurationMutexQueue = self->_configurationMutexQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BWRenderListProcessor_setAlwaysEmitsOriginalResult___block_invoke;
  v4[3] = &unk_1E5C24B78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(configurationMutexQueue, v4);
}

uint64_t __54__BWRenderListProcessor_setAlwaysEmitsOriginalResult___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (void)processRenderList:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 resultHandler:(id)a6
{
}

- (void)_continueRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(uint64_t)a5 resultError:(uint64_t *)a6 fromRendererNode:(uint64_t *)a7 parameterNode:(opaqueCMSampleBuffer *)a8 inputSampleBuffer:(__CVBuffer *)a9 inputPixelBuffer:(uint64_t)a10 finalResultHandler:
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a1 && a6 && a7 && a9)
  {
    v17 = (__CVBuffer *)[*(id *)(a1 + 24) newPixelBuffer];
    if (v17)
    {
      v18 = v17;
      CVBufferPropagateAttachments(a9, v17);
      int v19 = [a2 shouldAllowOriginalRenderFromNode:a6];
      if (v19)
      {
        char v25 = v19;
        v20 = (__CVBuffer *)[*(id *)(a1 + 24) newPixelBuffer];
        if (v20) {
          CVBufferPropagateAttachments(a9, v20);
        }
        LOBYTE(v19) = v25;
      }
      else
      {
        v20 = 0;
      }
      uint64_t v23 = *a6;
      uint64_t v24 = *a7;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3052000000;
      v29[3] = __Block_byref_object_copy__34;
      v29[4] = __Block_byref_object_dispose__34;
      v29[5] = a1;
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __185__BWRenderListProcessor__continueRenderingUsingRenderList_parameterListProvider_result_resultError_fromRendererNode_parameterNode_inputSampleBuffer_inputPixelBuffer_finalResultHandler___block_invoke;
      v26[3] = &unk_1E5C2B000;
      char v27 = v19;
      v26[4] = a1;
      v26[5] = a2;
      v26[10] = v20;
      v26[11] = a8;
      v26[12] = v18;
      v26[13] = a9;
      v26[14] = a4;
      v26[15] = v23;
      v26[8] = v28;
      v26[9] = v29;
      v26[6] = a3;
      v26[7] = a10;
      v26[16] = v24;
      [(id)a6[1] renderUsingParameters:a7[1] inputPixelBuffer:a9 inputSampleBuffer:a8 originalPixelBuffer:v20 processedPixelBuffer:v18 completionHandler:v26];
      _Block_object_dispose(v28, 8);
      _Block_object_dispose(v29, 8);
    }
    else
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"Failed to allocate pixel buffer for processed render";
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](a1, a2, a3, 0, [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-12786 userInfo:v22], a8, a9, a10);
    }
  }
}

- (void)waitForAllProcessingToComplete
{
}

void __185__BWRenderListProcessor__continueRenderingUsingRenderList_parameterListProvider_result_resultError_fromRendererNode_parameterNode_inputSampleBuffer_inputPixelBuffer_finalResultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(__CVBuffer **)(a1 + 80);
  if (v8 && (a2 & 1) != 0 && *(unsigned char *)(a1 + 136)) {
    -[BWRenderListProcessor _emitProcessedSampleBufferFromRenderList:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](*(void *)(a1 + 32), a2, 1, a3, *(opaqueCMSampleBuffer **)(a1 + 88), v8, *(void *)(a1 + 56));
  }
  uint64_t v9 = 96;
  if ((a2 & 2) != 0) {
    uint64_t v10 = 96;
  }
  else {
    uint64_t v10 = 104;
  }
  v11 = *(__CVBuffer **)(a1 + v10);
  if ((a2 & 2) != 0) {
    uint64_t v9 = 104;
  }
  id v12 = *(const void **)(a1 + v9);
  if (v12) {
    CFRelease(v12);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(a1 + 112) | a2;
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (a3 || (uint64_t v17 = *(void *)(a1 + 120)) == 0)
  {
    v18 = *(opaqueCMSampleBuffer **)(a1 + 88);
    uint64_t v19 = *(void *)(a1 + 56);
    -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](v13, v14, v15, v16, a3, v18, v11, v19);
  }
  else
  {
    -[BWRenderListProcessor _continueRenderingUsingRenderList:parameterListProvider:result:resultError:fromRendererNode:parameterNode:inputSampleBuffer:inputPixelBuffer:finalResultHandler:](v13, v14, v15, v16, a5, v17, *(void *)(a1 + 128), *(void *)(a1 + 88), v11, *(void *)(a1 + 56));
  }
}

+ (id)filterRendererResultToString:(unint64_t)a3
{
  char v3 = @"Passthrough";
  if (a3 == 1) {
    char v3 = @"Original";
  }
  if (a3 == 2) {
    return @"Processed";
  }
  else {
    return v3;
  }
}

- (BWPixelBufferPool)renderingPool
{
  return self->_renderingPool;
}

@end