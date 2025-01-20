@interface HDClinicalOptInDataUploadManager
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDClinicalOptInDataUploadManager)initWithProfileExtension:(id)a3;
- (HDClinicalOptInStudy)study;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDPeriodicActivity)periodicActivity;
- (HDProfile)profile;
- (OS_dispatch_queue)queue;
- (void)_queue_triggerClinicalOptInDataUploadWithCompletion:(id)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)triggerClinicalOptInDataUploadWithCompletion:(id)a3;
@end

@implementation HDClinicalOptInDataUploadManager

- (HDClinicalOptInDataUploadManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDClinicalOptInDataUploadManager;
  v5 = [(HDClinicalOptInDataUploadManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profileExtension);
    uint64_t v9 = [WeakRetained optInStudy];
    study = v6->_study;
    v6->_study = (HDClinicalOptInStudy *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    id v13 = objc_alloc((Class)HDPeriodicActivity);
    id v14 = objc_loadWeakRetained((id *)&v6->_profile);
    v15 = (HDPeriodicActivity *)[v13 initWithProfile:v14 name:@"com.apple.healthd.healthrecords.opt-in-data-upload" interval:v6 delegate:HKLogHealthRecords loggingCategory:(double)XPC_ACTIVITY_INTERVAL_1_DAY];
    periodicActivity = v6->_periodicActivity;
    v6->_periodicActivity = v15;
  }
  return v6;
}

- (void)triggerClinicalOptInDataUploadWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_31B10;
  v7[3] = &unk_111E90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_triggerClinicalOptInDataUploadWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void *, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(HDClinicalOptInDataUploadManager *)self profileExtension];
  unsigned __int8 v6 = [v5 isImproveHealthRecordsDataSubmissionAllowed];

  if (v6)
  {
    v7 = [(HDClinicalOptInDataUploadManager *)self study];
    id v16 = 0;
    id v8 = [v7 triggerOptInAnalyticsDataUploadToHealthCloudWithError:&v16];
    id v9 = v16;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_ACF40(v10, self, (uint64_t)v9);
      }
    }
    uint64_t v11 = [(HDClinicalOptInDataUploadManager *)self study];
    v12 = [v11 currentSubjectID];
    v4[2](v4, v8, v12, v9);
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      v15 = [(HDClinicalOptInDataUploadManager *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      objc_super v18 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%{public}@ opt-in data collection is not enabled by the user", buf, 0xCu);
    }
    v4[2](v4, (char *)&dword_0 + 1, 0, 0);
  }
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_31D8C;
  v8[3] = &unk_111E90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict = a4;
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDClinicalOptInStudy)study
{
  return self->_study;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_study, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end