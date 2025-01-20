@interface JFXCompositionTrackGroup
+ (id)visualDescriptionForSegments:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursor;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorAtLastVideoInsertion;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorForMovieAudio;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutStart;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastRampToZeroEnd;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastRequest;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastVolumeChange;
- (AVMutableAudioMixInputParameters)audioParameters;
- (AVMutableComposition)composition;
- (AVMutableCompositionTrack)audioTrack;
- (AVMutableCompositionTrack)videoTrack;
- (BOOL)asbd:(opaqueCMFormatDescription *)a3 isEqualTo:(opaqueCMFormatDescription *)a4;
- (BOOL)commitPendingVolumeToTime:(id *)a3;
- (BOOL)containsAudioSegments;
- (BOOL)containsSegments;
- (BOOL)containsVideoSegments;
- (BOOL)isExporting;
- (BOOL)isFlexMusic;
- (BOOL)requestVolume:(float)a3 atTime:(id *)a4;
- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5;
- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 fillEmptySegment:(BOOL)a6;
- (BOOL)seenMoreThanOneASBD;
- (BOOL)seenSpeedClip;
- (BOOL)shouldCommitVolume:(float)a3;
- (BOOL)validate;
- (BOOL)videoTrackInUse;
- (JFXCompositionTrackGroup)initWithLabel:(id)a3 timeScale:(int)a4;
- (NSDictionary)fmTrackInfoDict;
- (NSMutableArray)audioSegments;
- (NSMutableArray)extraAudioTrackGroups;
- (NSMutableArray)videoSegments;
- (NSString)label;
- (NSString)preferredAudioTimePitchAlgorithm;
- (NSString)timePitchAlgorithm;
- (float)linearFadeOutValueForTime:(id *)a3;
- (float)setFadedVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5;
- (float)volumeAtLastVolumeChange;
- (float)volumeChangePending;
- (id)applyToTrack:(id)a3 withSegments:(id)a4 assets:(id)a5;
- (id)description;
- (int)actualVideoTrackID;
- (int)timeScale;
- (int)usableVideoTrackID;
- (opaqueCMFormatDescription)audioFormatDescription;
- (void)addExtraAudioTrackGroup:(id)a3;
- (void)apply:(id)a3;
- (void)applyAudioMixParameters:(id)a3;
- (void)applyCompositionItem:(id)a3;
- (void)applyCompositionItem:(id)a3 atTime:(id *)a4;
- (void)applyCompositionItem:(id)a3 atTime:(id *)a4 skipAudio:(BOOL)a5;
- (void)applyCompositionItem:(id)a3 skipAudio:(BOOL)a4;
- (void)applyCompositionItemAsLoopedAudio:(id)a3 forTimeRange:(id *)a4;
- (void)applyPaddingToTime:(id *)a3;
- (void)commitVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5;
- (void)dealloc;
- (void)markDirty;
- (void)removeExtraAudioTrackGroups;
- (void)resetVolumeState;
- (void)setAudioFormatDescription:(opaqueCMFormatDescription *)a3;
- (void)setAudioParameters:(id)a3;
- (void)setAudioSegments:(id)a3;
- (void)setAudioTrack:(id)a3;
- (void)setComposition:(id)a3;
- (void)setExtraAudioTrackGroups:(id)a3;
- (void)setFadeOutDuration:(id *)a3;
- (void)setFadeOutStart:(id *)a3;
- (void)setFmTrackInfoDict:(id)a3;
- (void)setIsExporting:(BOOL)a3;
- (void)setIsFlexMusic:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLastRampToZeroEnd:(id *)a3;
- (void)setPreferredAudioTimePitchAlgorithm:(id)a3;
- (void)setSeenMoreThanOneASBD:(BOOL)a3;
- (void)setSeenSpeedClip:(BOOL)a3;
- (void)setTimeOfLastRequest:(id *)a3;
- (void)setTimeOfLastVolumeChange:(id *)a3;
- (void)setTimePitchAlgorithm:(id)a3;
- (void)setTimeScale:(int)a3;
- (void)setVideoSegments:(id)a3;
- (void)setVideoTrack:(id)a3;
- (void)setVideoTrackInUse:(BOOL)a3;
- (void)setVolumeAtLastVolumeChange:(float)a3;
- (void)setVolumeChangePending:(float)a3;
- (void)validate;
@end

@implementation JFXCompositionTrackGroup

- (JFXCompositionTrackGroup)initWithLabel:(id)a3 timeScale:(int)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXCompositionTrackGroup;
  v7 = [(JFXCompositionTrackGroup *)&v18 init];
  v8 = v7;
  if (v7)
  {
    [(JFXCompositionTrackGroup *)v7 setLabel:v6];
    CMTimeMake(&v17, 0, a4);
    v8->_cursor = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    CMTimeMake(&v17, 0, a4);
    v8->_cursorForMovieAudio = ($95D729B680665BEAEFA1D6FCA8238556)v17;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    videoSegments = v8->_videoSegments;
    v8->_videoSegments = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    audioSegments = v8->_audioSegments;
    v8->_audioSegments = v11;

    uint64_t v13 = MEMORY[0x263F010E0];
    long long v14 = *MEMORY[0x263F010E0];
    *(_OWORD *)&v8->_fadeOutStart.value = *MEMORY[0x263F010E0];
    int64_t v15 = *(void *)(v13 + 16);
    v8->_fadeOutStart.epoch = v15;
    *(_OWORD *)&v8->_fadeOutDuration.value = v14;
    v8->_fadeOutDuration.epoch = v15;
    v8->_timeScale = a4;
  }

  return v8;
}

- (void)dealloc
{
  [(JFXCompositionTrackGroup *)self setAudioFormatDescription:0];
  [(JFXCompositionTrackGroup *)self removeExtraAudioTrackGroups];
  [(JFXCompositionTrackGroup *)self setComposition:0];
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionTrackGroup;
  [(JFXCompositionTrackGroup *)&v3 dealloc];
}

- (BOOL)containsVideoSegments
{
  if (self->_videoTrack)
  {
    videoSegments = self->_videoSegments;
    if (videoSegments) {
      LOBYTE(videoSegments) = [(NSMutableArray *)videoSegments count] != 0;
    }
  }
  else
  {
    LOBYTE(videoSegments) = 0;
  }
  return (char)videoSegments;
}

- (BOOL)containsAudioSegments
{
  if (self->_audioTrack)
  {
    audioSegments = self->_audioSegments;
    if (audioSegments) {
      LOBYTE(audioSegments) = [(NSMutableArray *)audioSegments count] != 0;
    }
  }
  else
  {
    LOBYTE(audioSegments) = 0;
  }
  return (char)audioSegments;
}

- (BOOL)containsSegments
{
  if ([(JFXCompositionTrackGroup *)self containsVideoSegments]) {
    return 1;
  }
  return [(JFXCompositionTrackGroup *)self containsAudioSegments];
}

- (void)setAudioTrack:(id)a3
{
  v8 = (AVMutableCompositionTrack *)a3;
  if (self->_audioTrack != v8)
  {
    objc_storeStrong((id *)&self->_audioTrack, a3);
    v5 = [MEMORY[0x263EFA780] audioMixInputParametersWithTrack:v8];
    audioParameters = self->_audioParameters;
    self->_audioParameters = v5;

    fmTrackInfoDict = self->_fmTrackInfoDict;
    self->_fmTrackInfoDict = 0;

    [(JFXCompositionTrackGroup *)self removeExtraAudioTrackGroups];
    [(JFXCompositionTrackGroup *)self setSeenSpeedClip:0];
    [(JFXCompositionTrackGroup *)self setSeenMoreThanOneASBD:0];
    [(JFXCompositionTrackGroup *)self setAudioFormatDescription:0];
  }
  [(JFXCompositionTrackGroup *)self resetVolumeState];
}

- (int)usableVideoTrackID
{
  videoTrack = self->_videoTrack;
  if (videoTrack) {
    return [(AVMutableCompositionTrack *)videoTrack trackID];
  }
  else {
    return -1;
  }
}

- (int)actualVideoTrackID
{
  return [(AVMutableCompositionTrack *)self->_videoTrack trackID];
}

