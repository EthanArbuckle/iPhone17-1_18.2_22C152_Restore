@interface SAAlarmAlarmShow
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)_ad_internalAlarmIdentifiers;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmAlarmShow

- (id)_ad_alarmResponseForResponse:(id)a3
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

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4[0] = (void (*)(void, void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void, void))3221225472;
  v4[2] = (void (*)(void, void))sub_100239054;
  v4[3] = (void (*)(void, void))&unk_100509D80;
  v4[4] = (void (*)(void, void))self;
  id v5 = a3;
  id v3 = v5;
  sub_100182E0C(v4);
}

- (id)_ad_internalAlarmIdentifiers
{
  v2 = [(SAAlarmAlarmShow *)self alarmIds];
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = sub_100237C20(*(void **)(*((void *)&v11 + 1) + 8 * i));
        objc_msgSend(v3, "addObject:", v9, (void)v11);
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

@end