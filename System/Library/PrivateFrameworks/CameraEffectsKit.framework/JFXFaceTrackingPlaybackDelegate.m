@interface JFXFaceTrackingPlaybackDelegate
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)jfx_mediaTimeFromPlaybackTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset;
- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange;
- (BOOL)isScrubbing;
- (CGSize)outputSize;
- (JFXARMetadataMediaReader)arMetadataReader;
- (JFXFaceTrackingPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4 outputSize:(CGSize)a5;
- (JFXFaceTrackingPlaybackProperties)cachedFaceTrackingProperties;
- (JFXPlayableElement)playableElement;
- (JFXSharedMediaDataReaderManager)sharedMediaDataReaderManager;
- (OS_dispatch_queue)cachedFaceTrackingPropertiesQueue;
- (OS_dispatch_queue)mediaDataReaderUpdateQueue;
- (id)JFX_arMetadataForMediaTime:(id *)a3 foundTimeRange:(id *)a4;
- (id)JFX_cachedFaceTrackingPropertiesForMediaTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4;
- (id)JFX_faceTrackingPlaybackPropertiesAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4;
- (id)arDataAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4;
- (id)effect:(id)a3 timedPropertiesForGroup:(id)a4 time:(id *)a5 userContext:(id)a6;
- (id)faceTrackingTransformAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4;
- (id)supportedTimedPropertyGroupsForEffect:(id)a3;
- (void)JFX_cacheFaceTrackingProperties:(id)a3;
- (void)JFX_initFaceTrackingCachingProperties;
- (void)JFX_initMetadataReadingProperties;
- (void)JFX_loadMediaDataReaders;
- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3;
- (void)JFX_unloadMediaDataReaders;
- (void)effect:(id)a3 didStopRequestingTimedProperties:(id)a4;
- (void)effect:(id)a3 willStartRequestingTimedProperties:(id)a4;
- (void)setArMetadataReader:(id)a3;
- (void)setCachedFaceTrackingProperties:(id)a3;
- (void)setIsScrubbing:(BOOL)a3;
@end

@implementation JFXFaceTrackingPlaybackDelegate

- (JFXFaceTrackingPlaybackDelegate)initWithPlayableElement:(id)a3 sharedMediaDataReaderManager:(id)a4 outputSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JFXFaceTrackingPlaybackDelegate;
  v12 = [(JFXFaceTrackingPlaybackDelegate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playableElement, a3);
    objc_storeStrong((id *)&v13->_sharedMediaDataReaderManager, a4);
    v13->_outputSize.CGFloat width = width;
    v13->_outputSize.CGFloat height = height;
    [(JFXFaceTrackingPlaybackDelegate *)v13 JFX_initMetadataReadingProperties];
    [(JFXFaceTrackingPlaybackDelegate *)v13 JFX_initFaceTrackingCachingProperties];
  }

  return v13;
}

- (void)JFX_initFaceTrackingCachingProperties
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"com.apple.%@.cachedFaceTrackingPropertiesQueue", v5];

  id v10 = v6;
  v7 = (const char *)[v10 UTF8String];
  v8 = (OS_dispatch_queue *)dispatch_queue_create(v7, MEMORY[0x263EF83A8]);
  cachedFaceTrackingPropertiesQueue = self->_cachedFaceTrackingPropertiesQueue;
  self->_cachedFaceTrackingPropertiesQueue = v8;
}

- (id)JFX_cachedFaceTrackingPropertiesForMediaTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v7 = [(JFXFaceTrackingPlaybackDelegate *)self cachedFaceTrackingPropertiesQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __121__JFXFaceTrackingPlaybackDelegate_JFX_cachedFaceTrackingPropertiesForMediaTime_forDisplayingMediaAtInterfaceOrientation___block_invoke;
  v10[3] = &unk_264C0A070;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  v10[5] = &v12;
  v10[6] = a4;
  v10[4] = self;
  dispatch_sync(v7, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __121__JFXFaceTrackingPlaybackDelegate_JFX_cachedFaceTrackingPropertiesForMediaTime_forDisplayingMediaAtInterfaceOrientation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedFaceTrackingProperties];
  uint64_t v3 = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  int v4 = [v2 containsMediaTime:&v8 forDisplayingMediaAtInterfaceOrientation:v3];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) cachedFaceTrackingProperties];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)JFX_cacheFaceTrackingProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXFaceTrackingPlaybackDelegate *)self cachedFaceTrackingPropertiesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__JFXFaceTrackingPlaybackDelegate_JFX_cacheFaceTrackingProperties___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

