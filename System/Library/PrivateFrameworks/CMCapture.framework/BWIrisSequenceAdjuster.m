@interface BWIrisSequenceAdjuster
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForStillImageTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffsetForOriginalStillImageTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieOriginalStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewFrameDuration;
- (BOOL)_getPreviousTimeSkewOut:(void *)a3 andNextTimeSkewOut:(CMTime *)a4 forTime:;
- (BOOL)discontinuityExistsBetweenCurrentPTS:(id *)a3 previousPTS:(id *)a4;
- (BOOL)readyToReleaseAudio;
- (BWIrisSequenceAdjuster)initWithMediaTypes:(id)a3 visMotionMetadataPreloadingEnabled:(BOOL)a4 generateIFrames:(BOOL)a5 attachedMediaKeysToPreserve:(id)a6;
- (CMTime)_adjustedTimeForAudioBufferWithTime:(uint64_t)a3@<X8>;
- (CMTime)_originalDurationForVideoBufferWithTime:(uint64_t)a3@<X8>;
- (int)audioOffsetForOriginalStillImageTimeMaximumFrameLatency;
- (opaqueCMSampleBuffer)dequeueAndRetainAdjustedSampleBufferForMediaTypeWithIndex:(int64_t)a3;
- (uint64_t)_adjustedTimeForMetadataBufferWithTime:(uint64_t)a3@<X8>;
- (uint64_t)_adjustedTimeForVideoBufferWithTime:(unsigned int)a3@<W2> forceKeepingBuffer:(uint64_t)a4@<X3> discontinuityFrameAttributesOut:(long long *)a5@<X8>;
- (uint64_t)_indexOfTime:(uint64_t)result;
- (unint64_t)maximumNumberOfPreDiscontinuityFramesNeededToSatisfyAllDropFrameRecipes;
- (void)_adjustTimesInAudioInterleavingQueues;
- (void)_audioOffsetForOriginalStillImageTime:(CMTime *)a3@<X2> adjustedStillImageTime:(uint64_t)a4@<X8>;
- (void)adjustMovieInfoTimes:(id)a3;
- (void)dealloc;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaTypeWithIndex:(int64_t)a4;
- (void)enqueueVideoBufferTime:(id *)a3 nativeTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6;
- (void)reset;
- (void)setAudioOffsetForOriginalStillImageTimeMaximumFrameLatency:(int)a3;
- (void)setMasterMovieOriginalStartTime:(id *)a3;
@end

@implementation BWIrisSequenceAdjuster

- (int)audioOffsetForOriginalStillImageTimeMaximumFrameLatency
{
  return 3;
}

- (void)reset
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  long long v4 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_firstIrisAudioOffset.value = *MEMORY[0x1E4F1F9F8];
  int64_t v5 = *(void *)(v3 + 16);
  self->_firstIrisAudioOffset.epoch = v5;
  *(_OWORD *)&self->_nextAdjustedVideoTime.value = v4;
  self->_nextAdjustedVideoTime.epoch = v5;
  *(_OWORD *)&self->_masterMovieOriginalStartTime.value = v4;
  self->_masterMovieOriginalStartTime.epoch = v5;
  *(_OWORD *)&self->_previewFrameDuration.value = v4;
  self->_previewFrameDuration.epoch = v5;
  *(_OWORD *)&self->_lastVideoAdjustedTime.value = v4;
  self->_lastVideoAdjustedTime.epoch = v5;
  [(BWMotionDataPreserver *)self->_motionDataPreserver reset];

  self->_preservedAttachedMediaSbufByKeys = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  interleavingQueues = self->_interleavingQueues;
  uint64_t v7 = [(NSMutableArray *)interleavingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(interleavingQueues);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeAllObjects];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)interleavingQueues countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BWIrisSequenceAdjuster)initWithMediaTypes:(id)a3 visMotionMetadataPreloadingEnabled:(BOOL)a4 generateIFrames:(BOOL)a5 attachedMediaKeysToPreserve:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BWIrisSequenceAdjuster;
  uint64_t v10 = [(BWIrisSequenceAdjuster *)&v23 init];
  if (v10)
  {
    id v18 = a6;
    v10->_interleavingQueues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_discontinuities = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_mediaTypes = (unsigned int *)malloc_type_calloc(4uLL, [a3 count], 0x3D6F797DuLL);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int v13 = 0;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        uint64_t v16 = v13;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(a3);
          }
          int v13 = v16 + 1;
          v10->_mediaTypes[v16] = [*(id *)(*((void *)&v19 + 1) + 8 * v15) intValue];
          -[NSMutableArray addObject:](v10->_interleavingQueues, "addObject:", [MEMORY[0x1E4F1CA48] array]);
          ++v15;
          ++v16;
        }
        while (v12 != v15);
        uint64_t v12 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
    v10->_timeSkews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!a4) {
      v10->_motionDataPreserver = [[BWMotionDataPreserver alloc] initWithName:[(BWIrisSequenceAdjuster *)v10 description]];
    }
    v10->_generateIFrames = a5;
    v10->_attachedMediaKeysToPreserve = (NSArray *)v18;
    [(BWIrisSequenceAdjuster *)v10 reset];
  }
  return v10;
}

