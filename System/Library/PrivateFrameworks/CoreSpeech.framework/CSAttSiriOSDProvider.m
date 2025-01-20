@interface CSAttSiriOSDProvider
- (BOOL)_ownVADHasSpeechDetectedFromStartSampleCount:(unint64_t)a3 toEndSampleCount:(unint64_t)a4;
- (BOOL)deviceHasBoronEnabled;
- (BOOL)didReceiveFirstbuffer;
- (BOOL)shouldUseBoron;
- (CSAttSiriOSDProvider)init;
- (CSAttSiriOSDProviderDelegate)delegate;
- (OSDAnalyzer)osdAnalyzer;
- (OS_dispatch_queue)osdAnalyzerQueue;
- (OS_dispatch_queue)queue;
- (int64_t)latestBoronActiveSampleCount;
- (signed)currentBoronCount;
- (unint64_t)_getSampleCountByProcessedAudioInMs:(double)a3;
- (unint64_t)firstAudioStartSampleCount;
- (unint64_t)numOfChunksReceived;
- (unint64_t)numSamplesProcessed;
- (unint64_t)streamingCount;
- (void)_processBoron:(id)a3;
- (void)_resetBoron;
- (void)addAudio:(id)a3;
- (void)getSampleCountByProcessedAudioInMs:(double)a3 completion:(id)a4;
- (void)getStartSpeechInfoForProcessedAudio:(double)a3 prependedAudio:(double)a4 speechDetectionSamples:(unint64_t)a5 completion:(id)a6;
- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4;
- (void)setCurrentBoronCount:(signed __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceHasBoronEnabled:(BOOL)a3;
- (void)setDidReceiveFirstbuffer:(BOOL)a3;
- (void)setFirstAudioStartSampleCount:(unint64_t)a3;
- (void)setLatestBoronActiveSampleCount:(int64_t)a3;
- (void)setNumOfChunksReceived:(unint64_t)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setOsdAnalyzerQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldUseBoron:(BOOL)a3;
- (void)setStreamingCount:(unint64_t)a3;
- (void)start:(BOOL)a3 useOwnVoiceVAD:(BOOL)a4 completion:(id)a5;
- (void)stop;
- (void)stopAnalysisAndReset;
@end

@implementation CSAttSiriOSDProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_osdAnalyzerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLatestBoronActiveSampleCount:(int64_t)a3
{
  self->_latestBoronActiveSampleCount = a3;
}

- (int64_t)latestBoronActiveSampleCount
{
  return self->_latestBoronActiveSampleCount;
}

- (void)setCurrentBoronCount:(signed __int16)a3
{
  self->_currentBoronCount = a3;
}

- (signed)currentBoronCount
{
  return self->_currentBoronCount;
}

- (void)setDeviceHasBoronEnabled:(BOOL)a3
{
  self->_deviceHasBoronEnabled = a3;
}

- (BOOL)deviceHasBoronEnabled
{
  return self->_deviceHasBoronEnabled;
}

- (void)setShouldUseBoron:(BOOL)a3
{
  self->_shouldUseBoron = a3;
}

- (BOOL)shouldUseBoron
{
  return self->_shouldUseBoron;
}

- (void)setStreamingCount:(unint64_t)a3
{
  self->_streamingCount = a3;
}

- (unint64_t)streamingCount
{
  return self->_streamingCount;
}

- (void)setDidReceiveFirstbuffer:(BOOL)a3
{
  self->_didReceiveFirstbuffer = a3;
}

- (BOOL)didReceiveFirstbuffer
{
  return self->_didReceiveFirstbuffer;
}

- (void)setFirstAudioStartSampleCount:(unint64_t)a3
{
  self->_firstAudioStartSampleCount = a3;
}

- (unint64_t)firstAudioStartSampleCount
{
  return self->_firstAudioStartSampleCount;
}

- (void)setNumOfChunksReceived:(unint64_t)a3
{
  self->_numOfChunksReceived = a3;
}

- (unint64_t)numOfChunksReceived
{
  return self->_numOfChunksReceived;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzerQueue:(id)a3
{
}

- (OS_dispatch_queue)osdAnalyzerQueue
{
  return self->_osdAnalyzerQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriOSDProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriOSDProviderDelegate *)WeakRetained;
}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100079D88;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_processBoron:(id)a3
{
  id v15 = a3;
  id v4 = [v15 remoteVAD];
  id v5 = [v4 bytes];

  v6 = [v15 remoteVAD];
  int v7 = [v6 length];

  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      signed __int16 currentBoronCount = self->_currentBoronCount;
      if (v5[v8])
      {
        int v10 = (__int16)(currentBoronCount + 1);
        if (v10 >= 5) {
          LOWORD(v10) = 5;
        }
        self->_signed __int16 currentBoronCount = v10;
        int64_t v11 = (int64_t)[v15 startSampleCount];
      }
      else
      {
        signed __int16 v12 = currentBoronCount - 1;
        self->_signed __int16 currentBoronCount = v12;
        if ((v12 & 0x8000) == 0) {
          goto LABEL_9;
        }
        self->_signed __int16 currentBoronCount = 0;
        int64_t v11 = -1;
      }
      self->_latestBoronActiveSampleCount = v11;
LABEL_9:
      ++v8;
      v13 = [v15 remoteVAD];
      signed int v14 = [v13 length];
    }
    while (v8 < v14);
  }
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A044;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_ownVADHasSpeechDetectedFromStartSampleCount:(unint64_t)a3 toEndSampleCount:(unint64_t)a4
{
  return 0;
}

- (unint64_t)_getSampleCountByProcessedAudioInMs:(double)a3
{
  double firstAudioStartSampleCount = (double)self->_firstAudioStartSampleCount;
  double v4 = a3 / 1000.0;
  +[CSConfig inputRecordingSampleRate];
  return (unint64_t)(firstAudioStartSampleCount + v4 * v5);
}

- (void)getStartSpeechInfoForProcessedAudio:(double)a3 prependedAudio:(double)a4 speechDetectionSamples:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A428;
  block[3] = &unk_10024FE08;
  double v15 = a3;
  double v16 = a4;
  unint64_t v17 = a5;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

- (void)getSampleCountByProcessedAudioInMs:(double)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A558;
  block[3] = &unk_100251130;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)stopAnalysisAndReset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A628;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A774;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resetBoron
{
  self->_deviceHasBoronEnabled = 0;
  self->_signed __int16 currentBoronCount = 0;
  self->_latestBoronActiveSampleCount = -1;
}

- (void)start:(BOOL)a3 useOwnVoiceVAD:(BOOL)a4 completion:(id)a5
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007A9F4;
  v14[3] = &unk_100253100;
  id v15 = a5;
  id v7 = v15;
  id v8 = objc_retainBlock(v14);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007AB10;
  v11[3] = &unk_10024FDE0;
  BOOL v13 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (CSAttSiriOSDProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSAttSiriOSDProvider;
  v2 = [(CSAttSiriOSDProvider *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttSiriOSDProvider Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[CSUtils getSerialQueue:@"CSAttSiriOSDProvider OsdAnalyzer Queue" qualityOfService:33];
    osdAnalyzerQueue = v2->_osdAnalyzerQueue;
    v2->_osdAnalyzerQueue = (OS_dispatch_queue *)v5;

    v2->_streamingCount = 0;
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v11 = "-[CSAttSiriOSDProvider init]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }
  return v2;
}

@end