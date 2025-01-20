@interface AMSPageRenderMetricsPresenter
- (AMSBagProtocol)bag;
- (AMSMetrics)metrics;
- (AMSPageRenderMetricsEvent)pageRenderEvent;
- (AMSPageRenderMetricsPresenter)initWithBag:(id)a3 metrics:(id)a4;
- (NSDictionary)dictionaryForPosting;
- (void)endWithActivity:(int64_t)a3 pageMetrics:(id)a4;
- (void)enqueueEvent;
- (void)importTimings:(id)a3;
- (void)setBag:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPageRenderEvent:(id)a3;
- (void)startWithActivity:(int64_t)a3;
- (void)viewDidAppear;
- (void)viewDidLoad;
@end

@implementation AMSPageRenderMetricsPresenter

- (AMSPageRenderMetricsPresenter)initWithBag:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  [(AMSPageRenderMetricsPresenter *)self setMetrics:a4];
  v7 = objc_alloc_init(AMSPageRenderMetricsEvent);
  [(AMSPageRenderMetricsPresenter *)self setPageRenderEvent:v7];

  [(AMSPageRenderMetricsPresenter *)self setBag:v6];
  return self;
}

- (NSDictionary)dictionaryForPosting
{
  v2 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  v3 = [v2 dictionaryForPosting];

  return (NSDictionary *)v3;
}

- (void)enqueueEvent
{
  v3 = [(AMSPageRenderMetricsPresenter *)self bag];
  v4 = [v3 BOOLForKey:@"page-render-metrics-enabled"];
  v5 = [v4 valueWithError:0];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [(AMSPageRenderMetricsPresenter *)self bag];
    v8 = +[AMSMetricsLoggingEvent shouldSampleErrorsWithBag:v7];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__AMSPageRenderMetricsPresenter_enqueueEvent__block_invoke;
    v9[3] = &unk_1E559EA90;
    v9[4] = self;
    [v8 addSuccessBlock:v9];
  }
}

void __45__AMSPageRenderMetricsPresenter_enqueueEvent__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) metrics];
  v2 = [*(id *)(a1 + 32) pageRenderEvent];
  [v3 enqueueEvent:v2];
}

- (void)endWithActivity:(int64_t)a3 pageMetrics:(id)a4
{
  id v17 = a4;
  if (a3 == 1)
  {
    int v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = +[AMSMetrics serverTimeFromDate:v6];
    v8 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
    [v8 setResourceRequestEndTime:v7];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    int v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = +[AMSMetrics serverTimeFromDate:v6];
    v8 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
    [v8 setPageEndTime:v7];
  }

LABEL_6:
  v9 = [v17 objectForKeyedSubscript:@"eventType"];
  v10 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v10 setEventType:v9];

  v11 = [v17 objectForKeyedSubscript:@"pageType"];
  v12 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v12 setPageType:v11];

  v13 = [v17 objectForKeyedSubscript:@"pageUrl"];
  v14 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v14 setPageUrl:v13];

  v15 = [v17 objectForKeyedSubscript:@"placement"];
  v16 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v16 setPageId:v15];
}

- (void)importTimings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  int v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Importing PageRender timings from JS: %@", buf, 0x20u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v4;
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
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        v15 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
        v16 = [v9 objectForKeyedSubscript:v14];
        [v15 setProperty:v16 forBodyKey:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)startWithActivity:(int64_t)a3
{
  if (a3 == 1)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:");
    v5 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
    [v5 setResourceRequestStartTime:v4];
  }
  else
  {
    if (a3) {
      return;
    }
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:");
    v5 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
    [v5 setPageRequestTime:v4];
  }
}

- (void)viewDidAppear
{
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = +[AMSMetrics serverTimeFromDate:v5];
  id v4 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v4 setPageUserInteractiveTime:v3];
}

- (void)viewDidLoad
{
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = +[AMSMetrics serverTimeFromDate:v5];
  id v4 = [(AMSPageRenderMetricsPresenter *)self pageRenderEvent];
  [v4 setPageAppearTime:v3];
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (AMSPageRenderMetricsEvent)pageRenderEvent
{
  return self->_pageRenderEvent;
}

- (void)setPageRenderEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRenderEvent, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end