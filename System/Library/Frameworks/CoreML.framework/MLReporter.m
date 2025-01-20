@interface MLReporter
+ (id)reporter;
- (void)logMetric:(id)a3;
@end

@implementation MLReporter

uint64_t __24__MLReporter_logMetric___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictionaryRepresentation];
}

- (void)logMetric:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  id v5 = v3;
  AnalyticsSendEventLazy();
}

+ (id)reporter
{
  if (+[MLReporter reporter]::onceToken != -1) {
    dispatch_once(&+[MLReporter reporter]::onceToken, &__block_literal_global_13885);
  }
  v2 = (void *)+[MLReporter reporter]::reporter;

  return v2;
}

void __22__MLReporter_reporter__block_invoke()
{
  v0 = objc_alloc_init(MLReporter);
  v1 = (void *)+[MLReporter reporter]::reporter;
  +[MLReporter reporter]::reporter = (uint64_t)v0;
}

@end