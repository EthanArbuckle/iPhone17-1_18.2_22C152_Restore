@interface JFXAnimojiPlaybackDelegate
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)jfx_mediaTimeFromPlaybackTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset;
- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange;
- (BOOL)isScrubbing;
- (BOOL)useAnimojiBlendShapes;
- (JFXARMetadataMediaReader)arMetadataReader;
- (JFXAnimojiEffect)animojiEffect;
- (JFXAnimojiEffectRenderer)animojiRenderer;
- (JFXAnimojiPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4;
- (JFXCachedAnimojiImage)cachedAnimojiImage;
- (JFXDepthDataMediaReader)depthReader;
- (JFXPlayableElement)playableElement;
- (JFXSharedMediaDataReaderManager)sharedMediaDataReaderManager;
- (OS_dispatch_queue)animojiRenderQueue;
- (OS_dispatch_queue)cachedAnimojiImageQueue;
- (OS_dispatch_queue)delayedUnloadPlaybackQueue;
- (OS_dispatch_queue)mediaDataReaderUpdateQueue;
- (id)JFX_arMetadataReaderItemForMediaTime:(id *)a3;
- (id)JFX_avDepthDataFromDepthDataForMediaTime:(id *)a3;
- (id)JFX_cachedAnimojiImageForMediaTime:(id *)a3 forAnimojiRenderingAttributes:(id)a4;
- (id)JFX_renderAnimojiEffect:(id)a3 forTime:(id *)a4 withARFrame:(id)a5 depthData:(id)a6 inputBufferSize:(CGSize)a7 captureOrientation:(int64_t)a8 interfaceOrientation:(int64_t)a9 preRecordedBlendShapes:(id)a10 backgroundColor:(id)a11;
- (id)delayedUnloadPlaybackResourcesBlock;
- (id)preprocessWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6;
- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6;
- (void)JFX_cacheAnimojiImage:(id)a3;
- (void)JFX_clearCachedAnimojiImages;
- (void)JFX_initAnimojiImageBufferCachingProperties;
- (void)JFX_initAnimojiRenderingProperies;
- (void)JFX_initMediaDataReaderProperties;
- (void)JFX_initPlaybackLoadingProperies;
- (void)JFX_loadAnimojiRenderer;
- (void)JFX_loadMediaDataReaders;
- (void)JFX_loadResourcesForPlayback;
- (void)JFX_requestUnloadResourcesForPlayback;
- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3;
- (void)JFX_unloadAnimojiRenderer;
- (void)JFX_unloadMediaDataReaders;
- (void)JFX_unloadResourcesForPlayback;
- (void)loadWithUserContext:(id)a3;
- (void)setAnimojiEffect:(id)a3;
- (void)setAnimojiRenderer:(id)a3;
- (void)setArMetadataReader:(id)a3;
- (void)setCachedAnimojiImage:(id)a3;
- (void)setDelayedUnloadPlaybackResourcesBlock:(id)a3;
- (void)setDepthReader:(id)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setSharedMediaDataReaderManager:(id)a3;
- (void)setUseAnimojiBlendShapes:(BOOL)a3;
- (void)unloadWithUserContext:(id)a3;
@end

@implementation JFXAnimojiPlaybackDelegate

- (JFXAnimojiPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXAnimojiPlaybackDelegate;
  v9 = [(JFXAnimojiPlaybackDelegate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_playableElement, a3);
    objc_storeStrong((id *)&v10->_sharedMediaDataReaderManager, a4);
    [(JFXAnimojiPlaybackDelegate *)v10 JFX_initPlaybackLoadingProperies];
    [(JFXAnimojiPlaybackDelegate *)v10 JFX_initAnimojiRenderingProperies];
    [(JFXAnimojiPlaybackDelegate *)v10 JFX_initMediaDataReaderProperties];
    [(JFXAnimojiPlaybackDelegate *)v10 JFX_initAnimojiImageBufferCachingProperties];
  }

  return v10;
}

- (void)setIsScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(JFXAnimojiPlaybackDelegate *)self setIsScrubbing:v5];
  }

  self->_isScrubbing = v3;
  [(JFXAnimojiPlaybackDelegate *)self JFX_setMediaDataReaderScrubbingMode:v3];
}

