@interface CSOpportuneSpeakListener
- (BOOL)_popRemoteVADSignal;
- (BOOL)_shouldReportBoron;
- (BOOL)isMediaPlayingNow;
- (CSAudioRecordContext)latestContext;
- (CSAudioSessionProviding)audioSessionProvider;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioStreamProvider;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSOpportuneSpeakListener)init;
- (CSOpportuneSpeakListenerDelegate)delegate;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSPGEndpointAnalyzer)spgEndpointAnalyzer;
- (NSMutableArray)remoteVADAlignBuffer;
- (OS_dispatch_queue)alignBufferQueue;
- (int)remoteVADSPGRatio;
- (unint64_t)remoteVADAlignCount;
- (unint64_t)runningSampleCount;
- (void)_addRemoteVADSignal:(BOOL)a3;
- (void)_resetAlignBuffer;
- (void)_startRequestWithCompletion:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)setAlignBufferQueue:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioSessionProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamProvider:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMediaPlayingNow:(BOOL)a3;
- (void)setLatestContext:(id)a3;
- (void)setRemoteVADAlignBuffer:(id)a3;
- (void)setRemoteVADAlignCount:(unint64_t)a3;
- (void)setRemoteVADSPGRatio:(int)a3;
- (void)setRunningSampleCount:(unint64_t)a3;
- (void)setSpgEndpointAnalyzer:(id)a3;
- (void)spgEndpointAnalyzer:(id)a3 hasSilenceScoreEstimate:(double)a4 clientProcessedAudioTimeMS:(float)a5;
- (void)startListenWithOption:(id)a3 completion:(id)a4;
- (void)stopListenWithCompletion:(id)a3;
- (void)stopListenWithStateReset:(BOOL)a3 completion:(id)a4;
@end

