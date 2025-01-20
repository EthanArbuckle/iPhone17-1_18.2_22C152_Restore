@interface IndexService
+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3;
+ (id)sharedInstance;
- (BOOL)isSpotlightIndexingEnabled;
- (CNCancelable)coalescingToken;
- (CNIndexRequestHandler)mockIndexHandler;
- (CNInhibitor)coalescingInhibitor;
- (CNPublishingSubject)coalescer;
- (CNScheduler)workQueue;
- (IndexService)init;
- (IndexService)initWithMockIndexRequestHandler:(id)a3 schedulerProvider:(id)a4;
- (id)indexHandler;
- (id)interestedNotifications;
- (id)verifyIndexLoggingSummary:(BOOL)a3 error:(id *)a4;
- (void)handleCoalescedEvent:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setCoalescer:(id)a3;
- (void)setCoalescingInhibitor:(id)a3;
- (void)setCoalescingToken:(id)a3;
@end

@implementation IndexService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000122D8;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CB28 != -1) {
    dispatch_once(&qword_10002CB28, block);
  }
  v2 = (void *)qword_10002CB30;

  return v2;
}

- (IndexService)init
{
  v3 = +[CNSchedulerProvider defaultProvider];
  v4 = [(IndexService *)self initWithMockIndexRequestHandler:0 schedulerProvider:v3];

  return v4;
}

- (IndexService)initWithMockIndexRequestHandler:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IndexService;
  v9 = [(IndexService *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mockIndexHandler, a3);
    uint64_t v11 = [(id)objc_opt_class() makeWorkQueueUsingSchedulerProvider:v8];
    workQueue = v10->_workQueue;
    v10->_workQueue = (CNScheduler *)v11;

    v13 = (CNPublishingSubject *)objc_alloc_init((Class)CNPublishingSubject);
    coalescer = v10->_coalescer;
    v10->_coalescer = v13;

    v15 = [(CNPublishingSubject *)v10->_coalescer throttle:2 options:v8 schedulerProvider:5.0];
    v16 = +[CNObserver observerWithWeakTarget:v10 resultSelector:"handleCoalescedEvent:"];
    uint64_t v17 = [v15 subscribe:v16];
    coalescingToken = v10->_coalescingToken;
    v10->_coalescingToken = (CNCancelable *)v17;

    v19 = +[CNUserDefaults standardPreferences];
    v10->_isSpotlightIndexingEnabled = [v19 integerForKey:@"CNDisableSpotlightIndexing"] == 0;

    v20 = v10;
  }

  return v10;
}

+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3
{
  id v3 = [a3 newSerialSchedulerWithName:@"com.apple.contactsd.IndexService"];
  id v4 = [objc_alloc((Class)CNQualityOfServiceSchedulerDecorator) initWithScheduler:v3 qualityOfService:2];

  return v4;
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  if ([(IndexService *)self isSpotlightIndexingEnabled]
    && (([v4 isEqualToString:@"__ABDataBaseChangedByOtherProcessNotification"] & 1) != 0
     || [v4 isEqualToString:@"com.apple.datamigrator.migrationDidFinish"]))
  {
    v5 = [(IndexService *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000125F4;
    v6[3] = &unk_100024B98;
    v6[4] = self;
    [v5 performBlock:v6];
  }
}

- (void)handleCoalescedEvent:(id)a3
{
  id v4 = [(IndexService *)self workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012748;
  v5[3] = &unk_100024B98;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (id)interestedNotifications
{
  return &off_100025D10;
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(IndexService *)self isSpotlightIndexingEnabled])
  {
    id v8 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.IndexService.ReindexSearchableItems"];
    [v8 start];
    v9 = [(IndexService *)self workQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100012904;
    v11[3] = &unk_1000250D0;
    id v12 = v6;
    v13 = self;
    id v14 = v8;
    v15 = v7;
    id v10 = v8;
    [v9 performBlock:v11];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (id)verifyIndexLoggingSummary:(BOOL)a3 error:(id *)a4
{
  if ([(IndexService *)self isSpotlightIndexingEnabled])
  {
    id v7 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.IndexService.VerifyIndex"];
    [v7 start];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_100012BD0;
    v30 = sub_100012BE0;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_100012BD0;
    v24 = sub_100012BE0;
    id v25 = 0;
    id v8 = objc_alloc_init((Class)CNPromise);
    v9 = [(IndexService *)self workQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100012BE8;
    v15[3] = &unk_1000250F8;
    uint64_t v17 = &v26;
    v15[4] = self;
    BOOL v19 = a3;
    v18 = &v20;
    id v10 = v8;
    id v16 = v10;
    [v9 performBlock:v15];

    uint64_t v11 = [v10 future];
    id v12 = [v11 result:0];

    if (a4) {
      *a4 = (id) v21[5];
    }
    [v7 stop];
    v13 = (__CFString *)(id)v27[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v13 = @"Spotlight indexing is disabled.";
  }

  return v13;
}

- (id)indexHandler
{
  mockIndexHandler = self->_mockIndexHandler;
  if (mockIndexHandler)
  {
    id v3 = mockIndexHandler;
  }
  else
  {
    id v4 = objc_alloc((Class)CNIndexRequestHandler);
    v5 = +[CNEnvironment currentEnvironment];
    id v6 = [v5 contactStore];
    id v3 = (CNIndexRequestHandler *)[v4 initWithContactStore:v6];
  }

  return v3;
}

- (CNIndexRequestHandler)mockIndexHandler
{
  return self->_mockIndexHandler;
}

- (CNPublishingSubject)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (CNCancelable)coalescingToken
{
  return self->_coalescingToken;
}

- (void)setCoalescingToken:(id)a3
{
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNInhibitor)coalescingInhibitor
{
  return self->_coalescingInhibitor;
}

- (void)setCoalescingInhibitor:(id)a3
{
}

- (BOOL)isSpotlightIndexingEnabled
{
  return self->_isSpotlightIndexingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingInhibitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coalescingToken, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);

  objc_storeStrong((id *)&self->_mockIndexHandler, 0);
}

@end