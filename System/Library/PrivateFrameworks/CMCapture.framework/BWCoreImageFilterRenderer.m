@interface BWCoreImageFilterRenderer
+ (id)context:(BOOL)a3 deferredPhotoProcessorEnabled:(BOOL)a4 err:(int *)a5;
+ (void)_prewarmCoreImagePortraitFilterV1;
+ (void)initialize;
+ (void)prewarmCoreImageSDOFRenderingFilter;
+ (void)prewarmPortraitFilterVersion:(unsigned int)a3 semanticStyleFilters:(BOOL)a4;
- (BOOL)adjustsMetadata;
- (BOOL)supportsAnimation;
- (BOOL)usingDepth;
- (CIContext)renderingQueueContext;
- (NSString)displayName;
- (id)initForRenderingWithDepth:(BOOL)a3 context:(id)a4 portraitRenderQuality:(int)a5 hairnetEnabled:(BOOL)a6 metalCommandQueue:(id)a7 figThreadPriority:(unsigned int)a8;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (void)_renderUsingParameters:(const void *)a3 inputPixelBuffer:(const void *)a4 inputSampleBuffer:(const void *)a5 originalPixelBuffer:(const void *)a6 processedPixelBuffer:(char)a7 prewarming:(uint64_t)a8 completionHandler:;
- (void)_visionKitFaceObservationToCoreImageDictionary:(uint64_t)a3 orientation:;
- (void)coreImageArrayRepresentationForRegion:(uint64_t)a1;
- (void)dealloc;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
- (void)setRenderingQueueContext:(id)a3;
@end

@implementation BWCoreImageFilterRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)prewarmCoreImageSDOFRenderingFilter
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1E018];
  v9[0] = *MEMORY[0x1E4F1E248];
  uint64_t v3 = [NSNumber numberWithInt:*MEMORY[0x1E4F1E300]];
  uint64_t v4 = *MEMORY[0x1E4F1E1E0];
  v10[0] = v3;
  v10[1] = MEMORY[0x1E4F1CC28];
  uint64_t v5 = *MEMORY[0x1E4F1E230];
  v9[1] = v4;
  v9[2] = v5;
  v10[2] = MEMORY[0x1E4F1CC38];
  v6 = objc_msgSend(v2, "contextWithOptions:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  [v6 loadArchiveWithName:@"ccportrait_archive", objc_msgSend(BWLoadProcessorBundle(@"CCPortrait", 0xFFFFFFFFLL), "bundleURL") fromURL];
  v7 = (void *)[MEMORY[0x1E4F1E040] filterWithName:@"CIDepthBlurEffect"];
  if (v7)
  {
    [v7 performSelector:NSSelectorFromString(&cfstr_Prewarm.isa) withObject:v6];
    Class v8 = NSClassFromString(&cfstr_Espressowrappe.isa);
    [(objc_class *)v8 performSelector:NSSelectorFromString(&cfstr_Clearcache.isa)];
  }
}

+ (void)prewarmPortraitFilterVersion:(unsigned int)a3 semanticStyleFilters:(BOOL)a4
{
  if (a4) {
    [MEMORY[0x1E4F1E018] loadArchive:*MEMORY[0x1E4F1E528]];
  }
  if (MGGetBoolAnswer())
  {
    if (a3 == 2)
    {
      SEL v5 = NSSelectorFromString(&cfstr_Prewarm.isa);
      v6 = (void *)[MEMORY[0x1E4F1E040] filterWithName:@"CIPortraitEffectLightV2"];
      if (objc_opt_respondsToSelector())
      {
        [v6 performSelector:v5 withObject:0];
      }
    }
    else if (a3 == 1)
    {
      +[BWCoreImageFilterRenderer _prewarmCoreImagePortraitFilterV1]();
    }
  }
}

