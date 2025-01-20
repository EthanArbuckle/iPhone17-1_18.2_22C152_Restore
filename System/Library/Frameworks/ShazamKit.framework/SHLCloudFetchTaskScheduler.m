@interface SHLCloudFetchTaskScheduler
- (BOOL)cloudBackedZones:(id)a3 containsZone:(id)a4;
- (NSArray)preconditions;
- (SHLCloudFetchTaskScheduler)initWithConfiguration:(id)a3;
- (SHLCloudFetchTaskTransformer)fetchTaskTransformer;
- (SHLCloudSubscriptionTransformer)subscriptionTaskTransformer;
- (void)scheduleFetchTask:(id)a3;
- (void)setFetchTaskTransformer:(id)a3;
- (void)setSubscriptionTaskTransformer:(id)a3;
@end

@implementation SHLCloudFetchTaskScheduler

- (SHLCloudFetchTaskScheduler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLCloudFetchTaskScheduler;
  v5 = [(SHLCloudTaskScheduler *)&v11 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [[SHLCloudFetchTaskTransformer alloc] initWithConfiguration:v4];
    fetchTaskTransformer = v5->_fetchTaskTransformer;
    v5->_fetchTaskTransformer = v6;

    v8 = [[SHLCloudSubscriptionTransformer alloc] initWithConfiguration:v4];
    subscriptionTaskTransformer = v5->_subscriptionTaskTransformer;
    v5->_subscriptionTaskTransformer = v8;
  }
  return v5;
}

- (NSArray)preconditions
{
  v3 = +[NSMutableArray array];
  id v4 = [SHLCloudAccountStatusPrecondition alloc];
  v5 = [(SHLCloudTaskScheduler *)self containerTransformer];
  v6 = [v5 cloudBackedContainer];
  v7 = [(SHLCloudAccountStatusPrecondition *)v4 initWithContainer:v6];

  [v3 addObject:v7];
  v8 = [(SHLCloudTaskScheduler *)self configuration];
  id v9 = [v8 sessionScope];

  if (v9 == (id)1)
  {
    v10 = [SHLCloudEncryptionPrecondition alloc];
    objc_super v11 = [(SHLCloudTaskScheduler *)self containerTransformer];
    v12 = [v11 cloudBackedContainer];
    v13 = [(SHLCloudEncryptionPrecondition *)v10 initWithContainer:v12];

    [v3 addObject:v13];
  }
  id v14 = [v3 copy];

  return (NSArray *)v14;
}

- (void)scheduleFetchTask:(id)a3
{
  id v4 = a3;
  v5 = [(SHLCloudTaskScheduler *)self containerTransformer];
  v6 = [v5 cloudBackedContainer];

  v7 = [(SHLCloudFetchTaskScheduler *)self fetchTaskTransformer];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002B6CC;
  v22[3] = &unk_1000758D0;
  v22[4] = self;
  id v8 = v4;
  id v23 = v8;
  id v9 = v6;
  id v24 = v9;
  v10 = [v7 cloudBackedDatabaseChangesOperationFromFetchTask:v8 container:v9 completion:v22];

  objc_super v11 = [(SHLCloudTaskScheduler *)self cache];
  id v21 = 0;
  unsigned __int8 v12 = [v11 storeTask:v8 ofType:0 error:&v21];
  id v13 = v21;

  if ((v12 & 1) == 0)
  {
    id v14 = sub_10003260C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to store the inflight task in the fetch task scheduler with error %{public}@", buf, 0xCu);
    }
  }
  v15 = sub_10003260C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v8 identifier];
    *(_DWORD *)buf = 138543618;
    id v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> is scheduled", buf, 0x16u);
  }
  v19 = +[SHLOperationQueue defaultQueue];
  v20 = [v10 operation];
  [v19 addOperation:v20 waitUntilFinished:1];
}

- (BOOL)cloudBackedZones:(id)a3 containsZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) zone];
        objc_super v11 = [v10 zoneID];
        unsigned __int8 v12 = [v11 zoneName];
        id v13 = [v6 zoneID];
        id v14 = [v13 zoneName];
        unsigned __int8 v15 = [v12 isEqual:v14];

        if (v15)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (SHLCloudFetchTaskTransformer)fetchTaskTransformer
{
  return self->_fetchTaskTransformer;
}

- (void)setFetchTaskTransformer:(id)a3
{
}

- (SHLCloudSubscriptionTransformer)subscriptionTaskTransformer
{
  return self->_subscriptionTaskTransformer;
}

- (void)setSubscriptionTaskTransformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionTaskTransformer, 0);

  objc_storeStrong((id *)&self->_fetchTaskTransformer, 0);
}

@end