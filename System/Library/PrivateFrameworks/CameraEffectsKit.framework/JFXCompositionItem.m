@interface JFXCompositionItem
+ (id)compositionItemWithClip:(id)a3 timeScale:(int)a4;
+ (id)silenceAsset;
+ (void)mediaserverdCrashed;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioEndOffset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioStartOffset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)destinationDuration;
- ($70930193D4F448A53BB9343C0237EB5F)sourceTimeRange;
- (BOOL)hasVideoContent;
- (BOOL)isFinalClip;
- (BOOL)isFreezeFrame;
- (BOOL)isWaitingForResource;
- (BOOL)needAudioLoop;
- (BOOL)needSilenceAtEnd;
- (JFXCompositionItem)initWithClip:(id)a3 timeScale:(int)a4;
- (JFXPlayableElement)clip;
- (float)speed;
- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3;
- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4;
- (id)debugDescription;
- (id)description;
- (id)emptyTrackSegmentWithDestinationRange:(id *)a3;
- (id)emptyTrackSegmentWithDestinationTime:(id *)a3;
- (id)videoTrackSegmentsWithDestinationRange:(id *)a3;
- (int)timeScale;
- (void)dealloc;
- (void)setAudioEndOffset:(id *)a3;
- (void)setAudioStartOffset:(id *)a3;
- (void)setClip:(id)a3;
- (void)setDestinationDuration:(id *)a3;
- (void)setIsFinalClip:(BOOL)a3;
- (void)setSourceTimeRange:(id *)a3;
- (void)setSpeed:(float)a3;
- (void)setTimeScale:(int)a3;
@end

@implementation JFXCompositionItem

+ (id)compositionItemWithClip:(id)a3 timeScale:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = [v5 mediaType];
  if ((v6 == 1 || v6 == 2) && (v7 = (objc_class *)objc_opt_class()) != 0) {
    v8 = (void *)[[v7 alloc] initWithClip:v5 timeScale:v4];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (void)mediaserverdCrashed
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:a1 name:@"mediaserverdCrashed" object:0];

  uint64_t v4 = (void *)sEmptyAsset;
  sEmptyAsset = 0;
}

+ (id)silenceAsset
{
  v3 = (void *)sEmptyAsset;
  if (!sEmptyAsset)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] jfxBundle];
    id v5 = [v4 pathForResource:@"silence" ofType:@"mov"];

    if (v5)
    {
      uint64_t v6 = [NSURL fileURLWithPath:v5];
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = [objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v6 options:0];
        v9 = (void *)sEmptyAsset;
        sEmptyAsset = v8;
      }
    }
    if (sEmptyAsset)
    {
      v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 addObserver:a1 selector:sel_mediaserverdCrashed name:@"mediaserverdCrashed" object:0];
    }
    v3 = (void *)sEmptyAsset;
  }
  return v3;
}

- (JFXCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JFXCompositionItem;
  v7 = [(JFXCompositionItem *)&v14 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(JFXCompositionItem *)v7 setClip:v6];
    v8->_timeScale = a4;
    CMTimeMake(&start, 0, a4);
    CMTimeMake(&v11, 0, a4);
    CMTimeRangeMake(&v13, &start, &v11);
    long long v9 = *(_OWORD *)&v13.start.epoch;
    *(_OWORD *)&v8->_sourceTimeRange.start.value = *(_OWORD *)&v13.start.value;
    *(_OWORD *)&v8->_sourceTimeRange.start.epoch = v9;
    *(_OWORD *)&v8->_sourceTimeRange.duration.timescale = *(_OWORD *)&v13.duration.timescale;
    CMTimeMake(&v13.start, (int)[v6 duration], a4);
    *(_OWORD *)&v8->_destinationDuration.value = *(_OWORD *)&v13.start.value;
    v8->_destinationDuration.epoch = v13.start.epoch;
    *(_WORD *)&v8->_isFreezeFrame = 0;
    v8->_speed = 1.0;
    CMTimeMake(&v13.start, 0, a4);
    *(_OWORD *)&v8->_audioStartOffset.value = *(_OWORD *)&v13.start.value;
    v8->_audioStartOffset.epoch = v13.start.epoch;
    CMTimeMake(&v13.start, 0, a4);
    *(_OWORD *)&v8->_audioEndOffset.value = *(_OWORD *)&v13.start.value;
    v8->_audioEndOffset.epoch = v13.start.epoch;
  }

  return v8;
}