+ (void)_prewarmCoreImagePortraitFilterV1
{
  v48[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  v1 = (void *)MEMORY[0x1A6272C70](v0);
  v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CFTypeRef cf = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CVPixelBufferRef v35 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CMSampleBufferRef v33 = 0;
  CVPixelBufferRef imageBuffer = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v3 = *MEMORY[0x1E4F24D20];
  v47[0] = *MEMORY[0x1E4F24CB0];
  v47[1] = v3;
  v48[0] = &unk_1EFB00EF0;
  v48[1] = MEMORY[0x1E4F1CC08];
  v47[2] = *MEMORY[0x1E4F24E10];
  v48[2] = [NSNumber numberWithInt:1024];
  v47[3] = *MEMORY[0x1E4F24D08];
  v48[3] = [NSNumber numberWithInt:768];
  v47[4] = *MEMORY[0x1E4F24D70];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:875704422];
  v47[5] = *MEMORY[0x1E4F24A10];
  uint64_t v5 = *MEMORY[0x1E4F24A28];
  v48[4] = v4;
  v48[5] = v5;
  CFDictionaryRef v6 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:6];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x400uLL, 0x300uLL, 0x34323066u, v6, &pixelBufferOut)) {
    goto LABEL_39;
  }
  CFDictionaryRef v8 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:3];
  CVBufferSetAttachments(pixelBufferOut, v8, kCVAttachmentMode_ShouldPropagate);
  if (CMVideoFormatDescriptionCreateForImageBuffer(v7, pixelBufferOut, &formatDescriptionOut)) {
    goto LABEL_39;
  }
  if (CVPixelBufferCreate(v7, 0x280uLL, 0x1E0uLL, 0x68646973u, 0, &imageBuffer)) {
    goto LABEL_39;
  }
  if (CVPixelBufferCreate(v7, 0x280uLL, 0x1E0uLL, 0x4C303038u, 0, &v35)) {
    goto LABEL_39;
  }
  *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
  long long v25 = *(_OWORD *)&sampleTiming.duration.value;
  sampleTiming.duration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CMTimeEpoch epoch = sampleTiming.duration.epoch;
  CMTimeMake(&sampleTiming.presentationTimeStamp, 0x858A8CD5B3FDLL, 1000000000);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v25;
  sampleTiming.decodeTimeStamp.CMTimeEpoch epoch = epoch;
  if (CMSampleBufferCreateForImageBuffer(v7, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut))
  {
    goto LABEL_39;
  }
  CMSetAttachment(sampleBufferOut, @"PortraitStillImageFaceAdjustedBlurMap", v35, 1u);
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F55B40];
  uint64_t v11 = *MEMORY[0x1E4F55860];
  uint64_t v44 = *MEMORY[0x1E4F55860];
  v45 = &unk_1EFB00F08;
  CMSetAttachment(sampleBufferOut, v10, (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1], 1u);
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  }
  if (CMVideoFormatDescriptionCreateForImageBuffer(v7, imageBuffer, &formatDescriptionOut)
    || CMSampleBufferCreateForImageBuffer(v7, imageBuffer, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &v33))
  {
    goto LABEL_39;
  }
  BWSampleBufferSetAttachedMedia(sampleBufferOut, @"Depth", (uint64_t)v33);
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  }
  v43 = &unk_1EFB07218;
  CMSetAttachment(sampleBufferOut, @"PortraitFacesLandmarksArrayForPrewarm", (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1], 1u);
  if (BWCMSampleBufferCreateCopyIncludingMetadata(sampleBufferOut, (CMSampleBufferRef *)&cf))
  {
LABEL_39:
    FigDebugAssert3();
  }
  else
  {
    context = v1;
    uint64_t v41 = v11;
    v42 = &unk_1EFB00F38;
    CMSetAttachment(cf, v10, (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1], 1u);
    v12 = dispatch_group_create();
    id v13 = [[BWCoreImageFilterRenderer alloc] initForRenderingWithDepth:1 context:0 portraitRenderQuality:0 hairnetEnabled:0 metalCommandQueue:0 figThreadPriority:14];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = [&unk_1EFB03EC0 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(&unk_1EFB03EC0);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1A6272C70]();
          dispatch_group_enter(v12);
          uint64_t v20 = [MEMORY[0x1E4F1E040] filterWithName:v18];
          if (v20)
          {
            uint64_t v21 = v20;
            v22 = [BWCoreImageFilterRendererParameters alloc];
            uint64_t v39 = v21;
            v23 = -[BWCoreImageFilterRendererParameters initWithFilters:originalOutputFilter:](v22, "initWithFilters:originalOutputFilter:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1], 0);
            [v13 prepareForRenderingWithParameters:v23 inputVideoFormat:0 inputMediaPropertiesByAttachedMediaKey:0];
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke;
            v27[3] = &unk_1E5C29F48;
            v27[4] = v12;
            -[BWCoreImageFilterRenderer _renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:prewarming:completionHandler:]((uint64_t)v13, (uint64_t)v23, pixelBufferOut, sampleBufferOut, 0, pixelBufferOut, 1, (uint64_t)v27);
            dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
            dispatch_group_enter(v12);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke_2;
            v26[3] = &unk_1E5C29F48;
            v26[4] = v12;
            -[BWCoreImageFilterRenderer _renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:prewarming:completionHandler:]((uint64_t)v13, (uint64_t)v23, pixelBufferOut, cf, 0, pixelBufferOut, 1, (uint64_t)v26);
            dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
          }
        }
        uint64_t v15 = [&unk_1EFB03EC0 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v15);
    }

    if (v33) {
      CFRelease(v33);
    }
    v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (imageBuffer) {
      CFRelease(imageBuffer);
    }
    if (v35) {
      CFRelease(v35);
    }
    v1 = context;
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
    if (sampleBufferOut) {
      CFRelease(sampleBufferOut);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  if (*v2 == 1) {
    kdebug_trace();
  }
}

