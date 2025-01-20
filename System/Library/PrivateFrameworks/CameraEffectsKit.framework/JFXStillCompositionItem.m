@interface JFXStillCompositionItem
- (BOOL)hasVideoContent;
- (BOOL)needSilenceAtEnd;
- (JFXStillCompositionItem)initWithClip:(id)a3 timeScale:(int)a4;
- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4;
- (id)videoTrackSegmentsWithDestinationRange:(id *)a3;
@end

@implementation JFXStillCompositionItem

- (JFXStillCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JFXStillCompositionItem;
  v4 = [(JFXMovieCompositionItem *)&v7 initWithClip:a3 timeScale:*(void *)&a4];
  if (v4)
  {
    v5 = +[JFXCompositionItem silenceAsset];
    [(JFXMovieCompositionItem *)v4 setAsset:v5];
  }
  return v4;
}

- (BOOL)hasVideoContent
{
  return 0;
}

- (BOOL)needSilenceAtEnd
{
  return 1;
}

- (id)videoTrackSegmentsWithDestinationRange:(id *)a3
{
  v3 = (void *)MEMORY[0x263EFF8C0];
  long long v4 = *(_OWORD *)&a3->var0.var3;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->var1.var1;
  v5 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationRange:v8];
  v6 = [v3 arrayWithObject:v5];

  return v6;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  if (![(JFXCompositionItem *)self isFinalClip])
  {
    objc_super v7 = (void *)MEMORY[0x263EFF8C0];
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    v8 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationTime:&time1];
    uint64_t v9 = [v7 arrayWithObject:v8];
LABEL_14:
    v12 = (void *)v9;
    goto LABEL_15;
  }
  [(JFXCompositionItem *)self sourceTimeRange];
  CMTime v29 = v28;
  memset(&v27, 0, sizeof(v27));
  v5 = [(JFXMovieCompositionItem *)self asset];
  v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CMTimeConvertScale(&v27, &time, [(JFXCompositionItem *)self timeScale], kCMTimeRoundingMethod_RoundHalfAwayFromZero);

  time1.CMTime start = v27;
  time2[0] = v29;
  if ((CMTimeCompare(&time1.start, time2) & 0x80000000) == 0)
  {
    memset(&time1, 0, sizeof(time1));
    CMTimeMake(&start, 0, [(JFXCompositionItem *)self timeScale]);
    time2[0] = v29;
    CMTimeRangeMake(&time1, &start, time2);
    uint64_t v10 = *MEMORY[0x263EF9C80];
    time2[0] = (CMTime)*a3;
    duration.CMTime start = time1.duration;
    CMTimeRangeMake(&v23, time2, &duration.start);
    *(CMTimeRange *)&time2[0].value = time1;
    uint64_t v11 = [(JFXMovieCompositionItem *)self segmentWithCharacteristic:v10 sourceRange:time2 destinationRange:&v23];
    v8 = (void *)v11;
    if (v11)
    {
      v30[0] = v11;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    }
    else
    {
      uint64_t v9 = objc_opt_new();
    }
    goto LABEL_14;
  }
  v12 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  memset(&time1, 0, sizeof(time1));
  memset(time2, 0, sizeof(time2));
  CMTimeMake(&rhs, 2, [(JFXCompositionItem *)self timeScale]);
  duration.CMTime start = v27;
  CMTimeAdd(&time2[1], &duration.start, &rhs);
  duration.CMTime start = v29;
  CMTime lhs = time2[1];
  CMTimeSubtract(&time1.duration, &duration.start, &lhs);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.epoch = a3->var3;
  CMTimeMake(&duration.start, 0, [(JFXCompositionItem *)self timeScale]);
  time2[0] = duration.start;
  id v13 = objc_alloc(MEMORY[0x263EFA6D0]);
  CMTimeRange duration = time1;
  v14 = (void *)[v13 initWithTimeRange:&duration];
  if (v14) {
    [v12 addObject:v14];
  }
  CMTime lhs = (CMTime)*a3;
  CMTime v18 = time1.duration;
  CMTimeAdd(&duration.start, &lhs, &v18);
  *(_OWORD *)&a3->var0 = *(_OWORD *)&duration.start.value;
  a3->var3 = duration.start.epoch;
  uint64_t v15 = *MEMORY[0x263EF9C80];
  *(_OWORD *)&duration.start.value = *(_OWORD *)&a3->var0;
  duration.start.epoch = a3->var3;
  CMTime lhs = time2[1];
  CMTimeRangeMake(&v17, &duration.start, &lhs);
  *(_OWORD *)&duration.start.value = *(_OWORD *)&time2[0].value;
  *(_OWORD *)&duration.start.epoch = *(_OWORD *)&time2[0].epoch;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&time2[1].timescale;
  v8 = [(JFXMovieCompositionItem *)self segmentWithCharacteristic:v15 sourceRange:&duration destinationRange:&v17];

  if (v8) {
    [v12 addObject:v8];
  }
LABEL_15:

  return v12;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  long long v4 = -[JFXStillCompositionItem audioTrackSegmentsWithDestinationTime:](self, "audioTrackSegmentsWithDestinationTime:", &v6, a4);
  return v4;
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v7.start.epoch = v4;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v8, &v7);
  v5 = [(JFXStillCompositionItem *)self audioTrackSegmentsWithDestinationTime:&v8];
  return v5;
}

@end