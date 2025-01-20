@interface CNAnalyzeDatabaseService
+ (id)log;
+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3 withName:(id)a4 qualityOfService:(unint64_t)a5;
+ (id)sharedInstance;
- (CNAnalyzeDatabaseService)init;
- (CNCancelable)analyzingToken;
- (CNCancelable)coalescingToken;
- (CNPublishingSubject)analyzer;
- (CNPublishingSubject)coalescer;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)lowPriorityWorkQueue;
- (id)interestedNotifications;
- (void)handleAnalyzingEvent:(id)a3;
- (void)handleCoalescedShouldAnalyzeEvent:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)setAnalyzer:(id)a3;
- (void)setAnalyzingToken:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setCoalescingToken:(id)a3;
@end

@implementation CNAnalyzeDatabaseService

+ (id)log
{
  if (qword_10002C9F0 != -1) {
    dispatch_once(&qword_10002C9F0, &stru_100024BF0);
  }
  v2 = (void *)qword_10002C9F8;

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C4AC;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CA00 != -1) {
    dispatch_once(&qword_10002CA00, block);
  }
  v2 = (void *)qword_10002CA08;

  return v2;
}

- (CNAnalyzeDatabaseService)init
{
  v22.receiver = self;
  v22.super_class = (Class)CNAnalyzeDatabaseService;
  v2 = [(CNAnalyzeDatabaseService *)&v22 init];
  if (v2)
  {
    v3 = +[CNSchedulerProvider defaultProvider];
    uint64_t v4 = [(id)objc_opt_class() makeWorkQueueUsingSchedulerProvider:v3 withName:@"com.apple.contactsd.AnalyzeDatabase.lowpriority" qualityOfService:2];
    lowPriorityWorkQueue = v2->_lowPriorityWorkQueue;
    v2->_lowPriorityWorkQueue = (CNScheduler *)v4;

    uint64_t v6 = [(id)objc_opt_class() makeWorkQueueUsingSchedulerProvider:v3 withName:@"com.apple.contactsd.AnalyzeDatabase.highpriority" qualityOfService:4];
    highPriorityWorkQueue = v2->_highPriorityWorkQueue;
    v2->_highPriorityWorkQueue = (CNScheduler *)v6;

    v8 = (CNPublishingSubject *)objc_alloc_init((Class)CNPublishingSubject);
    analyzer = v2->_analyzer;
    v2->_analyzer = v8;

    v10 = v2->_analyzer;
    v11 = +[CNObserver observerWithWeakTarget:v2 resultSelector:"handleAnalyzingEvent:"];
    uint64_t v12 = [(CNPublishingSubject *)v10 subscribe:v11];
    analyzingToken = v2->_analyzingToken;
    v2->_analyzingToken = (CNCancelable *)v12;

    v14 = (CNPublishingSubject *)objc_alloc_init((Class)CNPublishingSubject);
    coalescer = v2->_coalescer;
    v2->_coalescer = v14;

    v16 = [(CNPublishingSubject *)v2->_coalescer throttle:1 options:v3 schedulerProvider:60.0];
    v17 = +[CNObserver observerWithWeakTarget:v2 resultSelector:"handleCoalescedShouldAnalyzeEvent:"];
    uint64_t v18 = [v16 subscribe:v17];
    coalescingToken = v2->_coalescingToken;
    v2->_coalescingToken = (CNCancelable *)v18;

    v20 = v2;
  }

  return v2;
}

+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3 withName:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6 = [a3 newSerialSchedulerWithName:a4];
  id v7 = [objc_alloc((Class)CNQualityOfServiceSchedulerDecorator) initWithScheduler:v6 qualityOfService:a5];

  return v7;
}

- (id)interestedNotifications
{
  v4[0] = @"__ABDataBaseChangedByOtherProcessNotification";
  v4[1] = @"com.apple.datamigrator.migrationDidFinish";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  v5 = [(CNAnalyzeDatabaseService *)self interestedNotifications];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(CNAnalyzeDatabaseService *)self lowPriorityWorkQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C834;
    v8[3] = &unk_100024B98;
    v8[4] = self;
    [v7 performBlock:v8];
  }
}

- (void)handleCoalescedShouldAnalyzeEvent:(id)a3
{
  id v4 = [(id)objc_opt_class() log];
  v5 = +[CNEnvironment currentEnvironment];
  unsigned int v6 = [v5 contactStore];

  id v7 = [(CNAnalyzeDatabaseService *)self lowPriorityWorkQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C998;
  v10[3] = &unk_100024C18;
  id v11 = v4;
  id v12 = v6;
  v13 = self;
  id v8 = v6;
  id v9 = v4;
  [v7 performBlock:v10];
}

- (void)handleAnalyzingEvent:(id)a3
{
  id v4 = [(id)objc_opt_class() log];
  v5 = +[CNEnvironment currentEnvironment];
  unsigned int v6 = [v5 contactStore];

  id v7 = [(CNAnalyzeDatabaseService *)self highPriorityWorkQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CB88;
  v10[3] = &unk_100024C40;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  [v7 performBlock:v10];
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

- (CNPublishingSubject)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
}

- (CNCancelable)analyzingToken
{
  return self->_analyzingToken;
}

- (void)setAnalyzingToken:(id)a3
{
}

- (CNScheduler)lowPriorityWorkQueue
{
  return self->_lowPriorityWorkQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_analyzingToken, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_coalescingToken, 0);

  objc_storeStrong((id *)&self->_coalescer, 0);
}

@end