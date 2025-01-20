@interface CRUIAnalytics
- (CRUIAnalytics)init;
- (void)sendAnalyticsForRepairHistoryMismatch;
- (void)sendAsyncAnalyticsForEventIfNeeded:(id)a3 moduleName:(id)a4;
@end

@implementation CRUIAnalytics

- (CRUIAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRUIAnalytics;
  v2 = [(CRUIAnalytics *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("async", 0);
    serialAsyncQueue = v2->serialAsyncQueue;
    v2->serialAsyncQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)sendAnalyticsForRepairHistoryMismatch
{
}

- (void)sendAsyncAnalyticsForEventIfNeeded:(id)a3 moduleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 length];
    if (v7)
    {
      if (v8 && [v7 length])
      {
        serialAsyncQueue = self->serialAsyncQueue;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = sub_239772E34;
        v10[3] = &unk_264DA05E8;
        id v11 = v7;
        id v12 = v6;
        dispatch_async(serialAsyncQueue, v10);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end