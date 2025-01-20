@interface ADDeviceResolutionServiceListener
- (ADDeviceResolutionServiceListener)initWithInstanceContext:(id)a3 deviceCircleManager:(id)a4;
- (BOOL)_peerIsPairedPhone:(id)a3;
- (BOOL)_peerIsPairedWatch:(id)a3;
- (BOOL)_shouldLogAFAnalyticsCrossDeviceEvent:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (double)_generalizeTimeIntervalsForPrivacy:(double)a3;
- (id)_crossDeviceCommandExecutionEndedEvent:(int)a3 actionResult:(int)a4 halId:(id)a5 contextProximityPairs:(id)a6 homeKitTarget:(int)a7;
- (id)_crossDeviceCommandExecutionFailedEvent:(int)a3 action:(int)a4 halId:(id)a5;
- (id)_crossDeviceCommandExecutionStartedEvent:(int)a3 halId:(id)a4;
- (id)_devicesMatchingDescriptions:(id)a3 capabilitiesTuples:(id)a4 proximityMap:(id)a5;
- (id)_halDeviceFromContext:(id)a3 proximity:(int64_t)a4;
- (id)_resultStringFromHALAction:(int)a3 actionResult:(int)a4;
- (int)_halActionFromAction:(id)a3;
- (int)_halActionResultFromActionResult:(id)a3;
- (int)_halDeviceFamilyFromInterfaceIdiom:(id)a3;
- (int)_halDevicePowerStateFromSystemStateSnapshot:(id)a3;
- (int)_halDeviceProximityFromProximity:(int64_t)a3;
- (int)_halHomeKitTargetFromTarget:(id)a3;
- (int)_halMediaPlayerStateFromPlaybackState:(int64_t)a3;
- (void)_logAFAnalyticsCrossDeviceCommandHandledEventWithResult:(int)a3 halActionResult:(int)a4 contextProximityPairs:(id)a5;
- (void)_pairedCompanionDeviceFromSharedDataWithCompletion:(id)a3;
- (void)getAllReachableDevicesWithCompletion:(id)a3;
- (void)getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:(id)a3 serviceContexts:(id)a4 completion:(id)a5;
- (void)getDeviceContextAndProximityMapIncludingAllReachableDevice:(BOOL)a3 completion:(id)a4;
- (void)getDevicesMatchingCapabilityDescriptions:(id)a3 completion:(id)a4;
- (void)getSourceDeviceForContextWithIdentifiers:(id)a3 completion:(id)a4;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 actionResult:(id)a5 homeKitTarget:(id)a6 contextProximityPairs:(id)a7;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 contextProximityPairs:(id)a5;
- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 homeKitTarget:(id)a5 contextProximityPairs:(id)a6;
- (void)logCrossDeviceCommandFailed:(id)a3 action:(id)a4 reason:(id)a5;
- (void)logCrossDeviceCommandStarted:(id)a3 action:(id)a4;
- (void)logCrossDeviceRequestLink:(id)a3 halId:(id)a4;
- (void)logCrossDeviceRequestLink:(id)a3 halRequestId:(id)a4;
- (void)meDeviceWithCompletion:(id)a3;
- (void)pairedCompanionDeviceWithCompletion:(id)a3;
- (void)setupListener;
@end

@implementation ADDeviceResolutionServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_deviceCircleManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)getDeviceContextAndProximityMapIncludingAllReachableDevice:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    v6 = +[ADCommandCenter sharedCommandCenter];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CAAB8;
    v7[3] = &unk_10050A790;
    BOOL v9 = a3;
    id v8 = v5;
    [v6 getCurrentContextSnapshotWithCompletion:v7];
  }
}

- (BOOL)_peerIsPairedPhone:(id)a3
{
  v3 = [a3 rapportEffectiveIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Phone"];

  return v4;
}

- (BOOL)_peerIsPairedWatch:(id)a3
{
  v3 = [a3 rapportEffectiveIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Watch"];

  return v4;
}

- (void)meDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADDeviceResolutionServiceListener meDeviceWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    deviceCircleManager = self->_deviceCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CAD78;
    v7[3] = &unk_10050A768;
    id v8 = v4;
    [(ADDeviceCircleManager *)deviceCircleManager getManagedLocalAndRemotePeerInfoWithCompletion:v7];
  }
LABEL_4:
}

- (void)_pairedCompanionDeviceFromSharedDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADDeviceResolutionServiceListener _pairedCompanionDeviceFromSharedDataWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    id v5 = +[ADCommandCenter sharedCommandCenter];
    v6 = [v5 _sharedDataService];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CB4A0;
    v7[3] = &unk_10050A718;
    id v8 = v3;
    [v6 getSharedDataFromPeerUseCache:1 completion:v7];
  }
LABEL_4:
}

- (void)pairedCompanionDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADDeviceResolutionServiceListener pairedCompanionDeviceWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_7;
    }
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if ((AFIsIOS() & 1) != 0 || AFIsNano())
  {
    deviceCircleManager = self->_deviceCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CB86C;
    v7[3] = &unk_10050A6C8;
    void v7[4] = self;
    id v8 = v4;
    [(ADDeviceCircleManager *)deviceCircleManager getManagedLocalAndRemotePeerInfoWithCompletion:v7];
  }
  else
  {
    [(ADDeviceResolutionServiceListener *)self _pairedCompanionDeviceFromSharedDataWithCompletion:v4];
  }
LABEL_7:
}

- (id)_devicesMatchingDescriptions:(id)a3 capabilitiesTuples:(id)a4 proximityMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v22 = a5;
  v20 = v7;
  v25 = SVDCapabilityDescriptionsGroupedByCapabilityKey();
  id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "content", v20);
        v13 = objc_msgSend(v12, "af_lenientMappedDictionary:", &stru_10050A650);
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        char v32 = 1;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1002CBE30;
        v26[3] = &unk_10050A678;
        id v14 = v13;
        id v27 = v14;
        v28 = &v29;
        [v25 enumerateKeysAndObjectsUsingBlock:v26];
        if (*((unsigned char *)v30 + 24))
        {
          v15 = [v11 info];
          v16 = [v15 assistantIdentifier];
          if (v16)
          {
            v17 = [v22 objectForKey:v16];
          }
          else
          {
            v17 = 0;
          }
          v18 = sub_1002CAF88(v15, (uint64_t)[v17 integerValue]);
          if (v18) {
            [v21 setObject:v12 forKey:v18];
          }
        }
        _Block_object_dispose(&v29, 8);
      }
      id v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  return v21;
}

- (void)getDevicesMatchingCapabilityDescriptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[ADDeviceResolutionServiceListener getDevicesMatchingCapabilityDescriptions:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }
  if (AFSupportsHALOnDemandRapportConnection())
  {
    deviceCircleManager = self->_deviceCircleManager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002CC190;
    v17[3] = &unk_10050D008;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v10 = v7;
    id v11 = v6;
    [(ADDeviceCircleManager *)deviceCircleManager getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:v17];
  }
  else
  {
    SVDCapabilityDescriptionsGroupedByCapabilityKey();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = self->_deviceCircleManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002CC2BC;
    v14[3] = &unk_10050D008;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    id v13 = v7;
    id v10 = v6;
    [(ADDeviceCircleManager *)v12 getCapabilitiesForReachableDevicesWithCompletion:v14];
  }
}

- (void)getSourceDeviceForContextWithIdentifiers:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002CC4C8;
  v8[3] = &unk_10050A610;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(ADDeviceResolutionServiceListener *)self getDeviceContextAndProximityMapIncludingAllReachableDevice:0 completion:v8];
}

- (void)getAllReachableDevicesWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002CC7F0;
  v5[3] = &unk_10050A5E8;
  id v6 = a3;
  id v4 = v6;
  [(ADDeviceResolutionServiceListener *)self getDeviceContextAndProximityMapIncludingAllReachableDevice:1 completion:v5];
}

