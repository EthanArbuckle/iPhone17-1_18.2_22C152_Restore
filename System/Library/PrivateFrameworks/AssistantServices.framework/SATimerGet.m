@interface SATimerGet
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerGet

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init((Class)SATimerGetCompleted);
    id v5 = objc_alloc_init((Class)SATimerObject);
    v6 = [v3 timer];
    objc_msgSend(v5, "_ad_setTimer:", v6);

    [v4 setTimer:v5];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_ad_timerRequestRepresentation
{
  id v2 = objc_alloc_init((Class)AFGetTimerRequest);
  return v2;
}

@end