@interface SAAlarmCreate
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmCreate

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init((Class)SAAlarmCreateCompleted);
    v5 = [v3 alarmIdentifier];
    v6 = sub_100237838(v5);
    [v4 setAlarmId:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v7 = objc_alloc_init((Class)AFCreateAlarmRequest);
  v5 = [(SAAlarmCreate *)self alarmToCreate];
  v6 = objc_msgSend(v5, "_ad_alarm");
  [v7 setAlarm:v6];

  v4[2](v4, v7);
}

@end