- (void)loadWithUserContext:(id)a3
{
  id v4 = a3;
  v5 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JFXAnimojiPlaybackDelegate loadWithUserContext:](self);
  }

  id v6 = v4;
  id v7 = [v6 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_Effect"];
  id v8 = [v7 dataRepresentation];
  v9 = [v7 dataRepresentation];

  if (v9)
  {
    v10 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    v11 = [v10 originalAnimojiDataRepresentation];

    objc_super v12 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    uint64_t v13 = [v12 originalAnimojiVersionNumber];

    if ([v11 isEqualToData:v8]) {
      BOOL v14 = v13 == AVTAvatarKitVersionNumber();
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  v15 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__JFXAnimojiPlaybackDelegate_loadWithUserContext___block_invoke;
  block[3] = &unk_264C0C358;
  block[4] = self;
  id v18 = v7;
  BOOL v19 = v14;
  id v16 = v7;
  dispatch_async(v15, block);

  [(JFXAnimojiPlaybackDelegate *)self JFX_loadResourcesForPlayback];
}

uint64_t __50__JFXAnimojiPlaybackDelegate_loadWithUserContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimojiEffect:*(void *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setUseAnimojiBlendShapes:v2];
}

- (void)unloadWithUserContext:(id)a3
{
  id v4 = a3;
  v5 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JFXAnimojiPlaybackDelegate unloadWithUserContext:](self);
  }

  [(JFXAnimojiPlaybackDelegate *)self JFX_requestUnloadResourcesForPlayback];
}

- (id)preprocessWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
    v40.start.epoch = a4->var3;
    Float64 Seconds = CMTimeGetSeconds(&v40.start);
    CMTimeFlags v28 = [(JFXAnimojiPlaybackDelegate *)self isScrubbing];
    v29 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    v30 = [v29 uuid];
    LODWORD(v40.start.value) = 134218754;
    *(Float64 *)((char *)&v40.start.value + 4) = Seconds;
    LOWORD(v40.start.flags) = 1024;
    *(CMTimeFlags *)((char *)&v40.start.flags + 2) = v28;
    WORD1(v40.start.epoch) = 2112;
    *(CMTimeEpoch *)((char *)&v40.start.epoch + 4) = (CMTimeEpoch)v30;
    WORD2(v40.duration.value) = 2048;
    *(CMTimeValue *)((char *)&v40.duration.value + 6) = (CMTimeValue)v8;
    _os_log_debug_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEBUG, "preprocessWithInputs called for at time %f scrubMode %{BOOL}d for clip %@ userContext %p", (uint8_t *)&v40, 0x26u);
  }
  memset(&v39, 0, sizeof(v39));
  *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
  v40.start.epoch = a4->var3;
  [(JFXAnimojiPlaybackDelegate *)self jfx_mediaTimeFromPlaybackTime:&v40];
  id v10 = v8;
  memset(&v40, 0, 24);
  v11 = [(JFXAnimojiPlaybackDelegate *)self JFX_cachedAnimojiImageForMediaTime:&v40 forAnimojiRenderingAttributes:v10];
  objc_super v12 = v11;
  if (v11)
  {
    id v13 = v11;
    goto LABEL_15;
  }
  BOOL v14 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
    v40.start.epoch = a4->var3;
    Float64 v31 = CMTimeGetSeconds(&v40.start);
    v32 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    v33 = [v32 uuid];
    v40.CMTime start = v39;
    *(double *)&CMTimeValue v34 = CMTimeGetSeconds(&v40.start);
    LODWORD(v40.start.value) = 134218498;
    *(Float64 *)((char *)&v40.start.value + 4) = v31;
    LOWORD(v40.start.flags) = 2112;
    *(void *)((char *)&v40.start.flags + 2) = v33;
    HIWORD(v40.start.epoch) = 2048;
    v40.duration.value = v34;
    _os_log_debug_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEBUG, "reading ARData for animoji at time %f for clip %@ using media time %f", (uint8_t *)&v40, 0x20u);
  }
  v40.CMTime start = v39;
  v15 = [(JFXAnimojiPlaybackDelegate *)self JFX_arMetadataReaderItemForMediaTime:&v40];
  id v16 = [v15 arMetadata];
  v17 = v16;
  if (!v15)
  {
    memset(&v40, 0, sizeof(v40));
    memset(&v36, 0, 24);
    CMTimeMake(&v36.start, 1, +[JFXMediaSettings frameRate]);
    CMTime start = v39;
    CMTime duration = v36.start;
    CMTimeRangeMake(&v40, &start, &duration);
    goto LABEL_13;
  }
  uint64_t v18 = [v16 arFrame];
  if (!v18 || (BOOL v19 = (void *)v18, v20 = [v17 hasTrackedFace], v19, (v20 & 1) == 0))
  {
    [v15 timeRange];
LABEL_13:
    v25 = [JFXAnimojiPlaybackPreprocessedData alloc];
    CMTime start = (CMTime)*a4;
    CMTimeRange v36 = v40;
    id v13 = [(JFXAnimojiPlaybackPreprocessedData *)v25 initForRenderTime:&start usingDataFromMediaTimeRange:&v36 arFrame:0 avDepthData:0 animojiBlendShapes:0];
    goto LABEL_14;
  }
  v40.CMTime start = v39;
  v21 = [(JFXAnimojiPlaybackDelegate *)self JFX_avDepthDataFromDepthDataForMediaTime:&v40];
  v22 = [v17 arFrame];
  v23 = [v17 animojiPhysicsBlendShapes];
  v24 = [JFXAnimojiPlaybackPreprocessedData alloc];
  [v15 timeRange];
  *(_OWORD *)&v40.start.value = *(_OWORD *)&a4->var0;
  v40.start.epoch = a4->var3;
  id v13 = [(JFXAnimojiPlaybackPreprocessedData *)v24 initForRenderTime:&v40 usingDataFromMediaTimeRange:&v35 arFrame:v22 avDepthData:v21 animojiBlendShapes:v23];