void __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke(uint64_t a1)
{
}

- (void)_renderUsingParameters:(const void *)a3 inputPixelBuffer:(const void *)a4 inputSampleBuffer:(const void *)a5 originalPixelBuffer:(const void *)a6 processedPixelBuffer:(char)a7 prewarming:(uint64_t)a8 completionHandler:
{
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a3) {
        CFRetain(a3);
      }
      if (a4) {
        CFRetain(a4);
      }
      if (a5) {
        CFRetain(a5);
      }
      if (a6) {
        CFRetain(a6);
      }
      uint64_t v16 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke;
      block[3] = &unk_1E5C29F98;
      block[4] = a1;
      block[5] = a2;
      block[6] = a8;
      block[7] = a3;
      char v18 = a7;
      block[8] = a4;
      block[9] = a5;
      block[10] = a6;
      dispatch_async(v16, block);
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

void __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke_2(uint64_t a1)
{
}

+ (id)context:(BOOL)a3 deferredPhotoProcessorEnabled:(BOOL)a4 err:(int *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v20[4] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (v6) {
    uint64_t v9 = 350;
  }
  else {
    uint64_t v9 = 64;
  }
  CFStringRef v10 = (unsigned int *)MEMORY[0x1E4F1E2F0];
  if (v7) {
    CFStringRef v10 = (unsigned int *)MEMORY[0x1E4F1E300];
  }
  uint64_t v11 = *v10;
  v19[0] = *MEMORY[0x1E4F1E248];
  uint64_t v12 = [NSNumber numberWithInt:v11];
  uint64_t v13 = *MEMORY[0x1E4F1E1E0];
  v20[0] = v12;
  v20[1] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = *MEMORY[0x1E4F1E200];
  v19[1] = v13;
  v19[2] = v14;
  v20[2] = [NSNumber numberWithInt:v9];
  v19[3] = *MEMORY[0x1E4F1E1F8];
  v20[3] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  uint64_t v16 = (void *)[MEMORY[0x1E4F1E018] contextWithOptions:v15];
  if (v16) {
    int v17 = 0;
  }
  else {
    int v17 = -12786;
  }
  if (a5) {
    *a5 = v17;
  }
  if (*v8 == 1) {
    kdebug_trace();
  }
  return v16;
}

- (id)initForRenderingWithDepth:(BOOL)a3 context:(id)a4 portraitRenderQuality:(int)a5 hairnetEnabled:(BOOL)a6 metalCommandQueue:(id)a7 figThreadPriority:(unsigned int)a8
{
  v17.receiver = self;
  v17.super_class = (Class)BWCoreImageFilterRenderer;
  uint64_t v13 = [(BWCoreImageFilterRenderer *)&v17 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_metalCommandQueue = (MTLCommandQueue *)a7;
    v13->_usingDepth = a3;
    v13->_renderingQueueContext = (CIContext *)a4;
    v14->_portraitRenderQuality = a5;
    float v15 = 1.0;
    if (!a5) {
      float v15 = 0.0;
    }
    v14->_inputRenderQuality = v15;
    v14->_renderingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v14->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.callback.core-image", 0);
    v14->_hairnetEnabled = a6;
  }
  return v14;
}

- (void)dealloc
{
  renderingQueue = self->_renderingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BWCoreImageFilterRenderer_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(renderingQueue, block);

  self->_renderingQueue = 0;
  self->_callbackQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)BWCoreImageFilterRenderer;
  [(BWCoreImageFilterRenderer *)&v4 dealloc];
}

void __36__BWCoreImageFilterRenderer_dealloc__block_invoke(uint64_t a1)
{
}

- (signed)type
{
  return 4;
}

- (NSString)displayName
{
  return (NSString *)@"Core Image Renderer";
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  renderingQueue = self->_renderingQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__BWCoreImageFilterRenderer_prepareForRenderingWithParameters_inputVideoFormat_inputMediaPropertiesByAttachedMediaKey___block_invoke;
  void v9[3] = &unk_1E5C24F58;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(renderingQueue, v9);
  LODWORD(a4) = [a3 prepareForRenderingWithInputVideoFormat:a4];
  *((_DWORD *)v11 + 6) = a4;
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __119__BWCoreImageFilterRenderer_prepareForRenderingWithParameters_inputVideoFormat_inputMediaPropertiesByAttachedMediaKey___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 40))
  {
    uint64_t v2 = result;
    id v3 = +[BWCoreImageFilterRenderer context:*(unsigned __int8 *)(v1 + 8) deferredPhotoProcessorEnabled:0 err:*(void *)(*(void *)(result + 40) + 8) + 24];
    objc_super v4 = *(void **)(v2 + 32);
    return [v4 setRenderingQueueContext:v3];
  }
  return result;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
}