- (void)getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:(id)a3 serviceContexts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[ADDeviceResolutionServiceListener getContextAndProximitySnapshotForCurrentRequestForDeviceUnits:serviceConte"
          "xts:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }
  v12 = objc_msgSend(v9, "af_mappedArray:", &stru_10050A518);
  id v13 = objc_msgSend(v8, "af_mappedArray:", &stru_10050A558);
  +[NSMutableDictionary dictionary];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002CCB90;
  v18[3] = &unk_10050A580;
  id v19 = v12;
  id v20 = v13;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v10;
  id v14 = v10;
  id v15 = v21;
  id v16 = v13;
  id v17 = v12;
  [(ADDeviceResolutionServiceListener *)self getDeviceContextAndProximityMapIncludingAllReachableDevice:1 completion:v18];
}

- (void)logCrossDeviceCommandFailed:(id)a3 action:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(ADDeviceResolutionServiceListener *)self _halActionFromAction:a4];
  id v11 = [v8 integerValue];

  v12 = [(ADDeviceResolutionServiceListener *)self _crossDeviceCommandExecutionFailedEvent:v11 action:v10 halId:v9];

  id v13 = +[AssistantSiriAnalytics sharedStream];
  [v13 emitMessage:v12];

  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    id v16 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandFailed:action:reason:]";
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s #hal Emitted commandFailed %@ to sharedStream", (uint8_t *)&v15, 0x16u);
  }
}

- (void)_logAFAnalyticsCrossDeviceCommandHandledEventWithResult:(int)a3 halActionResult:(int)a4 contextProximityPairs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = [(ADDeviceResolutionServiceListener *)self _resultStringFromHALAction:v6 actionResult:v5];
  uint64_t v10 = [v8 allKeys];
  id v11 = [v10 firstObject];

  v12 = [v8 objectForKeyedSubscript:v11];

  id v13 = [v11 deviceInfo];
  id v14 = [v13 productType];

  [v12 integerValue];
  if (v14)
  {
    int v15 = +[NSSet setWithObject:v14];
  }
  else
  {
    int v15 = 0;
  }
  id v16 = AFAnalyticsContextCreateForCrossDeviceCommandHandled();
  __int16 v17 = +[AFAnalytics sharedAnalytics];
  [v17 logEventWithType:4560 context:v16];

  id v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    id v20 = "-[ADDeviceResolutionServiceListener _logAFAnalyticsCrossDeviceCommandHandledEventWithResult:halActionResult:co"
          "ntextProximityPairs:]";
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s #hal Emitted AFAnalyticsEventTypeDaemonContextCrossDeviceCommandHandled event with context: %@", (uint8_t *)&v19, 0x16u);
  }
}

- (BOOL)_shouldLogAFAnalyticsCrossDeviceEvent:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 integerValue];
  return (v3 < 0x16) & (0x2FC01Fu >> v3);
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 actionResult:(id)a5 homeKitTarget:(id)a6 contextProximityPairs:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [(ADDeviceResolutionServiceListener *)self _halActionFromAction:v15];
  uint64_t v18 = [(ADDeviceResolutionServiceListener *)self _halActionResultFromActionResult:v14];

  uint64_t v19 = [(ADDeviceResolutionServiceListener *)self _halHomeKitTargetFromTarget:v13];
  id v20 = [(ADDeviceResolutionServiceListener *)self _crossDeviceCommandExecutionEndedEvent:v17 actionResult:v18 halId:v16 contextProximityPairs:v12 homeKitTarget:v19];

  __int16 v21 = +[AssistantSiriAnalytics sharedStream];
  [v21 emitMessage:v20];

  id v22 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    v25 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandEnded:action:actionResult:homeKitTarget:contextProximityPairs:]";
    __int16 v26 = 2112;
    id v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s #hal Emitted commandEnded %@ to sharedStream", (uint8_t *)&v24, 0x16u);
  }
  unsigned int v23 = [(ADDeviceResolutionServiceListener *)self _shouldLogAFAnalyticsCrossDeviceEvent:v15];

  if (v23) {
    [(ADDeviceResolutionServiceListener *)self _logAFAnalyticsCrossDeviceCommandHandledEventWithResult:v17 halActionResult:v18 contextProximityPairs:v12];
  }
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 homeKitTarget:(id)a5 contextProximityPairs:(id)a6
{
}

