@interface _EDMessageItemIDCollector
- (_EDMessageItemIDCollector)init;
- (id)collectItemIDsWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 errorString:(id *)a8;
- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5;
- (void)queryHelperDidFindAllMessages:(id)a3;
- (void)queryHelperNeedsRestart:(id)a3;
@end

@implementation _EDMessageItemIDCollector

- (_EDMessageItemIDCollector)init
{
  v10.receiver = self;
  v10.super_class = (Class)_EDMessageItemIDCollector;
  v2 = [(_EDMessageItemIDCollector *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email._EDMessageItemIDCollector._scheduler" qualityOfService:9];
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFScheduler *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    collectionLock = v2->_collectionLock;
    v2->_collectionLock = (NSConditionLock *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    messageItemIDs = v2->_messageItemIDs;
    v2->_messageItemIDs = v7;
  }
  return v2;
}

- (id)collectItemIDsWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 errorString:(id *)a8
{
  id v26 = a3;
  id v25 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(NSConditionLock *)self->_collectionLock lockWhenCondition:0];
  [(NSConditionLock *)self->_collectionLock unlockWithCondition:1];
  [(NSMutableArray *)self->_messageItemIDs removeAllObjects];
  errorString = self->_errorString;
  self->_errorString = 0;

  BYTE2(v24) = 0;
  LOWORD(v24) = 0;
  v18 = -[EDMessageQueryHelper initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:]([EDMessageQueryHelper alloc], "initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:", v26, 100, 15000, v25, v14, v16, self->_scheduler, v15, self, v24);
  [(EDMessageQueryHelper *)v18 start];
  collectionLock = self->_collectionLock;
  v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
  LODWORD(a7) = [(NSConditionLock *)collectionLock lockWhenCondition:2 beforeDate:v20];

  if (a7)
  {
    v21 = (void *)[(NSMutableArray *)self->_messageItemIDs copy];
    v22 = (__CFString *)[(NSString *)self->_errorString copy];
  }
  else
  {
    v22 = @"Timed out";
    v21 = 0;
    [(NSConditionLock *)self->_collectionLock lock];
  }
  [(NSConditionLock *)self->_collectionLock unlockWithCondition:0];
  if (a8) {
    *a8 = v22;
  }

  return v21;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  messageItemIDs = self->_messageItemIDs;
  objc_msgSend(a4, "ef_compactMapSelector:", sel_itemID);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](messageItemIDs, "addObjectsFromArray:");
}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  [(NSConditionLock *)self->_collectionLock lock];
  BOOL v4 = [(NSConditionLock *)self->_collectionLock condition] == 1;
  collectionLock = self->_collectionLock;

  [(NSConditionLock *)collectionLock unlockWithCondition:2 * v4];
}

- (void)queryHelperNeedsRestart:(id)a3
{
  errorString = self->_errorString;
  self->_errorString = (NSString *)@"Query helper requested restart";

  [(NSMutableArray *)self->_messageItemIDs removeAllObjects];
  [(NSConditionLock *)self->_collectionLock lock];
  BOOL v5 = [(NSConditionLock *)self->_collectionLock condition] == 1;
  collectionLock = self->_collectionLock;

  [(NSConditionLock *)collectionLock unlockWithCondition:2 * v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_collectionLock, 0);
  objc_storeStrong((id *)&self->_messageItemIDs, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end