void __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke(uint64_t a1)
{
  v176[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) renderingQueueContext];
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v3)
  {
    objc_super v4 = (void *)[v3 commandBuffer];
    [v4 commit];
    [v4 waitUntilCompleted];
  }
  obuint64_t j = (id)[*(id *)(a1 + 40) filters];
  if (![obj count])
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      float v15 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_2;
      block[3] = &unk_1E5C28920;
      block[4] = v14;
      void block[5] = 0;
      dispatch_async(v15, block);
    }
    return;
  }
  uint64_t v115 = *MEMORY[0x1E4F1E378];
  uint64_t v175 = *MEMORY[0x1E4F1E378];
  v176[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:&v175 count:1];
  BOOL v6 = (void *)[MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:*(void *)(a1 + 56) options:v5];
  BOOL v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if ([*(id *)(a1 + 40) requiresDepthMap])
  {
    CFDictionaryRef v8 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E4F55B40], 0);
    CFTypeRef v9 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), @"PortraitStillImageAuxDepthMetadata", 0);
    if (!v9 || (AuxiliaryImagePropertiesFromDepthMetadata = (void *)CFRetain(v9)) == 0) {
      AuxiliaryImagePropertiesFromDepthMetadata = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v8);
    }
    CFTypeRef v114 = AuxiliaryImagePropertiesFromDepthMetadata;
    CFTypeRef v99 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), @"PortraitStillImageFaceAdjustedBlurMap", 0);
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), 0x1EFA4EB60);
    if (AttachedMedia)
    {
      uint64_t v12 = AttachedMedia;
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
      int v13 = (void *)CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), @"StillSettings", 0), "captureSettings"), "captureFlags");
      CFTypeRef cf = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v13);
    }
    else
    {
      CVImageBufferRef ImageBuffer = 0;
      CFTypeRef cf = 0;
    }
    int HasDetectedFaces = BWSampleBufferHasDetectedFaces(*(const void **)(a1 + 64), 0, 0, 1, 1, 1);
    unsigned int v17 = HasDetectedFaces | BWSampleBufferHasDetectedHumanBodies(*(const void **)(a1 + 64));
    char v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), @"Depth");
    if (v18) {
      CVImageBufferRef v94 = CMSampleBufferGetImageBuffer(v18);
    }
    else {
      CVImageBufferRef v94 = 0;
    }
    v19 = *(const void **)(a1 + 64);
    if (v17)
    {
      uint64_t v20 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v19, 0x1EFA74420);
      if (v20) {
        CVImageBufferRef v120 = CMSampleBufferGetImageBuffer(v20);
      }
      else {
        CVImageBufferRef v120 = 0;
      }
      v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), @"PersonSemanticsHair");
      if (v22) {
        CVImageBufferRef v119 = CMSampleBufferGetImageBuffer(v22);
      }
      else {
        CVImageBufferRef v119 = 0;
      }
      v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), @"PersonSemanticsSkin");
      if (v23) {
        CVImageBufferRef v118 = CMSampleBufferGetImageBuffer(v23);
      }
      else {
        CVImageBufferRef v118 = 0;
      }
      v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), @"PersonSemanticsTeeth");
      if (v24) {
        CVImageBufferRef v117 = CMSampleBufferGetImageBuffer(v24);
      }
      else {
        CVImageBufferRef v117 = 0;
      }
      long long v25 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), @"PersonSemanticsGlasses");
      if (v25) {
        CVImageBufferRef v116 = CMSampleBufferGetImageBuffer(v25);
      }
      else {
        CVImageBufferRef v116 = 0;
      }
    }
    else if (BWInferenceGetAttachedInference(v19, 801, 0x1EFA6A0A0) && !dword_1EB4C54F0)
    {
      CVImageBufferRef v116 = 0;
      CVImageBufferRef v117 = 0;
      CVImageBufferRef v118 = 0;
      CVImageBufferRef v119 = 0;
      CVImageBufferRef v120 = 0;
    }
    else
    {
      int v147 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CVImageBufferRef v116 = 0;
      CVImageBufferRef v117 = 0;
      CVImageBufferRef v118 = 0;
      CVImageBufferRef v119 = 0;
      CVImageBufferRef v120 = 0;
    }
    uint64_t v122 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F55AB8], v91, v92);
  }
  else
  {
    CFTypeRef cf = 0;
    uint64_t v122 = 0;
    CVImageBufferRef v116 = 0;
    CVImageBufferRef v117 = 0;
    CVImageBufferRef v118 = 0;
    CVImageBufferRef v119 = 0;
    CVImageBufferRef v120 = 0;
    CVImageBufferRef v94 = 0;
    CVImageBufferRef ImageBuffer = 0;
    CFTypeRef v99 = 0;
    CFTypeRef v114 = 0;
    CFDictionaryRef v8 = 0;
  }
  v93 = (void *)v2;
  if (*v7 == 1)
  {
    kdebug_trace();
    if (*v7 == 1) {
      kdebug_trace();
    }
  }
  v100 = v8;
  if (![*(id *)(a1 + 40) requiresFaceLandmarks]) {
    goto LABEL_56;
  }
  AttachedInference = (void *)BWInferenceGetAttachedInference(*(const void **)(a1 + 64), 801, 0x1EFA6A0A0);
  if ([AttachedInference count])
  {
    v123 = (void *)[MEMORY[0x1E4F1CA48] array];
    v27 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E4F53070], 0);
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    uint64_t v28 = [AttachedInference countByEnumeratingWithState:&v142 objects:v172 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v143;
      uint64_t v31 = *MEMORY[0x1E4F53248];
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v143 != v30) {
            objc_enumerationMutation(AttachedInference);
          }
          objc_msgSend(v123, "addObject:", -[BWCoreImageFilterRenderer _visionKitFaceObservationToCoreImageDictionary:orientation:](*(void *)(a1 + 32), *(void **)(*((void *)&v142 + 1) + 8 * i), objc_msgSend(v27, "objectForKeyedSubscript:", v31)));
        }
        uint64_t v29 = [AttachedInference countByEnumeratingWithState:&v142 objects:v172 count:16];
      }
      while (v29);
      BOOL v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      CFDictionaryRef v8 = v100;
    }
    goto LABEL_57;
  }
  if (*(unsigned char *)(a1 + 88)) {
    v123 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), @"PortraitFacesLandmarksArrayForPrewarm", 0);
  }
  else {
LABEL_56:
  }
    v123 = 0;