uint64_t __67__JFXFaceTrackingPlaybackDelegate_JFX_cacheFaceTrackingProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedFaceTrackingProperties:*(void *)(a1 + 40)];
}

- (void)JFX_initMetadataReadingProperties
{
  self->_isScrubbing = 1;
  int32_t v3 = +[JFXMediaSettings timeScale];
  id v4 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
  CMTimeFromFrameTime([v4 presentationTime], v3, &v23.start);
  self->_playbackElementPlaybackPresentationOffset = ($95D729B680665BEAEFA1D6FCA8238556)v23.start;

  uint64_t v5 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
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
    uint64_t v9 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    CMTimeFromFrameTime([v9 mediaStartOffset], v3, &v20);
    id v10 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    CMTimeFromFrameTime([v10 duration], v3, &v19);
    CMTimeRangeMake(&v23, &v20, &v19);
    long long v11 = *(_OWORD *)&v23.start.epoch;
    *(_OWORD *)&p_playbackElementPlaybackMediaRange->start.value = *(_OWORD *)&v23.start.value;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.start.epoch = v11;
    *(_OWORD *)&self->_playbackElementPlaybackMediaRange.duration.timescale = *(_OWORD *)&v23.duration.timescale;
  }
  uint64_t v12 = NSString;
  v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  objc_super v15 = [v12 stringWithFormat:@"com.apple.%@.mediaDataReaderQueue", v14];

  id v16 = v15;
  id v17 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v16 UTF8String], 0);
  mediaDataReaderUpdateQueue = self->_mediaDataReaderUpdateQueue;
  self->_mediaDataReaderUpdateQueue = v17;
}

- (void)JFX_loadMediaDataReaders
{
  int32_t v3 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__JFXFaceTrackingPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

id __59__JFXFaceTrackingPlaybackDelegate_JFX_loadMediaDataReaders__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) arMetadataReader];
}

- (id)JFX_arMetadataForMediaTime:(id *)a3 foundTimeRange:(id *)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CMTime v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  v7 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__JFXFaceTrackingPlaybackDelegate_JFX_arMetadataForMediaTime_foundTimeRange___block_invoke;
  block[3] = &unk_264C0A098;
  block[4] = self;
  void block[5] = &v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
  dispatch_sync(v7, block);

  long long v8 = (void *)v18[5];
  if (v8)
  {
    if (a4)
    {
      [v8 timeRange];
      uint64_t v9 = v18;
      *(_OWORD *)&a4->var0.var0 = v12;
      *(_OWORD *)&a4->var0.var3 = v13;
      *(_OWORD *)&a4->var1.var1 = v14;
      long long v8 = (void *)v9[5];
    }
    id v10 = [v8 arMetadata];
  }
  else
  {
    id v10 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __77__JFXFaceTrackingPlaybackDelegate_JFX_arMetadataForMediaTime_foundTimeRange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) arMetadataReader];
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v3 = [v2 arMetadataItemForTime:&v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)JFX_setMediaDataReaderScrubbingMode:(BOOL)a3
{
  uint64_t v5 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__JFXFaceTrackingPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke;
  v6[3] = &unk_264C0A0C0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __71__JFXFaceTrackingPlaybackDelegate_JFX_setMediaDataReaderScrubbingMode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) arMetadataReader];
  [v2 setIsScrubbing:v1];
}

- (JFXARMetadataMediaReader)arMetadataReader
{
  uint64_t v3 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v3);

  arMetadataReader = self->_arMetadataReader;
  if (!arMetadataReader)
  {
    uint64_t v5 = [(JFXFaceTrackingPlaybackDelegate *)self sharedMediaDataReaderManager];
    long long v6 = [v5 sharedARMetadataReader];

    if (v6)
    {
      objc_msgSend(v6, "setIsScrubbing:", -[JFXFaceTrackingPlaybackDelegate isScrubbing](self, "isScrubbing"));
      [(JFXFaceTrackingPlaybackDelegate *)self playbackElementPlaybackMediaRange];
      [v6 beginReadingAtTimeRange:&v8];
      objc_storeStrong((id *)&self->_arMetadataReader, v6);
    }

    arMetadataReader = self->_arMetadataReader;
  }
  return arMetadataReader;
}

