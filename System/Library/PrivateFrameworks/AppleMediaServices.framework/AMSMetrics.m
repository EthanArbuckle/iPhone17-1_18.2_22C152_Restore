@interface AMSMetrics
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)appAnalyticsAllowed;
+ (BOOL)diagnosticsSubmissionAllowed;
+ (BOOL)disableBackgroundMetrics;
+ (BOOL)flushDelayEnabled;
+ (BOOL)flushTimerEnabled;
+ (BOOL)recordAppAnalyticsForEvent:(id)a3 bugType:(id)a4;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (OS_dispatch_queue)sharedTimerQueue;
+ (double)timeIntervalFromServerTime:(id)a3;
+ (id)createBagForSubProfile;
+ (id)internalInstanceUsingBag:(id)a3;
+ (id)serverTimeFromDate:(id)a3;
+ (id)serverTimeFromTimeInterval:(double)a3;
+ (void)setDisableBackgroundMetrics:(BOOL)a3;
+ (void)setFlushDelayEnabled:(BOOL)a3;
+ (void)setFlushTimerEnabled:(BOOL)a3;
- (AMSBagProtocol)bag;
- (AMSEngagement)engagement;
- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4;
- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4 flushTaskClass:(Class)a5;
- (AMSMetrics)initWithContainerId:(id)a3 bagContract:(id)a4;
- (AMSMetricsBagContract)bagContract;
- (AMSMetricsDatabaseDataSource)databaseSource;
- (AMSTreatmentStore)treatmentStore;
- (BOOL)_scheduledFlushAllowedForStyle:(int64_t)a3;
- (BOOL)flushTimerEnabled;
- (BOOL)flushingDisabled;
- (BOOL)includeMMeClientInfoAndDeviceHeaders;
- (BOOL)monitorsLifecycleEvents;
- (NSDate)flushIntervalStartTime;
- (NSString)containerId;
- (double)_flushIntervalWithConfiguration:(id)a3 forEvents:(id)a4;
- (id)_determineFlushStrategyWithDataSource:(id)a3 topic:(id)a4;
- (id)_enqueueFigaroEvents:(id)a3;
- (id)_flushDataSource:(id)a3 topic:(id)a4;
- (id)_modifiedEvents:(id)a3;
- (id)enqueueAsyncEvents:(id)a3;
- (id)flush;
- (id)flushEvents:(id)a3;
- (id)flushIntervalBlock;
- (id)flushOnDidBecomeActiveBlock;
- (id)flushTopic:(id)a3;
- (id)promiseForEnqueueingEvents:(id)a3;
- (int64_t)destination;
- (int64_t)eventCount;
- (int64_t)maxBatchSize;
- (int64_t)maxRequestCount;
- (os_unfair_lock_s)engagementLock;
- (unint64_t)metricsSigningFlavour;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_beginFlushIntervalWithStyle:(int64_t)a3 events:(id)a4;
- (void)_flushIntervalInvalidate;
- (void)_flushTimerEnabledChanged;
- (void)_handleFlushIntervalWithStyle:(int64_t)a3;
- (void)_processOperationQueue;
- (void)_showTTRWithEvent:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)dropEvents;
- (void)enqueueEvent:(id)a3;
- (void)enqueueEvents:(id)a3;
- (void)setBag:(id)a3;
- (void)setBagContract:(id)a3;
- (void)setDatabaseSource:(id)a3;
- (void)setDestination:(int64_t)a3;
- (void)setEngagement:(id)a3;
- (void)setEngagementLock:(os_unfair_lock_s)a3;
- (void)setFlushIntervalBlock:(id)a3;
- (void)setFlushIntervalStartTime:(id)a3;
- (void)setFlushOnDidBecomeActiveBlock:(id)a3;
- (void)setFlushTimerEnabled:(BOOL)a3;
- (void)setFlushingDisabled:(BOOL)a3;
- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3;
- (void)setMaxBatchSize:(int64_t)a3;
- (void)setMaxRequestCount:(int64_t)a3;
- (void)setMetricsSigningFlavour:(unint64_t)a3;
- (void)setMonitorsLifecycleEvents:(BOOL)a3;
- (void)setTreatmentStore:(id)a3;
@end

@implementation AMSMetrics

id __30__AMSMetrics__modifiedEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    v4 = (void *)[*(id *)(a1 + 32) copy];
    [v4 setProperty:v3 forBodyKey:0x1EDCBAF68];
    v5 = +[AMSPromise promiseWithResult:v4];
  }
  else
  {
    v5 = +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
  }

  return v5;
}

id __30__AMSMetrics__modifiedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 topic];
  v6 = [v4 encodeExperimentDataForTopic:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__AMSMetrics__modifiedEvents___block_invoke_2;
  v10[3] = &unk_1E55A3FB8;
  id v11 = v3;
  id v7 = v3;
  v8 = [v6 continueWithBlock:v10];

  return v8;
}

+ (id)serverTimeFromTimeInterval:(double)a3
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)(a3 * 1000.0)];
}

+ (id)serverTimeFromDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return (id)objc_msgSend(a1, "serverTimeFromTimeInterval:");
}

+ (id)internalInstanceUsingBag:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AMSMetrics_internalInstanceUsingBag___block_invoke;
  block[3] = &unk_1E559EA90;
  id v4 = v3;
  id v8 = v4;
  if (_MergedGlobals_128 != -1) {
    dispatch_once(&_MergedGlobals_128, block);
  }
  id v5 = (id)qword_1EB38DD68;

  if (v4) {
    [v5 setBag:v4];
  }

  return v5;
}

- (void)setBag:(id)a3
{
  v6 = (AMSBagProtocol *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_bag == v6)
  {
    os_unfair_lock_unlock(&self->_bagLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_bag, a3);
    os_unfair_lock_unlock(&self->_bagLock);
    id v5 = (id)[(id)objc_opt_class() internalInstanceUsingBag:v6];
    [(AMSMetrics *)self _beginFlushIntervalWithStyle:2 events:0];
  }
}

