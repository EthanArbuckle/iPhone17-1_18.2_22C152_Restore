@interface CSAttSiriAudioSrcNode
- (BOOL)isBuiltInRoute;
- (BOOL)isJarvisRoute;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAudioSrcNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAudioSrcNode)initWithTargetQueue:(id)a3;
- (CSAttSiriAudioSrcNodeDelegate)delegate;
- (CSAttSiriController)attSiriController;
- (CSAudioTandemStream)tandemStream;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSMutableDictionary)decodersForTV;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (id)_fetchAudioDecoderForTV:(unsigned int)a3;
- (unint64_t)decoderProcessedSampleCountForTV;
- (unint64_t)type;
- (void)_handleDidAudioStartWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleDidStop;
- (void)addReceiver:(id)a3;
- (void)attachToMasterStream:(id)a3 name:(id)a4 completion:(id)a5;
- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)fetchRoutesWithCompletion:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3;
- (void)setDecodersForTV:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setTandemStream:(id)a3;
@end

@implementation CSAttSiriAudioSrcNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tandemStream, 0);
  objc_storeStrong((id *)&self->_decodersForTV, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setTandemStream:(id)a3
{
}

- (CSAudioTandemStream)tandemStream
{
  return self->_tandemStream;
}

- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3
{
  self->_decoderProcessedSampleCountForTV = a3;
}

- (unint64_t)decoderProcessedSampleCountForTV
{
  return self->_decoderProcessedSampleCountForTV;
}

- (void)setDecodersForTV:(id)a3
{
}

- (NSMutableDictionary)decodersForTV
{
  return self->_decodersForTV;
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

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriAudioSrcNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriAudioSrcNodeDelegate *)WeakRetained;
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

- (id)_fetchAudioDecoderForTV:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  decodersForTV = self->_decodersForTV;
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v7 = [(NSMutableDictionary *)decodersForTV objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = self->_decodersForTV;
    v9 = +[NSNumber numberWithUnsignedInt:v3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
LABEL_10:

    goto LABEL_11;
  }
  if (v3 == 1869641075)
  {
    id v11 = objc_alloc((Class)CSAudioDecoder);
    +[CSFAudioStreamBasicDescriptionFactory opusASBD];
    +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
    v12 = &v19;
    v13 = &v18;
    goto LABEL_7;
  }
  if (v3 == 1936745848)
  {
    id v11 = objc_alloc((Class)CSAudioDecoder);
    +[CSFAudioStreamBasicDescriptionFactory speexASBD];
    +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
    v12 = &v21;
    v13 = (uint64_t *)&v20;
LABEL_7:
    id v10 = [v11 initWithInASBD:v12 outASBD:v13];
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSAttSiriAudioSrcNode _fetchAudioDecoderForTV:]";
      __int16 v24 = 1026;
      int v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Create audioDecoder for audioFormat %{public}u", buf, 0x12u);
    }
    [v10 setDelegate:self];
    v15 = self->_decodersForTV;
    v9 = +[NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v15 setObject:v10 forKey:v9];
    goto LABEL_10;
  }
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSAttSiriAudioSrcNode _fetchAudioDecoderForTV:]";
    __int16 v24 = 1026;
    int v25 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unexpected audioFormat for ATV : %{public}u", buf, 0x12u);
  }
  id v10 = 0;
