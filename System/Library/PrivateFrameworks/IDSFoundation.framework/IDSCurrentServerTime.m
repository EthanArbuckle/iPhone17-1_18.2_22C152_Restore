@interface IDSCurrentServerTime
+ (id)sharedInstance;
- (CUTDeferredTaskQueue)refreshServerTimeTask;
- (IDSCurrentServerTime)initWithServerTimeProvider:(id)a3;
- (IDSCurrentServerTimePair)timePair;
- (IDSCurrentServerTimeProvider)serverTimeProvider;
- (double)_refreshTimeInterval;
- (double)currentServerTimeInterval;
- (id)currentServerTimeDate;
- (void)_refreshServerTime;
- (void)_storeCurrentTime;
- (void)_storeInitialServerTimeIfNeeded;
- (void)setServerTimeProvider:(id)a3;
- (void)setTimePair:(id)a3;
@end

@implementation IDSCurrentServerTime

+ (id)sharedInstance
{
  v3 = (void *)qword_1EB2BB7A8;
  if (!qword_1EB2BB7A8)
  {
    v4 = objc_alloc_init(_IDSCurrentServerTimeProvider);
    id v5 = objc_alloc((Class)a1);
    uint64_t v8 = objc_msgSend_initWithServerTimeProvider_(v5, v6, (uint64_t)v4, v7);
    v9 = (void *)qword_1EB2BB7A8;
    qword_1EB2BB7A8 = v8;

    v3 = (void *)qword_1EB2BB7A8;
  }
  return v3;
}

- (IDSCurrentServerTime)initWithServerTimeProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSCurrentServerTime;
  v6 = [(IDSCurrentServerTime *)&v15 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverTimeProvider, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F59DF8]);
    v9 = im_primary_queue();
    uint64_t v12 = objc_msgSend_initWithCapacity_queue_block_(v8, v10, 1, v11, v9, &unk_1EEFCD8B8);
    refreshServerTimeTask = v7->_refreshServerTimeTask;
    v7->_refreshServerTimeTask = (CUTDeferredTaskQueue *)v12;
  }
  return v7;
}

- (double)currentServerTimeInterval
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v3, v4, v5);
    objc_msgSend_timeIntervalSince1970(v6, v7, v8, v9);
    double v11 = v10;
  }
  else
  {
    objc_msgSend__storeInitialServerTimeIfNeeded(self, v3, v4, v5);
    v6 = objc_msgSend_timePair(self, v12, v13, v14);
    __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    __uint64_t v19 = v15 - objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v6, v16, v17, v18);
    double v11 = (double)(v19 + objc_msgSend_initialServerTimeInNanoSeconds(v6, v20, v21, v22)) / 1000000000.0;
  }

  return v11;
}

- (id)currentServerTimeDate
{
  objc_msgSend_currentServerTimeInterval(self, a2, v2, v3);
  double v7 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)objc_msgSend_dateWithTimeIntervalSince1970_(v7, v4, v5, v6);
}

- (double)_refreshTimeInterval
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 1, v2);
  double v6 = objc_msgSend_objectForKey_(v3, v4, @"server-time-refreshInterval", v5);
  double v10 = v6;
  if (v6)
  {
    objc_msgSend_doubleValue(v6, v7, v8, v9);
    double v12 = v11;
    __uint64_t v15 = objc_msgSend_utilities(IDSFoundationLog, v13, v14, v11);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = objc_msgSend_numberWithDouble_(NSNumber, v16, v17, v12);
      int v20 = 138412290;
      uint64_t v21 = v18;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "Server refresh interval to use {refreshInterval: %@}", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    double v12 = 3600.0;
  }

  return v12;
}