+ (id)visualDescriptionForSegments:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        memset(v29, 0, sizeof(v29));
        if (v9)
        {
          [v9 timeMapping];
          char flags = v29[0].start.flags;
        }
        else
        {
          char flags = 0;
        }
        *(_OWORD *)&time.start.CMTimeValue value = *(_OWORD *)&v29[1].start.value;
        time.start.epoch = v29[1].start.epoch;
        CMTimeConvertScale(&v28, &time.start, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        CMTimeValue value = v28.value;
        CMTimeRange time = v29[1];
        CMTimeRangeGetEnd(&v27, &time);
        CMTimeConvertScale(&v25, &v27, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend(v4, "appendFormat:", @"\n[%lld\t%lld]", value, v25.value);
        if (flags)
        {
          *(_OWORD *)&time.start.CMTimeValue value = *(_OWORD *)&v29[0].start.value;
          time.start.epoch = v29[0].start.epoch;
          CMTimeConvertScale(&v24, &time.start, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          CMTimeValue v12 = v24.value;
          CMTimeRange time = v29[0];
          CMTimeRangeGetEnd(&v23, &time);
          CMTimeConvertScale(&v22, &v23, 30, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          uint64_t v13 = v6;
          uint64_t v14 = v7;
          CMTimeValue v15 = v22.value;
          v16 = [v9 sourceURL];
          CMTime v17 = [v16 path];
          objc_super v18 = [v17 lastPathComponent];
          CMTimeValue v20 = v15;
          uint64_t v7 = v14;
          uint64_t v6 = v13;
          [v4 appendFormat:@"\t source -> [%lld\t%lld] (%@)", v12, v20, v18];
        }
        else
        {
          [v4 appendFormat:@" (empty)"];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)description
{
  id v3 = [NSString stringWithFormat:@"%@\n", self->_label];
  if ((int)[(AVMutableCompositionTrack *)self->_videoTrack trackID] > 0
    || (int)[(AVMutableCompositionTrack *)self->_audioTrack trackID] >= 1)
  {
    if ((int)[(AVMutableCompositionTrack *)self->_videoTrack trackID] >= 1)
    {
      v4 = NSString;
      uint64_t v5 = [(AVMutableCompositionTrack *)self->_videoTrack trackID];
      label = self->_label;
      uint64_t v7 = +[JFXCompositionTrackGroup visualDescriptionForSegments:self->_videoSegments];
      v8 = [v4 stringWithFormat:@"ID%d %@-Video: %@\n", v5, label, v7];

      uint64_t v9 = [NSString stringWithFormat:@"%@%@", v3, v8];

      id v3 = (void *)v9;
    }
    if ((int)[(AVMutableCompositionTrack *)self->_audioTrack trackID] >= 1)
    {
      v10 = NSString;
      uint64_t v11 = [(AVMutableCompositionTrack *)self->_audioTrack trackID];
      CMTimeValue v12 = self->_label;
      uint64_t v13 = +[JFXCompositionTrackGroup visualDescriptionForSegments:self->_audioSegments];
      uint64_t v14 = [v10 stringWithFormat:@"ID%d %@-Audio: %@\n", v11, v12, v13];

      uint64_t v15 = [NSString stringWithFormat:@"%@%@", v3, v14];

      id v3 = (void *)v15;
    }
  }
  return v3;
}

- (void)addExtraAudioTrackGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXCompositionTrackGroup *)self extraAudioTrackGroups];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    [(JFXCompositionTrackGroup *)self setExtraAudioTrackGroups:v6];
  }
  id v7 = [(JFXCompositionTrackGroup *)self extraAudioTrackGroups];
  [v7 addObject:v4];
}

- (void)removeExtraAudioTrackGroups
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(JFXCompositionTrackGroup *)self extraAudioTrackGroups];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = [(JFXCompositionTrackGroup *)self composition];
        v10 = [v8 audioTrack];
        [v9 removeTrack:v10];

        uint64_t v11 = [v8 audioTrack];
        [v11 setSegments:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(JFXCompositionTrackGroup *)self setExtraAudioTrackGroups:0];
}

- (BOOL)asbd:(opaqueCMFormatDescription *)a3 isEqualTo:(opaqueCMFormatDescription *)a4
{
  return CMAudioFormatDescriptionEqual(a3, a4, 0xDu, 0) != 0;
}

- (void)applyCompositionItem:(id)a3
{
}

- (void)applyCompositionItem:(id)a3 skipAudio:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_CMTime cursor = &self->_cursor;
  CMTime cursor = (CMTime)self->_cursor;
  memset(&v69, 0, sizeof(v69));
  CMTimeMake(&v69, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  if (self->_videoTrack)
  {
    self->_videoTrackInUse = 1;
  }
  else
  {
    char v8 = [v6 hasVideoContent];
    videoTrack = self->_videoTrack;
    self->_videoTrackInUse = v8;
    if (!videoTrack) {
      goto LABEL_18;
    }
  }
  *(_OWORD *)&self->_cursorAtLastVideoInsertion.CMTimeValue value = *(_OWORD *)&p_cursor->value;
  self->_cursorAtLastVideoInsertion.epoch = self->_cursor.epoch;
  memset(&v68, 0, sizeof(v68));
  if (v6) {
    [v6 destinationDuration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)&self->_cursorAtLastVideoInsertion.value;
  start.start.epoch = self->_cursorAtLastVideoInsertion.epoch;
  CMTimeRangeMake(&v68, &start.start, &duration);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  CMTimeRange start = v68;
  v10 = [v6 videoTrackSegmentsWithDestinationRange:&start];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        [(NSMutableArray *)self->_videoSegments addObject:v15];
        if (v15)
        {
          [v15 timeMapping];
        }
        else
        {
          memset(v60, 0, sizeof(v60));
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
        }
        CMTime rhs = *(CMTime *)((char *)v60 + 8);
        lhs.CMTimeRange start = v69;
        CMTimeAdd(&start.start, &lhs.start, &rhs);
        CMTime v69 = start.start;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v12);
  }

LABEL_18:
  int v16 = [v6 isFinalClip];
  if (v16) {
    int v16 = [v6 needSilenceAtEnd];
  }
  if (self->_audioTrack && !v4 | v16)
  {
    if (self->_videoTrack) {
      CMTime cursor = (CMTime)self->_cursorForMovieAudio;
    }
    memset(&v55, 0, sizeof(v55));
    CMTimeMake(&v55, 0, [(JFXCompositionTrackGroup *)self timeScale]);
    CMTime v54 = cursor;
    [(JFXCompositionTrackGroup *)self lastRampToZeroEnd];
    v68.CMTimeRange start = cursor;
    if (CMTimeCompare(&v68.start, &time2) < 0) {
      [(JFXCompositionTrackGroup *)self lastRampToZeroEnd];
    }
    CMTime v27 = &self->_cursor;
    id v28 = v6;
    if ([v6 needAudioLoop])
    {
      *(_OWORD *)&v68.start.CMTimeValue value = *(_OWORD *)&p_cursor->value;
      v68.start.epoch = self->_cursor.epoch;
      [v6 audioTrackSegmentsLoopedWithDestinationTime:&v68];
    }
    else
    {
      *(_OWORD *)&v68.start.CMTimeValue value = *(_OWORD *)&p_cursor->value;
      v68.start.epoch = self->_cursor.epoch;
      start.CMTimeRange start = v54;
      [v6 audioTrackSegmentsWithDestinationTime:&v68 paddedFromTime:&start];
    uint64_t v17 = };
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      long long v30 = *MEMORY[0x263F010E0];
      CMTimeEpoch v21 = *(void *)(MEMORY[0x263F010E0] + 16);
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(obj);
          }
          CMTime v23 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          long long v24 = 0uLL;
          memset(&v68, 0, sizeof(v68));
          if (v23)
          {
            [v23 timeMapping];
            long long v24 = 0uLL;
          }
          else
          {
            long long v47 = 0uLL;
            memset(&v48, 0, sizeof(v48));
            long long v45 = 0uLL;
            long long v46 = 0uLL;
          }
          CMTimeRange v68 = v48;
          *(_OWORD *)&start.start.epoch = v24;
          *(_OWORD *)&start.duration.timescale = v24;
          *(_OWORD *)&start.start.CMTimeValue value = v24;
          lhs.CMTimeRange start = cursor;
          CMTime v43 = v55;
          CMTimeAdd(&v44, &lhs.start, &v43);
          lhs.CMTimeRange start = cursor;
          CMTime v43 = v55;
          CMTimeAdd(&v41, &lhs.start, &v43);
          *(_OWORD *)&lhs.start.CMTimeValue value = *(_OWORD *)&v68.start.value;
          lhs.start.epoch = v68.start.epoch;
          CMTimeSubtract(&v42, &lhs.start, &v41);
          CMTimeRangeMake(&start, &v44, &v42);
          lhs.CMTimeRange start = start.duration;
          *(_OWORD *)&v43.CMTimeValue value = v30;
          v43.epoch = v21;
          if (CMTimeCompare(&lhs.start, &v43) >= 1)
          {
            id v25 = objc_alloc(MEMORY[0x263EFA6D0]);
            CMTimeRange lhs = start;
            v26 = (void *)[v25 initWithTimeRange:&lhs];
            [(NSMutableArray *)self->_audioSegments addObject:v26];
            CMTime v43 = v55;
            CMTime v39 = start.duration;
            CMTimeAdd(&lhs.start, &v43, &v39);
            CMTime v55 = lhs.start;
          }
          lhs.CMTimeRange start = cursor;
          CMTime v43 = v55;
          CMTimeAdd(&v68.start, &lhs.start, &v43);
          [(NSMutableArray *)self->_audioSegments addObject:v23];
          if (self->_videoTrack)
          {
            if (v23) {
              goto LABEL_41;
            }
          }
          else
          {
            if (v23)
            {
              [v23 timeMapping];
            }
            else
            {
              memset(v37, 0, sizeof(v37));
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
            }
            CMTime v38 = *(CMTime *)((char *)v37 + 8);
            CMTime v43 = v69;
            CMTimeAdd(&lhs.start, &v43, &v38);
            CMTime v69 = lhs.start;
            if (v23)
            {
LABEL_41:
              objc_msgSend(v23, "timeMapping", v27, v28);
              goto LABEL_47;
            }
          }
          memset(v31, 0, sizeof(v31));