LABEL_57:
  if (*v7 == 1)
  {
    kdebug_trace();
    if (*v7 == 1) {
      kdebug_trace();
    }
  }
  CMSampleBufferRef v33 = (void *)[MEMORY[0x1E4F1CA48] array];
  v174[0] = 0;
  uint64_t v126 = [*(id *)(a1 + 40) originalOutputFilter];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  uint64_t v34 = [obj countByEnumeratingWithState:&v138 objects:v171 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = 0;
    uint64_t v104 = 0;
    uint64_t v105 = 0;
    uint64_t v102 = 0;
    uint64_t v103 = 0;
    uint64_t v106 = 0;
    uint64_t v107 = 0;
    uint64_t v101 = 0;
    uint64_t v113 = 0;
    uint64_t v124 = *MEMORY[0x1E4F1E480];
    uint64_t v125 = *(void *)v139;
    uint64_t v97 = *MEMORY[0x1E4F1E390];
    uint64_t v95 = *MEMORY[0x1E4F2F380];
    uint64_t v96 = *MEMORY[0x1E4F1E3C8];
    CFStringRef v112 = (const __CFString *)*MEMORY[0x1E4F55BF0];
    uint64_t v110 = *MEMORY[0x1E4F558B8];
    uint64_t v111 = *MEMORY[0x1E4F55860];
    uint64_t v108 = *MEMORY[0x1E4F55798];
    uint64_t v109 = *MEMORY[0x1E4F1E4F0];
    while (1)
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v139 != v125) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v138 + 1) + 8 * j);
        [v38 setValue:v6 forKey:v124];
        [v33 addObject:v124];
        uint64_t v39 = (void *)[v38 inputKeys];
        if ([*(id *)(a1 + 40) requiresDepthMap])
        {
          int v40 = [*(id *)(a1 + 40) depthTypeForFilter:v38];
          if (v40 == 1)
          {
            if (!v106)
            {
              uint64_t v165 = v115;
              uint64_t v166 = MEMORY[0x1E4F1CC38];
              uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v99, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1));
              uint64_t v43 = v42;
              uint64_t v41 = @"inputDepthMap";
              goto LABEL_79;
            }
            uint64_t v41 = @"inputDepthMap";
          }
          else
          {
            if (v40 != 2)
            {
              if (v40 == 3)
              {
                if (v106)
                {
                  uint64_t v41 = @"inputBlurMap";
                  goto LABEL_80;
                }
                uint64_t v169 = v115;
                uint64_t v170 = MEMORY[0x1E4F1CC38];
                uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v99, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1));
                uint64_t v43 = v42;
                uint64_t v41 = @"inputBlurMap";
LABEL_79:
                uint64_t v106 = v42;
                if (v43) {
                  goto LABEL_80;
                }
              }