- (void)logCrossDeviceCommandEnded:(id)a3 action:(id)a4 contextProximityPairs:(id)a5
{
}

- (void)logCrossDeviceCommandStarted:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = [(ADDeviceResolutionServiceListener *)self _crossDeviceCommandExecutionStartedEvent:[(ADDeviceResolutionServiceListener *)self _halActionFromAction:a4] halId:v6];

  id v8 = +[AssistantSiriAnalytics sharedStream];
  [v8 emitMessage:v7];

  id v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADDeviceResolutionServiceListener logCrossDeviceCommandStarted:action:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s #hal Emitted commandStarted event %@ to sharedStream", (uint8_t *)&v10, 0x16u);
  }
}

- (void)logCrossDeviceRequestLink:(id)a3 halId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    id v7 = ADCreateRequestLinkInfo();
    id v8 = ADCreateRequestLinkInfo();
    ADEmitRequestLinkEventMessage();
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      __int16 v12 = "-[ADDeviceResolutionServiceListener logCrossDeviceRequestLink:halId:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s #hal Emitted RequestLink event to sharedStream", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      __int16 v12 = "-[ADDeviceResolutionServiceListener logCrossDeviceRequestLink:halId:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s #hal RequestId %@ or halIdentifier %@ should not be nil.", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)logCrossDeviceRequestLink:(id)a3 halRequestId:(id)a4
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[SVDDeviceResolutionXPCInterface entitlement];
  char HasEntitlement = AFConnectionHasEntitlement();

  if (HasEntitlement)
  {
    unsigned int v8 = [v5 processIdentifier];
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = "-[ADDeviceResolutionServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ Device Resolution Service Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    int v10 = +[SVDDeviceResolutionXPCInterface xpcInterface];
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:self];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002CD840;
    v15[3] = &unk_10050A4D8;
    unsigned int v16 = v8;
    [v5 setInvalidationHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002CD8FC;
    v13[3] = &unk_10050A4D8;
    unsigned int v14 = v8;
    [v5 setInterruptionHandler:v13];
    [v5 resume];
  }
  else
  {
    int v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[ADDeviceResolutionServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@ Device Resolution Service Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)setupListener
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CDA2C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADDeviceResolutionServiceListener)initWithInstanceContext:(id)a3 deviceCircleManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ADDeviceResolutionServiceListener;
  unsigned int v8 = [(ADDeviceResolutionServiceListener *)&v19 init];
  if (v8)
  {
    if (v6)
    {
      id v9 = (AFInstanceContext *)v6;
    }
    else
    {
      id v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v8->_instanceContext;
    v8->_instanceContext = v9;

    objc_storeStrong((id *)&v8->_deviceCircleManager, a4);
    int v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v8->_instanceContext;
      deviceCircleManager = v8->_deviceCircleManager;
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "-[ADDeviceResolutionServiceListener initWithInstanceContext:deviceCircleManager:]";
      __int16 v22 = 2112;
      unsigned int v23 = v17;
      __int16 v24 = 2112;
      v25 = deviceCircleManager;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s instanceContext = %@, deviceCircleManager = %@", buf, 0x20u);
    }
    __int16 v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v14 = dispatch_queue_create("ADDeviceResolutionServiceListener", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    [(ADDeviceResolutionServiceListener *)v8 setupListener];
  }

  return v8;
}

- (int)_halDevicePowerStateFromSystemStateSnapshot:(id)a3
{
  id v3 = [a3 sleepState];
  if ((unint64_t)v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (int)_halDeviceFamilyFromInterfaceIdiom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAUserInterfaceIdiomPHONEValue])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:SAUserInterfaceIdiomPADValue])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:SAUserInterfaceIdiomCAMEOValue])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:SAUserInterfaceIdiomHORSEMANValue])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:SAUserInterfaceIdiomZEUSValue])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:SAUserInterfaceIdiomWATCHValue])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)_halMediaPlayerStateFromPlaybackState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 2;
  }
  else {
    return dword_1003E2ED4[a3];
  }
}