- (id)_enqueueFigaroEvents:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v55 count:16];
    if (!v6) {
      goto LABEL_30;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    unint64_t v9 = 0x1E4F1C000uLL;
    id v34 = v4;
    id v35 = v5;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v36 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        if (([v11 engagementEvent] & 1) == 0)
        {
          v54 = @"engagementMetrics";
          v12 = [*(id *)(v9 + 2424) arrayWithObjects:&v54 count:1];
          [v11 removePropertiesForKeys:v12];

          uint64_t v13 = [v11 diagnosticsSubmissionBugType];
          v39 = (void *)v13;
          if (([v11 checkDiagnosticsAndUsageSetting] & 1) != 0 || v13)
          {
            if (+[AMSMetrics diagnosticsSubmissionAllowed])
            {
              if (!v13
                || +[AMSMetrics recordAppAnalyticsForEvent:v11 bugType:v13])
              {
                goto LABEL_10;
              }
              v22 = +[AMSLogConfig sharedMetricsConfig];
              if (!v22)
              {
                v22 = +[AMSLogConfig sharedConfig];
              }
              v23 = [v22 OSLogObject];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = objc_opt_class();
                v25 = AMSLogKey();
                v26 = [v11 topic];
                *(_DWORD *)buf = 138543874;
                uint64_t v45 = v24;
                unint64_t v9 = 0x1E4F1C000;
                __int16 v46 = 2114;
                v47 = v25;
                __int16 v48 = 2114;
                v49 = v26;
                _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dropping event due to failed recording of event flagged for appAnalytics recording. Topic: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              v22 = +[AMSLogConfig sharedMetricsConfig];
              if (!v22)
              {
                v22 = +[AMSLogConfig sharedConfig];
              }
              v23 = [v22 OSLogObject];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = objc_opt_class();
                v28 = AMSLogKey();
                v29 = [v11 topic];
                *(_DWORD *)buf = 138543874;
                uint64_t v45 = v27;
                __int16 v46 = 2114;
                v47 = v28;
                __int16 v48 = 2114;
                v49 = v29;
                _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dropping event due to D&U. Topic: %{public}@", buf, 0x20u);

                unint64_t v9 = 0x1E4F1C000;
              }
            }
          }
          else
          {
LABEL_10:
            v14 = +[AMSLogConfig sharedMetricsConfig];
            if (!v14)
            {
              v14 = +[AMSLogConfig sharedConfig];
            }
            v15 = [v14 OSLogObject];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = objc_opt_class();
              id v38 = v16;
              v17 = AMSLogKey();
              v18 = [(AMSMetrics *)self containerId];
              v19 = [v11 topic];
              [v11 clientEventID];
              v21 = uint64_t v20 = v8;
              *(_DWORD *)buf = 138544386;
              uint64_t v45 = (uint64_t)v16;
              unint64_t v9 = 0x1E4F1C000;
              __int16 v46 = 2114;
              v47 = v17;
              __int16 v48 = 2114;
              v49 = v18;
              __int16 v50 = 2114;
              v51 = v19;
              __int16 v52 = 2114;
              v53 = v21;
              _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Enqueueing event (%{public}@) topic: %{public}@ id: %{public}@", buf, 0x34u);

              uint64_t v8 = v20;
              uint64_t v7 = v36;

              id v4 = v34;
              id v5 = v35;
            }
            [v4 addObject:v11];
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v55 count:16];
      if (!v7)
      {
LABEL_30:

        v30 = [(AMSMetrics *)self databaseSource];
        v31 = [v30 enqueueEvents:v4];

        [(AMSMetrics *)self _beginFlushIntervalWithStyle:1 events:v4];
        id v3 = v33;
        goto LABEL_32;
      }
    }
  }
  v31 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_32:

  return v31;
}

- (void)enqueueEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[AMSMetrics enqueueEvents:](self, "enqueueEvents:", v6, v7, v8);
}

- (void)enqueueEvents:(id)a3
{
  id v3 = [(AMSMetrics *)self promiseForEnqueueingEvents:a3];
}

