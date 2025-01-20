@interface SATimerDismiss
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SATimerDismiss

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
  id v2 = objc_alloc_init((Class)AFDismissTimerRequest);
  return v2;
}

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  id v9 = a5;
  v10 = sub_1002ABC8C(a3);
  v11 = [(SATimerDismiss *)self timerIds];
  id v12 = v10;
  id v13 = v11;
  *(void *)v34 = _NSConcreteStackBlock;
  *(void *)&v34[8] = 3221225472;
  *(void *)&v34[16] = sub_10007A5AC;
  v35 = &unk_1004FFE00;
  *(void *)v36 = v13;
  id v14 = [v12 indexOfObjectPassingTest:v34];
  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v15 = [v12 objectAtIndexedSubscript:v14];
  }

  v16 = [v15 deviceInfo];
  id v17 = sub_1002ABD0C(v9, v16);

  v18 = [(SATimerDismiss *)self timerIds];
  id v19 = v15;
  v20 = v19;
  if (v19)
  {
    if ([v19 fromLocalDevice])
    {
      v21 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v34 = 136315650;
        *(void *)&v34[4] = "ADDeviceRouterResultForDeviceContextWithFiringTimer";
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = @"dismiss";
        *(_WORD *)&v34[22] = 2112;
        v35 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s #hal %@ local timers: %@", v34, 0x20u);
      }
      v22 = 0;
    }
    else
    {
      v24 = [v20 deviceInfo];
      v25 = sub_10016A938(v24, 0);

      v26 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v31 = v26;
        v32 = AFPeerInfoGetCompactDescription();
        v33 = AFDeviceProximityGetName();
        *(_DWORD *)v34 = 136316162;
        *(void *)&v34[4] = "ADDeviceRouterResultForDeviceContextWithFiringTimer";
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = @"dismiss";
        *(_WORD *)&v34[22] = 2112;
        v35 = v18;
        *(_WORD *)v36 = 2112;
        *(void *)&v36[2] = v32;
        __int16 v37 = 2112;
        v38 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s #hal %@ timers: %@ on %@, proximity: %@", v34, 0x34u);
      }
      v22 = [[ADPeerInfo alloc] initWithAFPeerInfo:v25];
    }
    v27 = [ADDeviceRouterResult alloc];
    v28 = [v20 identifier];
    v29 = [v20 contextCollectorSource];
    v23 = [(ADDeviceRouterResult *)v27 initWithPeerInfo:v22 contextIdentifier:v28 proximity:v17 commandRelayProxyIdentifier:v29 error:0];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 1;
}

- (BOOL)ad_requiresDeviceContext
{
  return 1;
}

@end