@interface RCWaveformGenerator
- (BOOL)_appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3;
- (BOOL)_appendPowerMeterValuesFromDataInAudioFile:(id)a3 progressBlock:(id)a4;
- (BOOL)appendAveragePowerLevel:(float)a3;
- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3;
- (BOOL)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(id)a3 progressBlock:(id)a4;
- (BOOL)appendAveragePowerLevelsByDigestingSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)appendAveragePowerLevelsByDigestingWaveform:(id)a3;
- (BOOL)appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3;
- (BOOL)canceled;
- (BOOL)finished;
- (BOOL)idle;
- (BOOL)loadable;
- (BOOL)paused;
- (RCWaveformGenerator)init;
- (RCWaveformGenerator)initWithSamplingParametersFromGenerator:(id)a3;
- (RCWaveformGenerator)initWithSegmentFlushInterval:(double)a3;
- (double)segmentFlushInterval;
- (id).cxx_construct;
- (id)synchronouslyApproximateWaveformForAVContentURL:(id)a3 byReadingCurrentFileAheadTimeRange:(id)a4;
- (int64_t)overviewUnitsPerSecond;
- (int64_t)state;
- (void)_appendAveragePowerLevel:(float)a3;
- (void)_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4;
- (void)_appendPowerMeterValuesFromAudioPCMBuffer:(id)a3;
- (void)_appendPowerMeterValuesFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_onQueue_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4;
- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(void *)a3 frameCount:(int64_t)a4 format:(const AudioStreamBasicDescription *)a5 isPredigest:(BOOL)a6;
- (void)_onQueue_appendSegment:(id)a3;
- (void)_onQueue_digestAveragePowerLevel:(float)a3;
- (void)_onQueue_flushRemainingData;
- (void)_onQueue_flushWaveformSegment:(id)a3;
- (void)_onQueue_flushWithNextSegmentWithEndTime:(double)a3 isPredigest:(BOOL)a4;
- (void)_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers;
- (void)_onQueue_performLoadingFinishedBlock:(id)a3 internalBlockUUID:(id)a4 isTimeout:(BOOL)a5;
- (void)_onQueue_performObserversBlock:(id)a3;
- (void)_onQueue_pushAveragePowerLevel:(float)a3;
- (void)addSegmentOutputObserver:(id)a3;
- (void)async_finishLoadingByTerminating:(BOOL)a3 loadingFinishedBlockTimeout:(unint64_t)a4 loadingFinishedBlock:(id)a5;
- (void)beginLoading;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)flushPendingCapturedSampleBuffers;
- (void)removeSegmentOutputObserver:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setOverviewUnitsPerSecond:(int64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)terminateLoadingImmediately;
@end

@implementation RCWaveformGenerator

- (RCWaveformGenerator)init
{
  return 0;
}

- (RCWaveformGenerator)initWithSegmentFlushInterval:(double)a3
{
  v17.receiver = self;
  v17.super_class = (Class)RCWaveformGenerator;
  id v4 = [(RCWaveformGenerator *)&v17 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.VoiceMemos.RCWaveformGenerator.queue", 0);
    v6 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 3), v4, v4, 0);
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v4 + 2));
    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    v10 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v9;

    uint64_t v11 = +[NSMutableArray array];
    v12 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v11;

    uint64_t v13 = +[NSMutableArray array];
    v14 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v13;

    *((void *)v4 + 31) = 160;
    double v15 = 0.0333333333;
    if (a3 > 0.0) {
      double v15 = a3;
    }
    *((double *)v4 + 30) = v15;
  }
  return (RCWaveformGenerator *)v4;
}

- (RCWaveformGenerator)initWithSamplingParametersFromGenerator:(id)a3
{
  id v4 = (double *)a3;
  dispatch_queue_t v5 = [(RCWaveformGenerator *)self initWithSegmentFlushInterval:v4[30]];
  if (v5) {
    -[RCWaveformGenerator setOverviewUnitsPerSecond:](v5, "setOverviewUnitsPerSecond:", [v4 overviewUnitsPerSecond]);
  }

  return v5;
}

