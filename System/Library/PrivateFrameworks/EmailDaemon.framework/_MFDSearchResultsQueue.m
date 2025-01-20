@interface _MFDSearchResultsQueue
- (BOOL)handleItems:(id)a3;
- (BOOL)handleMessage:(id)a3;
- (_MFDSearchResultsQueue)initWithKeys:(id)a3 resultsProxy:(id)a4;
- (void)finishWithError:(id)a3;
@end

@implementation _MFDSearchResultsQueue

- (_MFDSearchResultsQueue)initWithKeys:(id)a3 resultsProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_MFDSearchResultsQueue;
  v8 = [(_MFDSearchResultsQueue *)&v18 initWithMaximumSize:32 latency:1.79769313e308];
  if (v8)
  {
    uint64_t v9 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.search.results" qualityOfService:25];
    scheduler = v8->_scheduler;
    v8->_scheduler = (EFScheduler *)v9;

    v11 = [[MFMessageResultsGenerator alloc] initWithKeys:v6 downloadIfNecessary:0];
    generator = v8->_generator;
    v8->_generator = v11;

    v13 = v8->_generator;
    v14 = +[DaemonAppController sharedController];
    v15 = [v14 defaultAttachmentManager];
    [(MFMessageResultsGenerator *)v13 setAttachmentManager:v15];

    objc_storeStrong((id *)&v8->_resultsProxy, a4);
    v16 = v8;
  }

  return v8;
}

- (BOOL)handleItems:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006B0B8;
  v8[3] = &unk_100139C20;
  id v9 = v4;
  v10 = self;
  id v6 = v4;
  [(EFScheduler *)scheduler performBlock:v8];

  return 1;
}

- (BOOL)handleMessage:(id)a3
{
  return 1;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDSearchResultsQueue;
  [(_MFDSearchResultsQueue *)&v9 flush];
  scheduler = self->_scheduler;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B378;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(EFScheduler *)scheduler performBlock:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_resultsProxy, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end