LABEL_14:
LABEL_15:

  return v13;
}

- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v9 = a5;
  memset((char *)&v70[3] + 8, 0, 24);
  CMTime time = *(CMTime *)a4;
  id v10 = a6;
  [(JFXAnimojiPlaybackDelegate *)self jfx_mediaTimeFromPlaybackTime:&time];
  v11 = [v10 preprocessData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v13 = [v10 preprocessData];

  if (isKindOfClass)
  {
    BOOL v14 = JFXLog_DebugAnimojiPlayback();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      CMTime time = *(CMTime *)((char *)&v70[3] + 8);
      Float64 v53 = CMTimeGetSeconds(&time);
      v54 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
      v55 = [v54 uuid];
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = Seconds;
      LOWORD(time.flags) = 2112;
      *(void *)((char *)&time.flags + 2) = v13;
      HIWORD(time.epoch) = 2048;
      Float64 v72 = v53;
      __int16 v73 = 2112;
      id v74 = v55;
      _os_log_debug_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f found cached animojiImage %@ for media time %f on clip %@", (uint8_t *)&time, 0x2Au);
    }
    v15 = [v13 animojiImageBuffer];
  }
  else
  {
    id v16 = v9;
    v17 = [v13 arFrame];

    if (v17)
    {
      id v63 = v9;
      uint64_t v18 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_Effect"];
      BOOL v19 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_UIInterfaceOrientation"];
      uint64_t v20 = [v19 integerValue];

      v21 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"];
      uint64_t v22 = [v21 integerValue];

      v23 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_RenderSize"];
      [v23 CGSizeValue];
      double v25 = v24;
      double v27 = v26;

      v65 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_BackgroundColor"];
      CMTimeFlags v28 = [v16 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"];

      v64 = (JFXCachedAnimojiImage *)v18;
      if (!v28)
      {
        v29 = JFXLog_DebugAnimojiPlayback();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[JFXAnimojiPlaybackDelegate renderWithInputs:time:userContext:compositeContext:](v29);
        }

        uint64_t v22 = 4;
      }
      v30 = [v13 arFrame];
      Float64 v31 = [v30 valueForKey:@"worldAlignment"];
      uint64_t v32 = [v31 integerValue];

      if (v32 != 2)
      {
        v33 = JFXLog_DebugAnimojiPlayback();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[JFXAnimojiPlaybackDelegate renderWithInputs:time:userContext:compositeContext:]();
        }
      }
      CMTimeValue v34 = [v13 animojiBlendShapes];
      uint64_t v35 = [v13 arFrame];
      CMTimeRange v36 = [v13 avDepthData];
      CMTime time = (CMTime)*a4;
      v15 = -[JFXAnimojiPlaybackDelegate JFX_renderAnimojiEffect:forTime:withARFrame:depthData:inputBufferSize:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:](self, "JFX_renderAnimojiEffect:forTime:withARFrame:depthData:inputBufferSize:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:", v64, &time, v35, v36, v22, v20, v25, v27, v34, v65);

      if (v15)
      {
        v37 = [JFXCachedAnimojiImage alloc];
        if (v13) {
          [v13 mediaTimeRangeForData];
        }
        else {
          memset(v69, 0, sizeof(v69));
        }
        CMTimeRange v40 = [(JFXCachedAnimojiImage *)v37 initWithMediaTimeRange:v69 animojiRenderingAttributes:v16 animojiImageBuffer:v15];
        v45 = JFXLog_DebugAnimojiPlayback();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          CMTime time = (CMTime)*a4;
          Float64 v56 = CMTimeGetSeconds(&time);
          CMTime time = *(CMTime *)((char *)&v70[3] + 8);
          Float64 v57 = CMTimeGetSeconds(&time);
          v58 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
          v59 = [v58 uuid];
          LODWORD(time.value) = 134218754;
          *(Float64 *)((char *)&time.value + 4) = v56;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v57;
          HIWORD(time.epoch) = 2112;
          Float64 v72 = *(double *)&v59;
          __int16 v73 = 2048;
          id v74 = v16;
          _os_log_debug_impl(&dword_234C41000, v45, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f rendered animoji at media time %f for clip %@ userContext %p", (uint8_t *)&time, 0x2Au);
        }
        [(JFXAnimojiPlaybackDelegate *)self JFX_cacheAnimojiImage:v40];
        v46 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
        int v47 = [v46 isStill];

        if (v47)
        {
          objc_initWeak((id *)&time, self);
          dispatch_time_t v48 = dispatch_time(0, 100000000);
          v49 = dispatch_get_global_queue(17, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke;
          block[3] = &unk_264C0C380;
          objc_copyWeak(&v68, (id *)&time);
          block[4] = self;
          id v67 = v16;
          dispatch_after(v48, v49, block);

          objc_destroyWeak(&v68);
          objc_destroyWeak((id *)&time);
        }
      }
      else
      {
        CMTimeRange v40 = JFXLog_DebugAnimojiPlayback();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          CMTime time = (CMTime)*a4;
          Float64 v41 = CMTimeGetSeconds(&time);
          CMTime time = *(CMTime *)((char *)&v70[3] + 8);
          Float64 v42 = CMTimeGetSeconds(&time);
          v43 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
          v44 = [v43 uuid];
          LODWORD(time.value) = 134218754;
          *(Float64 *)((char *)&time.value + 4) = v41;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v42;
          HIWORD(time.epoch) = 2112;
          Float64 v72 = *(double *)&v44;
          __int16 v73 = 2048;
          id v74 = v16;
          _os_log_debug_impl(&dword_234C41000, v40, OS_LOG_TYPE_DEBUG, "renderWithInputs called at time %f rendering failed for animoji at media time %f for clip %@ userContext %p", (uint8_t *)&time, 0x2Au);
        }
      }
      v50 = v64;

      id v9 = v63;
    }
    else
    {
      v38 = JFXLog_DebugAnimojiPlayback();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        CMTime time = *(CMTime *)((char *)&v70[3] + 8);
        Float64 v60 = CMTimeGetSeconds(&time);
        v61 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
        v62 = [v61 uuid];
        LODWORD(time.value) = 134218242;
        *(Float64 *)((char *)&time.value + 4) = v60;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v62;
        _os_log_debug_impl(&dword_234C41000, v38, OS_LOG_TYPE_DEBUG, "did not render animoji at media time %f for clip %@ because ARData with face is not available", (uint8_t *)&time, 0x16u);
      }
      CMTime v39 = [JFXCachedAnimojiImage alloc];
      if (v13) {
        [v13 mediaTimeRangeForData];
      }
      else {
        memset(v70, 0, 48);
      }
      v50 = [(JFXCachedAnimojiImage *)v39 initWithMediaTimeRange:v70 animojiRenderingAttributes:v16 animojiImageBuffer:0];
      [(JFXAnimojiPlaybackDelegate *)self JFX_cacheAnimojiImage:v50];
      v15 = 0;
    }
  }
  return v15;
}