LABEL_47:
          CMTime v32 = *(CMTime *)&v31[1];
          CMTime v43 = v55;
          CMTimeAdd(&lhs.start, &v43, &v32);
          CMTime v55 = lhs.start;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
      }
      while (v19);
    }

    *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)&self->_cursorForMovieAudio.value;
    start.start.epoch = self->_cursorForMovieAudio.epoch;
    lhs.CMTimeRange start = v55;
    CMTimeAdd(&v68.start, &start.start, &lhs.start);
    *(_OWORD *)&self->_cursorForMovieAudio.CMTimeValue value = *(_OWORD *)&v68.start.value;
    self->_cursorForMovieAudio.epoch = v68.start.epoch;

    p_CMTime cursor = v27;
    id v6 = v28;
  }
  *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)&p_cursor->value;
  start.start.epoch = p_cursor->epoch;
  lhs.CMTimeRange start = v69;
  CMTimeAdd(&v68.start, &start.start, &lhs.start);
  *(_OWORD *)&p_cursor->CMTimeValue value = *(_OWORD *)&v68.start.value;
  p_cursor->epoch = v68.start.epoch;
}

- (void)applyPaddingToTime:(id *)a3
{
  memset(&v35, 0, sizeof(v35));
  CMTimeMake(&v35, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  memset(&v34, 0, sizeof(v34));
  [(JFXCompositionTrackGroup *)self cursor];
  [(JFXCompositionTrackGroup *)self cursor];
  lhs.CMTime start = (CMTime)*a3;
  CMTimeSubtract(&duration, &lhs.start, &rhs);
  CMTimeRangeMake(&v34, &start, &duration);
  uint64_t v5 = (CMTime *)MEMORY[0x263F010E0];
  if (self->_videoTrack)
  {
    lhs.CMTime start = v34.duration;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    if (CMTimeCompare(&lhs.start, &time2) >= 1)
    {
      id v6 = objc_alloc(MEMORY[0x263EFA6D0]);
      CMTimeRange lhs = v34;
      uint64_t v7 = (void *)[v6 initWithTimeRange:&lhs];
      [(NSMutableArray *)self->_videoSegments addObject:v7];
      if (v7)
      {
        [v7 timeMapping];
      }
      else
      {
        memset(v28, 0, sizeof(v28));
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
      }
      CMTime v35 = *(CMTime *)((char *)v28 + 8);
    }
    if (self->_videoTrack)
    {
      *(_OWORD *)&lhs.start.CMTimeValue value = *(_OWORD *)&a3->var0;
      lhs.start.epoch = a3->var3;
      CMTime time2 = (CMTime)self->_cursorForMovieAudio;
      CMTimeSubtract(&v23, &lhs.start, &time2);
      CMTime time2 = (CMTime)self->_cursorForMovieAudio;
      CMTimeRangeMake(&lhs, &time2, &v23);
      CMTimeRange v34 = lhs;
    }
  }
  if (self->_audioTrack)
  {
    lhs.CMTime start = v34.duration;
    CMTime time2 = *v5;
    if (CMTimeCompare(&lhs.start, &time2) >= 1)
    {
      id v8 = objc_alloc(MEMORY[0x263EFA6D0]);
      CMTimeRange lhs = v34;
      uint64_t v9 = (void *)[v8 initWithTimeRange:&lhs];
      [(NSMutableArray *)self->_audioSegments addObject:v9];
      if (!self->_videoTrack)
      {
        if (v9)
        {
          [v9 timeMapping];
        }
        else
        {
          memset(v22, 0, sizeof(v22));
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
        }
        CMTime v35 = *(CMTime *)((char *)v22 + 8);
      }
      p_cursorForMovieAudio = &self->_cursorForMovieAudio;
      if (v9)
      {
        [v9 timeMapping];
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
      }
      CMTime v17 = *(CMTime *)((char *)v16 + 8);
      *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_cursorForMovieAudio->value;
      time2.epoch = self->_cursorForMovieAudio.epoch;
      CMTimeAdd(&lhs.start, &time2, &v17);
      *(_OWORD *)&p_cursorForMovieAudio->CMTimeValue value = *(_OWORD *)&lhs.start.value;
      self->_cursorForMovieAudio.epoch = lhs.start.epoch;
    }
  }
  CMTime time2 = (CMTime)self->_cursor;
  CMTime v11 = v35;
  CMTimeAdd(&lhs.start, &time2, &v11);
  *(_OWORD *)&self->_cursor.CMTimeValue value = *(_OWORD *)&lhs.start.value;
  self->_cursor.epoch = lhs.start.epoch;
}

- (void)applyCompositionItem:(id)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  [(JFXCompositionTrackGroup *)self applyCompositionItem:a3 atTime:&v4 skipAudio:0];
}

- (void)applyCompositionItem:(id)a3 atTime:(id *)a4 skipAudio:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(JFXCompositionTrackGroup *)self cursor];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  if ((CMTimeCompare((CMTime *)&v9, &time2) & 0x80000000) == 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
    [(JFXCompositionTrackGroup *)self applyPaddingToTime:&v9];
  }
  [(JFXCompositionTrackGroup *)self applyCompositionItem:v8 skipAudio:v5];
}

- (void)applyCompositionItemAsLoopedAudio:(id)a3 forTimeRange:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  memset(&v29, 0, sizeof(v29));
  CMTimeMake(&v29, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  videoTrack = self->_videoTrack;
  self->_videoTrack = 0;

  if (self->_audioTrack)
  {
    long long v8 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)long long v27 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v27[16] = v8;
    long long v28 = *(_OWORD *)&a4->var1.var1;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v6 audioTrackSegmentsLoopedForDestinationTimeRange:v27];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [(NSMutableArray *)self->_audioSegments addObject:v14];
          if (!self->_videoTrack)
          {
            if (v14)
            {
              [v14 timeMapping];
            }
            else
            {
              memset(v21, 0, sizeof(v21));
              long long v19 = 0u;
              long long v20 = 0u;
              long long v17 = 0u;
              long long v18 = 0u;
            }
            CMTime rhs = *(CMTime *)((char *)v21 + 8);
            CMTime lhs = v29;
            CMTimeAdd((CMTime *)v27, &lhs, &rhs);
            CMTime v29 = *(CMTime *)v27;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v11);
    }
  }
  CMTime lhs = (CMTime)self->_cursor;
  CMTime v15 = v29;
  CMTimeAdd((CMTime *)v27, &lhs, &v15);
  *(_OWORD *)&self->_cursor.CMTimeValue value = *(_OWORD *)v27;
  self->_cursor.epoch = *(void *)&v27[16];
}

