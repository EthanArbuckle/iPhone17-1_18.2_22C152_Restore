@interface CSAttSiriSignalProvider
+ (id)sharedProvider;
- (BOOL)audioRequested;
- (CSAttSiriOSDProvider)osdProvider;
- (CSAttSiriSignalProvider)init;
- (CSAudioStream)audioStream;
- (CSAudioStreamHolding)audioStreamHolding;
- (NSMapTable)observerAndOptions;
- (OS_dispatch_queue)queue;
- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3;
- (unint64_t)_observersCount;
- (void)_cancelAudioStreamHold;
- (void)_deliverSignalProviderDidStopUnexpectedly;
- (void)_holdAudioStreamWithTimeout:(double)a3;
- (void)_resetAudioStreamObserverContext;
- (void)_startAudioStreamingWithSignalOptions:(id)a3 completion:(id)a4;
- (void)_stopAllAnalyzers;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)cancelAudioStreamHoldingIfNeeded;
- (void)fetchStartSpeechWithOwnVoiceVadByProcessedAudioInMs:(double)a3 fetchOwnVoiceVADSignal:(BOOL)a4 prependAudioDuration:(double)a5 speechDetectSampleCountThreshold:(unint64_t)a6 completion:(id)a7;
- (void)osdProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9;
- (void)setAudioRequested:(BOOL)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setObserverAndOptions:(id)a3;
- (void)setOsdProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)startWithSignalOptions:(id)a3 observer:(id)a4 completion:(id)a5;
- (void)stopWithObserver:(id)a3 holdAudioStream:(BOOL)a4;
@end

@implementation CSAttSiriSignalProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_observerAndOptions, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_osdProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAudioRequested:(BOOL)a3
{
  self->_audioRequested = a3;
}

- (BOOL)audioRequested
{
  return self->_audioRequested;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setObserverAndOptions:(id)a3
{
}

- (NSMapTable)observerAndOptions
{
  return self->_observerAndOptions;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setOsdProvider:(id)a3
{
}

- (CSAttSiriOSDProvider)osdProvider
{
  return self->_osdProvider;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_cancelAudioStreamHold
{
  v3 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSAttSiriSignalProvider _cancelAudioStreamHold]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  v4 = [(CSAudioStream *)self->_audioStream streamProvider];
  [v4 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;
}

- (void)_holdAudioStreamWithTimeout:(double)a3
{
  v5 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSAttSiriSignalProvider _holdAudioStreamWithTimeout:]";
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s timeout = %.2f", (uint8_t *)&v10, 0x16u);
  }
  id v6 = [objc_alloc((Class)CSAudioStreamHoldRequestOption) initWithTimeout:6 clientIdentity:0 requireRecordModeLock:1 requireListeningMicIndicatorLock:a3];
  v7 = [(CSAudioStream *)self->_audioStream streamProvider];
  v8 = [v7 holdAudioStreamWithDescription:@"CSAttSiriAttendingAudioStream" option:v6];
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v8;
}

- (unint64_t)_observersCount
{
  v2 = [(CSAttSiriSignalProvider *)self observerAndOptions];
  v3 = [v2 keyEnumerator];

  v4 = 0;
  unint64_t v5 = -1;
  do
  {
    uint64_t v6 = [v3 nextObject];

    ++v5;
    v4 = (void *)v6;
  }
  while (v6);

  return v5;
}

- (id)_startStreamOptionWithMachAbsTime:(unint64_t)a3
{
  v4 = +[CSAudioStartStreamOption noAlertOption];
  [v4 setStartRecordingHostTime:a3];
  [v4 setRequireSingleChannelLookup:1];
  [v4 setSelectedChannel:0];
  return v4;
}

- (void)_resetAudioStreamObserverContext
{
  v3 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSAttSiriSignalProvider _resetAudioStreamObserverContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_audioRequested = 0;
  v4 = [(CSAttSiriSignalProvider *)self observerAndOptions];
  [v4 removeAllObjects];
}

- (void)osdProvider:(id)a3 silenceFramesCountMs:(double)a4 silenceProbability:(double)a5 silenceDurationMs:(double)a6 processedAudioMs:(double)a7 deviceHasBoronEnabled:(BOOL)a8 latestBoronActiveSampleCount:(int64_t)a9
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050C78;
  block[3] = &unk_10024F500;
  block[4] = self;
  *(double *)&block[5] = a4;
  *(double *)&block[6] = a5;
  *(double *)&block[7] = a6;
  *(double *)&block[8] = a7;
  BOOL v11 = a8;
  block[9] = a9;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100050E90;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  int v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_stopAllAnalyzers
{
  osdProvider = self->_osdProvider;
  if (osdProvider) {
    [(CSAttSiriOSDProvider *)osdProvider stopAnalysisAndReset];
  }
}

- (void)_deliverSignalProviderDidStopUnexpectedly
{
  v2 = [(CSAttSiriSignalProvider *)self observerAndOptions];
  id v6 = [v2 keyEnumerator];

  uint64_t v3 = [v6 nextObject];
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      if (objc_opt_respondsToSelector()) {
        [v4 attSiriSignalProviderDidStopUnexpectedly];
      }
      uint64_t v5 = [v6 nextObject];

      v4 = (void *)v5;
    }
    while (v5);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051160;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelAudioStreamHoldingIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051298;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchStartSpeechWithOwnVoiceVadByProcessedAudioInMs:(double)a3 fetchOwnVoiceVADSignal:(BOOL)a4 prependAudioDuration:(double)a5 speechDetectSampleCountThreshold:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100051364;
  v15[3] = &unk_10024F4B8;
  BOOL v20 = a4;
  double v17 = a3;
  double v18 = a5;
  unint64_t v19 = a6;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(queue, v15);
}