- (int)_halDeviceProximityFromProximity:(int64_t)a3
{
  if (a3 == 4000) {
    int v3 = 1;
  }
  else {
    int v3 = 4;
  }
  if (a3 == 3000) {
    int v4 = 2;
  }
  else {
    int v4 = v3;
  }
  if (a3 == 2000) {
    int v5 = 3;
  }
  else {
    int v5 = 4;
  }
  if (!a3) {
    int v5 = 0;
  }
  if (a3 <= 2999) {
    return v5;
  }
  else {
    return v4;
  }
}

- (double)_generalizeTimeIntervalsForPrivacy:(double)a3
{
  return fmin(round(a3 / 5.0) * 5.0, 3600.0);
}

- (id)_halDeviceFromContext:(id)a3 proximity:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)HALSchemaHALDevice);
  objc_msgSend(v7, "setDeviceProximity:", -[ADDeviceResolutionServiceListener _halDeviceProximityFromProximity:](self, "_halDeviceProximityFromProximity:", a4));
  unsigned int v8 = [v6 deviceInfo];
  id v9 = [v8 buildVersion];
  [v7 setSystemBuild:v9];

  int v10 = [v8 userInterfaceIdiom];
  objc_msgSend(v7, "setDeviceFamily:", -[ADDeviceResolutionServiceListener _halDeviceFamilyFromInterfaceIdiom:](self, "_halDeviceFamilyFromInterfaceIdiom:", v10));

  int v11 = [v6 playbackStateSnapshot];
  if (v11)
  {
    id v12 = objc_alloc_init((Class)HALSchemaHALMediaPlayerContext);
    objc_msgSend(v12, "setState:", -[ADDeviceResolutionServiceListener _halMediaPlayerStateFromPlaybackState:](self, "_halMediaPlayerStateFromPlaybackState:", objc_msgSend(v11, "playbackState")));
    __int16 v13 = [v11 mediaType];
    unsigned __int8 v14 = [v13 isEqualToString:kMRMediaRemoteMediaTypeMusic];

    if (v14)
    {
      uint64_t v15 = 10;
    }
    else
    {
      unsigned int v16 = [v11 mediaType];
      unsigned __int8 v17 = [v16 isEqualToString:kMRMediaRemoteNowPlayingInfoTypeVideo];

      if (v17)
      {
        uint64_t v15 = 28;
      }
      else
      {
        uint64_t v18 = [v11 mediaType];
        unsigned __int8 v19 = [v18 isEqualToString:kMRMediaRemoteMediaTypePodcast];

        if (v19)
        {
          uint64_t v15 = 16;
        }
        else
        {
          id v20 = [v11 mediaType];
          unsigned __int8 v21 = [v20 isEqualToString:kMRMediaRemoteMediaTypeAudioBook];

          if (v21)
          {
            uint64_t v15 = 3;
          }
          else
          {
            __int16 v22 = [v11 mediaType];
            unsigned int v23 = [v22 isEqualToString:kMRMediaRemoteMediaTypeITunesU];

            if (v23) {
              uint64_t v15 = 8;
            }
            else {
              uint64_t v15 = 0;
            }
          }
        }
      }
    }
    [v12 setType:v15];
    if ([v12 state] == 1)
    {
      uint64_t v24 = 0;
    }
    else
    {
      v25 = [v11 nowPlayingTimestamp];

      if (!v25)
      {
LABEL_18:
        [v7 setMediaPlayerContext:v12];

        goto LABEL_19;
      }
      __int16 v26 = +[NSDate date];
      id v27 = [v11 nowPlayingTimestamp];
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;

      [(ADDeviceResolutionServiceListener *)self _generalizeTimeIntervalsForPrivacy:v29];
      uint64_t v24 = v30;
    }
    [v12 setTimeSinceLastMediaPlaybackInSeconds:v24];
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v31 = [v6 alarmSnapshot];
  char v32 = v31;
  if (v31)
  {
    long long v33 = [v31 alarmsByID];
    long long v34 = [v32 notifiedFiringAlarmIDs];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = sub_10030FC10;
    v70 = sub_10030FC20;
    id v71 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10030FC28;
    v63[3] = &unk_10050BF18;
    id v35 = v33;
    id v64 = v35;
    v65 = &v66;
    [v34 enumerateObjectsUsingBlock:v63];
    if (v67[5])
    {
      long long v36 = +[NSDate date];
      [v36 timeIntervalSinceDate:v67[5]];
      double v38 = v37;

      id v39 = objc_alloc_init((Class)HALSchemaHALAlarmContext);
      [(ADDeviceResolutionServiceListener *)self _generalizeTimeIntervalsForPrivacy:v38];
      [v39 setTimeSinceAlarmFiredInSeconds:(unint64_t)v40];
      [v7 setAlarmContext:v39];
    }
    _Block_object_dispose(&v66, 8);
  }
  v41 = [v6 timerSnapshot];
  v42 = v41;
  if (v41)
  {
    v43 = [v41 timersByID];
    v44 = [v42 notifiedFiringTimerIDs];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = sub_10030FC10;
    v70 = sub_10030FC20;
    id v71 = 0;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10030FCF0;
    v60[3] = &unk_10050BF18;
    id v45 = v43;
    id v61 = v45;
    v62 = &v66;
    [v44 enumerateObjectsUsingBlock:v60];
    if (v67[5])
    {
      v46 = +[NSDate date];
      [v46 timeIntervalSinceDate:v67[5]];
      double v48 = v47;

      id v49 = objc_alloc_init((Class)HALSchemaHALTimerContext);
      [(ADDeviceResolutionServiceListener *)self _generalizeTimeIntervalsForPrivacy:v48];
      [v49 setTimeSinceTimerFiredInSeconds:(unint64_t)v50];
      [v7 setTimerContext:v49];
    }
    _Block_object_dispose(&v66, 8);
  }
  if ([v6 heardVoiceTrigger] == (id)2)
  {
    v51 = [v6 heardVoiceTriggerMetadata];
    v52 = +[NSDate date];
    v53 = [v51 deliveryDate];
    [v52 timeIntervalSinceDate:v53];
    double v55 = v54;

    id v56 = objc_alloc_init((Class)HALSchemaHALVoiceTriggerContext);
    [(ADDeviceResolutionServiceListener *)self _generalizeTimeIntervalsForPrivacy:v55];
    [v56 setTimeSinceVoiceTriggerHeardInSeconds:(unint64_t)v57];
    [v7 setVoiceTriggerContext:v56];
  }
  v58 = [v6 systemStateSnapshot];
  if (v58) {
    objc_msgSend(v7, "setPowerState:", -[ADDeviceResolutionServiceListener _halDevicePowerStateFromSystemStateSnapshot:](self, "_halDevicePowerStateFromSystemStateSnapshot:", v58));
  }

  return v7;
}

