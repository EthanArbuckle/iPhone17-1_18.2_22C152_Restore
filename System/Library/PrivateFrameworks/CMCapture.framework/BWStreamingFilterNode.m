@interface BWStreamingFilterNode
+ (void)initialize;
- (BOOL)attachesInputPixelBufferAfterRendering;
- (BOOL)isDepthDataDeliveryEnabled;
- (BOOL)isDepthFromMonocularNetworkEnabled;
- (BOOL)isFocusBlurMapDeliveryEnabled;
- (BOOL)isMetadataProcessingEnabled;
- (BOOL)isPortraitAutoSuggestEnabled;
- (BOOL)isRenderingSemanticStyle;
- (BOOL)isRenderingSemanticStyleSet;
- (BOOL)isSemanticStyleRenderingEnabled;
- (BOOL)isSemanticStyleRenderingSuspended;
- (BOOL)isStreamingSegmentationFromInferenceEngine;
- (BOOL)primaryStreamingPersonSegmentationEnabled;
- (BOOL)secondaryStreamingPersonSegmentationEnabled;
- (BOOL)stageRenderingEnabled;
- (BOOL)studioAndContourRenderingEnabled;
- (BWColorLookupCache)colorLookupCache;
- (BWStreamingFilterNode)initWithCaptureDevice:(id)a3 maxLossyCompressionLevel:(int)a4 semanticStyleRenderingEnabled:(BOOL)a5 cinematicVideoEnabled:(BOOL)a6 smartStyleRenderingEnabled:(BOOL)a7 portraitPreviewForegroundBlurEnabled:(BOOL)a8 depthFilterRenderingIsAfterPreviewStitcher:(BOOL)a9 metalCommandQueue:(id)a10 priority:(unsigned int)a11 mirroredForMetadataAdjustment:(BOOL)a12 rotationDegreesForMetadataAdjustment:(int)a13;
- (CGRect)_hasOverCaptureRegionsWithSampleBuffer:(CGRect *)result;
- (FigCaptureSemanticStyle)semanticStyle;
- (NSArray)filters;
- (const)_buildAndChangeToFiltersWithAnimation:(const os_unfair_lock *)result;
- (const)_changeToFilters:(uint64_t)a3 animation:;
- (const)_shouldRenderSemanticStyle;
- (float)_cubeStrengthForOffset:(uint64_t)a1;
- (float)portraitLightingEffectStrength;
- (float)simulatedAperture;
- (id)nodeSubType;
- (id)nodeType;
- (id)provideApplySmartStyleRenderer;
- (id)provideColorLookupCache;
- (id)provideCoreImageFilterRenderer;
- (id)provideMetalFilterRenderer;
- (id)provideStillImageCoreImageBlurMapRenderer;
- (id)provideStillImageMetalBlurMapRenderer;
- (id)provideStillImageMetalSDOFRenderer;
- (id)provideStreamingSDOFFilterRenderer;
- (int)semanticStyleSceneType;
- (uint64_t)_adjustRectanglesFromFiltersAndRegionArray:(CMAttachmentBearerRef)target withSampleBuffer:;
- (uint64_t)_hasDepthEffect:(uint64_t)result;
- (uint64_t)_hasMonochromeEffect:(uint64_t)result;
- (uint64_t)_skipMonochromeDepthAnimation:(uint64_t)result;
- (void)_applyQueuedSemanticStyle:(uint64_t)a1;
- (void)_rebuildSemanticStyleFiltersWithSceneType:(uint64_t)a1;
- (void)_updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:(const os_unfair_lock *)a1;
- (void)changeToFilters:(id)a3 animated:(BOOL)a4;
- (void)changeToFilters:(id)a3 semanticStyle:(id)a4 animated:(BOOL)a5;
- (void)changeToSemanticStyle:(id)a3 animated:(BOOL)a4;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)filterDetectedFacesInSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)prepareForRenderingWithPreparedPixelBufferPool;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)semanticStyleSceneTypeDidChange:(int)a3;
- (void)setAttachesInputPixelBufferAfterRendering:(BOOL)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDepthFromMonocularNetworkEnabled:(BOOL)a3;
- (void)setFocusBlurMapDeliveryEnabled:(BOOL)a3;
- (void)setMetadataProcessingEnabled:(BOOL)a3;
- (void)setPortraitAutoSuggestEnabled:(BOOL)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setPrimaryStreamingPersonSegmentationEnabled:(BOOL)a3;
- (void)setSecondaryStreamingPersonSegmentationEnabled:(BOOL)a3;
- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4;
- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4;
- (void)setSimulatedAperture:(float)a3;
- (void)setStageRenderingEnabled:(BOOL)a3;
- (void)setStreamingSegmentationFromInferenceEngine:(BOOL)a3;
- (void)setStudioAndContourRenderingEnabled:(BOOL)a3;
@end

@implementation BWStreamingFilterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    if (self) {
      id v9 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:0];
    }
    else {
      id v9 = 0;
    }
    [v9 setFormat:a3];
  }
  else if (([a5 isEqualToString:@"Depth"] & 1) == 0 {
         && ([a5 isEqualToString:0x1EFA744A0] & 1) == 0
  }
         && ([a5 isEqualToString:0x1EFA744C0] & 1) == 0
         && ([a5 isEqualToString:0x1EFA74460] & 1) == 0
         && ([a5 isEqualToString:0x1EFA74480] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)BWStreamingFilterNode;
    [(BWNode *)&v10 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self)
  {
    self = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:0];
    uint64_t v5 = vars8;
  }
  [(BWStreamingFilterNode *)self makeConfiguredFormatLive];
}

- (void)prepareForRenderingWithPreparedPixelBufferPool
{
  if (!self->_renderListProcessor) {
    self->_renderListProcessor = [[BWRenderListProcessor alloc] initWithRenderingPool:[(BWNodeOutputMediaProperties *)[(BWNodeOutput *)self->super._output primaryMediaProperties] preparedPixelBufferPool]];
  }
}

- (void)changeToSemanticStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (!self->_semanticStyleRenderingEnabled) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ is not configured for semantic style rendering", self), 0 reason userInfo]);
  }

  self->_semanticStyle = (FigCaptureSemanticStyle *)a3;
  self->_semanticStyleFiltersAndRegionArray = 0;
  self->_renderingSemanticStyleSet = 0;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v4);
  os_unfair_lock_unlock(p_filterChangeLock);
}

void __52__BWStreamingFilterNode__changeToFilters_animation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 prepareWithInputVideoFormat:*(void *)(a1 + 40) inputMediaPropertiesByAttachedMediaKey:*(void *)(a1 + 48)];
  }
  else {
    [*(id *)(a1 + 56) prepareWithParameters:0 forInputVideoFormat:*(void *)(a1 + 40) inputMediaPropertiesByAttachedMediaKey:*(void *)(a1 + 48)];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 64) + 112));
  v3 = *(void **)(a1 + 64);
  if (v3[17] == *(void *)(a1 + 72))
  {
    v7 = (void *)v3[19];
  }
  else
  {
    uint64_t v4 = v3[18];
    if (v4 == [*(id *)(a1 + 32) finalRenderList])
    {
      v6 = *(void **)(a1 + 64);
    }
    else
    {
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5 || (v6 = *(void **)(a1 + 64), v6[17] == v6[18]))
      {

        goto LABEL_13;
      }
    }
    v7 = (void *)v6[19];
  }

  *(void *)(*(void *)(a1 + 64) + 152) = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 64) + 136) = *(void *)(a1 + 56);