- (void)dealloc
{
  [(JFXCompositionItem *)self setClip:0];
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionItem;
  [(JFXCompositionItem *)&v3 dealloc];
}

- (BOOL)hasVideoContent
{
  return 0;
}

- (BOOL)needSilenceAtEnd
{
  return 0;
}

- (BOOL)needAudioLoop
{
  return 0;
}

- (id)emptyTrackSegmentWithDestinationRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFA6D0]) initWithTimeRange:v6];
  return v4;
}

- (id)emptyTrackSegmentWithDestinationTime:(id *)a3
{
  long long v6 = *(_OWORD *)&a3->var0;
  *(void *)v7 = a3->var3;
  *($95D729B680665BEAEFA1D6FCA8238556 *)&v7[8] = self->_sourceTimeRange.duration;
  v5[0] = v6;
  v5[1] = *(_OWORD *)v7;
  v5[2] = *(_OWORD *)&v7[16];
  long long v3 = (void *)[objc_alloc(MEMORY[0x263EFA6D0]) initWithTimeRange:v5];
  return v3;
}

- (id)videoTrackSegmentsWithDestinationRange:(id *)a3
{
  long long v3 = (void *)MEMORY[0x263EFF8C0];
  long long v4 = *(_OWORD *)&a3->var0.var3;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->var1.var1;
  id v5 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationRange:v8];
  long long v6 = [v3 arrayWithObject:v5];

  return v6;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  long long v4 = -[JFXCompositionItem audioTrackSegmentsWithDestinationTime:](self, "audioTrackSegmentsWithDestinationTime:", &v6, a4);
  return v4;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  long long v3 = (void *)MEMORY[0x263EFF8C0];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  long long v4 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationTime:&v7];
  id v5 = [v3 arrayWithObject:v4];

  return v5;
}

- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3
{
  long long v3 = (void *)MEMORY[0x263EFF8C0];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  long long v4 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationTime:&v7];
  id v5 = [v3 arrayWithObject:v4];

  return v5;
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  long long v4 = (void *)MEMORY[0x263EFF8C0];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v9.start.epoch = v5;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v10, &v9);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationTime:&v10];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [v4 arrayWithObject:v6];

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%d  %d]", self->_sourceTimeRange.start.value, self->_sourceTimeRange.duration.value + self->_sourceTimeRange.start.value);
}

- (id)debugDescription
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v3 stringWithFormat:@"<%p> %@ : {\n\tsourceTimeRange start:\t%d\n\tsourceTimeRange end:\t%d\n}", self, v5, self->_sourceTimeRange.start.value, self->_sourceTimeRange.duration.value + self->_sourceTimeRange.start.value];

  return v6;
}

- (BOOL)isFinalClip
{
  return self->_isFinalClip;
}

- (void)setIsFinalClip:(BOOL)a3
{
  self->_isFinalClip = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)sourceTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setSourceTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_sourceTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_sourceTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)destinationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setDestinationDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_destinationDuration.epoch = a3->var3;
  *(_OWORD *)&self->_destinationDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioStartOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setAudioStartOffset:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_audioStartOffset.epoch = a3->var3;
  *(_OWORD *)&self->_audioStartOffset.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioEndOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setAudioEndOffset:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_audioEndOffset.epoch = a3->var3;
  *(_OWORD *)&self->_audioEndOffset.value = v3;
}

- (BOOL)isFreezeFrame
{
  return self->_isFreezeFrame;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (BOOL)isWaitingForResource
{
  return self->_isWaitingForResource;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (JFXPlayableElement)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end