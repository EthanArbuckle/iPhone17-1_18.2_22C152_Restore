@interface SHLCloudModifyTaskScheduler
- (NSArray)preconditions;
- (SHLCloudModifyTaskScheduler)initWithConfiguration:(id)a3;
- (SHLCloudModifyTaskTransformer)taskTransformer;
- (void)scheduleModifyTask:(id)a3;
- (void)setTaskTransformer:(id)a3;
@end

@implementation SHLCloudModifyTaskScheduler

- (SHLCloudModifyTaskScheduler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudModifyTaskScheduler;
  v5 = [(SHLCloudTaskScheduler *)&v9 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [[SHLCloudModifyTaskTransformer alloc] initWithConfiguration:v4];
    taskTransformer = v5->_taskTransformer;
    v5->_taskTransformer = v6;
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
    v11 = [(SHLCloudTaskScheduler *)self containerTransformer];
    v12 = [v11 cloudBackedContainer];
    v13 = [(SHLCloudEncryptionPrecondition *)v10 initWithContainer:v12];

    [v3 addObject:v13];
  }
  id v14 = [v3 copy];

  return (NSArray *)v14;
}

- (void)scheduleModifyTask:(id)a3
{
  id v4 = a3;
  v5 = [(SHLCloudTaskScheduler *)self containerTransformer];
  v6 = [v5 cloudBackedContainer];

  v7 = +[SHLCloudContext sharedContext];
  v8 = [v7 shazamLibraryZone];

  id v9 = [(SHLCloudTaskScheduler *)self cache];
  v10 = [v8 zoneID];
  v11 = [v10 zoneName];
  unsigned __int8 v12 = [v9 zoneExistsForIdentifier:v11];

  p_info = (__objc2_class_ro **)(SHAppIntentMatcher + 32);
  if ((v12 & 1) == 0)
  {
    v50 = v6;
    id v14 = [[SHLCloudBackedZone alloc] initWithZone:v8];
    v15 = [(SHLCloudTaskScheduler *)self cache];
    v16 = [(SHLCloudBackedZone *)v14 zone];
    v17 = [v16 zoneID];
    v18 = [v17 zoneName];
    id v52 = 0;
    unsigned __int8 v19 = [v15 storeZoneIdentifier:v18 error:&v52];
    id v20 = v52;

    if ((v19 & 1) == 0)
    {
      v21 = sub_10003260C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [(SHLCloudBackedZone *)v14 zone];
        v23 = [v22 zoneID];
        v24 = [v23 zoneName];
        *(_DWORD *)buf = 138412546;
        id v55 = v24;
        __int16 v56 = 2114;
        id v57 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to cache the zone identifier for zone named %@ in the modify task with error %{public}@", buf, 0x16u);
      }
    }
    v49 = v20;
    v25 = sub_10003260C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = [v4 identifier];
      v29 = [(SHLCloudBackedZone *)v14 zone];
      v30 = [v29 zoneID];
      v31 = [v30 zoneName];
      *(_DWORD *)buf = 138543874;
      id v55 = v27;
      __int16 v56 = 2112;
      id v57 = v28;
      __int16 v58 = 2114;
      v59 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> <zone: %{public}@> does not exist locally, so we are creating one", buf, 0x20u);
    }
    v32 = [(SHLCloudTaskScheduler *)self zoneTransformer];
    v53 = v14;
    v33 = +[NSArray arrayWithObjects:&v53 count:1];
    v6 = v50;
    v34 = [v32 cloudBackedOperationForZonesToSave:v33 container:v50];

    p_info = SHAppIntentMatcher.info;
    v35 = +[SHLOperationQueue defaultQueue];
    v36 = [v34 operation];
    [v35 addOperation:v36];
  }
  v37 = [(SHLCloudTaskScheduler *)self cache];
  id v51 = 0;
  unsigned __int8 v38 = [v37 storeTask:v4 ofType:0 error:&v51];
  id v39 = v51;

  if ((v38 & 1) == 0)
  {
    v40 = sub_10003260C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to store the inflight task in the modify task scheduler with error %{public}@", buf, 0xCu);
    }
  }
  v41 = [(SHLCloudModifyTaskScheduler *)self taskTransformer];
  v42 = [v41 cloudBackedOperationFromModifyTask:v4 container:v6];

  v43 = sub_10003260C();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    v46 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v55 = v45;
    __int16 v56 = 2112;
    id v57 = v46;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> is scheduled", buf, 0x16u);
  }
  v47 = [p_info + 396 defaultQueue];
  v48 = [v42 operation];
  [v47 addOperation:v48];
}

- (SHLCloudModifyTaskTransformer)taskTransformer
{
  return self->_taskTransformer;
}

- (void)setTaskTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end