LABEL_13:
  v8 = (os_unfair_lock_s *)(*(void *)(a1 + 64) + 112);
  os_unfair_lock_unlock(v8);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (!a3) {
    goto LABEL_78;
  }
  uint64_t v5 = a3;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    goto LABEL_78;
  }
  CVImageBufferRef v8 = ImageBuffer;
  memset(&v37, 0, sizeof(v37));
  CFDictionaryRef v9 = (const __CFDictionary *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  CMTimeMakeFromDictionary(&v37, v9);
  if ((v37.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&time, v5);
    CMTime v37 = time;
  }
  unsigned int v10 = self->_receivedFrameCounter + 1;
  self->_receivedFrameCounter = v10;
  self->_shouldLogPerFrameLogging = v10 % self->_perFrameLoggingRatio == 0;
  if (*v4 == 1)
  {
    CMTime time = v37;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CMTime time = v37;
  CMTime time2 = (CMTime)self->_lastRenderedPTS;
  if ((CMTimeCompare(&time, &time2) & 0x80000000) == 0)
  {
    self->_lastRenderedPTS = ($95D729B680665BEAEFA1D6FCA8238556)v37;
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (!self->_depthDataDeliveryEnabled) {
      goto LABEL_35;
    }
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, @"Depth");
    if (!AttachedMedia) {
      goto LABEL_82;
    }
    v13 = AttachedMedia;
    CVImageBufferRef v14 = CMSampleBufferGetImageBuffer(AttachedMedia);
    int v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542C0]), "BOOLValue");
    self->_receivedOccludedFixedPointDisparityBuffer = v15;
    if (v15 && self->_shouldLogPerFrameLogging && dword_1EB4C5150)
    {
      int v36 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    }
    if (!v14)
    {
LABEL_82:
      if ([(BWFigVideoCaptureDevice *)self->_captureDevice shallowDepthOfFieldEffectEnabled])
      {
        os_unfair_lock_lock(&self->_lastSampleBufferLock);
        lastSampleBuffer = self->_lastSampleBuffer;
        if (lastSampleBuffer)
        {
          CFTypeRef v17 = CFRetain(lastSampleBuffer);
          os_unfair_lock_unlock(&self->_lastSampleBufferLock);
          if (v17)
          {
            v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v17, @"Depth");
            uint64_t v19 = (uint64_t)v18;
            if (v18) {
              CVImageBufferRef v14 = CMSampleBufferGetImageBuffer(v18);
            }
            else {
              CVImageBufferRef v14 = 0;
            }
            BWSampleBufferSetAttachedMedia(v5, @"Depth", v19);
            CFRelease(v17);
            goto LABEL_27;
          }
        }
        else
        {
          os_unfair_lock_unlock(&self->_lastSampleBufferLock);
        }
      }
      v11 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      if (!self->_receivedInitialFixedPointDisparityBuffer) {
        goto LABEL_35;
      }
      BOOL v20 = 0;
LABEL_31:
      if (*((unsigned char *)&self->super.super.isa + v11[510])) {
        goto LABEL_35;
      }
      if (self->_portraitAutoSuggestEnabled) {
        BOOL v20 = 1;
      }
      if (v20) {
        goto LABEL_35;
      }
LABEL_78:
      FigDebugAssert3();
      goto LABEL_71;
    }
LABEL_27:
    BOOL v20 = v14 != 0;
    if (!self->_receivedInitialFixedPointDisparityBuffer && v14)
    {
      self->_receivedInitialFixedPointDisparityBuffer = 1;
      v11 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      goto LABEL_35;
    }
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (!self->_receivedInitialFixedPointDisparityBuffer)
    {
LABEL_35:
      if (!self->_semanticStyleRenderingEnabled)
      {
        BOOL v23 = 0;
LABEL_61:
        CMSetAttachment(v5, @"StructuredLightRecentlyOccluded", (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)&self->super.super.isa + v11[510]), v29), 1u);
        os_unfair_lock_lock(&self->_renderListLock);
        if ([(BWRenderList *)self->_nextRenderList isPrepared])
        {

          self->_currentAnimator = self->_nextAnimator;
          self->_currentRenderList = self->_nextRenderList;
          self->_nextAnimator = 0;
          self->_nextRenderList = 0;
        }
        v24 = self->_currentAnimator;
        v25 = self->_currentRenderList;
        os_unfair_lock_unlock(&self->_renderListLock);
        if (v24)
        {
          uint64_t v26 = [(BWRenderListAnimator *)v24 interpolateParameters];
          if ([(BWRenderListAnimator *)v24 isCompleted])
          {
            os_unfair_lock_lock(&self->_renderListLock);
            if (!self->_nextAnimator && !self->_nextRenderList)
            {
              self->_nextAnimator = 0;
              self->_nextRenderList = [(BWRenderListAnimator *)v24 finalRenderList];
            }
            os_unfair_lock_unlock(&self->_renderListLock);
          }
        }
        else
        {
          uint64_t v26 = 0;
        }
        id v27 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:0];
        renderListProcessor = self->_renderListProcessor;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __53__BWStreamingFilterNode_renderSampleBuffer_forInput___block_invoke;
        v32[3] = &unk_1E5C25870;
        v32[5] = v27;
        v32[6] = v5;
        v32[4] = self;
        BOOL v33 = v23;
        [(BWRenderListProcessor *)renderListProcessor processRenderList:v25 withParameters:v26 inputPixelBuffer:v8 inputSampleBuffer:v5 resultHandler:v32];

LABEL_71:
        if (*v4 != 1) {
          return;
        }
        goto LABEL_72;
      }
      if (*v4 == 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v34, v5);
        CMTime time = v34;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      os_unfair_lock_lock(&self->_lastSampleBufferLock);
      time.value = 0;
      BWCMSampleBufferCreateCopyIncludingMetadata(v5, (CMSampleBufferRef *)&time);
      v21 = self->_lastSampleBuffer;
      value = (const void *)time.value;
      BOOL v23 = v21 == v5;
      if (v21 == v5)
      {
        if (!time.value)
        {
          uint64_t v5 = 0;
          goto LABEL_49;
        }
        uint64_t v5 = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)time.value);
      }
      else
      {
        self->_lastSampleBuffer = (opaqueCMSampleBuffer *)time.value;
        if (value) {
          CFRetain(value);
        }
        if (v21) {
          CFRelease(v21);
        }
      }
      if (time.value) {
        CFRelease((CFTypeRef)time.value);
      }
