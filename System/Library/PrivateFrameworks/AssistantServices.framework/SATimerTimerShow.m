@interface SATimerTimerShow
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerTimerShow

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_alloc_init((Class)SACommandSucceeded);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (id)_ad_timerRequestRepresentation
{
  id v2 = objc_alloc_init((Class)AFShowTimerRequest);
  return v2;
}

@end