void __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = JFXLog_DebugAnimojiPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke_cold_1(a1);
    }

    objc_msgSend(*(id *)(a1 + 32), "JFX_unloadMediaDataReaders");
    objc_msgSend(*(id *)(a1 + 32), "JFX_unloadAnimojiRenderer");
  }
}

- (void)JFX_initPlaybackLoadingProperies
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"com.apple.%@.delayedUnloadPlaybackQueue", v5];

  id v9 = v6;
  id v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v9 UTF8String], 0);
  delayedUnloadPlaybackQueue = self->_delayedUnloadPlaybackQueue;
  self->_delayedUnloadPlaybackQueue = v7;
}

- (void)JFX_loadResourcesForPlayback
{
  BOOL v3 = [(JFXAnimojiPlaybackDelegate *)self delayedUnloadPlaybackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_sync(v3, block);

  [(JFXAnimojiPlaybackDelegate *)self JFX_loadMediaDataReaders];
  [(JFXAnimojiPlaybackDelegate *)self JFX_loadAnimojiRenderer];
}

void __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) delayedUnloadPlaybackResourcesBlock];
  if (v2)
  {
    [*v1 setDelayedUnloadPlaybackResourcesBlock:0];
    BOOL v3 = JFXLog_DebugAnimojiPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke_cold_1(v1);
    }

    dispatch_block_cancel(v2);
  }
}

- (void)JFX_requestUnloadResourcesForPlayback
{
  if ([(JFXAnimojiPlaybackDelegate *)self isScrubbing]
    || ([(JFXAnimojiPlaybackDelegate *)self playableElement],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isStill],
        v3,
        v4))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke;
    block[3] = &unk_264C0B650;
    objc_copyWeak(&v11, &location);
    block[4] = self;
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    id v6 = [(JFXAnimojiPlaybackDelegate *)self delayedUnloadPlaybackQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_67;
    v8[3] = &unk_264C0A3C8;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_sync(v6, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(JFXAnimojiPlaybackDelegate *)self JFX_unloadResourcesForPlayback];
  }
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = [*(id *)(a1 + 32) delayedUnloadPlaybackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_2;
    block[3] = &unk_264C09FA8;
    block[4] = WeakRetained;
    dispatch_sync(v3, block);

    int v4 = JFXLog_DebugAnimojiPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_cold_1(WeakRetained);
    }

    objc_msgSend(WeakRetained, "JFX_unloadResourcesForPlayback");
  }
}