- (AMSMetricsDatabaseDataSource)databaseSource
{
  return self->_databaseSource;
}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_75(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) _scheduledFlushAllowedForStyle:*(void *)(a1 + 56)]) {
    return;
  }
  v2 = *(void **)(a1 + 32);
  if (v2[17]) {
    return;
  }
  id v3 = [v2 bag];

  if (!v3)
  {
    v28 = +[AMSLogConfig sharedMetricsConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      v31 = [*(id *)(a1 + 32) containerId];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to schedule interval (no bag). ", buf, 0x16u);
    }
    goto LABEL_21;
  }
  [*(id *)(a1 + 32) _flushIntervalWithConfiguration:*(void *)(a1 + 40) forEvents:*(void *)(a1 + 48)];
  if (v4 == 0.0)
  {
    v28 = +[AMSLogConfig sharedMetricsConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_opt_class();
      id v33 = [*(id *)(a1 + 32) containerId];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to schedule interval (no interval)", buf, 0x16u);
    }
LABEL_21:

    return;
  }
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 144))
  {
    id v7 = [MEMORY[0x1E4F1C9C8] now];
    [v7 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 144)];
    double v9 = v8;

    if (v9 <= v5) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v10 = *(void **)(v6 + 136);
  if (v10) {
    dispatch_block_cancel(v10);
  }
  id v11 = +[AMSLogConfig sharedMetricsConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    v14 = [*(id *)(a1 + 32) containerId];
    v15 = *(void **)(a1 + 56);
    float v16 = v5;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    long long v40 = v15;
    LOWORD(v41) = 2048;
    *(double *)((char *)&v41 + 2) = v16;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flush scheduled. (style: %ld, time: %.3f)", buf, 0x2Au);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_77;
  block[3] = &unk_1E55A3EF0;
  objc_copyWeak(v37, &location);
  v37[1] = *(id *)(a1 + 56);
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  v18 = *(void **)(*(void *)(a1 + 32) + 136);
  *(void *)(*(void *)(a1 + 32) + 136) = v17;

  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 144);
  *(void *)(v20 + 144) = v19;

  v22 = +[AMSMetrics sharedTimerQueue];
  v23 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v24 = v22;
  id v25 = v23;
  v26 = AMSLogKey();
  if (v5 * 1000000000.0 <= 9.22337204e18) {
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  }
  else {
    dispatch_time_t v27 = -1;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __AMSDispatchAfter_block_invoke_3;
  long long v40 = &unk_1E559EAE0;
  *(void *)&long long v41 = v26;
  *((void *)&v41 + 1) = v25;
  id v34 = v25;
  id v35 = v26;
  dispatch_after(v27, v24, buf);

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

- (void)_beginFlushIntervalWithStyle:(int64_t)a3 events:(id)a4
{
  id v6 = a4;
  if ([(AMSMetrics *)self _scheduledFlushAllowedForStyle:a3])
  {
    id v7 = [(AMSMetrics *)self bag];
    double v8 = +[AMSMetricsFigaroBagConfguration configurationPromiseWithBag:v7];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke;
    v9[3] = &unk_1E55A3F40;
    v9[4] = self;
    int64_t v11 = a3;
    id v10 = v6;
    [v8 addFinishBlock:v9];
  }
}

- (BOOL)_scheduledFlushAllowedForStyle:(int64_t)a3
{
  p_flushModeLock = &self->_flushModeLock;
  os_unfair_lock_lock_with_options();
  if (!self->_flushTimerEnabled || !+[AMSMetrics flushTimerEnabled]) {
    goto LABEL_7;
  }
  switch(a3)
  {
    case 0:
      LOBYTE(v6) = 1;
      break;
    case 1:
      LOBYTE(v6) = +[AMSMetrics flushDelayEnabled];
      break;
    case 2:
      BOOL v6 = !+[AMSMetrics flushDelayEnabled];
      break;
    default:
LABEL_7:
      LOBYTE(v6) = 0;
      break;
  }
  os_unfair_lock_unlock(p_flushModeLock);
  return v6;
}

+ (BOOL)flushTimerEnabled
{
  unsigned __int8 v2 = atomic_load(_global_flush_timer_enabled);
  return v2 & 1;
}

+ (BOOL)flushDelayEnabled
{
  unsigned __int8 v2 = atomic_load(_global_flush_delay_enabled);
  return v2 & 1;
}

- (AMSBagProtocol)bag
{
  p_bagLock = &self->_bagLock;
  os_unfair_lock_lock_with_options();
  double v4 = self->_bag;
  os_unfair_lock_unlock(p_bagLock);
  return v4;
}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    double v4 = +[AMSMetrics sharedTimerQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_75;
    v10[3] = &unk_1E55A3F18;
    uint64_t v5 = *(void *)(a1 + 48);
    void v10[4] = *(void *)(a1 + 32);
    uint64_t v13 = v5;
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v4, v10);
  }
  else
  {
    BOOL v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      BOOL v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      double v9 = [*(id *)(a1 + 32) containerId];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      dispatch_block_t v17 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to get Figaro bag configuration", buf, 0x16u);
    }
  }
}

+ (OS_dispatch_queue)sharedTimerQueue
{
  if (qword_1EB38DD90 != -1) {
    dispatch_once(&qword_1EB38DD90, &__block_literal_global_90_1);
  }
  unsigned __int8 v2 = (void *)qword_1EB38DD98;
  return (OS_dispatch_queue *)v2;
}

- (NSString)containerId
{
  return self->_containerId;
}

id __33__AMSMetrics_enqueueAsyncEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!+[AMSEphemeralDefaults suppressEngagement])
  {
    double v4 = [*(id *)(a1 + 32) engagement];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "suppressEngagement", (void)v16) & 1) == 0)
          {
            id v11 = [v10 underlyingDictionary];
            id v12 = (id)[v4 enqueueData:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "_enqueueFigaroEvents:", v3, (void)v16);
  v14 = [v13 promiseAdapter];

  return v14;
}

- (id)promiseForEnqueueingEvents:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = objc_msgSend(v11, "copy", (void)v16);
          [v12 setTopic:@"xp_amp_ams_error_log"];
          [v5 addObject:v12];
        }
        uint64_t v13 = objc_msgSend(v11, "copy", (void)v16);
        [v5 addObject:v13];

        if (os_variant_has_internal_content()) {
          [(AMSMetrics *)self _showTTRWithEvent:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [(AMSMetrics *)self enqueueAsyncEvents:v5];

  return v14;
}

- (id)enqueueAsyncEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(AMSMetrics *)self _modifiedEvents:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__AMSMetrics_enqueueAsyncEvents___block_invoke;
    v9[3] = &unk_1E559E528;
    v9[4] = self;
    id v6 = [v5 thenWithBlock:v9];
    uint64_t v7 = [v6 binaryPromiseAdapter];
  }
  else
  {
    uint64_t v7 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v7;
}

- (id)_modifiedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMetrics *)self treatmentStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__AMSMetrics__modifiedEvents___block_invoke;
  v10[3] = &unk_1E55A3FE0;
  id v11 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(v4, "ams_mapWithTransform:", v10);

  uint64_t v8 = +[AMSPromise promiseWithAll:v7];

  return v8;
}

- (AMSTreatmentStore)treatmentStore
{
  return self->_treatmentStore;
}

- (AMSEngagement)engagement
{
  p_engagementLock = &self->_engagementLock;
  os_unfair_lock_lock(&self->_engagementLock);
  engagement = self->_engagement;
  if (!engagement)
  {
    id v5 = [AMSEngagement alloc];
    id v6 = [(AMSMetrics *)self bag];
    uint64_t v7 = [(AMSEngagement *)v5 initWithBag:v6];
    uint64_t v8 = self->_engagement;
    self->_engagement = v7;

    engagement = self->_engagement;
  }
  uint64_t v9 = engagement;
  os_unfair_lock_unlock(p_engagementLock);
  return v9;
}

- (void)_flushTimerEnabledChanged
{
}

