@interface MessageSummaryLoader
- (BOOL)summaryLoaded;
- (BOOL)wantsContentsOfType:(int64_t)a3;
- (EFPromise)summaryPromise;
- (MessageSummaryLoader)initWithMessage:(id)a3;
- (NSString)summary;
- (double)order;
- (double)ordering;
- (id)_bodyLoader;
- (id)message;
- (id)requestSummary;
- (id)requestSummaryImmediatelyFromDownloadedMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (int64_t)priority;
- (unint64_t)numberOfLoadAttempts;
- (void)cancel;
- (void)cancelSummaryRequest;
- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4;
- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4;
- (void)setNumberOfLoadAttempts:(unint64_t)a3;
- (void)setOrder:(double)a3;
- (void)setSummaryPromise:(id)a3;
@end

@implementation MessageSummaryLoader

- (MessageSummaryLoader)initWithMessage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MessageSummaryLoader;
  v6 = [(MessageSummaryLoader *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v8 = +[NSDate date];
    [v8 timeIntervalSince1970];
    v7->_order = v9;
  }
  return v7;
}

- (void)cancel
{
}

- (BOOL)summaryLoaded
{
  v3 = [(MessageSummaryLoader *)self message];
  v4 = [v3 summary];
  if (v4)
  {
    id v5 = [(MessageSummaryLoader *)self message];
    v6 = [v5 headersIfAvailable];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)requestSummary
{
  v3 = +[EFPromise promise];
  [(MessageSummaryLoader *)self setSummaryPromise:v3];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C68C;
  v8[3] = &unk_100139C48;
  v8[4] = self;
  v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:v8];

  id v5 = [(MessageSummaryLoader *)self summaryPromise];
  v6 = [v5 future];

  return v6;
}

- (void)cancelSummaryRequest
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004C7B0;
  v3[3] = &unk_100139C48;
  v3[4] = self;
  v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:v3];
}

- (id)requestSummaryImmediatelyFromDownloadedMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  id v4 = +[MessageBodyLoader copySummaryForMessage:a3 downloadIfNecessary:a4];

  return v4;
}

- (id)message
{
  return self->_message;
}

- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004C970;
  v10[3] = &unk_10013ABC8;
  id v7 = a4;
  id v11 = v7;
  v12 = self;
  id v8 = v6;
  id v13 = v8;
  double v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:v10];
}

- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004CB2C;
  v11[3] = &unk_10013ABC8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  id v9 = v7;
  id v14 = v9;
  v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:v11];
}

- (double)ordering
{
  [(MessageSummaryLoader *)self order];
  return result;
}

- (int64_t)priority
{
  v2 = MFUserAgent();
  if ([v2 isForeground]) {
    int64_t v3 = 200;
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)wantsContentsOfType:(int64_t)a3
{
  return a3 == 0;
}

- (id)_bodyLoader
{
  v2 = [(MessageSummaryLoader *)self message];
  int64_t v3 = [v2 account];
  id v4 = +[MessageBodyLoader loaderForAccount:v3];

  return v4;
}

- (NSString)summary
{
  return self->_summary;
}

- (unint64_t)numberOfLoadAttempts
{
  return self->_numberOfLoadAttempts;
}

- (void)setNumberOfLoadAttempts:(unint64_t)a3
{
  self->_numberOfLoadAttempts = a3;
}

- (EFPromise)summaryPromise
{
  return self->_summaryPromise;
}

- (void)setSummaryPromise:(id)a3
{
}

- (double)order
{
  return self->_order;
}

- (void)setOrder:(double)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPromise, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end