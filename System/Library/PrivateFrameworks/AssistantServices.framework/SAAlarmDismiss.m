@interface SAAlarmDismiss
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmDismiss

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  v11 = sub_1002ABC8C(a3);
  v12 = [(SAAlarmDismiss *)self alarmIds];
  v13 = sub_10007AD38(v11, v12, v7);

  v14 = [v13 deviceInfo];
  id v15 = sub_1002ABD0C(v10, v14);

  v16 = [(SAAlarmDismiss *)self alarmIds];
  v17 = sub_10007AF80(v13, (uint64_t)v15, v16, @"dismiss");

  return v17;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 1;
}

- (BOOL)ad_requiresDeviceContext
{
  return 1;
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = (Class *)SACommandSucceeded_ptr;
  if ((isKindOfClass & 1) == 0) {
    v5 = (Class *)SACommandFailed_ptr;
  }
  id v6 = objc_alloc_init(*v5);
  return v6;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init((Class)AFDismissAlarmRequest);
  id v6 = [(SAAlarmDismiss *)self alarmIds];
  [v5 setAlarmURLs:v6];

  BOOL v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = [(SAAlarmDismiss *)self alarmIds];
    int v10 = 136315394;
    v11 = "-[SAAlarmDismiss(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Asking to dismiss alarms with identifiers %@", (uint8_t *)&v10, 0x16u);
  }
  v4[2](v4, v5);
}

@end