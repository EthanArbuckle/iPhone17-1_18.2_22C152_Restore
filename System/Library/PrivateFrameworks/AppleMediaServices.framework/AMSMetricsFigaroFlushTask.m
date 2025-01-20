@interface AMSMetricsFigaroFlushTask
- (AMSBagProtocol)bag;
- (AMSMetricsDataSource)dataSource;
- (AMSMetricsFigaroFlushTask)initWithDataSource:(id)a3 bag:(id)a4;
- (AMSURLSession)URLSession;
- (BOOL)_shouldClearEventsDespiteError:(id)a3 result:(id)a4;
- (BOOL)cancel;
- (BOOL)includeMMeClientInfoAndDeviceHeaders;
- (NSString)topic;
- (id)_flushNextBatchWithMaxRequestCount:(unint64_t)a3 topic:(id)a4 maxBatchSize:(int64_t)a5 requestCount:(unint64_t)a6 flushedEventCount:(unint64_t)a7 config:(id)a8;
- (id)_mescalSignatureWithBodyData:(id)a3 error:(id *)a4;
- (id)_nextBatchWithConfig:(id)a3 topic:(id)a4 maxBatchSize:(int64_t)a5;
- (id)_postBatch:(id)a3;
- (id)performFlush;
- (int64_t)maxBatchSize;
- (int64_t)maxRequestCount;
- (unint64_t)metricsSigningFlavour;
- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3;
- (void)setMaxBatchSize:(int64_t)a3;
- (void)setMaxRequestCount:(int64_t)a3;
- (void)setMetricsSigningFlavour:(unint64_t)a3;
- (void)setTopic:(id)a3;
@end

@implementation AMSMetricsFigaroFlushTask

- (AMSMetricsFigaroFlushTask)initWithDataSource:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSMetricsFigaroFlushTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
    v10->_maxBatchSize = 500;
    v10->_maxRequestCount = 50;
    v10->_currentCancellableDataTaskPromiseLock._os_unfair_lock_opaque = 0;
    v10->_includeMMeClientInfoAndDeviceHeaders = 0;
    v10->_metricsSigningFlavour = 0;
  }

  return v10;
}

- (AMSURLSession)URLSession
{
  URLSession = self->_URLSession;
  if (!URLSession)
  {
    v4 = (void *)MEMORY[0x1E4F18DD0];
    v5 = +[AMSProcessInfo currentProcess];
    v6 = [(AMSMetricsFigaroFlushTask *)self bag];
    id v7 = objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", v5, v6);

    [v7 setURLCache:0];
    [v7 setRequestCachePolicy:1];
    id v8 = [[AMSURLSession alloc] initWithConfiguration:v7];
    v9 = self->_URLSession;
    self->_URLSession = v8;

    URLSession = self->_URLSession;
  }
  return URLSession;
}

- (BOOL)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedMetricsConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling task", buf, 0xCu);
  }
  v6 = [(AMSMetricsFigaroFlushTask *)self dataSource];
  [v6 cancel];

  p_currentCancellableDataTaskPromiseLock = &self->_currentCancellableDataTaskPromiseLock;
  os_unfair_lock_lock_with_options();
  [(AMSPromise *)self->_currentCancellableDataTaskPromise cancel];
  v10.receiver = self;
  v10.super_class = (Class)AMSMetricsFigaroFlushTask;
  BOOL v8 = [(AMSTask *)&v10 cancel];
  os_unfair_lock_unlock(p_currentCancellableDataTaskPromiseLock);
  return v8;
}

- (id)performFlush
{
  int64_t v3 = [(AMSMetricsFigaroFlushTask *)self maxRequestCount];
  v4 = [(AMSMetricsFigaroFlushTask *)self topic];
  int64_t v5 = [(AMSMetricsFigaroFlushTask *)self maxBatchSize];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke;
  v9[3] = &unk_1E55A4578;
  v9[4] = self;
  id v10 = v4;
  int64_t v11 = v3;
  int64_t v12 = v5;
  id v6 = v4;
  id v7 = [(AMSTask *)self performTaskWithPromiseBlock:v9];

  return v7;
}

