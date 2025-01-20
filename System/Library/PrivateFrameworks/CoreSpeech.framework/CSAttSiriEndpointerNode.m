@interface CSAttSiriEndpointerNode
- (BOOL)_shouldSendEndpointerSignalByOperationMode;
- (BOOL)getUsesAutomaticEndpointing;
- (BOOL)isNNVAD;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)init;
- (CSAttSiriEndpointerNode)initWithAttSiriController:(id)a3;
- (CSAttSiriEndpointerNodeDelegate)delegate;
- (CSAudioRecordContext)audioRecordContext;
- (CSConnectionListener)endpointerListener;
- (CSEndpointLatencyInfo)endpointLatencyInfo;
- (CSEndpointerProxy)proxy;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (NSString)requestId;
- (OS_dispatch_queue)endpointLatencyQueue;
- (OS_dispatch_queue)queue;
- (double)postVoiceTriggerSilence;
- (id)endpointerModelVersion;
- (unint64_t)endPointAnalyzerType;
- (unint64_t)lastAudioChunkHostTime;
- (unint64_t)type;
- (void)_emitStoppedListeningForSpeechContinuationWithTrpId:(id)a3;
- (void)_reportHardEndpointToXPCClientWithTime:(double)a3 endpointerMetrics:(id)a4;
- (void)_sendEndpointEventDelegateAtTime:(double)a3 eventType:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateAnchorMachAbsTime:(unint64_t)a4 numSamplesProcessedBeforeAnchorTime:(unint64_t)a5 isAnchorTimeBuffered:(BOOL)a6 audioDeliveryHostTimeDelta:(unint64_t)a7;
- (void)attSiriNode:(id)a3 didUpdateFirstAudioPacketTimestamp:(id)a4 firstAudioSampleSensorTimestamp:(unint64_t)a5 firstAudioStartSampleCount:(unint64_t)a6;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8;
- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)getEndPointAnalyzerTypeWithReply:(id)a3;
- (void)getEndpointerModelVersionWithReply:(id)a3;
- (void)getPostVoiceTriggerSilenceWithReply:(id)a3;
- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processASRFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10 fromServer:(BOOL)a11;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)processSpeechPackage:(id)a3 taskName:(id)a4;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)registerEndpointerProxyAt:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6;
- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointLatencyInfo:(id)a3;
- (void)setEndpointLatencyQueue:(id)a3;
- (void)setEndpointerListener:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setIsNNVAD:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastAudioChunkHostTime:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)stop;
- (void)stopEndpointer;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSAttSiriEndpointerNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_endpointLatencyInfo, 0);
  objc_storeStrong((id *)&self->_endpointLatencyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointerListener, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
}

- (void)setLastAudioChunkHostTime:(unint64_t)a3
{
  self->_lastAudioChunkHostTime = a3;
}