- (void)enqueueVideoBufferTime:(id *)a3 nativeTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v10 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = [(NSMutableArray *)self->_timeSkews count];
  if (v11 < 2) {
    goto LABEL_51;
  }
  v40 = a4;
  unsigned int v38 = v7;
  unsigned int v39 = v6;
  CMTimeValue v63 = *MEMORY[0x1E4F1F9F8];
  CMTimeValue v12 = v63;
  CMTimeScale v14 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeFlags v13 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale v64 = v14;
  CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CMTimeValue value = v63;
  CMTimeScale timescale = v14;
  BOOL v16 = (v13 & 1) == 0;
  v37 = a3;
  if ((v13 & 1) == 0)
  {
    unint64_t v17 = v11;
    unint64_t v18 = v11 - 1;
    if (((v11 - 1) & 0x8000000000000000) == 0)
    {
      int v19 = 0;
      v41 = 0;
      CMTimeEpoch v42 = v15;
      CMTimeEpoch epoch = v15;
      CMTimeFlags flags = v13;
      CMTimeFlags v20 = v13;
      while (1)
      {
        long long v21 = v10;
        long long v22 = (void *)[(NSMutableArray *)v10->_timeSkews objectAtIndexedSubscript:v18];
        if ([v22 isBracketFrame]) {
          break;
        }
        if ((flags & 1) == 0)
        {
          if (v22)
          {
            [v22 native];
            CMTimeFlags flags = v60.flags;
            CMTimeEpoch epoch = v60.epoch;
          }
          else
          {
            CMTimeEpoch epoch = 0;
            CMTimeFlags flags = 0;
            memset(&v60, 0, sizeof(v60));
          }
          CMTimeValue value = v60.value;
          CMTimeScale timescale = v60.timescale;
          if (v19)
          {
            int v23 = [v22 isSISFrame];
            v24 = v41;
            if (v23) {
              v24 = v22;
            }
            v41 = v24;
            int v19 = 1;
          }
          else
          {
            int v19 = 0;
          }
          goto LABEL_20;
        }
        if (![v22 isStartOfDiscontinuity])
        {
          if (v22)
          {
            [v22 native];
            CMTimeFlags v20 = v60.flags;
            CMTimeEpoch v42 = v60.epoch;
          }
          else
          {
            CMTimeEpoch v42 = 0;
            CMTimeFlags v20 = 0;
            memset(&v60, 0, sizeof(v60));
          }
          uint64_t v10 = v21;
          CMTimeValue v63 = v60.value;
          CMTimeScale v64 = v60.timescale;
          unint64_t v17 = v18;
          goto LABEL_22;
        }
        CMTimeValue v63 = v12;
        CMTimeScale v64 = v14;
        CMTimeFlags v20 = v13;
        CMTimeValue value = v12;
        CMTimeEpoch v42 = v15;
        CMTimeEpoch epoch = v15;
        CMTimeFlags flags = v13;
        CMTimeScale timescale = v14;
LABEL_21:
        uint64_t v10 = v21;
LABEL_22:
        BOOL v16 = (v20 & 1) == 0;
        if ((v20 & 1) == 0)
        {
          unint64_t v18 = v17 - 1;
          if (((v17 - 1) & 0x8000000000000000) == 0) {
            continue;
          }
        }
        goto LABEL_28;
      }
      CMTimeValue v63 = v12;
      CMTimeScale v64 = v14;
      CMTimeValue value = v12;
      CMTimeScale timescale = v14;
      v19 |= [v22 isSISFrame];
      CMTimeFlags v20 = v13;
      CMTimeEpoch v42 = v15;
      CMTimeEpoch epoch = v15;
      CMTimeFlags flags = v13;
LABEL_20:
      unint64_t v17 = v18;
      goto LABEL_21;
    }
  }
  v41 = 0;
  CMTimeEpoch v42 = v15;
  CMTimeFlags v20 = v13;
  CMTimeFlags flags = v13;
  CMTimeEpoch epoch = v15;
LABEL_28:
  uint64_t v7 = v38;
  uint64_t v6 = v39;
  a3 = v37;
  a4 = v40;
  if (!v16)
  {
    memset(&v60, 0, sizeof(v60));
    lhs.CMTimeValue value = value;
    lhs.CMTimeScale timescale = timescale;
    lhs.CMTimeFlags flags = flags;
    lhs.CMTimeEpoch epoch = epoch;
    rhs.CMTimeValue value = v63;
    rhs.CMTimeScale timescale = v64;
    rhs.CMTimeFlags flags = v20;
    rhs.CMTimeEpoch epoch = v42;
    CMTimeSubtract(&v60, &lhs, &rhs);
    CMTime lhs = v60;
    if (CMTimeGetSeconds(&lhs) <= 0.133333333 || (v10->_previewFrameDuration.flags & 1) == 0)
    {
      rhs.CMTimeValue value = value;
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      v57.CMTimeValue value = v63;
      v57.CMTimeScale timescale = v64;
      v57.CMTimeFlags flags = v20;
      v57.CMTimeEpoch epoch = v42;
      CMTimeSubtract(&lhs, &rhs, &v57);
      v10->_previewFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)lhs;
    }
    memset(&lhs, 0, sizeof(lhs));
    CMTime rhs = (CMTime)v10->_previewFrameDuration;
    CMTimeMultiply(&lhs, &rhs, 3);
    uint64_t v25 = (void *)[(NSMutableArray *)v10->_timeSkews lastObject];
    v26 = v25;
    memset(&rhs, 0, sizeof(rhs));
    if (v25) {
      [v25 native];
    }
    else {
      memset(&v56, 0, sizeof(v56));
    }
    p_previewFrameDuration = &v10->_previewFrameDuration;
    CMTime v57 = (CMTime)*v40;
    CMTimeSubtract(&rhs, &v57, &v56);
    memset(&v57, 0, sizeof(v57));
    CMTimeMake(&v55, 5, 1000);
    CMTime time1 = rhs;
    CMTimeAdd(&v57, &time1, &v55);
    CMTime time1 = v57;
    CMTime time2 = lhs;
    if (CMTimeCompare(&time1, &time2) < 1)
    {
      if (v41)
      {
        [v41 original];
        if ((v50 & 0x100000000) != 0)
        {
          if ([v26 isBracketFrame])
          {
            if ([v26 isSISFrame])
            {
              if ((v38 & 1) == 0)
              {
                [v26 setIsStartOfDiscontinuity:1];
                memset(&time1, 0, sizeof(time1));
                [v41 native];
                CMTime time2 = (CMTime)*v40;
                CMTimeSubtract(&time1, &time2, &v48);
                v29 = [BWIrisDiscontinuity alloc];
                [v41 original];
                BOOL generateIFrames = v10->_generateIFrames;
                timeSkews = v10->_timeSkews;
                CMTime time2 = time1;
                long long v45 = *(_OWORD *)&p_previewFrameDuration->value;
                int64_t v46 = v10->_previewFrameDuration.epoch;
                v32 = [(BWIrisDiscontinuity *)v29 initWithTime:v47 duration:&time2 targetFrameDuration:&v45 onlyRetime:1 generateIFrames:generateIFrames timeSkews:timeSkews];
                if (v32) {
LABEL_47:
                }
                  [(NSMutableArray *)v10->_discontinuities addObject:v32];
              }
            }
          }
        }
      }
      else
      {
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        uint64_t v51 = 0;
      }
    }
    else
    {
      [v26 setIsStartOfDiscontinuity:1];
      v28 = [BWIrisDiscontinuity alloc];
      if (v26) {
        [v26 original];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      BOOL v33 = v10->_generateIFrames;
      v34 = v10->_timeSkews;
      CMTime time1 = v57;
      *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_previewFrameDuration->value;
      time2.CMTimeEpoch epoch = v10->_previewFrameDuration.epoch;
      v32 = [(BWIrisDiscontinuity *)v28 initWithTime:v52 duration:&time1 targetFrameDuration:&time2 onlyRetime:0 generateIFrames:v33 timeSkews:v34];
      a4 = v40;
      if (v32) {
        goto LABEL_47;
      }
    }
  }
  if ((unint64_t)[(NSMutableArray *)v10->_discontinuities count] >= 0xC9) {
    [(NSMutableArray *)v10->_discontinuities removeObjectAtIndex:0];
  }