- (id)_crossDeviceCommandExecutionEndedEvent:(int)a3 actionResult:(int)a4 halId:(id)a5 contextProximityPairs:(id)a6 homeKitTarget:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionEnded);
  [v14 setAction:v10];
  if (v9) {
    [v14 setActionResult:v9];
  }
  [v14 setHomeKitTarget:v7];
  id v15 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v16 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionContext);
  [v16 setEnded:v14];
  [v15 setCrossDeviceCommandContext:v16];
  id v17 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  if ([v12 length]) {
    id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v12];
  }
  else {
    id v18 = objc_alloc_init((Class)NSUUID);
  }
  unsigned __int8 v19 = v18;
  id v20 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v18];
  [v17 setHalId:v20];

  [v15 setEventMetadata:v17];
  +[NSMutableArray array];
  uint64_t v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  __int16 v26 = sub_10030FFCC;
  id v27 = &unk_10050BEF0;
  double v28 = self;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v29;
  [v13 enumerateKeysAndObjectsUsingBlock:&v24];

  __int16 v22 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v21, v24, v25, v26, v27, v28);
  [v14 setSelecteds:v22];

  return v15;
}

- (id)_crossDeviceCommandExecutionFailedEvent:(int)a3 action:(int)a4 halId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionFailed);
  [v8 setReason:v6];
  [v8 setAction:v5];
  id v9 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v10 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionContext);
  [v10 setFailed:v8];
  [v9 setCrossDeviceCommandContext:v10];
  id v11 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  if ([v7 length]) {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
  }
  else {
    id v12 = objc_alloc_init((Class)NSUUID);
  }
  id v13 = v12;
  id v14 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v12];
  [v11 setHalId:v14];

  [v9 setEventMetadata:v11];
  return v9;
}