LABEL_49:
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
      if (self->_streamingSegmentationFromInferenceEngine && !self->_maskVisualizationEnabled)
      {
        if (!self->_haveSeenFirstSampleBuffer)
        {
          if (!BWSampleBufferGetAttachedMedia(v5, 0x1EFA74460))
          {
            self->_applyStyleBackgroundToEntireFrame = 1;
            goto LABEL_77;
          }
LABEL_75:
          self->_haveSeenFirstSampleBuffer = 1;
          goto LABEL_56;
        }
        if (self->_applyStyleBackgroundToEntireFrame)
        {
          if (BWSampleBufferGetAttachedMedia(v5, 0x1EFA74460))
          {
            self->_applyStyleBackgroundToEntireFrame = 0;
LABEL_77:
            self->_haveSeenFirstSampleBuffer = 1;
            [(BWStreamingFilterNode *)self semanticStyleSceneType];
            -[BWStreamingFilterNode _rebuildSemanticStyleFiltersWithSceneType:]((uint64_t)self);
LABEL_56:
            -[BWStreamingFilterNode _applyQueuedSemanticStyle:]((uint64_t)self, v5);
            os_unfair_lock_lock(&self->_filterChangeLock);
            if (self->_renderingSemanticStyleSet && BWSampleBufferGetAttachedMedia(v5, 0x1EFA74680)) {
              BWSampleBufferRemoveAttachedMedia(v5, 0x1EFA74680);
            }
            os_unfair_lock_unlock(&self->_filterChangeLock);
            if (*v4 == 1) {
              kdebug_trace();
            }
            goto LABEL_61;
          }
          goto LABEL_75;
        }
      }
      self->_haveSeenFirstSampleBuffer = 1;
      goto LABEL_56;
    }
    goto LABEL_31;
  }
  if (*v4 != 1) {
    return;
  }
LABEL_72:
  kdebug_trace();
}

- (void)_applyQueuedSemanticStyle:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x1A6272C70]();
    uint64_t v5 = [*(id *)(a1 + 216) dequeueFencedAnimation];
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));

      *(void *)(a1 + 280) = (id)[(id)v5 semanticStyleSet];
      id v6 = (id)[(id)v5 fencePortSendRight];
      uint64_t v5 = [(id)v5 fencePortGenerationCount];
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        [*(id *)(a1 + 216) count];
        [*(id *)(a1 + 280) leftmostRegionStartXOffset];
        [v6 port];
        kdebug_trace();
      }
      -[BWStreamingFilterNode _updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:]((const os_unfair_lock *)a1, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
    }
    else
    {
      id v6 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if (*(void *)(a1 + 272))
    {
      CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
      if (v7)
      {
        memset(&v9, 0, sizeof(v9));
        CGRectMakeWithDictionaryRepresentation(v7, &v9);
        if (!CGRectEqualToRect(*(CGRect *)(a1 + 288), v9))
        {
          CGSize size = v9.size;
          *(CGPoint *)(a1 + 288) = v9.origin;
          *(CGSize *)(a1 + 304) = size;
          -[BWStreamingFilterNode _adjustRectanglesFromFiltersAndRegionArray:withSampleBuffer:](a1, *(void **)(a1 + 272), a2);
        }
      }
      CMSetAttachment(a2, @"FiltersAndRegionArray", *(CFTypeRef *)(a1 + 272), 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    if (v6)
    {
      CMSetAttachment(a2, @"CAContextFencePortSendRight", v6, 1u);
    }
    if (v5 >= 1) {
      CMSetAttachment(a2, @"CAContextFencePortGenerationID", (CFTypeRef)[NSNumber numberWithLongLong:v5], 1u);
    }
  }
}

void __53__BWStreamingFilterNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, char a2, CMAttachmentBearerRef target, uint64_t a4)
{
  if ((a2 & 2) != 0 && !a4)
  {
    CMSetAttachment(target, @"FiltersApplied", MEMORY[0x1E4F1CC38], 1u);
    CFDictionaryRef v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8])
    {
      memset(&v12, 0, sizeof(v12));
      CFDictionaryRef v8 = (const __CFDictionary *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E4F530C0], 0);
      CMTimeMakeFromDictionary(&v12, v8);
      if ((v12.flags & 1) == 0)
      {
        CMSampleBufferGetPresentationTimeStamp(&time, *(CMSampleBufferRef *)(a1 + 48));
        CMTime v12 = time;
      }
      if (*v7 == 1)
      {
        CMTime time = v12;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
    }
    if ([*(id *)(a1 + 32) attachesInputPixelBufferAfterRendering])
    {
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 48));
      if (!ImageBuffer)
      {
LABEL_20:
        FigDebugAssert3();
        int v10 = 0;
        goto LABEL_13;
      }
      CMSetAttachment(target, @"UnfilteredPixelBuffer", ImageBuffer, 1u);
    }
  }
  if (!target) {
    goto LABEL_20;
  }
  int v10 = 1;
LABEL_13:
  BWSampleBufferRemoveAttachedMedia(target, @"Depth");
  BWSampleBufferRemoveAttachedMedia(target, 0x1EFA74460);
  BWSampleBufferRemoveAttachedMedia(target, 0x1EFA744A0);
  BWSampleBufferRemoveAttachedMedia(target, 0x1EFA74480);
  BWSampleBufferRemoveAttachedMedia(target, 0x1EFA744C0);
  if (!a4 && v10) {
    [*(id *)(a1 + 40) emitSampleBuffer:target];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v11 = *(const void **)(a1 + 48);
    if (v11) {
      CFRelease(v11);
    }
  }
}

- (int)semanticStyleSceneType
{
  v2 = self;
  p_semanticStyleSceneLock = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  LODWORD(v2) = v2->_semanticStyleSceneType;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
  return (int)v2;
}

- (void)_rebuildSemanticStyleFiltersWithSceneType:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 272))
    {
      v2 = &OBJC_IVAR___BWStreamingFilterNode__semanticStyleSetLock;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
      -[BWStreamingFilterNode _updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:]((const os_unfair_lock *)a1, 0);
    }
    else
    {
      v2 = &OBJC_IVAR___BWStreamingFilterNode__filterChangeLock;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
      -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)a1, 2);
    }
    v3 = (os_unfair_lock_s *)(a1 + *v2);
    os_unfair_lock_unlock(v3);
  }
}

- (void)filterDetectedFacesInSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  p_renderListLock = &self->_renderListLock;
  os_unfair_lock_lock(&self->_renderListLock);
  id v6 = self->_currentRenderList;
  os_unfair_lock_unlock(p_renderListLock);
  [(BWRenderListProcessor *)self->_renderListProcessor adjustMetadataOfSampleBuffer:a3 usingRenderList:v6];
}

- (void)setStudioAndContourRenderingEnabled:(BOOL)a3
{
  self->_studioAndContourRenderingEnabled = a3;
}

- (void)setStageRenderingEnabled:(BOOL)a3
{
  self->_stageRenderingEnabled = a3;
}

- (void)setSecondaryStreamingPersonSegmentationEnabled:(BOOL)a3
{
  self->_secondaryStreamingPersonSegmentationEnabled = a3;
}

- (void)setPrimaryStreamingPersonSegmentationEnabled:(BOOL)a3
{
  self->_primaryStreamingPersonSegmentationEnabled = a3;
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  self->_portraitAutoSuggestEnabled = a3;
}

- (void)setMetadataProcessingEnabled:(BOOL)a3
{
  self->_metadataProcessingEnabled = a3;
}

- (void)setFocusBlurMapDeliveryEnabled:(BOOL)a3
{
  self->_focusBlurMapDeliveryEnabled = a3;
}

- (void)setDepthFromMonocularNetworkEnabled:(BOOL)a3
{
  self->_depthFromMonocularNetworkEnabled = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v5 setPassthroughMode:0];
    [(BWNodeInputMediaConfiguration *)v5 setDelayedBufferCount:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(BWNodeInput *)self->super._input setMediaConfiguration:v5 forAttachedMediaKey:@"Depth"];
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setAttachesInputPixelBufferAfterRendering:(BOOL)a3
{
  self->_attachesInputPixelBufferAfterRendering = a3;
}

