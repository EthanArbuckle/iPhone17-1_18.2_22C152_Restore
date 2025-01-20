@interface APUICardRequestSatisfactionCriteria
+ (id)compactSatisfactionCriteria;
+ (id)customIntentSatisfactionCriteria;
+ (id)generalSatisfactionCriteria;
- (BOOL)canSatisfyCardRequest:(id)a3;
- (unint64_t)servicePriorityForRequest:(id)a3;
@end

@implementation APUICardRequestSatisfactionCriteria

+ (id)generalSatisfactionCriteria
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)compactSatisfactionCriteria
{
  id v2 = objc_alloc_init(_APUICardRequestCompactSatisfactionCriteria);

  return v2;
}

+ (id)customIntentSatisfactionCriteria
{
  id v2 = objc_alloc_init(_APUICardRequestCustomIntentSatisfactionCriteria);

  return v2;
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  v3 = [a3 content];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = objc_msgSend((id)objc_opt_class(), "apui_isSupportedForCardRequests");
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 0;
}

@end