- (void)setArMetadataReader:(id)a3
{
  uint64_t v4 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  dispatch_assert_queue_V2(v4);

  arMetadataReader = self->_arMetadataReader;
  self->_arMetadataReader = 0;
}

- (void)JFX_unloadMediaDataReaders
{
  uint64_t v3 = [(JFXFaceTrackingPlaybackDelegate *)self mediaDataReaderUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__JFXFaceTrackingPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __61__JFXFaceTrackingPlaybackDelegate_JFX_unloadMediaDataReaders__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setArMetadataReader:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)jfx_mediaTimeFromPlaybackTime:(SEL)a3
{
  BOOL v7 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
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
    [(JFXFaceTrackingPlaybackDelegate *)self playbackElementPlaybackPresentationOffset];
    CMTime lhs = (CMTime)*a4;
    CMTimeSubtract(&v15, &lhs, &rhs);
    [(JFXFaceTrackingPlaybackDelegate *)self playbackElementPlaybackMediaRange];
    CMTime v12 = v11;
    CMTime lhs = v15;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v12);
  }
  return result;
}

- (void)effect:(id)a3 willStartRequestingTimedProperties:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = JFXLog_DebugFaceTrackingPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    uint64_t v10 = [v9 uuid];
    int v11 = 134218498;
    id v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v10;
    __int16 v15 = 2048;
    id v16 = v7;
    _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "willStartRequestingTimedProperties for PVEffect %p on clip %@ userContext %p", (uint8_t *)&v11, 0x20u);
  }
  [(JFXFaceTrackingPlaybackDelegate *)self JFX_loadMediaDataReaders];
}

- (void)effect:(id)a3 didStopRequestingTimedProperties:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = JFXLog_DebugFaceTrackingPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    uint64_t v10 = [v9 uuid];
    int v11 = 134218498;
    id v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v10;
    __int16 v15 = 2048;
    id v16 = v7;
    _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "didStopRequestingTimedProperties called for PVEffect %p on clip %@ userContext %p", (uint8_t *)&v11, 0x20u);
  }
  [(JFXFaceTrackingPlaybackDelegate *)self JFX_unloadMediaDataReaders];
}

- (id)effect:(id)a3 timedPropertiesForGroup:(id)a4 time:(id *)a5 userContext:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = JFXLog_DebugFaceTrackingPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    CMTime time = (CMTime)*a5;
    Float64 Seconds = CMTimeGetSeconds(&time);
    BOOL v27 = [(JFXFaceTrackingPlaybackDelegate *)self isScrubbing];
    v28 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    v29 = [v28 uuid];
    LODWORD(time.value) = 138413570;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = Seconds;
    HIWORD(time.epoch) = 1024;
    BOOL v33 = v27;
    __int16 v34 = 2048;
    id v35 = v10;
    __int16 v36 = 2112;
    v37 = v29;
    __int16 v38 = 2048;
    id v39 = v12;
    _os_log_debug_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup called for group %@ at time %f scrubMode %{BOOL}d on PVEffect %p on clip %@ userContext %p", (uint8_t *)&time, 0x3Au);
  }
  if (([v11 isEqualToString:@"faceTracking"] & 1) == 0)
  {
    __int16 v15 = JFXLog_DebugFaceTrackingPlayback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[JFXFaceTrackingPlaybackDelegate effect:timedPropertiesForGroup:time:userContext:]((uint64_t)v11, v15);
    }
    goto LABEL_10;
  }
  long long v14 = v12;
  __int16 v15 = v14;
  if (!v14)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_15;
  }
  id v16 = [v14 objectForKeyedSubscript:@"JFXFaceTrackingKey_InterfaceOrientation"];
  uint64_t v17 = [v16 integerValue];

  v18 = [v15 objectForKeyedSubscript:@"JFXFaceTrackingKey_TrackingType"];
  uint64_t v19 = [v18 integerValue];
  if (v19)
  {
    uint64_t v20 = v19;
    CMTime time = (CMTime)*a5;
    v21 = [(JFXFaceTrackingPlaybackDelegate *)self faceTrackingTransformAtTime:&time forDisplayingMediaAtInterfaceOrientation:v17];
    id v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 effectParametersForTrackingType:v20];
    }
    else
    {
      uint64_t v30 = *MEMORY[0x263F616C0];
      uint64_t v31 = MEMORY[0x263EFFA88];
      uint64_t v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    }
    v24 = (void *)v23;
  }
  else
  {
    v24 = 0;
  }

LABEL_15:
  return v24;
}

