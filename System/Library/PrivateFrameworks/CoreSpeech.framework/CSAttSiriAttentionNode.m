@interface CSAttSiriAttentionNode
+ (BOOL)supportAttentionLostAndGain;
- (AWAttentionAwarenessClient)faceClient;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAttentionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriController)attSiriController;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)type;
- (void)addReceiver:(id)a3;
- (void)handleFaceAttentionEvent:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setFaceClient:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CSAttSiriAttentionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_faceClient, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setFaceClient:(id)a3
{
}

- (AWAttentionAwarenessClient)faceClient
{
  return self->_faceClient;
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

- (void)handleFaceAttentionEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013CB48;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013CDCC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013CF7C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013D63C;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
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
  v7[2] = sub_10013D728;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriAttentionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  if (+[CSAttSiriAttentionNode supportAttentionLostAndGain])
  {
    v14.receiver = self;
    v14.super_class = (Class)CSAttSiriAttentionNode;
    v5 = [(CSAttSiriAttentionNode *)&v14 init];
    if (v5)
    {
      dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriAttentionNode queue", 0);
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v6;

      v5->_type = 6;
      uint64_t v8 = +[NSHashTable weakObjectsHashTable];
      receivers = v5->_receivers;
      v5->_receivers = (NSHashTable *)v8;

      v5->_isReady = 0;
      requiredNodes = v5->_requiredNodes;
      v5->_requiredNodes = 0;

      objc_storeWeak((id *)&v5->_attSiriController, v4);
    }
    self = v5;
    v11 = self;
  }
  else
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAttSiriAttentionNode initWithAttSiriController:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Attention is NOT supported on this platform", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportAttentionLostAndGain
{
  return (~(unint64_t)[sub_10013D2C4() supportedEvents] & 0x81) == 0;
}

@end