- (void)addSegmentOutputObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_104F8;
  v7[3] = &unk_6D0B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)removeSegmentOutputObserver:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific(self) == self)
  {
    [(NSHashTable *)self->_weakObservers removeObject:v4];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10620;
    v6[3] = &unk_6D0B0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(queue, v6);
  }
}

- (void)flushPendingCapturedSampleBuffers
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_106A0;
  block[3] = &unk_6D088;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)appendAveragePowerLevelsByDigestingSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int v5 = sub_106F0(self, a2);
  if (v5) {
    [(RCWaveformGenerator *)self _appendPowerMeterValuesFromSampleBuffer:a3];
  }
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3
{
  id v5 = a3;
  char v6 = sub_106F0(self, a2);
  if (v6) {
    [(RCWaveformGenerator *)self _appendPowerMeterValuesFromAudioPCMBuffer:v5];
  }

  return v6;
}

- (BOOL)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(id)a3 progressBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (sub_106F0(self, a2))
  {
    uint64_t v9 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [v7 path];
      sub_45F90(v10, v13, v9);
    }

    BOOL v11 = [(RCWaveformGenerator *)self _appendPowerMeterValuesFromDataInAudioFile:v7 progressBlock:v8];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5 = a3;
  if (sub_106F0(self, a2)) {
    BOOL v6 = [(RCWaveformGenerator *)self _appendAveragePowerLevelsByDigestingWaveformSegments:v5];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)appendAveragePowerLevel:(float)a3
{
  int v5 = sub_106F0(self, a2);
  if (v5)
  {
    *(float *)&double v6 = a3;
    [(RCWaveformGenerator *)self _appendAveragePowerLevel:v6];
  }
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveform:(id)a3
{
  id v5 = a3;
  char v6 = sub_106F0(self, a2);
  if (v6)
  {
    id v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_45FFC();
    }

    id v8 = [v5 segmentsCopy];
    [(RCWaveformGenerator *)self _appendAveragePowerLevelsByDigestingWaveformSegments:v8];
  }
  return v6;
}

- (BOOL)loadable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10B18;
  v5[3] = &unk_6D148;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)finished
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10BE0;
  v5[3] = &unk_6D148;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)idle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10CA8;
  v5[3] = &unk_6D148;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginLoading
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10D68;
  block[3] = &unk_6D198;
  block[4] = self;
  void block[5] = v4;
  block[6] = a2;
  dispatch_sync(queue, block);
  _Block_object_dispose(v4, 8);
}

- (void)setPaused:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1107C;
  void v4[3] = &unk_6D1C0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (BOOL)paused
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1128C;
  v5[3] = &unk_6D148;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)terminateLoadingImmediately
{
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
}

- (void)async_finishLoadingByTerminating:(BOOL)a3 loadingFinishedBlockTimeout:(unint64_t)a4 loadingFinishedBlock:(id)a5
{
  id v9 = [a5 copy];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11388;
  block[3] = &unk_6D238;
  block[4] = self;
  id v13 = v9;
  BOOL v16 = a3;
  SEL v14 = a2;
  unint64_t v15 = a4;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)_onQueue_performLoadingFinishedBlock:(id)a3 internalBlockUUID:(id)a4 isTimeout:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (void (**)(id, uint64_t, NSError *))a3;
  id v9 = a4;
  id v10 = [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs indexOfObject:v9];
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs removeObjectAtIndex:v10];
    [(NSMutableArray *)self->_internalFinishedLoadingBlocks removeObjectAtIndex:v10];
  }
  if (v5)
  {
    id v11 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      v18 = "-[RCWaveformGenerator _onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:]";
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl(&def_3AC7C, v11, OS_LOG_TYPE_INFO, "%s -- [FinishLoading] %@ WARNING: Encountered time out while trying to finish loading", (uint8_t *)&v17, 0x16u);
    }

    if (!self->_canceled && ![(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs count]) {
      [(RCWaveformGenerator *)self async_finishLoadingByTerminating:1 loadingFinishedBlockTimeout:0 loadingFinishedBlock:0];
    }
  }
  BOOL canceled = self->_canceled;
  id v13 = self->_loadingError;
  SEL v14 = v13;
  if (v8)
  {
    uint64_t v16 = !canceled && v13 == 0;
    v8[2](v8, v16, v13);
  }
}