uint64_t __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelayedUnloadPlaybackResourcesBlock:0];
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_67(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 32) delayedUnloadPlaybackResourcesBlock];

  if (v3)
  {
    int v4 = JFXLog_DebugAnimojiPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_67_cold_1(v2);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setDelayedUnloadPlaybackResourcesBlock:*(void *)(a1 + 40)];
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    queue = dispatch_get_global_queue(21, 0);
    id v6 = [*(id *)(a1 + 32) delayedUnloadPlaybackResourcesBlock];
    dispatch_after(v5, queue, v6);
  }
}

- (void)JFX_unloadResourcesForPlayback
{
  v1 = [a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "unloaded resources for animoji playback for clip %@", v5, v6, v7, v8, v9);
}

- (void)JFX_initAnimojiRenderingProperies
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"com.apple.%@.renderQueue", v5];

  id v9 = v6;
  uint64_t v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v9 UTF8String], 0);
  animojiRenderQueue = self->_animojiRenderQueue;
  self->_animojiRenderQueue = v7;
}

- (void)JFX_loadAnimojiRenderer
{
  uint64_t v3 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__JFXAnimojiPlaybackDelegate_JFX_loadAnimojiRenderer__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

id __53__JFXAnimojiPlaybackDelegate_JFX_loadAnimojiRenderer__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) animojiRenderer];
}

- (JFXAnimojiEffectRenderer)animojiRenderer
{
  uint64_t v3 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  dispatch_assert_queue_V2(v3);

  animojiRenderer = self->_animojiRenderer;
  if (!animojiRenderer)
  {
    uint64_t v5 = (JFXAnimojiEffectRenderer *)objc_opt_new();
    uint64_t v6 = self->_animojiRenderer;
    self->_animojiRenderer = v5;

    animojiRenderer = self->_animojiRenderer;
  }
  return animojiRenderer;
}

- (void)setAnimojiRenderer:(id)a3
{
  uint64_t v4 = (JFXAnimojiEffectRenderer *)a3;
  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  dispatch_assert_queue_V2(v5);

  animojiRenderer = self->_animojiRenderer;
  self->_animojiRenderer = v4;
}

- (void)JFX_unloadAnimojiRenderer
{
  uint64_t v3 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__JFXAnimojiPlaybackDelegate_JFX_unloadAnimojiRenderer__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __55__JFXAnimojiPlaybackDelegate_JFX_unloadAnimojiRenderer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnimojiRenderer:0];
}

- (id)JFX_renderAnimojiEffect:(id)a3 forTime:(id *)a4 withARFrame:(id)a5 depthData:(id)a6 inputBufferSize:(CGSize)a7 captureOrientation:(int64_t)a8 interfaceOrientation:(int64_t)a9 preRecordedBlendShapes:(id)a10 backgroundColor:(id)a11
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = a11;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  dispatch_time_t v48 = __Block_byref_object_copy__19;
  v49 = __Block_byref_object_dispose__19;
  id v50 = 0;
  v23 = [(JFXAnimojiPlaybackDelegate *)self animojiRenderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke;
  block[3] = &unk_264C0C3A8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44 = *a4;
  id v33 = v18;
  CMTimeValue v34 = self;
  id v35 = v19;
  id v36 = v20;
  CGFloat v40 = width;
  CGFloat v41 = height;
  int64_t v42 = a8;
  int64_t v43 = a9;
  id v37 = v21;
  id v38 = v22;
  CMTime v39 = &v45;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  dispatch_sync(v23, block);

  id v29 = (id)v46[5];
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v2 = JFXLog_DebugAnimojiPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) animojiRenderer];
  objc_msgSend(v3, "setupInputBufferPoolForSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  [v3 setAsynchronouslyLoadNewPuppets:0];
  [v3 setAllowAntialiasing:1];
  uint64_t v4 = [*(id *)(a1 + 40) animojiEffect];
  uint64_t v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    int v12 = [*(id *)(a1 + 40) useAnimojiBlendShapes];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 104);
    uint64_t v11 = *(void *)(a1 + 112);
    if (v12) {
      uint64_t v6 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 104);
    uint64_t v11 = *(void *)(a1 + 112);
  }
  uint64_t v13 = [v3 newPixelBufferRenderedFromARFrame:v8 withEffect:v7 depthData:v9 captureOrientation:v10 interfaceOrientation:v11 preRecordedBlendShapes:v6 backgroundColor:*(void *)(a1 + 72)];
  if (v13)
  {
    BOOL v14 = (__CVBuffer *)v13;
    uint64_t v15 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v13];
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    CVPixelBufferRelease(v14);
  }
}

