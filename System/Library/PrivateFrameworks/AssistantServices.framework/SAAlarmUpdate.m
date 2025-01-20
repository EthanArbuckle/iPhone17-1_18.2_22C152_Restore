@interface SAAlarmUpdate
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmUpdate

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 alarmIdentifiers];
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = sub_100237838(*(void **)(*((void *)&v14 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = objc_alloc_init((Class)SAAlarmUpdateCompleted);
    [v12 setAlarmIds:v5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  id v18 = a3;
  v4 = [(SAAlarmUpdate *)self modifications];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = [v12 alarmId];
        long long v14 = sub_100237C20(v13);

        [v6 addObject:v14];
        long long v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[SAAlarmUpdate(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
          __int16 v27 = 2112;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Searching for alarm %@ in order to do an update", buf, 0x16u);
        }
        id v16 = [v5 objectForKey:v14];
        if (!v16)
        {
          id v16 = objc_alloc_init((Class)NSMutableArray);
          [v5 setObject:v16 forKey:v14];
        }
        [v16 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }

  v19[0] = (void (*)(void, void))_NSConcreteStackBlock;
  v19[1] = (void (*)(void, void))3221225472;
  v19[2] = (void (*)(void, void))sub_100237CB0;
  v19[3] = (void (*)(void, void))&unk_100507848;
  v19[5] = (void (*)(void, void))v5;
  id v20 = v18;
  v19[4] = (void (*)(void, void))v6;
  id v17 = v18;
  sub_100182E0C(v19);
}

@end