@interface RCWaveformDataSource
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight;
- (BOOL)canceled;
- (BOOL)finished;
- (BOOL)hasSavedGeneratedWaveform;
- (BOOL)hasStartedLoading;
- (BOOL)setPaused:(BOOL)a3;
- (BOOL)shouldMergeLiveWaveform;
- (BOOL)waitUntilFinished;
- (NSHashTable)weakObservers;
- (NSURL)generatedWaveformOutputURL;
- (OS_dispatch_queue)queue;
- (RCWaveform)accumulatorWaveform;
- (RCWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4;
- (RCWaveformGenerator)waveformGenerator;
- (double)averagePowerLevelsRate;
- (double)duration;
- (double)durationPerWaveformSlice;
- (float)loadingProgress;
- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3;
- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3;
- (id)waveformSegmentsInTimeRange:(id)a3;
- (id)waveformSegmentsIntersectingTimeRange:(id)a3;
- (void)_performObserversBlock:(id)a3;
- (void)_performOnObserversBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginLoading;
- (void)cancelLoading;
- (void)dealloc;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)mergeGeneratedWaveformIfNecessary;
- (void)removeObserver:(id)a3;
- (void)saveGeneratedWaveformIfNecessary;
- (void)setDurationPerWaveformSlice:(double)a3;
- (void)setHasSavedGeneratedWaveform:(BOOL)a3;
- (void)updateAccumulatorWaveformSegmentsWithBlock:(id)a3;
- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformGeneratorDidFinishLoading:(id)a3 error:(id)a4;
@end

@implementation RCWaveformDataSource