- (BOOL)validate
{
  videoTrack = self->_videoTrack;
  if (!videoTrack)
  {
    id v6 = 0;
    goto LABEL_7;
  }
  videoSegments = self->_videoSegments;
  id v16 = 0;
  BOOL v5 = [(AVMutableCompositionTrack *)videoTrack validateTrackSegments:videoSegments error:&v16];
  id v6 = v16;
  if (v5)
  {
LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  uint64_t v7 = JFXLog_playback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[JFXCompositionTrackGroup validate]();
  }

  BOOL v8 = 0;
LABEL_8:
  audioTrack = self->_audioTrack;
  if (audioTrack)
  {
    audioSegments = self->_audioSegments;
    id v15 = v6;
    BOOL v11 = [(AVMutableCompositionTrack *)audioTrack validateTrackSegments:audioSegments error:&v15];
    id v12 = v15;

    if (!v11)
    {
      long long v13 = JFXLog_playback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[JFXCompositionTrackGroup validate]();
      }

      BOOL v8 = 0;
    }
  }
  else
  {
    id v12 = v6;
  }

  return v8;
}

- (id)applyToTrack:(id)a3 withSegments:(id)a4 assets:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v40 = a5;
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x3032000000;
  long long v58 = __Block_byref_object_copy__13;
  long long v59 = __Block_byref_object_dispose__13;
  id v60 = 0;
  CMTime v39 = v7;
  long long v36 = v8;
  if (!v7)
  {
    uint64_t v29 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -1, 0, v8);
    long long v30 = (void *)v56[5];
    v56[5] = v29;

LABEL_23:
    id v33 = (id)v56[5];
    goto LABEL_26;
  }
  if (!v8)
  {
    uint64_t v31 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -1, 0, 0);
    CMTime v32 = (void *)v56[5];
    v56[5] = v31;

    goto LABEL_23;
  }
  memset(&v54, 0, sizeof(v54));
  CMTimeMakeWithSeconds(&duration, 86400.0, [(JFXCompositionTrackGroup *)self timeScale]);
  *(_OWORD *)&start.start.CMTimeValue value = *MEMORY[0x263F010E0];
  start.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
  CMTimeRangeMake(&v54, &start.start, &duration);
  CMTimeRange start = v54;
  [v7 removeTimeRange:&start];
  [v7 setSegments:0];
  start.start.CMTimeValue value = 0;
  *(void *)&start.start.timescale = &start;
  start.start.epoch = 0x2020000000;
  LOBYTE(start.duration.value) = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = NSDictionary;
  uint64_t v10 = [NSNumber numberWithBool:1];
  v37 = [v9 dictionaryWithObject:v10 forKey:*MEMORY[0x263EFA288]];

  BOOL v11 = dispatch_group_create();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v16, "isEmpty", v36) & 1) == 0)
        {
          long long v17 = [v16 sourceURL];
          long long v18 = [v40 objectForKey:v17];

          if (v18) {
            goto LABEL_13;
          }
          long long v19 = (void *)MEMORY[0x263EFA8D0];
          long long v20 = [v16 sourceURL];
          long long v18 = [v19 URLAssetWithURL:v20 options:v37];

          long long v21 = JFXLog_playback();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            CMTime v22 = [v16 sourceURL];
            -[JFXCompositionTrackGroup applyToTrack:withSegments:assets:](v22, buf, &v62, v21);
          }

          if (v18)
          {
LABEL_13:
            dispatch_group_enter(v11);
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke;
            v41[3] = &unk_264C0B908;
            id v23 = v39;
            id v42 = v23;
            CMTime v43 = v16;
            long long v46 = &v55;
            p_CMTimeRange start = &start;
            CMTime v44 = self;
            long long v45 = v11;
            [v18 findCompatibleTrackForCompositionTrack:v23 completionHandler:v41];
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v13);
  }

  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (!*(unsigned char *)(*(void *)&start.start.timescale + 24)) {
    goto LABEL_19;
  }
  long long v24 = [(AVMutableAudioMixInputParameters *)self->_audioParameters audioTimePitchAlgorithm];
  long long v25 = [(JFXCompositionTrackGroup *)self preferredAudioTimePitchAlgorithm];
  char v26 = [v24 isEqualToString:v25];

  if (v26)
  {
    if (!*(unsigned char *)(*(void *)&start.start.timescale + 24))
    {
LABEL_19:
      long long v27 = [(AVMutableAudioMixInputParameters *)self->_audioParameters audioTimePitchAlgorithm];
      BOOL v28 = v27 == 0;

      if (!v28) {
        [(AVMutableAudioMixInputParameters *)self->_audioParameters setAudioTimePitchAlgorithm:0];
      }
    }
  }
  else
  {
    CMTimeRange v34 = [(JFXCompositionTrackGroup *)self preferredAudioTimePitchAlgorithm];
    [(AVMutableAudioMixInputParameters *)self->_audioParameters setAudioTimePitchAlgorithm:v34];
  }
  id v33 = (id)v56[5];

  _Block_object_dispose(&start, 8);
LABEL_26:
  _Block_object_dispose(&v55, 8);

  return v33;
}

void __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      [v7 timeMapping];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *(void **)(a1 + 40);
      long long v55 = v49;
      long long v56 = v50;
      long long v57 = v51;
      if (v9)
      {
        [v9 timeMapping];
        goto LABEL_10;
      }
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
LABEL_10:
    long long v47 = v44;
    uint64_t v48 = v45;
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v11 + 40);
    [v8 insertTimeRange:&v55 ofTrack:v5 atTime:&v47 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    id v12 = *(void **)(a1 + 40);
    if (v12)
    {
      [v12 timeMapping];
      uint64_t v13 = *(void **)(a1 + 40);
      CMTime time1 = *(CMTime *)((char *)v38 + 8);
      if (v13)
      {
        [v13 timeMapping];
        goto LABEL_15;
      }
    }
    else
    {
      long long v37 = 0u;
      memset(v38, 0, sizeof(v38));
      *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)((char *)v38 + 8);
      time1.epoch = 0;
    }
    memset(v35, 0, sizeof(v35));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
LABEL_15:
    CMTime time2 = *(CMTime *)((char *)v35 + 8);
    if (!CMTimeCompare(&time1, &time2)) {
      goto LABEL_26;
    }
    memset(&v30, 0, sizeof(v30));
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14)
    {
      [v14 timeMapping];
      id v15 = *(void **)(a1 + 40);
      *(_OWORD *)&start.CMTimeValue value = v26;
      start.epoch = v27;
      if (v15)
      {
        [v15 timeMapping];
LABEL_21:
        CMTime duration = *(CMTime *)((char *)v21 + 8);
        CMTimeRangeMake(&v30, &start, &duration);
        id v16 = *(void **)(a1 + 40);
        if (v16) {
          [v16 timeMapping];
        }
        else {
          memset(&v19[1], 0, 96);
        }
        long long v17 = *(void **)(a1 + 32);
        v19[0] = v30;
        CMTime v18 = v19[2].duration;
        [v17 scaleTimeRange:v19 toDuration:&v18];
        if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 48) + 48)) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        }
        goto LABEL_26;
      }
    }
    else
    {
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      long long v25 = 0uLL;
      long long v26 = 0uLL;
      long long v23 = 0uLL;
      long long v24 = 0uLL;
      memset(&start, 0, sizeof(start));
    }
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    goto LABEL_21;
  }
  uint64_t v10 = JFXLog_playback();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke_cold_1(a1);
  }

