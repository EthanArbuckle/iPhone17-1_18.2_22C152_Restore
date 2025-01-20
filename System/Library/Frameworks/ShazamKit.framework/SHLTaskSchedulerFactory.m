@interface SHLTaskSchedulerFactory
- (SHLFetchTaskScheduler)fetchTaskScheduler;
- (SHLModifyTaskScheduler)modifyTaskScheduler;
- (SHLSyncSessionConfiguration)configuration;
- (SHLTaskSchedulerFactory)initWithConfiguration:(id)a3;
- (id)createTransaction;
- (void)setConfiguration:(id)a3;
@end

@implementation SHLTaskSchedulerFactory

- (SHLTaskSchedulerFactory)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLTaskSchedulerFactory;
  v6 = [(SHLTaskSchedulerFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (SHLModifyTaskScheduler)modifyTaskScheduler
{
  v3 = [(SHLTaskSchedulerFactory *)self configuration];
  id v4 = [(SHLCloudModifyTaskScheduler *)v3 sessionType];

  if (!v4)
  {
    id v5 = [SHLCloudModifyTaskScheduler alloc];
    v6 = [(SHLTaskSchedulerFactory *)self configuration];
    v3 = [(SHLCloudModifyTaskScheduler *)v5 initWithConfiguration:v6];
  }

  return (SHLModifyTaskScheduler *)v3;
}

- (SHLFetchTaskScheduler)fetchTaskScheduler
{
  v3 = [(SHLTaskSchedulerFactory *)self configuration];
  id v4 = [(SHLCloudFetchTaskScheduler *)v3 sessionType];

  if (!v4)
  {
    id v5 = [SHLCloudFetchTaskScheduler alloc];
    v6 = [(SHLTaskSchedulerFactory *)self configuration];
    v3 = [(SHLCloudFetchTaskScheduler *)v5 initWithConfiguration:v6];
  }

  return (SHLFetchTaskScheduler *)v3;
}

- (id)createTransaction
{
  id v4 = [(SHLTaskSchedulerFactory *)self configuration];
  id v5 = [v4 sessionType];

  if (!v5)
  {
    v6 = +[SHLCloudContext sharedContext];
    v7 = [(SHLTaskSchedulerFactory *)self configuration];
    v8 = objc_msgSend(v6, "containerWithScope:", objc_msgSend(v7, "sessionScope"));
    objc_super v9 = [v8 containerIdentifier];

    v10 = [SHLCloudLibraryCache alloc];
    v11 = [(SHLTaskSchedulerFactory *)self configuration];
    v12 = [v11 callingProcessIdentifier];
    v13 = [(SHLTaskSchedulerFactory *)self configuration];
    v14 = [v13 sessionIdentifier];
    v2 = [(SHLCloudLibraryCache *)v10 initWithCallingProcessIdentifier:v12 containerIdentifier:v9 transactionIdentifier:v14];
  }

  return v2;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end