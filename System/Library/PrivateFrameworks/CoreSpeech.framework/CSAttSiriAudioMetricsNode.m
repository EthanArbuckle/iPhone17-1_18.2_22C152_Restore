@interface CSAttSiriAudioMetricsNode
- (AudioStreamBasicDescription)_defaultASBD;
- (BOOL)isReady;
- (CSAdamSpeechMetricsManager)adamMetricsManager;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAudioMetricsNode)init;
- (CSAttSiriAudioMetricsNode)initWithAttSiriController:(id)a3;
- (CSAttSiriController)attSiriController;
- (CSAudioCircularBuffer)audioBuffer;
- (CSOSTransaction)transaction;
- (NSArray)requiredNodes;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)lastForwardedSampleCount;
- (unint64_t)type;
- (unsigned)numFramesPerBuffer;
- (void)_handleDidStop;
- (void)_setupAdamMetricsManagerIfNeeded;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)setAdamMetricsManager:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastForwardedSampleCount:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setNumFramesPerBuffer:(unsigned int)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation CSAttSiriAudioMetricsNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_adamMetricsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setTransaction:(id)a3
{
}

- (CSOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setAudioBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setNumFramesPerBuffer:(unsigned int)a3
{
  self->_numFramesPerBuffer = a3;
}

- (unsigned)numFramesPerBuffer
{
  return self->_numFramesPerBuffer;
}

- (void)setAdamMetricsManager:(id)a3
{
}

- (CSAdamSpeechMetricsManager)adamMetricsManager
{
  return self->_adamMetricsManager;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (AudioStreamBasicDescription)_defaultASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  if (+[CSConfig inputRecordingIsFloat]) {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmFloatASBD];
  }
  else {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  }
  long long v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (void)_handleDidStop
{
  adamMetricsManager = self->_adamMetricsManager;
  if (adamMetricsManager)
  {
    [(CSAdamSpeechMetricsManager *)adamMetricsManager stopAndDispose];
    v4 = self->_adamMetricsManager;
    self->_adamMetricsManager = 0;
  }
  audioBuffer = self->_audioBuffer;
  if (audioBuffer)
  {
    self->_audioBuffer = 0;
  }
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;
  }
}

- (void)_setupAdamMetricsManagerIfNeeded
{
  if (!self->_adamMetricsManager)
  {
    v3 = (CSAdamSpeechMetricsManager *)objc_alloc_init((Class)CSAdamSpeechMetricsManager);
    adamMetricsManager = self->_adamMetricsManager;
    self->_adamMetricsManager = v3;

    long long v5 = self->_adamMetricsManager;
    if (v5)
    {
      [(CSAdamSpeechMetricsManager *)v5 updateWithNewReporterID];
      long long v6 = self->_adamMetricsManager;
      [(CSAttSiriAudioMetricsNode *)self _defaultASBD];
      [(CSAdamSpeechMetricsManager *)v6 setAudioIssueDetectorFormat:v19 numFrames:self->_numFramesPerBuffer];
      id v7 = objc_alloc((Class)CSAudioCircularBuffer);
      +[CSConfig inputRecordingDurationInSecs];
      int v9 = v8;
      +[CSConfig inputRecordingSampleRate];
      LODWORD(v11) = v10;
      LODWORD(v12) = v9;
      v13 = (CSAudioCircularBuffer *)[v7 initWithNumChannels:1 recordingDuration:v12 samplingRate:v11];
      audioBuffer = self->_audioBuffer;
      self->_audioBuffer = v13;

      v15 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"AttSiri Audio Metrics"];
      transaction = self->_transaction;
      self->_transaction = v15;

      v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[CSAttSiriAudioMetricsNode _setupAdamMetricsManagerIfNeeded]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Done", buf, 0xCu);
      }
    }
    else
    {
      v18 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[CSAttSiriAudioMetricsNode _setupAdamMetricsManagerIfNeeded]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s fail to init CSAdamSpeechMetricsManager", buf, 0xCu);
      }
    }
  }
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100074EEC;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007512C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000751A8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttSiriAudioMetricsNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriAudioMetricsNode *)self init];
  long long v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriAudioMetricsNode)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriAudioMetricsNode;
  v2 = [(CSAttSiriAudioMetricsNode *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v4 = dispatch_queue_create("CSAttSiriAudioMetricsNode Queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    +[CSConfig inputRecordingBufferDuration];
    double v7 = v6;
    +[CSConfig inputRecordingSampleRate];
    v2->_numFramesPerBuffer = (v7 * v8);
    v2->_lastForwardedSampleCount = 0;
  }
  return v2;
}

@end