+ (AMSBagKeySet)bagKeySet
{
  unsigned __int8 v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (double)_flushIntervalWithConfiguration:(id)a3 forEvents:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  double v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      id v12 = [v5 modifierForEvent:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      [v12 flushInterval];
      if ((v10 > v13 || v10 == 0.0) && v13 > 0.0) {
        double v10 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);
  if (v10 == 0.0)
  {
LABEL_17:
    long long v16 = [v5 modifierForEvent:0];
    [v16 flushInterval];
    double v10 = v17;
  }
  return v10;
}

+ (double)timeIntervalFromServerTime:(id)a3
{
  [a3 doubleValue];
  return v3 / 1000.0;
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  p_flushModeLock = &self->_flushModeLock;
  os_unfair_lock_lock_with_options();
  self->_flushTimerEnabled = a3;
  os_unfair_lock_unlock(p_flushModeLock);
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"AMSFlushTimerEnabledNotificationName" object:0];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationDidBecomeActiveNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"AMSFlushTimerEnabledNotificationName" object:0];

  v5.receiver = self;
  v5.super_class = (Class)AMSMetrics;
  [(AMSMetrics *)&v5 dealloc];
}

- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AMSMetrics *)self initWithContainerID:v7 bag:v6 flushTaskClass:objc_opt_class()];

  return v8;
}

- (AMSMetrics)initWithContainerID:(id)a3 bag:(id)a4 flushTaskClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AMSMetrics;
  id v11 = [(AMSMetrics *)&v28 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bag, a4);
    objc_storeStrong((id *)&v12->_containerId, a3);
    double v13 = [[AMSMetricsDatabaseDataSource alloc] initWithContainerIdentifier:v9];
    databaseSource = v12->_databaseSource;
    v12->_databaseSource = v13;

    v12->_destination = 0;
    v12->_engagementLock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unsigned __int8 *)&v12->_flushingDisabled);
    v12->_flushTimerEnabled = 1;
    *(_OWORD *)&v12->_maxBatchSize = xmmword_18DDF4BD0;
    uint64_t v15 = objc_opt_new();
    enqueuedOperations = v12->_enqueuedOperations;
    v12->_enqueuedOperations = (NSMutableArray *)v15;

    *(void *)&v12->_enqueuedOperationsLock._os_unfair_lock_opaque = 0;
    v12->_flushTaskClass = a5;
    v12->_bagLock._os_unfair_lock_opaque = 0;
    double v17 = [[AMSTreatmentStore alloc] initWithCachePolicy:0];
    treatmentStore = v12->_treatmentStore;
    v12->_treatmentStore = v17;

    v12->_includeMMeClientInfoAndDeviceHeaders = 0;
    v12->_metricsSigningFlavour = 0;
    long long v19 = +[AMSProcessInfo currentProcess];
    long long v20 = [v19 executableName];
    char v21 = [v20 isEqualToString:@"StoreKitUIService"];

    v12->_monitorsLifecycleEvents = v21 ^ 1;
    long long v22 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AMSMetrics_initWithContainerID_bag_flushTaskClass___block_invoke;
    block[3] = &unk_1E559EA90;
    id v27 = v10;
    dispatch_async(v22, block);

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v12 selector:sel__applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

    uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v12 selector:sel__flushTimerEnabledChanged name:@"AMSFlushTimerEnabledNotificationName" object:0];

    [(AMSMetrics *)v12 _beginFlushIntervalWithStyle:2 events:0];
  }

  return v12;
}

+ (void)setDisableBackgroundMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 internalInstanceUsingBag:0];
  [v4 setFlushingDisabled:v3];
}

- (void)setFlushingDisabled:(BOOL)a3
{
}

id __53__AMSMetrics_initWithContainerID_bag_flushTaskClass___block_invoke(uint64_t a1)
{
  return +[AMSMetrics internalInstanceUsingBag:*(void *)(a1 + 32)];
}

+ (BOOL)diagnosticsSubmissionAllowed
{
  unsigned __int8 v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(AMSMetrics *)self flushOnDidBecomeActiveBlock];
  if (v4)
  {
    objc_super v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      objc_super v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      id v8 = v7;
      id v9 = AMSLogKey();
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      double v13 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running deferred flush after app became active", (uint8_t *)&v10, 0x16u);
    }
    [(AMSMetrics *)self setFlushOnDidBecomeActiveBlock:0];
    v4[2](v4);
  }
}

- (id)flushOnDidBecomeActiveBlock
{
  return self->_flushOnDidBecomeActiveBlock;
}

+ (void)setFlushTimerEnabled:(BOOL)a3
{
  atomic_store(a3, _global_flush_timer_enabled);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AMSFlushTimerEnabledNotificationName" object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentStore, 0);
  objc_storeStrong((id *)&self->_flushIntervalStartTime, 0);
  objc_storeStrong(&self->_flushIntervalBlock, 0);
  objc_storeStrong(&self->_flushOnDidBecomeActiveBlock, 0);
  objc_storeStrong((id *)&self->_databaseSource, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_currentFlushOperation, 0);
  objc_storeStrong((id *)&self->_enqueuedOperations, 0);
}

void __30__AMSMetrics_sharedTimerQueue__block_invoke()
{
  unsigned __int8 v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppleMediaServices.metricsTimer", v2);
  v1 = (void *)qword_1EB38DD98;
  qword_1EB38DD98 = (uint64_t)v0;
}

uint64_t __39__AMSMetrics_internalInstanceUsingBag___block_invoke(uint64_t a1)
{
  qword_1EB38DD68 = [[AMSMetrics alloc] initWithContainerID:@"com.apple.AppleMediaServices" bag:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)appAnalyticsAllowed
{
  unsigned __int8 v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isAppAnalyticsAllowed];

  return v3;
}

+ (BOOL)disableBackgroundMetrics
{
  unsigned __int8 v2 = [a1 internalInstanceUsingBag:0];
  char v3 = [v2 flushingDisabled];

  return v3;
}

- (BOOL)flushingDisabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_flushingDisabled);
  return v2 & 1;
}

- (int64_t)eventCount
{
  unsigned __int8 v2 = [(AMSMetrics *)self databaseSource];
  int64_t v3 = [v2 eventCount];

  return v3;
}

- (BOOL)flushTimerEnabled
{
  return [(AMSMetrics *)self _scheduledFlushAllowedForStyle:0];
}

