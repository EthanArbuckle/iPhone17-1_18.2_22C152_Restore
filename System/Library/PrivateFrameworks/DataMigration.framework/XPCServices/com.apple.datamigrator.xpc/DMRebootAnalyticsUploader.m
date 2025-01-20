@interface DMRebootAnalyticsUploader
+ (id)_createSubmissionClientWithErrorHandler:(id)a3;
+ (id)createRebootAnalyticsUploaderIfAppropriateWithEnvironment:(id)a3;
- (OSASubmissionClient)submissionClient;
- (id)_initWithSubmissionClient:(id)a3;
- (id)submissionBlock;
- (void)setSubmissionBlock:(id)a3;
- (void)setSubmissionClient:(id)a3;
- (void)start;
- (void)waitForCompletionWithTimeoutTimeInterval:(double)a3;
@end

@implementation DMRebootAnalyticsUploader

+ (id)createRebootAnalyticsUploaderIfAppropriateWithEnvironment:(id)a3
{
  if ([a3 migrationRebootCount] == (id)1)
  {
    v4 = [a1 _createSubmissionClientWithErrorHandler:&stru_100024740];
    id v5 = [[DMRebootAnalyticsUploader alloc] _initWithSubmissionClient:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_createSubmissionClientWithErrorHandler:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_100030B88;
  uint64_t v12 = qword_100030B88;
  if (!qword_100030B88)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008D30;
    v8[3] = &unk_100024790;
    v8[4] = &v9;
    sub_100008D30((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithErrorHandler:v3];

  return v6;
}

- (id)_initWithSubmissionClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMRebootAnalyticsUploader;
  id v5 = [(DMRebootAnalyticsUploader *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(DMRebootAnalyticsUploader *)v5 setSubmissionClient:v4];
  }

  return v6;
}

- (void)start
{
  [(DMRebootAnalyticsUploader *)self submissionClient];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B88;
  block[3] = &unk_100024768;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v8;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(DMRebootAnalyticsUploader *)self setSubmissionBlock:v4];

  id v5 = dispatch_get_global_queue(25, 0);
  id v6 = [(DMRebootAnalyticsUploader *)self submissionBlock];
  dispatch_async(v5, v6);
}

- (void)waitForCompletionWithTimeoutTimeInterval:(double)a3
{
  _DMLogFunc();
  id v5 = [(DMRebootAnalyticsUploader *)self submissionBlock];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  intptr_t v7 = dispatch_block_wait(v5, v6);

  +[NSNumber numberWithInt:v7 != 0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  _DMLogFunc();
}

- (OSASubmissionClient)submissionClient
{
  return (OSASubmissionClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSubmissionClient:(id)a3
{
}

- (id)submissionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setSubmissionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionBlock, 0);

  objc_storeStrong((id *)&self->_submissionClient, 0);
}

@end