LABEL_81:
              if ([v39 containsObject:@"inputGainMap"])
              {
                CGMutableImageMetadataRef Mutable = cf;
                if (!cf) {
                  CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
                }
                CFTypeRef cf = Mutable;
                uint64_t v45 = v113;
                if (!v113)
                {
                  v46 = (void *)MEMORY[0x1E4F1E050];
                  v164[0] = MEMORY[0x1E4F1CC38];
                  v163[0] = v115;
                  v163[1] = v97;
                  v164[1] = [MEMORY[0x1E4F1CA98] null];
                  v163[2] = v96;
                  uint64_t v161 = v95;
                  v162 = cf;
                  v164[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
                  CFDictionaryRef v8 = v100;
                  uint64_t v45 = objc_msgSend(v46, "imageWithCVPixelBuffer:options:", ImageBuffer, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v164, v163, 3));
                }
                uint64_t v113 = v45;
                [v38 setValue:v45 forKey:@"inputGainMap"];
                [v33 addObject:@"inputGainMap"];
              }
              if (v120
                && (([v39 containsObject:@"inputMatte"] & 1) != 0
                 || [v39 containsObject:@"inputMatteImage"]))
              {
                uint64_t v47 = v107;
                if (!v107)
                {
                  uint64_t v159 = v115;
                  uint64_t v160 = MEMORY[0x1E4F1CC38];
                  uint64_t v47 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v120, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1));
                }
                v48 = @"inputMatte";
                if (![v39 containsObject:@"inputMatte"]) {
                  v48 = @"inputMatteImage";
                }
                uint64_t v107 = v47;
                [v38 setValue:v47 forKey:v48];
                [v33 addObject:v48];
              }
              if (v119 && [v39 containsObject:@"inputHairMask"])
              {
                uint64_t v49 = v102;
                if (!v102)
                {
                  uint64_t v157 = v115;
                  uint64_t v158 = MEMORY[0x1E4F1CC38];
                  uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v119, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1));
                }
                uint64_t v102 = v49;
                [v38 setValue:v49 forKey:@"inputHairMask"];
                [v33 addObject:@"inputHairMask"];
              }
              v50 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), @"StillSettings", 0), "requestedSettings"), "processedImageFilters");
              if (BWCIFilterArrayContainsPortraitEffectStageFilters(v50, 0)
                && [v39 containsObject:@"inputBestHairQuality"])
              {
                [v38 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputBestHairQuality"];
                [v33 addObject:@"inputBestHairQuality"];
              }
              if (v118 && [v39 containsObject:@"inputFaceMask"])
              {
                uint64_t v51 = v103;
                if (!v103)
                {
                  uint64_t v155 = v115;
                  uint64_t v156 = MEMORY[0x1E4F1CC38];
                  uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v118, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1));
                }
                uint64_t v103 = v51;
                [v38 setValue:v51 forKey:@"inputFaceMask"];
                [v33 addObject:@"inputFaceMask"];
              }
              if (v117 && [v39 containsObject:@"inputTeethMask"])
              {
                uint64_t v52 = v104;
                if (!v104)
                {
                  uint64_t v153 = v115;
                  uint64_t v154 = MEMORY[0x1E4F1CC38];
                  uint64_t v52 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v117, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
                }
                uint64_t v104 = v52;
                [v38 setValue:v52 forKey:@"inputTeethMask"];
                [v33 addObject:@"inputTeethMask"];
              }
              if (v116 && [v39 containsObject:@"inputGlassesMask"])
              {
                uint64_t v53 = v105;
                if (!v105)
                {
                  uint64_t v151 = v115;
                  uint64_t v152 = MEMORY[0x1E4F1CC38];
                  uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v116, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
                }
                uint64_t v105 = v53;
                [v38 setValue:v53 forKey:@"inputTeethMask"];
                [v33 addObject:@"inputTeethMask"];
              }
              if (v122 && [v39 containsObject:@"inputStrength"])
              {
                [v38 setValue:v122 forKey:@"inputStrength"];
                [v33 addObject:@"inputStrength"];
              }
              CFTypeRef v54 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), v112, 0);
              if ([v39 containsObject:@"inputLumaNoiseScale"])
              {
                if (v54) {
                  v55 = (void *)v54;
                }
                else {
                  v55 = &unk_1EFB059A8;
                }
                [v38 setValue:v55 forKey:@"inputLumaNoiseScale"];
                [v33 addObject:@"inputLumaNoiseScale"];
              }
              goto LABEL_126;
            }
            if (v101)
            {
              uint64_t v41 = @"inputDisparity";
              goto LABEL_80;
            }
            uint64_t v167 = v115;
            uint64_t v168 = MEMORY[0x1E4F1CC38];
            uint64_t v41 = @"inputDisparity";
            uint64_t v101 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", v94, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1));
            if (!v101) {
              goto LABEL_81;
            }
          }
LABEL_80:
          objc_msgSend(v38, "setValue:forKey:");
          [v33 addObject:v41];
          goto LABEL_81;
        }