- (unint64_t)lastAudioChunkHostTime
{
  return self->_lastAudioChunkHostTime;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setEndpointLatencyInfo:(id)a3
{
}

- (CSEndpointLatencyInfo)endpointLatencyInfo
{
  return self->_endpointLatencyInfo;
}

- (void)setIsNNVAD:(BOOL)a3
{
  self->_isNNVAD = a3;
}

- (BOOL)isNNVAD
{
  return self->_isNNVAD;
}

- (void)setEndpointLatencyQueue:(id)a3
{
}

- (OS_dispatch_queue)endpointLatencyQueue
{
  return self->_endpointLatencyQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setProxy:(id)a3
{
}

- (CSEndpointerProxy)proxy
{
  return self->_proxy;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriEndpointerNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriEndpointerNodeDelegate *)WeakRetained;
}

- (void)setEndpointerListener:(id)a3
{
}

- (CSConnectionListener)endpointerListener
{
  return self->_endpointerListener;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
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

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A854;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_emitStoppedListeningForSpeechContinuationWithTrpId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A9B8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_sendEndpointEventDelegateAtTime:(double)a3 eventType:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  BOOL v9 = [(CSAttSiriEndpointerNode *)self _shouldSendEndpointerSignalByOperationMode];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(CSAttSiriEndpointerNode *)self delegate];
      [v14 attSiriNode:self didDetectEndpointEventAtTime:a4 eventType:v8 withMetrics:v9 useEndpointerSignal:a3];
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = [(CSAttSiriEndpointerNode *)self receivers];
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v19);
        if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v20 attSiriNode:self didDetectEndpointEventAtTime:a4 eventType:v8 withMetrics:v9 useEndpointerSignal:a3];
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)_reportHardEndpointToXPCClientWithTime:(double)a3 endpointerMetrics:(id)a4
{
  id v6 = a4;
  v7 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    BOOL v9 = [(CSAttSiriEndpointerNode *)self endpointerListener];
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAttSiriEndpointerNode _reportHardEndpointToXPCClientWithTime:endpointerMetrics:]";
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s endpointerListener: %@", buf, 0x16u);
  }
  v10 = [v6 metricsCopyWithRequestId:self->_requestId lastAudioChunkHostTime:self->_lastAudioChunkHostTime];
  if (objc_opt_respondsToSelector())
  {
    endpointerListener = self->_endpointerListener;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002B020;
    v23[3] = &unk_100253878;
    double v25 = a3;
    id v24 = v10;
    [(CSConnectionListener *)endpointerListener notifyClientsWithBlock:v23];
  }
  BOOL v12 = [(CSAttSiriEndpointerNode *)self getUsesAutomaticEndpointing];
  char v13 = [(CSAttSiriEndpointerNode *)self delegate];
  [v13 attSiriNode:self didDetectHardEndpointAtTime:v6 withMetrics:v12 usesAutomaticEndPointing:a3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v14 = [(CSAttSiriEndpointerNode *)self receivers];
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) attSiriNode:self didDetectHardEndpointAtTime:v6 withMetrics:v12 usesAutomaticEndPointing:a3];
        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002B0A8;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6
{
  id v9 = a5;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B318;
  v12[3] = &unk_100250C70;
  id v13 = v9;
  v14 = self;
  int64_t v15 = a6;
  double v16 = a4;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v7 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B494;
  block[3] = &unk_1002532A8;
  double v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  endpointLatencyQueue = self->_endpointLatencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B518;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(endpointLatencyQueue, block);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  if (self->_isNNVAD) {
    [(CSEndpointerProxy *)self->_proxy processAudioSamplesAsynchronously:v5];
  }
  endpointLatencyQueue = self->_endpointLatencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B678;
  block[3] = &unk_100253B08;
  id v7 = v5;
  id v13 = v7;
  v14 = self;
  dispatch_async(endpointLatencyQueue, block);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B6FC;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)attSiriNode:(id)a3 didUpdateAnchorMachAbsTime:(unint64_t)a4 numSamplesProcessedBeforeAnchorTime:(unint64_t)a5 isAnchorTimeBuffered:(BOOL)a6 audioDeliveryHostTimeDelta:(unint64_t)a7
{
}

- (void)attSiriNode:(id)a3 didUpdateFirstAudioPacketTimestamp:(id)a4 firstAudioSampleSensorTimestamp:(unint64_t)a5 firstAudioStartSampleCount:(unint64_t)a6
{
  if (!self->_isNNVAD) {
    [(CSEndpointerProxy *)self->_proxy processFirstAudioPacketTimestamp:a4 firstAudioSampleSensorTimestamp:a5];
  }
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  if (!self->_isNNVAD) {
    [(CSEndpointerProxy *)self->_proxy processOSDFeatures:a4 withFrameDurationMs:a6 withMHID:a5];
  }
}

- (void)processSpeechPackage:(id)a3 taskName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CSASRFeatures alloc];
  id v9 = [v7 numOneBestTokensExcludingTriggerPhrase];
  v10 = [v7 endOfSentenceLikelihood];
  [v10 doubleValue];
  double v12 = v11;
  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:v7];
  double v14 = v13;

  int64_t v15 = [(CSASRFeatures *)v8 initWithWordCount:v9 trailingSilenceDuration:50 eosLikelihood:0 pauseCounts:v6 silencePosterior:(uint64_t)(v14 * 1000.0) taskName:v12 processedAudioDurationInMilliseconds:0.0 acousticEndpointerScore:0.0];
  [(CSEndpointerProxy *)self->_proxy processRCFeatures:v15];
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
}

- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11
{
  BOOL v12 = a10;
  id v20 = a8;
  id v21 = a6;
  long long v22 = [[CSASRFeatures alloc] initWithWordCount:a3 trailingSilenceDuration:a4 eosLikelihood:v21 pauseCounts:v20 silencePosterior:a9 taskName:a5 processedAudioDurationInMilliseconds:a7 acousticEndpointerScore:a11];

  [(CSEndpointerProxy *)self->_proxy processASRFeatures:v22 fromServer:v12];
}

- (void)processTaskString:(id)a3
{
}

