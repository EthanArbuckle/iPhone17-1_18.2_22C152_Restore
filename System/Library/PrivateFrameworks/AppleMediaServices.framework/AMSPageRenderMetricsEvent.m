@interface AMSPageRenderMetricsEvent
- (AMSPageRenderMetricsEvent)init;
- (NSNumber)pageAppearTime;
- (NSNumber)pageEndTime;
- (NSNumber)pageInterruptTime;
- (NSNumber)pageReappearTime;
- (NSNumber)pageRequestTime;
- (NSNumber)pageUserInteractiveTime;
- (NSNumber)resourceRequestEndTime;
- (NSNumber)resourceRequestStartTime;
- (NSString)pageId;
- (NSString)pageType;
- (NSString)pageUrl;
- (NSString)placement;
- (void)setPageAppearTime:(id)a3;
- (void)setPageEndTime:(id)a3;
- (void)setPageId:(id)a3;
- (void)setPageInterruptTime:(id)a3;
- (void)setPageReappearTime:(id)a3;
- (void)setPageRequestTime:(id)a3;
- (void)setPageType:(id)a3;
- (void)setPageUrl:(id)a3;
- (void)setPageUserInteractiveTime:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setResourceRequestEndTime:(id)a3;
- (void)setResourceRequestStartTime:(id)a3;
@end

@implementation AMSPageRenderMetricsEvent

- (AMSPageRenderMetricsEvent)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] init", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)AMSPageRenderMetricsEvent;
  return [(AMSMetricsEvent *)&v8 initWithTopic:@"xp_ase_ams_perf"];
}

- (NSNumber)pageAppearTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageAppearTime"];
}

- (NSNumber)pageEndTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageEndTime"];
}

- (NSString)pageId
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageId"];
}

- (NSNumber)pageInterruptTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageInterruptTime"];
}

- (NSNumber)pageReappearTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageReappearTime"];
}

- (NSNumber)pageRequestTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageRequestTime"];
}

- (NSString)pageType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageType"];
}

- (NSNumber)pageUserInteractiveTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageUserInteractiveTime"];
}

- (NSString)pageUrl
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"pageUrl"];
}

- (NSString)placement
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"placement"];
}

- (NSNumber)resourceRequestEndTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"resourceRequestEndTime"];
}

- (NSNumber)resourceRequestStartTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"resourceRequestStartTime"];
}

- (void)setPageAppearTime:(id)a3
{
}

- (void)setPageEndTime:(id)a3
{
}

- (void)setPageId:(id)a3
{
}

- (void)setPageInterruptTime:(id)a3
{
}

- (void)setPageReappearTime:(id)a3
{
}

- (void)setPageRequestTime:(id)a3
{
}

- (void)setPageType:(id)a3
{
}

- (void)setPageUserInteractiveTime:(id)a3
{
}

- (void)setPageUrl:(id)a3
{
}

- (void)setPlacement:(id)a3
{
}

- (void)setResourceRequestEndTime:(id)a3
{
}

- (void)setResourceRequestStartTime:(id)a3
{
}

@end