LABEL_26:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)apply:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(JFXCompositionTrackGroup *)self applyToTrack:self->_videoTrack withSegments:self->_videoSegments assets:v4];
  id v6 = [(JFXCompositionTrackGroup *)self applyToTrack:self->_audioTrack withSegments:self->_audioSegments assets:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(JFXCompositionTrackGroup *)self extraAudioTrackGroups];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) apply:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)applyAudioMixParameters:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(JFXCompositionTrackGroup *)self audioParameters];

  if (v5)
  {
    id v6 = [(JFXCompositionTrackGroup *)self audioParameters];
    [v4 addObject:v6];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(JFXCompositionTrackGroup *)self extraAudioTrackGroups];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          long long v13 = [(JFXCompositionTrackGroup *)self audioParameters];
          long long v14 = (void *)[v13 mutableCopy];

          long long v15 = [v12 audioTrack];
          objc_msgSend(v14, "setTrackID:", objc_msgSend(v15, "trackID"));

          [v12 setAudioParameters:v14];
          [v4 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)markDirty
{
  id v3 = [MEMORY[0x263EFA780] audioMixInputParametersWithTrack:self->_audioTrack];
  audioParameters = self->_audioParameters;
  self->_audioParameters = v3;

  [(NSMutableArray *)self->_audioSegments removeAllObjects];
  fmTrackInfoDict = self->_fmTrackInfoDict;
  self->_fmTrackInfoDict = 0;

  [(NSMutableArray *)self->_videoSegments removeAllObjects];
  self->_videoTrackInUse = 0;
  CMTimeMake(&v6, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  self->_CMTime cursor = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  CMTimeMake(&v6, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  self->_cursorForMovieAudio = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  [(JFXCompositionTrackGroup *)self resetVolumeState];
  self->_cursorAtLastVideoInsertion = self->_cursor;
  [(JFXCompositionTrackGroup *)self setAudioFormatDescription:0];
  [(JFXCompositionTrackGroup *)self setSeenSpeedClip:0];
  [(JFXCompositionTrackGroup *)self setSeenMoreThanOneASBD:0];
  [(JFXCompositionTrackGroup *)self removeExtraAudioTrackGroups];
}

- (void)resetVolumeState
{
  CMTimeMake(&v9, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  CMTime v8 = v9;
  [(JFXCompositionTrackGroup *)self setTimeOfLastVolumeChange:&v8];
  [(JFXCompositionTrackGroup *)self setVolumeAtLastVolumeChange:0.0];
  LODWORD(v3) = -1.0;
  [(JFXCompositionTrackGroup *)self setVolumeChangePending:v3];
  CMTimeMake(&v7, 0, [(JFXCompositionTrackGroup *)self timeScale]);
  CMTime v6 = v7;
  [(JFXCompositionTrackGroup *)self setTimeOfLastRequest:&v6];
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(JFXCompositionTrackGroup *)self setLastRampToZeroEnd:&v4];
}

- (float)linearFadeOutValueForTime:(id *)a3
{
  [(JFXCompositionTrackGroup *)self fadeOutStart];
  double Seconds = CMTimeGetSeconds(&time);
  [(JFXCompositionTrackGroup *)self fadeOutDuration];
  double v6 = CMTimeGetSeconds(&v11);
  CMTime v10 = *(CMTime *)a3;
  double v7 = CMTimeGetSeconds(&v10);
  float result = 0.0;
  if (v6 > 0.0)
  {
    double v9 = v7 - Seconds;
    float result = 1.0;
    if (v9 >= 0.0)
    {
      float result = 0.0;
      if (v9 <= v6) {
        return v9 / v6;
      }
    }
  }
  return result;
}

- (float)setFadedVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  memset(&v98, 0, sizeof(v98));
  [(JFXCompositionTrackGroup *)self fadeOutStart];
  [(JFXCompositionTrackGroup *)self fadeOutDuration];
  CMTimeRangeMake(&v98, &start, &duration);
  if ((v98.start.flags & 1) != 0
    && (v98.duration.flags & 1) != 0
    && !v98.duration.epoch
    && (v98.duration.value & 0x8000000000000000) == 0)
  {
    *(CMTime *)CMTime time1 = v98.duration;
    *(_OWORD *)&time2.start.uint64_t value = *MEMORY[0x263F010E0];
    time2.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
    if (!CMTimeCompare((CMTime *)time1, &time2.start))
    {
      audioParameters = self->_audioParameters;
      long long v37 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v37;
      *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
      *(float *)&long long v37 = a4;
      [(AVMutableAudioMixInputParameters *)audioParameters setVolumeRampFromStartVolume:time1 toEndVolume:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v100[4], LODWORD(a3))) timeRange:*(double *)&v37];
      long long v17 = JFXLog_DebugComposition();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        label = self->_label;
        *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
        *(void *)&time1[16] = a5->var0.var3;
        Float64 Seconds = CMTimeGetSeconds((CMTime *)time1);
        long long v40 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&time1[16] = v40;
        *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
        CMTimeRangeGetEnd(&v95, (CMTimeRange *)time1);
        Float64 v41 = CMTimeGetSeconds(&v95);
        *(_DWORD *)CMTime time1 = 138413314;
        *(void *)&time1[4] = label;
        *(_WORD *)&time1[12] = 2048;
        *(Float64 *)&time1[14] = Seconds;
        *(_WORD *)&time1[22] = 2048;
        *(double *)&time1[24] = a3;
        *(_WORD *)v100 = 2048;
        *(Float64 *)&v100[2] = v41;
        *(_WORD *)&v100[10] = 2048;
        *(double *)&v100[12] = a4;
        CMTime v22 = "  beforeFadeZone - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
        goto LABEL_38;
      }
      goto LABEL_30;
    }
  }
  memset(&time2.start.epoch, 0, 32);
  BOOL v9 = a4 <= 0.0 && a3 <= 0.0;
  BOOL v10 = a4 > 0.0 && a3 <= 0.0;
  BOOL v11 = a4 <= 0.0 && a3 > 0.0;
  long long v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v12;
  *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
  CMTimeRange otherRange = v98;
  *(_OWORD *)&time2.start.uint64_t value = 0uLL;
  CMTimeRangeGetIntersection(&time2, (CMTimeRange *)time1, &otherRange);
  *(CMTime *)CMTime time1 = time2.duration;
  double v13 = CMTimeGetSeconds((CMTime *)time1);
  *(_OWORD *)CMTime time1 = *(_OWORD *)&v98.start.value;
  *(_OWORD *)&time1[16] = *(_OWORD *)&v98.start.epoch;
  *(_OWORD *)v100 = *(_OWORD *)&v98.duration.timescale;
  CMTimeRangeGetEnd(&time, (CMTimeRange *)time1);
  double v14 = CMTimeGetSeconds(&time);
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
  *(void *)&time1[16] = a5->var0.var3;
  if (CMTimeGetSeconds((CMTime *)time1) > v14)
  {
    long long v15 = self->_audioParameters;
    long long v16 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v16;
    *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
    [(AVMutableAudioMixInputParameters *)v15 setVolumeRampFromStartVolume:time1 toEndVolume:0.0 timeRange:0.0];
    long long v17 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v18 = self->_label;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 v19 = CMTimeGetSeconds((CMTime *)time1);
      long long v20 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v20;
      *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v91, (CMTimeRange *)time1);
      Float64 v21 = CMTimeGetSeconds(&v91);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v18;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v19;
      *(_WORD *)&time1[22] = 2048;
      *(void *)&time1[24] = 0;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v21;
      *(_WORD *)&v100[10] = 2048;
      *(void *)&v100[12] = 0;
      CMTime v22 = "  afterFadeZone - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
LABEL_38:
      _os_log_debug_impl(&dword_234C41000, v17, OS_LOG_TYPE_DEBUG, v22, time1, 0x34u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  double v23 = a3;
  if ((time2.start.flags & 1) == 0
    || (time2.duration.flags & 1) == 0
    || time2.duration.epoch
    || (time2.duration.value < 0 ? (char v24 = 1) : (char v24 = v9), (v24 & 1) != 0 || v13 <= 0.0))
  {
    long long v33 = self->_audioParameters;
    long long v34 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v34;
    *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
    *(float *)&long long v34 = a4;
    [(AVMutableAudioMixInputParameters *)v33 setVolumeRampFromStartVolume:time1 toEndVolume:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v100[4], LODWORD(a3))) timeRange:*(double *)&v34];
    long long v17 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v50 = self->_label;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 v51 = CMTimeGetSeconds((CMTime *)time1);
      long long v52 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v52;
      *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v76, (CMTimeRange *)time1);
      Float64 v53 = CMTimeGetSeconds(&v76);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v50;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v51;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v23;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v53;
      *(_WORD *)&v100[10] = 2048;
      *(double *)&v100[12] = a4;
      CMTime v22 = "  outOfFadeZone or zeroRamp - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if (v10)
  {
    long long v25 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v25;
    *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v90, (CMTimeRange *)time1);
    [(JFXCompositionTrackGroup *)self linearFadeOutValueForTime:&v90];
    a4 = v26 * a4;
    long long v27 = self->_audioParameters;
    long long v28 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v28;
    *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
    *(float *)&long long v28 = a4;
    [(AVMutableAudioMixInputParameters *)v27 setVolumeRampFromStartVolume:time1 toEndVolume:0.0 timeRange:*(double *)&v28];
    long long v17 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = self->_label;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 v30 = CMTimeGetSeconds((CMTime *)time1);
      long long v31 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v31;
      *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v89, (CMTimeRange *)time1);
      Float64 v32 = CMTimeGetSeconds(&v89);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v29;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v30;
      *(_WORD *)&time1[22] = 2048;
      *(void *)&time1[24] = 0;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v32;
      *(_WORD *)&v100[10] = 2048;
      *(double *)&v100[12] = a4;
      CMTime v22 = "  rampIsFadeIn - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