- (id)_crossDeviceCommandExecutionStartedEvent:(int)a3 halId:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v6 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionStarted);
  id v7 = objc_alloc_init((Class)HALSchemaHALCrossDeviceCommandExecutionContext);
  [v7 setStartedOrChanged:v6];
  [v5 setCrossDeviceCommandContext:v7];
  id v8 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  if ([v4 length]) {
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  }
  else {
    id v9 = objc_alloc_init((Class)NSUUID);
  }
  id v10 = v9;
  id v11 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v9];
  [v8 setHalId:v11];

  [v5 setEventMetadata:v8];
  return v5;
}

- (int)_halHomeKitTargetFromTarget:(id)a3
{
  int v3 = (char *)[a3 integerValue];
  if ((unint64_t)(v3 - 1) >= 7) {
    LODWORD(v3) = 0;
  }
  return (int)v3;
}

- (int)_halActionFromAction:(id)a3
{
  int v3 = (char *)[a3 integerValue];
  if ((unint64_t)(v3 - 1) >= 0x15) {
    LODWORD(v3) = 0;
  }
  return (int)v3;
}

- (int)_halActionResultFromActionResult:(id)a3
{
  int v3 = (char *)[a3 integerValue];
  if ((unint64_t)(v3 - 1) >= 3) {
    LODWORD(v3) = 0;
  }
  return (int)v3;
}

- (id)_resultStringFromHALAction:(int)a3 actionResult:(int)a4
{
  switch(a3)
  {
    case 0:
      id result = @"unknown";
      break;
    case 1:
      id result = @"appLaunch-Launch";
      break;
    case 2:
      id result = @"appLaunch-DeviceDisambiguation";
      break;
    case 3:
      id result = @"media-PlayContent";
      break;
    case 4:
      id result = @"media-DeviceDisambiguation";
      break;
    case 5:
      id result = @"resumeMedia";
      break;
    case 6:
      id result = @"skipContent";
      break;
    case 7:
      id result = @"skipTime";
      break;
    case 8:
      id result = @"seekTime";
      break;
    case 9:
      id result = @"setRepeatState";
      break;
    case 10:
      id result = @"setSubtitleState";
      break;
    case 11:
      id result = @"setShuffleState";
      break;
    case 12:
      id result = @"setAudioLanguage";
      break;
    case 13:
      id result = @"whatDidTheySay";
      break;
    case 14:
      id result = @"QuickStop.QuickStopCompleted-confirmation";
      break;
    case 15:
      if (a4 >= 4) {
        goto LABEL_11;
      }
      id result = off_10050BF38[a4];
      break;
    case 16:
      id result = @"SAAlarmDismiss.CommandSucceeded";
      break;
    case 17:
      id result = @"SAAlarmSnooze.CommandSucceeded";
      break;
    case 18:
      id result = @"QuickStop.QuickStopCompleted-Timer";
      break;
    case 19:
      id result = @"SATimerDismiss.CommandSucceeded";
      break;
    case 20:
      id result = @"pauseMedia";
      break;
    case 21:
      id result = @"QuickStop.announcement";
      break;
    default:
LABEL_11:
      id result = 0;
      break;
  }
  return result;
}

@end