LABEL_126:
        if ([v39 containsObject:@"inputFaceLandmarkArray"])
        {
          objc_msgSend(NSString, "stringWithFormat:", @"face landmarks (%lu faces)", objc_msgSend(v123, "count"));
          [v38 setValue:v123 forKey:@"inputFaceLandmarkArray"];
          [v33 addObject:@"inputFaceLandmarkArray"];
        }
        if ([v39 containsObject:@"inputUseAbsoluteDisparity"])
        {
          BOOL v56 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v111), "intValue") == 1;
          BOOL v57 = v56;
          v58 = "relative";
          if (v56) {
            v58 = "absolute";
          }
          objc_msgSend(NSString, "stringWithFormat:", @"%s disparity", v58);
          objc_msgSend(v38, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v57), @"inputUseAbsoluteDisparity");
          [v33 addObject:@"inputUseAbsoluteDisparity"];
        }
        if ([v39 containsObject:@"inputDepthDataScore"])
        {
          uint64_t v59 = [v8 objectForKeyedSubscript:v110];
          if (v59)
          {
            uint64_t v60 = v59;
            [NSString stringWithFormat:@"portrait score %@", v59];
            [v38 setValue:v60 forKey:@"inputDepthDataScore"];
            [v33 addObject:@"inputDepthDataScore"];
          }
        }
        if ([v39 containsObject:@"inputFocalLengthNormalized"])
        {
          v173[0] = 0.0;
          FigDepthComputeNormalizedFocalLength(v8, v173);
          [NSString stringWithFormat:@"normalized focal length %.2f", v173[0]];
          *(float *)&double v61 = v173[0];
          objc_msgSend(v38, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v61), @"inputFocalLengthNormalized");
          [v33 addObject:@"inputFocalLengthNormalized"];
        }
        if (*(_DWORD *)(*(void *)(a1 + 32) + 12) == 2)
        {
          [NSString stringWithFormat:@"input scale %.2f", 0x3FE0000000000000];
          LODWORD(v62) = 0.5;
          objc_msgSend(v38, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v62), v109);
          [v33 addObject:v109];
        }
        if ([v39 containsObject:@"inputAperture"])
        {
          objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v108), "floatValue");
          float v64 = v63;
          [NSString stringWithFormat:@"input aperture %.2f", v63];
          *(float *)&double v65 = v64;
          objc_msgSend(v38, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v65), @"inputAperture");
          [v33 addObject:@"inputAperture"];
        }
        if ([v39 containsObject:@"inputRenderProxy"])
        {
          [NSString stringWithFormat:@"input render quality %.2f", *(float *)(*(void *)(a1 + 32) + 16)];
          LODWORD(v66) = *(_DWORD *)(*(void *)(a1 + 32) + 16);
          objc_msgSend(v38, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v66), @"inputRenderProxy");
          [v33 addObject:@"inputRenderProxy"];
        }
        if ([v39 containsObject:@"inputAuxDataMetadata"])
        {
          [v38 setValue:v114 forKey:@"inputAuxDataMetadata"];
          [v33 addObject:@"inputAuxDataMetadata"];
        }
        uint64_t v67 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v67 + 56))
        {
          int v68 = *(_DWORD *)(v67 + 12);
          if ([v39 containsObject:@"inputGenerateSpillMatte"] && !v68)
          {
            [v38 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputGenerateSpillMatte"];
            [v33 addObject:@"inputGenerateSpillMatte"];
          }
        }
        else
        {
          [v39 containsObject:@"inputGenerateSpillMatte"];
        }
        uint64_t v69 = [v38 outputImage];
        BOOL v6 = (void *)v69;
        if ((void *)v126 == v38) {
          uint64_t v36 = v69;
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v138 objects:v171 count:16];
      if (!v35) {
        goto LABEL_156;
      }
    }
  }
  BOOL v6 = 0;
  uint64_t v36 = 0;