LABEL_51:
  v35 = [BWTimeSkew alloc];
  CMTime v60 = (CMTime)*a4;
  CMTime lhs = (CMTime)*a3;
  v36 = [(BWTimeSkew *)v35 initWithNativeTime:&v60 originalTime:&lhs isBracketFrame:v7 isSISFrame:v6];
  [(NSMutableArray *)v10->_timeSkews addObject:v36];

  if ((unint64_t)[(NSMutableArray *)v10->_timeSkews count] >= 0xC9) {
    [(NSMutableArray *)v10->_timeSkews removeObjectAtIndex:0];
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  free(self->_mediaTypes);
  v3.receiver = self;
  v3.super_class = (Class)BWIrisSequenceAdjuster;
  [(BWIrisSequenceAdjuster *)&v3 dealloc];
}

- (BOOL)discontinuityExistsBetweenCurrentPTS:(id *)a3 previousPTS:(id *)a4
{
  memset(&v12, 0, sizeof(v12));
  CMTime time = (CMTime)self->_previewFrameDuration;
  CMTimeMultiply(&v12, &time, 3);
  memset(&time, 0, sizeof(time));
  CMTime lhs = *(CMTime *)a3;
  CMTime rhs = *(CMTime *)a4;
  CMTimeSubtract(&time, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  CMTimeMake(&v8, 5, 1000);
  CMTime rhs = time;
  CMTimeAdd(&lhs, &rhs, &v8);
  CMTime rhs = lhs;
  CMTime v7 = v12;
  return CMTimeCompare(&rhs, &v7) > 0;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaTypeWithIndex:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(&v52, 0, sizeof(v52));
    CMSampleBufferGetPresentationTimeStamp(&v52, a3);
    char flags = v52.flags;
    CMAttachmentBearerRef target = 0;
    long long v49 = xmmword_1A5F0CC90;
    uint64_t v50 = 0;
    unsigned int v8 = self->_mediaTypes[a4];
    if (v8 == 1835365473)
    {
      CMAttachmentBearerRef target = CFRetain(a3);
      if ((flags & 1) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (v8 != 1986618469)
    {
      if (v8 == 1936684398)
      {
        CMTime time2 = v52;
        [(BWIrisSequenceAdjuster *)(CMTime *)self _adjustedTimeForAudioBufferWithTime:(uint64_t)&time1];
        CMTimeValue value = time1.value;
        LOBYTE(v9) = time1.flags;
        CMTimeScale timescale = time1.timescale;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, &time1, (long long *)&time2.value, (CMSampleBufferRef *)&target);
        if (!target)
        {
LABEL_56:
          fig_log_get_emitter();
          goto LABEL_57;
        }
        goto LABEL_37;
      }
      if ((*(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12) & 1) == 0)
      {
LABEL_39:
        if (target) {
          CFRelease(target);
        }
        return;
      }
LABEL_38:
      uint64_t v25 = (void *)[(NSMutableArray *)self->_interleavingQueues objectAtIndexedSubscript:a4];
      [v25 addObject:target];
      goto LABEL_39;
    }
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1F288];
    CFTypeRef v11 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F288], 0);
    CMTime v12 = (const void *)*MEMORY[0x1E4F1CFD0];
    unsigned int v13 = v11 == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
    CMTime time2 = v52;
    [(BWIrisSequenceAdjuster *)(uint64_t)self _adjustedTimeForVideoBufferWithTime:v13 forceKeepingBuffer:(uint64_t)&v49 discontinuityFrameAttributesOut:(long long *)&time1.value];
    CMTimeValue value = time1.value;
    CMTimeFlags v9 = time1.flags;
    CMTimeScale timescale = time1.timescale;
    CMTimeEpoch epoch = time1.epoch;
    if (time1.flags)
    {
      if (self->_lastVideoAdjustedTime.flags)
      {
        time1.CMTimeScale timescale = timescale;
        CMTime time2 = (CMTime)self->_lastVideoAdjustedTime;
        time1.CMTimeValue value = value;
        if (CMTimeCompare(&time1, &time2) <= 0) {
          goto LABEL_56;
        }
      }
      BOOL v16 = 0;
    }
    else
    {
      motionDataPreserver = self->_motionDataPreserver;
      v37 = v12;
      CFStringRef v36 = v10;
      BOOL v35 = motionDataPreserver == 0;
      if (motionDataPreserver)
      {
        CMTimeEpoch v34 = time1.epoch;
        [(BWMotionDataPreserver *)motionDataPreserver preserveMotionDataForSoonToBeDroppedSampleBuffer:a3];
      }
      else
      {
        if (self->_lastVideoAdjustedTime.flags)
        {
          CMTimeMake(&rhs, self->_lastVideoAdjustedTime.timescale / 100, self->_lastVideoAdjustedTime.timescale);
          CMTime time2 = (CMTime)self->_lastVideoAdjustedTime;
          CMTimeAdd(&time1, &time2, &rhs);
        }
        else
        {
          CMSampleBufferGetPresentationTimeStamp(&time1, a3);
        }
        CMTimeValue value = time1.value;
        CMTimeFlags v9 = time1.flags;
        CMTimeScale timescale = time1.timescale;
        CMTimeEpoch v34 = time1.epoch;
      }
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      attachedMediaKeysToPreserve = self->_attachedMediaKeysToPreserve;
      uint64_t v19 = [(NSArray *)attachedMediaKeysToPreserve countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(attachedMediaKeysToPreserve);
            }
            objc_msgSend(v17, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(a3, *(void *)(*((void *)&v42 + 1) + 8 * i)), *(void *)(*((void *)&v42 + 1) + 8 * i));
          }
          uint64_t v20 = [(NSArray *)attachedMediaKeysToPreserve countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v20);
      }
      BOOL v16 = v35;
      if ([v17 count])
      {

        self->_preservedAttachedMediaSbufByKeys = (NSMutableDictionary *)v17;
      }

      CMTime v12 = v37;
      CFStringRef v10 = v36;
      CMTimeEpoch epoch = v34;
      if ((v9 & 1) == 0) {
        goto LABEL_37;
      }
    }
    time1.CMTimeValue value = value;
    time1.CMTimeScale timescale = timescale;
    time1.char flags = v9;
    time1.CMTimeEpoch epoch = epoch;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, &time1, (long long *)&time2.value, (CMSampleBufferRef *)&target);
    CMAttachmentBearerRef v23 = target;
    if (!target)
    {
      fig_log_get_emitter();
LABEL_57:
      FigDebugAssert3();
      goto LABEL_39;
    }
    self->_lastVideoAdjustedTime.CMTimeValue value = value;
    self->_lastVideoAdjustedTime.CMTimeScale timescale = timescale;
    self->_lastVideoAdjustedTime.char flags = v9;
    self->_lastVideoAdjustedTime.CMTimeEpoch epoch = epoch;
    v24 = (void *)CMGetAttachment(v23, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if ((_BYTE)v49)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v50), 0x1EFA40A20);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *((void *)&v49 + 1)), 0x1EFA40A40);
      if (BYTE1(v49)) {
        CMSetAttachment(target, v10, v12, 1u);
      }
    }
    if (!v16)
    {
      v26 = self->_motionDataPreserver;
      if (v26) {
        [(BWMotionDataPreserver *)v26 prependPreservedMotionDataToSampleBuffer:target];
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      preservedAttachedMediaSbufByKeys = self->_preservedAttachedMediaSbufByKeys;
      uint64_t v28 = [(NSMutableDictionary *)preservedAttachedMediaSbufByKeys countByEnumeratingWithState:&v38 objects:v53 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(preservedAttachedMediaSbufByKeys);
            }
            uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            if (!BWSampleBufferGetAttachedMedia(target, v32))
            {
              uint64_t v33 = [(NSMutableDictionary *)self->_preservedAttachedMediaSbufByKeys objectForKeyedSubscript:v32];
              BWSampleBufferSetAttachedMedia(target, v32, v33);
            }
          }
          uint64_t v29 = [(NSMutableDictionary *)preservedAttachedMediaSbufByKeys countByEnumeratingWithState:&v38 objects:v53 count:16];
        }
        while (v29);
      }

      self->_preservedAttachedMediaSbufByKeys = 0;
      if ((v9 & 1) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    CMSetAttachment(target, @"SampleDataToBeDropped", v12, 1u);
    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:0x1EFA73EA0];
