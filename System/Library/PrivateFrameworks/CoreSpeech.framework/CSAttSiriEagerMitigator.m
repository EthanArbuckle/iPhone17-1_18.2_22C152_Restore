@interface CSAttSiriEagerMitigator
- (CSAsset)prefetchedAsset;
- (CSAttSiriEagerMitigator)init;
- (NSString)currentRequestId;
- (OS_dispatch_queue)queue;
- (float)triggerDurationThreshold;
- (void)_attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6;
- (void)attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6;
- (void)requestEndedForId:(id)a3;
- (void)requestStartedWithId:(id)a3 forRecordContext:(id)a4;
- (void)setCurrentRequestId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTriggerDurationThreshold:(float)a3;
@end

@implementation CSAttSiriEagerMitigator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setTriggerDurationThreshold:(float)a3
{
  self->_triggerDurationThreshold = a3;
}

- (float)triggerDurationThreshold
{
  return self->_triggerDurationThreshold;
}

- (void)attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6
{
  id v9 = a4;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000149EC;
  v12[3] = &unk_10024E578;
  v12[4] = self;
  id v13 = v9;
  double v14 = a6;
  float v15 = a5;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)requestEndedForId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014BD8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestStartedWithId:(id)a3 forRecordContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014CF8;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014F1C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriEagerMitigator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttSiriEagerMitigator;
  v2 = [(CSAttSiriEagerMitigator *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriEagerMitigator queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001512C;
  block[3] = &unk_10024E5A0;
  block[4] = self;
  id v16 = v11;
  id v17 = v10;
  float v19 = a5;
  double v18 = a6;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, block);
}

@end