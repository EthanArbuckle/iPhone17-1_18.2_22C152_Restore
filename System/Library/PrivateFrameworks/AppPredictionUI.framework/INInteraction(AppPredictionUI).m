@interface INInteraction(AppPredictionUI)
+ (uint64_t)apui_isSupportedForCardRequests;
@end

@implementation INInteraction(AppPredictionUI)

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end