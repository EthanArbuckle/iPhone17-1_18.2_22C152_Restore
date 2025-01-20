@interface CSAttSiriOSDNode
- (BOOL)didAddAudio;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (BOOL)isReady;
- (CSAsset)currentAsset;
- (CSAsset)lipMovementVADAsset;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriOSDNode)init;
- (CSAttSiriOSDNode)initWithAttSiriController:(id)a3;
- (CSPlainAudioFileWriter)audioFileWriter;
- (NSArray)requiredNodes;
- (NSDate)firstAudioPacketTimestamp;
- (NSHashTable)receivers;
- (NSMutableArray)lipMovementSignalDataArray;
- (NSString)configFile;
- (NSString)mhId;
- (OSDAnalyzer)osdAnalyzer;
- (OS_dispatch_queue)apQueue;
- (OS_dispatch_queue)osdQueue;
- (OS_dispatch_queue)queue;
- (double)firstAudioSampleSensorTimestamp;
- (double)frameDurationMs;
- (id)_getSerialQueue:(id)a3 targetQueue:(id)a4;
- (unint64_t)audioStartSampleCount;
- (unint64_t)countOfConsecutiveBoron;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)fetchLastKnownConsecutiveBoronStartSampleCount;
- (unint64_t)firstAudioStartSampleCount;
- (unint64_t)lastKnownConsecutiveBoronStartSampleCount;
- (unint64_t)numOfChunksReceived;
- (unint64_t)numOfConsecutiveBoronActivationThreshold;
- (unint64_t)numSamplesProcessed;
- (unint64_t)osdMode;
- (unint64_t)type;
- (unint64_t)vtEndInSampleCount;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 faceTrackingDataUpdate:(id)a4 atMachAbsTime:(unint64_t)a5;
- (void)checkConsecutiveBoronSignalWithAudioChunk:(id)a3;
- (void)endpointerAssetManagerDidUpdateOSDAsset:(id)a3;
- (void)osdAnalyzer:(id)a3 didDetectEndOfSpeechAt:(double)a4;
- (void)osdAnalyzer:(id)a3 didDetectStartOfSpeechAt:(double)a4;
- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5;
- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5 osdMode:(unint64_t)a6;
- (void)setApQueue:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setCountOfConsecutiveBoron:(unint64_t)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDidAddAudio:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setFirstAudioStartSampleCount:(unint64_t)a3;
- (void)setFrameDurationMs:(double)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastKnownConsecutiveBoronStartSampleCount:(unint64_t)a3;
- (void)setLipMovementSignalDataArray:(id)a3;
- (void)setLipMovementVADAsset:(id)a3;
- (void)setMhId:(id)a3;
- (void)setNumOfChunksReceived:(unint64_t)a3;
- (void)setNumOfConsecutiveBoronActivationThreshold:(unint64_t)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setOsdMode:(unint64_t)a3;
- (void)setOsdQueue:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)stop;
@end

