@interface SATimerCancel
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerCancel

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_alloc_init((Class)SATimerCancelCompleted);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (id)_ad_timerRequestRepresentation
{
  id v2 = objc_alloc_init((Class)AFSetTimerRequest);
  id v3 = objc_alloc_init((Class)STTimer);
  [v3 setState:2];
  [v2 setTimer:v3];

  return v2;
}

@end