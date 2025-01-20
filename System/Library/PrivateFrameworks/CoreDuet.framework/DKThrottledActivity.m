@interface DKThrottledActivity
@end

@implementation DKThrottledActivity

void __40___DKThrottledActivity_standardInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = [v1 initWithStore:v4 namespace:@"_DKThrottledActivity standardInstance"];
  v3 = (void *)standardInstance_standardInstance;
  standardInstance_standardInstance = v2;
}

uint64_t __41___DKThrottledActivity_activityThrottler__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = activityThrottler_sharedInstances;
  activityThrottler_sharedInstances = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __95___DKThrottledActivity_performNoMoreOftenInMinutesThan_name_queue_activityBlock_throttleBlock___block_invoke(uint64_t a1)
{
}

@end