@implementation CSOpportuneSpeakListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_alignBufferQueue, 0);
  objc_storeStrong((id *)&self->_remoteVADAlignBuffer, 0);
  objc_storeStrong((id *)&self->_latestContext, 0);
  objc_storeStrong((id *)&self->_audioSessionProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamProvider, 0);
  objc_storeStrong((id *)&self->_spgEndpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setRunningSampleCount:(unint64_t)a3
{
  self->_runningSampleCount = a3;
}

- (unint64_t)runningSampleCount
{
  return self->_runningSampleCount;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAlignBufferQueue:(id)a3
{
}

- (OS_dispatch_queue)alignBufferQueue
{
  return self->_alignBufferQueue;
}

- (void)setRemoteVADAlignCount:(unint64_t)a3
{
  self->_remoteVADAlignCount = a3;
}

- (unint64_t)remoteVADAlignCount
{
  return self->_remoteVADAlignCount;
}

- (void)setRemoteVADAlignBuffer:(id)a3
{
}

- (NSMutableArray)remoteVADAlignBuffer
{
  return self->_remoteVADAlignBuffer;
}

- (void)setIsMediaPlayingNow:(BOOL)a3
{
  self->_isMediaPlayingNow = a3;
}

- (BOOL)isMediaPlayingNow
{
  return self->_isMediaPlayingNow;
}

- (void)setLatestContext:(id)a3
{
}

- (CSAudioRecordContext)latestContext
{
  return self->_latestContext;
}

- (void)setAudioSessionProvider:(id)a3
{
}

- (CSAudioSessionProviding)audioSessionProvider
{
  return self->_audioSessionProvider;
}

- (void)setAudioStreamProvider:(id)a3
{
}

- (CSAudioStreamProviding)audioStreamProvider
{
  return self->_audioStreamProvider;
}

- (void)setRemoteVADSPGRatio:(int)a3
{
  self->_remoteVADSPGRatio = a3;
}

- (int)remoteVADSPGRatio
{
  return self->_remoteVADSPGRatio;
}

- (void)setSpgEndpointAnalyzer:(id)a3
{
}

- (CSSPGEndpointAnalyzer)spgEndpointAnalyzer
{
  return self->_spgEndpointAnalyzer;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setDelegate:(id)a3
{
}

- (CSOpportuneSpeakListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSOpportuneSpeakListenerDelegate *)WeakRetained;
}

- (void)spgEndpointAnalyzer:(id)a3 hasSilenceScoreEstimate:(double)a4 clientProcessedAudioTimeMS:(float)a5
{
  id v8 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  alignBufferQueue = self->_alignBufferQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000761E8;
  block[3] = &unk_1002515C0;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v28;
  dispatch_sync(alignBufferQueue, block);
  if (*((unsigned char *)v33 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 opportuneSpeakListener:self hasRemoteVADAvailable:*((unsigned __int8 *)v29 + 24)];
    }
  }
  +[CSConfig inputRecordingSampleRate];
  id v14 = [(CSAudioTimeConverter *)self->_audioTimeConverter hostTimeFromSampleCount:(unint64_t)(float)((float)(v13 / 1000.0) * a5)];
  v15 = +[CSFPreferences sharedPreferences];
  unsigned int v16 = [v15 opportuneSpeakListenerBypassEnabled];

  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector();

  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  id v21 = v19;
  uint64_t v22 = (a4 <= 0.150000006) | v16;
  if (v18)
  {
    *(float *)&double v20 = (float)(unint64_t)v14;
    [v19 opportuneSpeakListener:self hasVADAvailable:v22 withHostTime:v20];
  }
  else
  {
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0) {
      goto LABEL_9;
    }
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    [v21 opportuneSpeakListener:self hasVADAvailable:v22];
  }

LABEL_9:
  v24 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = *((unsigned __int8 *)v29 + 24);
    int v26 = *((unsigned __int8 *)v33 + 24);
    *(_DWORD *)buf = 136315906;
    v37 = "-[CSOpportuneSpeakListener spgEndpointAnalyzer:hasSilenceScoreEstimate:clientProcessedAudioTimeMS:]";
    __int16 v38 = 1026;
    int v39 = v25;
    __int16 v40 = 1026;
    int v41 = v26;
    __int16 v42 = 2050;
    double v43 = a4;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s boronScore : %{public}d, reportBoron : %{public}d, slienceScore : %{public}lf", buf, 0x22u);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

- (BOOL)_shouldReportBoron
{
  unint64_t remoteVADAlignCount = self->_remoteVADAlignCount;
  self->_unint64_t remoteVADAlignCount = remoteVADAlignCount + 1;
  return remoteVADAlignCount & ([(CSAudioRecordContext *)self->_latestContext type] != (id)19);
}

- (BOOL)_popRemoteVADSignal
{
  id v3 = [(NSMutableArray *)self->_remoteVADAlignBuffer count];
  if (v3)
  {
    v4 = [(NSMutableArray *)self->_remoteVADAlignBuffer objectAtIndex:0];
    unsigned __int8 v5 = [v4 BOOLValue];

    [(NSMutableArray *)self->_remoteVADAlignBuffer removeObjectAtIndex:0];
    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

- (void)_addRemoteVADSignal:(BOOL)a3
{
  if (self->_remoteVADSPGRatio >= 1)
  {
    BOOL v3 = a3;
    int v5 = 0;
    do
    {
      remoteVADAlignBuffer = self->_remoteVADAlignBuffer;
      v7 = +[NSNumber numberWithBool:v3];
      [(NSMutableArray *)remoteVADAlignBuffer addObject:v7];

      ++v5;
    }
    while (v5 < self->_remoteVADSPGRatio);
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  id v6 = [v5 numSamples];
  audioTimeConverter = self->_audioTimeConverter;
  unint64_t v8 = (unint64_t)v6 + self->_runningSampleCount;
  self->_runningSampleCount = v8;
  -[CSAudioTimeConverter processSampleCount:hostTime:](audioTimeConverter, "processSampleCount:hostTime:", v8, [v5 hostTime]);
  spgEndpointAnalyzer = self->_spgEndpointAnalyzer;
  v10 = objc_msgSend(v5, "dataForChannel:", +[CSConfig channelForProcessedInput](CSConfig, "channelForProcessedInput"));
  -[CSSPGEndpointAnalyzer addAudio:numSamples:](spgEndpointAnalyzer, "addAudio:numSamples:", v10, [v5 numSamples]);

  char v11 = [v5 remoteVAD];

  if (v11)
  {
    id v12 = [v5 remoteVAD];
    float v13 = (unsigned __int8 *)[v12 bytes];

    id v14 = [v5 remoteVAD];
    int v15 = [v14 length];

    if (v15 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        int v17 = v13[v16];
        char v18 = +[CSFPreferences sharedPreferences];
        unsigned __int8 v19 = [v18 opportuneSpeakListenerBypassEnabled];

        if (v17) {
          char v20 = 1;
        }
        else {
          char v20 = v19;
        }
        alignBufferQueue = self->_alignBufferQueue;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100076630;
        v32[3] = &unk_100253AB8;
        v32[4] = self;
        char v33 = v20;
        dispatch_async(alignBufferQueue, v32);
        ++v16;
        uint64_t v22 = [v5 remoteVAD];
        signed int v23 = [v22 length];
      }
      while (v16 < v23);
    }
    if (self->_audioFileWriter)
    {
      +[CSConfig remoteVADDuration];
      float v25 = v24;
      +[CSConfig inputRecordingSampleRate];
      unint64_t v27 = (unint64_t)(float)(v25 * v26);
      LODWORD(v28) = 1176256512;
      v29 = [v5 dataWithRemoteVADWithScaleFactor:v27 numAudioSamplesPerRemoteVAD:v28];
      uint64_t v30 = v29;
      if (v29)
      {
        -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", [v29 bytes], objc_msgSend(v5, "numSamples"));
      }
      else
      {
        char v31 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          char v35 = "-[CSOpportuneSpeakListener audioStreamProvider:audioBufferAvailable:]";
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Audio coming from DoAP should contains RemoteVAD", buf, 0xCu);
        }
      }
    }
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  [(CSSPGEndpointAnalyzer *)self->_spgEndpointAnalyzer stop];
  [(CSOpportuneSpeakListener *)self setAudioStream:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 opportuneSpeakListener:self didStopUnexpectedly:1];
  }
  audioFileWriter = self->_audioFileWriter;
  [(CSPlainAudioFileWriter *)audioFileWriter endAudio];
}

- (void)stopListenWithCompletion:(id)a3
{
}

- (void)stopListenWithStateReset:(BOOL)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000768E4;
  v13[3] = &unk_100253150;
  v13[4] = self;
  id v5 = a4;
  id v14 = v5;
  char v6 = objc_retainBlock(v13);
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[CSOpportuneSpeakListener stopListenWithStateReset:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Request stop CSOpportuneSpeakListener", buf, 0xCu);
  }
  unint64_t v8 = [(CSOpportuneSpeakListener *)self audioStream];

  if (v8)
  {
    v9 = [(CSOpportuneSpeakListener *)self audioStream];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100076A18;
    v11[3] = &unk_100253150;
    v11[4] = self;
    id v12 = v6;
    [v9 stopAudioStreamWithOption:0 completion:v11];
  }
  else
  {
    v10 = +[NSError errorWithDomain:CSErrorDomain code:1003 userInfo:0];
    ((void (*)(void *, void, void *))v6[2])(v6, 0, v10);
  }
}

- (void)_startRequestWithCompletion:(id)a3
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100076E5C;
  v26[3] = &unk_100253100;
  id v4 = a3;
  id v27 = v4;
  id v5 = objc_retainBlock(v26);
  if (self->_audioStreamProvider)
  {
    char v6 = +[CSAudioStreamRequest defaultRequestWithContext:self->_latestContext];
    [v6 setRequiresHistoricalBuffer:1];
    audioStreamProvider = self->_audioStreamProvider;
    unint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v25 = 0;
    v10 = [(CSAudioStreamProviding *)audioStreamProvider audioStreamWithRequest:v6 streamName:v9 error:&v25];
    id v11 = v25;

    if (v10)
    {
      [(CSOpportuneSpeakListener *)self setAudioStream:v10];
      [v10 setDelegate:self];
      [(CSSPGEndpointAnalyzer *)self->_spgEndpointAnalyzer start];
      if ([(CSSPGEndpointAnalyzer *)self->_spgEndpointAnalyzer getFrameDurationMs] >= 1)
      {
        +[CSConfig remoteVADDuration];
        self->_int remoteVADSPGRatio = (int)(float)((float)(v12 * 1000.0)
                                              / (float)[(CSSPGEndpointAnalyzer *)self->_spgEndpointAnalyzer getFrameDurationMs]);
        float v13 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v13;
          +[CSConfig remoteVADDuration];
          int v16 = (int)(float)(v15 * 1000.0);
          unsigned int v17 = [(CSSPGEndpointAnalyzer *)self->_spgEndpointAnalyzer getFrameDurationMs];
          int remoteVADSPGRatio = self->_remoteVADSPGRatio;
          *(_DWORD *)buf = 136315906;
          v29 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
          __int16 v30 = 1026;
          *(_DWORD *)char v31 = v16;
          *(_WORD *)&v31[4] = 1026;
          *(_DWORD *)&v31[6] = v17;
          __int16 v32 = 1026;
          int v33 = remoteVADSPGRatio;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s remoteVADDuration = %{public}d, spgDuration = %{public}d, _int remoteVADSPGRatio = %{public}d", buf, 0x1Eu);
        }
      }
      unsigned __int8 v19 = +[CSAudioStartStreamOption noAlertOption];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100076F7C;
      v23[3] = &unk_100253150;
      v23[4] = self;
      float v24 = v5;
      [v10 startAudioStreamWithOption:v19 completion:v23];
    }
    else
    {
      char v20 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v21 = v20;
        uint64_t v22 = [v11 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
        __int16 v30 = 2114;
        *(void *)char v31 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);
      }
      ((void (*)(void *, void, id))v5[2])(v5, 0, v11);
    }
  }
  else
  {
    id v11 = +[NSError errorWithDomain:CSErrorDomain code:1004 userInfo:0];
    ((void (*)(void *, void, id))v5[2])(v5, 0, v11);
  }
}