- (void)changeToFilters:(id)a3 semanticStyle:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  semanticStyle = self->_semanticStyle;
  if (semanticStyle != a4
    && ![(FigCaptureSemanticStyle *)semanticStyle isEqual:a4]
    && !self->_semanticStyleRenderingEnabled)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ is not configured for semantic style rendering", self), 0 reason userInfo]);
  }

  self->_filters = (NSArray *)a3;
  self->_semanticStyle = (FigCaptureSemanticStyle *)a4;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v5);
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (const)_buildAndChangeToFiltersWithAnimation:(const os_unfair_lock *)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    os_unfair_lock_assert_owner(result + 40);
    CVImageBufferRef v14 = (void *)[MEMORY[0x1E4F1CA48] array];
    v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (!LOBYTE(v2[67]._os_unfair_lock_opaque))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v4 = *(void **)&v2[42]._os_unfair_lock_opaque;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            NSClassFromString(&cfstr_Cideptheffect.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(&cfstr_Ciportraiteffe_8.isa);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                NSClassFromString(&cfstr_Ciportraiteffe_9.isa);
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
            [v3 addObject:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v6);
      }
    }
    objc_msgSend(*(id *)&v2[108]._os_unfair_lock_opaque, "setShallowDepthOfFieldEffectEnabled:", objc_msgSend(v3, "count") != 0);
    if (-[BWStreamingFilterNode _shouldRenderSemanticStyle](v2)
      && (uint64_t v10 = *(void *)&v2[48]._os_unfair_lock_opaque) != 0)
    {
      v11 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)&v2[42]._os_unfair_lock_opaque];
      [v11 removeObjectsInArray:v3];
      uint64_t v12 = (uint64_t)v14;
      objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(*(id *)&v2[90]._os_unfair_lock_opaque, "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v10, v2[52]._os_unfair_lock_opaque, BYTE1(v2[24]._os_unfair_lock_opaque), LOBYTE(v2[93]._os_unfair_lock_opaque), HIBYTE(v2[26]._os_unfair_lock_opaque), v11));
      [v14 addObjectsFromArray:v3];
      uint64_t v13 = a2;
    }
    else
    {
      uint64_t v12 = (uint64_t)v14;
      uint64_t v13 = a2;
      if (*(void *)&v2[42]._os_unfair_lock_opaque) {
        objc_msgSend(v14, "addObjectsFromArray:");
      }
    }
    return -[BWStreamingFilterNode _changeToFilters:animation:](v2, v12, v13);
  }
  return result;
}

- (const)_shouldRenderSemanticStyle
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 40);
    if (LOBYTE(v1[50]._os_unfair_lock_opaque))
    {
      return 0;
    }
    else if (LOBYTE(v1[67]._os_unfair_lock_opaque))
    {
      return (const os_unfair_lock *)1;
    }
    else
    {
      return (const os_unfair_lock *)([*(id *)&v1[48]._os_unfair_lock_opaque isIdentity] ^ 1);
    }
  }
  return result;
}

- (const)_changeToFilters:(uint64_t)a3 animation:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_assert_owner(result + 40);
    uint64_t v6 = [[BWRenderList alloc] initWithResourceProvider:v5 originalFilters:0 processedFilters:a2 optimizationStrategy:4 * LOBYTE(v5[46]._os_unfair_lock_opaque) stillImageSettings:0];
    uint64_t v7 = v6;
    *(void *)&v5[36]._os_unfair_lock_opaque = v6;
    if (a3 && [(BWRenderList *)v6 supportsAnimation])
    {
      os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);
      id v8 = *(id *)&v5[32]._os_unfair_lock_opaque;
      id v9 = *(id *)&v5[30]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
      if (v8)
      {
        uint64_t v10 = [v8 renderList];
        uint64_t v11 = [v8 parameters];
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v10 = (uint64_t)v9;
      }
      if (([v9 supportsAnimation] & 1) != 0 || !v9)
      {
        uint64_t v12 = [[BWRenderListAnimator alloc] initWithInitialParameters:v11 initialRenderList:v10 finalParameters:0 finalRenderList:v7 animation:a3];
        if (v12)
        {

          uint64_t v7 = [(BWRenderListAnimator *)v12 renderList];
        }
      }
      else
      {
        uint64_t v12 = 0;
      }

      if (!LOBYTE(v5[24]._os_unfair_lock_opaque)
        || [(BWRenderList *)v7 isPrepared] && [(BWRenderListAnimator *)v12 isPrepared])
      {
        goto LABEL_19;
      }
LABEL_20:
      os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);
      id v14 = *(id *)&v5[34]._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
      uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)&v5[2]._os_unfair_lock_opaque, "mediaPropertiesForAttachedMediaKey:", @"PrimaryFormat"), "resolvedVideoFormat");
      uint64_t v16 = [*(id *)&v5[2]._os_unfair_lock_opaque mediaPropertiesByAttachedMediaKey];
      long long v17 = *(NSObject **)&v5[106]._os_unfair_lock_opaque;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__BWStreamingFilterNode__changeToFilters_animation___block_invoke;
      v19[3] = &unk_1E5C25898;
      v19[4] = v12;
      v19[5] = v15;
      v19[6] = v16;
      v19[7] = v7;
      v19[8] = v5;
      v19[9] = v14;
      dispatch_async(v17, v19);

      goto LABEL_21;
    }
    if (LOBYTE(v5[24]._os_unfair_lock_opaque))
    {
      uint64_t v12 = 0;
      if (![(BWRenderList *)v7 isPrepared]) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_19:
    os_unfair_lock_lock((os_unfair_lock_t)&v5[28]);

    *(void *)&v5[38]._os_unfair_lock_opaque = v12;
    *(void *)&v5[34]._os_unfair_lock_opaque = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)&v5[28]);
LABEL_21:
    LODWORD(v13) = v5[96];
    [*(id *)&v5[94]._os_unfair_lock_opaque setSimulatedAperture:v13];
    LODWORD(v18) = v5[97];
    return (const os_unfair_lock *)[*(id *)&v5[94]._os_unfair_lock_opaque setPortraitLightingEffectStrength:v18];
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  self->_preparedToBecomeLive = 1;
  p_renderListLock = &self->_renderListLock;
  os_unfair_lock_lock(&self->_renderListLock);
  uint64_t v4 = self->_nextRenderList;
  os_unfair_lock_unlock(p_renderListLock);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", @"PrimaryFormat"), "resolvedVideoFormat");
    id v6 = [(BWNodeInput *)self->super._input mediaPropertiesByAttachedMediaKey];
    processorPreparationQueue = self->_processorPreparationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__BWStreamingFilterNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
    block[3] = &unk_1E5C248A0;
    block[4] = v4;
    block[5] = v5;
    block[6] = v6;
    dispatch_sync(processorPreparationQueue, block);
    os_unfair_lock_lock(p_renderListLock);
    if ([(BWRenderList *)self->_nextRenderList isPrepared])
    {

      self->_currentRenderList = v4;
    }
    os_unfair_lock_unlock(p_renderListLock);
  }
  self->_receivedInitialFixedPointDisparityBuffer = 0;
  self->_receivedOccludedFixedPointDisparityBuffer = 0;
  id v8 = (_OWORD *)MEMORY[0x1E4F1FA48];
  self->_lastRenderedPTS.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&self->_lastRenderedPTS.value = *v8;
  v9.receiver = self;
  v9.super_class = (Class)BWStreamingFilterNode;
  [(BWNode *)&v9 prepareForCurrentConfigurationToBecomeLive];
}