- (void)JFX_initAnimojiImageBufferCachingProperties
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"com.apple.%@.cachedAnimojiRenderedImageQueue", v5];

  id v10 = v6;
  uint64_t v7 = (const char *)[v10 UTF8String];
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create(v7, MEMORY[0x263EF83A8]);
  cachedAnimojiImageQueue = self->_cachedAnimojiImageQueue;
  self->_cachedAnimojiImageQueue = v8;
}

- (id)JFX_cachedAnimojiImageForMediaTime:(id *)a3 forAnimojiRenderingAttributes:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__19;
  id v19 = __Block_byref_object_dispose__19;
  id v20 = 0;
  uint64_t v7 = [(JFXAnimojiPlaybackDelegate *)self cachedAnimojiImageQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__JFXAnimojiPlaybackDelegate_JFX_cachedAnimojiImageForMediaTime_forAnimojiRenderingAttributes___block_invoke;
  v11[3] = &unk_264C0C3D0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __95__JFXAnimojiPlaybackDelegate_JFX_cachedAnimojiImageForMediaTime_forAnimojiRenderingAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedAnimojiImage];
  uint64_t v3 = v2;
  if (v2) {
    [v2 mediaTimeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTime v11 = *(CMTime *)(a1 + 56);
  int v4 = CMTimeRangeContainsTime(&range, &v11);

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) cachedAnimojiImage];
    id v6 = [v5 animojiRenderAttributes];
    int v7 = [v6 isEqualToDictionary:*(void *)(a1 + 40)];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) cachedAnimojiImage];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (void)JFX_cacheAnimojiImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self cachedAnimojiImageQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__JFXAnimojiPlaybackDelegate_JFX_cacheAnimojiImage___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

uint64_t __52__JFXAnimojiPlaybackDelegate_JFX_cacheAnimojiImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedAnimojiImage:*(void *)(a1 + 40)];
}

- (void)JFX_clearCachedAnimojiImages
{
  uint64_t v3 = [(JFXAnimojiPlaybackDelegate *)self cachedAnimojiImageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__JFXAnimojiPlaybackDelegate_JFX_clearCachedAnimojiImages__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_barrier_sync(v3, block);
}

uint64_t __58__JFXAnimojiPlaybackDelegate_JFX_clearCachedAnimojiImages__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedAnimojiImage:0];
}

- (void)JFX_initMediaDataReaderProperties
{
  self->_isScrubbing = 1;
  int32_t v3 = +[JFXMediaSettings timeScale];
  id v4 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
  CMTimeFromFrameTime([v4 presentationTime], v3, &v23.start);
  self->_playbackElementPlaybackPresentationOffset = ($95D729B680665BEAEFA1D6FCA8238556)v23.start;

  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
  int v6 = [v5 isStill];

  p_playbackElementPlaybackMediaRange = &self->_playbackElementPlaybackMediaRange;
  if (v6)
  {
    CMTimeMake(&duration, 1, +[JFXMediaSettings frameRate]);
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    CMTimeRangeMake(&v23, &start, &duration);
    long long v8 = *(_OWORD *)&v23.start.epoch;
    *(_OWORD *)&p_playbackElementPlaybackMediaRange->start.value = *(_OWORD *)&v23.start.value;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.start.epoch = v8;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.duration.timescale = *(_OWORD *)&v23.duration.timescale;
  }
  else
  {
    uint64_t v9 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    CMTimeFromFrameTime([v9 mediaStartOffset], v3, &v20);
    id v10 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    CMTimeFromFrameTime([v10 duration], v3, &v19);
    CMTimeRangeMake(&v23, &v20, &v19);
    long long v11 = *(_OWORD *)&v23.start.epoch;
    *(_OWORD *)&p_playbackElementPlaybackMediaRange->start.value = *(_OWORD *)&v23.start.value;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.start.epoch = v11;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.duration.timescale = *(_OWORD *)&v23.duration.timescale;
  }
  id v12 = NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = NSStringFromClass(v13);
  uint64_t v15 = [v12 stringWithFormat:@"com.apple.%@.mediaDataReaderQueue", v14];

  id v16 = v15;
  uint64_t v17 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v16 UTF8String], 0);
  mediaDataReaderUpdateQueue = self->_mediaDataReaderUpdateQueue;
  self->_mediaDataReaderUpdateQueue = v17;
}

- (void)JFX_loadMediaDataReaders
{
  int32_t v3 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__JFXAnimojiPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __54__JFXAnimojiPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) arMetadataReader];
  return (id)[*(id *)(a1 + 32) depthReader];
}