- (void)stopWithObserver:(id)a3 holdAudioStream:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051868;
  block[3] = &unk_1002537C0;
  id v10 = v6;
  BOOL v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_startAudioStreamingWithSignalOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 audioStreamRequest];

  if (v8)
  {
    id v9 = [v6 audioStreamRequest];
  }
  else
  {
    id v10 = [v6 attendingOptions];
    id v11 = objc_alloc((Class)CSAudioRecordContext);
    id v12 = [v10 recordType];
    double v13 = [v10 deviceId];
    id v14 = [v11 initWithRecordType:v12 deviceId:v13];

    id v9 = +[CSAudioStreamRequest defaultRequestWithContext:v14];
  }
  [v9 setClientIdentity:3];
  [v9 setRequestListeningMicIndicatorLock:1];
  v15 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v16 = [v9 recordContext];
  double v17 = [v15 audioProviderWithContext:v16 error:0];

  if (v17)
  {
    double v18 = (CSAudioStream *)[objc_alloc((Class)CSAudioStream) initWithAudioStreamProvider:v17 streamName:@"CSAttSiriAttendingAudioStream" streamRequest:v9];
    audioStream = self->_audioStream;
    self->_audioStream = v18;

    [(CSAudioStream *)self->_audioStream setDelegate:self];
    BOOL v20 = [v6 attendingOptions];
    v21 = -[CSAttSiriSignalProvider _startStreamOptionWithMachAbsTime:](self, "_startStreamOptionWithMachAbsTime:", [v20 startAttendingHostTime]);

    v22 = self->_audioStream;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100051F6C;
    v24[3] = &unk_100253150;
    v24[4] = self;
    id v25 = v7;
    [(CSAudioStream *)v22 startAudioStreamWithOption:v21 completion:v24];

LABEL_10:
    goto LABEL_11;
  }
  v23 = CSLogCategoryAttending;
  if (os_log_type_enabled(CSLogCategoryAttending, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSAttSiriSignalProvider _startAudioStreamingWithSignalOptions:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s attSiriAudioStreamProvider is nil!", buf, 0xCu);
  }
  [(CSAttSiriSignalProvider *)self _resetAudioStreamObserverContext];
  if (v7)
  {
    v21 = +[NSError errorWithDomain:CSErrorDomain code:2104 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v21);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)startWithSignalOptions:(id)a3 observer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005214C;
  v15[3] = &unk_100252D38;
  id v16 = v8;
  id v17 = v9;
  double v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (CSAttSiriSignalProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriSignalProvider;
  v2 = [(CSAttSiriSignalProvider *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttSiriSignalProvider Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_audioRequested = 0;
    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    observerAndOptions = v2->_observerAndOptions;
    v2->_observerAndOptions = (NSMapTable *)v5;

    id v7 = objc_alloc_init(CSAttSiriOSDProvider);
    osdProvider = v2->_osdProvider;
    v2->_osdProvider = v7;

    [(CSAttSiriOSDProvider *)v2->_osdProvider setDelegate:v2];
  }
  return v2;
}

+ (id)sharedProvider
{
  if (qword_1002A3730 != -1) {
    dispatch_once(&qword_1002A3730, &stru_10024F418);
  }
  v2 = (void *)qword_1002A3728;
  return v2;
}

@end