- (void)_resetAlignBuffer
{
  self->_unint64_t remoteVADAlignCount = 0;
}

- (void)startListenWithOption:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10007746C;
  v33[3] = &unk_100253100;
  id v7 = a4;
  id v34 = v7;
  unint64_t v8 = objc_retainBlock(v33);
  v9 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    id v11 = [v6 deviceId];
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSOpportuneSpeakListener startListenWithOption:completion:]";
    __int16 v37 = 2114;
    __int16 v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Start Listening request with deviceId : %{public}@", buf, 0x16u);
  }
  float v12 = +[AFPreferences sharedPreferences];
  unsigned int v13 = [v12 opportuneSpeakingFileLoggingIsEnabled];

  if (v13)
  {
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedWithRemoteVADASBD];
    +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedWithRemoteVADASBD];
    id v14 = +[CSAudioFileManager createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:v32 outputFormat:v31];
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v14;
  }
  else
  {
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }

  int v16 = [v6 deviceId];

  if (v16)
  {
    unsigned int v17 = +[CSOpportuneSpeakListenerDeviceManager sharedManager];
    char v18 = [v6 deviceId];
    [v17 setDeviceId:v18];

    unsigned __int8 v19 = [v6 deviceId];
    char v20 = +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:v19];
    latestContext = self->_latestContext;
    self->_latestContext = v20;
  }
  else
  {
    if ([v6 opportuneSpeakListeningType])
    {
      if ([v6 opportuneSpeakListeningType] != (id)1) {
        goto LABEL_14;
      }
      uint64_t v22 = +[CSAudioRecordContext contextForOpportuneSpeakerListenerWithCall];
    }
    else
    {
      uint64_t v22 = +[CSAudioRecordContext contextForOpportuneSpeakerListener];
    }
    unsigned __int8 v19 = self->_latestContext;
    self->_latestContext = v22;
  }

