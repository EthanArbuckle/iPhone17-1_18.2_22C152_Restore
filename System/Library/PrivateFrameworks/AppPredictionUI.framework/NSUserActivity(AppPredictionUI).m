@interface NSUserActivity(AppPredictionUI)
+ (uint64_t)apui_isSupportedForCardRequests;
- (id)apui_intent;
@end

@implementation NSUserActivity(AppPredictionUI)

- (id)apui_intent
{
  v1 = [a1 interaction];
  v2 = objc_msgSend(v1, "apui_intent");

  return v2;
}

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end