LABEL_37:
    if ((v9 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
}

- (CMTime)_adjustedTimeForAudioBufferWithTime:(uint64_t)a3@<X8>
{
  if (result)
  {
    int64_t v5 = result;
    *(_OWORD *)a3 = *(_OWORD *)&a2->value;
    *(void *)(a3 + 16) = a2->epoch;
    result = (CMTime *)[*(id *)&result->timescale count];
    if (result)
    {
      if ((v5[1].value & 0x100000000) != 0)
      {
        CMTime lhs = *a2;
        CMTime v6 = *(CMTime *)&v5->epoch;
        result = CMTimeSubtract(&v8, &lhs, &v6);
        *(CMTime *)a3 = v8;
      }
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (uint64_t)_adjustedTimeForVideoBufferWithTime:(unsigned int)a3@<W2> forceKeepingBuffer:(uint64_t)a4@<X3> discontinuityFrameAttributesOut:(long long *)a5@<X8>
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  *(void *)a5 = 0;
  *((void *)a5 + 1) = 0;
  *((void *)a5 + 2) = 0;
  if (result)
  {
    uint64_t v8 = result;
    CMTimeFlags v9 = (CMTime *)(result + 48);
    if ([*(id *)(result + 8) count]) {
      CFStringRef v10 = (CMTime *)(v8 + 48);
    }
    else {
      CFStringRef v10 = a2;
    }
    *a5 = *(_OWORD *)&v10->value;
    *((void *)a5 + 2) = v10->epoch;
    CFTypeRef v11 = (long long *)MEMORY[0x1E4F1F9F8];
    CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    LODWORD(v12) = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
    CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    CMTimeScale v14 = *(void **)(v8 + 8);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      CMTimeEpoch v24 = v13;
      int v23 = (int)v12;
      uint64_t v17 = *(void *)v33;
LABEL_7:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        CMTime v12 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
        CMTime v31 = *a2;
        if ([v12 containsVideoBufferTime:&v31]) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v16) {
            goto LABEL_7;
          }
          int v19 = 1;
          CMTimeEpoch v13 = v24;
          CMTimeFlags v9 = (CMTime *)(v8 + 48);
          LODWORD(v12) = v23;
          goto LABEL_20;
        }
      }
      CMTime v31 = *a2;
      CMTimeFlags v9 = (CMTime *)(v8 + 48);
      int v20 = [v12 shouldKeepBufferWithTime:&v31 forceKeepingBuffer:a3 nextAdjustedTimeInOut:v8 + 48 discontinuityFrameAttributesOut:a4];
      if (v12)
      {
        [v12 targetFrameDuration];
        LODWORD(v12) = v31.flags;
        CMTimeEpoch epoch = v31.epoch;
      }
      else
      {
        CMTimeEpoch epoch = 0;
        memset(&v31, 0, sizeof(v31));
      }
      CMTimeValue value = v31.value;
      CMTimeScale timescale = v31.timescale;
      if (v20)
      {
        int v19 = 0;
        CMTimeEpoch v13 = epoch;
        goto LABEL_20;
      }
      *a5 = *v11;
      *((void *)a5 + 2) = v24;
    }
    else
    {
      int v19 = 1;
LABEL_20:
      if ((*((unsigned char *)a5 + 12) & 1) == 0)
      {
        *a5 = *(_OWORD *)&a2->value;
        *((void *)a5 + 2) = a2->epoch;
      }
      if (v19)
      {
        memset(&v31, 0, sizeof(v31));
        CMTime v30 = *a2;
        [(BWIrisSequenceAdjuster *)(CMTime *)v8 _originalDurationForVideoBufferWithTime:(uint64_t)&v31];
        if ((v12 & 1) == 0)
        {
          CMTimeValue value = *(void *)(v8 + 112);
          LODWORD(v12) = *(_DWORD *)(v8 + 124);
          CMTimeScale timescale = *(_DWORD *)(v8 + 120);
          CMTimeEpoch v13 = *(void *)(v8 + 128);
        }
        if ((v31.flags & 1) == 0)
        {
          v31.CMTimeValue value = value;
          v31.CMTimeScale timescale = timescale;
          v31.char flags = v12;
          v31.CMTimeEpoch epoch = v13;
        }
        CMTime lhs = *(CMTime *)a5;
        CMTime rhs = v31;
        CMTimeAdd(&v30, &lhs, &rhs);
        *CMTimeFlags v9 = v30;
      }
    }
    CMTime v31 = *a2;
    result = -[BWIrisSequenceAdjuster _indexOfTime:](v8, &v31);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v22 = (void *)[*(id *)(v8 + 80) objectAtIndexedSubscript:result];
      long long v26 = *a5;
      uint64_t v27 = *((void *)a5 + 2);
      return [v22 setAdjusted:&v26];
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffsetForOriginalStillImageTime:(SEL)a3
{
  CMTime v6 = *(CMTime *)a4;
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  [(BWIrisSequenceAdjuster *)(uint64_t)self _audioOffsetForOriginalStillImageTime:&v5 adjustedStillImageTime:(uint64_t)retstr];
  return result;
}

- (void)_audioOffsetForOriginalStillImageTime:(CMTime *)a3@<X2> adjustedStillImageTime:(uint64_t)a4@<X8>
{
  if (a1)
  {
    CMTimeFlags flags = a3->flags;
    if ((flags & 1) == 0)
    {
      CMTime lhs = *a2;
      [(id)a1 adjustedTimeForTime:&lhs];
      *a3 = v13;
      CMTimeFlags flags = a3->flags;
    }
    if (~flags & 0x11) != 0 && (flags)
    {
      CMTime lhs = *a2;
      CMTime v11 = *a3;
      CMTimeSubtract(&v13, &lhs, &v11);
      long long v14 = *(_OWORD *)&v13.timescale;
      if (*(unsigned char *)(a1 + 28))
      {
        lhs.CMTimeValue value = v13.value & ~(v13.value >> 63);
        *(_OWORD *)&lhs.CMTimeScale timescale = v14;
        CMTime v11 = *(CMTime *)(a1 + 16);
        CMTimeSubtract(&v13, &lhs, &v11);
        CMTimeValue value = v13.value;
        long long v14 = *(_OWORD *)&v13.timescale;
      }
      else
      {
        *(void *)(a1 + 16) = v13.value & ~(v13.value >> 63);
        *(_OWORD *)(a1 + 24) = v14;
        CMTimeValue value = *MEMORY[0x1E4F1FA48];
        long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA48] + 8);
        -[BWIrisSequenceAdjuster _adjustTimesInAudioInterleavingQueues](a1);
      }
      *(void *)a4 = value;
      *(_OWORD *)(a4 + 8) = v14;
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
      *(void *)(a4 + 16) = *(void *)(v9 + 16);
    }
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
}