- (void)processASRFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10 fromServer:(BOOL)a11
{
  BOOL v11 = a11;
  id v20 = a8;
  id v21 = a6;
  long long v22 = [[CSASRFeatures alloc] initWithWordCount:a3 trailingSilenceDuration:a4 eosLikelihood:v21 pauseCounts:v20 silencePosterior:a9 taskName:a5 processedAudioDurationInMilliseconds:a7 acousticEndpointerScore:a10];

  [(CSEndpointerProxy *)self->_proxy processASRFeatures:v22 fromServer:v11];
}

- (void)getEndPointAnalyzerTypeWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  (*((void (**)(id, void, unint64_t))a3 + 2))(v5, 0, [(CSEndpointerProxy *)proxy endPointAnalyzerType]);
}

- (void)getPostVoiceTriggerSilenceWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  [(CSEndpointerProxy *)proxy postVoiceTriggerSilence];
  (*((void (**)(id, void))a3 + 2))(v5, 0);
}

- (void)getEndpointerModelVersionWithReply:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  id v6 = [(CSEndpointerProxy *)proxy endpointerModelVersion];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (unint64_t)endPointAnalyzerType
{
  return [(CSEndpointerProxy *)self->_proxy endPointAnalyzerType];
}

- (double)postVoiceTriggerSilence
{
  [(CSEndpointerProxy *)self->_proxy postVoiceTriggerSilence];
  return result;
}

- (BOOL)_shouldSendEndpointerSignalByOperationMode
{
  unint64_t v2 = [(CSEndpointerProxy *)self->_proxy fetchCurrentEndpointerOperationMode];
  return (v2 < 5) & (0x19u >> v2);
}

- (BOOL)getUsesAutomaticEndpointing
{
  return (char *)[(CSEndpointerProxy *)self->_proxy fetchCurrentEndpointerOperationMode]- 3 < (char *)2;
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
}

- (void)setEndWaitTime:(double)a3
{
}

- (void)setStartWaitTime:(double)a3
{
}

- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4
{
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)updateEndpointerThreshold:(float)a3
{
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
}

- (id)endpointerModelVersion
{
  return [(CSEndpointerProxy *)self->_proxy endpointerModelVersion];
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
}

- (void)recordingStoppedForReason:(int64_t)a3
{
}

- (void)stopEndpointer
{
  [(CSEndpointerProxy *)self->_proxy stopEndpointer];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BCF4;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setActiveChannel:(unint64_t)a3
{
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(CSEndpointerProxy *)self->_proxy resetForNewRequestWithSampleRate:a3 recordContext:v10 recordOption:v11 voiceTriggerInfo:v12];
  self->_isNNVAD = [(CSEndpointerProxy *)self->_proxy endPointAnalyzerType] == 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BEB8;
  block[3] = &unk_100253540;
  void block[4] = self;
  id v14 = v10;
  id v25 = v14;
  id v15 = v11;
  id v26 = v15;
  dispatch_async(queue, block);
  endpointLatencyQueue = self->_endpointLatencyQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002BF20;
  v20[3] = &unk_100252E18;
  v20[4] = self;
  id v21 = v15;
  id v22 = v14;
  id v23 = v12;
  id v17 = v12;
  id v18 = v14;
  id v19 = v15;
  dispatch_async(endpointLatencyQueue, v20);
}

- (void)registerEndpointerProxyAt:(id)a3
{
}

- (void)stop
{
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C16C;
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
  v7[2] = sub_10002C2DC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriEndpointerNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriEndpointerNode *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriEndpointerNode)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSAttSiriEndpointerNode;
  unint64_t v2 = [(CSAttSiriEndpointerNode *)&v17 init];
  if (v2)
  {
    v3 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSAttSiriEndpointerNode init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    uint64_t v4 = +[CSUtils getSerialQueue:@"CSAttSiriEndpointerNode queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v7 = dispatch_queue_create("CSAttSiriEndpointerNode Latency Queue", v6);
    endpointLatencyQueue = v2->_endpointLatencyQueue;
    v2->_endpointLatencyQueue = (OS_dispatch_queue *)v7;

    v2->_type = 1;
    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v9;

    *(_WORD *)&v2->_isReady = 0;
    unsigned int v11 = +[CSUtils supportHybridEndpointer];
    id v12 = (NSArray *)&off_10025E700;
    requiredNodes = v2->_requiredNodes;
    if (v11) {
      id v12 = (NSArray *)&off_10025E6E8;
    }
    v2->_requiredNodes = v12;

    id v14 = objc_alloc_init(CSEndpointerProxy);
    proxy = v2->_proxy;
    v2->_proxy = v14;

    [(CSEndpointerProxy *)v2->_proxy setEndpointerDelegate:v2];
    [(CSEndpointerProxy *)v2->_proxy setEndpointerImplDelegate:v2];
  }
  return v2;
}

@end