- (id)supportedTimedPropertyGroupsForEffect:(id)a3
{
  if (supportedTimedPropertyGroupsForEffect__onceToken != -1) {
    dispatch_once(&supportedTimedPropertyGroupsForEffect__onceToken, &__block_literal_global_1);
  }
  uint64_t v3 = (void *)supportedTimedPropertyGroupsForEffect__s_timedProperties;
  return v3;
}

void __73__JFXFaceTrackingPlaybackDelegate_supportedTimedPropertyGroupsForEffect___block_invoke()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"faceTracking";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)supportedTimedPropertyGroupsForEffect__s_timedProperties;
  supportedTimedPropertyGroupsForEffect__s_timedProperties = v0;
}

- (void)setIsScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = JFXLog_DebugFaceTrackingPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(JFXFaceTrackingPlaybackDelegate *)self setIsScrubbing:v5];
  }

  self->_isScrubbing = v3;
  [(JFXFaceTrackingPlaybackDelegate *)self JFX_setMediaDataReaderScrubbingMode:v3];
}

- (id)faceTrackingTransformAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  uint64_t v4 = [(JFXFaceTrackingPlaybackDelegate *)self JFX_faceTrackingPlaybackPropertiesAtTime:&v7 forDisplayingMediaAtInterfaceOrientation:a4];
  uint64_t v5 = [v4 faceTrackingTransform];

  return v5;
}

- (id)arDataAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = JFXLog_DebugFaceTrackingPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v14);
    id v12 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
    __int16 v13 = [v12 uuid];
    LODWORD(v14.var0) = 134218242;
    *(Float64 *)((char *)&v14.var0 + 4) = Seconds;
    LOWORD(v14.var2) = 2112;
    *(void *)((char *)&v14.var2 + 2) = v13;
    _os_log_debug_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEBUG, "arMetadata requested for time %f on clip %@", (uint8_t *)&v14, 0x16u);
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  int v8 = [(JFXFaceTrackingPlaybackDelegate *)self JFX_faceTrackingPlaybackPropertiesAtTime:&v14 forDisplayingMediaAtInterfaceOrientation:a4];
  uint64_t v9 = [v8 arMetadata];

  return v9;
}