- (void)_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers
{
  id v3 = [(NSMutableArray *)self->_internalFinishedLoadingBlocks copy];
  id v4 = [(NSHashTable *)self->_weakObservers allObjects];
  [(NSMutableArray *)self->_internalFinishedLoadingBlocks removeAllObjects];
  [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs removeAllObjects];
  self->_state = 3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_6D278, sub_14068(&self->_samplePowerMeter.mSampleRate));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "waveformGeneratorDidFinishLoading:error:", self, self->_loadingError, (void)v10);
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_onQueue_performObserversBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_weakObservers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_appendAveragePowerLevel:(float)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11CD8;
  void v4[3] = &unk_6D2A0;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_appendPowerMeterValuesFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (StreamBasicDescription)
  {
    uint64_t v7 = StreamBasicDescription;
    size_t bufferListSizeNeededOut = 0;
    if (!CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, 0))
    {
      id v8 = objc_alloc((Class)NSMutableData);
      id v9 = [v8 initWithLength:bufferListSizeNeededOut];
      if (v9)
      {
        size_t bufferListSizeNeededOut = 0;
        id v10 = v9;
        long long v11 = (AudioBufferList *)[v10 mutableBytes];
        OSStatus AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, 0, v11, (size_t)[v10 length], 0, 0, 0, (CMBlockBufferRef *)&bufferListSizeNeededOut);
        if (AudioBufferListWithRetainedBlockBuffer)
        {
          long long v13 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_4607C(AudioBufferListWithRetainedBlockBuffer, v13);
          }
        }
        else
        {
          queue = self->_queue;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_11E7C;
          v15[3] = &unk_6D2C8;
          v15[5] = v11;
          v15[6] = v7;
          v15[4] = self;
          dispatch_sync(queue, v15);
          CFRelease((CFTypeRef)bufferListSizeNeededOut);
        }
      }
    }
  }
}

- (void)_appendPowerMeterValuesFromAudioPCMBuffer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_11F94;
  v7[3] = &unk_6D0B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)_appendPowerMeterValuesFromDataInAudioFile:(id)a3 progressBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (sub_106F0(self, a2))
  {
    v43[0] = 0;
    id v9 = [objc_alloc((Class)AVAudioFile) initForReading:v7 commonFormat:1 interleaved:0 error:v43];
    id v10 = v43[0];
    BOOL v11 = v9 != 0;
    if (v9)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_12408;
      block[3] = &unk_6D0B0;
      block[4] = self;
      id v13 = v9;
      id v42 = v13;
      dispatch_sync(queue, block);
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      int v40 = 0;
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x2020000000;
      v38[3] = 0;
      id v24 = v10;
      v25 = v8;
      id v14 = [v13 length];
      unint64_t v15 = [v13 processingFormat];
      uint64_t v16 = *((unsigned int *)[v15 streamDescription] + 6);

      uint64_t v35 = 0;
      v36[0] = &v35;
      v36[1] = 0x3032000000;
      v36[2] = sub_116B0;
      v36[3] = sub_116C0;
      id v37 = 0;
      int v17 = self->_queue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_12414;
      v26[3] = &unk_6D2F0;
      id v18 = v13;
      id v27 = v18;
      v28 = self;
      v30 = &v35;
      v31 = v38;
      uint64_t v33 = v16;
      id v8 = v25;
      __int16 v19 = v25;
      id v34 = v14;
      id v29 = v19;
      v32 = v39;
      dispatch_sync(v17, v26);
      id v10 = v24;
      if (*(void *)(v36[0] + 40))
      {
        v20 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_46108((uint64_t)v18, (uint64_t)v36, v20);
        }

        [(RCWaveformGenerator *)self terminateLoadingImmediately];
      }
      activeAudioFile = self->_activeAudioFile;
      self->_activeAudioFile = 0;

      if (v19) {
        v19[2](v19, 1.0);
      }

      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(v38, 8);
      _Block_object_dispose(v39, 8);
    }
    else
    {
      v22 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_461A8();
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_12748;
  v10[3] = &unk_6D318;
  double v12 = var0;
  double v13 = var1;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(queue, v10);
}

