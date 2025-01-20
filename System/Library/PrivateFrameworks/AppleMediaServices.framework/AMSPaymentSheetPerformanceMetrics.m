@interface AMSPaymentSheetPerformanceMetrics
- (AMSBag)bag;
- (AMSPaymentSheetPerformanceMetrics)initWithBag:(id)a3;
- (double)primaryDataParseEndTime;
- (double)primaryDataParseStartTime;
- (double)primaryDataResponseEndTime;
- (double)primaryDataResponseStartTime;
- (double)resourceRequestEndTime;
- (double)resourceRequestStartTime;
- (void)enqueueMetricsEventWithOverlay:(id)a3;
- (void)setPrimaryDataParseEndTime:(double)a3;
- (void)setPrimaryDataParseStartTime:(double)a3;
- (void)setPrimaryDataResponseEndTime:(double)a3;
- (void)setPrimaryDataResponseStartTime:(double)a3;
- (void)setResourceRequestEndTime:(double)a3;
- (void)setResourceRequestStartTime:(double)a3;
@end

@implementation AMSPaymentSheetPerformanceMetrics

- (AMSPaymentSheetPerformanceMetrics)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSheetPerformanceMetrics;
  v6 = [(AMSPaymentSheetPerformanceMetrics *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

- (void)enqueueMetricsEventWithOverlay:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[AMSMetricsEvent alloc] initWithTopic:&stru_1EDCA7308];
  [(AMSMetricsEvent *)v5 setEventType:@"pageRender"];
  [(AMSMetricsEvent *)v5 setEventVersion:&unk_1EDD01600];
  [(AMSPaymentSheetPerformanceMetrics *)self primaryDataResponseStartTime];
  v6 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v6 forBodyKey:@"primaryDataParseStartTime"];

  [(AMSPaymentSheetPerformanceMetrics *)self primaryDataResponseEndTime];
  v7 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v7 forBodyKey:@"primaryDataParseEndTime"];

  [(AMSPaymentSheetPerformanceMetrics *)self resourceRequestStartTime];
  v8 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v8 forBodyKey:@"resourceRequestStartTime"];

  [(AMSPaymentSheetPerformanceMetrics *)self resourceRequestEndTime];
  objc_super v9 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v9 forBodyKey:@"resourceRequestEndTime"];

  [(AMSPaymentSheetPerformanceMetrics *)self primaryDataResponseStartTime];
  v10 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v10 forBodyKey:@"primaryDataResponseStartTime"];

  [(AMSPaymentSheetPerformanceMetrics *)self primaryDataResponseEndTime];
  v11 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  [(AMSMetricsEvent *)v5 setProperty:v11 forBodyKey:@"primaryDataResponseEndTime"];

  [(AMSMetricsEvent *)v5 addPropertiesWithDictionary:v4];
  v12 = [(AMSMetricsEvent *)v5 topic];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      uint64_t v19 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Logging Payment Sheet Performance Metrics", (uint8_t *)&v18, 0xCu);
    }

    v16 = [(AMSPaymentSheetPerformanceMetrics *)self bag];
    v17 = +[AMSMetrics internalInstanceUsingBag:v16];
    [v17 enqueueEvent:v5];
  }
}

- (double)primaryDataResponseStartTime
{
  return self->_primaryDataResponseStartTime;
}

- (void)setPrimaryDataResponseStartTime:(double)a3
{
  self->_primaryDataResponseStartTime = a3;
}

- (double)primaryDataResponseEndTime
{
  return self->_primaryDataResponseEndTime;
}

- (void)setPrimaryDataResponseEndTime:(double)a3
{
  self->_primaryDataResponseEndTime = a3;
}

- (double)primaryDataParseStartTime
{
  return self->_primaryDataParseStartTime;
}

- (void)setPrimaryDataParseStartTime:(double)a3
{
  self->_primaryDataParseStartTime = a3;
}

- (double)primaryDataParseEndTime
{
  return self->_primaryDataParseEndTime;
}

- (void)setPrimaryDataParseEndTime:(double)a3
{
  self->_primaryDataParseEndTime = a3;
}

- (double)resourceRequestStartTime
{
  return self->_resourceRequestStartTime;
}

- (void)setResourceRequestStartTime:(double)a3
{
  self->_resourceRequestStartTime = a3;
}

- (double)resourceRequestEndTime
{
  return self->_resourceRequestEndTime;
}

- (void)setResourceRequestEndTime:(double)a3
{
  self->_resourceRequestEndTime = a3;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
}

@end