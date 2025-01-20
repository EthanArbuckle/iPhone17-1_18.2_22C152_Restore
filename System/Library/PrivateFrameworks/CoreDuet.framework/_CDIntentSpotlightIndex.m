@interface _CDIntentSpotlightIndex
- (BOOL)includeAdditions;
- (OS_dispatch_queue)activityQueue;
- (_CDIntentSpotlightIndex)initWithKnowledgeStorage:(id)a3;
- (_CDSpotlightEventIndexer)indexer;
- (_DKKnowledgeStorage)storage;
- (double)delay;
- (id)completion;
- (unint64_t)batchSize;
- (void)dealloc;
- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4;
- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4;
- (void)setActivityQueue:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDelay:(double)a3;
- (void)setIncludeAdditions:(BOOL)a3;
- (void)triggerIndexIncludingAdditions:(BOOL)a3 completion:(id)a4;
@end

@implementation _CDIntentSpotlightIndex

- (_CDIntentSpotlightIndex)initWithKnowledgeStorage:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CDIntentSpotlightIndex;
  v6 = [(_CDIntentSpotlightIndex *)&v15 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.coreduet.intent-spotlight-index.activity-queue", v8);
    activityQueue = v6->_activityQueue;
    v6->_activityQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_storage, a3);
    v11 = [[_CDSpotlightIntentIndexerDataSource alloc] initWithKnowledgeStore:v5];
    v12 = [[_CDSpotlightEventIndexer alloc] initWithDataSource:v11];
    indexer = v6->_indexer;
    v6->_indexer = v12;

    v6->_delay = 2.0;
    v6->_batchSize = 200;
    [(_DKKnowledgeStorage *)v6->_storage addKnowledgeStorageEventNotificationDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  [(_DKKnowledgeStorage *)self->_storage removeKnowledgeStorageEventNotificationDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)_CDIntentSpotlightIndex;
  [(_CDIntentSpotlightIndex *)&v3 dealloc];
}

- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4
{
  id v5 = a4;
  v6 = +[_DKSystemEventStreams appIntentsStream];
  v7 = [v6 name];
  uint64_t v8 = [v5 countForObject:v7];

  if (v8)
  {
    [(_CDIntentSpotlightIndex *)self triggerIndexIncludingAdditions:1 completion:0];
  }
}

- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4
{
  id v5 = a4;
  v6 = +[_DKSystemEventStreams appIntentsStream];
  v7 = [v6 name];
  uint64_t v8 = [v5 countForObject:v7];

  if (v8)
  {
    [(_CDIntentSpotlightIndex *)self triggerIndexIncludingAdditions:0 completion:0];
  }
}

- (void)triggerIndexIncludingAdditions:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(_CDIntentSpotlightIndex *)v7 setIncludeAdditions:[(_CDIntentSpotlightIndex *)v7 includeAdditions] | v4];
  if (v6) {
    [(_CDIntentSpotlightIndex *)v7 setCompletion:v6];
  }
  objc_sync_exit(v7);

  uint64_t v8 = +[_DKThrottledActivity standardInstance];
  [(_CDIntentSpotlightIndex *)v7 delay];
  double v10 = v9;
  v11 = [(_CDIntentSpotlightIndex *)v7 activityQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke;
  v13[3] = &unk_1E560EFF8;
  BOOL v15 = v4;
  v13[4] = v7;
  id v14 = v6;
  id v12 = v6;
  [v8 performWithDelayInSecondsOf:@"com.apple.coreduet.intent-spotlight-index" name:v11 queue:v13 activityBlock:v10];
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (_CDSpotlightEventIndexer)indexer
{
  return self->_indexer;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (BOOL)includeAdditions
{
  return self->_includeAdditions;
}

- (void)setIncludeAdditions:(BOOL)a3
{
  self->_includeAdditions = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end