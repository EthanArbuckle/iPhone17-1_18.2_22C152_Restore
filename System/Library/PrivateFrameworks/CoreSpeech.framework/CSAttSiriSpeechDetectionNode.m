@interface CSAttSiriSpeechDetectionNode
- (BOOL)canActivate;
- (BOOL)didActivate;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriSpeechDetectionNode)init;
- (CSAttSiriSpeechDetectionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSpeechDetectionNodeDelegate)delegate;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (double)firstSpeechFrameAudioTsInMs;
- (unint64_t)startDetectionTime;
- (unint64_t)type;
- (void)_startActivation;
- (void)addReceiver:(id)a3;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)registerOSDNode:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setCanActivate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setFirstSpeechFrameAudioTsInMs:(double)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartDetectionTime:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation CSAttSiriSpeechDetectionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_destroyWeak((id *)&self->_osdNode);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setFirstSpeechFrameAudioTsInMs:(double)a3
{
  self->_firstSpeechFrameAudioTsInMs = a3;
}

- (double)firstSpeechFrameAudioTsInMs
{
  return self->_firstSpeechFrameAudioTsInMs;
}

- (void)setCanActivate:(BOOL)a3
{
  self->_canActivate = a3;
}

- (BOOL)canActivate
{
  return self->_canActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (CSAttSiriOSDNode)osdNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_osdNode);
  return (CSAttSiriOSDNode *)WeakRetained;
}

- (void)setStartDetectionTime:(unint64_t)a3
{
  self->_startDetectionTime = a3;
}

- (unint64_t)startDetectionTime
{
  return self->_startDetectionTime;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriSpeechDetectionNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriSpeechDetectionNodeDelegate *)WeakRetained;
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

- (void)_startActivation
{
  if (!self->_didActivate)
  {
    self->_didActivate = 1;
    if ((self->_firstSpeechFrameAudioTsInMs + -700.0) / 1000.0 >= 0.0) {
      double v3 = (self->_firstSpeechFrameAudioTsInMs + -700.0) / 1000.0;
    }
    else {
      double v3 = 0.0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_osdNode);
    double v5 = (double)(unint64_t)[WeakRetained audioStartSampleCount];
    +[CSConfig inputRecordingSampleRate];
    unint64_t v7 = (unint64_t)(v5 + v3 * v6);

    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[CSAttSiriSpeechDetectionNode _startActivation]";
      __int16 v17 = 2048;
      unint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s startPtAbsSampleId: %llu", (uint8_t *)&v15, 0x16u);
    }
    [(CSAttSiriSpeechDetectionNode *)self startDetectionTime];
    uint64_t v9 = CSMachAbsoluteTimeAddTimeInterval();
    v10 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      unint64_t v12 = [(CSAttSiriSpeechDetectionNode *)self startDetectionTime];
      int v15 = 136315650;
      v16 = "-[CSAttSiriSpeechDetectionNode _startActivation]";
      __int16 v17 = 2048;
      unint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s audio started at %llu, speech started at: %llu", (uint8_t *)&v15, 0x20u);
    }
    v13 = objc_alloc_init(CSAttSiriAttendingTriggerEventInfo);
    [(CSAttSiriAttendingTriggerEventInfo *)v13 setTriggerMachTime:v9];
    [(CSAttSiriAttendingTriggerEventInfo *)v13 setTriggerAbsStartSampleId:v7];
    v14 = [(CSAttSiriSpeechDetectionNode *)self delegate];
    [v14 attSiriNode:self didDetectSpeechWithTriggerInfo:v13];
  }
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  id v7 = a4;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038974;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038BA0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038C24;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerOSDNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038CE0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_receivers containsObject:v4])
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSAttSiriSpeechDetectionNodeDelegate])
    {
      [(NSHashTable *)self->_receivers addObject:v4];
    }
    else
    {
      double v5 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "-[CSAttSiriSpeechDetectionNode addReceiver:]";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Unsupported receiver: %@", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (CSAttSiriSpeechDetectionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  double v5 = [(CSAttSiriSpeechDetectionNode *)self init];
  int v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriSpeechDetectionNode)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSAttSiriSpeechDetectionNode;
  v2 = [(CSAttSiriSpeechDetectionNode *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriSpeechDetectionNode queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_type = 13;
    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v5;

    v2->_isReady = 0;
    requiredNodes = v2->_requiredNodes;
    v2->_requiredNodes = (NSArray *)&off_10025E730;
  }
  return v2;
}

@end