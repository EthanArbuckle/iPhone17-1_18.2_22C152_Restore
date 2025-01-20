@interface CSAttSiriAttendingAudioSrcNode
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAttendingAudioSrcNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAttendingAudioSrcNode)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5;
- (CSAttSiriAttendingAudioSrcNode)initWithSpeechManager:(id)a3 audioStreamProvider:(id)a4 streamName:(id)a5 streamRequest:(id)a6;
- (CSAttSiriController)attSiriController;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSSpeechManager)speechManager;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)type;
- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleDidStop;
- (void)_handleDidStopStreamUnexpectedly;
- (void)addReceiver:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)cancelAudioStreamHold;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4;
- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4;
@end

@implementation CSAttSiriAttendingAudioSrcNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
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

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_receivers;
  id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "attSiriAudioSrcNodeDidStartRecording:successfully:error:", self, v4, v6, (void)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_handleDidStopStreamUnexpectedly
{
  v3 = [(CSAttSiriAttendingAudioSrcNode *)self delegate];
  [v3 attSiriAttendingAudioSrcNodeDidStopUnexpectedly:self];

  [(CSAttSiriAttendingAudioSrcNode *)self _handleDidStop];
}

- (void)_handleDidStop
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAttSiriAttendingAudioSrcNode _handleDidStop]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = self->_receivers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "attSiriAudioSrcNodeDidStop:", self, (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v4 = a4;
  id v5 = +[CSAudioPowerProvider sharedInstance];
  [v5 processAudioChunkForTV:v4];
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023164;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023300;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAttSiriAttendingAudioSrcNode dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CSAttSiriAttendingAudioSrcNode deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAttSiriAttendingAudioSrcNode;
  [(CSAttSiriAttendingAudioSrcNode *)&v4 dealloc];
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023528;
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
  v7[2] = sub_1000235DC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancelAudioStreamHold
{
  v3 = [(CSAttSiriAttendingAudioSrcNode *)self streamProvider];
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v6 = +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:a3];
  id v4 = [(CSAttSiriAttendingAudioSrcNode *)self streamProvider];
  id v5 = [v4 holdAudioStreamWithDescription:@"CSAttSiriAttendingAudioSrcNode" option:v6];
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000238A0;
  v7[3] = &unk_100253150;
  id v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)CSAttSiriAttendingAudioSrcNode;
  id v5 = v9;
  [(CSAttSiriAttendingAudioSrcNode *)&v6 stopAudioStreamWithOption:a3 completion:v7];
}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023A84;
  v7[3] = &unk_100253150;
  id v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)CSAttSiriAttendingAudioSrcNode;
  id v5 = v9;
  [(CSAttSiriAttendingAudioSrcNode *)&v6 startAudioStreamWithOption:a3 completion:v7];
}

- (CSAttSiriAttendingAudioSrcNode)initWithSpeechManager:(id)a3 audioStreamProvider:(id)a4 streamName:(id)a5 streamRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)CSAttSiriAttendingAudioSrcNode;
  long long v13 = [(CSAttSiriAttendingAudioSrcNode *)&v31 init];
  if (v13)
  {
    long long v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create("CSAttSiriAttendingAudioSrcNode Attending queue", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v14->_type = 5;
    uint64_t v17 = +[NSHashTable weakObjectsHashTable];
    receivers = v14->_receivers;
    v14->_receivers = (NSHashTable *)v17;

    v14->_isReady = 0;
    requiredNodes = v14->_requiredNodes;
    v14->_requiredNodes = 0;

    p_speechManager = (void **)&v14->_speechManager;
    objc_storeStrong((id *)&v14->_speechManager, a3);
    if (!v14->_speechManager)
    {
      uint64_t v21 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
      v22 = *p_speechManager;
      *p_speechManager = (void *)v21;
    }
    id v23 = v11;
    if (v23) {
      goto LABEL_8;
    }
    v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSAttSiriAttendingAudioSrcNode initWithSpeechManager:audioStreamProvider:streamName:streamRequest:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s audioStreamProvider is nil, fetch audioProvider from context", buf, 0xCu);
    }
    v25 = *p_speechManager;
    v26 = [v12 recordContext];
    id v23 = [v25 audioProviderWithContext:v26 error:0];

    if (v23)
    {
LABEL_8:
      v30.receiver = v14;
      v30.super_class = (Class)CSAttSiriAttendingAudioSrcNode;
      long long v14 = [(CSAttSiriAttendingAudioSrcNode *)&v30 initWithAudioStreamProvider:v23 streamName:@"CSAttSiriAttendingAudioSrcNode" streamRequest:v12];

      v27 = v14;
    }
    else
    {
      v29 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSAttSiriAttendingAudioSrcNode initWithSpeechManager:audioStreamProvider:streamName:streamRequest:]";
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s attSiriAudioStreamProvider is nil!", buf, 0xCu);
      }
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (CSAttSiriAttendingAudioSrcNode)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5
{
  return [(CSAttSiriAttendingAudioSrcNode *)self initWithSpeechManager:0 audioStreamProvider:a3 streamName:a4 streamRequest:a5];
}

- (CSAttSiriAttendingAudioSrcNode)initWithAttSiriController:(id)a3
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriAttendingAudioSrcNode initWithAttSiriController:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

@end