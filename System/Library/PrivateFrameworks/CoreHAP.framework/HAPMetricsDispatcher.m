@interface HAPMetricsDispatcher
+ (id)sharedInstance;
- (HMMLogEventSubmitting)logDispatcher;
- (void)setLogDispatcher:(id)a3;
- (void)submitLogEvent:(id)a3;
@end

@implementation HAPMetricsDispatcher

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HAPMetricsDispatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_metricsDispatcher;

  return v2;
}

uint64_t __38__HAPMetricsDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_metricsDispatcher = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (void)setLogDispatcher:(id)a3
{
}

- (HMMLogEventSubmitting)logDispatcher
{
  return self->_logDispatcher;
}

- (void)submitLogEvent:(id)a3
{
  id v6 = a3;
  v4 = [(HAPMetricsDispatcher *)self logDispatcher];

  if (v4)
  {
    v5 = [(HAPMetricsDispatcher *)self logDispatcher];
    [v5 submitLogEvent:v6];
  }
}

@end