uint64_t __67__BWStreamingFilterNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareWithParameters:0 forInputVideoFormat:*(void *)(a1 + 40) inputMediaPropertiesByAttachedMediaKey:*(void *)(a1 + 48)];
}

- (BWStreamingFilterNode)initWithCaptureDevice:(id)a3 maxLossyCompressionLevel:(int)a4 semanticStyleRenderingEnabled:(BOOL)a5 cinematicVideoEnabled:(BOOL)a6 smartStyleRenderingEnabled:(BOOL)a7 portraitPreviewForegroundBlurEnabled:(BOOL)a8 depthFilterRenderingIsAfterPreviewStitcher:(BOOL)a9 metalCommandQueue:(id)a10 priority:(unsigned int)a11 mirroredForMetadataAdjustment:(BOOL)a12 rotationDegreesForMetadataAdjustment:(int)a13
{
  BOOL v15 = a6;
  BOOL v16 = a5;
  v33.receiver = self;
  v33.super_class = (Class)BWStreamingFilterNode;
  long long v19 = [(BWNode *)&v33 init];
  BOOL v20 = v19;
  if (v19)
  {
    v19->_smartStyleRenderingEnabled = a7;
    uint64_t v21 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v19 index:0];
    v20->_cinematicVideoEnabled = v15;
    v20->_metalCommandQueue = (MTLCommandQueue *)a10;
    v20->_priority = a11;
    v20->_depthFilterRenderingIsAfterPreviewStitcher = a9;
    v22 = objc_alloc_init(BWVideoFormatRequirements);
    BOOL v23 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB02DC8];
    v24 = v23;
    if (v15) {
      [v23 addObjectsFromArray:&unk_1EFB02DE0];
    }
    objc_msgSend(v24, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, v15, v15, a4));
    [(BWVideoFormatRequirements *)v22 setSupportedPixelFormats:v24];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v21 primaryMediaConfiguration] setFormatRequirements:v22];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v21 primaryMediaConfiguration] setPassthroughMode:2];
    [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v21 primaryMediaConfiguration] setDelayedBufferCount:1];
    [(BWNode *)v20 addInput:v21];

    v25 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v20];
    uint64_t v26 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v26 setSupportedPixelFormats:v24];
    [(BWNodeOutput *)v25 setFormatRequirements:v26];
    [(BWNodeOutput *)v25 setPassthroughMode:2];
    [(BWNodeOutput *)v25 setIndexOfInputWhichDrivesThisOutput:0];
    [(BWNode *)v20 addOutput:v25];

    v20->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
    v20->_filterChangeLock._os_unfair_lock_opaque = 0;
    v20->_semanticStyleRenderingEnabled = v16;
    v20->_semanticStyleSceneLock._os_unfair_lock_opaque = 0;
    v20->_primaryCaptureRect.origin.x = 0.0;
    v20->_primaryCaptureRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v20->_primaryCaptureRect.CGSize size = _Q0;
    v20->_fullScreenRectangle.origin.x = 0.0;
    v20->_fullScreenRectangle.origin.y = 0.0;
    v20->_fullScreenRectangle.CGSize size = _Q0;
    if (v16)
    {
      v20->_fencedAnimationQueue = [[BWFencedAnimationQueue alloc] initWithQueueSize:1];
      v20->_multipleSemanticStylesEnabled = 1;
    }
    v20->_lastSampleBufferLock._os_unfair_lock_opaque = 0;
    v20->_semanticStyleSetLock._os_unfair_lock_opaque = 0;
    v20->_colorCubeCache = [[BWSemanticStyleColorCubeCache alloc] initWithColorLookupCache:v20->_colorLookupCache];
    v20->_pickerComparisonMaxCubeStrength = 1.25;
    v20->_portraitLightingEffectStrength = NAN;
    v20->_renderListLock._os_unfair_lock_opaque = 0;
    v20->_processorPreparationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v20->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v20->_mixColorCubesInGammaDomain = 1;
    v20->_portraitPreviewForegroundBlurEnabled = a8;
    v20->_perFrameLoggingRatio = 30;
    v20->_mirroredForMetadataAdjustment = a12;
    v20->_rotationDegreesForMetadataAdjustment = a13;
  }
  return v20;
}

- (void)setStreamingSegmentationFromInferenceEngine:(BOOL)a3
{
  if (a3)
  {
    if (self->_primaryStreamingPersonSegmentationEnabled)
    {
      uint64_t v5 = 1;
      if (self->_semanticStyleRenderingEnabled)
      {
        if ([(BWFigVideoCaptureDevice *)self->_captureDevice shallowDepthOfFieldEffectEnabled])
        {
          uint64_t v5 = 2;
        }
        else
        {
          uint64_t v5 = 1;
        }
      }
      [(BWNodeInput *)self->super._input setMediaConfiguration:simpleInputMediaConfigurationWithDelayedBufferCount(v5) forAttachedMediaKey:0x1EFA74460];
      [(BWNodeInput *)self->super._input setMediaConfiguration:simpleInputMediaConfigurationWithDelayedBufferCount(v5) forAttachedMediaKey:0x1EFA744A0];
    }
    if (self->_secondaryStreamingPersonSegmentationEnabled)
    {
      [(BWNodeInput *)self->super._input setMediaConfiguration:simpleInputMediaConfigurationWithDelayedBufferCount(1) forAttachedMediaKey:0x1EFA74480];
      input = self->super._input;
      uint64_t v7 = simpleInputMediaConfigurationWithDelayedBufferCount(1);
      id v8 = input;
LABEL_14:
      [(BWNodeInput *)v8 setMediaConfiguration:v7 forAttachedMediaKey:0x1EFA744C0];
    }
  }
  else
  {
    if (self->_primaryStreamingPersonSegmentationEnabled)
    {
      [(BWNodeInput *)self->super._input setMediaConfiguration:0 forAttachedMediaKey:0x1EFA74460];
      [(BWNodeInput *)self->super._input setMediaConfiguration:0 forAttachedMediaKey:0x1EFA74480];
    }
    if (self->_secondaryStreamingPersonSegmentationEnabled)
    {
      [(BWNodeInput *)self->super._input setMediaConfiguration:0 forAttachedMediaKey:0x1EFA744A0];
      id v8 = self->super._input;
      uint64_t v7 = 0;
      goto LABEL_14;
    }
  }
  self->_streamingSegmentationFromInferenceEngine = a3;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (FigCaptureSemanticStyle)semanticStyle
{
  p_semanticStyleSetLock = &self->_semanticStyleSetLock;
  os_unfair_lock_lock(&self->_semanticStyleSetLock);
  uint64_t v4 = self->_currentSemanticStyleSet;
  os_unfair_lock_unlock(p_semanticStyleSetLock);
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (self->_semanticStyleFiltersAndRegionArray) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    semanticStyle = self->_semanticStyle;
  }
  else {
    semanticStyle = [(FigCaptureSemanticStyleSet *)v4 largestRegionSemanticStyle];
  }
  id v8 = semanticStyle;
  os_unfair_lock_unlock(p_filterChangeLock);

  return v8;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (NSArray)filters
{
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  filters = self->_filters;
  os_unfair_lock_unlock(p_filterChangeLock);
  return filters;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  lastSampleBuffer = self->_lastSampleBuffer;
  if (lastSampleBuffer) {
    CFRelease(lastSampleBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWStreamingFilterNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeSubType
{
  return @"StreamingFilter";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWRenderListProcessor *)self->_renderListProcessor waitForAllProcessingToComplete];
  [(BWFencedAnimationQueue *)self->_fencedAnimationQueue flush];
  os_unfair_lock_lock(&self->_lastSampleBufferLock);
  lastSampleBuffer = self->_lastSampleBuffer;
  if (lastSampleBuffer)
  {
    CFRelease(lastSampleBuffer);
    self->_lastSampleBuffer = 0;
  }
  os_unfair_lock_unlock(&self->_lastSampleBufferLock);
  self->_preparedToBecomeLive = 0;
  id v5 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:0];
  BOOL v6 = FigDispatchQueueCreateWithPriority();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__BWStreamingFilterNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = v5;
  dispatch_async(v6, block);
}

uint64_t __51__BWStreamingFilterNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) markEndOfLiveOutput];
}

