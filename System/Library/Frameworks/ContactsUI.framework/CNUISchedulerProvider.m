@interface CNUISchedulerProvider
+ (id)makeBackgroundScheduler;
- (CNScheduler)afterCACommitScheduler;
- (CNScheduler)immediateScheduler;
- (CNScheduler)inlineScheduler;
- (CNScheduler)mainThreadScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (CNSuspendableSchedulerDecorator)suspendableBackgroundScheduler;
- (CNUISchedulerProvider)init;
- (CNUISchedulerProvider)initWithSchedulerProvider:(id)a3;
- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3;
- (id)newReaderWriterSchedulerWithName:(id)a3;
- (id)newSerialSchedulerWithName:(id)a3;
- (id)newSynchronousSerialSchedulerWithName:(id)a3;
- (void)resumeBackgroundScheduler;
- (void)suspendBackgroundScheduler;
@end

@implementation CNUISchedulerProvider

- (CNSuspendableSchedulerDecorator)suspendableBackgroundScheduler
{
  return self->_suspendableBackgroundScheduler;
}

- (CNScheduler)mainThreadScheduler
{
  v2 = [(CNUISchedulerProvider *)self schedulerProvider];
  v3 = [v2 mainThreadScheduler];

  return (CNScheduler *)v3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)inlineScheduler
{
  v2 = [(CNUISchedulerProvider *)self schedulerProvider];
  v3 = [v2 inlineScheduler];

  return (CNScheduler *)v3;
}

- (void)resumeBackgroundScheduler
{
  id v2 = [(CNUISchedulerProvider *)self suspendableBackgroundScheduler];
  [v2 resume];
}

- (CNUISchedulerProvider)init
{
  v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  v4 = [(CNUISchedulerProvider *)self initWithSchedulerProvider:v3];

  return v4;
}

- (CNUISchedulerProvider)initWithSchedulerProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNUISchedulerProvider;
  v6 = [(CNUISchedulerProvider *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() makeBackgroundScheduler];
    suspendableBackgroundScheduler = v6->_suspendableBackgroundScheduler;
    v6->_suspendableBackgroundScheduler = (CNSuspendableSchedulerDecorator *)v7;

    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    v9 = [[CNUIAfterCACommitScheduler alloc] initWithSchedulerProvider:v6->_schedulerProvider];
    afterCACommitScheduler = v6->_afterCACommitScheduler;
    v6->_afterCACommitScheduler = (CNScheduler *)v9;

    v11 = v6;
  }

  return v6;
}

+ (id)makeBackgroundScheduler
{
  id v2 = [MEMORY[0x1E4F5A4E8] operationQueueSchedulerWithMaxConcurrentOperationCount:1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F5A520]) initWithScheduler:v2];

  return v3;
}

- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3
{
  v4 = [(CNUISchedulerProvider *)self schedulerProvider];
  id v5 = [v4 backgroundSchedulerWithQualityOfService:a3];

  return v5;
}

- (CNScheduler)immediateScheduler
{
  id v2 = [(CNUISchedulerProvider *)self schedulerProvider];
  v3 = [v2 immediateScheduler];

  return (CNScheduler *)v3;
}

- (id)newSynchronousSerialSchedulerWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUISchedulerProvider *)self schedulerProvider];
  v6 = (void *)[v5 newSynchronousSerialSchedulerWithName:v4];

  return v6;
}

- (id)newSerialSchedulerWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUISchedulerProvider *)self schedulerProvider];
  v6 = (void *)[v5 newSerialSchedulerWithName:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterCACommitScheduler, 0);
  objc_storeStrong((id *)&self->_suspendableBackgroundScheduler, 0);

  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

- (CNScheduler)afterCACommitScheduler
{
  return self->_afterCACommitScheduler;
}

- (id)newReaderWriterSchedulerWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUISchedulerProvider *)self schedulerProvider];
  v6 = (void *)[v5 newReaderWriterSchedulerWithName:v4];

  return v6;
}

- (void)suspendBackgroundScheduler
{
  id v2 = [(CNUISchedulerProvider *)self suspendableBackgroundScheduler];
  [v2 suspend];
}

@end