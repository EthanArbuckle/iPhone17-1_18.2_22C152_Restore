@interface INIntent(AppPredictionUI)
+ (uint64_t)apui_isSupportedForCardRequests;
@end

@implementation INIntent(AppPredictionUI)

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end