id __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bag];
  int64_t v3 = +[AMSMetricsFigaroBagConfguration configurationPromiseWithBag:v2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke_2;
  v10[3] = &unk_1E55A4550;
  int64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v10[4] = *(void *)(a1 + 32);
  uint64_t v12 = v4;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 56);
  id v11 = v6;
  uint64_t v13 = v7;
  BOOL v8 = [v3 thenWithBlock:v10];

  return v8;
}

id __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 prepareForFlush];
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  int64_t v5 = AMSLogKey();
  id v10 = 0;
  char v6 = [v4 willStartBatchingWithLogKey:v5 error:&v10];
  id v7 = v10;

  if (v6) {
    [*(id *)(a1 + 32) _flushNextBatchWithMaxRequestCount:*(void *)(a1 + 48) topic:*(void *)(a1 + 40) maxBatchSize:*(void *)(a1 + 56) requestCount:0 flushedEventCount:0 config:v3];
  }
  else {
  BOOL v8 = +[AMSPromise promiseWithError:v7];
  }

  return v8;
}

- (id)_flushNextBatchWithMaxRequestCount:(unint64_t)a3 topic:(id)a4 maxBatchSize:(int64_t)a5 requestCount:(unint64_t)a6 flushedEventCount:(unint64_t)a7 config:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  v16 = objc_opt_new();
  if (a3 - 1 >= a6)
  {
    v19 = [(AMSMetricsFigaroFlushTask *)self _nextBatchWithConfig:v15 topic:v14 maxBatchSize:a5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke;
    v22[3] = &unk_1E55A45C8;
    v22[4] = self;
    unint64_t v25 = a7;
    unint64_t v26 = a3;
    id v23 = v14;
    int64_t v27 = a5;
    unint64_t v28 = a6;
    id v24 = v15;
    v20 = [v19 continueWithBlock:v22];
    [v16 finishWithPromise:v20];
  }
  else
  {
    v17 = [(AMSMetricsFigaroFlushTask *)self dataSource];
    [v17 didFinishBatching];

    v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [v16 finishWithResult:v18];
  }
  return v16;
}

id __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v15 = [*(id *)(a1 + 32) dataSource];
    [v15 didFinishBatching];

    v16 = +[AMSPromise promiseWithError:v5];
    goto LABEL_19;
  }
  char v6 = [a2 value];
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 droppedEvents];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) dataSource];
      id v11 = [v7 droppedEvents];
      id v42 = 0;
      char v12 = [v10 removeEvents:v11 error:&v42];
      id v13 = v42;

      if ((v12 & 1) == 0)
      {
LABEL_11:
        id v24 = [*(id *)(a1 + 32) dataSource];
        [v24 didFinishBatching];

        uint64_t v25 = +[AMSPromise promiseWithError:v13];
        goto LABEL_16;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    v19 = [v7 skippedEvents];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v21 = [*(id *)(a1 + 32) dataSource];
      v22 = [v7 skippedEvents];
      id v41 = v14;
      char v23 = [v21 skipEvents:v22 error:&v41];
      id v13 = v41;

      if ((v23 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      id v13 = v14;
    }
    unint64_t v26 = [v7 events];
    uint64_t v27 = [v26 count];

    unint64_t v28 = *(void **)(a1 + 32);
    if (v27)
    {
      v29 = [v28 _postBatch:v7];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke_2;
      v34[3] = &unk_1E55A45A0;
      v34[4] = *(void *)(a1 + 32);
      id v30 = v7;
      uint64_t v31 = *(void *)(a1 + 64);
      id v35 = v30;
      uint64_t v38 = v31;
      id v36 = *(id *)(a1 + 40);
      long long v39 = *(_OWORD *)(a1 + 72);
      v32 = *(void **)(a1 + 48);
      uint64_t v40 = *(void *)(a1 + 56);
      id v37 = v32;
      v16 = [v29 continueWithBlock:v34];

LABEL_17:
      goto LABEL_18;
    }
    uint64_t v25 = [v28 _flushNextBatchWithMaxRequestCount:*(void *)(a1 + 64) topic:*(void *)(a1 + 40) maxBatchSize:*(void *)(a1 + 72) requestCount:*(void *)(a1 + 80) flushedEventCount:*(void *)(a1 + 56) config:*(void *)(a1 + 48)];
LABEL_16:
    v16 = (void *)v25;
    goto LABEL_17;
  }
  v17 = [*(id *)(a1 + 32) dataSource];
  [v17 didFinishBatching];

  v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v16 = +[AMSPromise promiseWithResult:v18];

LABEL_18:
LABEL_19:

  return v16;
}