- (opaqueCMSampleBuffer)dequeueAndRetainAdjustedSampleBufferForMediaTypeWithIndex:(int64_t)a3
{
  CMTime v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_interleavingQueues, "objectAtIndexedSubscript:");
  result = (opaqueCMSampleBuffer *)[v5 count];
  if (result)
  {
    CMTime v7 = (opaqueCMSampleBuffer *)[v5 objectAtIndexedSubscript:0];
    CMSampleBufferRef v14 = 0;
    memset(&v13, 0, sizeof(v13));
    CMSampleBufferGetPresentationTimeStamp(&v13, v7);
    unsigned int v8 = self->_mediaTypes[a3];
    if (v8 != 1986618469)
    {
      if (v8 != 1936684398)
      {
        if (v8 == 1835365473)
        {
          memset(&v12, 0, sizeof(v12));
          CMTime v11 = v13;
          [(BWIrisSequenceAdjuster *)(uint64_t)self _adjustedTimeForMetadataBufferWithTime:(uint64_t)&v12];
          if (v12.flags)
          {
            if ((v12.flags & 0x10) != 0) {
              return v14;
            }
            CMTime v11 = v12;
            long long v9 = *MEMORY[0x1E4F1F9F8];
            uint64_t v10 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
            BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(v7, &v11, &v9, &v14);
            if (!v14)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              return v14;
            }
          }
        }
LABEL_11:
        [v5 removeObjectAtIndex:0];
        return v14;
      }
      if ((self->_firstIrisAudioOffset.flags & 1) == 0) {
        return v14;
      }
    }
    CMSampleBufferRef v14 = (CMSampleBufferRef)CFRetain(v7);
    goto LABEL_11;
  }
  return result;
}