- (void)setEngagement:(id)a3
{
  id v4 = (AMSEngagement *)a3;
  os_unfair_lock_lock_with_options();
  engagement = self->_engagement;
  self->_engagement = v4;

  os_unfair_lock_unlock(&self->_engagementLock);
}

+ (void)setFlushDelayEnabled:(BOOL)a3
{
}

- (void)cancel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_enqueuedOperationsLock = &self->_enqueuedOperationsLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentFlushOperation;
  currentFlushOperation = self->_currentFlushOperation;
  self->_currentFlushOperation = 0;

  id v6 = [(NSMutableArray *)self->_enqueuedOperations indexesOfObjectsPassingTest:&__block_literal_global_86];
  id v7 = [(NSMutableArray *)self->_enqueuedOperations objectsAtIndexes:v6];
  [(NSMutableArray *)self->_enqueuedOperations removeObjectsAtIndexes:v6];
  os_unfair_lock_unlock(p_enqueuedOperationsLock);
  id v8 = [(AMSMetricsFlushOperation *)v4 strategy];
  [v8 cancel];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "promise", (void)v17);
        [v14 cancel];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(AMSMetrics *)self _processOperationQueue];
  uint64_t v15 = [(AMSMetrics *)self bag];
  long long v16 = +[AMSMetrics internalInstanceUsingBag:v15];
  [v16 cancel];
}

uint64_t __20__AMSMetrics_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dropEvents
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[AMSLogConfig sharedMetricsConfig];
  if (!v3)
  {
    int64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requested to drop all events from database", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  enqueuedOperations = self->_enqueuedOperations;
  id v8 = +[AMSMetricsOperation dropEventsOperation];
  [(NSMutableArray *)enqueuedOperations addObject:v8];

  os_unfair_lock_unlock(&self->_enqueuedOperationsLock);
  [(AMSMetrics *)self _processOperationQueue];
}

- (id)flush
{
  int64_t v3 = [(AMSMetrics *)self databaseSource];
  id v4 = [(AMSMetrics *)self _flushDataSource:v3 topic:0];

  return v4;
}

- (id)flushTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSMetrics *)self databaseSource];
  id v6 = [(AMSMetrics *)self _flushDataSource:v5 topic:v4];

  return v6;
}

- (id)flushEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[AMSMetricsMemoryDataSource alloc] initWithEvents:v4];

  id v6 = [(AMSMetrics *)self _flushDataSource:v5 topic:0];

  return v6;
}

+ (BOOL)recordAppAnalyticsForEvent:(id)a3 bugType:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 dictionaryForPosting];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v7])
  {
    id v17 = 0;
    id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v17];
    id v9 = v17;
    if (v9)
    {
      uint64_t v10 = +[AMSLogConfig sharedMetricsConfig];
      if (!v10)
      {
        uint64_t v10 = +[AMSLogConfig sharedConfig];
      }
      __int16 v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v12;
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate JSON for OSA log submission. %{public}@", buf, 0x16u);
      }
    }
    if (v8)
    {
      uint64_t v13 = [v5 topic];
      long long v16 = v8;
      id v14 = v8;
      LOBYTE(v8) = OSAWriteLogForSubmission();
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

uint64_t __49__AMSMetrics_recordAppAnalyticsForEvent_bugType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

+ (NSString)bagSubProfile
{
  if (qword_1EB38DD70 != -1) {
    dispatch_once(&qword_1EB38DD70, &__block_literal_global_45_2);
  }
  id v2 = (void *)qword_1EB38DD78;
  return (NSString *)v2;
}

void __27__AMSMetrics_bagSubProfile__block_invoke()
{
  dispatch_queue_t v0 = (void *)qword_1EB38DD78;
  qword_1EB38DD78 = @"AMSCore";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DD80 != -1) {
    dispatch_once(&qword_1EB38DD80, &__block_literal_global_50_0);
  }
  id v2 = (void *)qword_1EB38DD88;
  return (NSString *)v2;
}

void __34__AMSMetrics_bagSubProfileVersion__block_invoke()
{
  dispatch_queue_t v0 = (void *)qword_1EB38DD88;
  qword_1EB38DD88 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  int64_t v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (id)_determineFlushStrategyWithDataSource:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AMSMetrics *)self destination])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(objc_class *)self->_flushTaskClass alloc];
    uint64_t v10 = [(AMSMetrics *)self bag];
    id v8 = [(objc_class *)v9 initWithDataSource:v6 bag:v10];

    [(objc_class *)v8 setMaxBatchSize:[(AMSMetrics *)self maxBatchSize]];
    [(objc_class *)v8 setMaxRequestCount:[(AMSMetrics *)self maxRequestCount]];
    [(objc_class *)v8 setTopic:v7];
    [(objc_class *)v8 setIncludeMMeClientInfoAndDeviceHeaders:[(AMSMetrics *)self includeMMeClientInfoAndDeviceHeaders]];
    [(objc_class *)v8 setMetricsSigningFlavour:[(AMSMetrics *)self metricsSigningFlavour]];
  }

  return v8;
}

- (id)_flushDataSource:(id)a3 topic:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(AMSMetrics *)self _determineFlushStrategyWithDataSource:v7 topic:v6];

  os_unfair_lock_lock_with_options();
  enqueuedOperations = self->_enqueuedOperations;
  __int16 v11 = +[AMSMetricsOperation flushOperationWithStrategy:v9 promise:v8];
  [(NSMutableArray *)enqueuedOperations addObject:v11];

  os_unfair_lock_unlock(&self->_enqueuedOperationsLock);
  [(AMSMetrics *)self _processOperationQueue];

  return v8;
}