LABEL_156:
  v70 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    kdebug_trace();
    if (*v70 == 1) {
      kdebug_trace();
    }
  }
  uint64_t v71 = 0;
  if (*(void *)(a1 + 72) && v36)
  {
    objc_msgSend(v93, "render:toCVPixelBuffer:", v36);
    uint64_t v71 = 1;
  }
  if (*(void *)(a1 + 80) && v6)
  {
    v72 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:*(void *)(a1 + 80)];
    if (*(unsigned char *)(a1 + 88))
    {
      [v6 extent];
      objc_msgSend(v93, "prepareRender:fromRect:toDestination:atPoint:error:", v6, v72, v174);
    }
    else
    {
      double Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 80));
      v74 = objc_msgSend(v93, "startTaskToRender:fromRect:toDestination:atPoint:error:", v6, v72, v174, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 80)), 0.0, 0.0);
      if (!v174[0]) {
        [v74 waitUntilCompletedAndReturnError:v174];
      }
    }

    v71 |= 2uLL;
  }
  uint64_t v127 = v71;
  if (*v70 == 1)
  {
    kdebug_trace();
    if (*v70 == 1) {
      kdebug_trace();
    }
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v135 = 0u;
  long long v134 = 0u;
  uint64_t v75 = [obj countByEnumeratingWithState:&v134 objects:v150 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v135;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v135 != v77) {
          objc_enumerationMutation(obj);
        }
        v79 = *(void **)(*((void *)&v134 + 1) + 8 * k);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        uint64_t v80 = [v33 countByEnumeratingWithState:&v130 objects:v149 count:16];
        if (v80)
        {
          uint64_t v81 = v80;
          uint64_t v82 = *(void *)v131;
          do
          {
            for (uint64_t m = 0; m != v81; ++m)
            {
              if (*(void *)v131 != v82) {
                objc_enumerationMutation(v33);
              }
              uint64_t v84 = *(void *)(*((void *)&v130 + 1) + 8 * m);
              if (objc_msgSend((id)objc_msgSend(v79, "inputKeys"), "containsObject:", v84)) {
                [v79 setValue:0 forKey:v84];
              }
            }
            uint64_t v81 = [v33 countByEnumeratingWithState:&v130 objects:v149 count:16];
          }
          while (v81);
        }
      }
      uint64_t v76 = [obj countByEnumeratingWithState:&v134 objects:v150 count:16];
    }
    while (v76);
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v85 = *(void *)(a1 + 48);
  if (v85)
  {
    v86 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_1142;
    v129[3] = &unk_1E5C29F70;
    v129[5] = v85;
    v129[6] = v127;
    v129[4] = v174[0];
    dispatch_async(v86, v129);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v114) {
    CFRelease(v114);
  }
  v87 = *(const void **)(a1 + 56);
  if (v87) {
    CFRelease(v87);
  }
  v88 = *(const void **)(a1 + 64);
  if (v88) {
    CFRelease(v88);
  }
  v89 = *(const void **)(a1 + 72);
  if (v89) {
    CFRelease(v89);
  }
  v90 = *(const void **)(a1 + 80);
  if (v90) {
    CFRelease(v90);
  }
}

uint64_t __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (void)_visionKitFaceObservationToCoreImageDictionary:(uint64_t)a3 orientation:
{
  if (!a1) {
    return 0;
  }
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  [a2 boundingBox];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  CGMutableImageMetadataRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t valuePtr = v8;
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, @"x", v16);
  CFRelease(v16);
  uint64_t valuePtr = v10;
  CFNumberRef v17 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, @"y", v17);
  CFRelease(v17);
  uint64_t valuePtr = v12;
  CFNumberRef v18 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, @"w", v18);
  CFRelease(v18);
  uint64_t valuePtr = v14;
  CFNumberRef v19 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, @"h", v19);
  CFRelease(v19);
  [v6 setObject:Mutable forKeyedSubscript:@"faceBoundingBox"];

  [v6 setObject:a3 forKeyedSubscript:@"orientation"];
  uint64_t v20 = NSNumber;
  [a2 faceJunkinessIndex];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v20, "numberWithFloat:"), @"faceJunkinessIndex");
  uint64_t v21 = NSNumber;
  [a2 faceOrientationIndex];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v21, "numberWithFloat:"), @"faceOrientationIndex");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "yaw"), @"yaw");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "roll"), @"roll");
  v22 = (void *)[a2 landmarks];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "allPoints")), @"allPoints");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "faceContour")), @"faceContour");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "leftEye")), @"leftEye");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "rightEye")), @"rightEye");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "leftEyebrow")), @"leftEyebrow");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "rightEyebrow")), @"rightEyebrow");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "nose")), @"nose");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "noseCrest")), @"noseCrest");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "medianLine")), @"medianLips");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "outerLips")), @"outerLips");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "innerLips")), @"innerLips");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "leftPupil")), @"leftPupil");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, objc_msgSend(v22, "rightPupil")), @"rightPupil");
  return v6;
}

uint64_t __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_1142(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (void)coreImageArrayRepresentationForRegion:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2 || (uint64_t v3 = [a2 pointCount], v4 = objc_msgSend(a2, "normalizedPoints"), !v3) || (v5 = v4) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  uint64_t v7 = (uint64_t *)(v5 + 8);
  uint64_t v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  uint64_t v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  do
  {
    uint64_t v10 = *(v7 - 1);
    uint64_t v11 = *v7;
    CGMutableImageMetadataRef Mutable = CFDictionaryCreateMutable(0, 0, v8, v9);
    uint64_t valuePtr = v10;
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, @"x", v13);
    CFRelease(v13);
    uint64_t valuePtr = v11;
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, @"y", v14);
    CFRelease(v14);
    [v6 addObject:Mutable];

    v7 += 2;
    --v3;
  }
  while (v3);
  return v6;
}

- (CIContext)renderingQueueContext
{
  return self->_renderingQueueContext;
}

- (void)setRenderingQueueContext:(id)a3
{
}

- (BOOL)usingDepth
{
  return self->_usingDepth;
}

@end