LABEL_14:
  alignBufferQueue = self->_alignBufferQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077484;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(alignBufferQueue, block);
  float v24 = [[CSXPCClient alloc] initWithType:1];
  [(CSXPCClient *)v24 connect];
  id v25 = self->_latestContext;
  id v29 = 0;
  unsigned __int8 v26 = [(CSXPCClient *)v24 prepareAudioProviderWithContext:v25 clientType:2 error:&v29];
  id v27 = v29;
  if (v26)
  {
    objc_storeStrong((id *)&self->_audioStreamProvider, v24);
    objc_storeStrong((id *)&self->_audioSessionProvider, v24);
    if (self->_audioStreamProvider)
    {
      [(CSOpportuneSpeakListener *)self _startRequestWithCompletion:v8];
    }
    else
    {
      double v28 = +[NSError errorWithDomain:CSErrorDomain code:1004 userInfo:0];
      ((void (*)(void *, void, void *))v8[2])(v8, 0, v28);
    }
  }
  else
  {
    ((void (*)(void *, void, id))v8[2])(v8, 0, v27);
  }
}

- (CSOpportuneSpeakListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)CSOpportuneSpeakListener;
  v2 = [(CSOpportuneSpeakListener *)&v13 init];
  if (v2)
  {
    if (!+[CSUtils supportOpportuneSpeakListener])
    {
      id v11 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v3 = dispatch_queue_create("RemoteVAD Align Queue", 0);
    alignBufferQueue = v2->_alignBufferQueue;
    v2->_alignBufferQueue = (OS_dispatch_queue *)v3;

    id v5 = [[CSSPGEndpointAnalyzer alloc] initWithAnalyzeMode];
    spgEndpointAnalyzer = v2->_spgEndpointAnalyzer;
    v2->_spgEndpointAnalyzer = v5;

    [(CSSPGEndpointAnalyzer *)v2->_spgEndpointAnalyzer setDelegate:v2];
    uint64_t v7 = +[NSMutableArray array];
    remoteVADAlignBuffer = v2->_remoteVADAlignBuffer;
    v2->_remoteVADAlignBuffer = (NSMutableArray *)v7;

    v2->_unint64_t remoteVADAlignCount = 0;
    v2->_runningSampleCount = 0;
    v9 = (CSAudioTimeConverter *)objc_alloc_init((Class)CSAudioTimeConverter);
    audioTimeConverter = v2->_audioTimeConverter;
    v2->_audioTimeConverter = v9;
  }
  id v11 = v2;
LABEL_6:

  return v11;
}

@end