- (void)_processOperationQueue
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  p_enqueuedOperationsLock = &self->_enqueuedOperationsLock;
  os_unfair_lock_lock_with_options();
  if (self->_currentFlushOperation)
  {
    os_unfair_lock_unlock(p_enqueuedOperationsLock);
    return;
  }
  if ([(NSMutableArray *)self->_enqueuedOperations count])
  {
    if ([(AMSMetrics *)self flushingDisabled])
    {
      id v4 = [(NSMutableArray *)self->_enqueuedOperations indexesOfObjectsPassingTest:&__block_literal_global_57_1];
      id v5 = [(NSMutableArray *)self->_enqueuedOperations objectsAtIndexes:v4];
      [(NSMutableArray *)self->_enqueuedOperations removeObjectsAtIndexes:v4];
    }
    else
    {
      id v5 = 0;
    }
    id v6 = [(NSMutableArray *)self->_enqueuedOperations firstObject];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [(AMSMetrics *)self databaseSource];
        [v7 removeAllEvents];
      }
      uint64_t v8 = [(NSMutableArray *)self->_enqueuedOperations indexOfObjectPassingTest:&__block_literal_global_60_0];
      enqueuedOperations = self->_enqueuedOperations;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)enqueuedOperations removeObjectsInRange:0];
        uint64_t v10 = [(NSMutableArray *)self->_enqueuedOperations firstObject];
        [(NSMutableArray *)self->_enqueuedOperations removeObjectAtIndex:0];
        objc_storeStrong((id *)&self->_currentFlushOperation, v10);
        goto LABEL_19;
      }
      [(NSMutableArray *)enqueuedOperations removeAllObjects];
    }
    uint64_t v10 = 0;
LABEL_19:
    os_unfair_lock_unlock(p_enqueuedOperationsLock);
    __int16 v11 = +[AMSMetrics sharedTimerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__AMSMetrics__processOperationQueue__block_invoke_3;
    block[3] = &unk_1E559EA90;
    void block[4] = self;
    dispatch_async(v11, block);

    if ([v5 count])
    {
      uint64_t v12 = +[AMSLogConfig sharedMetricsConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v14;
        __int16 v44 = 2114;
        uint64_t v45 = v15;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flushing disabled", buf, 0x16u);
      }
      long long v16 = AMSError(11, @"Metrics Flush Failed", @"Flush disabled", 0);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v17 = v5;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [*(id *)(*((void *)&v37 + 1) + 8 * i) promise];
            [v22 finishWithError:v16];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v48 count:16];
        }
        while (v19);
      }
    }
    if (v10)
    {
      v23 = +[AMSLogConfig sharedMetricsConfig];
      if (!v23)
      {
        v23 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = objc_opt_class();
        id v33 = v25;
        v26 = AMSLogKey();
        id v27 = [(AMSMetrics *)self containerId];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = (uint64_t)v25;
        __int16 v44 = 2114;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Flushing events for container: %{public}@", buf, 0x20u);
      }
      objc_super v28 = [v10 strategy];
      v29 = [v28 performFlush];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __36__AMSMetrics__processOperationQueue__block_invoke_67;
      v35[3] = &unk_1E559E578;
      v35[4] = self;
      id v30 = v10;
      id v36 = v30;
      v31 = [v29 thenWithBlock:v35];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __36__AMSMetrics__processOperationQueue__block_invoke_72;
      v34[3] = &unk_1E559EE78;
      v34[4] = self;
      [v31 addFinishBlock:v34];
      uint64_t v32 = [v30 promise];
      [v32 finishWithPromise:v31];
    }
    return;
  }
  os_unfair_lock_unlock(p_enqueuedOperationsLock);
  [(AMSMetrics *)self _beginFlushIntervalWithStyle:2 events:0];
}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __36__AMSMetrics__processOperationQueue__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushIntervalInvalidate];
}

id __36__AMSMetrics__processOperationQueue__block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[AMSMetrics flushTimerEnabled]) {
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) bag];
  id v5 = +[AMSMetrics internalInstanceUsingBag:v4];

  if (v5 == *(void **)(a1 + 32)
    || ([*(id *)(a1 + 40) strategy],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isCancelled],
        v6,
        v7))
  {

LABEL_5:
    uint64_t v8 = +[AMSPromise promiseWithResult:v3];
    goto LABEL_6;
  }
  uint64_t v10 = [v5 flush];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__AMSMetrics__processOperationQueue__block_invoke_2_68;
  v11[3] = &unk_1E559E6F8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v8 = [v10 continueWithBlock:v11];

LABEL_6:
  return v8;
}

id __36__AMSMetrics__processOperationQueue__block_invoke_2_68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    int v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to flush internal metrics. Error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v10 = +[AMSPromise promiseWithResult:*(void *)(a1 + 40)];

  return v10;
}

void __36__AMSMetrics__processOperationQueue__block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedMetricsConfig];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      int v12 = AMSLogKey();
      int v20 = 138544130;
      id v21 = v10;
      __int16 v22 = 2114;
      v23 = v12;
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2114;
      id v27 = v6;
      uint64_t v13 = "%{public}@: [%{public}@] Flush failed. count: %@ error: %{public}@";
      __int16 v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 42;
LABEL_10:
      _os_log_impl(&dword_18D554000, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (!v7)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_opt_class();
      id v11 = v17;
      int v12 = AMSLogKey();
      int v20 = 138543874;
      id v21 = v17;
      __int16 v22 = 2114;
      v23 = v12;
      __int16 v24 = 2112;
      id v25 = v5;
      uint64_t v13 = "%{public}@: [%{public}@] Successfully flushed %@ events";
      __int16 v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 32;
      goto LABEL_10;
    }
  }

  os_unfair_lock_lock_with_options();
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 16);
  *(void *)(v18 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 32) _processOperationQueue];
}

void __50__AMSMetrics__beginFlushIntervalWithStyle_events___block_invoke_77(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _handleFlushIntervalWithStyle:*(void *)(a1 + 40)];
    id v3 = (void *)v4[17];
    v4[17] = 0;

    WeakRetained = v4;
  }
}

- (void)_flushIntervalInvalidate
{
  id v3 = +[AMSMetrics sharedTimerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AMSMetrics *)self flushIntervalBlock];

  if (v4)
  {
    id v5 = [(AMSMetrics *)self flushIntervalBlock];
    dispatch_block_cancel(v5);

    [(AMSMetrics *)self setFlushIntervalBlock:0];
  }
}