- (uint64_t)_adjustedTimeForMetadataBufferWithTime:(uint64_t)a3@<X8>
{
  if (result)
  {
    CMTime v5 = (void *)result;
    *(_OWORD *)a3 = *a2;
    *(void *)(a3 + 16) = *((void *)a2 + 2);
    result = [*(id *)(result + 8) count];
    if (result)
    {
      long long v6 = *a2;
      uint64_t v7 = *((void *)a2 + 2);
      result = [v5 adjustedTimeForTime:&v6];
      *(_OWORD *)a3 = v8;
      *(void *)(a3 + 16) = v9;
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (void)adjustMovieInfoTimes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  memset(&v57[1], 0, sizeof(CMTime));
  if (a3)
  {
    [a3 movieStartTime];
    memset(v57, 0, 24);
    [a3 movieEndTime];
    memset(&v56, 0, sizeof(v56));
    [a3 movieEndingVideoPTS];
    memset(&v55, 0, sizeof(v55));
    [a3 stillImageCaptureTime];
  }
  else
  {
    memset(v57, 0, 24);
    memset(&v56, 0, sizeof(v56));
    memset(&v55, 0, sizeof(v55));
  }
  long long v53 = 0uLL;
  uint64_t v54 = 0;
  if (self)
  {
    CMTime v52 = v57[1];
    [(BWIrisSequenceAdjuster *)self adjustedTimeForTime:&v52];
    memset(&v52, 0, sizeof(v52));
    CMTime v51 = v56;
    [(BWIrisSequenceAdjuster *)self adjustedTimeForTime:&v51];
    memset(&v51, 0, sizeof(v51));
    CMTime v50 = v57[0];
    [(BWIrisSequenceAdjuster *)self adjustedTimeForTime:&v50];
  }
  else
  {
    memset(&v52, 0, sizeof(v52));
    memset(&v51, 0, sizeof(v51));
  }
  CMTime time1 = v52;
  CMTime time2 = (CMTime)self->_nextAdjustedVideoTime;
  CMTimeMinimum(&v50, &time1, &time2);
  CMTime v52 = v50;
  CMTime time1 = v51;
  CMTime time2 = (CMTime)self->_nextAdjustedVideoTime;
  CMTimeMinimum(&v50, &time1, &time2);
  CMTime v51 = v50;
  memset(&v50, 0, sizeof(v50));
  CMTime time1 = v55;
  [(BWIrisSequenceAdjuster *)self adjustedTimeForTime:&time1];
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  if ((BYTE12(v53) & 0x11) == 1)
  {
    long long v46 = v53;
    uint64_t v47 = v54;
    [a3 setMovieStartTime:&v46];
    if (a3)
    {
      [a3 movieStartTime];
    }
    else
    {
      long long v44 = 0uLL;
      uint64_t v45 = 0;
    }
    long long v42 = v44;
    uint64_t v43 = v45;
    [a3 setMovieTrimStartTime:&v42];
  }
  if ((v52.flags & 0x11) == 1)
  {
    CMTime v41 = v52;
    [a3 setMovieEndingVideoPTS:&v41];
  }
  if ((v51.flags & 0x11) == 1)
  {
    CMTime v40 = v51;
    [a3 setMovieEndTime:&v40];
    if (a3)
    {
      [a3 movieEndTime];
    }
    else
    {
      long long v38 = 0uLL;
      uint64_t v39 = 0;
    }
    long long v36 = v38;
    uint64_t v37 = v39;
    [a3 setMovieTrimEndTime:&v36];
  }
  if ((v50.flags & 0x11) == 1)
  {
    CMTime v35 = v50;
    [a3 setStillImageCaptureTime:&v35];
    return;
  }
  if ((v51.flags & 0x11) == 1)
  {
    id v34 = 0;
    CMTime time1 = v55;
    -[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((BOOL)self, &v34, &v33, &time1);
    id v6 = v34;
    if (v34)
    {
      [v34 adjusted];
      if (v32)
      {
        if (a3)
        {
          [a3 audioOffset];
          if ((v30 & 0x100000000) != 0) {
            return;
          }
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          uint64_t v31 = 0;
        }
        memset(&time1, 0, sizeof(time1));
        [v6 original];
        CMTime time2 = v55;
        CMTimeSubtract(&time1, &time2, &rhs);
        CMTimeMake(&v27, 800, 1000);
        CMTime time2 = time1;
        if (CMTimeCompare(&time2, &v27) <= 0)
        {
          CMTimeMake(&v26, 5, 1000);
          CMTime v25 = v51;
          CMTimeSubtract(&time2, &v25, &v26);
          CMTimeEpoch epoch = time2.epoch;
          CMTime v50 = time2;
          CMTimeValue value = time2.value;
          CMTimeFlags flags = time2.flags;
          CMTimeScale timescale = time2.timescale;
        }
        else
        {
          CMTimeFlags flags = *(_DWORD *)(v5 + 12);
          CMTimeEpoch epoch = *(void *)(v5 + 16);
          memset(&time2, 0, sizeof(time2));
          [v6 original];
          [v6 adjusted];
          CMTimeSubtract(&time2, &lhs, &v23);
          if (time2.flags)
          {
            CMTime v22 = v55;
            CMTime v21 = time2;
            CMTimeSubtract(&v25, &v22, &v21);
            CMTime v50 = v25;
          }
        }
        CMTime time2 = v55;
        CMTime v25 = v50;
        if (CMTimeCompare(&time2, &v25))
        {
          memset(&time2, 0, sizeof(time2));
          CMTime v25 = v55;
          CMTime v22 = v50;
          [(BWIrisSequenceAdjuster *)(uint64_t)self _audioOffsetForOriginalStillImageTime:&v22 adjustedStillImageTime:(uint64_t)&time2];
          if (time2.flags)
          {
            CMTime v25 = time2;
            CMTime v22 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if ((CMTimeCompare(&v25, &v22) & 0x80000000) == 0)
            {
              CMTime v20 = v50;
              [a3 setStillImageCaptureTime:&v20];
              CMTime v19 = time2;
              [a3 setAudioOffset:&v19];
            }
          }
        }
        if (flags)
        {
          if (a3) {
            [a3 stillImageCaptureTime];
          }
          else {
            memset(&v18, 0, sizeof(v18));
          }
          time2.CMTimeValue value = value;
          time2.CMTimeScale timescale = timescale;
          time2.CMTimeFlags flags = flags;
          time2.CMTimeEpoch epoch = epoch;
          if (CMTimeCompare(&time2, &v18) < 0)
          {
            CMTimeValue v14 = value;
            CMTimeScale v15 = timescale;
            CMTimeFlags v16 = flags;
            CMTimeEpoch v17 = epoch;
            [a3 setStillImageCaptureTime:&v14];
          }
        }
        if (a3)
        {
          [a3 audioOffset];
          if ((v12 & 0x100000000) != 0) {
            return;
          }
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v13 = 0;
        }
        if ([a3 isFinalEnqueuedIrisRequest])
        {
          CMTimeMake(&v10, 1, 1000);
          CMTime v9 = v10;
          [a3 setAudioOffset:&v9];
        }
      }
    }
  }
}

- (BOOL)_getPreviousTimeSkewOut:(void *)a3 andNextTimeSkewOut:(CMTime *)a4 forTime:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    *a3 = 0;
    *a2 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v8 = (void *)[*(id *)(result + 80) reverseObjectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (v13)
          {
            [*(id *)(*((void *)&v25 + 1) + 8 * i) adjusted];
            if ((v23 & 0x100000000) != 0)
            {
              [v13 original];
              CMTime time2 = *a4;
              if (CMTimeCompare(&time1, &time2) < 1)
              {
                result = 0;
                *a2 = v13;
                return result;
              }
            }
            [v13 adjusted];
            if ((v18 & 0x100000000) != 0)
            {
              [v13 original];
              CMTime time2 = *a4;
              if (CMTimeCompare(&v16, &time2) >= 1) {
                *a3 = v13;
              }
            }
          }
          else
          {
            uint64_t v22 = 0;
            uint64_t v23 = 0;
            uint64_t v24 = 0;
            uint64_t v18 = 0;
            uint64_t v19 = 0;
            uint64_t v17 = 0;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    CMTimeValue v14 = (void *)[*(id *)(v7 + 80) firstObject];
    if (v14) {
      [v14 original];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    CMTime time2 = *a4;
    return CMTimeCompare(&v15, &time2) > 0;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForTime:(SEL)a3
{
  id v26 = 0;
  id v27 = 0;
  CMTime v25 = *(CMTime *)a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((BOOL)self, &v27, &v26, &v25);
  id v7 = v26;
  if (!v26
    || (int v8 = (int)result, result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v26 adjusted], (v24 & 1) == 0))
  {
    uint64_t v9 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F0];
    int64_t var3 = *(void *)(v9 + 16);
LABEL_4:
    retstr->int64_t var3 = var3;
    return result;
  }
  if (v8)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    goto LABEL_4;
  }
  memset(&v25, 0, sizeof(v25));
  [v7 original];
  id v11 = v27;
  if (v27)
  {
    [v27 original];
    CMTimeSubtract(&v25, &lhs, &rhs);
    memset(&v21, 0, sizeof(v21));
    [v11 original];
  }
  else
  {
    memset(&rhs, 0, sizeof(rhs));
    CMTimeSubtract(&v25, &lhs, &rhs);
    memset(&v21, 0, sizeof(v21));
    memset(&v20, 0, sizeof(v20));
  }
  CMTime v19 = (CMTime)*a4;
  CMTimeSubtract(&v21, &v19, &v20);
  memset(&v19, 0, sizeof(v19));
  [v7 adjusted];
  if (v11) {
    [v11 adjusted];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CMTimeSubtract(&v19, &v18, &v17);
  memset(&v16, 0, sizeof(v16));
  CMTime time = v19;
  double Seconds = CMTimeGetSeconds(&time);
  CMTime time = v25;
  Float64 v13 = CMTimeGetSeconds(&time);
  CMTime time = v21;
  CMTimeMultiplyByFloat64(&v16, &time, Seconds / v13);
  if (v11) {
    [v11 adjusted];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  CMTime time = v16;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v14, &time);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForStillImageTime:(SEL)a3
{
  id v36 = 0;
  id v37 = 0;
  CMTime v35 = *(CMTime *)a4;
  BOOL v6 = -[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((BOOL)self, &v37, &v36, &v35);
  id v7 = v36;
  if (!v36)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
LABEL_7:
    id v11 = v37;
    if (v37)
    {
      [v37 original];
      [v11 adjusted];
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
      if (result) {
        goto LABEL_13;
      }
      [v11 original];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
      if (result) {
        goto LABEL_13;
      }
      memset(&v27, 0, sizeof(v27));
    }
    CMTime v35 = (CMTime)*a4;
    CMTimeSubtract(&time, &v35, &v27);
    CMTimeAbsoluteValue(&v29, &time);
    CMTimeMake(&v26, a4->var1 / 1000, a4->var1);
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v29, &v26);
    if ((result & 0x80000000) != 0) {
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v12 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F0];
    int64_t var3 = *(void *)(v12 + 16);
LABEL_15:
    retstr->int64_t var3 = var3;
    return result;
  }
  BOOL v8 = v6;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v36 adjusted];
  if ((v33 & 0x100000000) == 0) {
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_14:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    goto LABEL_15;
  }
  memset(&v35, 0, sizeof(v35));
  [v7 original];
  id v10 = v37;
  if (v37)
  {
    [v37 original];
    CMTimeSubtract(&v35, &lhs, &rhs);
    memset(&v23, 0, sizeof(v23));
    [v10 original];
  }
  else
  {
    memset(&rhs, 0, sizeof(rhs));
    CMTimeSubtract(&v35, &lhs, &rhs);
    memset(&v23, 0, sizeof(v23));
    memset(&v22, 0, sizeof(v22));
  }
  CMTime v21 = (CMTime)*a4;
  CMTimeSubtract(&v23, &v21, &v22);
  memset(&v21, 0, sizeof(v21));
  [v7 adjusted];
  if (v10) {
    [v10 adjusted];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CMTimeSubtract(&v21, &v20, &v19);
  memset(&v18, 0, sizeof(v18));
  CMTime v17 = v21;
  double Seconds = CMTimeGetSeconds(&v17);
  CMTime v17 = v35;
  Float64 v15 = CMTimeGetSeconds(&v17);
  CMTime v17 = v23;
  CMTimeMultiplyByFloat64(&v18, &v17, Seconds / v15);
  if (v10) {
    [v10 adjusted];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CMTime v17 = v18;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v16, &v17);
}

- (void)setMasterMovieOriginalStartTime:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->var0;
  self->_masterMovieOriginalStartTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_masterMovieOriginalStartTime.CMTimeValue value = v5;
  if ([(NSMutableArray *)self->_timeSkews count])
  {
    BOOL v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = (void *)[(NSMutableArray *)self->_timeSkews reverseObjectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      id v11 = (long long *)MEMORY[0x1E4F1F9F8];
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        Float64 v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        if (v13) {
          [*(id *)(*((void *)&v41 + 1) + 8 * v12) original];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = (CMTime)*a3;
        if (CMTimeCompare(&time1, &time2) < 0) {
          break;
        }
        CMTime v14 = (void *)[v13 copy];
        long long v37 = *v11;
        uint64_t v38 = *((void *)v11 + 2);
        [v14 setAdjusted:&v37];
        [v6 insertObject:v14 atIndex:0];

        if (v9 == ++v12)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    self->_timeSkews = (NSMutableArray *)v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    discontinuities = self->_discontinuities;
    uint64_t v16 = [(NSMutableArray *)discontinuities countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(discontinuities);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) resetWithNewTimeSkews:self->_timeSkews];
        }
        uint64_t v17 = [(NSMutableArray *)discontinuities countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v17);
    }
  }
  if ([(NSMutableArray *)self->_discontinuities count])
  {
    CMTime v20 = (void *)[MEMORY[0x1E4F28E60] indexSet];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    CMTime v21 = self->_discontinuities;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v30;
LABEL_23:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v21);
        }
        CMTime v27 = *(void **)(*((void *)&v29 + 1) + 8 * v26);
        if (v27) {
          [v27 time];
        }
        else {
          memset(&v28, 0, sizeof(v28));
        }
        CMTime time2 = (CMTime)*a3;
        if ((CMTimeCompare(&v28, &time2) & 0x80000000) == 0) {
          break;
        }
        [v20 addIndex:v24 + v26++];
        if (v23 == v26)
        {
          uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v45 count:16];
          v24 += v26;
          if (v23) {
            goto LABEL_23;
          }
          break;
        }
      }
    }
    [(NSMutableArray *)self->_discontinuities removeObjectsAtIndexes:v20];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieOriginalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (BOOL)readyToReleaseAudio
{
  return self->_firstIrisAudioOffset.flags & 1;
}

