@interface ATXHeroData(AppPredictionUI)
+ (uint64_t)apui_isSupportedForCardRequests;
- (uint64_t)apui_intent;
@end

@implementation ATXHeroData(AppPredictionUI)

- (uint64_t)apui_intent
{
  return 0;
}

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end