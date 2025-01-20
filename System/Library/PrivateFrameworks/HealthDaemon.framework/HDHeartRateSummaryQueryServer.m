@interface HDHeartRateSummaryQueryServer
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (void)_queue_start;
- (void)_queue_stop;
- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5;
@end

@implementation HDHeartRateSummaryQueryServer

- (void)_queue_start
{
  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateSummaryQueryServer;
  [(HDQueryServer *)&v4 _queue_start];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  [WeakRetained addActivityCacheObserver:self];
}

- (void)_queue_stop
{
  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateSummaryQueryServer;
  [(HDQueryServer *)&v4 _queue_stop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  [WeakRetained removeActivityCacheObserver:self];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 activityCacheInterface];

  if (v16)
  {
    v17 = [(HDQueryServer *)[HDHeartRateSummaryQueryServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v18 = v17;
    if (v17) {
      objc_storeWeak((id *)&v17->_activityCacheInterface, v16);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 100, @"Activity cache manager is unavailable");
    v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x1E4F29F48];
    v10 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      *(_DWORD *)v22 = 138412546;
      *(void *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v8;
      id v12 = *(id *)&v22[4];
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%@ received updated summary: %@", v22, 0x16u);
    }
    if ((-[HKHeartRateSummary isEqual:](self->_latestSummary, "isEqual:", v8, *(_OWORD *)v22, *(void *)&v22[16], v23) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_latestSummary, a4);
      v17 = [(HDQueryServer *)self clientProxy];
      id v14 = [v17 remoteObjectProxy];

      _HKInitializeLogging();
      os_log_t v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        v19 = v18;
        v20 = objc_opt_class();
        *(_DWORD *)v22 = 138412546;
        *(void *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2112;
        *(void *)&v22[14] = v14;
        id v21 = v20;
        _os_log_debug_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEBUG, "%@ notifying client: %@", v22, 0x16u);
      }
      id v16 = [(HDQueryServer *)self queryUUID];
      [v14 client_deliverSummary:v8 queryUUID:v16];
      goto LABEL_10;
    }
    _HKInitializeLogging();
    os_log_t v13 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      id v14 = v13;
      v15 = objc_opt_class();
      *(_DWORD *)v22 = 138412290;
      *(void *)&v22[4] = v15;
      id v16 = v15;
      _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%@ ignoring summary because nothing changed", v22, 0xCu);
LABEL_10:
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityCacheInterface);

  objc_storeStrong((id *)&self->_latestSummary, 0);
}

@end