LABEL_30:

    return a4;
  }
  if (v11)
  {
    [(JFXCompositionTrackGroup *)self volumeAtLastVolumeChange];
    float v43 = *(float *)&v42;
    long long v44 = self->_audioParameters;
    long long v45 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v45;
    *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
    HIDWORD(v42) = *(_DWORD *)&v100[4];
    a4 = 0.0;
    [(AVMutableAudioMixInputParameters *)v44 setVolumeRampFromStartVolume:time1 toEndVolume:v42 timeRange:0.0];
    long long v17 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v46 = self->_label;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 v47 = CMTimeGetSeconds((CMTime *)time1);
      long long v48 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v48;
      *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v88, (CMTimeRange *)time1);
      Float64 v49 = CMTimeGetSeconds(&v88);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v46;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v47;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v43;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v49;
      *(_WORD *)&v100[10] = 2048;
      *(void *)&v100[12] = 0;
      CMTime v22 = "  rampIsFadeOut - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  memset(&v87, 0, sizeof(v87));
  *(_OWORD *)CMTime time1 = *(_OWORD *)&time2.start.value;
  *(void *)&time1[16] = time2.start.epoch;
  *(_OWORD *)&otherRange.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
  otherRange.start.epoch = a5->var0.var3;
  CMTimeSubtract(&v87, (CMTime *)time1, &otherRange.start);
  uint64_t value = time2.duration.value;
  long long v86 = *(_OWORD *)&time2.duration.timescale;
  memset(&v85, 0, sizeof(v85));
  long long v55 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v55;
  *(_OWORD *)v100 = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&lhs, (CMTimeRange *)time1);
  *(_OWORD *)CMTime time1 = *(_OWORD *)&time2.start.value;
  *(_OWORD *)&time1[16] = *(_OWORD *)&time2.start.epoch;
  *(_OWORD *)v100 = *(_OWORD *)&time2.duration.timescale;
  CMTimeRangeGetEnd(&rhs, (CMTimeRange *)time1);
  CMTimeSubtract(&v85, &lhs, &rhs);
  CMTime var0 = (CMTime)a5->var0;
  if (v87.value >= 1)
  {
    long long v56 = self->_audioParameters;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(void *)&time1[16] = a5->var0.var3;
    otherRange.CMTime start = v87;
    CMTimeRangeMake(&v81, (CMTime *)time1, &otherRange.start);
    *(float *)&double v57 = a3;
    *(float *)&double v58 = a3;
    [(AVMutableAudioMixInputParameters *)v56 setVolumeRampFromStartVolume:&v81 toEndVolume:v57 timeRange:v58];
    long long v59 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      v67 = self->_label;
      *(CMTime *)CMTime time1 = var0;
      Float64 v68 = CMTimeGetSeconds((CMTime *)time1);
      *(CMTime *)CMTime time1 = v87;
      Float64 v69 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v67;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v68;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v69;
      *(_WORD *)&v100[10] = 2048;
      *(double *)&v100[12] = a3;
      _os_log_debug_impl(&dword_234C41000, v59, OS_LOG_TYPE_DEBUG, "  durationBefore - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    *(CMTime *)CMTime time1 = var0;
    otherRange.CMTime start = v87;
    CMTimeAdd(&var0, (CMTime *)time1, &otherRange.start);
  }
  if (value >= 1)
  {
    memset(&otherRange, 0, sizeof(otherRange));
    *(CMTime *)CMTime time1 = var0;
    v80.uint64_t value = value;
    *(_OWORD *)&v80.timescale = v86;
    CMTimeRangeMake(&otherRange, (CMTime *)time1, &v80);
    *(_OWORD *)CMTime time1 = *(_OWORD *)&otherRange.start.value;
    *(void *)&time1[16] = otherRange.start.epoch;
    [(JFXCompositionTrackGroup *)self linearFadeOutValueForTime:time1];
    float v61 = v60 * a3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&otherRange.start.value;
    *(_OWORD *)&time1[16] = *(_OWORD *)&otherRange.start.epoch;
    *(_OWORD *)v100 = *(_OWORD *)&otherRange.duration.timescale;
    CMTimeRangeGetEnd(&v79, (CMTimeRange *)time1);
    [(JFXCompositionTrackGroup *)self linearFadeOutValueForTime:&v79];
    a4 = v62 * a4;
    long long v63 = self->_audioParameters;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&otherRange.start.value;
    *(_OWORD *)&time1[16] = *(_OWORD *)&otherRange.start.epoch;
    *(_OWORD *)v100 = *(_OWORD *)&otherRange.duration.timescale;
    [(AVMutableAudioMixInputParameters *)v63 setVolumeRampFromStartVolume:time1 toEndVolume:COERCE_DOUBLE(__PAIR64__(otherRange.duration.flags, LODWORD(v61))) timeRange:COERCE_DOUBLE(__PAIR64__(HIDWORD(otherRange.start.epoch), LODWORD(a4)))];
    uint64_t v64 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      v70 = self->_label;
      *(CMTime *)CMTime time1 = var0;
      Float64 v71 = CMTimeGetSeconds((CMTime *)time1);
      *(void *)CMTime time1 = value;
      *(_OWORD *)&time1[8] = v86;
      Float64 v72 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v70;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v71;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = v61;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v72;
      *(_WORD *)&v100[10] = 2048;
      *(double *)&v100[12] = a4;
      _os_log_debug_impl(&dword_234C41000, v64, OS_LOG_TYPE_DEBUG, "  durationDuring - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    CMTime v80 = var0;
    v78.uint64_t value = value;
    *(_OWORD *)&v78.timescale = v86;
    CMTimeAdd((CMTime *)time1, &v80, &v78);
    CMTime var0 = *(CMTime *)time1;
  }
  if (v85.value >= 1)
  {
    long long v65 = self->_audioParameters;
    *(CMTime *)CMTime time1 = var0;
    otherRange.CMTime start = v85;
    CMTimeRangeMake(&v77, (CMTime *)time1, &otherRange.start);
    a4 = 0.0;
    [(AVMutableAudioMixInputParameters *)v65 setVolumeRampFromStartVolume:&v77 toEndVolume:0.0 timeRange:0.0];
    long long v66 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v73 = self->_label;
      *(CMTime *)CMTime time1 = var0;
      Float64 v74 = CMTimeGetSeconds((CMTime *)time1);
      *(CMTime *)CMTime time1 = v85;
      Float64 v75 = CMTimeGetSeconds((CMTime *)time1);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v73;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v74;
      *(_WORD *)&time1[22] = 2048;
      *(void *)&time1[24] = 0;
      *(_WORD *)v100 = 2048;
      *(Float64 *)&v100[2] = v75;
      *(_WORD *)&v100[10] = 2048;
      *(void *)&v100[12] = 0;
      _os_log_debug_impl(&dword_234C41000, v66, OS_LOG_TYPE_DEBUG, "  durationAfter - VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }
  }
  return a4;
}

- (void)commitVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  memset(&v54, 0, sizeof(v54));
  CMTimeMake(&v54, 1, [(JFXCompositionTrackGroup *)self timeScale]);
  [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
  *(void *)&time1[16] = a5->var0.var3;
  if (CMTimeCompare((CMTime *)time1, &time2) >= 1)
  {
    BOOL v9 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)time1);
      [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
      Float64 v30 = CMTimeGetSeconds(&v52);
      *(_DWORD *)CMTime time1 = 134218240;
      *(Float64 *)&time1[4] = Seconds;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v30;
      _os_log_debug_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEBUG, "commitVolumeRampFromStartVolume startTime %f < timeOfLastVolumeChange %f -- Adjusting", time1, 0x16u);
    }

    [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
    long long v10 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v10;
    *(_OWORD *)long long v56 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&end, (CMTimeRange *)time1);
    CMTimeRangeFromTimeToTime((CMTimeRange *)time1, &start, &end);
    long long v11 = *(_OWORD *)&time1[16];
    *(_OWORD *)&a5->var0.CMTime var0 = *(_OWORD *)time1;
    *(_OWORD *)&a5->var0.var3 = v11;
    *(_OWORD *)&a5->var1.var1 = *(_OWORD *)v56;
  }
  long long v12 = JFXLog_DebugComposition();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (a3 == a4)
  {
    if (v13)
    {
      label = self->_label;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(void *)&time1[16] = a5->var0.var3;
      Float64 v15 = CMTimeGetSeconds((CMTime *)time1);
      long long v16 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&time1[16] = v16;
      *(_OWORD *)long long v56 = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&time, (CMTimeRange *)time1);
      Float64 v17 = CMTimeGetSeconds(&time);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = label;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v15;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)long long v56 = 2048;
      *(Float64 *)&v56[2] = v17;
      *(_WORD *)&v56[10] = 2048;
      *(double *)&v56[12] = a4;
      long long v18 = "VOLUME RANGE :%@  time %f volume %f  -  time %f volume %f";
