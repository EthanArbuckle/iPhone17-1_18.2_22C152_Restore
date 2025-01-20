@interface SASExtractSpeechData
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SASExtractSpeechData

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 originPeerInfo];

    if (v9)
    {
      v10 = [v8 originPeerInfo];
    }
    else
    {
      v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        v15 = "ADDeviceRouterResultForExecutionContextWithOriginPeer";
        __int16 v16 = 2112;
        v17 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal executionContext: %@, doesn't have originPeer", (uint8_t *)&v14, 0x16u);
      }
      v10 = 0;
    }
    v11 = [[ADDeviceRouterResult alloc] initWithPeerInfo:v10 contextIdentifier:0 proximity:0 commandRelayProxyIdentifier:0 error:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 0;
}

- (BOOL)ad_requiresDeviceContext
{
  return 0;
}

@end