- (id)JFX_faceTrackingPlaybackPropertiesAtTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v38 = 0uLL;
  uint64_t v39 = 0;
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTime time = *a3;
  [(JFXFaceTrackingPlaybackDelegate *)self jfx_mediaTimeFromPlaybackTime:time];
  memset(time, 0, 24);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(JFXFaceTrackingPlaybackDelegate *)self JFX_cachedFaceTrackingPropertiesForMediaTime:time forDisplayingMediaAtInterfaceOrientation:a4];
  if (!v7)
  {
    long long v43 = 0u;
    memset(time, 0, sizeof(time));
    *(_OWORD *)CMTime start = v38;
    *(void *)&start[16] = v39;
    id v12 = [(JFXFaceTrackingPlaybackDelegate *)self JFX_arMetadataForMediaTime:start foundTimeRange:time];
    __int16 v13 = v12;
    if (v12)
    {
      if ([v12 hasTrackedFace])
      {
        playableElement = self->_playableElement;
        [(JFXFaceTrackingPlaybackDelegate *)self outputSize];
        -[JFXPlayableElement playableRectInOutputSize:](playableElement, "playableRectInOutputSize:");
        uint64_t v17 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v13, a4, v15, v16);
        v18 = [(JFXFaceTrackingTransformCalculator *)v17 calculateFaceTrackingTransform];
        uint64_t v19 = [JFXFaceTrackingPlaybackProperties alloc];
        *(_OWORD *)CMTime start = *(_OWORD *)time;
        *(_OWORD *)&start[16] = *(_OWORD *)&time[16];
        long long v41 = v43;
        id v11 = [(JFXFaceTrackingPlaybackProperties *)v19 initWithFaceTrackableMediaTimeRange:start forDisplayingMediaAtInterfaceOrientation:a4 faceTrackingTransform:v18 arMetadata:v13];

LABEL_17:
        [(JFXFaceTrackingPlaybackDelegate *)self JFX_cacheFaceTrackingProperties:v11];

        goto LABEL_18;
      }
      v24 = JFXLog_DebugFaceTrackingPlayback();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)CMTime start = *(_OWORD *)&a3->var0;
        *(void *)&start[16] = a3->var3;
        Float64 Seconds = CMTimeGetSeconds((CMTime *)start);
        __int16 v34 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
        id v35 = [v34 uuid];
        *(_DWORD *)CMTime start = 134218242;
        *(Float64 *)&start[4] = Seconds;
        *(_WORD *)&start[12] = 2112;
        *(void *)&start[14] = v35;
        _os_log_debug_impl(&dword_234C41000, v24, OS_LOG_TYPE_DEBUG, "faceTrackingPropertiesForTime tracked face not found for time %f on clip %@", start, 0x16u);
      }
      uint64_t v23 = [JFXFaceTrackingPlaybackProperties alloc];
      *(_OWORD *)CMTime start = *(_OWORD *)time;
      *(_OWORD *)&start[16] = *(_OWORD *)&time[16];
      long long v41 = v43;
      id v22 = (CMTimeRange *)start;
    }
    else
    {
      uint64_t v20 = JFXLog_DebugFaceTrackingPlayback();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)CMTime start = *(_OWORD *)&a3->var0;
        *(void *)&start[16] = a3->var3;
        Float64 v30 = CMTimeGetSeconds((CMTime *)start);
        uint64_t v31 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
        v32 = [v31 uuid];
        *(_DWORD *)CMTime start = 134218242;
        *(Float64 *)&start[4] = v30;
        *(_WORD *)&start[12] = 2112;
        *(void *)&start[14] = v32;
        _os_log_debug_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEBUG, "faceTrackingPropertiesForTime exited early at time %f because no arMetadata on clip %@", start, 0x16u);
      }
      v21 = [JFXFaceTrackingPlaybackProperties alloc];
      CMTimeMake(&v36, 1, a3->var1);
      *(_OWORD *)CMTime start = *(_OWORD *)&a3->var0;
      *(void *)&start[16] = a3->var3;
      CMTimeRangeMake(&v37, (CMTime *)start, &v36);
      id v22 = &v37;
      uint64_t v23 = v21;
    }
    id v11 = [(JFXFaceTrackingPlaybackProperties *)v23 initWithNonFaceTrackableMediaTimeRange:v22];
    goto LABEL_17;
  }
  int v8 = JFXLog_DebugFaceTrackingPlayback();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    id v10 = JFXLog_DebugFaceTrackingPlayback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)CMTime time = *(_OWORD *)&a3->var0;
      *(void *)&time[16] = a3->var3;
      Float64 v26 = CMTimeGetSeconds((CMTime *)time);
      int v27 = [v7 canTrackFace];
      v28 = [(JFXFaceTrackingPlaybackDelegate *)self playableElement];
      v29 = [v28 uuid];
      *(_DWORD *)CMTime time = 134218498;
      *(Float64 *)&time[4] = v26;
      *(_WORD *)&time[12] = 1024;
      *(_DWORD *)&time[14] = v27;
      *(_WORD *)&time[18] = 2112;
      *(void *)&time[20] = v29;
      _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup cached data found for time %f canTrackFace: %{BOOL}d on clip %@", time, 0x1Cu);
    }
  }
  id v11 = v7;
LABEL_18:

  return v11;
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

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (OS_dispatch_queue)cachedFaceTrackingPropertiesQueue
{
  return self->_cachedFaceTrackingPropertiesQueue;
}

- (JFXFaceTrackingPlaybackProperties)cachedFaceTrackingProperties
{
  return self->_cachedFaceTrackingProperties;
}

- (void)setCachedFaceTrackingProperties:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackElementPlaybackPresentationOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- ($70930193D4F448A53BB9343C0237EB5F)playbackElementPlaybackMediaRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFaceTrackingProperties, 0);
  objc_storeStrong((id *)&self->_cachedFaceTrackingPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_playableElement, 0);
  objc_storeStrong((id *)&self->_sharedMediaDataReaderManager, 0);
  objc_storeStrong((id *)&self->_mediaDataReaderUpdateQueue, 0);
  objc_storeStrong((id *)&self->_arMetadataReader, 0);
}

- (void)effect:(uint64_t)a1 timedPropertiesForGroup:(NSObject *)a2 time:userContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "timedPropertiesForGroup called for group %@ that is not supported", (uint8_t *)&v2, 0xCu);
}

- (void)setIsScrubbing:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 playableElement];
  id v6 = [v5 uuid];
  int v7 = 138412546;
  int v8 = v6;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "clip %@ scrubMode set to %{BOOL}d", (uint8_t *)&v7, 0x12u);
}

@end