@interface SAAlarmSearch
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmSearch

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = objc_alloc_init((Class)SAAlarmSearchCompleted);
    v4 = [v3 results];
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v11 isSleepAlarm]) {
            v12 = (Class *)SAAlarmSleepAlarm_ptr;
          }
          else {
            v12 = (Class *)SAAlarmObject_ptr;
          }
          id v13 = objc_alloc_init(*v12);
          objc_msgSend(v13, "_ad_setAlarm:", v11);
          [v5 addObject:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v14 = v16;
    [v16 setResults:v5];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v21 = objc_alloc_init((Class)AFSearchAlarmsRequest);
  id v5 = objc_alloc_init((Class)STAlarm);
  id v6 = [(SAAlarmSearch *)self enabled];
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "BOOLValue"));
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(SAAlarmSearch *)self hour];
  v10 = v9;
  if (v9)
  {
    v8 |= 8uLL;
    objc_msgSend(v5, "setHourOfDay:", objc_msgSend(v9, "integerValue"));
  }
  v11 = [(SAAlarmSearch *)self minute];
  v12 = v11;
  if (v11)
  {
    v8 |= 0x10uLL;
    objc_msgSend(v5, "setMinuteOfHour:", objc_msgSend(v11, "integerValue"));
  }
  id v13 = [(SAAlarmSearch *)self identifier];
  v14 = v13;
  if (v13)
  {
    v8 |= 1uLL;
    v15 = sub_100237C20(v13);
    [v5 setIdentifier:v15];
  }
  id v16 = [(SAAlarmSearch *)self frequency];
  long long v17 = v16;
  if (v16)
  {
    v8 |= 4uLL;
    [v5 setDaysOfWeek:sub_100237508(v16)];
  }
  long long v18 = [(SAAlarmSearch *)self label];
  if (v18)
  {
    v8 |= 0x20uLL;
    [v5 setLabel:v18];
  }
  long long v19 = [(SAAlarmSearch *)self includesSleepAlarms];
  long long v20 = v19;
  if (v19 && [v19 BOOLValue])
  {
    v8 |= 0x40uLL;
    objc_msgSend(v5, "setSleepAlarm:", objc_msgSend(v20, "BOOLValue"));
  }
  [v21 setOptions:v8];
  [v21 setCriteria:v5];
  v4[2](v4, v21);
}

@end