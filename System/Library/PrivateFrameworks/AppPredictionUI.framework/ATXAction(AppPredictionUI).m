@interface ATXAction(AppPredictionUI)
+ (uint64_t)apui_isSupportedForCardRequests;
- (id)apui_intent;
@end

@implementation ATXAction(AppPredictionUI)

- (id)apui_intent
{
  v2 = [a1 intent];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 userActivity];
    objc_msgSend(v5, "apui_intent");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end