@implementation CSAttSiriOSDNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lipMovementSignalDataArray, 0);
  objc_storeStrong((id *)&self->_lipMovementVADAsset, 0);
  objc_storeStrong((id *)&self->_osdQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_apQueue, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setLipMovementSignalDataArray:(id)a3
{
}

- (NSMutableArray)lipMovementSignalDataArray
{
  return self->_lipMovementSignalDataArray;
}

- (void)setLipMovementVADAsset:(id)a3
{
}

- (CSAsset)lipMovementVADAsset
{
  return self->_lipMovementVADAsset;
}

- (void)setOsdMode:(unint64_t)a3
{
  self->_osdMode = a3;
}

- (unint64_t)osdMode
{
  return self->_osdMode;
}

- (void)setNumOfConsecutiveBoronActivationThreshold:(unint64_t)a3
{
  self->_numOfConsecutiveBoronActivationThreshold = a3;
}

- (unint64_t)numOfConsecutiveBoronActivationThreshold
{
  return self->_numOfConsecutiveBoronActivationThreshold;
}

- (void)setLastKnownConsecutiveBoronStartSampleCount:(unint64_t)a3
{
  self->_lastKnownConsecutiveBoronStartSampleCount = a3;
}

- (unint64_t)lastKnownConsecutiveBoronStartSampleCount
{
  return self->_lastKnownConsecutiveBoronStartSampleCount;
}

- (void)setCountOfConsecutiveBoron:(unint64_t)a3
{
  self->_countOfConsecutiveBoron = a3;
}

- (unint64_t)countOfConsecutiveBoron
{
  return self->_countOfConsecutiveBoron;
}

- (void)setOsdQueue:(id)a3
{
}

- (OS_dispatch_queue)osdQueue
{
  return self->_osdQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setFrameDurationMs:(double)a3
{
  self->_frameDurationMs = a3;
}

- (double)frameDurationMs
{
  return self->_frameDurationMs;
}

- (void)setDidTimestampFirstAudioPacket:(BOOL)a3
{
  self->_didTimestampFirstAudioPacket = a3;
}

- (BOOL)didTimestampFirstAudioPacket
{
  return self->_didTimestampFirstAudioPacket;
}

- (void)setFirstAudioStartSampleCount:(unint64_t)a3
{
  self->_firstAudioStartSampleCount = a3;
}

- (unint64_t)firstAudioStartSampleCount
{
  return self->_firstAudioStartSampleCount;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioPacketTimestamp:(id)a3
{
}

- (NSDate)firstAudioPacketTimestamp
{
  return self->_firstAudioPacketTimestamp;
}

- (void)setConfigFile:(id)a3
{
  self->_configFile = (NSString *)a3;
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setDidAddAudio:(BOOL)a3
{
  self->_didAddAudio = a3;
}

- (BOOL)didAddAudio
{
  return self->_didAddAudio;
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

- (void)setApQueue:(id)a3
{
}

- (OS_dispatch_queue)apQueue
{
  return self->_apQueue;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C14E8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)hadSignalsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (void)attSiriNode:(id)a3 faceTrackingDataUpdate:(id)a4 atMachAbsTime:(unint64_t)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C15A4;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)osdAnalyzer:(id)a3 didDetectEndOfSpeechAt:(double)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C1678;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)osdAnalyzer:(id)a3 didDetectStartOfSpeechAt:(double)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C1818;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CSFPreferences sharedPreferences];
  unsigned int v9 = [v8 isEndpointEnhancedLoggingEnabled];

  if (v9)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSAttSiriOSDNode osdAnalyzer:didUpdateOSDFeatures:]";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
    }
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C1AB8;
  v13[3] = &unk_100253B08;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async(queue, v13);
}

- (void)endpointerAssetManagerDidUpdateOSDAsset:(id)a3
{
  id v4 = a3;
  apQueue = self->_apQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C1C80;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(apQueue, v7);
}

- (unint64_t)fetchLastKnownConsecutiveBoronStartSampleCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  apQueue = self->_apQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C1D34;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(apQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)audioStartSampleCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C1DF4;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5 osdMode:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  apQueue = self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1F58;
  block[3] = &unk_1002532A8;
  v24 = self;
  unint64_t v25 = a6;
  id v23 = v11;
  id v14 = v11;
  dispatch_async(apQueue, block);
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C23E0;
  v18[3] = &unk_100253540;
  id v19 = v10;
  id v20 = v12;
  v21 = self;
  id v16 = v12;
  id v17 = v10;
  dispatch_async_and_wait(queue, v18);
}