- (void)_storeInitialServerTimeIfNeeded
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_timePair(self, a2, v2, v3);
  if (!v5
    || (double v9 = (void *)v5,
        objc_msgSend_timePair(self, v6, v7, v8),
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v14 = objc_msgSend_isAccurate(v10, v11, v12, v13),
        v10,
        v9,
        (v14 & 1) == 0))
  {
    objc_msgSend__storeCurrentTime(self, v6, v7, v8);
    double v18 = objc_msgSend_utilities(IDSFoundationLog, v15, v16, v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = NSNumber;
      v23 = objc_msgSend_timePair(self, v19, v20, v21);
      uint64_t v27 = objc_msgSend_initialServerTimeInNanoSeconds(v23, v24, v25, v26);
      v30 = objc_msgSend_numberWithUnsignedLongLong_(v22, v28, v27, v29);
      v31 = NSNumber;
      v35 = objc_msgSend_timePair(self, v32, v33, v34);
      uint64_t v39 = objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v35, v36, v37, v38);
      v42 = objc_msgSend_numberWithUnsignedLongLong_(v31, v40, v39, v41);
      v46 = objc_msgSend_timePair(self, v43, v44, v45);
      int isAccurate = objc_msgSend_isAccurate(v46, v47, v48, v49);
      v51 = @"NO";
      int v60 = 138412802;
      v61 = v30;
      __int16 v62 = 2112;
      if (isAccurate) {
        v51 = @"YES";
      }
      v63 = v42;
      __int16 v64 = 2112;
      v65 = v51;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "Setting up timePair {initialServerTimeInNanoSeconds: %@, initialProcessMachTime: %@, isAccurate: %@}", (uint8_t *)&v60, 0x20u);
    }
    objc_msgSend__refreshTimeInterval(self, v52, v53, v54);
    double v56 = v55;
    objc_msgSend_cancelPendingExecutions(self->_refreshServerTimeTask, v57, v58, v55);
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_refreshServerTimeTask, v59, (uint64_t)self, v56);
  }
}

- (void)_refreshServerTime
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v3 = im_primary_queue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend_cancelPendingExecutions(self->_refreshServerTimeTask, v4, v5, v6);
  objc_msgSend__storeCurrentTime(self, v7, v8, v9);
  double v13 = objc_msgSend_utilities(IDSFoundationLog, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = NSNumber;
    double v18 = objc_msgSend_timePair(self, v14, v15, v16);
    uint64_t v22 = objc_msgSend_initialServerTimeInNanoSeconds(v18, v19, v20, v21);
    uint64_t v25 = objc_msgSend_numberWithUnsignedLongLong_(v17, v23, v22, v24);
    double v26 = NSNumber;
    v30 = objc_msgSend_timePair(self, v27, v28, v29);
    uint64_t v34 = objc_msgSend_initialProcessMonotonicTimeInNanoSeconds(v30, v31, v32, v33);
    uint64_t v37 = objc_msgSend_numberWithUnsignedLongLong_(v26, v35, v34, v36);
    double v41 = objc_msgSend_timePair(self, v38, v39, v40);
    int isAccurate = objc_msgSend_isAccurate(v41, v42, v43, v44);
    v46 = @"NO";
    int v52 = 138412802;
    uint64_t v53 = v25;
    __int16 v54 = 2112;
    if (isAccurate) {
      v46 = @"YES";
    }
    double v55 = v37;
    __int16 v56 = 2112;
    v57 = v46;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Refreshed timePair {initialServerTimeInNanoSeconds: %@, initialProcessMachTime: %@, isAccurate: %@}", (uint8_t *)&v52, 0x20u);
  }
  objc_msgSend__refreshTimeInterval(self, v47, v48, v49);
  objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_refreshServerTimeTask, v50, (uint64_t)self, v51);
}

- (void)_storeCurrentTime
{
  uint64_t v5 = objc_msgSend_serverTimeProvider(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_serverTimeInNanoSeconds(v5, v6, v7, v8);

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  uint64_t v11 = [IDSCurrentServerTimePair alloc];
  objc_msgSend_serverTimeProvider(self, v12, v13, v14);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t isAccurate = objc_msgSend_isAccurate(v24, v15, v16, v17);
  double v21 = objc_msgSend_initWithInitialProcessMonotonicTimeInNanoSeconds_initialServerTimeInNanoSeconds_isAccurate_(v11, v19, v10, v20, v9, isAccurate);
  objc_msgSend_setTimePair_(self, v22, (uint64_t)v21, v23);
}

- (IDSCurrentServerTimePair)timePair
{
  return (IDSCurrentServerTimePair *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimePair:(id)a3
{
}

- (IDSCurrentServerTimeProvider)serverTimeProvider
{
  return self->_serverTimeProvider;
}

- (void)setServerTimeProvider:(id)a3
{
}

- (CUTDeferredTaskQueue)refreshServerTimeTask
{
  return self->_refreshServerTimeTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshServerTimeTask, 0);
  objc_storeStrong((id *)&self->_serverTimeProvider, 0);
  objc_storeStrong((id *)&self->_timePair, 0);
}

@end