LABEL_21:
      _os_log_debug_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEBUG, v18, time1, 0x34u);
    }
  }
  else if (v13)
  {
    long long v31 = self->_label;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(void *)&time1[16] = a5->var0.var3;
    Float64 v32 = CMTimeGetSeconds((CMTime *)time1);
    long long v33 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1[16] = v33;
    *(_OWORD *)long long v56 = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v48, (CMTimeRange *)time1);
    Float64 v34 = CMTimeGetSeconds(&v48);
    *(_DWORD *)CMTime time1 = 138413314;
    *(void *)&time1[4] = v31;
    *(_WORD *)&time1[12] = 2048;
    *(Float64 *)&time1[14] = v32;
    *(_WORD *)&time1[22] = 2048;
    *(double *)&time1[24] = a3;
    *(_WORD *)long long v56 = 2048;
    *(Float64 *)&v56[2] = v34;
    *(_WORD *)&v56[10] = 2048;
    *(double *)&v56[12] = a4;
    long long v18 = "VOLUME FADE  :%@  time %f volume %f  -  time %f volume %f";
    goto LABEL_21;
  }

  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var1.var0;
  *(void *)&time1[16] = a5->var1.var3;
  v46.CMTime start = v54;
  if (CMTimeCompare((CMTime *)time1, &v46.start) < 0 && ![(JFXCompositionTrackGroup *)self isFlexMusic])
  {
    Float64 v19 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      CMTime v35 = self->_label;
      *(_OWORD *)&v46.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
      v46.start.epoch = a5->var0.var3;
      Float64 v36 = CMTimeGetSeconds(&v46.start);
      long long v37 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&v46.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&v46.start.epoch = v37;
      *(_OWORD *)&v46.duration.timescale = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v47, &v46);
      Float64 v38 = CMTimeGetSeconds(&v47);
      *(_DWORD *)CMTime time1 = 138413314;
      *(void *)&time1[4] = v35;
      *(_WORD *)&time1[12] = 2048;
      *(Float64 *)&time1[14] = v36;
      *(_WORD *)&time1[22] = 2048;
      *(double *)&time1[24] = a3;
      *(_WORD *)long long v56 = 2048;
      *(Float64 *)&v56[2] = v38;
      *(_WORD *)&v56[10] = 2048;
      *(double *)&v56[12] = a4;
      _os_log_debug_impl(&dword_234C41000, v19, OS_LOG_TYPE_DEBUG, "setVolumeRamp:%@  time %f volume %f  -  time %f volume %f", time1, 0x34u);
    }

    long long v20 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:](v20);
    }

    a5->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v54;
  }
  long long v21 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time1[16] = v21;
  *(_OWORD *)long long v56 = *(_OWORD *)&a5->var1.var1;
  *(float *)&long long v21 = a4;
  [(JFXCompositionTrackGroup *)self setFadedVolumeRampFromStartVolume:time1 toEndVolume:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v56[4], LODWORD(a3))) timeRange:*(double *)&v21];
  float v23 = v22;
  long long v24 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v24;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v45, &range);
  CMTime v43 = v45;
  [(JFXCompositionTrackGroup *)self setTimeOfLastVolumeChange:&v43];
  long long v25 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v25;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v42, &range);
  CMTime v41 = v42;
  [(JFXCompositionTrackGroup *)self setTimeOfLastRequest:&v41];
  *(float *)&double v26 = v23;
  [(JFXCompositionTrackGroup *)self setVolumeAtLastVolumeChange:v26];
  if (a3 > 0.0 && v23 <= 0.0)
  {
    long long v28 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v28;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v40, &range);
    CMTime v39 = v40;
    [(JFXCompositionTrackGroup *)self setLastRampToZeroEnd:&v39];
  }
  LODWORD(v27) = -1.0;
  [(JFXCompositionTrackGroup *)self setVolumeChangePending:v27];
}

- (BOOL)commitPendingVolumeToTime:(id *)a3
{
  [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
  time1.CMTime start = (CMTime)*a3;
  int32_t v5 = CMTimeCompare(&time1.start, &time2);
  if (v5 <= 0)
  {
    long long v11 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[JFXCompositionTrackGroup commitPendingVolumeToTime:]((CMTime *)a3);
    }
  }
  else
  {
    [(JFXCompositionTrackGroup *)self volumeChangePending];
    if (v6 == -1.0) {
      [(JFXCompositionTrackGroup *)self setVolumeChangePending:0.0];
    }
    memset(&time1, 0, sizeof(time1));
    [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
    *(_OWORD *)&v13.start.uint64_t value = *(_OWORD *)&a3->var0;
    v13.start.epoch = a3->var3;
    CMTimeRangeFromTimeToTime(&time1, &start, &v13.start);
    [(JFXCompositionTrackGroup *)self volumeChangePending];
    unsigned int v8 = v7;
    [(JFXCompositionTrackGroup *)self volumeChangePending];
    LODWORD(v10) = v9;
    CMTimeRange v13 = time1;
    [(JFXCompositionTrackGroup *)self commitVolumeRampFromStartVolume:&v13 toEndVolume:COERCE_DOUBLE(__PAIR64__(time1.duration.flags, v8)) timeRange:v10];
  }
  return v5 > 0;
}

- (BOOL)shouldCommitVolume:(float)a3
{
  [(JFXCompositionTrackGroup *)self volumeChangePending];
  if (v5 == -1.0) {
    return 0;
  }
  [(JFXCompositionTrackGroup *)self volumeChangePending];
  return v7 != a3;
}

- (BOOL)requestVolume:(float)a3 atTime:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CMTime v17 = *(CMTime *)a4;
  [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
  CMTime time1 = v17;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    unsigned int v8 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CMTime time1 = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time1);
      [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
      Float64 v12 = CMTimeGetSeconds(&time);
      LODWORD(time1.value) = 134218240;
      *(Float64 *)((char *)&time1.value + 4) = Seconds;
      LOWORD(time1.flags) = 2048;
      *(Float64 *)((char *)&time1.flags + 2) = v12;
      _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "setVolume startTime %f < timeOfLastVolumeChange %f -- Adjusting", (uint8_t *)&time1, 0x16u);
    }
  }
  *(float *)&double v7 = a3;
  if ([(JFXCompositionTrackGroup *)self shouldCommitVolume:v7])
  {
    CMTime time1 = v17;
    [(JFXCompositionTrackGroup *)self commitPendingVolumeToTime:&time1];
  }
  *(float *)&double v9 = a3;
  [(JFXCompositionTrackGroup *)self setVolumeChangePending:v9];
  long long v13 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [(JFXCompositionTrackGroup *)self setTimeOfLastRequest:&v13];
  return 1;
}

- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 fillEmptySegment:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v36.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v36.start.epoch = v11;
  *(_OWORD *)&v36.duration.timescale = *(_OWORD *)&a5->var1.var1;
  if (a3 == a4)
  {
    *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
    range.start.epoch = a5->var0.var3;
    [(JFXCompositionTrackGroup *)self requestVolume:&range atTime:COERCE_DOUBLE(__PAIR64__(HIDWORD(range.start.value), LODWORD(a4)))];
  }
  CMTimeRange range = v36;
  CMTimeRangeGetEnd(&time1, &range);
  [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
  int32_t v12 = CMTimeCompare(&time1, &time2);
  if (v12 < 0)
  {
    CMTime v17 = JFXLog_DebugComposition();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      CMTimeRange range = v36;
      CMTimeRangeGetEnd(&time, &range);
      Float64 Seconds = CMTimeGetSeconds(&time);
      [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
      Float64 v20 = CMTimeGetSeconds(&v32);
      LODWORD(range.start.value) = 134218240;
      *(Float64 *)((char *)&range.start.value + 4) = Seconds;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v20;
      _os_log_debug_impl(&dword_234C41000, v17, OS_LOG_TYPE_DEBUG, "setVolumeRamp endTime %f < timeOfLastVolumeChange %f -- ABORTING", (uint8_t *)&range, 0x16u);
    }
  }
  else
  {
    [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
    *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&v36.start.value;
    range.start.epoch = v36.start.epoch;
    if (CMTimeCompare(&range.start, &v31) < 0)
    {
      long long v13 = JFXLog_DebugComposition();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&a5->var0.var0;
        range.start.epoch = a5->var0.var3;
        Float64 v21 = CMTimeGetSeconds(&range.start);
        [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
        Float64 v22 = CMTimeGetSeconds(&v30);
        LODWORD(range.start.value) = 134218240;
        *(Float64 *)((char *)&range.start.value + 4) = v21;
        LOWORD(range.start.flags) = 2048;
        *(Float64 *)((char *)&range.start.flags + 2) = v22;
        _os_log_debug_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEBUG, "setVolumeRamp startTime %f < timeOfLastVolumeChange %f -- Adjusting", (uint8_t *)&range, 0x16u);
      }

      [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
      CMTimeRange range = v36;
      CMTimeRangeGetEnd(&end, &range);
      CMTimeRangeFromTimeToTime(&v36, &start, &end);
    }
    [(JFXCompositionTrackGroup *)self volumeChangePending];
    if (v14 == -1.0)
    {
      [(JFXCompositionTrackGroup *)self volumeAtLastVolumeChange];
      -[JFXCompositionTrackGroup setVolumeChangePending:](self, "setVolumeChangePending:");
    }
    if (v6)
    {
      [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
      *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&v36.start.value;
      range.start.epoch = v36.start.epoch;
      if (CMTimeCompare(&range.start, &v27) >= 1)
      {
        memset(&range, 0, sizeof(range));
        [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
        [(JFXCompositionTrackGroup *)self timeOfLastVolumeChange];
        *(_OWORD *)&v23.start.uint64_t value = *(_OWORD *)&v36.start.value;
        v23.start.epoch = v36.start.epoch;
        CMTimeSubtract(&duration, &v23.start, &rhs);
        CMTimeRangeMake(&range, &v26, &duration);
        *(float *)&double v15 = self->_volumeAtLastVolumeChange;
        CMTimeRange v23 = range;
        [(JFXCompositionTrackGroup *)self commitVolumeRampFromStartVolume:&v23 toEndVolume:v15 timeRange:COERCE_DOUBLE(__PAIR64__(range.duration.flags, LODWORD(v15)))];
        if (self->_volumeAtLastVolumeChange != 0.0)
        {
          long long v16 = JFXLog_DebugComposition();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[JFXCompositionTrackGroup requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:](v16);
          }
        }
      }
    }
    *(_OWORD *)&range.start.uint64_t value = *(_OWORD *)&v36.start.value;
    range.start.epoch = v36.start.epoch;
    [(JFXCompositionTrackGroup *)self commitPendingVolumeToTime:&range];
    CMTimeRange range = v36;
    [(JFXCompositionTrackGroup *)self commitVolumeRampFromStartVolume:&range toEndVolume:COERCE_DOUBLE(__PAIR64__(v36.duration.flags, LODWORD(a3))) timeRange:COERCE_DOUBLE(__PAIR64__(HIDWORD(v36.start.epoch), LODWORD(a4)))];
  }
  return v12 >= 0;
}

- (BOOL)requestVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return -[JFXCompositionTrackGroup requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:](self, "requestVolumeRampFromStartVolume:toEndVolume:timeRange:fillEmptySegment:", v7, 0);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (AVMutableCompositionTrack)videoTrack
{
  return self->_videoTrack;
}

- (void)setVideoTrack:(id)a3
{
}

- (AVMutableCompositionTrack)audioTrack
{
  return self->_audioTrack;
}

- (NSMutableArray)audioSegments
{
  return self->_audioSegments;
}

- (void)setAudioSegments:(id)a3
{
}

- (AVMutableAudioMixInputParameters)audioParameters
{
  return self->_audioParameters;
}

- (void)setAudioParameters:(id)a3
{
}

- (NSString)preferredAudioTimePitchAlgorithm
{
  return self->_preferredAudioTimePitchAlgorithm;
}

- (void)setPreferredAudioTimePitchAlgorithm:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursor
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorAtLastVideoInsertion
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastVolumeChange
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setTimeOfLastVolumeChange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timeOfLastVolumeChange.epoch = a3->var3;
  *(_OWORD *)&self->_timeOfLastVolumeChange.uint64_t value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOfLastRequest
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setTimeOfLastRequest:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timeOfLastRequest.epoch = a3->var3;
  *(_OWORD *)&self->_timeOfLastRequest.uint64_t value = v3;
}

- (float)volumeAtLastVolumeChange
{
  return self->_volumeAtLastVolumeChange;
}

- (void)setVolumeAtLastVolumeChange:(float)a3
{
  self->_volumeAtLastVolumeChange = a3;
}

- (float)volumeChangePending
{
  return self->_volumeChangePending;
}

- (void)setVolumeChangePending:(float)a3
{
  self->_volumeChangePending = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setFadeOutStart:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutStart.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutStart.uint64_t value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (void)setFadeOutDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutDuration.uint64_t value = v3;
}

- (AVMutableComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (NSString)timePitchAlgorithm
{
  return self->_timePitchAlgorithm;
}

- (void)setTimePitchAlgorithm:(id)a3
{
  self->_timePitchAlgorithm = (NSString *)a3;
}

- (NSMutableArray)extraAudioTrackGroups
{
  return self->_extraAudioTrackGroups;
}

- (void)setExtraAudioTrackGroups:(id)a3
{
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  return self->_audioFormatDescription;
}

- (void)setAudioFormatDescription:(opaqueCMFormatDescription *)a3
{
}

- (BOOL)seenSpeedClip
{
  return self->_seenSpeedClip;
}

- (void)setSeenSpeedClip:(BOOL)a3
{
  self->_seenSpeedClip = a3;
}

- (BOOL)seenMoreThanOneASBD
{
  return self->_seenMoreThanOneASBD;
}

- (void)setSeenMoreThanOneASBD:(BOOL)a3
{
  self->_seenMoreThanOneASBD = a3;
}

- (NSDictionary)fmTrackInfoDict
{
  return self->_fmTrackInfoDict;
}

- (void)setFmTrackInfoDict:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastRampToZeroEnd
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)setLastRampToZeroEnd:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastRampToZeroEnd.epoch = a3->var3;
  *(_OWORD *)&self->_lastRampToZeroEnd.uint64_t value = v3;
}

- (BOOL)isFlexMusic
{
  return self->_isFlexMusic;
}

- (void)setIsFlexMusic:(BOOL)a3
{
  self->_isFlexMusic = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cursorForMovieAudio
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (BOOL)videoTrackInUse
{
  return self->_videoTrackInUse;
}

- (void)setVideoTrackInUse:(BOOL)a3
{
  self->_videoTrackInUse = a3;
}

- (NSMutableArray)videoSegments
{
  return self->_videoSegments;
}

- (void)setVideoSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_fmTrackInfoDict, 0);
  objc_storeStrong((id *)&self->_extraAudioTrackGroups, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_preferredAudioTimePitchAlgorithm, 0);
  objc_storeStrong((id *)&self->_audioParameters, 0);
  objc_storeStrong((id *)&self->_audioSegments, 0);
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)validate
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_4(&dword_234C41000, v0, v1, "Video-%@ failed to validate:\n%@");
}

- (void)applyToTrack:(void *)a3 withSegments:(os_log_t)log assets:.cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "apply_to_track: WARNING asset %@ not found in assetsUsed", buf, 0xCu);
}

void __61__JFXCompositionTrackGroup_applyToTrack_withSegments_assets___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 40) sourceURL];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "Unable to insert %@", v4, v5, v6, v7, 2u);
}

- (void)commitVolumeRampFromStartVolume:(void *)a1 toEndVolume:(uint8_t *)buf timeRange:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "An error occurred building an Audio Mix: %@", buf, 0xCu);
}

- (void)commitVolumeRampFromStartVolume:(os_log_t)log toEndVolume:timeRange:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, " --- too small of a fade ", v1, 2u);
}

- (void)commitPendingVolumeToTime:(CMTime *)a1 .cold.1(CMTime *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CMTime v8 = *a1;
  Float64 Seconds = CMTimeGetSeconds(&v8);
  v8.timescale = HIDWORD(Seconds);
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "commitPendingVolumeToTime: %f in Past", v4, v5, v6, v7, 0);
}

- (void)requestVolumeRampFromStartVolume:(os_log_t)log toEndVolume:timeRange:fillEmptySegment:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "Empty segment with volume not 0, fix me...", v1, 2u);
}

@end