id __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && ![*(id *)(a1 + 32) _shouldClearEventsDespiteError:v6 result:v5]) {
    goto LABEL_4;
  }
  id v7 = [*(id *)(a1 + 32) dataSource];
  BOOL v8 = [*(id *)(a1 + 40) events];
  id v20 = v6;
  [v7 removeEvents:v8 error:&v20];
  id v9 = v20;

  id v6 = v9;
  if (v9)
  {
LABEL_4:
    id v10 = [*(id *)(a1 + 32) dataSource];
    [v10 didFinishBatching];

    uint64_t v11 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 88);
    uint64_t v16 = *(void *)(a1 + 80) + 1;
    v17 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) events];
    uint64_t v11 = objc_msgSend(v17, "_flushNextBatchWithMaxRequestCount:topic:maxBatchSize:requestCount:flushedEventCount:config:", v13, v12, v14, v16, objc_msgSend(v6, "count") + v15, *(void *)(a1 + 56));
  }
  v18 = (void *)v11;

  return v18;
}

- (id)_mescalSignatureWithBodyData:(id)a3 error:(id *)a4
{
  id v6 = objc_msgSend(a3, "ams_SHA1");
  if ([v6 length])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = AMSError(304, @"Metrics Mescal Failed", @"Failed to generate digest", 0);
  }
  uint64_t v8 = 0;
  if (v6 && !v7)
  {
    id v9 = [(AMSMetricsFigaroFlushTask *)self bag];
    id v12 = 0;
    id v10 = +[AMSMescal signatureFromData:v6 type:1 bag:v9 error:&v12];
    uint64_t v7 = (uint64_t)v12;

    uint64_t v8 = 0;
    if (!v7 && v10)
    {
      uint64_t v8 = [v10 base64EncodedStringWithOptions:0];
    }
  }
  if (!(v8 | v7))
  {
    uint64_t v7 = AMSError(304, @"Metrics Mescal Failed", @"Signature is nil", 0);
  }
  if (v7)
  {

    uint64_t v8 = 0;
    if (a4) {
      *a4 = (id) v7;
    }
  }

  return (id)v8;
}

- (id)_nextBatchWithConfig:(id)a3 topic:(id)a4 maxBatchSize:(int64_t)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = +[AMSDefaults metricsCanaryIdentifier];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__46;
  v50[4] = __Block_byref_object_dispose__46;
  id v51 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__46;
  v48 = __Block_byref_object_dispose__46;
  id v49 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__46;
  v42[4] = __Block_byref_object_dispose__46;
  id v43 = 0;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [(AMSMetricsFigaroFlushTask *)self dataSource];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke;
  v32[3] = &unk_1E55A45F0;
  uint64_t v38 = &v44;
  id v15 = v8;
  id v33 = v15;
  v34 = self;
  id v16 = v10;
  id v35 = v16;
  id v17 = v11;
  id v36 = v17;
  long long v39 = v50;
  id v18 = v13;
  id v37 = v18;
  uint64_t v40 = v42;
  int64_t v41 = a5;
  [v14 enumerateSortedEventsForTopic:v9 block:v32];

  if (v45[5])
  {
    v19 = +[AMSLogConfig sharedMetricsConfig];
    if (!v19)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = (id)objc_opt_class();
      v22 = AMSLogKey();
      uint64_t v23 = v45[5];
      *(_DWORD *)buf = 138543874;
      id v53 = v21;
      __int16 v54 = 2114;
      v55 = v22;
      __int16 v56 = 2114;
      uint64_t v57 = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch next batch. Error = %{public}@", buf, 0x20u);
    }
    id v24 = +[AMSPromise promiseWithError:v45[5]];
  }
  else
  {
    uint64_t v25 = +[AMSPromise promiseWithSome:v18];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_80;
    v27[3] = &unk_1E55A4658;
    id v28 = v12;
    id v29 = v16;
    id v30 = v17;
    uint64_t v31 = v42;
    id v24 = [v25 thenWithBlock:v27];
  }
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v50, 8);

  return v24;
}

