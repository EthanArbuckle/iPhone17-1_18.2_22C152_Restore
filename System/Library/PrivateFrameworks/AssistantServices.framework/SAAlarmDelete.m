@interface SAAlarmDelete
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmDelete

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = objc_alloc_init((Class)SAAlarmDeleteCompleted);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init((Class)AFDeleteAlarmRequest);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(SAAlarmDelete *)self alarmIds];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = sub_100237C20(*(void **)(*((void *)&v14 + 1) + 8 * (void)v11));
        if (v12) {
          [v6 addObject:v12];
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }

  [v5 setAlarmIdentifiers:v6];
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SAAlarmDelete(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Asking to delete alarms with identifiers %@", buf, 0x16u);
  }
  v4[2](v4, v5);
}

@end