- (uint64_t)_hasMonochromeEffect:(uint64_t)result
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(a2);
          }
          NSClassFromString(&cfstr_Ciphotoeffectm.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Ciphotoeffect3.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(&cfstr_Ciphotoeffect3_0.isa);
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
          }
          return 1;
        }
        uint64_t v3 = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        result = 0;
        if (v3) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_hasDepthEffect:(uint64_t)result
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(a2);
          }
          NSClassFromString(&cfstr_Cideptheffect.isa);
          if (objc_opt_isKindOfClass()) {
            return 1;
          }
          ++v5;
        }
        while (v3 != v5);
        result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_skipMonochromeDepthAnimation:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = -[BWStreamingFilterNode _hasMonochromeEffect:](result, *(void **)(result + 168));
    if (result)
    {
      result = -[BWStreamingFilterNode _hasMonochromeEffect:](v3, a2);
      if (result)
      {
        int v4 = -[BWStreamingFilterNode _hasDepthEffect:](v3, *(void **)(v3 + 168));
        return v4 ^ -[BWStreamingFilterNode _hasDepthEffect:](v3, a2);
      }
    }
  }
  return result;
}

- (void)changeToFilters:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (v4) {
    uint64_t v8 = -[BWStreamingFilterNode _skipMonochromeDepthAnimation:]((uint64_t)self, a3) ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }

  self->_filters = (NSArray *)a3;
  -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v8);
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (BOOL)isRenderingSemanticStyle
{
  v2 = self;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  LOBYTE(v2) = -[BWStreamingFilterNode _shouldRenderSemanticStyle]((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_filterChangeLock);
  return (char)v2;
}

- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  if (!self->_semanticStyleRenderingEnabled) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ is not configured for semantic style rendering", self), 0 reason userInfo]);
  }
  if (self->_semanticStyleRenderingSuspended != v5)
  {
    self->_semanticStyleRenderingSuspended = v5;
    if (v4) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 0;
    }
    -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)self, v8);
  }
  os_unfair_lock_unlock(p_filterChangeLock);
}

- (BOOL)isSemanticStyleRenderingSuspended
{
  v2 = self;
  p_filterChangeLock = &self->_filterChangeLock;
  os_unfair_lock_lock(&self->_filterChangeLock);
  LOBYTE(v2) = v2->_semanticStyleRenderingSuspended;
  os_unfair_lock_unlock(p_filterChangeLock);
  return (char)v2;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->_portraitLightingEffectStrength = a3;
}

- (BWColorLookupCache)colorLookupCache
{
  return self->_colorLookupCache;
}

- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  if (self->_multipleSemanticStylesEnabled)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [(BWFencedAnimationQueue *)self->_fencedAnimationQueue count];
      [a3 leftmostRegionStartXOffset];
      [a4 port];
      kdebug_trace();
    }
    [(BWFencedAnimationQueue *)self->_fencedAnimationQueue enqueueFencedAnimation:+[BWSemanticStyleSetFencedAnimationInfo fencedAnimationInfoWithSemanticStyleSet:a3 fencePortSendRight:a4]];
    os_unfair_lock_lock(&self->_lastSampleBufferLock);
    lastSampleBuffer = self->_lastSampleBuffer;
    if (lastSampleBuffer)
    {
      CFTypeRef v8 = CFRetain(lastSampleBuffer);
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
      if (v8)
      {
        id v9 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:v8];
        [(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] consumeMessage:v9 fromOutput:[(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] output]];

        CFRelease(v8);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lastSampleBufferLock);
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend(a3, "largestRegionSemanticStyle", a3, a4);
    [(BWStreamingFilterNode *)self changeToSemanticStyle:v10 animated:0];
  }
}

- (float)_cubeStrengthForOffset:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2 > 1.0) {
    a2 = 1.0;
  }
  float v3 = 0.0;
  if (a2 >= 0.0) {
    float v4 = a2;
  }
  else {
    float v4 = 0.0;
  }
  if ([*(id *)(a1 + 168) count]) {
    return 1.0;
  }
  if (v4 >= 0.05)
  {
    if (v4 >= 0.1)
    {
      if (v4 >= 0.35)
      {
        if (v4 <= 0.65)
        {
          return *(float *)(a1 + 368);
        }
        else
        {
          float v3 = 1.0;
          if (v4 < 0.9) {
            return (float)((float)((float)((float)(1.0 - v4) + -0.1) * (float)(*(float *)(a1 + 368) + -1.0)) * 4.0)
          }
                 + 1.0;
        }
      }
      else
      {
        return (float)((float)((float)(v4 + -0.1) * (float)(*(float *)(a1 + 368) + -1.0)) * 4.0) + 1.0;
      }
    }
    else
    {
      return (float)(v4 + -0.05) / 0.05;
    }
  }
  return v3;
}