void __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x192FA47D0]();
  if (!v11)
  {
    uint64_t v13 = [*(id *)(a1 + 32) modifierForEvent:v9];
    uint64_t v14 = [v13 reportingURLForEvent:v9];
    if (([v13 shouldDropEvent:v9] & 1) != 0 || !objc_msgSend(v14, "length"))
    {
      if (![v14 length])
      {
        id v16 = +[AMSLogConfig sharedMetricsConfig];
        if (!v16)
        {
          id v16 = +[AMSLogConfig sharedConfig];
        }
        id v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = objc_opt_class();
          id v24 = AMSLogKey();
          [v9 topic];
          *(_DWORD *)buf = 138543874;
          uint64_t v26 = v23;
          __int16 v27 = 2114;
          id v28 = v24;
          uint64_t v30 = v29 = 2114;
          id v18 = (void *)v30;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dropping event with no reporting URL. Topic: %{public}@", buf, 0x20u);
        }
      }
      id v15 = *(void **)(a1 + 48);
    }
    else
    {
      if (![v13 shouldSkipEvent:v9])
      {
        v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        if (v19) {
          int v20 = [v19 isEqualToString:v10] ^ 1;
        }
        else {
          int v20 = 0;
        }
        if ((unint64_t)[*(id *)(a1 + 64) count] >= *(void *)(a1 + 96) || v20)
        {
          *a5 = 1;
        }
        else
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v14);
          id v21 = *(void **)(a1 + 64);
          v22 = [v13 preparedEventPromiseWithEvent:v9];
          [v21 addObject:v22];
        }
        goto LABEL_15;
      }
      id v15 = *(void **)(a1 + 56);
    }
    objc_msgSend(v15, "addObject:", v9, v23);
LABEL_15:

    goto LABEL_16;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a4);
  *a5 = 1;
LABEL_16:
}

id __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "ams_firstObjectPassingTest:", &__block_literal_global_90);

  id v5 = [v3 lastObject];
  id v6 = [v5 account];
  uint64_t v7 = [v5 isAnonymous];
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = [v5 canaryIdentifier];
    id v11 = (void *)v10;
    id v12 = &stru_1EDCA7308;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    id v9 = v12;
  }
  uint64_t v13 = objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_87);
  if ([v3 count] || objc_msgSend(*(id *)(a1 + 40), "count") || objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    BOOL v14 = v4 != 0;
    id v15 = objc_alloc_init(AMSMetricsBatch);
    [(AMSMetricsBatch *)v15 setAccount:v6];
    [(AMSMetricsBatch *)v15 setAnonymous:v7];
    [(AMSMetricsBatch *)v15 setCanaryIdentifier:v9];
    [(AMSMetricsBatch *)v15 setContainsLoadURL:v14];
    [(AMSMetricsBatch *)v15 setDroppedEvents:*(void *)(a1 + 40)];
    [(AMSMetricsBatch *)v15 setEvents:v3];
    [(AMSMetricsBatch *)v15 setEventDictionaries:v13];
    [(AMSMetricsBatch *)v15 setSkippedEvents:*(void *)(a1 + 48)];
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
      [(AMSMetricsBatch *)v15 setReportURL:v16];
    }
  }
  else
  {
    id v15 = 0;
  }
  id v17 = [[AMSOptional alloc] initWithValue:v15];
  id v18 = +[AMSPromise promiseWithResult:v17];

  return v18;
}

