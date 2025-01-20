@interface BCSMetric
+ (BOOL)isUsingExpensiveNetwork;
- (id)_initWithType:(void *)a3 context:(void *)a4 postProcessingMetricHandlers:;
- (int64_t)metricType;
- (void)submitForPostProcessing;
@end

@implementation BCSMetric

- (id)_initWithType:(void *)a3 context:(void *)a4 postProcessingMetricHandlers:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BCSMetric;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[3] = a2;
      objc_storeStrong(v10 + 2, a3);
      objc_storeStrong(a1 + 1, a4);
    }
  }

  return a1;
}

+ (BOOL)isUsingExpensiveNetwork
{
  return +[BCSNetworkInfo isExpensiveNetwork];
}

- (void)submitForPostProcessing
{
  if (self) {
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  }
  else {
    postProcessingMetricHandlers = 0;
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__BCSMetric_submitForPostProcessing__block_invoke;
  v3[3] = &unk_26424A240;
  v3[4] = self;
  [(NSArray *)postProcessingMetricHandlers enumerateObjectsUsingBlock:v3];
}

uint64_t __36__BCSMetric_submitForPostProcessing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleSubmittedMetric:*(void *)(a1 + 32)];
}

- (int64_t)metricType
{
  return self->_metricType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);

  objc_storeStrong((id *)&self->_postProcessingMetricHandlers, 0);
}

@end