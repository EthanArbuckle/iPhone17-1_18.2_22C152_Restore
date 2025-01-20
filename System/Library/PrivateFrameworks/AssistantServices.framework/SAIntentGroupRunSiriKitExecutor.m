@interface SAIntentGroupRunSiriKitExecutor
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SAIntentGroupRunSiriKitExecutor

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  id v8 = a3;
  id v35 = a5;
  if (AFSupportsHALFlowRouting())
  {
    sub_1002ABC8C(v8);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v9)
    {
      id v33 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v13 = [v12 deviceInfo];
          v14 = [v13 idsDeviceUniqueIdentifier];

          v15 = [v35 objectForKey:v14];
          id v16 = [v15 integerValue];

          v17 = objc_msgSend(v12, "af_validFlowContext");
          uint64_t v18 = AFDeviceProximityCompare();
          v19 = [v17 promptContextProto];

          v20 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v41 = "-[SAIntentGroupRunSiriKitExecutor(DeviceRouting) ad_executionDeviceForDeviceContextTuples:executionCon"
                  "text:proximityMap:sharedUserID:localDeviceIsFollower:]";
            __int16 v42 = 1024;
            BOOL v43 = v18 == -1;
            __int16 v44 = 1024;
            BOOL v45 = v19 != 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Candidate: isCloseEnough? %d, flowPrompted? %d", buf, 0x18u);
          }
          if (v18 == -1 && v19 != 0)
          {
            id v9 = v12;

            goto LABEL_18;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v9);
      id v16 = 0;
LABEL_18:
      id v8 = v33;
    }
    else
    {
      id v16 = 0;
    }

    v23 = +[ADDeviceCircleManager sharedInstance];
    v24 = [v9 deviceInfo];
    v25 = [v23 managedPeerInfoMatchingPeerInfo:v24];
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v9 deviceInfo];
    }
    v28 = v27;

    v29 = [[ADPeerInfo alloc] initWithAFPeerInfo:v28];
    v30 = [ADDeviceRouterResult alloc];
    v31 = [v9 identifier];
    v22 = [(ADDeviceRouterResult *)v30 initWithPeerInfo:v29 contextIdentifier:v31 proximity:v16 commandRelayProxyIdentifier:0 error:0];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  id v3 = a3;
  if (AFSupportsHALFlowRouting())
  {
    v4 = sub_1002ABC8C(v3);
    v5 = sub_1002AB0C4(v4);
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end