uint64_t __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventType];
  uint64_t v3 = [v2 isEqualToString:@"loadUrl"];

  return v3;
}

uint64_t __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryForPosting];
}

- (id)_postBatch:(id)a3
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedMetricsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v48 = v7;
    __int16 v49 = 2114;
    v50 = v8;
    __int16 v51 = 1024;
    LODWORD(v52) = [v4 anonymous];
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting batch. (anon:%d)", buf, 0x1Cu);
  }
  v54[0] = &unk_1EDD01B38;
  v53[0] = @"deliveryVersion";
  v53[1] = @"postTime";
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = +[AMSMetrics serverTimeFromDate:v9];
  v54[1] = v10;
  v53[2] = @"events";
  id v11 = [v4 eventDictionaries];
  v54[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];

  id v46 = 0;
  uint64_t v13 = +[AMSData dataWithObject:v12 encoding:3 error:&v46];
  id v14 = v46;
  id v15 = v14;
  if (!v13 || v14)
  {
    if (!v14)
    {
      id v15 = AMSError(3, @"No Metrics Body", @"Unable to post nil metrics body", 0);
    }
    id v16 = +[AMSPromise promiseWithError:v15];
  }
  else
  {
    id v15 = +[AMSData compressedGzippedDataWithData:v13];
    if (v15)
    {
      long long v39 = v12;
      if ([(AMSMetricsFigaroFlushTask *)self metricsSigningFlavour])
      {
        uint64_t v37 = 0;
      }
      else
      {
        id v45 = 0;
        uint64_t v37 = [(AMSMetricsFigaroFlushTask *)self _mescalSignatureWithBodyData:v13 error:&v45];
        id v18 = v45;
        if (v18)
        {
          v19 = +[AMSLogConfig sharedMetricsConfig];
          if (!v19)
          {
            v19 = +[AMSLogConfig sharedConfig];
          }
          int v20 = objc_msgSend(v19, "OSLogObject", v37);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = objc_opt_class();
            v22 = AMSLogKey();
            *(_DWORD *)buf = 138543874;
            uint64_t v48 = v21;
            __int16 v49 = 2114;
            v50 = v22;
            __int16 v51 = 2114;
            id v52 = v18;
            _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate mescal signature. Error = %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v23 = [AMSURLRequestEncoder alloc];
      id v24 = [(AMSMetricsFigaroFlushTask *)self bag];
      id v17 = [(AMSURLRequestEncoder *)v23 initWithBag:v24];

      if ([v4 anonymous])
      {
        [(AMSURLRequestEncoder *)v17 setAccount:0];
      }
      else
      {
        uint64_t v25 = [v4 account];
        [(AMSURLRequestEncoder *)v17 setAccount:v25];
      }
      -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v17, "setUrlKnownToBeTrusted:", 1, v37);
      uint64_t v26 = AMSLogKey();
      [(AMSURLRequestEncoder *)v17 setLogUUID:v26];

      [(AMSURLRequestEncoder *)v17 setAlwaysIncludeMMeClientInfoAndDeviceHeaders:[(AMSMetricsFigaroFlushTask *)self includeMMeClientInfoAndDeviceHeaders]];
      [(AMSURLRequestEncoder *)v17 setIncludeClientVersions:0];
      __int16 v27 = [AMSURLRequest alloc];
      id v28 = [v4 reportURL];
      __int16 v29 = [(AMSURLRequest *)v27 initWithURL:v28];

      [(AMSURLRequest *)v29 setNetworkServiceType:3];
      [(AMSURLRequest *)v29 setCachePolicy:1];
      [(AMSURLRequest *)v29 setTimeoutInterval:10.0];
      [(AMSURLRequest *)v29 setHTTPMethod:@"POST"];
      if ([(AMSMetricsFigaroFlushTask *)self metricsSigningFlavour] == 1) {
        [(AMSURLRequest *)v29 setHTTPBody:v13];
      }
      uint64_t v30 = [(AMSURLRequestEncoder *)v17 requestByEncodingRequest:v29 parameters:0];
      uint64_t v31 = [v4 reportURL];
      v32 = [v31 lastPathComponent];
      int v33 = [v32 isEqualToString:@"xp_ase_appstore_ue"];

      if (v33)
      {
        uint64_t v34 = [v30 thenWithBlock:&__block_literal_global_127_0];

        uint64_t v30 = (void *)v34;
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_3;
      v40[3] = &unk_1E55A0C98;
      id v41 = v4;
      id v42 = v15;
      id v43 = v38;
      uint64_t v44 = self;
      id v35 = v38;
      id v16 = [v30 thenWithBlock:v40];

      id v12 = v39;
    }
    else
    {
      AMSError(3, @"Unable to Gzip body", @"Unable to Gzip the metrics flush body", 0);
      id v17 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      id v16 = +[AMSPromise promiseWithError:v17];
    }
  }
  return v16;
}

id __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "ams_addAuthKitHeaders");
  id v4 = [v3 promiseAdapter];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_2;
  v8[3] = &unk_1E55A4680;
  id v9 = v2;
  id v5 = v2;
  id v6 = [v4 thenWithBlock:v8];

  return v6;
}

