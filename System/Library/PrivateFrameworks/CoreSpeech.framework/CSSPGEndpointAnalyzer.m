@interface CSSPGEndpointAnalyzer
- (BOOL)hasReported;
- (BOOL)isAnalyzeMode;
- (CSSPGEndpointAnalyzer)init;
- (CSSPGEndpointAnalyzer)initWithAnalyzeMode;
- (CSSPGEndpointAnalyzer)initWithEndpointThreshold:(float)a3;
- (CSSPGEndpointAnalyzerDelegate)delegate;
- (EARCaesuraSilencePosteriorGenerator)caesuraSPG;
- (OS_dispatch_queue)queue;
- (double)lastSilencePosterior;
- (float)endpointThreshold;
- (int64_t)getFrameDurationMs;
- (void)addAudio:(id)a3 numSamples:(unint64_t)a4;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setCaesuraSPG:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointThreshold:(float)a3;
- (void)setHasReported:(BOOL)a3;
- (void)setIsAnalyzeMode:(BOOL)a3;
- (void)setLastSilencePosterior:(double)a3;
- (void)setQueue:(id)a3;
- (void)silenceDurationEstimateAvailable:(float *)a3 numEstimates:(unint64_t)a4 clientProcessedAudioMs:(float)a5;
- (void)stop;
@end

@implementation CSSPGEndpointAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastSilencePosterior:(double)a3
{
  self->_lastSilencePosterior = a3;
}

- (double)lastSilencePosterior
{
  return self->_lastSilencePosterior;
}

- (void)setIsAnalyzeMode:(BOOL)a3
{
  self->_isAnalyzeMode = a3;
}

- (BOOL)isAnalyzeMode
{
  return self->_isAnalyzeMode;
}

- (void)setHasReported:(BOOL)a3
{
  self->_hasReported = a3;
}

- (BOOL)hasReported
{
  return self->_hasReported;
}

- (void)setEndpointThreshold:(float)a3
{
  self->_endpointThreshold = a3;
}

- (float)endpointThreshold
{
  return self->_endpointThreshold;
}

- (void)setCaesuraSPG:(id)a3
{
}

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSSPGEndpointAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSPGEndpointAnalyzerDelegate *)WeakRetained;
}

- (void)silenceDurationEstimateAvailable:(float *)a3 numEstimates:(unint64_t)a4 clientProcessedAudioMs:(float)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118208;
  block[3] = &unk_100251E68;
  block[4] = self;
  block[5] = a4;
  float v7 = a5;
  dispatch_async(queue, block);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  [v4 silenceDurationMs];
  double v6 = v5;
  uint64_t v7 = qword_1002A3A60;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A3A60, 2) <= 0x444444444444444uLL)
  {
    v8 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSSPGEndpointAnalyzer clientSilenceFeaturesAvailable:]";
      __int16 v20 = 2050;
      uint64_t v21 = v7;
      __int16 v22 = 2050;
      double v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s EARClientSilenceFeatures heartbeat = %{public}lld,                   silScoreEstimate = %{public}f", buf, 0x20u);
      uint64_t v7 = qword_1002A3A60;
    }
  }
  qword_1002A3A60 = v7 + 1;
  if (!self->_hasReported && v6 >= self->_endpointThreshold)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v10 = WeakRetained;
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 spgEndpointAnalyzerDidDetectEndpoint:self];
      }
    }
    self->_hasReported = 1;
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001184A0;
  v16[3] = &unk_100253B08;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  dispatch_async(queue, v16);
}

- (void)setDelegate:(id)a3
{
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118584;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (int64_t)getFrameDurationMs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100118644;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001186F0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  int64_t v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    caesuraSPG = self->_caesuraSPG;
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[CSSPGEndpointAnalyzer dealloc]";
    __int16 v8 = 2114;
    uint64_t v9 = caesuraSPG;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s deallocating EARCaesuraSilencePosteriorGenerator: %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSSPGEndpointAnalyzer;
  [(CSSPGEndpointAnalyzer *)&v5 dealloc];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118908;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSSPGEndpointAnalyzer)initWithAnalyzeMode
{
  result = [(CSSPGEndpointAnalyzer *)self init];
  if (result) {
    result->_isAnalyzeMode = 1;
  }
  return result;
}

- (CSSPGEndpointAnalyzer)initWithEndpointThreshold:(float)a3
{
  result = [(CSSPGEndpointAnalyzer *)self init];
  if (result)
  {
    result->_endpointThreshold = a3;
    result->_isAnalyzeMode = 0;
  }
  return result;
}

- (CSSPGEndpointAnalyzer)init
{
  if (+[CSUtils isDarwinOS])
  {
    int64_t v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSSPGEndpointAnalyzer;
    id v4 = [(CSSPGEndpointAnalyzer *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSSPGEndpointAnalyzer", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;
    }
    self = v4;
    int64_t v3 = self;
  }

  return v3;
}

@end