- (void)_onQueue_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12814;
  block[3] = &unk_6D340;
  id v12 = v8;
  SEL v13 = a2;
  block[4] = self;
  double v14 = var0;
  double v15 = var1;
  id v10 = v8;
  dispatch_sync(queue, block);
}

- (id)synchronouslyApproximateWaveformForAVContentURL:(id)a3 byReadingCurrentFileAheadTimeRange:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_116B0;
  id v29 = sub_116C0;
  id v30 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12E78;
  block[3] = &unk_6D148;
  block[4] = self;
  void block[5] = &v25;
  dispatch_sync(queue, block);
  id v9 = (void *)v26[5];
  if (v9
    && ([v9 url],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isEqual:v7],
        v10,
        (v11 & 1) != 0)
    && ![(RCWaveformGenerator *)self finished])
  {
    unsigned __int8 v14 = [(RCWaveformGenerator *)self paused];
    if ((v14 & 1) == 0) {
      [(RCWaveformGenerator *)self setPaused:1];
    }
    double v15 = [[RCWaveformGenerator alloc] initWithSamplingParametersFromGenerator:self];
    uint64_t v16 = [[RCWaveformSegmentAccumulator alloc] initWithWaveformGenerator:v15];
    -[RCWaveformGenerator _appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:](v15, "_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", v26[5], var0, var1);
    [(RCWaveformSegmentAccumulator *)v16 waitUntilFinished];
    int v17 = [(RCWaveformSegmentAccumulator *)v16 segments];
    id v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);

    __int16 v19 = [(RCWaveformSegmentAccumulator *)v16 segments];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_12E8C;
    v20[3] = &unk_6D368;
    double v22 = var0;
    double v23 = var1;
    id v12 = v18;
    id v21 = v12;
    [v19 enumerateObjectsUsingBlock:v20];

    if ((v14 & 1) == 0) {
      [(RCWaveformGenerator *)self setPaused:0];
    }
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (BOOL)_appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5 = a3;
  if (sub_106F0(self, a2))
  {
    uint64_t v13 = 0;
    unsigned __int8 v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13008;
    block[3] = &unk_6D390;
    id v10 = v5;
    unsigned __int8 v11 = self;
    id v12 = &v13;
    dispatch_sync(queue, block);
    BOOL v7 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_onQueue_flushWaveformSegment:(id)a3
{
  id v5 = a3;
  if (sub_106F0(self, a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      [v5 timeRange];
      if (v6 >= self->_totalFlushedTime)
      {
        [(RCWaveformGenerator *)self _onQueue_flushRemainingData];
      }
      else
      {
        [v5 timeRange];
        +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"Invalid endTime (segment end time %f is less than total flushed time %f. Will regenerate waveform."), v7, *(void *)&self->_totalFlushedTime;
      }
      self->_framesConsumedSinceLastFlush = 0;
      [v5 timeRange];
      self->_totalFlushedTime = v8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_132E0;
      v9[3] = &unk_6D3B8;
      v9[4] = self;
      id v10 = v5;
      [(RCWaveformGenerator *)self _onQueue_performObserversBlock:v9];
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;
    }
  }
}