- (void)_handleFlushIntervalWithStyle:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSMetrics sharedTimerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = AMSSetLogKey(0);
  uint64_t v7 = +[AMSLogConfig sharedMetricsConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduled flush fired", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke;
  aBlock[3] = &unk_1E55A3EF0;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a3;
  int v12 = (void (**)(void))_Block_copy(aBlock);
  Class v13 = NSClassFromString(&cfstr_Uiapplication.isa);
  NSSelectorFromString(&cfstr_Sharedapplicat.isa);
  if (objc_opt_respondsToSelector())
  {
    __int16 v14 = (void *)MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_2;
    v21[3] = &unk_1E55A3F90;
    v21[4] = self;
    Class v23 = v13;
    __int16 v22 = v12;
    uint32_t v16 = v21;
    id v17 = v14;
    uint64_t v18 = AMSLogKey();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_3;
    uint64_t v28 = &unk_1E559EAE0;
    id v29 = v18;
    id v30 = v16;
    id v19 = v18;
    int v20 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], buf);
  }
  else
  {
    v12[2](v12);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _scheduledFlushAllowedForStyle:*(void *)(a1 + 40)])
  {
    id v4 = [WeakRetained flush];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_79;
    v9[3] = &unk_1E55A3F68;
    objc_copyWeak(&v10, v2);
    [v4 addFinishBlock:v9];
    objc_destroyWeak(&v10);
  }
  else
  {
    id v4 = +[AMSLogConfig sharedMetricsConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = v6;
      uint64_t v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      int v12 = v6;
      __int16 v13 = 2114;
      __int16 v14 = v8;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping flush trigger", buf, 0x16u);
    }
  }
}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_79(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _beginFlushIntervalWithStyle:2 events:0];
}

void __44__AMSMetrics__handleFlushIntervalWithStyle___block_invoke_2(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a1[4] monitorsLifecycleEvents]) {
    goto LABEL_9;
  }
  uint64_t v2 = [a1[6] sharedApplication];
  if (!v2) {
    goto LABEL_9;
  }
  id v3 = (void *)v2;
  id v4 = [a1[6] sharedApplication];
  uint64_t v5 = [v4 applicationState];

  if (v5)
  {
    id v6 = +[AMSLogConfig sharedMetricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = v8;
      id v10 = AMSLogKey();
      *(_DWORD *)uint32_t v16 = 138543618;
      *(void *)&v16[4] = v8;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduled flush unable to run while app is inactive", v16, 0x16u);
    }
    [a1[4] setFlushOnDidBecomeActiveBlock:a1[5]];
  }
  else
  {
LABEL_9:
    id v11 = +[AMSMetrics sharedTimerQueue];
    id v12 = a1[5];
    __int16 v13 = AMSLogKey();
    *(void *)uint32_t v16 = MEMORY[0x1E4F143A8];
    *(void *)&v16[8] = 3221225472;
    *(void *)&v16[16] = __AMSDispatchAsync_block_invoke_3;
    id v17 = &unk_1E559EAE0;
    id v18 = v13;
    id v19 = v12;
    id v14 = v13;
    id v15 = v12;
    dispatch_async(v11, v16);
  }
}