- (void)resetForNewRequestWithRecordContext:(id)a3 endpointerSettings:(id)a4 voiceTriggerInfo:(id)a5
{
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  apQueue = self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2590;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)checkConsecutiveBoronSignalWithAudioChunk:(id)a3
{
  id v4 = a3;
  id v5 = [v4 remoteVAD];
  uint64_t v6 = [v5 bytes];

  id v7 = [v4 remoteVAD];
  int v8 = [v7 length];

  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    *(void *)&long long v9 = 136315394;
    long long v18 = v9;
    do
    {
      if (v6[v10]) {
        id v11 = (char *)[(CSAttSiriOSDNode *)self countOfConsecutiveBoron] + 1;
      }
      else {
        id v11 = 0;
      }
      -[CSAttSiriOSDNode setCountOfConsecutiveBoron:](self, "setCountOfConsecutiveBoron:", v11, v18);
      unint64_t v12 = [(CSAttSiriOSDNode *)self countOfConsecutiveBoron];
      if (v12 >= [(CSAttSiriOSDNode *)self numOfConsecutiveBoronActivationThreshold])
      {
        -[CSAttSiriOSDNode setLastKnownConsecutiveBoronStartSampleCount:](self, "setLastKnownConsecutiveBoronStartSampleCount:", [v4 startSampleCount]);
        v13 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          id v14 = v13;
          unint64_t v15 = [(CSAttSiriOSDNode *)self lastKnownConsecutiveBoronStartSampleCount];
          *(_DWORD *)buf = v18;
          id v20 = "-[CSAttSiriOSDNode checkConsecutiveBoronSignalWithAudioChunk:]";
          __int16 v21 = 2048;
          unint64_t v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s update lastKnownConsecutiveBoronStartSampleCount to: %llu", buf, 0x16u);
        }
      }
      ++v10;
      id v16 = [v4 remoteVAD];
      signed int v17 = [v16 length];
    }
    while (v10 < v17);
  }
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C29E0;
  block[3] = &unk_1002523B8;
  id v19 = v20;
  void block[4] = self;
  id v9 = v7;
  id v18 = v9;
  dispatch_async_and_wait(queue, block);
  apQueue = self->_apQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C2B80;
  v13[3] = &unk_100250A58;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  id v16 = v20;
  id v11 = v6;
  id v12 = v9;
  dispatch_async(apQueue, v13);

  _Block_object_dispose(v20, 8);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C3280;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  apQueue = self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C33BC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C3514;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C3684;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_getSerialQueue:(id)a3 targetQueue:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = +[CSUtils getSerialQueueWithQOS:33 name:a3 fixedPriority:kCSDefaultSerialQueueFixedPriority];
  }
  id v7 = (void *)v6;

  return v7;
}

- (CSAttSiriOSDNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriOSDNode *)self init];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriOSDNode)init
{
  if (+[CSUtils supportHybridEndpointer])
  {
    v35.receiver = self;
    v35.super_class = (Class)CSAttSiriOSDNode;
    unint64_t v3 = [(CSAttSiriOSDNode *)&v35 init];
    id v4 = v3;
    if (v3)
    {
      v3->_type = 0;
      unsigned int v5 = +[CSUtils isContinuousConversationSupported];
      uint64_t v6 = (NSArray *)&off_10025E7A8;
      requiredNodes = v4->_requiredNodes;
      if (v5) {
        uint64_t v6 = (NSArray *)&off_10025E790;
      }
      v4->_requiredNodes = v6;

      uint64_t v8 = +[NSHashTable weakObjectsHashTable];
      receivers = v4->_receivers;
      v4->_receivers = (NSHashTable *)v8;

      v4->_isReady = 0;
      uint64_t v10 = 0;
      if ((+[CSUtils supportsDispatchWorkloop] & 1) == 0)
      {
        uint64_t v10 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSerialQueueFixedPriority];
      }
      id v11 = [(id)objc_opt_class() description];
      id v12 = [v11 lowercaseString];
      v13 = +[NSString stringWithFormat:@"com.apple.cs.%@.queue", v12];

      uint64_t v14 = [(CSAttSiriOSDNode *)v4 _getSerialQueue:v13 targetQueue:v10];
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v14;

      id v16 = [(id)objc_opt_class() description];
      signed int v17 = [v16 lowercaseString];
      id v18 = +[NSString stringWithFormat:@"com.apple.cs.%@.osdQueue", v17];

      uint64_t v19 = [(CSAttSiriOSDNode *)v4 _getSerialQueue:v18 targetQueue:v10];
      osdQueue = v4->_osdQueue;
      v4->_osdQueue = (OS_dispatch_queue *)v19;

      __int16 v21 = [(id)objc_opt_class() description];
      unint64_t v22 = [v21 lowercaseString];
      id v23 = +[NSString stringWithFormat:@"com.apple.cs.%@.apQueue", v22];

      uint64_t v24 = [(CSAttSiriOSDNode *)v4 _getSerialQueue:v23 targetQueue:v10];
      apQueue = v4->_apQueue;
      v4->_apQueue = (OS_dispatch_queue *)v24;

      +[CSConfig inputRecordingSampleRate];
      v4->_currentRequestSampleRate = (unint64_t)v26;
      v4->_vtEndInSampleCount = 0;
      v4->_numOfConsecutiveBoronActivationThreshold = 5;
      v27 = v4->_apQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C3BD8;
      block[3] = &unk_100253AE0;
      v28 = v4;
      v34 = v28;
      dispatch_async(v27, block);
      uint64_t v29 = +[NSMutableArray array];
      lipMovementSignalDataArray = v28->_lipMovementSignalDataArray;
      v28->_lipMovementSignalDataArray = (NSMutableArray *)v29;
    }
    self = v4;
    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

@end