- (void)_onQueue_flushWithNextSegmentWithEndTime:(double)a3 isPredigest:(BOOL)a4
{
  if (sub_106F0(self, a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      double v6 = RCTimeRangeMake(self->_totalFlushedTime, a3);
      double v8 = v7;
      begin = self->_powerLevelBuffer.__begin_;
      end = self->_powerLevelBuffer.__end_;
      uint64_t v11 = (char *)end - (char *)begin;
      if (end == begin)
      {
        value = self->_powerLevelBuffer.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v14 = v11 >> 2;
          uint64_t v15 = (char *)value - (char *)begin;
          if (v15 >> 1 <= (unint64_t)((v11 >> 2) + 1)) {
            uint64_t v16 = v14 + 1;
          }
          else {
            uint64_t v16 = v15 >> 1;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          id v18 = (char *)sub_13FA4((uint64_t)&self->_powerLevelBuffer.__end_cap_, v17);
          __int16 v19 = self->_powerLevelBuffer.__begin_;
          v20 = self->_powerLevelBuffer.__end_;
          id v21 = (float *)&v18[4 * v14];
          double v23 = (float *)&v18[4 * v22];
          *id v21 = self->_powerLevelBufferLastPushedValue;
          uint64_t v13 = v21 + 1;
          while (v20 != v19)
          {
            int v24 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v21-- - 1) = v24;
          }
          self->_powerLevelBuffer.__begin_ = v21;
          self->_powerLevelBuffer.__end_ = v13;
          self->_powerLevelBuffer.__end_cap_.__value_ = v23;
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          float *end = self->_powerLevelBufferLastPushedValue;
          uint64_t v13 = end + 1;
        }
        self->_powerLevelBuffer.__end_ = v13;
      }
      uint64_t v25 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelVector:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelVector:", &self->_powerLevelBuffer, v6, v8);
      [(RCWaveformSegment *)v25 timeRange];
      self->_totalFlushedTime = v26;
      self->_powerLevelsConsumedSinceLastFlush = 0;
      self->_framesConsumedSinceLastFlush = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_134BC;
      v28[3] = &unk_6D3B8;
      v28[4] = self;
      uint64_t v27 = v25;
      id v29 = v27;
      [(RCWaveformGenerator *)self _onQueue_performObserversBlock:v28];
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;
    }
  }
}

- (void)_onQueue_flushRemainingData
{
  if (sub_106F0(self, a2))
  {
    double totalFlushedTime = self->_totalFlushedTime;
    double v4 = self->_totalDigestedTime - totalFlushedTime;
    if (v4 > 0.0)
    {
      double v5 = totalFlushedTime + v4;
      [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:0 isPredigest:v5];
    }
  }
}

- (void)_onQueue_digestAveragePowerLevel:(float)a3
{
  if (sub_106F0(self, a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      value = self->_powerLevelBuffer.__end_cap_.__value_;
      self->_powerLevelBufferLastPushedValue = a3;
      end = self->_powerLevelBuffer.__end_;
      if (end >= value)
      {
        begin = self->_powerLevelBuffer.__begin_;
        uint64_t v9 = end - begin;
        if ((unint64_t)(v9 + 1) >> 62) {
          sub_13EFC();
        }
        unint64_t v10 = (char *)value - (char *)begin;
        unint64_t v11 = ((char *)value - (char *)begin) >> 1;
        if (v11 <= v9 + 1) {
          unint64_t v11 = v9 + 1;
        }
        if (v10 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12)
        {
          uint64_t v13 = (char *)sub_13FA4((uint64_t)&self->_powerLevelBuffer.__end_cap_, v12);
          begin = self->_powerLevelBuffer.__begin_;
          end = self->_powerLevelBuffer.__end_;
        }
        else
        {
          uint64_t v13 = 0;
        }
        uint64_t v14 = (float *)&v13[4 * v9];
        uint64_t v15 = (float *)&v13[4 * v12];
        float *v14 = a3;
        double v7 = v14 + 1;
        while (end != begin)
        {
          int v16 = *((_DWORD *)end-- - 1);
          *((_DWORD *)v14-- - 1) = v16;
        }
        self->_powerLevelBuffer.__begin_ = v14;
        self->_powerLevelBuffer.__end_ = v7;
        self->_powerLevelBuffer.__end_cap_.__value_ = v15;
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        float *end = a3;
        double v7 = end + 1;
      }
      self->_powerLevelBuffer.__end_ = v7;
    }
  }
}

