@interface AMSDCarrierOfferRegistrationActivity
+ (double)_retrievePollingTime;
+ (id)_task;
- (AMSDCarrierOfferRegistrationActivity)init;
- (OS_dispatch_queue)workQueue;
- (id)activityIdentifier;
- (id)criteria;
- (void)_registerForNextAttemptWithScheduler:(id)a3;
- (void)runActivityQueuedByScheduler:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation AMSDCarrierOfferRegistrationActivity

- (AMSDCarrierOfferRegistrationActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSDCarrierOfferRegistrationActivity;
  v2 = [(AMSDCarrierOfferRegistrationActivity *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amsaccountd.carrierOfferRegistration.workQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)activityIdentifier
{
  return @"AMSDCarrierOfferRegistrationActivity";
}

- (id)criteria
{
  v2 = [AMSDXPCActivityCriteriaBuilder alloc];
  [(id)objc_opt_class() _retrievePollingTime];
  dispatch_queue_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4 = [(AMSDXPCActivityCriteriaBuilder *)v2 initWithCanRunOnBattery:1 delay:v3 gracePeriod:0 inexpensiveNetworkConnection:1 priority:0 repeating:1 requiresNetwork:7200.0];
  v5 = [(AMSDXPCActivityCriteriaBuilder *)v4 buildXPCObject];

  return v5;
}

- (void)runActivityQueuedByScheduler:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDCarrierOfferRegistrationActivity *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FB78;
  v7[3] = &unk_100112170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccounts.carrierOfferRegistration.run" withQueue:v5 whilePerformingBlock:v7];
}

- (void)_registerForNextAttemptWithScheduler:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDCarrierOfferRegistrationActivity *)self activityIdentifier];
  [v4 removeActivity:v5];

  id v6 = objc_alloc_init((Class)objc_opt_class());
  [v4 scheduleIfNeededActivity:v6];
}

+ (double)_retrievePollingTime
{
  dispatch_queue_t v3 = +[AMSCarrierOfferRegistrationTask createBagForSubProfile];
  id v4 = +[AMSCarrierOfferRegistrationTask pollingIntervalFromBag:v3];
  id v18 = 0;
  v5 = [v4 resultWithError:&v18];
  id v6 = v18;

  if (!v6)
  {
    if (v5)
    {
      [v5 doubleValue];
      double v9 = v12;
      v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v7)
      {
        v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      v10 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      id v20 = a1;
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 2048;
      double v24 = v9;
      v13 = "%{public}@: [%{public}@] Polling time retrieved: %f";
      v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 32;
    }
    else
    {
      v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v7)
      {
        v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      double v9 = 86400.0;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      v10 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      id v20 = a1;
      __int16 v21 = 2114;
      v22 = v10;
      v13 = "%{public}@: [%{public}@] Unexpected error - no delay\nFalling back to default";
      v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
    goto LABEL_16;
  }
  v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v7)
  {
    v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  double v9 = 86400.0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = AMSLogKey();
    v11 = AMSLogableError();
    *(_DWORD *)buf = 138543874;
    id v20 = a1;
    __int16 v21 = 2114;
    v22 = v10;
    __int16 v23 = 2114;
    double v24 = *(double *)&v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Polling time retrieval error: %{public}@\nFalling back to default", buf, 0x20u);

LABEL_16:
  }
LABEL_17:

  return v9;
}

+ (id)_task
{
  id v2 = objc_alloc((Class)AMSCarrierOfferRegistrationTask);
  dispatch_queue_t v3 = +[ACAccountStore ams_sharedAccountStore];
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  v5 = +[AMSCarrierOfferRegistrationTask createBagForSubProfile];
  id v6 = [v2 initWithAccount:v4 bag:v5];

  return v6;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end