- (JFXDepthDataMediaReader)depthReader
{
  int32_t v3 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v3);

  depthReader = self->_depthReader;
  if (!depthReader)
  {
    uint64_t v5 = NSString;
    int v6 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    int v7 = [v6 uuid];
    long long v8 = [v5 stringWithFormat:@"%@_%@", @"animojiPlaybackDepthReader", v7];

    uint64_t v9 = +[JFXMediaDataReaderFactory sharedInstance];
    id v10 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
    long long v11 = [v9 createDepthDataReaderWithCreationAttributesProvider:v10 name:v8];

    if (v11)
    {
      objc_msgSend(v11, "setIsScrubbing:", -[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing"));
      [(JFXAnimojiPlaybackDelegate *)self playbackElementPlaybackMediaRange];
      [v11 beginReadingAtTimeRange:v13];
      objc_storeStrong((id *)&self->_depthReader, v11);
    }

    depthReader = self->_depthReader;
  }
  return depthReader;
}

- (void)setDepthReader:(id)a3
{
  id v4 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v4);

  depthReader = self->_depthReader;
  self->_depthReader = 0;
}

- (JFXARMetadataMediaReader)arMetadataReader
{
  int32_t v3 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v3);

  arMetadataReader = self->_arMetadataReader;
  if (!arMetadataReader)
  {
    uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self sharedMediaDataReaderManager];
    int v6 = [v5 sharedARMetadataReader];

    if (v6)
    {
      objc_msgSend(v6, "setIsScrubbing:", -[JFXAnimojiPlaybackDelegate isScrubbing](self, "isScrubbing"));
      [(JFXAnimojiPlaybackDelegate *)self playbackElementPlaybackMediaRange];
      [v6 beginReadingAtTimeRange:&v8];
      objc_storeStrong((id *)&self->_arMetadataReader, v6);
    }

    arMetadataReader = self->_arMetadataReader;
  }
  return arMetadataReader;
}

- (void)setArMetadataReader:(id)a3
{
  id v4 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v4);

  arMetadataReader = self->_arMetadataReader;
  self->_arMetadataReader = 0;
}

- (id)JFX_arMetadataReaderItemForMediaTime:(id *)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = __Block_byref_object_dispose__19;
  id v15 = 0;
  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__JFXAnimojiPlaybackDelegate_JFX_arMetadataReaderItemForMediaTime___block_invoke;
  block[3] = &unk_264C0A098;
  void block[4] = self;
  void block[5] = &v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__JFXAnimojiPlaybackDelegate_JFX_arMetadataReaderItemForMediaTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) arMetadataReader];
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v3 = [v2 arMetadataItemForTime:&v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)JFX_avDepthDataFromDepthDataForMediaTime:(id *)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = __Block_byref_object_dispose__19;
  id v15 = 0;
  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__JFXAnimojiPlaybackDelegate_JFX_avDepthDataFromDepthDataForMediaTime___block_invoke;
  block[3] = &unk_264C0A290;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __71__JFXAnimojiPlaybackDelegate_JFX_avDepthDataFromDepthDataForMediaTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) depthReader];
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v3 = [v2 depthDataForTime:&v7];

  uint64_t v4 = [v3 avDepthData];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3
{
  uint64_t v5 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__JFXAnimojiPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke;
  v6[3] = &unk_264C0A0C0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __66__JFXAnimojiPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) arMetadataReader];
  [v3 setIsScrubbing:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) depthReader];
  [v5 setIsScrubbing:v4];
}