LABEL_11:
  return v10;
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
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "attSiriAudioSrcNodeDidStartRecording:successfully:error:", self, v4, v6, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_handleDidStop
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[CSAttSiriAudioSrcNode _handleDidStop]";
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

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  id v12 = a5;
  long long v13 = +[CSAudioTimeConverterPool sharedInstance];
  long long v14 = [v13 defaultConverter];
  [v14 processSampleCount:self->_decoderProcessedSampleCountForTV hostTime:a7];

  unint64_t v15 = ((unint64_t)[v12 length] >> 1) / a10;
  id v16 = objc_alloc((Class)CSAudioChunk);
  uint64_t v17 = +[CSConfig inputRecordingSampleByteDepth];
  unint64_t decoderProcessedSampleCountForTV = self->_decoderProcessedSampleCountForTV;
  LOBYTE(v26) = +[CSConfig inputRecordingIsFloat];
  LOBYTE(v25) = a9;
  id v19 = [v16 initWithData:v12 numChannels:a10 numSamples:v15 sampleByteDepth:v17 startSampleCount:decoderProcessedSampleCountForTV hostTime:a7 arrivalHostTimeToAudioRecorder:a8 wasBuffered:v25 remoteVAD:0 isFloat:v26];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  char v20 = self->_receivers;
  id v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      __int16 v24 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)v24) attSiriAudioSrcNodeLPCMRecordBufferAvailable:self audioChunk:v19];
        __int16 v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSHashTable *)v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v22);
  }

  self->_decoderProcessedSampleCountForTV += v15;
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CD30C;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CD490;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CD61C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)dealloc
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAttSiriAudioSrcNode dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CSAttSiriAudioSrcNode deallocated", buf, 0xCu);
  }
  if (CSIsTV()) {
    [(NSMutableDictionary *)self->_decodersForTV removeAllObjects];
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAttSiriAudioSrcNode;
  [(CSAttSiriAudioSrcNode *)&v4 dealloc];
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CD888;
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
  v7[2] = sub_1000CD92C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CDAE8;
  v7[3] = &unk_1002535D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isJarvisRoute
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000CDCA8;
  long long v10 = sub_1000CDCB8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CDCC0;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unsigned __int8 v3 = +[CSUtils isJarvisAudioRouteWithRecordRoute:v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isBuiltInRoute
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unint64_t v15 = sub_1000CDCA8;
  id v16 = sub_1000CDCB8;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000CDCA8;
  long long v10 = sub_1000CDCB8;
  id v11 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CDE9C;
  block[3] = &unk_1002515C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v6;
  dispatch_sync(queue, block);
  unsigned __int8 v3 = +[CSUtils isBuiltInRouteWithRecordRoute:v13[5] playbackRoute:v7[5]];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v3;
}

- (void)attachToMasterStream:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000CE230;
  v22[3] = &unk_100253100;
  id v10 = a5;
  id v23 = v10;
  id v11 = objc_retainBlock(v22);
  if (v8)
  {
    id v12 = [objc_alloc((Class)CSAudioTandemStream) initWithMasterAudioStream:v8 name:v9];
    if (v12)
    {
      long long v13 = v12;
      uint64_t v14 = [(CSAttSiriAudioSrcNode *)self queue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000CE248;
      v19[3] = &unk_100253280;
      v19[4] = self;
      id v15 = v13;
      id v20 = v15;
      id v21 = v11;
      dispatch_async(v14, v19);
    }
    else
    {
      id v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Fail to create tandemStream", buf, 0xCu);
      }
      uint64_t v18 = +[NSError errorWithDomain:CSErrorDomain code:960 userInfo:0];
      ((void (*)(void *, void, void *))v11[2])(v11, 0, v18);

      id v15 = 0;
    }
  }
  else
  {
    id v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[CSAttSiriAudioSrcNode attachToMasterStream:name:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Unable to create tendemStream due to missing master stream", buf, 0xCu);
    }
    id v15 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    ((void (*)(void *, void, id))v11[2])(v11, 0, v15);
  }
}

- (CSAttSiriAudioSrcNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriAudioSrcNode *)self initWithTargetQueue:0];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriAudioSrcNode)initWithTargetQueue:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAttSiriAudioSrcNode;
  id v5 = [(CSAttSiriAudioSrcNode *)&v14 init];
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("CSAttSiriAudioSrcNode Queue", 0, v4);
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriAudioSrcNode queue", 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v5->_type = 4;
    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    receivers = v5->_receivers;
    v5->_receivers = (NSHashTable *)v8;

    v5->_isReady = 0;
    requiredNodes = v5->_requiredNodes;
    v5->_requiredNodes = 0;

    if (CSIsTV())
    {
      v5->_unint64_t decoderProcessedSampleCountForTV = 0;
      uint64_t v11 = +[NSMutableDictionary dictionary];
      decodersForTV = v5->_decodersForTV;
      v5->_decodersForTV = (NSMutableDictionary *)v11;
    }
  }

  return v5;
}

@end