- (void)_onQueue_pushAveragePowerLevel:(float)a3
{
  if (sub_106F0(self, a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      unint64_t v5 = self->_powerLevelsConsumedSinceLastFlush + 1;
      self->_powerLevelsConsumedSinceLastFlush = v5;
      double totalFlushedTime = self->_totalFlushedTime;
      double segmentFlushInterval = self->_segmentFlushInterval;
      double v8 = totalFlushedTime + (double)v5 / (double)self->_overviewUnitsPerSecond;
      self->_totalDigestedTime = v8;
      BOOL v9 = v8 - totalFlushedTime < segmentFlushInterval + 4.4408921e-16;
      double v10 = -1.0;
      double v11 = v9 ? -1.0 : v8;
      *(float *)&double v10 = a3;
      [(RCWaveformGenerator *)self _onQueue_digestAveragePowerLevel:v10];
      if (v11 > 0.0)
      {
        [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:0 isPredigest:v11];
      }
    }
  }
}

- (void)_onQueue_appendSegment:(id)a3
{
  id v5 = a3;
  if (sub_106F0(self, a2)) {
    [(RCWaveformGenerator *)self _onQueue_flushWaveformSegment:v5];
  }
}

- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(void *)a3 frameCount:(int64_t)a4 format:(const AudioStreamBasicDescription *)a5 isPredigest:(BOOL)a6
{
  BOOL v35 = a6;
  v36 = (float *)a3;
  if (sub_106F0(self, a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v9 = (id)dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      BOOL v10 = a5->mChannelsPerFrame >= 2 && a5->mBytesPerFrame > a5->mBytesPerPacket;
      double mSampleRate = self->_samplePowerMeter.mSampleRate;
      if (!self->_isSampleRateKnown)
      {
        self->_isSampleRateKnown = 1;
        double mSampleRate = a5->mSampleRate;
        sub_14088((uint64_t)&self->_samplePowerMeter, a5->mSampleRate);
        double v12 = mSampleRate * self->_segmentFlushInterval;
        self->_int64_t framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
        self->_int64_t framesNeededForNextFlush = (uint64_t)v12;
      }
      if (a4 >= 1)
      {
        uint64_t v33 = &v36[a4];
        int64_t v34 = 2 * a4;
        for (uint64_t i = a4; i > 0; i -= v17 >> 32)
        {
          int64_t framesNeededForNextDB = i;
          if (self->_overviewUnitsPerSecond)
          {
            if (self->_framesNeededForNextDB >= i) {
              int64_t framesNeededForNextDB = i;
            }
            else {
              int64_t framesNeededForNextDB = self->_framesNeededForNextDB;
            }
          }
          if ((int)framesNeededForNextDB >= 1 && self->_canceled) {
            break;
          }
          UInt32 mBitsPerChannel = a5->mBitsPerChannel;
          if (mBitsPerChannel == 16)
          {
            id v18 = (char *)v36 + 2 * (a4 - i);
            uint64_t v17 = framesNeededForNextDB << 32;
            __chkstk_darwin(v9);
            int v16 = (float *)((char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
            bzero(v16, v19);
            if (v10 || a5->mChannelsPerFrame < 2)
            {
              if ((int)framesNeededForNextDB >= 1)
              {
                uint64_t v23 = 0;
                do
                {
                  v16[v23] = (float)*(__int16 *)&v18[2 * v23] / 32767.0;
                  ++v23;
                }
                while (framesNeededForNextDB != v23);
              }
            }
            else if ((int)framesNeededForNextDB >= 1)
            {
              uint64_t v20 = 0;
              id v21 = (char *)v33 - 2 * i;
              do
              {
                int v22 = *(__int16 *)&v18[2 * v20];
                if (v22 <= *(__int16 *)&v21[2 * v20]) {
                  int v22 = *(__int16 *)&v21[2 * v20];
                }
                v16[v20++] = (float)v22 / 32767.0;
              }
              while (framesNeededForNextDB != v20);
            }
          }
          else
          {
            if (mBitsPerChannel != 32)
            {
              v31 = OSLogForCategory(@"Default");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                sub_46228(v31);
              }

              return;
            }
            if (!v10 && a5->mChannelsPerFrame >= 2) {
              sub_141E0((uint64_t)&self->_samplePowerMeter, &v36[v34 - i], 1, framesNeededForNextDB);
            }
            int v16 = &v36[a4 - i];
            uint64_t v17 = framesNeededForNextDB << 32;
          }
          UInt32 mChannelsPerFrame = 1;
          sub_141E0((uint64_t)&self->_samplePowerMeter, v16, 1, framesNeededForNextDB);
          unint64_t framesConsumedSinceLastFlush = self->_framesConsumedSinceLastFlush;
          int64_t v26 = self->_framesNeededForNextDB - (v17 >> 32);
          int64_t framesNeededForNextFlush = self->_framesNeededForNextFlush - (v17 >> 32);
          self->_int64_t framesNeededForNextDB = v26;
          self->_int64_t framesNeededForNextFlush = framesNeededForNextFlush;
          unint64_t v28 = framesConsumedSinceLastFlush + (v17 >> 32);
          self->_unint64_t framesConsumedSinceLastFlush = v28;
          if (v10) {
            UInt32 mChannelsPerFrame = a5->mChannelsPerFrame;
          }
          self->_totalDigestedTime = self->_totalFlushedTime + (double)v28 / mSampleRate / (double)mChannelsPerFrame;
          if (v26 <= 0)
          {
            long double mMaxPeak = self->_samplePowerMeter.mMaxPeak;
            if (mMaxPeak <= 0.000001) {
              long double v30 = -120.0;
            }
            else {
              long double v30 = log10(mMaxPeak) * 20.0;
            }
            if (!v35)
            {
              *(float *)&long double v30 = v30;
              [(RCWaveformGenerator *)self _onQueue_digestAveragePowerLevel:(double)v30];
            }
            sub_14068(&self->_samplePowerMeter.mSampleRate);
            self->_int64_t framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
            int64_t framesNeededForNextFlush = self->_framesNeededForNextFlush;
          }
          if (framesNeededForNextFlush <= 0)
          {
            id v9 = [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:v35 isPredigest:self->_totalDigestedTime];
            self->_int64_t framesNeededForNextFlush = (uint64_t)(mSampleRate * self->_segmentFlushInterval);
          }
        }
      }
    }
  }
}

- (double)segmentFlushInterval
{
  return self->_segmentFlushInterval;
}

- (int64_t)overviewUnitsPerSecond
{
  return self->_overviewUnitsPerSecond;
}

- (void)setOverviewUnitsPerSecond:(int64_t)a3
{
  self->_overviewUnitsPerSecond = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_BOOL canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  begin = self->_powerLevelBuffer.__begin_;
  if (begin)
  {
    self->_powerLevelBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_activeAudioFile, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlockUUIDs, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_digestPausedSemaphore, 0);
}

- (id).cxx_construct
{
  self->_powerLevelBuffer.__begin_ = 0;
  self->_powerLevelBuffer.__end_ = 0;
  self->_powerLevelBuffer.__end_cap_.__value_ = 0;
  return self;
}

@end