- (void)JFX_unloadMediaDataReaders
{
  uint64_t v3 = [(JFXAnimojiPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__JFXAnimojiPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __56__JFXAnimojiPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setArMetadataReader:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setDepthReader:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)jfx_mediaTimeFromPlaybackTime:(SEL)a3
{
  BOOL v7 = [(JFXAnimojiPlaybackDelegate *)self playableElement];
  int v8 = [v7 isStill];

  if (v8)
  {
    uint64_t v10 = MEMORY[0x263F010E0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F010E0];
    retstr->var3 = *(void *)(v10 + 16);
  }
  else
  {
    memset(&v15, 0, sizeof(v15));
    [(JFXAnimojiPlaybackDelegate *)self playbackElementPlaybackPresentationOffset];
    CMTime lhs = (CMTime)*a4;
    CMTimeSubtract(&v15, &lhs, &rhs);
    [(JFXAnimojiPlaybackDelegate *)self playbackElementPlaybackMediaRange];
    CMTime v12 = v11;
    CMTime lhs = v15;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v12);
  }
  return result;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (OS_dispatch_queue)mediaDataReaderUpdateQueue
{
  return self->_mediaDataReaderUpdateQueue;
}

- (JFXSharedMediaDataReaderManager)sharedMediaDataReaderManager
{
  return self->_sharedMediaDataReaderManager;
}

- (void)setSharedMediaDataReaderManager:(id)a3
{
}

- (OS_dispatch_queue)animojiRenderQueue
{
  return self->_animojiRenderQueue;
}

- (JFXAnimojiEffect)animojiEffect
{
  return self->_animojiEffect;
}

- (void)setAnimojiEffect:(id)a3
{
}

- (BOOL)useAnimojiBlendShapes
{
  return self->_useAnimojiBlendShapes;
}

- (void)setUseAnimojiBlendShapes:(BOOL)a3
{
  self->_useAnimojiBlendShapes = a3;
}

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange
{
  long long v3 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var0;
  return self;
}

- (OS_dispatch_queue)delayedUnloadPlaybackQueue
{
  return self->_delayedUnloadPlaybackQueue;
}

- (id)delayedUnloadPlaybackResourcesBlock
{
  return self->_delayedUnloadPlaybackResourcesBlock;
}

- (void)setDelayedUnloadPlaybackResourcesBlock:(id)a3
{
}

- (OS_dispatch_queue)cachedAnimojiImageQueue
{
  return self->_cachedAnimojiImageQueue;
}

- (JFXCachedAnimojiImage)cachedAnimojiImage
{
  return self->_cachedAnimojiImage;
}

- (void)setCachedAnimojiImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAnimojiImage, 0);
  objc_storeStrong((id *)&self->_cachedAnimojiImageQueue, 0);
  objc_storeStrong(&self->_delayedUnloadPlaybackResourcesBlock, 0);
  objc_storeStrong((id *)&self->_delayedUnloadPlaybackQueue, 0);
  objc_storeStrong((id *)&self->_playableElement, 0);
  objc_storeStrong((id *)&self->_animojiEffect, 0);
  objc_storeStrong((id *)&self->_animojiRenderQueue, 0);
  objc_storeStrong((id *)&self->_sharedMediaDataReaderManager, 0);
  objc_storeStrong((id *)&self->_mediaDataReaderUpdateQueue, 0);
  objc_storeStrong((id *)&self->_arMetadataReader, 0);
  objc_storeStrong((id *)&self->_depthReader, 0);
  objc_storeStrong((id *)&self->_animojiRenderer, 0);
}

- (void)setIsScrubbing:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 playableElement];
  id v5 = [v4 uuid];
  OUTLINED_FUNCTION_3();
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "clip %@ scrubMode set to %{BOOL}d", v7, 0x12u);
}

- (void)loadWithUserContext:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v3, v4, "loadWithUserContext called on clip %@ userContext %p", v5, v6, v7, v8, v9);
}

- (void)unloadWithUserContext:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v3, v4, "unloadWithUserContext called on clip %@ userContext %p", v5, v6, v7, v8, v9);
}

- (void)renderWithInputs:time:userContext:compositeContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
}

- (void)renderWithInputs:(os_log_t)log time:userContext:compositeContext:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "missing JFXAnimojiRendererMetadata_AVCaptureVideoOrientation metadata", v1, 2u);
}

void __81__JFXAnimojiPlaybackDelegate_renderWithInputs_time_userContext_compositeContext___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v3, v4, "unload rendering resources for clip %@ userContext %p because they are longer neeed for still", v5, v6, v7, v8, v9);
}

void __58__JFXAnimojiPlaybackDelegate_JFX_loadResourcesForPlayback__block_invoke_cold_1(id *a1)
{
  v1 = [*a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "cancel delayed unload for clip %@", v5, v6, v7, v8, v9);
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_cold_1(void *a1)
{
  v1 = [a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "performing delayed unloading of resources for animoji playback for clip %@", v5, v6, v7, v8, v9);
}

void __67__JFXAnimojiPlaybackDelegate_JFX_requestUnloadResourcesForPlayback__block_invoke_67_cold_1(id *a1)
{
  v1 = [*a1 playableElement];
  uint64_t v2 = [v1 uuid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "ignored delayed unload request for clip because already pending  %@", v5, v6, v7, v8, v9);
}

void __179__JFXAnimojiPlaybackDelegate_JFX_renderAnimojiEffect_forTime_withARFrame_depthData_inputBufferSize_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CMTimeValue v4 = *(void *)(a1 + 32);
  CMTime v10 = *(CMTime *)(a1 + 120);
  Float64 Seconds = CMTimeGetSeconds(&v10);
  uint64_t v6 = [*(id *)(a1 + 40) playableElement];
  uint64_t v7 = [v6 uuid];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  LODWORD(v10.value) = 138413314;
  *(CMTimeValue *)((char *)&v10.value + 4) = v4;
  LOWORD(v10.flags) = 2048;
  *(Float64 *)((char *)&v10.flags + 2) = Seconds;
  HIWORD(v10.epoch) = 2112;
  CMTime v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "rendering animoji %@ for time %f for clip %@ with ARFrame %@ and avDepthData %@", (uint8_t *)&v10, 0x34u);
}

@end