- (unint64_t)maximumNumberOfPreDiscontinuityFramesNeededToSatisfyAllDropFrameRecipes
{
  return 14;
}

- (void)_adjustTimesInAudioInterleavingQueues
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      uint64_t v14 = *(void *)v28;
      uint64_t v2 = -1;
      uint64_t v3 = MEMORY[0x1E4F1F9F8];
      do
      {
        uint64_t v4 = 0;
        uint64_t v12 = v2;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          long long v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
          ++v2;
          if (*(_DWORD *)(*(void *)(a1 + 72) + 4 * v2) == 1936684398)
          {
            BOOL v6 = (void *)[MEMORY[0x1E4F1CA48] array];
            [v15 addObject:v6];
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v7)
            {
              uint64_t v8 = v7;
              uint64_t v9 = *(void *)v24;
              do
              {
                for (uint64_t i = 0; i != v8; ++i)
                {
                  if (*(void *)v24 != v9) {
                    objc_enumerationMutation(v5);
                  }
                  id v11 = *(opaqueCMSampleBuffer **)(*((void *)&v23 + 1) + 8 * i);
                  CFTypeRef cf = 0;
                  memset(&v21, 0, sizeof(v21));
                  CMSampleBufferGetPresentationTimeStamp(&v20, v11);
                  [(BWIrisSequenceAdjuster *)(CMTime *)a1 _adjustedTimeForAudioBufferWithTime:(uint64_t)&v21];
                  CMTime v19 = v21;
                  long long v17 = *(_OWORD *)v3;
                  uint64_t v18 = *(void *)(v3 + 16);
                  BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(v11, &v19, &v17, (CMSampleBufferRef *)&cf);
                  [v6 addObject:cf];
                  CFRelease(cf);
                }
                uint64_t v8 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
              }
              while (v8);
            }
          }
          else
          {
            [v15 addObject:*(void *)(*((void *)&v27 + 1) + 8 * v4)];
          }
          ++v4;
        }
        while (v4 != v16);
        uint64_t v2 = v12 + v16;
        uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }

    *(void *)(a1 + 40) = v15;
  }
}