AMSPromise *__40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_2(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
}

id __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsLoadURL];
  id v5 = [v3 properties];
  [v5 setDisableLoadURLMetrics:v4];

  [v3 setHTTPBody:*(void *)(a1 + 40)];
  [v3 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
  [v3 setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(*(id *)(a1 + 40), "length"));
  [v3 setValue:v6 forHTTPHeaderField:@"Content-Length"];

  [v3 setValue:*(void *)(a1 + 48) forHTTPHeaderField:@"X-Apple-ActionSignature"];
  uint64_t v7 = [*(id *)(a1 + 32) canaryIdentifier];
  [v3 setValue:v7 forHTTPHeaderField:@"X-Apple-Canary-Id"];

  if ([*(id *)(a1 + 32) anonymous]) {
    [v3 setValue:0 forHTTPHeaderField:@"Cookie"];
  }
  os_unfair_lock_lock_with_options();
  if ([*(id *)(a1 + 56) isCancelled])
  {
    id v8 = AMSError(6, @"Flush Figaro Task Failed", @"Cancelled", 0);
    id v9 = +[AMSPromise promiseWithError:v8];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 56) URLSession];
    id v11 = [v10 dataTaskPromiseWithRequest:v3];

    uint64_t v12 = *(void *)(a1 + 56);
    id v9 = v11;
    id v8 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = v9;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 56));
  return v9;
}

- (BOOL)_shouldClearEventsDespiteError:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 responseStatusCode];
LABEL_5:
    BOOL v14 = (unint64_t)(v8 - 200) < 0x64 || (unint64_t)(v8 - 400) < 0x64;
    goto LABEL_11;
  }
  id v9 = [v5 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"AMSStatusCode"];

  if (v10)
  {
    id v11 = [v5 userInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"AMSStatusCode"];
    uint64_t v8 = [v12 integerValue];

    goto LABEL_5;
  }
  id v16 = [v5 domain];
  int v17 = [v16 isEqualToString:@"AMSErrorDomain"];

  if (v17)
  {
    BOOL v18 = [v5 code] == 3;
  }
  else
  {
    v19 = [v5 domain];
    int v20 = [v19 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (!v20)
    {
      BOOL v14 = 0;
      goto LABEL_11;
    }
    BOOL v18 = [v5 code] == -1102;
  }
  BOOL v14 = v18;
LABEL_11:

  return v14;
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

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (BOOL)includeMMeClientInfoAndDeviceHeaders
{
  return self->_includeMMeClientInfoAndDeviceHeaders;
}

- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_includeMMeClientInfoAndDeviceHeaders = a3;
}

- (unint64_t)metricsSigningFlavour
{
  return self->_metricsSigningFlavour;
}

- (void)setMetricsSigningFlavour:(unint64_t)a3
{
  self->_metricsSigningFlavour = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSMetricsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_currentCancellableDataTaskPromise, 0);
}

@end