- (RCWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RCWaveformDataSource;
  v9 = [(RCWaveformDataSource *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_waveformGenerator, a3);
    v11 = objc_alloc_init(RCMutableWaveform);
    accumulatorWaveform = v10->_accumulatorWaveform;
    v10->_accumulatorWaveform = v11;

    v10->_liveRecordingMergeTime = 0.0;
    objc_storeStrong((id *)&v10->_generatedWaveformOutputURL, a4);
    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    weakObservers = v10->_weakObservers;
    v10->_weakObservers = (NSHashTable *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.waveformDataSourceProcessing", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;
  }
  return v10;
}

- (void)dealloc
{
  [(RCWaveformGenerator *)self->_waveformGenerator terminateLoadingImmediately];
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformDataSource;
  [(RCWaveformDataSource *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_19CB4;
  v7[3] = &unk_6D468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_19DA0;
  v7[3] = &unk_6D468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)beginLoading
{
  if (!self->_hasStartedLoading)
  {
    self->_hasStartedLoading = 1;
    objc_super v3 = [(RCWaveformDataSource *)self waveformGenerator];
    [v3 beginLoading];

    id v4 = [(RCWaveformDataSource *)self waveformGenerator];
    [v4 addSegmentOutputObserver:self];

    [(RCWaveformDataSource *)self startLoading];
  }
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(RCWaveformDataSource *)self waveformGenerator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1A020;
  v9[3] = &unk_6D4E0;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 finishLoadingWithCompletionTimeout:a3 completionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cancelLoading
{
}

- (BOOL)waitUntilFinished
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A1F0;
  v5[3] = &unk_6D508;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  objc_super v3 = v6;
  [(RCWaveformDataSource *)self finishLoadingWithCompletionTimeout:-1 completionBlock:v5];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(self) = ![(RCWaveformGenerator *)self->_waveformGenerator canceled];

  return (char)self;
}

- (BOOL)setPaused:(BOOL)a3
{
  return 1;
}

- (BOOL)finished
{
  return [(RCWaveformGenerator *)self->_waveformGenerator finished];
}

- (BOOL)canceled
{
  return [(RCWaveformGenerator *)self->_waveformGenerator canceled];
}

- (float)loadingProgress
{
  return -1.0;
}

- (double)duration
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1A33C;
  v12 = sub_1A34C;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A354;
  v7[3] = &unk_6D530;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(queue, v7);
  objc_super v3 = (void *)v9[5];
  if (v3)
  {
    [v3 timeRange];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  [(RCWaveformDataSource *)self duration];

  double v3 = RCTimeRangeMake(0.0, v2);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)waveformSegmentsInTimeRange:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1A33C;
  v12 = sub_1A34C;
  id v13 = 0;
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A4E4;
  v6[3] = &unk_6D558;
  v6[4] = self;
  v6[5] = &v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = a3;
  dispatch_sync(queue, v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)waveformSegmentsIntersectingTimeRange:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1A33C;
  v12 = sub_1A34C;
  id v13 = 0;
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A644;
  v6[3] = &unk_6D558;
  v6[4] = self;
  v6[5] = &v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = a3;
  dispatch_sync(queue, v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3
{
  id v3 = a3;

  return v3;
}

- (double)averagePowerLevelsRate
{
  uint64_t v6 = 0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A784;
  v5[3] = &unk_6D530;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  return 0;
}

- (void)saveGeneratedWaveformIfNecessary
{
  unsigned __int8 v3 = [(RCWaveformDataSource *)self hasSavedGeneratedWaveform];
  id v4 = [(RCWaveformDataSource *)self generatedWaveformOutputURL];
  if (self->_hasStartedLoading && (v3 & 1) == 0)
  {
    double v5 = [(RCWaveformDataSource *)self waveformGenerator];
    if ([v5 canceled])
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v6 = [v4 path];
    id v7 = [v6 length];

    if (v7)
    {
      [(RCWaveformDataSource *)self setHasSavedGeneratedWaveform:1];
      double v5 = [(RCWaveformDataSource *)self saveableWaveform];
      if ([v5 segmentCount])
      {
        uint64_t v8 = +[NSThread currentThread];
        [v8 threadPriority];
        double v10 = v9;

        id v11 = +[NSThread currentThread];
        [v11 setThreadPriority:1.0];

        v12 = objc_msgSend(v5, "segmentsCopy", CFAbsoluteTimeGetCurrent());
        id v13 = +[RCWaveformSegment segmentsByMergingSegments:v12 preferredSegmentDuration:30.0];

        if ([v13 count])
        {
          v14 = [(RCWaveform *)[RCMutableWaveform alloc] initWithSegments:v13];

          double v5 = v14;
        }
        dispatch_queue_t v15 = +[NSThread currentThread];
        [v15 setThreadPriority:v10];
      }
      if ([v5 segmentCount])
      {
        double Current = CFAbsoluteTimeGetCurrent();
        v17 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_462AC((uint64_t)v4, v17);
        }

        -[RCWaveformDataSource setHasSavedGeneratedWaveform:](self, "setHasSavedGeneratedWaveform:", [v5 saveContentsToURL:v4]);
        double v18 = CFAbsoluteTimeGetCurrent();
        v19 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v22 = "-[RCWaveformDataSource saveGeneratedWaveformIfNecessary]";
          __int16 v23 = 2048;
          double v24 = v18 - Current;
          __int16 v25 = 1024;
          unsigned int v26 = [v5 segmentCount];
          _os_log_debug_impl(&def_3AC7C, v19, OS_LOG_TYPE_DEBUG, "%s -- save: took %.2f sec to save waveform with %d segments", buf, 0x1Cu);
        }
      }
      goto LABEL_15;
    }
  }
LABEL_16:
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1AACC;
  v20[3] = &unk_6D580;
  v20[4] = self;
  [(RCWaveformDataSource *)self _performObserversBlock:v20];
}

- (BOOL)shouldMergeLiveWaveform
{
  return 1;
}

- (void)mergeGeneratedWaveformIfNecessary
{
  if ([(RCWaveformDataSource *)self shouldMergeLiveWaveform])
  {
    unsigned __int8 v3 = [(RCWaveform *)self->_accumulatorWaveform segments];
    id v4 = [v3 lastObject];

    if (v4)
    {
      [v4 timeRange];
      double v6 = v5 + -15.0;
    }
    else
    {
      double v6 = -15.0;
    }
    id v7 = [(RCWaveform *)self->_accumulatorWaveform segments];
    id v8 = [v7 count];

    if (v8)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (Current - self->_liveRecordingMergeTime > 0.0333333333)
      {
        [(RCWaveformDataSource *)self durationPerWaveformSlice];
        double v11 = fmin(v10, 1.79769313e308);
        queue = self->_queue;
        v13[1] = 3221225472;
        v13[0] = _NSConcreteStackBlock;
        v13[2] = sub_1AC78;
        v13[3] = &unk_6D5A8;
        if (v11 < 0.001) {
          double v11 = 0.001;
        }
        v13[4] = self;
        v13[5] = 0x403E000000000000;
        *(double *)&v13[6] = v6;
        *(double *)&v13[7] = v11;
        dispatch_sync(queue, v13);
        self->_liveRecordingMergeTime = Current;
      }
    }
  }
}

- (void)updateAccumulatorWaveformSegmentsWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1ADAC;
  v7[3] = &unk_6D5D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)waveformGeneratorDidFinishLoading:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(RCWaveformDataSource *)self generatedWaveformOutputURL];
  if (v5)
  {
    id v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_46348((uint64_t)v5, v7);
    }

    if (self->_hasStartedLoading)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1B028;
      block[3] = &unk_6D490;
      block[4] = self;
      dispatch_sync(queue, block);
      self->_hasStartedLoading = 0;
      double v9 = +[NSFileManager defaultManager];
      double v10 = [v6 path];
      unsigned int v11 = [v9 fileExistsAtPath:v10];

      if (v11)
      {
        v12 = +[NSFileManager defaultManager];
        [v12 removeItemAtURL:v6 error:0];

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1B034;
        v14[3] = &unk_6D490;
        v14[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      }
    }
  }
  else
  {
    [(RCWaveformDataSource *)self saveGeneratedWaveformIfNecessary];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1B03C;
  v13[3] = &unk_6D580;
  v13[4] = self;
  [(RCWaveformDataSource *)self _performObserversBlock:v13];
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B168;
  block[3] = &unk_6D468;
  block[4] = self;
  id v12 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
  [(RCWaveformDataSource *)self mergeGeneratedWaveformIfNecessary];
  [(RCWaveformDataSource *)self segmentsInCompositionByConvertingFromActiveLoadingFragment:v7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1B174;
  v9[3] = &unk_6D5F8;
  void v9[4] = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v10;
  [(RCWaveformDataSource *)self _performObserversBlock:v9];
}

- (void)_performOnObserversBlock:(id)a3
{
}

- (void)_performObserversBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = sub_1A33C;
  v19 = sub_1A34C;
  id v20 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B370;
  block[3] = &unk_6D530;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync(queue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (RCWaveformGenerator)waveformGenerator
{
  return self->_waveformGenerator;
}

- (RCWaveform)accumulatorWaveform
{
  return &self->_accumulatorWaveform->super;
}

- (double)durationPerWaveformSlice
{
  return self->_durationPerWaveformSlice;
}

- (void)setDurationPerWaveformSlice:(double)a3
{
  self->_durationPerWaveformSlice = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasSavedGeneratedWaveform
{
  return self->_hasSavedGeneratedWaveform;
}

- (void)setHasSavedGeneratedWaveform:(BOOL)a3
{
  self->_hasSavedGeneratedWaveform = a3;
}

- (NSURL)generatedWaveformOutputURL
{
  return self->_generatedWaveformOutputURL;
}

- (NSHashTable)weakObservers
{
  return self->_weakObservers;
}

- (BOOL)hasStartedLoading
{
  return self->_hasStartedLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_generatedWaveformOutputURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_waveformGenerator, 0);

  objc_storeStrong((id *)&self->_accumulatorWaveform, 0);
}

@end