- (uint64_t)_indexOfTime:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v3 = *(void **)(result + 80);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        uint64_t v9 = v6 + v5;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
          if (v10) {
            [v10 original];
          }
          else {
            memset(&time1, 0, sizeof(time1));
          }
          CMTime v11 = *a2;
          if (!CMTimeCompare(&time1, &v11)) {
            return v6 + v8;
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v6 = v9;
        if (v5) {
          continue;
        }
        break;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (CMTime)_originalDurationForVideoBufferWithTime:(uint64_t)a3@<X8>
{
  if (!result)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    return result;
  }
  uint64_t v4 = result;
  CMTime v11 = *a2;
  result = (CMTime *)-[BWIrisSequenceAdjuster _indexOfTime:]((uint64_t)result, &v11);
  if (result == (CMTime *)0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v5 = (unint64_t)result,
        result = (CMTime *)[*(id *)&v4[3].timescale count],
        v5 >= (unint64_t)&result[-1].epoch + 7))
  {
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a3 + 16) = *(void *)(v8 + 16);
    return result;
  }
  uint64_t v6 = (void *)[*(id *)&v4[3].timescale objectAtIndexedSubscript:v5];
  uint64_t v7 = (void *)[*(id *)&v4[3].timescale objectAtIndexedSubscript:v5 + 1];
  if (!v7)
  {
    memset(&lhs, 0, sizeof(lhs));
    if (v6) {
      goto LABEL_6;
    }
LABEL_9:
    memset(&v9, 0, sizeof(v9));
    return CMTimeSubtract((CMTime *)a3, &lhs, &v9);
  }
  [v7 original];
  if (!v6) {
    goto LABEL_9;
  }
LABEL_6:
  [v6 original];
  return CMTimeSubtract((CMTime *)a3, &lhs, &v9);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setAudioOffsetForOriginalStillImageTimeMaximumFrameLatency:(int)a3
{
  self->_audioOffsetForOriginalStillImageTimeMaximumFrameLatency = a3;
}

@end