- (void)_showTTRWithEvent:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 topic];
  int v5 = [&unk_1EDD01990 containsObject:v4];

  if (v5)
  {
    id v6 = [v3 propertyForBodyKey:@"userId"];
    uint64_t v7 = [v3 propertyForBodyKey:@"clientId"];
    uint64_t v8 = (void *)v7;
    if (!v6 || !v7) {
      goto LABEL_27;
    }
    id v9 = +[AMSDefaults ttrMetricsClickStreamUserIdHistory];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [v3 topic];
    id v12 = [v10 valueForKey:v11];

    objc_opt_class();
    v70 = v12;
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = (void *)[v12 mutableCopy];
    }
    else {
      __int16 v13 = objc_opt_new();
    }
    id v14 = v13;
    id v15 = [v13 objectForKeyedSubscript:@"clientId"];
    uint32_t v16 = [v14 objectForKeyedSubscript:@"userIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v14 objectForKeyedSubscript:@"userIds"];
      id v18 = (void *)[v17 mutableCopy];
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CA48] array];
    }

    if (([v15 isEqualToString:v8] & 1) == 0)
    {
      [v18 removeAllObjects];
      id v19 = v8;

      id v15 = v19;
    }
    uint64_t v20 = [v18 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = [v18 lastObject];

      if (v21)
      {
        if (([v21 isEqualToString:v6] & 1) == 0)
        {
          v69 = v21;
          [v18 addObject:v6];
          __int16 v22 = [v3 topic];
          int v23 = [v22 isEqualToString:@"xp_ase_appstore_ue"];

          if (v23)
          {
            id v21 = v69;
            if ([v69 length] != 35 || objc_msgSend(v6, "length") != 24) {
              goto LABEL_26;
            }
            v64 = NSString;
            __int16 v24 = AMSLogKey();
            v65 = id v25 = [v3 eventTime];

            LODWORD(v25) = +[AMSUnitTests isRunningUnitTests];
            uint64_t v26 = +[AMSLogConfig sharedConfig];
            id v27 = (void *)v26;
            if (v25)
            {
              if (!v26)
              {
                id v27 = +[AMSLogConfig sharedConfig];
              }
              uint64_t v28 = [v27 OSLogObject];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v29 = v28;
                uint64_t v30 = objc_opt_class();
                AMSLogKey();
                uint64_t v31 = v60 = v27;
                *(_DWORD *)buf = 138543874;
                uint64_t v72 = v30;
                uint64_t v28 = v29;
                __int16 v73 = 2114;
                v74 = v31;
                __int16 v75 = 2114;
                v76 = v65;
                _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

                id v27 = v60;
              }

              uint64_t v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
              id v33 = +[AMSLogConfig sharedConfig];
              [v32 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v33 userInfo:0];
              unint64_t v34 = 0x1E4F29000;
            }
            else
            {
              if (!v26)
              {
                id v27 = +[AMSLogConfig sharedConfig];
              }
              v63 = v27;
              log = [v27 OSLogObject];
              if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
              {
                uint64_t v48 = objc_opt_class();
                uint64_t v49 = AMSLogKey();
                *(_DWORD *)buf = 138543874;
                uint64_t v72 = v48;
                __int16 v73 = 2114;
                v74 = v49;
                __int16 v75 = 2114;
                v76 = v65;
                id v33 = log;
                _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_FAULT, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

                unint64_t v34 = 0x1E4F29000;
              }
              else
              {
                unint64_t v34 = 0x1E4F29000uLL;
                id v33 = log;
              }
              uint64_t v32 = v63;
            }

            v53 = *(void **)(v34 + 24);
            v54 = +[AMSDevice buildVersion];
            v55 = [v53 stringWithFormat:@"[%@] Device-generated KID flip-flop detected in App Store clickstream", v54];
            +[AMSTapToRadar openWithTitle:v55 description:v65 classification:5 reproducibility:4 keywordIds:0];

            goto LABEL_50;
          }
          if ((unint64_t)[v18 count] < 3)
          {
LABEL_50:
            id v21 = v69;
            goto LABEL_26;
          }
          v61 = NSString;
          v66 = [v3 topic];
          id v36 = [v3 topic];
          long long v37 = AMSLogKey();
          v62 = os_log_t loga = [v3 eventTime];

          LODWORD(v37) = +[AMSUnitTests isRunningUnitTests];
          uint64_t v38 = +[AMSLogConfig sharedConfig];
          long long v39 = v38;
          if (v37)
          {
            if (!v38)
            {
              long long v39 = +[AMSLogConfig sharedConfig];
            }
            long long v40 = [v39 OSLogObject];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              long long v41 = v40;
              uint64_t v42 = objc_opt_class();
              AMSLogKey();
              uint64_t v43 = logb = v39;
              *(_DWORD *)buf = 138543874;
              uint64_t v72 = v42;
              long long v40 = v41;
              __int16 v73 = 2114;
              v74 = v43;
              __int16 v75 = 2114;
              v76 = v62;
              _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

              long long v39 = logb;
            }

            long long v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
            __int16 v44 = +[AMSLogConfig sharedConfig];
            [v39 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v44 userInfo:0];
          }
          else
          {
            if (!v38)
            {
              long long v39 = +[AMSLogConfig sharedConfig];
            }
            v67 = [v39 OSLogObject];
            if (!os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
            {
              unint64_t v47 = 0x1E4F29000uLL;
              __int16 v44 = v67;
              goto LABEL_47;
            }
            uint64_t v45 = objc_opt_class();
            AMSLogKey();
            __int16 v46 = logc = v39;
            *(_DWORD *)buf = 138543874;
            uint64_t v72 = v45;
            __int16 v73 = 2114;
            v74 = v46;
            __int16 v75 = 2114;
            __int16 v44 = v67;
            v76 = v62;
            _os_log_impl(&dword_18D554000, v67, OS_LOG_TYPE_FAULT, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

            long long v39 = logc;
          }
          unint64_t v47 = 0x1E4F29000;
LABEL_47:

          __int16 v50 = *(void **)(v47 + 24);
          v68 = +[AMSDevice buildVersion];
          __int16 v52 = v51 = [v3 topic];
          +[AMSTapToRadar openWithTitle:v52 description:v62 classification:5 reproducibility:4 keywordIds:0];

          goto LABEL_50;
        }
LABEL_26:
        [v14 setObject:v18 forKeyedSubscript:@"userIds"];
        [v14 setObject:v15 forKeyedSubscript:@"clientId"];
        id v35 = [v3 topic];
        [v10 setObject:v14 forKeyedSubscript:v35];

        +[AMSDefaults setTtrMetricsClickStreamUserIdHistory:v10];
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
    }
    [v18 addObject:v6];
    id v21 = 0;
    goto LABEL_26;
  }
LABEL_28:
}

- (AMSMetrics)initWithContainerId:(id)a3 bagContract:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[AMSContractBagShim alloc] initWithBagContract:v6];

  id v9 = [(AMSMetrics *)self initWithContainerID:v7 bag:v8];
  return v9;
}

- (AMSMetricsBagContract)bagContract
{
  id v3 = [AMSDeprecatedBagContract alloc];
  id v4 = [(AMSMetrics *)self bag];
  int v5 = [(AMSDeprecatedBagContract *)v3 initWithBag:v4];

  return (AMSMetricsBagContract *)v5;
}

- (void)setBagContract:(id)a3
{
  id v4 = a3;
  int v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];

  [(AMSMetrics *)self setBag:v5];
}

- (BOOL)includeMMeClientInfoAndDeviceHeaders
{
  return self->_includeMMeClientInfoAndDeviceHeaders;
}

- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_includeMMeClientInfoAndDeviceHeaders = a3;
}

- (int64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (void)setMaxBatchSize:(int64_t)a3
{
  self->_maxBatchSize = a3;
}

- (int64_t)maxRequestCount
{
  return self->_maxRequestCount;
}

- (void)setMaxRequestCount:(int64_t)a3
{
  self->_maxRequestCount = a3;
}

- (unint64_t)metricsSigningFlavour
{
  return self->_metricsSigningFlavour;
}

- (void)setMetricsSigningFlavour:(unint64_t)a3
{
  self->_metricsSigningFlavour = a3;
}

- (BOOL)monitorsLifecycleEvents
{
  return self->_monitorsLifecycleEvents;
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  self->_monitorsLifecycleEvents = a3;
}

- (void)setDatabaseSource:(id)a3
{
}

- (int64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(int64_t)a3
{
  self->_destination = a3;
}

- (os_unfair_lock_s)engagementLock
{
  return self->_engagementLock;
}

- (void)setEngagementLock:(os_unfair_lock_s)a3
{
  self->_engagementLock = a3;
}

- (void)setFlushOnDidBecomeActiveBlock:(id)a3
{
}

- (id)flushIntervalBlock
{
  return self->_flushIntervalBlock;
}

- (void)setFlushIntervalBlock:(id)a3
{
}

- (NSDate)flushIntervalStartTime
{
  return self->_flushIntervalStartTime;
}

- (void)setFlushIntervalStartTime:(id)a3
{
}

- (void)setTreatmentStore:(id)a3
{
}

@end