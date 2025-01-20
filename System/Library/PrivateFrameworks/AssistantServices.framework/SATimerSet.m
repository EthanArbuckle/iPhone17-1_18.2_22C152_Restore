@interface SATimerSet
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerSet

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_alloc_init((Class)SATimerSetCompleted);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (id)_ad_timerRequestRepresentation
{
  id v3 = objc_alloc_init((Class)AFSetTimerRequest);
  v4 = [(SATimerSet *)self timer];
  id v5 = objc_msgSend(v4, "_ad_timerWithState:", 1);
  [v3 setTimer:v5];

  return v3;
}

@end