- (void)_updateSemanticStyleFiltersAndRegionArrayWithSampleBuffer:(const os_unfair_lock *)a1
{
  v62[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    os_unfair_lock_assert_owner(a1 + 88);
    if (a2)
    {
      CFDictionaryRef v4 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
      if (v4) {
        CGRectMakeWithDictionaryRepresentation(v4, (CGRect *)(v3 + 288));
      }
    }
    BOOL v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "firstObject");
    [*(id *)(v3 + 280) regionAtIndex:0];
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 160));
    *(unsigned char *)(v3 + 268) = 1;
    if (v9 == 1.0 && v7 == 0.0 || !*(void *)(v3 + 120))
    {

      *(void *)(v3 + 192) = v5;
      -[BWStreamingFilterNode _buildAndChangeToFiltersWithAnimation:]((const os_unfair_lock *)v3, 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 160));
    uint64_t v11 = *(void **)(v3 + 280);
    if (v11 && objc_msgSend((id)objc_msgSend(v11, "semanticStyles"), "count"))
    {
      CMAttachmentBearerRef target = a2;
      uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] array];
      [*(id *)(v3 + 280) largestEdgeOffset];
      float v14 = -[BWStreamingFilterNode _cubeStrengthForOffset:](v3, v13);
      BOOL v15 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      BOOL v16 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      long long v17 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      double v18 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      unint64_t v19 = 0x1E4F1C000;
      if (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "count"))
      {
        unint64_t v20 = 0;
        uint64_t v50 = v3;
        do
        {
          uint64_t v51 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "regions"), "objectAtIndexedSubscript:", v20);
          uint64_t v21 = v12;
          uint64_t v22 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 280), "semanticStyles"), "objectAtIndexedSubscript:", v20);
          [*(id *)(v3 + 280) regionAtIndex:v20];
          if (v14 >= 1.0 || v23 < 0.5) {
            float v25 = v14;
          }
          else {
            float v25 = 1.0;
          }
          os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[475]));
          uint64_t v26 = [*(id *)(v3 + v15[484]) filtersForSemanticStyle:v22 sceneType:*(unsigned int *)(v3 + 208) personSegmentationEnabled:*(unsigned __int8 *)(v3 + v16[516]) maskVisualizationEnabled:*(unsigned __int8 *)(v3 + v17[517]) applyStyleBackgroundToEntireFrame:*(unsigned __int8 *)(v3 + 107) filtersToCombine:*(void *)(v3 + v18[499])];
          uint64_t v27 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v26];
          os_unfair_lock_unlock((os_unfair_lock_t)(v3 + v10[475]));
          v28 = v15;
          uint64_t v29 = v16;
          uint64_t v30 = v17;
          v31 = v18;
          v32 = v10;
          objc_super v33 = (void *)MEMORY[0x1E4F1CA60];
          v61[0] = 0x1EFA73DE0;
          v61[1] = 0x1EFA73E00;
          v62[0] = v27;
          uint64_t v12 = v21;
          v62[1] = v51;
          unint64_t v19 = 0x1E4F1C000uLL;
          v61[2] = 0x1EFA73E20;
          *(float *)&double v34 = v25;
          v62[2] = [NSNumber numberWithFloat:v34];
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
          int v36 = v33;
          uint64_t v10 = v32;
          double v18 = v31;
          long long v17 = v30;
          BOOL v16 = v29;
          BOOL v15 = v28;
          uint64_t v3 = v50;
          objc_msgSend(v12, "addObject:", objc_msgSend(v36, "dictionaryWithDictionary:", v35));
          ++v20;
        }
        while (objc_msgSend((id)objc_msgSend(*(id *)(v50 + 280), "semanticStyles"), "count") > v20);
      }
      CMTime v37 = v15;
      v38 = target;
      if (-[BWStreamingFilterNode _hasOverCaptureRegionsWithSampleBuffer:]((CGRect *)v3, target))
      {
        id v52 = +[FigCaptureSemanticStyle identityStyle];
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[475]));
        uint64_t v39 = [*(id *)(v3 + v37[484]) filtersForSemanticStyle:v52 sceneType:*(unsigned int *)(v3 + 208) personSegmentationEnabled:*(unsigned __int8 *)(v3 + v16[516]) maskVisualizationEnabled:*(unsigned __int8 *)(v3 + v17[517]) applyStyleBackgroundToEntireFrame:0 filtersToCombine:*(void *)(v3 + v18[499])];
        uint64_t v40 = (void *)[MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v39];
        uint64_t v53 = 0;
        double v54 = 0.0;
        uint64_t v55 = 0x3FF0000000000000;
        double v56 = *(double *)(v3 + 296);
        uint64_t v41 = [MEMORY[0x1E4F29238] valueWithBytes:&v53 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v42 = v17;
        v43 = v12;
        v44 = (void *)MEMORY[0x1E4F1CA60];
        v59[0] = 0x1EFA73DE0;
        v59[1] = 0x1EFA73E00;
        v60[0] = v40;
        v60[1] = v41;
        uint64_t v45 = [*(id *)(v19 + 2536) dictionaryWithObjects:v60 forKeys:v59 count:2];
        v46 = v44;
        uint64_t v12 = v43;
        objc_msgSend(v43, "addObject:", objc_msgSend(v46, "dictionaryWithDictionary:", v45));
        uint64_t v47 = objc_msgSend(v40, "arrayByAddingObjectsFromArray:", objc_msgSend(*(id *)(v3 + 360), "filtersForSemanticStyle:sceneType:personSegmentationEnabled:maskVisualizationEnabled:applyStyleBackgroundToEntireFrame:filtersToCombine:", v52, *(unsigned int *)(v3 + 208), *(unsigned __int8 *)(v3 + v16[516]), *(unsigned __int8 *)(v3 + v42[517]), 0, *(void *)(v3 + v18[499])));
        os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 160));
        uint64_t v53 = 0;
        double v54 = *(double *)(v3 + 296) + *(double *)(v3 + 312);
        uint64_t v55 = 0x3FF0000000000000;
        double v56 = 1.0 - v54;
        uint64_t v48 = [MEMORY[0x1E4F29238] valueWithBytes:&v53 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v57[0] = 0x1EFA73DE0;
        v57[1] = 0x1EFA73E00;
        uint64_t v10 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        v58[0] = v47;
        v58[1] = v48;
        v38 = target;
        objc_msgSend(v43, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(*(id *)(v19 + 2536), "dictionaryWithObjects:forKeys:count:", v58, v57, 2)));
      }
      -[BWStreamingFilterNode _adjustRectanglesFromFiltersAndRegionArray:withSampleBuffer:](v3, v12, v38);
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + v10[475]));

      *(void *)(v3 + 272) = (id)[MEMORY[0x1E4F1C978] arrayWithArray:v12];
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + v10[475]));
    }
  }
}

- (CGRect)_hasOverCaptureRegionsWithSampleBuffer:(CGRect *)result
{
  if (result)
  {
    if (target) {
      return (CGRect *)(CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530D0], 0) != 0);
    }
    else {
      return (CGRect *)!CGRectEqualToRect(result[9], result[10]);
    }
  }
  return result;
}

- (uint64_t)_adjustRectanglesFromFiltersAndRegionArray:(CMAttachmentBearerRef)target withSampleBuffer:
{
  if (!a1) {
    return 0;
  }
  unsigned int v5 = -[BWStreamingFilterNode _hasOverCaptureRegionsWithSampleBuffer:]((CGRect *)a1, target);
  if (v5) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  unsigned int v7 = [a2 count];
  unsigned int v8 = v7;
  int v9 = v6 | 1;
  uint64_t v10 = v7 - (v6 | 1);
  if (v7 >= (v6 | 1u))
  {
    char v19 = v5;
    unsigned int v11 = v7 - v6;
    if (v7 != v6)
    {
      uint64_t v12 = 0;
      if (v11 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v11;
      }
      do
      {
        long long v22 = 0u;
        long long v23 = 0u;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", 0x1EFA73E00), "getValue:", &v22);
        uint64_t v14 = *(void *)(a1 + 312);
        *((void *)&v22 + 1) = *(void *)(a1 + 296);
        *((void *)&v23 + 1) = v14;
        if (v8 == v9)
        {
          *(void *)&long long v22 = 0;
          *(void *)&long long v23 = 0x3FF0000000000000;
        }
        if (v12)
        {
          if (v10 == v12)
          {
            if (*(double *)&v22 + *(double *)&v23 < 1.0) {
              *(double *)&long long v23 = 1.0 - *(double *)&v22;
            }
            BOOL v15 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", (v10 - 1)), "objectForKeyedSubscript:", 0x1EFA73E00);
            if (v15)
            {
              long long v20 = 0u;
              long long v21 = 0u;
              [v15 getValue:&v20];
              *(double *)&long long v22 = *(double *)&v20 + *(double *)&v21;
              *(double *)&long long v23 = 1.0 - (*(double *)&v20 + *(double *)&v21);
            }
          }
        }
        else
        {
          if (*(double *)&v22 > 0.0)
          {
            *(double *)&long long v23 = *(double *)&v22 + *(double *)&v23;
            *(void *)&long long v22 = 0;
          }
          if (v8 != v9)
          {
            BOOL v16 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", 0x1EFA73E00);
            if (v16)
            {
              long long v20 = 0u;
              long long v21 = 0u;
              [v16 getValue:&v20];
              *(void *)&long long v23 = v20;
            }
          }
        }
        objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v12++), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1EFA73E00);
      }
      while (v13 != v12);
    }
    if (v19)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v8 - 2), "objectForKeyedSubscript:", 0x1EFA73E00), "getValue:", &v22);
      *((void *)&v23 + 1) = *(void *)(a1 + 296);
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v8 - 2), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1EFA73E00);
      uint64_t v17 = v8 - 1;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v17), "objectForKeyedSubscript:", 0x1EFA73E00), "getValue:", &v22);
      *((double *)&v22 + 1) = *(double *)(a1 + 296) + *(double *)(a1 + 312);
      *((double *)&v23 + 1) = 1.0 - *((double *)&v22 + 1);
      objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v17), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"), 0x1EFA73E00);
    }
    return 0;
  }
  return FigSignalErrorAt();
}

- (id)provideStreamingSDOFFilterRenderer
{
  if (self->_cinematicVideoEnabled)
  {
    streamingRaytracingSDOFRenderer = self->_streamingRaytracingSDOFRenderer;
    if (!streamingRaytracingSDOFRenderer)
    {
      streamingRaytracingSDOFRenderer = [[BWStreamingRaytracingSDOFRenderer alloc] initWithCaptureDevice:self->_captureDevice commandQueue:self->_metalCommandQueue smartStyleRenderingEnabled:self->_smartStyleRenderingEnabled];
      self->_streamingRaytracingSDOFRenderer = streamingRaytracingSDOFRenderer;
    }
  }
  else
  {
    streamingRaytracingSDOFRenderer = (BWStreamingRaytracingSDOFRenderer *)self->_streamingCVAFilterRenderer;
    if (!streamingRaytracingSDOFRenderer)
    {
      if (self->_focusBlurMapDeliveryEnabled) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 2 * self->_depthFromMonocularNetworkEnabled;
      }
      unsigned int v5 = [BWStreamingCVAFilterRenderer alloc];
      BYTE4(v9) = self->_secondaryStreamingPersonSegmentationEnabled;
      LODWORD(v9) = self->_rotationDegreesForMetadataAdjustment;
      BYTE4(v8) = self->_mirroredForMetadataAdjustment;
      LODWORD(v8) = self->_priority;
      streamingRaytracingSDOFRenderer = -[BWStreamingCVAFilterRenderer initWithCaptureDevice:studioAndContourRenderingEnabled:stageRenderingEnabled:depthDataSource:foregroundBlurEnabled:depthFilterRenderingIsAfterPreviewStitcher:commandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:secondaryStreamingPersonSegmentationEnabled:](v5, "initWithCaptureDevice:studioAndContourRenderingEnabled:stageRenderingEnabled:depthDataSource:foregroundBlurEnabled:depthFilterRenderingIsAfterPreviewStitcher:commandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:secondaryStreamingPersonSegmentationEnabled:", self->_captureDevice, self->_studioAndContourRenderingEnabled, self->_stageRenderingEnabled, v4, self->_portraitPreviewForegroundBlurEnabled, self->_depthFilterRenderingIsAfterPreviewStitcher, self->_metalCommandQueue, v8, v9);
      self->_streamingCVAFilterRenderer = (BWStreamingCVAFilterRenderer *)streamingRaytracingSDOFRenderer;
    }
  }
  int v6 = streamingRaytracingSDOFRenderer;
  return v6;
}

- (id)provideCoreImageFilterRenderer
{
  id v2 = [[BWCoreImageFilterRenderer alloc] initForRenderingWithDepth:0 context:0 portraitRenderQuality:0 hairnetEnabled:0 metalCommandQueue:0 figThreadPriority:14];
  return v2;
}

- (id)provideStillImageMetalSDOFRenderer
{
  return 0;
}

- (id)provideStillImageMetalBlurMapRenderer
{
  return 0;
}

- (id)provideStillImageCoreImageBlurMapRenderer
{
  return 0;
}

- (id)provideApplySmartStyleRenderer
{
  return 0;
}

- (id)provideMetalFilterRenderer
{
  metalFilterRenderer = self->_metalFilterRenderer;
  if (!metalFilterRenderer
    || (BOOL v4 = [(BWMetalColorCubeRenderer *)metalFilterRenderer mixingColorCubesInGammaDomain], metalFilterRenderer = self->_metalFilterRenderer, self->_mixColorCubesInGammaDomain != v4))
  {

    metalFilterRenderer = [[BWMetalColorCubeRenderer alloc] initWithMetalCommandQueue:self->_metalCommandQueue mixInGammaDomain:self->_mixColorCubesInGammaDomain];
    self->_metalFilterRenderer = metalFilterRenderer;
  }
  unsigned int v5 = metalFilterRenderer;
  return v5;
}

- (id)provideColorLookupCache
{
  return self->_colorLookupCache;
}

- (void)semanticStyleSceneTypeDidChange:(int)a3
{
  p_semanticStyleSceneLock = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  int semanticStyleSceneType = self->_semanticStyleSceneType;
  self->_int semanticStyleSceneType = a3;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
  if (semanticStyleSceneType != a3)
  {
    -[BWStreamingFilterNode _rebuildSemanticStyleFiltersWithSceneType:]((uint64_t)self);
  }
}

- (BOOL)isRenderingSemanticStyleSet
{
  return self->_renderingSemanticStyleSet;
}

- (BOOL)isStreamingSegmentationFromInferenceEngine
{
  return self->_streamingSegmentationFromInferenceEngine;
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)isFocusBlurMapDeliveryEnabled
{
  return self->_focusBlurMapDeliveryEnabled;
}

- (BOOL)isDepthFromMonocularNetworkEnabled
{
  return self->_depthFromMonocularNetworkEnabled;
}

- (BOOL)isPortraitAutoSuggestEnabled
{
  return self->_portraitAutoSuggestEnabled;
}

- (BOOL)isMetadataProcessingEnabled
{
  return self->_metadataProcessingEnabled;
}

- (BOOL)attachesInputPixelBufferAfterRendering
{
  return self->_attachesInputPixelBufferAfterRendering;
}

- (BOOL)studioAndContourRenderingEnabled
{
  return self->_studioAndContourRenderingEnabled;
}

- (BOOL)stageRenderingEnabled
{
  return self->_stageRenderingEnabled;
}

- (BOOL)primaryStreamingPersonSegmentationEnabled
{
  return self->_primaryStreamingPersonSegmentationEnabled;
}

- (BOOL)secondaryStreamingPersonSegmentationEnabled
{
  return self->_secondaryStreamingPersonSegmentationEnabled;
}

@end